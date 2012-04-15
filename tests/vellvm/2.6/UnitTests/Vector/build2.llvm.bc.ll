; ModuleID = 'build2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [13 x i8] c"%f %f %f %f\0A\00", align 1 ; <[13 x i8]*> [#uses=1]

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  br label %bb2.preheader

bb1:                                              ; preds = %bb2.preheader, %bb1
  %i.039 = phi i32 [ 0, %bb2.preheader ], [ %14, %bb1 ] ; <i32> [#uses=1]
  %z.038 = phi <4 x float> [ zeroinitializer, %bb2.preheader ], [ %13, %bb1 ] ; <<4 x float>> [#uses=1]
  %y.037 = phi <4 x float> [ zeroinitializer, %bb2.preheader ], [ %9, %bb1 ] ; <<4 x float>> [#uses=1]
  %x.036 = phi <4 x float> [ zeroinitializer, %bb2.preheader ], [ %3, %bb1 ] ; <<4 x float>> [#uses=1]
  %0 = fadd <4 x float> %x.036, <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %1 = fadd <4 x float> %0, <float 0.000000e+00, float 1.000000e+00, float 0.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %2 = fadd <4 x float> %1, <float 0.000000e+00, float 0.000000e+00, float 1.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %3 = fadd <4 x float> %2, <float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00> ; <<4 x float>> [#uses=5]
  %4 = fadd <4 x float> %y.037, <float 1.000000e+00, float 2.000000e+00, float 0.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %5 = fadd <4 x float> %4, <float 1.000000e+00, float 0.000000e+00, float 2.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %6 = fadd <4 x float> %5, <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 2.000000e+00> ; <<4 x float>> [#uses=1]
  %7 = fadd <4 x float> %6, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %8 = fadd <4 x float> %7, <float 0.000000e+00, float 1.000000e+00, float 0.000000e+00, float 2.000000e+00> ; <<4 x float>> [#uses=1]
  %9 = fadd <4 x float> %8, <float 0.000000e+00, float 0.000000e+00, float 1.000000e+00, float 2.000000e+00> ; <<4 x float>> [#uses=5]
  %10 = fadd <4 x float> %z.038, <float 2.000000e+00, float 3.000000e+00, float 1.000000e+00, float 0.000000e+00> ; <<4 x float>> [#uses=1]
  %11 = fadd <4 x float> %10, <float 1.000000e+00, float 1.000000e+00, float 0.000000e+00, float 2.000000e+00> ; <<4 x float>> [#uses=1]
  %12 = fadd <4 x float> %11, <float 3.000000e+00, float 0.000000e+00, float 2.000000e+00, float 4.000000e+00> ; <<4 x float>> [#uses=1]
  %13 = fadd <4 x float> %12, <float 0.000000e+00, float 4.000000e+00, float 6.000000e+00, float 1.000000e+00> ; <<4 x float>> [#uses=5]
  %14 = add nsw i32 %i.039, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %14, 2000000            ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3, label %bb1

bb3:                                              ; preds = %bb1
  %15 = add i32 %j.046, 1                         ; <i32> [#uses=2]
  %exitcond54 = icmp eq i32 %15, 100              ; <i1> [#uses=1]
  br i1 %exitcond54, label %bb5, label %bb2.preheader

bb2.preheader:                                    ; preds = %bb3, %entry
  %j.046 = phi i32 [ 0, %entry ], [ %15, %bb3 ]   ; <i32> [#uses=1]
  br label %bb1

bb5:                                              ; preds = %bb3
  %tmp1 = extractelement <4 x float> %3, i32 3    ; <float> [#uses=1]
  %16 = fpext float %tmp1 to double               ; <double> [#uses=1]
  %tmp3 = extractelement <4 x float> %3, i32 2    ; <float> [#uses=1]
  %17 = fpext float %tmp3 to double               ; <double> [#uses=1]
  %tmp5 = extractelement <4 x float> %3, i32 1    ; <float> [#uses=1]
  %18 = fpext float %tmp5 to double               ; <double> [#uses=1]
  %tmp7 = extractelement <4 x float> %3, i32 0    ; <float> [#uses=1]
  %19 = fpext float %tmp7 to double               ; <double> [#uses=1]
  %20 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %19, double %18, double %17, double %16) nounwind ; <i32> [#uses=0]
  %tmp12 = extractelement <4 x float> %9, i32 3   ; <float> [#uses=1]
  %21 = fpext float %tmp12 to double              ; <double> [#uses=1]
  %tmp14 = extractelement <4 x float> %9, i32 2   ; <float> [#uses=1]
  %22 = fpext float %tmp14 to double              ; <double> [#uses=1]
  %tmp16 = extractelement <4 x float> %9, i32 1   ; <float> [#uses=1]
  %23 = fpext float %tmp16 to double              ; <double> [#uses=1]
  %tmp18 = extractelement <4 x float> %9, i32 0   ; <float> [#uses=1]
  %24 = fpext float %tmp18 to double              ; <double> [#uses=1]
  %25 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %24, double %23, double %22, double %21) nounwind ; <i32> [#uses=0]
  %tmp25 = extractelement <4 x float> %13, i32 3  ; <float> [#uses=1]
  %26 = fpext float %tmp25 to double              ; <double> [#uses=1]
  %tmp27 = extractelement <4 x float> %13, i32 2  ; <float> [#uses=1]
  %27 = fpext float %tmp27 to double              ; <double> [#uses=1]
  %tmp29 = extractelement <4 x float> %13, i32 1  ; <float> [#uses=1]
  %28 = fpext float %tmp29 to double              ; <double> [#uses=1]
  %tmp31 = extractelement <4 x float> %13, i32 0  ; <float> [#uses=1]
  %29 = fpext float %tmp31 to double              ; <double> [#uses=1]
  %30 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %29, double %28, double %27, double %26) nounwind ; <i32> [#uses=0]
  ret i32 0
}
