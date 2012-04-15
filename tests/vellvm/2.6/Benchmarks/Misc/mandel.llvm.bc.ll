; ModuleID = 'mandel.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { double, double }

@accum = internal global %0 zeroinitializer, align 8 ; <%0*> [#uses=2]
@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare double @hypot(double, double) nounwind readonly

define i32 @main() nounwind {
entry:
  br label %bb62.preheader.i

bb1.i:                                            ; preds = %bb62.preheader.i, %bb60.i
  %0 = phi i32 [ 0, %bb62.preheader.i ], [ %19, %bb60.i ] ; <i32> [#uses=2]
  %1 = sitofp i32 %0 to double                    ; <double> [#uses=1]
  %2 = fmul double %1, 4.000000e+00               ; <double> [#uses=1]
  %3 = fdiv double %2, -5.000000e+03              ; <double> [#uses=1]
  %4 = fadd double %3, -2.000000e+00              ; <double> [#uses=2]
  %5 = fmul double %4, 0.000000e+00               ; <double> [#uses=1]
  %6 = fadd double %4, 0.000000e+00               ; <double> [#uses=1]
  %tmpr.i = fadd double %25, %5                   ; <double> [#uses=1]
  br label %bb59.i

bb31.i:                                           ; preds = %bb59.i
  %7 = fmul double %z.0.0.i, %z.0.0.i             ; <double> [#uses=1]
  %8 = fmul double %z.1.0.i, %z.1.0.i             ; <double> [#uses=1]
  %9 = fsub double %7, %8                         ; <double> [#uses=1]
  %10 = fmul double %z.0.0.i, %z.1.0.i            ; <double> [#uses=2]
  %11 = fadd double %10, %10                      ; <double> [#uses=1]
  %tmpr54.i = fadd double %9, %tmpr.i             ; <double> [#uses=3]
  %tmpi55.i = fadd double %11, %6                 ; <double> [#uses=3]
  %12 = tail call double @hypot(double %tmpr54.i, double %tmpi55.i) nounwind readonly ; <double> [#uses=1]
  %13 = fcmp ult double %12, 2.000000e+00         ; <i1> [#uses=1]
  br i1 %13, label %bb58.i, label %bb60.i

bb58.i:                                           ; preds = %bb31.i
  %14 = add i32 %15, 1                            ; <i32> [#uses=1]
  br label %bb59.i

bb59.i:                                           ; preds = %bb58.i, %bb1.i
  %z.1.0.i = phi double [ 0.000000e+00, %bb1.i ], [ %tmpi55.i, %bb58.i ] ; <double> [#uses=4]
  %z.0.0.i = phi double [ 0.000000e+00, %bb1.i ], [ %tmpr54.i, %bb58.i ] ; <double> [#uses=4]
  %15 = phi i32 [ 0, %bb1.i ], [ %14, %bb58.i ]   ; <i32> [#uses=2]
  %16 = icmp sgt i32 %15, 9                       ; <i1> [#uses=1]
  br i1 %16, label %bb60.i, label %bb31.i

bb60.i:                                           ; preds = %bb59.i, %bb31.i
  %z.1.1.i = phi double [ %tmpi55.i, %bb31.i ], [ %z.1.0.i, %bb59.i ] ; <double> [#uses=1]
  %z.0.1.i = phi double [ %tmpr54.i, %bb31.i ], [ %z.0.0.i, %bb59.i ] ; <double> [#uses=1]
  %17 = volatile load double* getelementptr inbounds (%0* @accum, i32 0, i32 0), align 8 ; <double> [#uses=1]
  %18 = volatile load double* getelementptr inbounds (%0* @accum, i32 0, i32 1), align 8 ; <double> [#uses=1]
  %tmpr.i.i = fadd double %17, %z.0.1.i           ; <double> [#uses=1]
  %tmpi.i.i = fadd double %18, %z.1.1.i           ; <double> [#uses=1]
  volatile store double %tmpr.i.i, double* getelementptr inbounds (%0* @accum, i32 0, i32 0), align 8
  volatile store double %tmpi.i.i, double* getelementptr inbounds (%0* @accum, i32 0, i32 1), align 8
  %19 = add nsw i32 %0, 1                         ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %19, 5000             ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb63.i, label %bb1.i

bb63.i:                                           ; preds = %bb60.i
  %20 = add i32 %21, 1                            ; <i32> [#uses=2]
  %exitcond13.i = icmp eq i32 %20, 5000           ; <i1> [#uses=1]
  br i1 %exitcond13.i, label %mandel.exit, label %bb62.preheader.i

bb62.preheader.i:                                 ; preds = %bb63.i, %entry
  %21 = phi i32 [ 0, %entry ], [ %20, %bb63.i ]   ; <i32> [#uses=2]
  %22 = sitofp i32 %21 to double                  ; <double> [#uses=1]
  %23 = fmul double %22, 4.000000e+00             ; <double> [#uses=1]
  %24 = fdiv double %23, 5.000000e+03             ; <double> [#uses=1]
  %25 = fadd double %24, -2.000000e+00            ; <double> [#uses=1]
  br label %bb1.i

mandel.exit:                                      ; preds = %bb63.i
  %26 = volatile load double* getelementptr inbounds (%0* @accum, i32 0, i32 0), align 8 ; <double> [#uses=1]
  %27 = fptosi double %26 to i32                  ; <i32> [#uses=1]
  %28 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %27) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
