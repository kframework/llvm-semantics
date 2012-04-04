; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990127-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @fpEq(double %x, double %y) nounwind uwtable {
entry:
  %cmp = fcmp une double %x, %y
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @fpTest(double %x, double %y) nounwind uwtable {
entry:
  %mul = fmul double %x, 1.000000e+02
  %div = fdiv double %mul, %y
  %cmp.i = fcmp une double %div, 0x4053D55555555556
  br i1 %cmp.i, label %if.then.i, label %fpEq.exit

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

fpEq.exit:                                        ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
