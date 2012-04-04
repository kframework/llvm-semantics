; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030125-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @t(float %a) nounwind uwtable readnone {
entry:
  ret float undef
}

define double @sin(double %a) noreturn nounwind uwtable readnone noinline {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define float @q(float %a) noreturn nounwind uwtable {
entry:
  %call = tail call double @floor(double undef)
  unreachable
}

define double @floor(double %a) noreturn nounwind uwtable noinline {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define double @q1(float %a) noreturn nounwind uwtable {
entry:
  %call = tail call double @floor(double undef)
  unreachable
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call1 = tail call float @q(float 0.000000e+00)
  unreachable
}

declare void @abort() noreturn nounwind

define float @floorf(float %a) nounwind uwtable readnone noinline {
entry:
  ret float %a
}

define float @sinf(float %a) nounwind uwtable readnone noinline {
entry:
  ret float %a
}
