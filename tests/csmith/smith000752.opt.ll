; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000752.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i8 54, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i8* @g_2, align 1
  %tmp5 = volatile load i8* @g_2, align 1
  %conv6 = zext i8 %tmp5 to i32
  ret i32 %conv6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i8* @g_2, align 1
  %tmp5.i = volatile load i8* @g_2, align 1
  %tmp = volatile load i8* @g_2, align 1
  %conv = zext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
