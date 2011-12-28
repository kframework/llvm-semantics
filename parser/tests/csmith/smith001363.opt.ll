; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001363.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i32 -1, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp1 = volatile load i32** @g_7, align 8
  %tmp2 = load i32* %tmp1, align 4
  %neg = or i32 %tmp2, -2
  %tmp35.i = volatile load i32** @g_7, align 8
  store i32 %neg, i32* %tmp35.i, align 4
  %tmp3 = volatile load i32** @g_7, align 8
  store i32 -1, i32* %tmp3, align 4
  ret i64 -1
}

define i32 @func_2(i64 %p_3, i32 %p_4) nounwind uwtable {
entry:
  %tmp34.not = or i32 %p_4, -2
  %neg = xor i32 %tmp34.not, 1
  %tmp35 = volatile load i32** @g_7, align 8
  store i32 %neg, i32* %tmp35, align 4
  %conv37 = trunc i64 %p_3 to i32
  ret i32 %conv37
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = volatile load i32** @g_7, align 8
  %tmp2.i = load i32* %tmp1.i, align 4
  %neg.i = or i32 %tmp2.i, -2
  %tmp35.i.i = volatile load i32** @g_7, align 8
  store i32 %neg.i, i32* %tmp35.i.i, align 4
  %tmp3.i = volatile load i32** @g_7, align 8
  store i32 -1, i32* %tmp3.i, align 4
  %tmp = load i32* @g_8, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
