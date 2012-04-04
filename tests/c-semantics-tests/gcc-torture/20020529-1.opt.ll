; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020529-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.xx = type { i32, %struct.xx*, i16 }

@f1.beenhere = internal unnamed_addr global i32 0, align 4

define i32 @foo(%struct.xx* nocapture %p, i32 %b, i32 %c, i32 %d) nounwind uwtable {
entry:
  %tobool1 = icmp eq i32 %b, 0
  %c4 = getelementptr inbounds %struct.xx* %p, i64 0, i32 2
  %a5 = getelementptr inbounds %struct.xx* %p, i64 0, i32 0
  %tobool9 = icmp ne i32 %c, 0
  br i1 %tobool1, label %for.cond.outer.split.us.us, label %entry.entry.split_crit_edge

entry.entry.split_crit_edge:                      ; preds = %entry
  %f1.beenhere.promoted.us38.pre = load i32* @f1.beenhere, align 4
  br i1 %tobool9, label %for.cond.us53, label %for.cond

if.end8.us:                                       ; preds = %if.end3.us
  br i1 %tobool9, label %if.then10, label %for.cond.outer.backedge.us

if.end3.us:                                       ; preds = %f1.exit.us.us
  store i32 %inc.i.us.us, i32* @f1.beenhere, align 4
  %conv.us = trunc i32 %d.addr.0.ph.us to i16
  store i16 %conv.us, i16* %c4, align 2, !tbaa !0
  %0 = load i32* %a5, align 4, !tbaa !3
  %tobool6.us = icmp eq i32 %0, 0
  br i1 %tobool6.us, label %if.end8.us, label %if.then7

f1.exit.us.us:                                    ; preds = %for.cond.outer.split.us.us
  %cmp1.i.us.us = icmp sgt i32 %f1.beenhere.promoted.us, 0
  br i1 %cmp1.i.us.us, label %if.then, label %if.end3.us

for.cond.outer.split.us.us:                       ; preds = %for.cond.outer.backedge.us, %entry
  %d.addr.0.ph.us = phi i32 [ %conv13.us, %for.cond.outer.backedge.us ], [ %d, %entry ]
  %f1.beenhere.promoted.us = load i32* @f1.beenhere, align 4
  %inc.i.us.us = add nsw i32 %f1.beenhere.promoted.us, 1
  %cmp.i.us.us = icmp sgt i32 %f1.beenhere.promoted.us, 1
  br i1 %cmp.i.us.us, label %if.then.i, label %f1.exit.us.us

for.cond.outer.backedge.us:                       ; preds = %if.end8.us
  %conv13.us = sext i16 %conv.us to i32
  br label %for.cond.outer.split.us.us

f1.exit.us48:                                     ; preds = %for.cond.us53
  %cmp1.i.us49 = icmp sgt i32 %inc.i22.us54, 0
  br i1 %cmp1.i.us49, label %if.then, label %for.cond.us53

for.cond.us53:                                    ; preds = %entry.entry.split_crit_edge, %f1.exit.us48
  %inc.i22.us54 = phi i32 [ %inc.i.us55, %f1.exit.us48 ], [ %f1.beenhere.promoted.us38.pre, %entry.entry.split_crit_edge ]
  %inc.i.us55 = add nsw i32 %inc.i22.us54, 1
  %cmp.i.us56 = icmp sgt i32 %inc.i22.us54, 1
  br i1 %cmp.i.us56, label %if.then.i, label %f1.exit.us48

for.cond:                                         ; preds = %entry.entry.split_crit_edge, %f1.exit
  %inc.i22 = phi i32 [ %inc.i, %f1.exit ], [ %f1.beenhere.promoted.us38.pre, %entry.entry.split_crit_edge ]
  %inc.i = add nsw i32 %inc.i22, 1
  %cmp.i = icmp sgt i32 %inc.i22, 1
  br i1 %cmp.i, label %if.then.i, label %f1.exit

if.then.i:                                        ; preds = %for.cond, %for.cond.us53, %for.cond.outer.split.us.us
  %inc.i.lcssa = phi i32 [ %inc.i.us.us, %for.cond.outer.split.us.us ], [ %inc.i.us55, %for.cond.us53 ], [ %inc.i, %for.cond ]
  store i32 %inc.i.lcssa, i32* @f1.beenhere, align 4
  tail call void @abort() noreturn nounwind
  unreachable

f1.exit:                                          ; preds = %for.cond
  %cmp1.i = icmp sgt i32 %inc.i22, 0
  br i1 %cmp1.i, label %if.then, label %for.cond

if.then:                                          ; preds = %f1.exit, %f1.exit.us48, %f1.exit.us.us
  %inc.i.lcssa24 = phi i32 [ %inc.i.us.us, %f1.exit.us.us ], [ %inc.i.us55, %f1.exit.us48 ], [ %inc.i, %f1.exit ]
  store i32 %inc.i.lcssa24, i32* @f1.beenhere, align 4
  ret i32 0

if.then7:                                         ; preds = %if.end3.us
  tail call void @f2()
  unreachable

if.then10:                                        ; preds = %if.end8.us
  tail call void @f2()
  unreachable
}

