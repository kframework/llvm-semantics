; ModuleID = 'flops-1.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str1 = private constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00", align 1 ; <[47 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"                            (usec)\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [36 x i8] c"     1   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1 ; <[36 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @putchar(i32 10) nounwind    ; <i32> [#uses=0]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb ] ; <i32> [#uses=1]
  %s.03 = phi double [ 0.000000e+00, %entry ], [ %17, %bb ] ; <double> [#uses=1]
  %v.02 = phi double [ 0.000000e+00, %entry ], [ %4, %bb ] ; <double> [#uses=1]
  %4 = fadd double %v.02, 1.000000e+00            ; <double> [#uses=2]
  %5 = fmul double %4, 3.200000e-09               ; <double> [#uses=5]
  %6 = fmul double %5, 1.233153e-06               ; <double> [#uses=1]
  %7 = fadd double %6, 9.600000e-04               ; <double> [#uses=1]
  %8 = fmul double %7, %5                         ; <double> [#uses=1]
  %9 = fadd double %8, 0x3FA47AE143138374         ; <double> [#uses=1]
  %10 = fmul double %5, 4.110510e-07              ; <double> [#uses=1]
  %11 = fadd double %10, 4.800000e-04             ; <double> [#uses=1]
  %12 = fmul double %11, %5                       ; <double> [#uses=1]
  %13 = fadd double %12, 0x3FA47AE143138374       ; <double> [#uses=1]
  %14 = fmul double %13, %5                       ; <double> [#uses=1]
  %15 = fadd double %14, 1.000000e+00             ; <double> [#uses=1]
  %16 = fdiv double %9, %15                       ; <double> [#uses=1]
  %17 = fadd double %16, %s.03                    ; <double> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 312499999 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  %18 = fmul double %17, 2.000000e+00             ; <double> [#uses=1]
  %19 = fadd double %18, 0x3FB4516F9E23A8CA       ; <double> [#uses=1]
  %20 = fmul double %19, 3.200000e-09             ; <double> [#uses=1]
  %21 = fdiv double %20, 2.000000e+00             ; <double> [#uses=1]
  %22 = fdiv double 1.000000e+00, %21             ; <double> [#uses=1]
  %23 = fadd double %22, -2.520000e+01            ; <double> [#uses=1]
  %24 = fmul double %23, 1.000000e-30             ; <double> [#uses=1]
  %25 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0), double %24, double 0.000000e+00, double 0.000000e+00) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @putchar(i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
