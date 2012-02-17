; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001955.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x i32] [i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033], align 16
@g_5 = global i32* bitcast (i8* getelementptr (i8* bitcast ([7 x i32]* @g_2 to i8*), i64 16) to i32*), align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  volatile store i32 -3, i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %cmp = icmp slt i32 %tmp, -7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %tmp2 = volatile load i32** @g_5, align 8
  volatile store i32 %tmp1, i32* %tmp2
  %tmp3 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %conv = sext i32 %tmp3 to i64
  store i64 %conv, i64* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp4 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %call = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp4, i32 1)
  volatile store i32 %call, i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp5 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %conv6 = sext i32 %tmp5 to i64
  store i64 %conv6, i64* %retval
  br label %return

return:                                           ; preds = %for.end, %for.body
  %0 = load i64* %retval
  ret i64 %0
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
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
  %call = call i64 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp14)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
