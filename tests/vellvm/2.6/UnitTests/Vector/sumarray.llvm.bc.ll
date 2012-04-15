; ModuleID = 'sumarray.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.Array = type { [100 x <4 x float>] }

@.str = private constant [13 x i8] c"%f %f %f %f\0A\00", align 1 ; <[13 x i8]*> [#uses=1]
@TheArray = internal global %struct.Array zeroinitializer, align 32 ; <%struct.Array*> [#uses=2]

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %0 = phi i32 [ 0, %entry ], [ %3, %bb ]         ; <i32> [#uses=3]
  %tmp = shl i32 %0, 2                            ; <i32> [#uses=1]
  %uglygep = getelementptr i8* bitcast (%struct.Array* @TheArray to i8*), i32 %tmp ; <i8*> [#uses=1]
  %uglygep15 = bitcast i8* %uglygep to float*     ; <float*> [#uses=1]
  %1 = sitofp i32 %0 to float                     ; <float> [#uses=1]
  %2 = fmul float %1, 0x4028B0A3E0000000          ; <float> [#uses=1]
  store float %2, float* %uglygep15, align 4
  %3 = add nsw i32 %0, 1                          ; <i32> [#uses=2]
  %exitcond14 = icmp eq i32 %3, 400               ; <i1> [#uses=1]
  br i1 %exitcond14, label %bb3, label %bb

bb3:                                              ; preds = %bb3, %bb
  %i.19 = phi i32 [ %6, %bb3 ], [ 0, %bb ]        ; <i32> [#uses=2]
  %sum.08 = phi <4 x float> [ %5, %bb3 ], [ zeroinitializer, %bb ] ; <<4 x float>> [#uses=1]
  %scevgep = getelementptr %struct.Array* @TheArray, i32 0, i32 0, i32 %i.19 ; <<4 x float>*> [#uses=1]
  %4 = load <4 x float>* %scevgep, align 16       ; <<4 x float>> [#uses=1]
  %5 = fadd <4 x float> %4, %sum.08               ; <<4 x float>> [#uses=5]
  %6 = add nsw i32 %i.19, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %6, 100                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb3

bb5:                                              ; preds = %bb3
  %tmp7 = extractelement <4 x float> %5, i32 3    ; <float> [#uses=1]
  %7 = fpext float %tmp7 to double                ; <double> [#uses=1]
  %tmp5 = extractelement <4 x float> %5, i32 2    ; <float> [#uses=1]
  %8 = fpext float %tmp5 to double                ; <double> [#uses=1]
  %tmp3 = extractelement <4 x float> %5, i32 1    ; <float> [#uses=1]
  %9 = fpext float %tmp3 to double                ; <double> [#uses=1]
  %tmp1 = extractelement <4 x float> %5, i32 0    ; <float> [#uses=1]
  %10 = fpext float %tmp1 to double               ; <double> [#uses=1]
  %11 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %10, double %9, double %8, double %7) nounwind ; <i32> [#uses=0]
  ret i32 0
}
