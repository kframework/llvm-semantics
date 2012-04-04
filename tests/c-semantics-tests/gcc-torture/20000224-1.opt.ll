; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000224-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@loop_1 = global i32 100, align 4
@loop_2 = global i32 7, align 4
@flag = global i32 0, align 4

define i32 @test() nounwind uwtable {
entry:
  %0 = load i32* @loop_1, align 4, !tbaa !0
  %cmp7 = icmp sgt i32 %0, 0
  br i1 %cmp7, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = load i32* @loop_2, align 4, !tbaa !0
  %cmp14 = icmp sgt i32 %1, 0
  %flag.promoted = load i32* @flag, align 4
  br i1 %cmp14, label %while.body.us, label %if.end

while.body.us:                                    ; preds = %while.body.lr.ph, %while.body.us
  %inc39.us = phi i32 [ %inc3.us, %while.body.us ], [ %flag.promoted, %while.body.lr.ph ]
  %counter.08.us = phi i32 [ %counter.2.us, %while.body.us ], [ 0, %while.body.lr.ph ]
  %and.us = and i32 %inc39.us, 1
  %tobool.us = icmp eq i32 %and.us, 0
  %2 = select i1 %tobool.us, i32 0, i32 %1
  %counter.2.us = add i32 %counter.08.us, %2
  %inc3.us = add nsw i32 %inc39.us, 1
  %cmp.us = icmp sgt i32 %0, %counter.2.us
  br i1 %cmp.us, label %while.body.us, label %while.cond.while.end_crit_edge

if.end:                                           ; preds = %while.body.lr.ph, %if.end
  br label %if.end

while.cond.while.end_crit_edge:                   ; preds = %while.body.us
  store i32 %inc3.us, i32* @flag, align 4
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  ret i32 1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @loop_1, align 4, !tbaa !0
  %cmp7.i = icmp sgt i32 %0, 0
  br i1 %cmp7.i, label %while.body.lr.ph.i, label %test.exit

while.body.lr.ph.i:                               ; preds = %entry
  %1 = load i32* @loop_2, align 4, !tbaa !0
  %cmp14.i = icmp sgt i32 %1, 0
  br i1 %cmp14.i, label %while.body.us.i.preheader, label %if.end.i

while.body.us.i.preheader:                        ; preds = %while.body.lr.ph.i
  %flag.promoted.i = load i32* @flag, align 4
  br label %while.body.us.i

while.body.us.i:                                  ; preds = %while.body.us.i.preheader, %while.body.us.i
  %inc39.us.i = phi i32 [ %inc3.us.i, %while.body.us.i ], [ %flag.promoted.i, %while.body.us.i.preheader ]
  %counter.08.us.i = phi i32 [ %counter.2.us.i, %while.body.us.i ], [ 0, %while.body.us.i.preheader ]
  %and.us.i = and i32 %inc39.us.i, 1
  %tobool.us.i = icmp eq i32 %and.us.i, 0
  %2 = select i1 %tobool.us.i, i32 0, i32 %1
  %counter.2.us.i = add i32 %2, %counter.08.us.i
  %inc3.us.i = add nsw i32 %inc39.us.i, 1
  %cmp.us.i = icmp sgt i32 %0, %counter.2.us.i
  br i1 %cmp.us.i, label %while.body.us.i, label %while.cond.while.end_crit_edge.i

if.end.i:                                         ; preds = %while.body.lr.ph.i, %if.end.i
  br label %if.end.i

while.cond.while.end_crit_edge.i:                 ; preds = %while.body.us.i
  store i32 %inc3.us.i, i32* @flag, align 4
  br label %test.exit

test.exit:                                        ; preds = %entry, %while.cond.while.end_crit_edge.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
