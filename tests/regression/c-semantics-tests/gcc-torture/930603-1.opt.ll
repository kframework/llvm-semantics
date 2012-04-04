; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @fx(double) nounwind uwtable readnone {
entry:
  %x = fptrunc double %0 to float
  %conv = fpext float %x to double
  %mul = fmul double %conv, 0x40026BB1BBB58975
  %div = fdiv double 3.000000e+00, %mul
  %add = fadd double %div, 1.000000e+00
  %conv1 = fptrunc double %add to float
  ret float %conv1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

define float @inita() nounwind uwtable readnone {
entry:
  ret float 3.000000e+00
}

define float @initc() nounwind uwtable readnone {
entry:
  ret float 4.000000e+00
}

define void @f() nounwind uwtable readnone {
entry:
  ret void
}
