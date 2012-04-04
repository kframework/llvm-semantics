; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990324-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i64 %i) noreturn nounwind uwtable {
entry:
  %conv = trunc i64 %i to i32
  %sext = shl i32 %conv, 24
  %0 = icmp slt i32 %sext, 1
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @f(i64 4294967041)
  unreachable
}
