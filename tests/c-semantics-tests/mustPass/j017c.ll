; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j017c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i8, align 1
  %y = alloca double, align 8
  store i32 0, i32* %retval
  store double 8.000000e+01, double* %y, align 8
  %0 = load double* %y, align 8
  %conv = fptoui double %0 to i8
  store i8 %conv, i8* %x, align 1
  ret i32 0
}
