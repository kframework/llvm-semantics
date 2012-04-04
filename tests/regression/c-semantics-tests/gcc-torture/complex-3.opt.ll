; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/complex-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define <2 x float> @f(float %a, float %b) nounwind uwtable readnone {
entry:
  %0 = insertelement <2 x float> undef, float %a, i32 0
  %1 = insertelement <2 x float> %0, float %b, i32 1
  ret <2 x float> %1
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
