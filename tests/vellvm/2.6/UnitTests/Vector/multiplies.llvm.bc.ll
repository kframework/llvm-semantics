; ModuleID = 'multiplies.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [13 x i8] c"%u %u %u %u\0A\00", align 1 ; <[13 x i8]*> [#uses=1]
@TheArray = internal global [100000 x double] zeroinitializer, align 32 ; <[100000 x double]*> [#uses=5]

define i32 @main(i32 %argc, i8** nocapture %Argv) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %0 = phi i32 [ 0, %entry ], [ %3, %bb ]         ; <i32> [#uses=3]
  %scevgep104 = getelementptr [100000 x double]* @TheArray, i32 0, i32 %0 ; <double*> [#uses=1]
  %1 = uitofp i32 %0 to double                    ; <double> [#uses=1]
  %2 = fmul double %1, 1.234500e+01               ; <double> [#uses=1]
  store double %2, double* %scevgep104, align 8
  %3 = add i32 %0, 1                              ; <i32> [#uses=2]
  %exitcond103 = icmp eq i32 %3, 100000           ; <i1> [#uses=1]
  br i1 %exitcond103, label %bb14.preheader, label %bb

bb13:                                             ; preds = %bb14.preheader, %bb13
  %i.166 = phi i32 [ 0, %bb14.preheader ], [ %6, %bb13 ] ; <i32> [#uses=2]
  %V9.065 = phi <16 x i8> [ %V9.169, %bb14.preheader ], [ %5, %bb13 ] ; <<16 x i8>> [#uses=1]
  %tmp99 = shl i32 %i.166, 1                      ; <i32> [#uses=1]
  %scevgep100 = getelementptr [100000 x double]* @TheArray, i32 0, i32 %tmp99 ; <double*> [#uses=1]
  %scevgep100101 = bitcast double* %scevgep100 to <16 x i8>* ; <<16 x i8>*> [#uses=1]
  %4 = load <16 x i8>* %scevgep100101, align 16   ; <<16 x i8>> [#uses=1]
  %5 = mul <16 x i8> %4, %V9.065                  ; <<16 x i8>> [#uses=3]
  %6 = add i32 %i.166, 1                          ; <i32> [#uses=2]
  %exitcond98 = icmp eq i32 %6, 50000             ; <i1> [#uses=1]
  br i1 %exitcond98, label %bb15, label %bb13

bb15:                                             ; preds = %bb13
  %7 = add i32 %j.070, 1                          ; <i32> [#uses=2]
  %exitcond102 = icmp eq i32 %7, 1000             ; <i1> [#uses=1]
  br i1 %exitcond102, label %bb17, label %bb14.preheader

bb14.preheader:                                   ; preds = %bb15, %bb
  %j.070 = phi i32 [ %7, %bb15 ], [ 0, %bb ]      ; <i32> [#uses=1]
  %V9.169 = phi <16 x i8> [ %5, %bb15 ], [ zeroinitializer, %bb ] ; <<16 x i8>> [#uses=1]
  br label %bb13

bb17:                                             ; preds = %bb15
  %8 = bitcast <16 x i8> %5 to <4 x i32>          ; <<4 x i32>> [#uses=4]
  %tmp14 = extractelement <4 x i32> %8, i32 3     ; <i32> [#uses=1]
  %tmp12 = extractelement <4 x i32> %8, i32 2     ; <i32> [#uses=1]
  %tmp10 = extractelement <4 x i32> %8, i32 1     ; <i32> [#uses=1]
  %tmp8 = extractelement <4 x i32> %8, i32 0      ; <i32> [#uses=1]
  %9 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %tmp8, i32 %tmp10, i32 %tmp12, i32 %tmp14) nounwind ; <i32> [#uses=0]
  br label %bb20.preheader

bb19:                                             ; preds = %bb20.preheader, %bb19
  %i.258 = phi i32 [ 0, %bb20.preheader ], [ %12, %bb19 ] ; <i32> [#uses=2]
  %V6.057 = phi <8 x i16> [ %V6.161, %bb20.preheader ], [ %11, %bb19 ] ; <<8 x i16>> [#uses=1]
  %tmp93 = shl i32 %i.258, 1                      ; <i32> [#uses=1]
  %scevgep94 = getelementptr [100000 x double]* @TheArray, i32 0, i32 %tmp93 ; <double*> [#uses=1]
  %scevgep9495 = bitcast double* %scevgep94 to <8 x i16>* ; <<8 x i16>*> [#uses=1]
  %10 = load <8 x i16>* %scevgep9495, align 16    ; <<8 x i16>> [#uses=1]
  %11 = mul <8 x i16> %10, %V6.057                ; <<8 x i16>> [#uses=3]
  %12 = add i32 %i.258, 1                         ; <i32> [#uses=2]
  %exitcond92 = icmp eq i32 %12, 50000            ; <i1> [#uses=1]
  br i1 %exitcond92, label %bb21, label %bb19

bb21:                                             ; preds = %bb19
  %13 = add i32 %j.162, 1                         ; <i32> [#uses=2]
  %exitcond96 = icmp eq i32 %13, 1000             ; <i1> [#uses=1]
  br i1 %exitcond96, label %bb23, label %bb20.preheader

bb20.preheader:                                   ; preds = %bb21, %bb17
  %j.162 = phi i32 [ 0, %bb17 ], [ %13, %bb21 ]   ; <i32> [#uses=1]
  %V6.161 = phi <8 x i16> [ zeroinitializer, %bb17 ], [ %11, %bb21 ] ; <<8 x i16>> [#uses=1]
  br label %bb19

bb23:                                             ; preds = %bb21
  %14 = bitcast <8 x i16> %11 to <4 x i32>        ; <<4 x i32>> [#uses=4]
  %tmp23 = extractelement <4 x i32> %14, i32 3    ; <i32> [#uses=1]
  %tmp21 = extractelement <4 x i32> %14, i32 2    ; <i32> [#uses=1]
  %tmp19 = extractelement <4 x i32> %14, i32 1    ; <i32> [#uses=1]
  %tmp16 = extractelement <4 x i32> %14, i32 0    ; <i32> [#uses=1]
  %15 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %tmp16, i32 %tmp19, i32 %tmp21, i32 %tmp23) nounwind ; <i32> [#uses=0]
  br label %bb26.preheader

bb25:                                             ; preds = %bb26.preheader, %bb25
  %i.350 = phi i32 [ 0, %bb26.preheader ], [ %18, %bb25 ] ; <i32> [#uses=2]
  %V3.049 = phi <4 x i32> [ %V3.153, %bb26.preheader ], [ %17, %bb25 ] ; <<4 x i32>> [#uses=1]
  %tmp87 = shl i32 %i.350, 1                      ; <i32> [#uses=1]
  %scevgep88 = getelementptr [100000 x double]* @TheArray, i32 0, i32 %tmp87 ; <double*> [#uses=1]
  %scevgep8889 = bitcast double* %scevgep88 to <4 x i32>* ; <<4 x i32>*> [#uses=1]
  %16 = load <4 x i32>* %scevgep8889, align 16    ; <<4 x i32>> [#uses=1]
  %17 = mul <4 x i32> %16, %V3.049                ; <<4 x i32>> [#uses=6]
  %18 = add i32 %i.350, 1                         ; <i32> [#uses=2]
  %exitcond86 = icmp eq i32 %18, 50000            ; <i1> [#uses=1]
  br i1 %exitcond86, label %bb27, label %bb25

bb27:                                             ; preds = %bb25
  %19 = add i32 %j.254, 1                         ; <i32> [#uses=2]
  %exitcond90 = icmp eq i32 %19, 1000             ; <i1> [#uses=1]
  br i1 %exitcond90, label %bb29, label %bb26.preheader

bb26.preheader:                                   ; preds = %bb27, %bb23
  %j.254 = phi i32 [ 0, %bb23 ], [ %19, %bb27 ]   ; <i32> [#uses=1]
  %V3.153 = phi <4 x i32> [ zeroinitializer, %bb23 ], [ %17, %bb27 ] ; <<4 x i32>> [#uses=1]
  br label %bb25

bb29:                                             ; preds = %bb27
  %tmp32 = extractelement <4 x i32> %17, i32 3    ; <i32> [#uses=1]
  %tmp30 = extractelement <4 x i32> %17, i32 2    ; <i32> [#uses=1]
  %tmp28 = extractelement <4 x i32> %17, i32 1    ; <i32> [#uses=1]
  %tmp25 = extractelement <4 x i32> %17, i32 0    ; <i32> [#uses=1]
  %20 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %tmp25, i32 %tmp28, i32 %tmp30, i32 %tmp32) nounwind ; <i32> [#uses=0]
  br label %bb32.preheader

bb31:                                             ; preds = %bb32.preheader, %bb31
  %i.443 = phi i32 [ 0, %bb32.preheader ], [ %23, %bb31 ] ; <i32> [#uses=2]
  %V.042 = phi <4 x i32> [ %V.145, %bb32.preheader ], [ %22, %bb31 ] ; <<4 x i32>> [#uses=1]
  %tmp = shl i32 %i.443, 1                        ; <i32> [#uses=1]
  %scevgep = getelementptr [100000 x double]* @TheArray, i32 0, i32 %tmp ; <double*> [#uses=1]
  %scevgep83 = bitcast double* %scevgep to <4 x i32>* ; <<4 x i32>*> [#uses=1]
  %21 = load <4 x i32>* %scevgep83, align 16      ; <<4 x i32>> [#uses=1]
  %22 = mul <4 x i32> %21, %V.042                 ; <<4 x i32>> [#uses=6]
  %23 = add i32 %i.443, 1                         ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %23, 50000              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb33, label %bb31

bb33:                                             ; preds = %bb31
  %24 = add i32 %j.346, 1                         ; <i32> [#uses=2]
  %exitcond84 = icmp eq i32 %24, 1000             ; <i1> [#uses=1]
  br i1 %exitcond84, label %bb35, label %bb32.preheader

bb32.preheader:                                   ; preds = %bb33, %bb29
  %j.346 = phi i32 [ 0, %bb29 ], [ %24, %bb33 ]   ; <i32> [#uses=1]
  %V.145 = phi <4 x i32> [ zeroinitializer, %bb29 ], [ %22, %bb33 ] ; <<4 x i32>> [#uses=1]
  br label %bb31

bb35:                                             ; preds = %bb33
  %tmp41 = extractelement <4 x i32> %22, i32 3    ; <i32> [#uses=1]
  %tmp39 = extractelement <4 x i32> %22, i32 2    ; <i32> [#uses=1]
  %tmp37 = extractelement <4 x i32> %22, i32 1    ; <i32> [#uses=1]
  %tmp34 = extractelement <4 x i32> %22, i32 0    ; <i32> [#uses=1]
  %25 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %tmp34, i32 %tmp37, i32 %tmp39, i32 %tmp41) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
