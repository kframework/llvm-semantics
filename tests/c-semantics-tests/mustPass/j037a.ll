; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j037a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %x = alloca float, align 4
  %p = alloca float*, align 8
  store float 5.000000e+00, float* %x, align 4
  store float* %x, float** %p, align 8
  %0 = load float** %p, align 8
  %1 = load float* %0, align 4
  ret i32 0
}
