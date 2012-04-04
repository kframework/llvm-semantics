; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-8.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [3 x double] [double 0.000000e+00, double 1.000000e+00, double 2.000000e+00], align 16

define void @bar(i32 %x, double* nocapture %y) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %x, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %0 = load double* %y, align 8, !tbaa !0
  %cmp = fcmp une double %0, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry, %lor.lhs.false
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [3 x double]* @a, i64 0, i64 %indvars.iv
  %1 = load double* %arrayidx, align 8, !tbaa !0
  %cmp1 = fcmp ogt double %1, 0.000000e+00
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %e, label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @abort() noreturn nounwind
  unreachable

e:                                                ; preds = %for.body
  %cmp.i = fcmp une double %1, 1.000000e+00
  br i1 %cmp.i, label %if.then.i, label %bar.exit2

if.then.i:                                        ; preds = %e
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit2:                                        ; preds = %e
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
