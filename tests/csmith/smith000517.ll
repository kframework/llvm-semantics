; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000517.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] zeroinitializer, align 4
@g_2 = global [2 x i32*] [i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i32 0), i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32**, align 8
  store i32** getelementptr inbounds ([2 x i32*]* @g_2, i32 0, i64 1), i32*** %l_4, align 8
  %tmp = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_2, i32 0, i64 1), align 8
  %tmp1 = load i32*** %l_4, align 8
  volatile store i32* %tmp, i32** %tmp1
  %tmp2 = load i32*** %l_4, align 8
  %tmp3 = volatile load i32** %tmp2
  %tmp4 = volatile load i32* %tmp3
  %conv = sext i32 %tmp4 to i64
  ret i64 %conv
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
  %tmp = volatile load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
