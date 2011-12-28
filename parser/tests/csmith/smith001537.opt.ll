; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001537.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_2 = global [6 x [2 x i32*]] [[2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3], [2 x i32*] [i32* @g_3, i32* @g_3]], align 16
@g_4 = global [1 x [7 x i32**]] [[7 x i32**] [i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**), i32** bitcast (i8* getelementptr (i8* bitcast ([6 x [2 x i32*]]* @g_2 to i8*), i64 24) to i32**)]], align 16
@g_7 = global i32 1260925030, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 1), align 8
  volatile store i32* %tmp, i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 0), align 16
  %tmp3 = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 0), align 16
  %tmp4 = volatile load i32* %tmp3, align 4
  %tmp6 = load i32* @g_7, align 4
  %and = and i32 %tmp6, %tmp4
  store i32 %and, i32* @g_7, align 4
  %tmp8 = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 0), align 16
  %tmp9 = volatile load i32* %tmp8, align 4
  %conv = trunc i32 %tmp9 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 1), align 8
  volatile store i32* %tmp.i, i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 0), align 16
  %tmp3.i = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 0), align 16
  %tmp4.i = volatile load i32* %tmp3.i, align 4
  %tmp6.i = load i32* @g_7, align 4
  %and.i = and i32 %tmp6.i, %tmp4.i
  store i32 %and.i, i32* @g_7, align 4
  %tmp8.i = volatile load i32** getelementptr inbounds ([6 x [2 x i32*]]* @g_2, i64 0, i64 1, i64 0), align 16
  %tmp9.i = volatile load i32* %tmp8.i, align 4
  %tmp = volatile load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_7, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
