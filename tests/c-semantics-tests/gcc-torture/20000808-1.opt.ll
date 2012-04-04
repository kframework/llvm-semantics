; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000808-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Point = type { i64, i64 }

define void @bar() nounwind uwtable readnone {
entry:
  ret void
}

define void @f(i64 %p0.coerce0, i64 %p0.coerce1, i64 %p1.coerce0, i64 %p1.coerce1, i64 %p2.coerce0, i64 %p2.coerce1, %struct.Point* nocapture byval align 8 %p3, %struct.Point* nocapture byval align 8 %p4, %struct.Point* nocapture byval align 8 %p5) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %p0.coerce0, 0
  %cmp1 = icmp eq i64 %p0.coerce1, 1
  %or.cond = and i1 %cmp, %cmp1
  %cmp4 = icmp eq i64 %p1.coerce0, -1
  %or.cond32 = and i1 %or.cond, %cmp4
  %cmp7 = icmp eq i64 %p1.coerce1, 0
  %or.cond33 = and i1 %or.cond32, %cmp7
  %cmp10 = icmp eq i64 %p2.coerce0, 1
  %or.cond34 = and i1 %or.cond33, %cmp10
  %cmp13 = icmp eq i64 %p2.coerce1, -1
  %or.cond35 = and i1 %or.cond34, %cmp13
  br i1 %or.cond35, label %lor.lhs.false14, label %if.then

lor.lhs.false14:                                  ; preds = %entry
  %p_x15 = getelementptr inbounds %struct.Point* %p3, i64 0, i32 0
  %0 = load i64* %p_x15, align 8, !tbaa !0
  %cmp16 = icmp eq i64 %0, -1
  br i1 %cmp16, label %lor.lhs.false17, label %if.then

lor.lhs.false17:                                  ; preds = %lor.lhs.false14
  %p_y18 = getelementptr inbounds %struct.Point* %p3, i64 0, i32 1
  %1 = load i64* %p_y18, align 8, !tbaa !0
  %cmp19 = icmp eq i64 %1, 1
  br i1 %cmp19, label %lor.lhs.false20, label %if.then

lor.lhs.false20:                                  ; preds = %lor.lhs.false17
  %p_x21 = getelementptr inbounds %struct.Point* %p4, i64 0, i32 0
  %2 = load i64* %p_x21, align 8, !tbaa !0
  %cmp22 = icmp eq i64 %2, 0
  br i1 %cmp22, label %lor.lhs.false23, label %if.then

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %p_y24 = getelementptr inbounds %struct.Point* %p4, i64 0, i32 1
  %3 = load i64* %p_y24, align 8, !tbaa !0
  %cmp25 = icmp eq i64 %3, -1
  br i1 %cmp25, label %lor.lhs.false26, label %if.then

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %p_x27 = getelementptr inbounds %struct.Point* %p5, i64 0, i32 0
  %4 = load i64* %p_x27, align 8, !tbaa !0
  %cmp28 = icmp eq i64 %4, 1
  br i1 %cmp28, label %lor.lhs.false29, label %if.then

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %p_y30 = getelementptr inbounds %struct.Point* %p5, i64 0, i32 1
  %5 = load i64* %p_y30, align 8, !tbaa !0
  %cmp31 = icmp eq i64 %5, 0
  br i1 %cmp31, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false29, %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false17, %lor.lhs.false14, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false29
  ret void
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
f.exit:
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
