; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001653.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -3, align 4
@g_6 = global [1 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -10], [1 x i32] [i32 -10], [1 x i32] [i32 -10]]], align 4
@g_8 = global i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [3 x [1 x i32]]]* @g_6 to i8*), i64 4) to i32*), align 8
@g_7 = global i32** @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][2][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_9 = alloca i32, align 4
  %l_3 = alloca i32**, align 8
  %l_5 = alloca i32*, align 8
  %l_4 = alloca i32**, align 8
  store i32 -8, i32* %l_9, align 4
  %tmp = load i32* @g_2, align 4
  %conv = zext i32 %tmp to i64
  %cmp = icmp sle i64 6, %conv
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32** null, i32*** %l_3, align 8
  store i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), i32** %l_5, align 8
  store i32** %l_5, i32*** %l_4, align 8
  %tmp5 = load i32*** %l_4, align 8
  store i32* null, i32** %tmp5
  %tmp6 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 4
  %conv7 = trunc i32 %tmp6 to i8
  store i8 %conv7, i8* %retval
  br label %return

if.else:                                          ; preds = %entry
  %tmp8 = load i32*** @g_7, align 8
  %cmp9 = icmp ne i32** %tmp8, null
  %conv10 = zext i1 %cmp9 to i32
  %tmp11 = load i32** @g_8, align 8
  store i32 %conv10, i32* %tmp11
  %tmp12 = load i32* %l_9, align 4
  %conv13 = trunc i32 %tmp12 to i8
  store i8 %conv13, i8* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i8* %retval
  ret i8 %0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 2, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([1 x [3 x [1 x i32]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %tmp8)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
