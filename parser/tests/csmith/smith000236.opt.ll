; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000236.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 -6, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp4 = volatile load i32** @g_4, align 8
  %tmp5 = load i32* %tmp4, align 4
  %xor = xor i32 %tmp5, 1
  store i32 %xor, i32* %tmp4, align 4
  %tmp6 = load i32* @g_5, align 4
  %conv7 = trunc i32 %tmp6 to i8
  ret i8 %conv7
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp4.i = volatile load i32** @g_4, align 8
  %tmp5.i = load i32* %tmp4.i, align 4
  %xor.i = xor i32 %tmp5.i, 1
  store i32 %xor.i, i32* %tmp4.i, align 4
  %tmp6.i = load i32* @g_5, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp6.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
