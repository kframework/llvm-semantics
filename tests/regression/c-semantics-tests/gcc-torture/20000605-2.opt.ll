; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000605-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.F = type { i32 }

define void @f1(%struct.F* nocapture %x, %struct.F* nocapture %y) nounwind uwtable {
entry:
  %i = getelementptr inbounds %struct.F* %x, i64 0, i32 0
  %i1 = getelementptr inbounds %struct.F* %y, i64 0, i32 0
  %.pre = load i32* %i, align 4, !tbaa !0
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = phi i32 [ %.pre, %entry ], [ %inc4, %for.inc ]
  %timeout.0 = phi i32 [ 1, %entry ], [ %phitmp, %for.inc ]
  %1 = load i32* %i1, align 4, !tbaa !0
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %cmp2 = icmp sgt i32 %timeout.0, 5
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %inc4 = add nsw i32 %0, 1
  store i32 %inc4, i32* %i, align 4, !tbaa !0
  %phitmp = add i32 %timeout.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc4.i, %for.inc.i ]
  %timeout.0.i = phi i32 [ 1, %entry ], [ %phitmp.i, %for.inc.i ]
  %cmp.i = icmp slt i32 %0, 1
  br i1 %cmp.i, label %for.body.i, label %f1.exit

for.body.i:                                       ; preds = %for.cond.i
  %cmp2.i = icmp sgt i32 %timeout.0.i, 5
  br i1 %cmp2.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i
  tail call void @abort() noreturn nounwind
  unreachable

for.inc.i:                                        ; preds = %for.body.i
  %inc4.i = add nsw i32 %0, 1
  %phitmp.i = add i32 %timeout.0.i, 1
  br label %for.cond.i

f1.exit:                                          ; preds = %for.cond.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
