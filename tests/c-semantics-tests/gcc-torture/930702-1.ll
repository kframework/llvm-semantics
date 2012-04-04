; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930702-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @fp(double %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca i32, align 4
  store double %a, double* %a.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  %0 = load double* %a.addr, align 8
  %cmp = fcmp une double %0, 3.300000e+01
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 11
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca i32 (double, i32)*, align 8
  store i32 0, i32* %retval
  store i32 (double, i32)* @fp, i32 (double, i32)** %f, align 8
  %call = call i32 @fp(double 3.300000e+01, i32 11)
  %0 = load i32 (double, i32)** %f, align 8
  %call1 = call i32 %0(double 3.300000e+01, i32 11)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @exit(i32) noreturn nounwind
