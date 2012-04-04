; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041210-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [4 x i32] [i32 -1073741824, i32 2147483647, i32 2, i32 4], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* bitcast ([4 x i32]* @x to i64*), align 16
  %1 = trunc i64 %0 to i32
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %4 = load i64* bitcast (i32* getelementptr inbounds ([4 x i32]* @x, i64 0, i64 2) to i64*), align 8
  %5 = lshr i64 %4, 32
  %and4 = and i64 %5, %4
  %and = trunc i64 %and4 to i32
  %cmp1 = icmp slt i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.then, %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
