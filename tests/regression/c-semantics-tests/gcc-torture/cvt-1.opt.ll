; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/cvt-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @g2(double %f) nounwind uwtable readnone {
entry:
  %conv = fptosi double %f to i64
  ret i64 %conv
}

define double @f(i64 %i) nounwind uwtable {
entry:
  %conv = sitofp i64 %i to double
  %conv.i = fptosi double %conv to i64
  %conv1.i = sitofp i64 %conv.i to double
  %conv2.i = fptosi double %conv1.i to i64
  %cmp = icmp eq i64 %conv2.i, %conv.i
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret double %conv1.i
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end6:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
