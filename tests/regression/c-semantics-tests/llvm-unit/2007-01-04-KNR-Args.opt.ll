; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2007-01-04-KNR-Args.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%c %d %d %d %d %d %d %d\0A\00", align 1

define void @p1(i32, double, i32, double %d1, i32 %i, double, i64 %l, double %d2) nounwind uwtable {
entry:
  %f1 = fptrunc double %1 to float
  %f2 = fptrunc double %3 to float
  %sext = shl i32 %0, 24
  %conv = ashr exact i32 %sext, 24
  %mul = fmul float %f1, 1.000000e+02
  %conv1 = fptosi float %mul to i32
  %sext9 = shl i32 %2, 16
  %conv2 = ashr exact i32 %sext9, 16
  %mul3 = fmul double %d1, 1.000000e+02
  %conv4 = fptosi double %mul3 to i32
  %mul5 = fmul float %f2, 1.000000e+02
  %conv6 = fptosi float %mul5 to i32
  %mul7 = fmul double %d2, 1.000000e+02
  %conv8 = fptosi double %mul7 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv1, i32 %conv2, i32 %conv4, i32 %i, i32 %conv6, i64 %l, i32 %conv8) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define void @p2(i8 signext %c, float %f1, i16 signext %s, double %d1, i32 %i, float %f2, i64 %l, double %d2) nounwind uwtable {
entry:
  %conv = sext i8 %c to i32
  %mul = fmul float %f1, 1.000000e+02
  %conv1 = fptosi float %mul to i32
  %conv2 = sext i16 %s to i32
  %mul3 = fmul double %d1, 1.000000e+02
  %conv4 = fptosi double %mul3 to i32
  %mul5 = fmul float %f2, 1.000000e+02
  %conv6 = fptosi float %mul5 to i32
  %mul7 = fmul double %d2, 1.000000e+02
  %conv8 = fptosi double %mul7 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv1, i32 %conv2, i32 %conv4, i32 %i, i32 %conv6, i64 %l, i32 %conv8) nounwind
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 97, i32 400, i32 1, i32 500, i32 2, i32 400, i64 3, i32 500) nounwind
  %call.i1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 97, i32 400, i32 1, i32 500, i32 2, i32 400, i64 3, i32 500) nounwind
  ret i32 0
}
