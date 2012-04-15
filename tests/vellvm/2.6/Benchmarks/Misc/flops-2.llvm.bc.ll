; ModuleID = 'flops-2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str1 = private constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00", align 1 ; <[47 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"                            (usec)\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [36 x i8] c"     2   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1 ; <[36 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @putchar(i32 10) nounwind    ; <i32> [#uses=0]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar22 = phi i32 [ 0, %entry ], [ %indvar.next23, %bb ] ; <i32> [#uses=1]
  %sa.tmp.015 = phi double [ -1.000000e+00, %entry ], [ %4, %bb ] ; <double> [#uses=1]
  %s.011 = phi double [ -5.000000e+00, %entry ], [ %s.0, %bb ] ; <double> [#uses=2]
  %.pn9 = phi double [ 5.000000e+00, %entry ], [ %s.011, %bb ] ; <double> [#uses=1]
  %4 = fadd double %sa.tmp.015, %.pn9             ; <double> [#uses=2]
  %s.0 = fsub double -0.000000e+00, %s.011        ; <double> [#uses=2]
  %indvar.next23 = add i32 %indvar22, 1           ; <i32> [#uses=2]
  %exitcond24 = icmp eq i32 %indvar.next23, 156250000 ; <i1> [#uses=1]
  br i1 %exitcond24, label %bb3, label %bb

bb3:                                              ; preds = %bb3, %bb
  %indvar = phi i32 [ %indvar.next, %bb3 ], [ 0, %bb ] ; <i32> [#uses=1]
  %s.15 = phi double [ %5, %bb3 ], [ %s.0, %bb ]  ; <double> [#uses=1]
  %u.04 = phi double [ %6, %bb3 ], [ %4, %bb ]    ; <double> [#uses=1]
  %v.02 = phi double [ %8, %bb3 ], [ 0.000000e+00, %bb ] ; <double> [#uses=1]
  %w.01 = phi double [ %10, %bb3 ], [ 0.000000e+00, %bb ] ; <double> [#uses=1]
  %5 = fsub double -0.000000e+00, %s.15           ; <double> [#uses=3]
  %6 = fadd double %u.04, 2.000000e+00            ; <double> [#uses=3]
  %7 = fmul double %6, %5                         ; <double> [#uses=1]
  %8 = fsub double %v.02, %7                      ; <double> [#uses=5]
  %9 = fdiv double %5, %6                         ; <double> [#uses=1]
  %10 = fadd double %9, %w.01                     ; <double> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 156250000 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4.bb5_crit_edge, label %bb3

bb4.bb5_crit_edge:                                ; preds = %bb3
  %11 = fmul double %10, 4.000000e+00             ; <double> [#uses=1]
  %12 = fdiv double %11, 5.000000e+00             ; <double> [#uses=1]
  %13 = fdiv double 5.000000e+00, %8              ; <double> [#uses=1]
  %14 = fadd double %13, %12                      ; <double> [#uses=1]
  %15 = fmul double %8, %8                        ; <double> [#uses=1]
  %16 = fmul double %15, %8                       ; <double> [#uses=1]
  %17 = fdiv double 3.125000e+01, %16             ; <double> [#uses=1]
  %18 = fsub double %14, %17                      ; <double> [#uses=1]
  %19 = fadd double %18, 0xC00921FB54442D18       ; <double> [#uses=1]
  %20 = fmul double %19, 1.000000e-30             ; <double> [#uses=1]
  %21 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0), double %20, double 0.000000e+00, double 0.000000e+00) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @putchar(i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
