; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001537.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_2 = global [6 x [2 x i32*]] [[2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3]], align 16
@g_4 = global [1 x [7 x i32**]] [[7 x i32**] [i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**)]], align 16
@g_7 = global i32 1260925030, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i32**, align 8
  %l_6 = alloca i32*, align 8
  store i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i32 0, i64 1, i64 0), i32*** %l_5, align 8
  store i32* @g_7, i32** %l_6, align 8
  %tmp = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i32 0, i64 1, i64 1), align 8
  %tmp1 = load i32*** %l_5, align 8
  volatile store i32* %tmp, i32** %tmp1
  %tmp2 = load i32*** %l_5, align 8
  %tmp3 = volatile load i32** %tmp2
  %tmp4 = volatile load i32* %tmp3
  %tmp5 = load i32** %l_6, align 8
  %tmp6 = load i32* %tmp5
  %and = and i32 %tmp6, %tmp4
  store i32 %and, i32* %tmp5
  %tmp7 = load i32*** %l_5, align 8
  %tmp8 = volatile load i32** %tmp7
  %tmp9 = volatile load i32* %tmp8
  %conv = trunc i32 %tmp9 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
