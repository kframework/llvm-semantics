; ModuleID = 'sumarray-dbl.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.Array = type { [100 x <8 x double>] }

@.str = private constant [25 x i8] c"%g %g %g %g %g %g %g %g\0A\00", align 1 ; <[25 x i8]*> [#uses=1]
@TheArray = internal global %struct.Array zeroinitializer, align 64 ; <%struct.Array*> [#uses=2]

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %0 = phi i32 [ 0, %entry ], [ %3, %bb ]         ; <i32> [#uses=3]
  %tmp = shl i32 %0, 3                            ; <i32> [#uses=1]
  %uglygep = getelementptr i8* bitcast (%struct.Array* @TheArray to i8*), i32 %tmp ; <i8*> [#uses=1]
  %uglygep23 = bitcast i8* %uglygep to double*    ; <double*> [#uses=1]
  %1 = sitofp i32 %0 to double                    ; <double> [#uses=1]
  %2 = fmul double %1, 1.234500e+01               ; <double> [#uses=1]
  store double %2, double* %uglygep23, align 8
  %3 = add nsw i32 %0, 1                          ; <i32> [#uses=2]
  %exitcond22 = icmp eq i32 %3, 800               ; <i1> [#uses=1]
  br i1 %exitcond22, label %bb3, label %bb

bb3:                                              ; preds = %bb3, %bb
  %i.117 = phi i32 [ %6, %bb3 ], [ 0, %bb ]       ; <i32> [#uses=2]
  %sum.016 = phi <8 x double> [ %5, %bb3 ], [ zeroinitializer, %bb ] ; <<8 x double>> [#uses=1]
  %scevgep = getelementptr %struct.Array* @TheArray, i32 0, i32 0, i32 %i.117 ; <<8 x double>*> [#uses=1]
  %4 = load <8 x double>* %scevgep, align 64      ; <<8 x double>> [#uses=1]
  %5 = fadd <8 x double> %4, %sum.016             ; <<8 x double>> [#uses=9]
  %6 = add nsw i32 %i.117, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %6, 100                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb3

bb5:                                              ; preds = %bb3
  %tmp15 = extractelement <8 x double> %5, i32 7  ; <double> [#uses=1]
  %tmp13 = extractelement <8 x double> %5, i32 6  ; <double> [#uses=1]
  %tmp11 = extractelement <8 x double> %5, i32 5  ; <double> [#uses=1]
  %tmp9 = extractelement <8 x double> %5, i32 4   ; <double> [#uses=1]
  %tmp7 = extractelement <8 x double> %5, i32 3   ; <double> [#uses=1]
  %tmp5 = extractelement <8 x double> %5, i32 2   ; <double> [#uses=1]
  %tmp3 = extractelement <8 x double> %5, i32 1   ; <double> [#uses=1]
  %tmp1 = extractelement <8 x double> %5, i32 0   ; <double> [#uses=1]
  %7 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), double %tmp1, double %tmp3, double %tmp5, double %tmp7, double %tmp9, double %tmp11, double %tmp13, double %tmp15) nounwind ; <i32> [#uses=0]
  ret i32 0
}
