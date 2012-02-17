; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001848.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [3 x i32] zeroinitializer, align 4
@g_3 = constant [5 x i32*] [i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i32 0), i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i32 0), i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i32 0), i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i32 0), i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32, align 4
  store i32 802430549, i32* %l_2, align 4
  store i32* null, i32** %l_5, align 8
  store i32 1549983881, i32* %l_6, align 4
  %tmp = load i32* %l_2, align 4
  %tmp1 = load i32* %l_6, align 4
  %or = or i32 %tmp1, %tmp
  store i32 %or, i32* %l_6, align 4
  %tmp2 = load i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i64 0), align 4
  ret i32 %tmp2
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
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([3 x i32]* @g_4, i32 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp6)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
