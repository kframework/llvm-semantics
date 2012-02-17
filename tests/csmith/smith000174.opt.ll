; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000174.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 1171111566, align 4
@g_3 = global i32* @g_4, align 8
@g_5 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp48 = volatile load i32** @g_3, align 8
  store i32 -1, i32* %tmp48, align 4
  %tmp51 = volatile load i32** @g_3, align 8
  %tmp52 = load i32* %tmp51, align 4
  %tmp52.lobit = lshr i32 %tmp52, 31
  %tmp57 = volatile load i32** @g_5, align 8
  store i32 %tmp52.lobit, i32* %tmp57, align 4
  %tmp58 = volatile load i32** @g_3, align 8
  store i32 1053908448, i32* %tmp58, align 4
  %tmp59 = load i32* @g_4, align 4
  ret i32 %tmp59
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp48.i = volatile load i32** @g_3, align 8
  store i32 -1, i32* %tmp48.i, align 4
  %tmp51.i = volatile load i32** @g_3, align 8
  %tmp52.i = load i32* %tmp51.i, align 4
  %tmp52.lobit.i = lshr i32 %tmp52.i, 31
  %tmp57.i = volatile load i32** @g_5, align 8
  store i32 %tmp52.lobit.i, i32* %tmp57.i, align 4
  %tmp58.i = volatile load i32** @g_3, align 8
  store i32 1053908448, i32* %tmp58.i, align 4
  %tmp = load i32* @g_4, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
