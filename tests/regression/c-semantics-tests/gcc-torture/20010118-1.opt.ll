; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32, i32, i32, i32, i32 }

define void @foo(%struct.A* nocapture %v, i32 %w, i32 %x, i32* nocapture %y, i32* nocapture %z) nounwind uwtable readnone {
entry:
  ret void
}

define void @bar(%struct.A* nocapture %v, i32 %x, i32 %y, i32 %w, i32 %h) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.A* %v, i64 0, i32 0
  %0 = load i32* %a, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, %x
  %b = getelementptr inbounds %struct.A* %v, i64 0, i32 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %1, %y
  br i1 %cmp1, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %lor.lhs.false
  %e2 = getelementptr inbounds %struct.A* %v, i64 0, i32 4
  %2 = load i32* %e2, align 4, !tbaa !0
  %f3 = getelementptr inbounds %struct.A* %v, i64 0, i32 5
  %3 = load i32* %f3, align 4, !tbaa !0
  %conv4 = sitofp i32 %2 to double
  %mul = fmul double %conv4, 0.000000e+00
  %div = fmul double %mul, 5.000000e-01
  %conv5 = fptosi double %div to i32
  %conv8 = sitofp i32 %3 to double
  %mul9 = fmul double %conv8, 0.000000e+00
  %div10 = fmul double %mul9, 5.000000e-01
  %conv11 = fptosi double %div10 to i32
  %add = add nsw i32 %conv5, %x
  %add12 = add nsw i32 %conv11, %y
  store i32 %add, i32* %a, align 4, !tbaa !0
  store i32 %add12, i32* %b, align 4, !tbaa !0
  %c = getelementptr inbounds %struct.A* %v, i64 0, i32 2
  store i32 %w, i32* %c, align 4, !tbaa !0
  %d = getelementptr inbounds %struct.A* %v, i64 0, i32 3
  store i32 %h, i32* %d, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %lor.lhs.false, %if.then
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
