; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001381.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 9, align 4
@g_3 = global [2 x [2 x [3 x i32*]]] [[2 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [2 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp2 = load i32* @g_4, align 4
  %xor = xor i32 %tmp2, 26695
  store i32 %xor, i32* @g_4, align 4
  %conv8 = trunc i32 %xor to i16
  ret i16 %conv8
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp2.i = load i32* @g_4, align 4
  %xor.i = xor i32 %tmp2.i, 26695
  store i32 %xor.i, i32* @g_4, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %xor.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
