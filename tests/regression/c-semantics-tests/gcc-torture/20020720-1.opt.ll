; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020720-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(double %x) nounwind uwtable {
entry:
  %call = tail call double @fabs(double %x) nounwind readnone
  %cmp = fcmp olt double %call, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @link_error() nounwind
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare double @fabs(double) nounwind readnone

declare void @link_error()

define i32 @main() nounwind uwtable {
entry:
  ret i32 0
}