define i32 @f1(%struct.xx* nocapture %p) nounwind uwtable {
entry:
  %0 = load i32* @f1.beenhere, align 4, !tbaa !3
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f1.beenhere, align 4, !tbaa !3
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %cmp1 = icmp sgt i32 %0, 0
  %conv = zext i1 %cmp1 to i32
  ret i32 %conv
}

define void @f2() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @main() noreturn nounwind uwtable {
entry.split.us:
  %s = alloca %struct.xx, align 8
  %a = getelementptr inbounds %struct.xx* %s, i64 0, i32 0
  store i32 0, i32* %a, align 8, !tbaa !3
  %b = getelementptr inbounds %struct.xx* %s, i64 0, i32 1
  store %struct.xx* %s, %struct.xx** %b, align 8, !tbaa !4
  %c = getelementptr inbounds %struct.xx* %s, i64 0, i32 2
  store i16 23, i16* %c, align 8, !tbaa !0
  %f1.beenhere.promoted.us.i.us.pre = load i32* @f1.beenhere, align 4
  br label %for.cond.outer.split.us.us.i.us

for.cond.outer.split.us.us.i.us:                  ; preds = %if.end3.us.i.us, %entry.split.us
  %0 = phi i16 [ 0, %if.end3.us.i.us ], [ 23, %entry.split.us ]
  %f1.beenhere.promoted.us.i.us = phi i32 [ %inc.i.us.us.i.us, %if.end3.us.i.us ], [ %f1.beenhere.promoted.us.i.us.pre, %entry.split.us ]
  %inc.i.us.us.i.us = add nsw i32 %f1.beenhere.promoted.us.i.us, 1
  %cmp.i.us.us.i.us = icmp sgt i32 %f1.beenhere.promoted.us.i.us, 1
  br i1 %cmp.i.us.us.i.us, label %if.then.i.i, label %f1.exit.us.us.i.us

if.end3.us.i.us:                                  ; preds = %f1.exit.us.us.i.us
  store i16 0, i16* %c, align 8, !tbaa !0
  br label %for.cond.outer.split.us.us.i.us

f1.exit.us.us.i.us:                               ; preds = %for.cond.outer.split.us.us.i.us
  %cmp1.i.us.us.i.us = icmp sgt i32 %f1.beenhere.promoted.us.i.us, 0
  store i32 %inc.i.us.us.i.us, i32* @f1.beenhere, align 4
  br i1 %cmp1.i.us.us.i.us, label %lor.lhs.false6, label %if.end3.us.i.us

if.then.i.i:                                      ; preds = %for.cond.outer.split.us.us.i.us
  store i32 %inc.i.us.us.i.us, i32* @f1.beenhere, align 4
  call void @abort() noreturn nounwind
  unreachable

lor.lhs.false6:                                   ; preds = %f1.exit.us.us.i.us
  %cmp8 = icmp eq i16 %0, 0
  br i1 %cmp8, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false6
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{metadata !"any pointer", metadata !1}
