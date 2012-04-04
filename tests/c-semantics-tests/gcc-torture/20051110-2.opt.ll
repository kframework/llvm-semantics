; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051110-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1
@flag = common global i32 0, align 4

define void @add_unwind_adjustsp(i64 %offset) nounwind uwtable {
entry:
  %sub = add nsw i64 %offset, -516
  %shr = ashr i64 %sub, 2
  %o.0.tr11 = trunc i64 %shr to i8
  %conv12 = and i8 %o.0.tr11, 127
  store i8 %conv12, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1, !tbaa !0
  %shr113 = lshr i64 %shr, 7
  %tobool14 = icmp eq i64 %shr113, 0
  br i1 %tobool14, label %do.end, label %if.then.lr.ph

if.then.lr.ph:                                    ; preds = %entry
  %0 = load i32* @flag, align 4, !tbaa !2
  %tobool6 = icmp eq i32 %0, 0
  %1 = zext i1 %tobool6 to i64
  br label %if.then

if.then:                                          ; preds = %if.then.lr.ph, %if.then
  %indvars.iv = phi i64 [ 0, %if.then.lr.ph ], [ %indvars.iv.next, %if.then ]
  %shr118 = phi i64 [ %shr113, %if.then.lr.ph ], [ %shr1, %if.then ]
  %arrayidx17 = phi i8* [ getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), %if.then.lr.ph ], [ %arrayidx, %if.then ]
  %o.0.tr16 = phi i8 [ %o.0.tr11, %if.then.lr.ph ], [ %o.0.tr, %if.then ]
  %or = or i8 %o.0.tr16, -128
  store i8 %or, i8* %arrayidx17, align 1, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, %1
  %o.0.tr = trunc i64 %shr118 to i8
  %conv = and i8 %o.0.tr, 127
  %arrayidx = getelementptr inbounds [5 x i8]* @bytes, i64 0, i64 %indvars.iv.next
  store i8 %conv, i8* %arrayidx, align 1, !tbaa !0
  %shr1 = lshr i64 %shr118, 7
  %tobool = icmp eq i64 %shr1, 0
  br i1 %tobool, label %do.end, label %if.then

do.end:                                           ; preds = %if.then, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @flag, align 4, !tbaa !2
  %tobool6.i = icmp eq i32 %0, 0
  %1 = zext i1 %tobool6.i to i64
  store i8 -120, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1, !tbaa !0
  %arrayidx.i = getelementptr inbounds [5 x i8]* @bytes, i64 0, i64 %1
  store i8 7, i8* %arrayidx.i, align 1, !tbaa !0
  %2 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1, !tbaa !0
  %cmp = icmp eq i8 %2, -120
  %3 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 1), align 1, !tbaa !0
  %cmp3 = icmp eq i8 %3, 7
  %or.cond = and i1 %cmp, %cmp3
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
