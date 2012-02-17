; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000517.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] zeroinitializer, align 4
@g_2 = global [2 x i32*] [i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i32 0), i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_2, i64 0, i64 1), align 8
  volatile store i32* %tmp, i32** getelementptr inbounds ([2 x i32*]* @g_2, i64 0, i64 1), align 8
  %tmp3 = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_2, i64 0, i64 1), align 8
  %tmp4 = volatile load i32* %tmp3, align 4
  %conv = sext i32 %tmp4 to i64
  ret i64 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_2, i64 0, i64 1), align 8
  volatile store i32* %tmp.i, i32** getelementptr inbounds ([2 x i32*]* @g_2, i64 0, i64 1), align 8
  %tmp3.i = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_2, i64 0, i64 1), align 8
  %tmp4.i = volatile load i32* %tmp3.i, align 4
  %tmp = volatile load i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
