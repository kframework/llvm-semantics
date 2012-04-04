; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/float-floor.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@d = global double 0x408FFFFFF0000000, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %df = alloca double, align 8
  %f1 = alloca float, align 4
  store i32 0, i32* %retval
  %0 = load double* @d, align 8
  %call = call double @floor(double %0)
  store double %call, double* %df, align 8
  %1 = load double* @d, align 8
  %call1 = call double @floor(double %1)
  %conv = fptrunc double %call1 to float
  store float %conv, float* %f1, align 4
  %2 = load double* %df, align 8
  %conv2 = fptosi double %2 to i32
  %cmp = icmp ne i32 %conv2, 1023
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load float* %f1, align 4
  %conv4 = fptosi float %3 to i32
  %cmp5 = icmp ne i32 %conv4, 1023
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare double @floor(double)

declare void @abort() noreturn nounwind
