; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030313-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i64, i64, i64, i64 }

@x = global %struct.A { i64 13, i64 14, i64 15, i64 16 }, align 8

define void @foo(i64* nocapture %x, i32 %y) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %y, 12
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %0 = load i64* %x, align 8, !tbaa !0
  %cmp1 = icmp eq i64 %0, 1
  br i1 %cmp1, label %lor.lhs.false, label %if.then4

lor.lhs.false:                                    ; preds = %if.end
  %arrayidx2 = getelementptr inbounds i64* %x, i64 1
  %1 = load i64* %arrayidx2, align 8, !tbaa !0
  %cmp3 = icmp eq i64 %1, 11
  br i1 %cmp3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %lor.lhs.false
  %arrayidx6 = getelementptr inbounds i64* %x, i64 2
  %2 = load i64* %arrayidx6, align 8, !tbaa !0
  %cmp7 = icmp eq i64 %2, 2
  br i1 %cmp7, label %lor.lhs.false8, label %if.then11

lor.lhs.false8:                                   ; preds = %if.end5
  %arrayidx9 = getelementptr inbounds i64* %x, i64 3
  %3 = load i64* %arrayidx9, align 8, !tbaa !0
  %cmp10 = icmp eq i64 %3, 12
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %lor.lhs.false8, %if.end5
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %lor.lhs.false8
  %arrayidx13 = getelementptr inbounds i64* %x, i64 4
  %4 = load i64* %arrayidx13, align 8, !tbaa !0
  %cmp14 = icmp eq i64 %4, 3
  br i1 %cmp14, label %lor.lhs.false15, label %if.then18

lor.lhs.false15:                                  ; preds = %if.end12
  %arrayidx16 = getelementptr inbounds i64* %x, i64 5
  %5 = load i64* %arrayidx16, align 8, !tbaa !0
  %cmp17 = icmp eq i64 %5, 13
  br i1 %cmp17, label %if.end19, label %if.then18

if.then18:                                        ; preds = %lor.lhs.false15, %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %lor.lhs.false15
  %arrayidx20 = getelementptr inbounds i64* %x, i64 6
  %6 = load i64* %arrayidx20, align 8, !tbaa !0
  %cmp21 = icmp eq i64 %6, 4
  br i1 %cmp21, label %lor.lhs.false22, label %if.then25

lor.lhs.false22:                                  ; preds = %if.end19
  %arrayidx23 = getelementptr inbounds i64* %x, i64 7
  %7 = load i64* %arrayidx23, align 8, !tbaa !0
  %cmp24 = icmp eq i64 %7, 14
  br i1 %cmp24, label %if.end26, label %if.then25

if.then25:                                        ; preds = %lor.lhs.false22, %if.end19
  tail call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %lor.lhs.false22
  %arrayidx27 = getelementptr inbounds i64* %x, i64 8
  %8 = load i64* %arrayidx27, align 8, !tbaa !0
  %cmp28 = icmp eq i64 %8, 5
  br i1 %cmp28, label %lor.lhs.false29, label %if.then32

lor.lhs.false29:                                  ; preds = %if.end26
  %arrayidx30 = getelementptr inbounds i64* %x, i64 9
  %9 = load i64* %arrayidx30, align 8, !tbaa !0
  %cmp31 = icmp eq i64 %9, 15
  br i1 %cmp31, label %if.end33, label %if.then32

if.then32:                                        ; preds = %lor.lhs.false29, %if.end26
  tail call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %lor.lhs.false29
  %arrayidx34 = getelementptr inbounds i64* %x, i64 10
  %10 = load i64* %arrayidx34, align 8, !tbaa !0
  %cmp35 = icmp eq i64 %10, 6
  br i1 %cmp35, label %lor.lhs.false36, label %if.then39

lor.lhs.false36:                                  ; preds = %if.end33
  %arrayidx37 = getelementptr inbounds i64* %x, i64 11
  %11 = load i64* %arrayidx37, align 8, !tbaa !0
  %cmp38 = icmp eq i64 %11, 16
  br i1 %cmp38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %lor.lhs.false36, %if.end33
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %lor.lhs.false36
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %a = alloca [40 x i64], align 16
  %arrayidx = getelementptr inbounds [40 x i64]* %a, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16, !tbaa !0
  %arrayidx3 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 1
  store i64 11, i64* %arrayidx3, align 8, !tbaa !0
  %arrayidx6 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 2
  store i64 2, i64* %arrayidx6, align 16, !tbaa !0
  %arrayidx9 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 3
  store i64 12, i64* %arrayidx9, align 8, !tbaa !0
  %arrayidx12 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 4
  store i64 3, i64* %arrayidx12, align 16, !tbaa !0
  %0 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 0), align 8, !tbaa !0
  %arrayidx15 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 5
  store i64 %0, i64* %arrayidx15, align 8, !tbaa !0
  %arrayidx18 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 6
  store i64 4, i64* %arrayidx18, align 16, !tbaa !0
  %1 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 1), align 8, !tbaa !0
  %arrayidx22 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 7
  store i64 %1, i64* %arrayidx22, align 8, !tbaa !0
  %arrayidx25 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 8
  store i64 5, i64* %arrayidx25, align 16, !tbaa !0
  %2 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 2), align 8, !tbaa !0
  %arrayidx29 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 9
  store i64 %2, i64* %arrayidx29, align 8, !tbaa !0
  %arrayidx32 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 10
  store i64 6, i64* %arrayidx32, align 16, !tbaa !0
  %3 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 3), align 8, !tbaa !0
  %arrayidx36 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 11
  store i64 %3, i64* %arrayidx36, align 8, !tbaa !0
  call void @foo(i64* %arrayidx, i32 12)
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
