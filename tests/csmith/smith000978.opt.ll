; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000978.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i32* null, align 8
@g_8 = global i32** @g_7, align 8
@g_10 = global i32 0, align 4
@g_9 = global i32* @g_10, align 8
@g_12 = global i32** @g_9, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp.i = load i32** @g_7, align 8
  %tmp1.i = volatile load i32*** @g_8, align 8
  store i32* %tmp.i, i32** %tmp1.i, align 8
  %tmp2.i = volatile load i32*** @g_8, align 8
  %tmp3.i = load i32** %tmp2.i, align 8
  %tmp4.i = volatile load i32*** @g_8, align 8
  store i32* %tmp3.i, i32** %tmp4.i, align 8
  %tmp5.i = load i32** @g_9, align 8
  %tmp6 = volatile load i32*** @g_12, align 8
  store i32* %tmp5.i, i32** %tmp6, align 8
  %tmp10 = load i32** @g_9, align 8
  %tmp11 = load i32* %tmp10, align 4
  %and = and i32 %tmp11, 10934
  store i32 %and, i32* %tmp10, align 4
  ret i16 10934
}

define i32* @func_2(i64 %p_3, i8 zeroext %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
entry:
  %tmp = load i32** @g_7, align 8
  %tmp1 = volatile load i32*** @g_8, align 8
  store i32* %tmp, i32** %tmp1, align 8
  %tmp2 = volatile load i32*** @g_8, align 8
  %tmp3 = load i32** %tmp2, align 8
  %tmp4 = volatile load i32*** @g_8, align 8
  store i32* %tmp3, i32** %tmp4, align 8
  %tmp5 = load i32** @g_9, align 8
  ret i32* %tmp5
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i.i = load i32** @g_7, align 8
  %tmp1.i.i = volatile load i32*** @g_8, align 8
  store i32* %tmp.i.i, i32** %tmp1.i.i, align 8
  %tmp2.i.i = volatile load i32*** @g_8, align 8
  %tmp3.i.i = load i32** %tmp2.i.i, align 8
  %tmp4.i.i = volatile load i32*** @g_8, align 8
  store i32* %tmp3.i.i, i32** %tmp4.i.i, align 8
  %tmp5.i.i = load i32** @g_9, align 8
  %tmp6.i = volatile load i32*** @g_12, align 8
  store i32* %tmp5.i.i, i32** %tmp6.i, align 8
  %tmp10.i = load i32** @g_9, align 8
  %tmp11.i = load i32* %tmp10.i, align 4
  %and.i = and i32 %tmp11.i, 10934
  store i32 %and.i, i32* %tmp10.i, align 4
  %tmp = load i32* @g_10, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
