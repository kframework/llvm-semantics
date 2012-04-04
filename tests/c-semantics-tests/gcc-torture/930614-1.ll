; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930614-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(double* %ty) nounwind uwtable {
entry:
  %ty.addr = alloca double*, align 8
  store double* %ty, double** %ty.addr, align 8
  %0 = load double** %ty.addr, align 8
  store double -1.000000e+00, double* %0, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %foo = alloca [6 x double], align 16
  %tx = alloca double, align 8
  %ty = alloca double, align 8
  %d = alloca double, align 8
  store i32 0, i32* %retval
  store double 0.000000e+00, double* %tx, align 8
  call void @f(double* %ty)
  %0 = load double* %ty, align 8
  %cmp = fcmp olt double %0, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load double* %ty, align 8
  %sub = fsub double -0.000000e+00, %1
  store double %sub, double* %ty, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load double* %tx, align 8
  %3 = load double* %ty, align 8
  %cmp1 = fcmp ogt double %2, %3
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load double* %tx, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %5 = load double* %ty, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %4, %cond.true ], [ %5, %cond.false ]
  store double %cond, double* %d, align 8
  %6 = load double* %ty, align 8
  %7 = load double* %d, align 8
  %cmp2 = fcmp une double %6, %7
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %cond.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
