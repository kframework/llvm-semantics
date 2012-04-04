; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021118-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @t1(float* nocapture %f, i32 %i, void (double)* nocapture %f1, void (float, float)* nocapture %f2) nounwind uwtable {
entry:
  tail call void %f1(double 3.000000e+00) nounwind
  %add = add nsw i32 %i, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float* %f, i64 %idxprom
  %0 = load float* %arrayidx, align 4, !tbaa !0
  %idxprom1 = sext i32 %i to i64
  %arrayidx2 = getelementptr inbounds float* %f, i64 %idxprom1
  store float %0, float* %arrayidx2, align 4, !tbaa !0
  tail call void %f2(float 2.500000e+00, float 3.500000e+00) nounwind
  ret i32 0
}

define i32 @t2(float* nocapture %f, i32 %i, void (double)* nocapture %f1, void (float, float)* nocapture %f2, void (float)* nocapture %f3) nounwind uwtable {
entry:
  tail call void %f3(float 6.000000e+00) nounwind
  tail call void %f1(double 3.000000e+00) nounwind
  %add = add nsw i32 %i, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float* %f, i64 %idxprom
  %0 = load float* %arrayidx, align 4, !tbaa !0
  %idxprom1 = sext i32 %i to i64
  %arrayidx2 = getelementptr inbounds float* %f, i64 %idxprom1
  store float %0, float* %arrayidx2, align 4, !tbaa !0
  tail call void %f2(float 2.500000e+00, float 3.500000e+00) nounwind
  ret i32 0
}

define void @f1(double %d) nounwind uwtable {
entry:
  %cmp = fcmp une double %d, 3.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f2(float %f1, float %f2) nounwind uwtable {
entry:
  %cmp = fcmp une float %f1, 2.500000e+00
  %cmp1 = fcmp une float %f2, 3.500000e+00
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f3(float %f) nounwind uwtable {
entry:
  %cmp = fcmp une float %f, 6.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
