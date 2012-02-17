; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001058.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 5, align 4
@g_12 = global i32* @g_9, align 8
@g_11 = global i32** @g_12, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_10 = alloca i32, align 4
  store i32 1997174728, i32* %l_10, align 4
  %tmp = load i32* @g_9, align 4
  %conv = trunc i32 %tmp to i8
  %tmp1 = load i32* %l_10, align 4
  %conv2 = trunc i32 %tmp1 to i16
  %tmp3 = load i32* @g_9, align 4
  %conv4 = sext i32 %tmp3 to i64
  %call = call i32* @func_2(i8 signext %conv, i32* @g_9, i8 signext 21, i16 zeroext %conv2, i64 %conv4)
  %tmp5 = volatile load i32*** @g_11, align 8
  store i32* %call, i32** %tmp5
  %tmp6 = volatile load i32*** @g_11, align 8
  %tmp7 = load i32** %tmp6
  %tmp8 = load i32* %tmp7
  ret i32 %tmp8
}

define i32* @func_2(i8 signext %p_3, i32* %p_4, i8 signext %p_5, i16 zeroext %p_6, i64 %p_7) nounwind uwtable {
entry:
  %p_3.addr = alloca i8, align 1
  %p_4.addr = alloca i32*, align 8
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i16, align 2
  %p_7.addr = alloca i64, align 8
  %l_8 = alloca i32*, align 8
  store i8 %p_3, i8* %p_3.addr, align 1
  store i32* %p_4, i32** %p_4.addr, align 8
  store i8 %p_5, i8* %p_5.addr, align 1
  store i16 %p_6, i16* %p_6.addr, align 2
  store i64 %p_7, i64* %p_7.addr, align 8
  store i32* @g_9, i32** %l_8, align 8
  %tmp = load i32** %l_8, align 8
  ret i32* %tmp
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
  %tmp = load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
