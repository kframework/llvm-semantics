; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4
@b = global i32 -1, align 4
@c = global i32 1, align 4
@d = global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %e = alloca double, align 8
  %f = alloca double, align 8
  %g = alloca double, align 8
  store i32 0, i32* %retval
  %0 = load i32* @c, align 4
  %conv = sitofp i32 %0 to double
  store double %conv, double* %f, align 8
  %1 = load i32* @d, align 4
  %conv1 = sitofp i32 %1 to double
  store double %conv1, double* %g, align 8
  %2 = load i32* @a, align 4
  %3 = load i32* @b, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load double* %f, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load double* %g, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %4, %cond.true ], [ %5, %cond.false ]
  store double %cond, double* %e, align 8
  %6 = load double* %e, align 8
  %tobool = fcmp une double %6, 0.000000e+00
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %7 = load i32* %retval
  ret i32 %7
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
