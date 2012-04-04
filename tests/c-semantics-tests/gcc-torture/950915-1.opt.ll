; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950915-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i64 100000, align 8
@b = global i64 21475, align 8

define i64 @f() nounwind uwtable readonly {
entry:
  %0 = load i64* @a, align 8, !tbaa !0
  %1 = load i64* @b, align 8, !tbaa !0
  %mul = mul nsw i64 %1, %0
  %shr = ashr i64 %mul, 16
  ret i64 %shr
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* @a, align 8, !tbaa !0
  %1 = load i64* @b, align 8, !tbaa !0
  %mul.i = mul nsw i64 %1, %0
  %cmp = icmp slt i64 %mul.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
