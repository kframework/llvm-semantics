; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-02-ManyArguments.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"%d, %d, %d, %d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"%d, %ld, %d, %d, %lld\0A\00", align 1

define void @printfn(i32 %a, i16 signext %b, double %C, float %D, i8 signext %E, i8 signext %F, i8* nocapture %G, double* %H, i32 %I, i64 %J) nounwind uwtable {
entry:
  %conv = sext i16 %b to i32
  %mul = fmul double %C, 1.000000e+02
  %conv1 = fptosi double %mul to i32
  %mul2 = fmul float %D, 1.000000e+02
  %conv3 = fptosi float %mul2 to i32
  %conv4 = sext i8 %E to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 %a, i32 %conv, i32 %conv1, i32 %conv3, i32 %conv4) nounwind
  %conv5 = sext i8 %F to i32
  %0 = bitcast i8* %G to i32*
  %1 = load i32* %0, align 4, !tbaa !0
  %conv6 = sext i32 %1 to i64
  %cmp = icmp eq double* %H, null
  %conv7 = zext i1 %cmp to i32
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %conv5, i64 %conv6, i32 %conv7, i32 %I, i64 %J) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 12, i32 2, i32 12323, i32 123112, i32 -12) nounwind
  %call8.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 23, i64 5, i32 1, i32 1234567, i64 123124124124) nounwind
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
