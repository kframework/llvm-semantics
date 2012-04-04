; ModuleID = '/home/david/src/c-semantics/tests/unitTests/structsAndArrays.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define void @foo(%struct.S* %s) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %0 = load i32* %a, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %1 = load i32* %b, align 4, !tbaa !0
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %1) nounwind
  %arrayidx = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %2) nounwind
  %arrayidx4 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 1
  %3 = load i32* %arrayidx4, align 4, !tbaa !0
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %3) nounwind
  %arrayidx7 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 2
  %4 = load i32* %arrayidx7, align 4, !tbaa !0
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %4) nounwind
  %arrayidx10 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 3
  %5 = load i32* %arrayidx10, align 4, !tbaa !0
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %5) nounwind
  %arrayidx13 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 4
  %6 = load i32* %arrayidx13, align 4, !tbaa !0
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %6) nounwind
  %arrayidx16 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 5
  %7 = load i32* %arrayidx16, align 4, !tbaa !0
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %7) nounwind
  %t = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 0
  %8 = load i32* %t, align 4, !tbaa !0
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %8) nounwind
  %arrayidx20 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 0
  %9 = load i32* %arrayidx20, align 4, !tbaa !0
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %9) nounwind
  %arrayidx24 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 1
  %10 = load i32* %arrayidx24, align 4, !tbaa !0
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %10) nounwind
  %arrayidx28 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 2
  %11 = load i32* %arrayidx28, align 4, !tbaa !0
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %11) nounwind
  %arrayidx32 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 3
  %12 = load i32* %arrayidx32, align 4, !tbaa !0
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %12) nounwind
  %arrayidx36 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 4
  %13 = load i32* %arrayidx36, align 4, !tbaa !0
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %13) nounwind
  %arrayidx40 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 5
  %14 = load i32* %arrayidx40, align 4, !tbaa !0
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %14) nounwind
  %arrayidx44 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 6
  %15 = load i32* %arrayidx44, align 4, !tbaa !0
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %15) nounwind
  %arrayidx48 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 7
  %16 = load i32* %arrayidx48, align 4, !tbaa !0
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %16) nounwind
  %17 = load i32* %b, align 4, !tbaa !0
  %18 = load i32* %a, align 4, !tbaa !0
  store i32 %17, i32* %a, align 4
  store i32 %18, i32* %b, align 4
  %19 = bitcast i32* %arrayidx to i8*
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 24, i32 4, i1 false)
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

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
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %1) nounwind
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %2 = load i32* %b, align 4, !tbaa !0
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %2) nounwind
  %arrayidx = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %3 = load i32* %arrayidx, align 4, !tbaa !0
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %3) nounwind
  %arrayidx4 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 1
  %4 = load i32* %arrayidx4, align 4, !tbaa !0
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %4) nounwind
  %arrayidx7 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 2
  %5 = load i32* %arrayidx7, align 4, !tbaa !0
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %5) nounwind
  %arrayidx10 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 3
  %6 = load i32* %arrayidx10, align 4, !tbaa !0
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %6) nounwind
  %arrayidx13 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 4
  %7 = load i32* %arrayidx13, align 4, !tbaa !0
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %7) nounwind
  %arrayidx16 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 5
  %8 = load i32* %arrayidx16, align 4, !tbaa !0
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %8) nounwind
  %t = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 0
  %9 = load i32* %t, align 4, !tbaa !0
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %9) nounwind
  %arrayidx20 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 0
  %10 = load i32* %arrayidx20, align 4, !tbaa !0
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %10) nounwind
  %arrayidx24 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 1
  %11 = load i32* %arrayidx24, align 4, !tbaa !0
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %11) nounwind
  %arrayidx28 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 2
  %12 = load i32* %arrayidx28, align 4, !tbaa !0
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %12) nounwind
  %arrayidx32 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 3
  %13 = load i32* %arrayidx32, align 4, !tbaa !0
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %13) nounwind
  %arrayidx36 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 4
  %14 = load i32* %arrayidx36, align 4, !tbaa !0
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %14) nounwind
  %arrayidx40 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 5
  %15 = load i32* %arrayidx40, align 4, !tbaa !0
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %15) nounwind
  %arrayidx44 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 6
  %16 = load i32* %arrayidx44, align 4, !tbaa !0
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %16) nounwind
  %arrayidx48 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 7
  %17 = load i32* %arrayidx48, align 4, !tbaa !0
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %17) nounwind
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
