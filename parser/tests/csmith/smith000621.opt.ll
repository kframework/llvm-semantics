; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000621.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -7, align 4
@g_3 = global i32* @g_4, align 8
@g_11 = global i32* @g_4, align 8
@g_10 = constant i32** @g_11, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp1 = volatile load i32** @g_3, align 8
  store i32 9, i32* %tmp1, align 4
  %tmp3.i = volatile load i32** @g_3, align 8
  store i32 5, i32* @g_4, align 4
  %tmp4 = volatile load i32*** @g_10, align 8
  store i32* null, i32** %tmp4, align 8
  ret i16 9
}

define i32* @func_5(i64 %p_6, i32* nocapture %p_7) nounwind uwtable {
entry:
  %tmp3 = volatile load i32** @g_3, align 8
  store i32 5, i32* @g_4, align 4
  ret i32* null
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = volatile load i32** @g_3, align 8
  store i32 9, i32* %tmp1.i, align 4
  %tmp3.i.i = volatile load i32** @g_3, align 8
  store i32 5, i32* @g_4, align 4
  %tmp4.i = volatile load i32*** @g_10, align 8
  store i32* null, i32** %tmp4.i, align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 5) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
