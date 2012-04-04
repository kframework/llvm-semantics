; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000706-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.baz = type { i32, i32, i32, i32, i32 }

define void @bar(%struct.baz* nocapture %x, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.baz* %x, i64 0, i32 0
  %0 = load i32* %a, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.baz* %x, i64 0, i32 1
  %1 = load i32* %b, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %1, 2
  br i1 %cmp1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.baz* %x, i64 0, i32 2
  %2 = load i32* %c, align 4, !tbaa !0
  %cmp3 = icmp eq i32 %2, 3
  br i1 %cmp3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %d = getelementptr inbounds %struct.baz* %x, i64 0, i32 3
  %3 = load i32* %d, align 4, !tbaa !0
  %cmp5 = icmp eq i32 %3, 4
  br i1 %cmp5, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %e = getelementptr inbounds %struct.baz* %x, i64 0, i32 4
  %4 = load i32* %e, align 4, !tbaa !0
  %cmp7 = icmp eq i32 %4, 5
  %cmp9 = icmp eq i32 %f, 6
  %or.cond = and i1 %cmp7, %cmp9
  %cmp11 = icmp eq i32 %g, 7
  %or.cond18 = and i1 %or.cond, %cmp11
  %cmp13 = icmp eq i32 %h, 8
  %or.cond19 = and i1 %or.cond18, %cmp13
  %cmp15 = icmp eq i32 %i, 9
  %or.cond20 = and i1 %or.cond19, %cmp15
  %cmp17 = icmp eq i32 %j, 10
  %or.cond21 = and i1 %or.cond20, %cmp17
  br i1 %or.cond21, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  ret void
}

declare void @abort() noreturn

define void @foo(i8* nocapture %z, %struct.baz* nocapture byval align 8 %x, i8* nocapture %y) nounwind uwtable {
entry:
  %0 = bitcast %struct.baz* %x to i64*
  %1 = load i64* %0, align 8
  %2 = icmp eq i64 %1, 8589934593
  br i1 %2, label %lor.lhs.false2.i, label %if.then.i

lor.lhs.false2.i:                                 ; preds = %entry
  %c.i = getelementptr inbounds %struct.baz* %x, i64 0, i32 2
  %3 = bitcast i32* %c.i to i64*
  %4 = load i64* %3, align 8
  %5 = icmp eq i64 %4, 17179869187
  br i1 %5, label %lor.lhs.false6.i, label %if.then.i

lor.lhs.false6.i:                                 ; preds = %lor.lhs.false2.i
  %e.i = getelementptr inbounds %struct.baz* %x, i64 0, i32 4
  %6 = load i32* %e.i, align 8, !tbaa !0
  %cmp7.i = icmp eq i32 %6, 5
  br i1 %cmp7.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false6.i, %lor.lhs.false2.i, %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false6.i
  ret void
}

define i32 @main() noreturn nounwind uwtable {
foo.exit:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
