; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920922-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64* @f(i64* %p) nounwind uwtable readonly {
entry:
  %0 = load i64* %p, align 8, !tbaa !0
  %shr = lshr i64 %0, 24
  %incdec.ptr.sum = add i64 %shr, 1
  %add.ptr = getelementptr inbounds i64* %p, i64 %incdec.ptr.sum
  ret i64* %add.ptr
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
