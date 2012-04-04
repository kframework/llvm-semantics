; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920829-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@c = global i64 2863311530, align 8
@c3 = global i64 8589934590, align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* @c, align 8, !tbaa !0
  %mul = mul nsw i64 %0, 3
  %1 = load i64* @c3, align 8, !tbaa !0
  %cmp = icmp eq i64 %mul, %1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
