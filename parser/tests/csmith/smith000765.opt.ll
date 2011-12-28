; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000765.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1, align 4
@g_13 = global i8 118, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  store i32 -6, i32* @g_4, align 4
  %tmp25 = load i8* @g_13, align 1
  %and27 = and i8 %tmp25, 1
  store i8 %and27, i8* @g_13, align 1
  ret i32 -6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 -6, i32* @g_4, align 4
  %tmp25.i = load i8* @g_13, align 1
  %and27.i = and i8 %tmp25.i, 1
  store i8 %and27.i, i8* @g_13, align 1
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 -6) nounwind
  %tmp2 = load i8* @g_13, align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
