; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32** nocapture %p, i32* nocapture %q) nounwind uwtable {
entry:
  %0 = load i32* %q, align 4, !tbaa !0
  %1 = load i32** %p, align 8, !tbaa !3
  %incdec.ptr2 = getelementptr inbounds i32* %1, i64 1
  store i32* %incdec.ptr2, i32** %p, align 8, !tbaa !3
  store i32 %0, i32* %1, align 4, !tbaa !0
  ret void
}

define void @bar(i32** nocapture %p, i32* nocapture %q) nounwind uwtable {
entry:
  %0 = load i32* %q, align 4, !tbaa !0
  %1 = load i32** %p, align 8, !tbaa !3
  store i32 %0, i32* %1, align 4, !tbaa !0
  %incdec.ptr2 = getelementptr inbounds i32* %1, i64 1
  store i32* %incdec.ptr2, i32** %p, align 8, !tbaa !3
  ret void
}

define void @baz(i32** nocapture %p, i32* nocapture %q) nounwind uwtable {
entry:
  %0 = load i32* %q, align 4, !tbaa !0
  %1 = load i32** %p, align 8, !tbaa !3
  store i32 %0, i32* %1, align 4, !tbaa !0
  %incdec.ptr2 = getelementptr inbounds i32* %1, i64 1
  store i32* %incdec.ptr2, i32** %p, align 8, !tbaa !3
  ret void
}

define i32 @main() nounwind uwtable {
lor.lhs.false2:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
