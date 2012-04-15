; ModuleID = 'flops-7.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str1 = private constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00", align 1 ; <[47 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"                            (usec)\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [36 x i8] c"     7   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1 ; <[36 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @putchar(i32 10) nounwind    ; <i32> [#uses=0]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %i.01, %bb ] ; <i32> [#uses=1]
  %s.02 = phi double [ 0.000000e+00, %entry ], [ %16, %bb ] ; <double> [#uses=1]
  %i.01 = add i32 %indvar, 1                      ; <i32> [#uses=3]
  %4 = sitofp i32 %i.01 to double                 ; <double> [#uses=1]
  %5 = fmul double %4, 0x3EA5F9C4FF20F589         ; <double> [#uses=5]
  %6 = fmul double %5, %5                         ; <double> [#uses=3]
  %7 = fadd double %5, 1.000000e+00               ; <double> [#uses=1]
  %8 = fdiv double 1.000000e+00, %7               ; <double> [#uses=1]
  %9 = fsub double %s.02, %8                      ; <double> [#uses=1]
  %10 = fadd double %6, 1.000000e+00              ; <double> [#uses=1]
  %11 = fdiv double %5, %10                       ; <double> [#uses=1]
  %12 = fsub double %9, %11                       ; <double> [#uses=1]
  %13 = fmul double %5, %6                        ; <double> [#uses=1]
  %14 = fadd double %13, 1.000000e+00             ; <double> [#uses=1]
  %15 = fdiv double %6, %14                       ; <double> [#uses=1]
  %16 = fsub double %12, %15                      ; <double> [#uses=2]
  %exitcond = icmp eq i32 %i.01, 156249999        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  %17 = fmul double %16, 2.000000e+00             ; <double> [#uses=1]
  %18 = fadd double %17, 0xBFF077B0376BD1B6       ; <double> [#uses=1]
  %19 = fmul double %18, 0x3EE8B8FD9F05143A       ; <double> [#uses=1]
  %20 = fadd double %19, 5.002000e+02             ; <double> [#uses=1]
  %21 = fmul double %20, 1.000000e-30             ; <double> [#uses=1]
  %22 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0), double %21, double 0.000000e+00, double 0.000000e+00) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @putchar(i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
