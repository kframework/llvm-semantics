; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000896.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1381746242, align 4
@g_2 = global i32* @g_3, align 8
@g_5 = global [5 x [6 x [3 x i32**]]] [[6 x [3 x i32**]] [[3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2]], [6 x [3 x i32**]] [[3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2]], [6 x [3 x i32**]] [[3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2]], [6 x [3 x i32**]] [[3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2]], [6 x [3 x i32**]] [[3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2], [3 x i32**] [i32** @g_2, i32** @g_2, i32** @g_2]]], align 16
@g_7 = global i32** @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** @g_2, align 8
  %tmp1 = volatile load i32*** @g_7, align 8
  volatile store i32* %tmp, i32** %tmp1, align 8
  %tmp2 = volatile load i32* @g_3, align 4
  %conv = trunc i32 %tmp2 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** @g_2, align 8
  %tmp1.i = volatile load i32*** @g_7, align 8
  volatile store i32* %tmp.i, i32** %tmp1.i, align 8
  %tmp2.i = volatile load i32* @g_3, align 4
  %tmp = volatile load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
