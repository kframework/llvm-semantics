; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001419.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -4, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i16, align 2
  store i16 23474, i16* %l_2, align 2
  %tmp = load i16* %l_2, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = volatile load i32** @g_3, align 8
  %tmp2 = load i32* %tmp1
  %xor = xor i32 %tmp2, %conv
  store i32 %xor, i32* %tmp1
  %tmp3 = load i16* %l_2, align 2
  %conv4 = trunc i16 %tmp3 to i8
  ret i8 %conv4
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
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
