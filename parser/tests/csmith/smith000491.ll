; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000491.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 398334073, align 4
@g_7 = global i32 1, align 4
@g_8 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  volatile store i32 19, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 -1, i32* %l_5, align 4
  store i32* @g_7, i32** %l_6, align 8
  %tmp3 = load i32* %l_5, align 4
  %tmp4 = load i32** %l_6, align 8
  %tmp5 = load i32* %tmp4
  %and = and i32 %tmp5, %tmp3
  store i32 %and, i32* %tmp4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp6 = volatile load i32* @g_2, align 4
  %call = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp6, i32 9)
  volatile store i32 %call, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp7 = volatile load i32* @g_2, align 4
  %tmp8 = volatile load i32** @g_8, align 8
  volatile store i32 %tmp7, i32* %tmp8
  %tmp9 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp9 to i8
  ret i8 %conv
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
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
