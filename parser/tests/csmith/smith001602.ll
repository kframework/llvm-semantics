; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001602.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 3, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_5 = alloca i32, align 4
  store i32 -1984608747, i32* %l_5, align 4
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, -17
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %l_5, align 4
  %conv = sext i32 %tmp1 to i64
  store i64 %conv, i64* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp2 = load i32* @g_2, align 4
  %conv3 = sext i32 %tmp2 to i64
  %call = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv3, i64 6)
  %conv4 = trunc i64 %call to i32
  store i32 %conv4, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp5 = load i32* %l_5, align 4
  %conv6 = sext i32 %tmp5 to i64
  store i64 %conv6, i64* %retval
  br label %return

return:                                           ; preds = %for.end, %for.body
  %0 = load i64* %retval
  ret i64 %0
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %tmp, %tmp1
  ret i64 %sub
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
