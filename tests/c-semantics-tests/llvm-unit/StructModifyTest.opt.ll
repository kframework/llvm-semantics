; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/StructModifyTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1Ty = type { i32, float, double, i64 }

@.str = private unnamed_addr constant [18 x i8] c"%d, %d, %d, %lld\0A\00", align 1

define void @printS1(%struct.S1Ty* nocapture %V) nounwind uwtable {
entry:
  %w = getelementptr inbounds %struct.S1Ty* %V, i64 0, i32 0
  %0 = load i32* %w, align 4, !tbaa !0
  %x = getelementptr inbounds %struct.S1Ty* %V, i64 0, i32 1
  %1 = load float* %x, align 4, !tbaa !3
  %mul = fmul float %1, 1.000000e+01
  %conv = fptosi float %mul to i32
  %y = getelementptr inbounds %struct.S1Ty* %V, i64 0, i32 2
  %2 = load double* %y, align 8, !tbaa !4
  %mul1 = fmul double %2, 1.000000e+01
  %conv2 = fptosi double %mul1 to i32
  %z = getelementptr inbounds %struct.S1Ty* %V, i64 0, i32 3
  %3 = load i64* %z, align 8, !tbaa !5
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 %0, i32 %conv, i32 %conv2, i64 %3) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 1, i32 1234, i32 190, i64 123455678902) nounwind
  %call.i21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 2, i32 234, i32 290, i64 23455678902) nounwind
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"float", metadata !1}
!4 = metadata !{metadata !"double", metadata !1}
!5 = metadata !{metadata !"long long", metadata !1}
