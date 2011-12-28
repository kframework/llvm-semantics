; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001561.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 239365619, align 4
@g_3 = global i32* @g_4, align 8
@g_5 = global i32* @g_4, align 8
@g_19 = global i32 6, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp1 = volatile load i32** @g_3, align 8
  store i32 -568733029, i32* %tmp1, align 4
  %tmp5 = volatile load i32** @g_5, align 8
  store i32 0, i32* %tmp5, align 4
  %tmp6 = volatile load i32** @g_3, align 8
  %tmp.i = volatile load i32** @g_3, align 8
  %tmp1.i = load i32* %tmp.i, align 4
  %tmp34 = load i32* @g_19, align 4
  %and = and i32 %tmp34, %tmp1.i
  %xor38 = xor i32 %and, 7
  store i32 %xor38, i32* @g_19, align 4
  %tmp40 = volatile load i32** @g_3, align 8
  %tmp41 = load i32* %tmp40, align 4
  ret i32 %tmp41
}

define i32 @func_6(i32* nocapture %p_7, i8 signext %p_8, i32* nocapture %p_9, i16 zeroext %p_10, i32* nocapture %p_11) nounwind uwtable {
entry:
  %tmp = volatile load i32** @g_3, align 8
  %tmp1 = load i32* %tmp, align 4
  ret i32 %tmp1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = volatile load i32** @g_3, align 8
  store i32 -568733029, i32* %tmp1.i, align 4
  %tmp5.i = volatile load i32** @g_5, align 8
  store i32 0, i32* %tmp5.i, align 4
  %tmp6.i = volatile load i32** @g_3, align 8
  %tmp.i.i = volatile load i32** @g_3, align 8
  %tmp1.i.i = load i32* %tmp.i.i, align 4
  %tmp34.i = load i32* @g_19, align 4
  %and.i = and i32 %tmp34.i, %tmp1.i.i
  %xor38.i = xor i32 %and.i, 7
  store i32 %xor38.i, i32* @g_19, align 4
  %tmp40.i = volatile load i32** @g_3, align 8
  %tmp = load i32* @g_4, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_19, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
