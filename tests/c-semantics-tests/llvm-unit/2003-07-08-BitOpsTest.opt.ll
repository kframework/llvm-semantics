; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-07-08-BitOpsTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"%d %d %d %d %d\0A\00", align 1

define void @test(i32 %A, i32 %B, i32 %C, i32 %D) nounwind uwtable {
entry:
  %xor = xor i32 %B, %A
  %xor1 = xor i32 %xor, %C
  %xor2 = xor i32 %xor1, %D
  %or = or i32 %B, %A
  %or3 = or i32 %or, %C
  %or4 = or i32 %or3, %D
  %and = and i32 %B, %A
  %and5 = and i32 %and, %C
  %and6 = and i32 %and5, %D
  %neg = xor i32 %B, -1
  %and7 = and i32 %neg, %A
  %neg8 = xor i32 %D, -1
  %and9 = and i32 %neg8, %C
  %xor10 = xor i32 %and9, %and7
  %or12 = or i32 %neg, %A
  %or14 = or i32 %neg8, %C
  %xor15 = xor i32 %or14, %or12
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 %xor2, i32 %or4, i32 %and6, i32 %xor10, i32 %xor15) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 -15, i32 -1, i32 0, i32 -3, i32 12) nounwind
  ret i32 0
}
