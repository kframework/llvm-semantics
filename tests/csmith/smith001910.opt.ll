; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001910.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 432383572, align 4
@g_5 = global i32 -8, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp1 = load i32* @g_3, align 4
  %and = and i32 %tmp1, 1
  %xor = xor i32 %and, 1
  store i32 %xor, i32* @g_3, align 4
  %tmp14 = volatile load i32** @g_4, align 8
  store i32 0, i32* %tmp14, align 4
  %tmp17 = load i32* @g_3, align 4
  %conv18 = trunc i32 %tmp17 to i16
  ret i16 %conv18
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = load i32* @g_3, align 4
  %and.i = and i32 %tmp1.i, 1
  %xor.i = xor i32 %and.i, 1
  store i32 %xor.i, i32* @g_3, align 4
  %tmp14.i = volatile load i32** @g_4, align 8
  store i32 0, i32* %tmp14.i, align 4
  %tmp17.i = load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp17.i) nounwind
  %tmp2 = load i32* @g_5, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
