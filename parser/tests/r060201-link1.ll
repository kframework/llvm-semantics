; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/r060201-link1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @first() nounwind uwtable {
entry:
  ret void
}

define float @second() nounwind uwtable {
entry:
  %n = alloca float, align 4
  %call = call float @func()
  store float %call, float* %n, align 4
  %tmp = load float* %n, align 4
  ret float %tmp
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %myn = alloca float, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call float @second()
  store float %call, float* %myn, align 4
  %tmp = load float* %myn, align 4
  %conv = fptosi float %tmp to i32
  store i32 %conv, i32* %x, align 4
  %tmp1 = load i32* %x, align 4
  ret i32 %tmp1
}

define internal float @func() nounwind uwtable {
entry:
  ret float 5.000000e+00
}
