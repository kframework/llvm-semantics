; ModuleID = 'build.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [13 x i8] c"%f %f %f %f\0A\00", align 1 ; <[13 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %Argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 1123                    ; <i1> [#uses=1]
  %X.0 = select i1 %0, float 0x40030E9A20000000, float 0x3FF3BE76C0000000 ; <float> [#uses=5]
  %1 = insertelement <4 x float> undef, float %X.0, i32 0 ; <<4 x float>> [#uses=1]
  %2 = insertelement <4 x float> %1, float %X.0, i32 1 ; <<4 x float>> [#uses=2]
  %3 = insertelement <4 x float> %2, float %X.0, i32 2 ; <<4 x float>> [#uses=1]
  %4 = insertelement <4 x float> %3, float %X.0, i32 3 ; <<4 x float>> [#uses=2]
  %5 = fpext float %X.0 to double                 ; <double> [#uses=6]
  %6 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %5, double %5, double %5, double %5) nounwind ; <i32> [#uses=0]
  %7 = fmul <4 x float> %4, %4                    ; <<4 x float>> [#uses=4]
  %tmp7 = extractelement <4 x float> %7, i32 3    ; <float> [#uses=1]
  %8 = fpext float %tmp7 to double                ; <double> [#uses=1]
  %tmp5 = extractelement <4 x float> %7, i32 2    ; <float> [#uses=1]
  %9 = fpext float %tmp5 to double                ; <double> [#uses=1]
  %tmp3 = extractelement <4 x float> %7, i32 1    ; <float> [#uses=1]
  %10 = fpext float %tmp3 to double               ; <double> [#uses=1]
  %tmp1 = extractelement <4 x float> %7, i32 0    ; <float> [#uses=1]
  %11 = fpext float %tmp1 to double               ; <double> [#uses=1]
  %12 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %11, double %10, double %9, double %8) nounwind ; <i32> [#uses=0]
  %13 = insertelement <4 x float> %2, float 0.000000e+00, i32 2 ; <<4 x float>> [#uses=1]
  %14 = insertelement <4 x float> %13, float 0.000000e+00, i32 3 ; <<4 x float>> [#uses=2]
  %15 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %5, double %5, double 0.000000e+00, double 0.000000e+00) nounwind ; <i32> [#uses=0]
  %16 = fadd <4 x float> %14, %14                 ; <<4 x float>> [#uses=4]
  %tmp23 = extractelement <4 x float> %16, i32 3  ; <float> [#uses=1]
  %17 = fpext float %tmp23 to double              ; <double> [#uses=1]
  %tmp21 = extractelement <4 x float> %16, i32 2  ; <float> [#uses=1]
  %18 = fpext float %tmp21 to double              ; <double> [#uses=1]
  %tmp19 = extractelement <4 x float> %16, i32 1  ; <float> [#uses=1]
  %19 = fpext float %tmp19 to double              ; <double> [#uses=1]
  %tmp17 = extractelement <4 x float> %16, i32 0  ; <float> [#uses=1]
  %20 = fpext float %tmp17 to double              ; <double> [#uses=1]
  %21 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %20, double %19, double %18, double %17) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
