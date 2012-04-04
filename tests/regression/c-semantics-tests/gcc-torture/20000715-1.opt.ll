; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000715-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@y = common global i32 0, align 4

define void @test1() nounwind uwtable readnone {
entry:
  ret void
}

define void @test2() nounwind uwtable readnone {
entry:
  ret void
}

define void @test3() nounwind uwtable readnone {
entry:
  ret void
}

define void @test4() nounwind uwtable {
if.end8:
  store i32 3, i32* @x, align 4, !tbaa !0
  store i32 3, i32* @y, align 4, !tbaa !0
  ret void
}

define void @test5() nounwind uwtable {
if.end8:
  store i32 3, i32* @x, align 4, !tbaa !0
  store i32 3, i32* @y, align 4, !tbaa !0
  ret void
}

define void @test6() nounwind uwtable {
if.end8:
  store i32 3, i32* @x, align 4, !tbaa !0
  store i32 3, i32* @y, align 4, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 3, i32* @x, align 4, !tbaa !0
  store i32 3, i32* @y, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
