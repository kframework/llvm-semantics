; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960301-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type <{ [2 x i8], [2 x i8] }>

@foo = common global %struct.foo zeroinitializer, align 4
@oldfoo = common global i32 0, align 4

define i32 @bar(i32 %k) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.foo* @foo to i32*), align 4
  %1 = lshr i32 %0, 12
  %bf.clear = and i32 %1, 15
  store i32 %bf.clear, i32* @oldfoo, align 4, !tbaa !0
  %bf.value = shl i32 %k, 12
  %2 = and i32 %bf.value, 61440
  %3 = and i32 %0, -61441
  %4 = or i32 %3, %2
  store i32 %4, i32* bitcast (%struct.foo* @foo to i32*), align 4
  %tobool = icmp eq i32 %k, 0
  %. = select i1 %tobool, i32 2, i32 1
  ret i32 %.
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  %0 = load i32* bitcast (%struct.foo* @foo to i32*), align 4
  %1 = lshr i32 %0, 12
  %bf.clear.i = and i32 %1, 15
  store i32 %bf.clear.i, i32* @oldfoo, align 4, !tbaa !0
  %2 = and i32 %0, -61441
  %3 = or i32 %2, 4096
  store i32 %3, i32* bitcast (%struct.foo* @foo to i32*), align 4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
