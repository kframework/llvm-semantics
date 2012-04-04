; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20187-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 257, align 4
@b = global i32 256, align 4

define i32 @test() nounwind uwtable readonly {
entry:
  %0 = load i32* @a, align 4, !tbaa !0
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i32 %0, i32 1
  %1 = load i32* @b, align 4, !tbaa !0
  %mul = mul nsw i32 %1, %0
  %and = and i32 %mul, 255
  %conv2 = and i32 %and, %cond
  %not.tobool3 = icmp eq i32 %conv2, 0
  %cond4 = zext i1 %not.tobool3 to i32
  ret i32 %cond4
}

define i32 @main() nounwind uwtable readonly {
entry:
  %0 = load i32* @a, align 4, !tbaa !0
  %tobool.i = icmp ne i32 %0, 0
  %1 = load i32* @b, align 4, !tbaa !0
  %mul.i = mul nsw i32 %1, %0
  %.op = and i32 %0, 255
  %and.i = select i1 %tobool.i, i32 %.op, i32 1
  %conv2.i = and i32 %and.i, %mul.i
  %not.not.tobool3.i = icmp ne i32 %conv2.i, 0
  %sub = zext i1 %not.not.tobool3.i to i32
  ret i32 %sub
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
