; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921123-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.four_quarters = type { i16, i16, i16, i16 }

@b = common global i32 0, align 4
@a = common global i32 0, align 4
@x = common global %struct.four_quarters zeroinitializer, align 2

define void @f(i64 %j.coerce) nounwind uwtable {
entry:
  %sroa.store.elt2 = lshr i64 %j.coerce, 32
  %0 = trunc i64 %sroa.store.elt2 to i32
  %sroa.store.elt3 = lshr i64 %j.coerce, 48
  %1 = trunc i64 %sroa.store.elt3 to i32
  %conv = and i32 %0, 65535
  store i32 %conv, i32* @b, align 4, !tbaa !0
  store i32 %1, i32* @a, align 4, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 0, i32* @b, align 4, !tbaa !0
  store i32 38, i32* @a, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
