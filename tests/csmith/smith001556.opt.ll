; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001556.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -942779432, align 4
@g_10 = constant [9 x [1 x i32*]] [[1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4]], align 16
@g_9 = global i32** getelementptr inbounds ([9 x [1 x i32*]]* @g_10, i64 0, i64 7, i64 0), align 8
@g_16 = global [3 x [8 x [1 x [3 x i32*]]]] [[8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], [8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], [8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]]], align 16
@g_15 = global i32** getelementptr inbounds ([3 x [8 x [1 x [3 x i32*]]]]* @g_16, i64 0, i64 2, i64 0, i64 0, i64 2), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  store i32 0, i32* @g_4, align 4
  %tmp28 = volatile load i32*** @g_9, align 8
  %tmp29 = volatile load i32** %tmp28, align 8
  %tmp30 = volatile load i32*** @g_15, align 8
  volatile store i32* %tmp29, i32** %tmp30, align 8
  ret i16 0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_4, align 4
  %tmp28.i = volatile load i32*** @g_9, align 8
  %tmp29.i = volatile load i32** %tmp28.i, align 8
  %tmp30.i = volatile load i32*** @g_15, align 8
  volatile store i32* %tmp29.i, i32** %tmp30.i, align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
