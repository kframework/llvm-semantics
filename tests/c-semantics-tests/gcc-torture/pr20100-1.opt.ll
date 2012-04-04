; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20100-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g = internal unnamed_addr global i16 0, align 2
@p = internal unnamed_addr global i16 0, align 2
@e = common global i8 0, align 1

define signext i8 @frob(i16 zeroext %a, i16 zeroext %b) nounwind uwtable {
entry:
  store i16 %b, i16* @p, align 2, !tbaa !0
  %conv.i.i = zext i16 %a to i32
  %0 = load i8* @e, align 1, !tbaa !1
  %conv1.i.i = zext i8 %0 to i32
  %sub.i.i = add nsw i32 %conv1.i.i, -1
  %cmp.i.i = icmp eq i32 %conv.i.i, %sub.i.i
  %add.i.i = add i16 %a, 1
  %.add.i.i = select i1 %cmp.i.i, i16 0, i16 %add.i.i
  store i16 %.add.i.i, i16* @g, align 2, !tbaa !0
  %cmp.i = icmp eq i16 %.add.i.i, %b
  %..i = zext i1 %cmp.i to i8
  ret i8 %..i
}

define zeroext i16 @get_n() nounwind uwtable {
entry:
  %0 = load i16* @p, align 2, !tbaa !0
  %1 = load i16* @g, align 2, !tbaa !0
  %tobool4 = icmp eq i16 %0, %1
  br i1 %tobool4, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %2 = load i8* @e, align 1, !tbaa !1
  %conv1.i.i = zext i8 %2 to i32
  %sub.i.i = add nsw i32 %conv1.i.i, -1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %3 = phi i16 [ %1, %while.body.lr.ph ], [ %.add.i.i, %while.body ]
  %n.05 = phi i16 [ 0, %while.body.lr.ph ], [ %inc, %while.body ]
  %conv.i.i = zext i16 %3 to i32
  %cmp.i.i = icmp eq i32 %conv.i.i, %sub.i.i
  %add.i.i = add i16 %3, 1
  %.add.i.i = select i1 %cmp.i.i, i16 0, i16 %add.i.i
  %inc = add i16 %n.05, 1
  %tobool = icmp ne i16 %0, %.add.i.i
  %cmp = icmp ult i16 %inc, 5
  %or.cond = and i1 %cmp, %tobool
  br i1 %or.cond, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store i16 %.add.i.i, i16* @g, align 2
  br label %while.end

while.end:                                        ; preds = %entry, %while.cond.while.end_crit_edge
  %n.0.lcssa = phi i16 [ %inc, %while.cond.while.end_crit_edge ], [ 0, %entry ]
  ret i16 %n.0.lcssa
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i8 3, i8* @e, align 1, !tbaa !1
  store i16 2, i16* @p, align 2, !tbaa !0
  store i16 2, i16* @g, align 2
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
