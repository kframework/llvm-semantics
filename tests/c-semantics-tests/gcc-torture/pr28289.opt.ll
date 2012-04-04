; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28289.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@one = global i32 1, align 4

define void @ix86_split_ashr(i32 %mode) nounwind uwtable {
entry:
  %cmp = icmp ne i32 %mode, 0
  %cond = select i1 %cmp, i32 (i32)* @ok, i32 (i32)* @gen_x86_64_shrd
  %call = tail call i32 %cond(i32 0) nounwind
  ret void
}

define i32 @ok(i32 %i) noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 %i) noreturn nounwind
  unreachable
}

define internal i32 @gen_x86_64_shrd(i32 %a) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load volatile i32* @one, align 4, !tbaa !0
  %cmp.i = icmp ne i32 %0, 0
  %cond.i = select i1 %cmp.i, i32 (i32)* @ok, i32 (i32)* @gen_x86_64_shrd
  %call.i = tail call i32 %cond.i(i32 0) nounwind
  ret i32 1
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
