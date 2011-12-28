; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000869.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [5 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i16, align 2
  store i16 20955, i16* %l_5, align 2
  volatile store i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %cmp = icmp sge i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 3), align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %conv = sext i32 %tmp2 to i64
  %call = call i64 @safe_add_func_uint64_t_u_u(i64 %conv, i64 5)
  %conv3 = trunc i64 %call to i32
  volatile store i32 %conv3, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %tmp4 = load i16* %l_5, align 2
  ret i16 %tmp4
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp10)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
