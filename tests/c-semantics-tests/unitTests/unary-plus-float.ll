; ModuleID = '/home/david/src/c-semantics/tests/unitTests/unary-plus-float.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  %z = alloca double, align 8
  store i32 0, i32* %retval
  store float 0x40091EB860000000, float* %x, align 4
  store float 0xC001604180000000, float* %y, align 4
  store double 0x40336B851EB851EB, double* %z, align 8
  %0 = load float* %x, align 4
  %1 = load float* %y, align 4
  %add = fadd float %0, %1
  %conv = fpext float %add to double
  %2 = load double* %z, align 8
  %add1 = fadd double %conv, %2
  %conv2 = fptosi double %add1 to i32
  ret i32 %conv2
}
