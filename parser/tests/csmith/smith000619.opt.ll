; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000619.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -9, align 4
@g_11 = global [9 x [5 x [2 x i32*]]] zeroinitializer, align 16
@g_14 = global i32 1716703450, align 4
@g_13 = global i32* @g_14, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp1 = load i32* @g_9, align 4
  store i32* @g_9, i32** getelementptr inbounds ([9 x [5 x [2 x i32*]]]* @g_11, i64 0, i64 3, i64 2, i64 1), align 8
  %conv.i = and i32 %tmp1, 255
  %tmp5 = volatile load i32** @g_13, align 8
  %tmp6 = load i32* %tmp5, align 4
  %or = or i32 %tmp6, %conv.i
  store i32 %or, i32* %tmp5, align 4
  %tmp7 = load i32* @g_14, align 4
  %conv8 = trunc i32 %tmp7 to i16
  ret i16 %conv8
}

define i32 @func_2(i32 %p_3, i32 %p_4, i8 zeroext %p_5, i32 %p_6, i32 %p_7) nounwind uwtable {
entry:
  store i32* @g_9, i32** getelementptr inbounds ([9 x [5 x [2 x i32*]]]* @g_11, i64 0, i64 3, i64 2, i64 1), align 8
  %conv = zext i8 %p_5 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = load i32* @g_9, align 4
  store i32* @g_9, i32** getelementptr inbounds ([9 x [5 x [2 x i32*]]]* @g_11, i64 0, i64 3, i64 2, i64 1), align 8
  %conv.i.i = and i32 %tmp1.i, 255
  %tmp5.i = volatile load i32** @g_13, align 8
  %tmp6.i = load i32* %tmp5.i, align 4
  %or.i = or i32 %tmp6.i, %conv.i.i
  store i32 %or.i, i32* %tmp5.i, align 4
  %tmp = load i32* @g_9, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_14, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
