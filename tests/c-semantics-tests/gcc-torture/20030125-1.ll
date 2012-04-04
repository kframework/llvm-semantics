; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030125-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @t(float %a) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float* %a.addr, align 4
  %conv = fpext float %0 to double
  %call = call double @sin(double %conv) nounwind readnone
  %conv1 = fptrunc double %call to float
  ret float %conv1
}

define double @sin(double %a) nounwind uwtable readnone noinline {
entry:
  %retval = alloca double, align 8
  %a.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load double* %retval
  ret double %0
}

define float @q(float %a) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float* %a.addr, align 4
  %conv = fpext float %0 to double
  %call = call double @floor(double %conv)
  %conv1 = fptrunc double %call to float
  ret float %conv1
}

define double @floor(double %a) nounwind uwtable noinline {
entry:
  %retval = alloca double, align 8
  %a.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load double* %retval
  ret double %0
}

define double @q1(float %a) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float* %a.addr, align 4
  %conv = fpext float %0 to double
  %call = call double @floor(double %conv)
  ret double %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  ret i32 0
}

declare void @abort() noreturn nounwind

define float @floorf(float %a) nounwind uwtable noinline {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float* %a.addr, align 4
  ret float %0
}

define float @sinf(float %a) nounwind uwtable readnone noinline {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float* %a.addr, align 4
  ret float %0
}
