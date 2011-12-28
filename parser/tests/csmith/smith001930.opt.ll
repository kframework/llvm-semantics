; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001930.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 994974262, align 4
@g_4 = global i32 1681711000, align 4
@g_3 = global [9 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], align 16
@g_5 = constant i32* @g_4, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %tmp = load i32* @g_2, align 4
  %tmp1 = volatile load i32** @g_5, align 8
  store i32 %tmp, i32* %tmp1, align 4
  %tmp2 = load i32* @g_4, align 4
  %conv = trunc i32 %tmp2 to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = load i32* @g_2, align 4
  %tmp1.i = volatile load i32** @g_5, align 8
  store i32 %tmp.i, i32* %tmp1.i, align 4
  %tmp = load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
