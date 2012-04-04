; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-03-NotTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"Bitwise Not: %d %d %d %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Boolean Not: %d %d %d %d %d %d\0A\00", align 1

define void @testBitWiseNot(i32 %A, i32 %B, i32 %C, i32 %D) nounwind uwtable {
entry:
  %neg = xor i32 %A, -1
  %neg1 = xor i32 %B, -1
  %neg2 = xor i32 %C, -1
  %neg3 = xor i32 %D, -1
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32 %neg, i32 %neg1, i32 %neg2, i32 %neg3) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define void @testBooleanNot(i32 %A, i32 %B, i32 %C, i32 %D) nounwind uwtable {
entry:
  %phitmp = icmp slt i32 %B, 1
  %not.cmp = icmp slt i32 %A, 1
  %phitmp. = or i1 %phitmp, %not.cmp
  %lnot.ext = zext i1 %phitmp. to i32
  %phitmp32 = icmp slt i32 %C, 1
  %0 = or i1 %phitmp32, %not.cmp
  %lnot.ext7 = zext i1 %0 to i32
  %phitmp33 = icmp slt i32 %D, 1
  %phitmp33. = or i1 %phitmp33, %not.cmp
  %lnot.ext13 = zext i1 %phitmp33. to i32
  %not.cmp14 = icmp slt i32 %B, 1
  %1 = or i1 %phitmp32, %not.cmp14
  %lnot.ext19 = zext i1 %1 to i32
  %phitmp35. = or i1 %phitmp33, %not.cmp14
  %lnot.ext25 = zext i1 %phitmp35. to i32
  %2 = or i1 %phitmp33, %phitmp32
  %lnot.ext31 = zext i1 %2 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %lnot.ext, i32 %lnot.ext7, i32 %lnot.ext13, i32 %lnot.ext19, i32 %lnot.ext25, i32 %lnot.ext31) nounwind
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32 -2, i32 -3, i32 2, i32 -6) nounwind
  %call.i1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 0, i32 1, i32 0, i32 1, i32 0, i32 1) nounwind
  ret i32 0
}
