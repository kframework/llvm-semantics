; ModuleID = 'RealMM.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { double, double }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@rma = internal global [41 x [41 x double]] zeroinitializer, align 32 ; <[41 x [41 x double]]*> [#uses=2]
@rmb = internal global [41 x [41 x double]] zeroinitializer, align 32 ; <[41 x [41 x double]]*> [#uses=2]
@rmr = internal global [41 x [41 x double]] zeroinitializer, align 32 ; <[41 x [41 x double]]*> [#uses=2]
@.str = private constant [4 x i8] c"%f\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Mm.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %20, %Mm.exit ]   ; <i32> [#uses=1]
  br label %bb2.preheader.i17.i

bb1.i11.i:                                        ; preds = %bb2.preheader.i17.i, %bb1.i11.i
  %indvar.i6.i = phi i32 [ 0, %bb2.preheader.i17.i ], [ %tmp44.i, %bb1.i11.i ] ; <i32> [#uses=1]
  %seed.tmp.0.i7.i = phi i32 [ %seed.tmp.1.i15.i, %bb2.preheader.i17.i ], [ %3, %bb1.i11.i ] ; <i32> [#uses=1]
  %tmp44.i = add i32 %indvar.i6.i, 1              ; <i32> [#uses=3]
  %scevgep.i9.i = getelementptr [41 x [41 x double]]* @rma, i32 0, i32 %tmp43.i, i32 %tmp44.i ; <double*> [#uses=1]
  %1 = mul i32 %seed.tmp.0.i7.i, 1309             ; <i32> [#uses=1]
  %2 = add nsw i32 %1, 13849                      ; <i32> [#uses=1]
  %3 = and i32 %2, 65535                          ; <i32> [#uses=4]
  %4 = urem i32 %3, 120                           ; <i32> [#uses=1]
  %5 = add i32 %4, -60                            ; <i32> [#uses=1]
  %6 = sitofp i32 %5 to double                    ; <double> [#uses=1]
  %7 = fdiv double %6, 3.000000e+00               ; <double> [#uses=1]
  store double %7, double* %scevgep.i9.i, align 8
  %exitcond42.i = icmp eq i32 %tmp44.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond42.i, label %bb3.i13.i, label %bb1.i11.i

bb3.i13.i:                                        ; preds = %bb1.i11.i
  %exitcond46.i = icmp eq i32 %tmp43.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond46.i, label %bb2.preheader.i.i, label %bb2.preheader.i17.i

bb2.preheader.i17.i:                              ; preds = %bb3.i13.i, %bb
  %indvar7.i14.i = phi i32 [ 0, %bb ], [ %tmp43.i, %bb3.i13.i ] ; <i32> [#uses=1]
  %seed.tmp.1.i15.i = phi i32 [ 74755, %bb ], [ %3, %bb3.i13.i ] ; <i32> [#uses=1]
  %tmp43.i = add i32 %indvar7.i14.i, 1            ; <i32> [#uses=3]
  br label %bb1.i11.i

bb1.i.i:                                          ; preds = %bb2.preheader.i.i, %bb1.i.i
  %indvar.i1.i = phi i32 [ 0, %bb2.preheader.i.i ], [ %tmp37.i, %bb1.i.i ] ; <i32> [#uses=1]
  %seed.tmp.0.i.i = phi i32 [ %seed.tmp.1.i.i, %bb2.preheader.i.i ], [ %10, %bb1.i.i ] ; <i32> [#uses=1]
  %tmp37.i = add i32 %indvar.i1.i, 1              ; <i32> [#uses=3]
  %scevgep.i2.i = getelementptr [41 x [41 x double]]* @rmb, i32 0, i32 %tmp36.i, i32 %tmp37.i ; <double*> [#uses=1]
  %8 = mul i32 %seed.tmp.0.i.i, 1309              ; <i32> [#uses=1]
  %9 = add nsw i32 %8, 13849                      ; <i32> [#uses=1]
  %10 = and i32 %9, 65535                         ; <i32> [#uses=3]
  %11 = urem i32 %10, 120                         ; <i32> [#uses=1]
  %12 = add i32 %11, -60                          ; <i32> [#uses=1]
  %13 = sitofp i32 %12 to double                  ; <double> [#uses=1]
  %14 = fdiv double %13, 3.000000e+00             ; <double> [#uses=1]
  store double %14, double* %scevgep.i2.i, align 8
  %exitcond35.i = icmp eq i32 %tmp37.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond35.i, label %bb3.i.i, label %bb1.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %exitcond39.i = icmp eq i32 %tmp36.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond39.i, label %bb2.preheader.i, label %bb2.preheader.i.i

bb2.preheader.i.i:                                ; preds = %bb3.i.i, %bb3.i13.i
  %indvar7.i.i = phi i32 [ %tmp36.i, %bb3.i.i ], [ 0, %bb3.i13.i ] ; <i32> [#uses=1]
  %seed.tmp.1.i.i = phi i32 [ %10, %bb3.i.i ], [ %3, %bb3.i13.i ] ; <i32> [#uses=1]
  %tmp36.i = add i32 %indvar7.i.i, 1              ; <i32> [#uses=3]
  br label %bb1.i.i

bb1.i:                                            ; preds = %bb2.preheader.i, %rInnerproduct.exit.i
  %indvar26.i = phi i32 [ 0, %bb2.preheader.i ], [ %tmp28.i, %rInnerproduct.exit.i ] ; <i32> [#uses=1]
  %tmp28.i = add i32 %indvar26.i, 1               ; <i32> [#uses=4]
  %scevgep.i = getelementptr [41 x [41 x double]]* @rmr, i32 0, i32 %tmp.i, i32 %tmp28.i ; <double*> [#uses=2]
  store double 0.000000e+00, double* %scevgep.i, align 8
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb1.i
  %15 = phi double [ 0.000000e+00, %bb1.i ], [ %19, %bb.i.i ] ; <double> [#uses=1]
  %indvar.i.i = phi i32 [ 0, %bb1.i ], [ %tmp25.i, %bb.i.i ] ; <i32> [#uses=1]
  %tmp25.i = add i32 %indvar.i.i, 1               ; <i32> [#uses=4]
  %scevgep.i.i = getelementptr [41 x [41 x double]]* @rma, i32 0, i32 %tmp.i, i32 %tmp25.i ; <double*> [#uses=1]
  %scevgep2.i.i = getelementptr [41 x [41 x double]]* @rmb, i32 0, i32 %tmp25.i, i32 %tmp28.i ; <double*> [#uses=1]
  %16 = load double* %scevgep.i.i, align 8        ; <double> [#uses=1]
  %17 = load double* %scevgep2.i.i, align 8       ; <double> [#uses=1]
  %18 = fmul double %16, %17                      ; <double> [#uses=1]
  %19 = fadd double %15, %18                      ; <double> [#uses=2]
  %exitcond.i = icmp eq i32 %tmp25.i, 40          ; <i1> [#uses=1]
  br i1 %exitcond.i, label %rInnerproduct.exit.i, label %bb.i.i

rInnerproduct.exit.i:                             ; preds = %bb.i.i
  store double %19, double* %scevgep.i, align 8
  %exitcond29.i = icmp eq i32 %tmp28.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond29.i, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %rInnerproduct.exit.i
  %exitcond32.i = icmp eq i32 %tmp.i, 40          ; <i1> [#uses=1]
  br i1 %exitcond32.i, label %Mm.exit, label %bb2.preheader.i

bb2.preheader.i:                                  ; preds = %bb3.i, %bb3.i.i
  %indvar.i = phi i32 [ %tmp.i, %bb3.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=4]
  br label %bb1.i

Mm.exit:                                          ; preds = %bb3.i
  %20 = add nsw i32 %0, 1                         ; <i32> [#uses=4]
  %21 = getelementptr inbounds [41 x [41 x double]]* @rmr, i32 0, i32 %20, i32 %20 ; <double*> [#uses=1]
  %22 = load double* %21, align 8                 ; <double> [#uses=1]
  %23 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %22) nounwind ; <i32> [#uses=0]
  %exitcond = icmp eq i32 %20, 10                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Mm.exit
  ret i32 0
}
