; ModuleID = 'flops-3.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str1 = private constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00", align 1 ; <[47 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"                            (usec)\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [36 x i8] c"     3   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1 ; <[36 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @putchar(i32 10) nounwind    ; <i32> [#uses=0]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb ] ; <i32> [#uses=1]
  %s.03 = phi double [ 0.000000e+00, %entry ], [ %20, %bb ] ; <double> [#uses=1]
  %v.02 = phi double [ 0.000000e+00, %entry ], [ %4, %bb ] ; <double> [#uses=1]
  %4 = fadd double %v.02, 1.000000e+00            ; <double> [#uses=2]
  %5 = fmul double %4, 0x3E2CC8FF6689D97D         ; <double> [#uses=3]
  %6 = fmul double %5, %5                         ; <double> [#uses=6]
  %7 = fmul double %6, 0x3DE68DF75229C1A6         ; <double> [#uses=1]
  %8 = fadd double %7, 0xBE5AEB5A8CF8A426         ; <double> [#uses=1]
  %9 = fmul double %8, %6                         ; <double> [#uses=1]
  %10 = fadd double %9, 0x3EC71DF284AA3566        ; <double> [#uses=1]
  %11 = fmul double %10, %6                       ; <double> [#uses=1]
  %12 = fadd double %11, 0xBF2A01A03FB1CA71       ; <double> [#uses=1]
  %13 = fmul double %12, %6                       ; <double> [#uses=1]
  %14 = fadd double %13, 0x3F811111113AE9A3       ; <double> [#uses=1]
  %15 = fmul double %14, %6                       ; <double> [#uses=1]
  %16 = fadd double %15, 0xBFC5555555559705       ; <double> [#uses=1]
  %17 = fmul double %16, %6                       ; <double> [#uses=1]
  %18 = fadd double %17, 1.000000e+00             ; <double> [#uses=1]
  %19 = fmul double %18, %5                       ; <double> [#uses=1]
  %20 = fadd double %19, %s.03                    ; <double> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 312499999 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  %21 = fmul double %20, 2.000000e+00             ; <double> [#uses=1]
  %22 = fadd double %21, 0x3FEBB67AE8584BAD       ; <double> [#uses=1]
  %23 = fmul double %22, 0x3E2CC8FF6689D97D       ; <double> [#uses=1]
  %24 = fdiv double %23, 2.000000e+00             ; <double> [#uses=1]
  %25 = fadd double %24, -5.000000e-01            ; <double> [#uses=1]
  %26 = fmul double %25, 1.000000e-30             ; <double> [#uses=1]
  %27 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0), double %26, double 0.000000e+00, double 0.000000e+00) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @putchar(i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
