; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.b = type { %struct.a, %struct.a }
%struct.a = type { i64, i64 }

define i32 @bar(i32 %x, %struct.b* noalias nocapture %y, %struct.b* noalias nocapture %z) nounwind uwtable {
entry:
  %v = getelementptr inbounds %struct.b* %y, i64 0, i32 0, i32 0
  %0 = load i64* %v, align 8, !tbaa !0
  %tobool = icmp eq i64 %0, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %w = getelementptr inbounds %struct.b* %y, i64 0, i32 0, i32 1
  %1 = load i64* %w, align 8, !tbaa !0
  %cmp = icmp eq i64 %1, 250000
  br i1 %cmp, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %v3 = getelementptr inbounds %struct.b* %y, i64 0, i32 1, i32 0
  %2 = load i64* %v3, align 8, !tbaa !0
  %tobool4 = icmp eq i64 %2, 0
  br i1 %tobool4, label %lor.lhs.false5, label %if.then

lor.lhs.false5:                                   ; preds = %lor.lhs.false2
  %w7 = getelementptr inbounds %struct.b* %y, i64 0, i32 1, i32 1
  %3 = load i64* %w7, align 8, !tbaa !0
  %cmp8 = icmp eq i64 %3, 250000
  br i1 %cmp8, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false2, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
bar.exit:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
