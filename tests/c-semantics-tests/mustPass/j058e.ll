; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j058e.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global double 0.000000e+00, align 8
@p0 = global double* @x, align 8
@p = global double* @x, align 8
@y = common global double 0.000000e+00, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load double** @p, align 8
  %1 = load double* %0, align 8
  %conv = fptosi double %1 to i32
  ret i32 %conv
}
