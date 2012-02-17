; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001622.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32* null, align 8
@g_5 = global i8 114, align 1
@g_7 = global i32 -33517089, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32**, align 8
  %l_4 = alloca i32**, align 8
  %l_6 = alloca i32*, align 8
  store i32** null, i32*** %l_3, align 8
  store i32** @g_2, i32*** %l_4, align 8
  store i32* @g_7, i32** %l_6, align 8
  %tmp = volatile load i32** @g_2, align 8
  %tmp1 = load i32*** %l_4, align 8
  volatile store i32* %tmp, i32** %tmp1
  %tmp2 = load i8* @g_5, align 1
  %conv = zext i8 %tmp2 to i32
  %tmp3 = load i8* @g_5, align 1
  %conv4 = zext i8 %tmp3 to i32
  %cmp = icmp slt i32 %conv, %conv4
  %conv5 = zext i1 %cmp to i32
  %tmp6 = load i32** %l_6, align 8
  %tmp7 = load i32* %tmp6
  %xor = xor i32 %tmp7, %conv5
  store i32 %xor, i32* %tmp6
  %tmp8 = load i32** %l_6, align 8
  %tmp9 = load i32* %tmp8
  ret i32 %tmp9
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i8* @g_5, align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
