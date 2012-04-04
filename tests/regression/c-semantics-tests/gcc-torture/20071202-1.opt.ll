; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071202-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define void @foo(%struct.S* nocapture %s) nounwind uwtable noinline {
entry:
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %0 = load i32* %b, align 4, !tbaa !0
  %a2 = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %1 = load i32* %a2, align 4, !tbaa !0
  store i32 %0, i32* %a2, align 4
  store i32 %1, i32* %b, align 4
  %s.2.0 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %2 = bitcast i32* %s.2.0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 4, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %s = alloca %struct.S, align 4
  %0 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %1 = load i32* %a, align 4, !tbaa !0
  %cmp = icmp eq i32 %1, 12
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %2 = load i32* %b, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %2, 6
  br i1 %cmp1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %arrayidx = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %3 = load i32* %arrayidx, align 4, !tbaa !0
  %tobool = icmp eq i32 %3, 0
  br i1 %tobool, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %lor.lhs.false2
  %arrayidx5 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 1
  %4 = load i32* %arrayidx5, align 4, !tbaa !0
  %tobool6 = icmp eq i32 %4, 0
  br i1 %tobool6, label %lor.lhs.false7, label %if.then

lor.lhs.false7:                                   ; preds = %lor.lhs.false3
  %arrayidx9 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 2
  %5 = load i32* %arrayidx9, align 4, !tbaa !0
  %tobool10 = icmp eq i32 %5, 0
  br i1 %tobool10, label %lor.lhs.false11, label %if.then

lor.lhs.false11:                                  ; preds = %lor.lhs.false7
  %arrayidx13 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 3
  %6 = load i32* %arrayidx13, align 4, !tbaa !0
  %tobool14 = icmp eq i32 %6, 0
  br i1 %tobool14, label %lor.lhs.false15, label %if.then

lor.lhs.false15:                                  ; preds = %lor.lhs.false11
  %arrayidx17 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 4
  %7 = load i32* %arrayidx17, align 4, !tbaa !0
  %tobool18 = icmp eq i32 %7, 0
  br i1 %tobool18, label %lor.lhs.false19, label %if.then

lor.lhs.false19:                                  ; preds = %lor.lhs.false15
  %arrayidx21 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 5
  %8 = load i32* %arrayidx21, align 4, !tbaa !0
  %tobool22 = icmp eq i32 %8, 0
  br i1 %tobool22, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false19, %lor.lhs.false15, %lor.lhs.false11, %lor.lhs.false7, %lor.lhs.false3, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false19
  %t = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 0
  %9 = load i32* %t, align 4, !tbaa !0
  %cmp23 = icmp eq i32 %9, 7
  br i1 %cmp23, label %lor.lhs.false24, label %if.then63

lor.lhs.false24:                                  ; preds = %if.end
  %arrayidx26 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 0
  %10 = load i32* %arrayidx26, align 4, !tbaa !0
  %cmp27 = icmp eq i32 %10, 8
  br i1 %cmp27, label %lor.lhs.false28, label %if.then63

lor.lhs.false28:                                  ; preds = %lor.lhs.false24
  %arrayidx31 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 1
  %11 = load i32* %arrayidx31, align 4, !tbaa !0
  %cmp32 = icmp eq i32 %11, 9
  br i1 %cmp32, label %lor.lhs.false33, label %if.then63

lor.lhs.false33:                                  ; preds = %lor.lhs.false28
  %arrayidx36 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 2
  %12 = load i32* %arrayidx36, align 4, !tbaa !0
  %cmp37 = icmp eq i32 %12, 10
  br i1 %cmp37, label %lor.lhs.false38, label %if.then63

lor.lhs.false38:                                  ; preds = %lor.lhs.false33
  %arrayidx41 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 3
  %13 = load i32* %arrayidx41, align 4, !tbaa !0
  %cmp42 = icmp eq i32 %13, 11
  br i1 %cmp42, label %lor.lhs.false43, label %if.then63

lor.lhs.false43:                                  ; preds = %lor.lhs.false38
  %arrayidx46 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 4
  %14 = load i32* %arrayidx46, align 4, !tbaa !0
  %cmp47 = icmp eq i32 %14, 12
  br i1 %cmp47, label %lor.lhs.false48, label %if.then63

lor.lhs.false48:                                  ; preds = %lor.lhs.false43
  %arrayidx51 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 5
  %15 = load i32* %arrayidx51, align 4, !tbaa !0
  %cmp52 = icmp eq i32 %15, 13
  br i1 %cmp52, label %lor.lhs.false53, label %if.then63

lor.lhs.false53:                                  ; preds = %lor.lhs.false48
  %arrayidx56 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 6
  %16 = load i32* %arrayidx56, align 4, !tbaa !0
  %cmp57 = icmp eq i32 %16, 14
  br i1 %cmp57, label %lor.lhs.false58, label %if.then63

lor.lhs.false58:                                  ; preds = %lor.lhs.false53
  %arrayidx61 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 7
  %17 = load i32* %arrayidx61, align 4, !tbaa !0
  %cmp62 = icmp eq i32 %17, 15
  br i1 %cmp62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %lor.lhs.false58, %lor.lhs.false53, %lor.lhs.false48, %lor.lhs.false43, %lor.lhs.false38, %lor.lhs.false33, %lor.lhs.false28, %lor.lhs.false24, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %lor.lhs.false58
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
