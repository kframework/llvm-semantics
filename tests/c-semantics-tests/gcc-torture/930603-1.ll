; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @fx(double) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  %x = fptrunc double %0 to float
  store float %x, float* %x.addr, align 4
  %1 = load float* %x.addr, align 4
  %conv = fpext float %1 to double
  %mul = fmul double 0x40026BB1BBB58975, %conv
  %div = fdiv double 3.000000e+00, %mul
  %add = fadd double 1.000000e+00, %div
  %conv1 = fptrunc double %add to float
  ret float %conv1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca float, align 4
  %b = alloca float, align 4
  %c = alloca float, align 4
  store i32 0, i32* %retval
  %call = call float @inita()
  store float %call, float* %a, align 4
  %call1 = call float @initc()
  store float %call1, float* %c, align 4
  call void @f()
  %0 = load float* %c, align 4
  %conv = fpext float %0 to double
  %call2 = call float @fx(double %conv)
  %1 = load float* %a, align 4
  %add = fadd float %call2, %1
  store float %add, float* %b, align 4
  call void @f()
  %2 = load float* %a, align 4
  %conv3 = fpext float %2 to double
  %cmp = fcmp une double %conv3, 3.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load float* %b, align 4
  %conv5 = fpext float %3 to double
  %cmp6 = fcmp olt double %conv5, 4.325700e+00
  br i1 %cmp6, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %4 = load float* %b, align 4
  %conv9 = fpext float %4 to double
  %cmp10 = fcmp ogt double %conv9, 4.325800e+00
  br i1 %cmp10, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false8
  %5 = load float* %c, align 4
  %conv13 = fpext float %5 to double
  %cmp14 = fcmp une double %conv13, 4.000000e+00
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false8, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false12
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define float @inita() nounwind uwtable {
entry:
  ret float 3.000000e+00
}

define float @initc() nounwind uwtable {
entry:
  ret float 4.000000e+00
}

define void @f() nounwind uwtable {
entry:
  ret void
}
