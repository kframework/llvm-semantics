; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f3.x = internal unnamed_addr global i32 0, align 4

define void @ff(i32 %fname, i32 %part, i32 %nparts) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %fname, 0
  %tobool1 = icmp eq i32 %nparts, 0
  %or.cond = or i1 %tobool, %tobool1
  br i1 %or.cond, label %while.cond.preheader, label %if.then2

while.cond.preheader:                             ; preds = %entry
  %f3.x.promoted = load i32* @f3.x, align 4
  br i1 %tobool1, label %while.cond.us, label %while.cond.preheader.while.cond.preheader.split_crit_edge

while.cond.preheader.while.cond.preheader.split_crit_edge: ; preds = %while.cond.preheader
  %lnot.i = icmp eq i32 %f3.x.promoted, 0
  %lnot.ext.i = zext i1 %lnot.i to i32
  store i32 %lnot.ext.i, i32* @f3.x, align 4
  br i1 %lnot.i, label %land.lhs.true, label %if.then15

while.cond.us:                                    ; preds = %while.cond.us, %while.cond.preheader
  %lnot.ext.i17.us = phi i32 [ %f3.x.promoted, %while.cond.preheader ], [ %lnot.ext.i.us, %while.cond.us ]
  %lnot.i.us = icmp eq i32 %lnot.ext.i17.us, 0
  %lnot.ext.i.us = zext i1 %lnot.i.us to i32
  br i1 %lnot.i.us, label %while.cond.us, label %while.end

if.then2:                                         ; preds = %entry
  tail call void @f1()
  unreachable

land.lhs.true:                                    ; preds = %while.cond.preheader.while.cond.preheader.split_crit_edge
  %call6 = tail call i32 @f2()
  unreachable

while.end:                                        ; preds = %while.cond.us
  store i32 %lnot.ext.i.us, i32* @f3.x, align 4
  br i1 %tobool1, label %if.end16, label %if.then15

if.then15:                                        ; preds = %while.cond.preheader.while.cond.preheader.split_crit_edge, %while.end
  tail call void @f1()
  unreachable

if.end16:                                         ; preds = %while.end
  ret void
}

define void @f1() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @f3() nounwind uwtable {
entry:
  %0 = load i32* @f3.x, align 4, !tbaa !0
  %lnot = icmp eq i32 %0, 0
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* @f3.x, align 4, !tbaa !0
  ret i32 %lnot.ext
}

define i32 @f2() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @main() nounwind uwtable {
entry:
  %f3.x.promoted.i = load i32* @f3.x, align 4
  br label %while.cond.us.i

while.cond.us.i:                                  ; preds = %while.cond.us.i, %entry
  %lnot.ext.i17.us.i = phi i32 [ %f3.x.promoted.i, %entry ], [ %lnot.ext.i.us.i, %while.cond.us.i ]
  %lnot.i.us.i = icmp eq i32 %lnot.ext.i17.us.i, 0
  %lnot.ext.i.us.i = zext i1 %lnot.i.us.i to i32
  br i1 %lnot.i.us.i, label %while.cond.us.i, label %ff.exit

ff.exit:                                          ; preds = %while.cond.us.i
  store i32 %lnot.ext.i.us.i, i32* @f3.x, align 4
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
