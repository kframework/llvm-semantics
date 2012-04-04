; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921029-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@hpart = common global i64 0, align 8
@lpart = common global i64 0, align 8
@back = common global i64 0, align 8

define i64 @build(i64 %h, i64 %l) nounwind uwtable {
entry:
  %shl = shl i64 %h, 32
  store i64 %shl, i64* @hpart, align 8, !tbaa !0
  %and = and i64 %l, 4294967295
  store i64 %and, i64* @lpart, align 8, !tbaa !0
  %or = or i64 %and, %shl
  store i64 %or, i64* @back, align 8, !tbaa !0
  ret i64 %or
}

define i32 @main() noreturn nounwind uwtable {
if.end44:
  store i64 -4294967296, i64* @hpart, align 8, !tbaa !0
  store i64 4294967294, i64* @lpart, align 8, !tbaa !0
  store i64 -2, i64* @back, align 8, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
