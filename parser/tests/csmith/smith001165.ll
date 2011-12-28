; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001165.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [5 x i32] [i32 1053446019, i32 1053446019, i32 1053446019, i32 1053446019, i32 1053446019], align 16
@g_2 = global i32* bitcast (i8* getelementptr (i8* bitcast ([5 x i32]* @g_3 to i8*), i64 8) to i32*), align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_3[4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32*, align 8
  %l_5 = alloca i32, align 4
  store i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 0), i32** %l_4, align 8
  store i32 -9, i32* %l_5, align 4
  %tmp = load i32** @g_2, align 8
  store i32* %tmp, i32** %l_4, align 8
  %tmp1 = load i32** %l_4, align 8
  %tmp2 = volatile load i32* %tmp1
  %neg = xor i32 %tmp2, -1
  %tmp3 = load i32* %l_5, align 4
  %and = and i32 %tmp3, %neg
  store i32 %and, i32* %l_5, align 4
  %tmp4 = load i32** %l_4, align 8
  %tmp5 = volatile load i32* %tmp4
  %conv = trunc i32 %tmp5 to i8
  ret i8 %conv
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
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_3, i32 0, i64 2), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp10)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
