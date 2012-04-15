; ModuleID = 'flops-5.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [57 x i8] c"   FLOPS C Program (Double Precision), V2.0 18 Dec 1992\0A\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str1 = private constant [47 x i8] c"   Module     Error        RunTime      MFLOPS\00", align 1 ; <[47 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"                            (usec)\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [36 x i8] c"     5   %13.4lf  %10.4lf  %10.4lf\0A\00", align 1 ; <[36 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @putchar(i32 10) nounwind    ; <i32> [#uses=0]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %i.01, %bb ] ; <i32> [#uses=1]
  %s.02 = phi double [ 0.000000e+00, %entry ], [ %33, %bb ] ; <double> [#uses=1]
  %i.01 = add i32 %indvar, 1                      ; <i32> [#uses=3]
  %4 = sitofp i32 %i.01 to double                 ; <double> [#uses=1]
  %5 = fmul double %4, 0x3E3CC8FF6689D97D         ; <double> [#uses=3]
  %6 = fmul double %5, %5                         ; <double> [#uses=12]
  %7 = fmul double %6, 0x3DE68DF75229C1A6         ; <double> [#uses=1]
  %8 = fadd double %7, 0x3E5AEB5A8CF8A426         ; <double> [#uses=1]
  %9 = fmul double %8, %6                         ; <double> [#uses=1]
  %10 = fadd double %9, 0x3EC71DF284AA3566        ; <double> [#uses=1]
  %11 = fmul double %10, %6                       ; <double> [#uses=1]
  %12 = fadd double %11, 0x3F2A01A03FB1CA71       ; <double> [#uses=1]
  %13 = fmul double %12, %6                       ; <double> [#uses=1]
  %14 = fadd double %13, 0x3F811111113AE9A3       ; <double> [#uses=1]
  %15 = fmul double %14, %6                       ; <double> [#uses=1]
  %16 = fadd double %15, 0xBFC5555555559705       ; <double> [#uses=1]
  %17 = fmul double %16, %6                       ; <double> [#uses=1]
  %18 = fadd double %17, 1.000000e+00             ; <double> [#uses=1]
  %19 = fmul double %18, %5                       ; <double> [#uses=1]
  %20 = fmul double %6, 0x3E2157B275DF182A        ; <double> [#uses=1]
  %21 = fadd double %20, 0xBE927BB3D47DDB8E       ; <double> [#uses=1]
  %22 = fmul double %21, %6                       ; <double> [#uses=1]
  %23 = fadd double %22, 0x3EFA019528242DB7       ; <double> [#uses=1]
  %24 = fmul double %23, %6                       ; <double> [#uses=1]
  %25 = fadd double %24, 0xBF56C16BFFE76516       ; <double> [#uses=1]
  %26 = fmul double %25, %6                       ; <double> [#uses=1]
  %27 = fadd double %26, 0x3FA5555555290224       ; <double> [#uses=1]
  %28 = fmul double %27, %6                       ; <double> [#uses=1]
  %29 = fadd double %28, 0xBFDFFFFFFFFF8156       ; <double> [#uses=1]
  %30 = fmul double %29, %6                       ; <double> [#uses=1]
  %31 = fadd double %30, 1.000000e+00             ; <double> [#uses=1]
  %32 = fdiv double %19, %31                      ; <double> [#uses=1]
  %33 = fadd double %32, %s.02                    ; <double> [#uses=2]
  %exitcond = icmp eq i32 %i.01, 156249999        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  %34 = fmul double %33, 2.000000e+00             ; <double> [#uses=1]
  %35 = fadd double %34, 0x3FFBBAF85F5CC464       ; <double> [#uses=1]
  %36 = fmul double %35, 0x3E3CC8FF6689D97D       ; <double> [#uses=1]
  %37 = fdiv double %36, 2.000000e+00             ; <double> [#uses=1]
  %38 = fadd double %37, 0xBFE62E42FEFA39EF       ; <double> [#uses=1]
  %39 = fmul double %38, 1.000000e-30             ; <double> [#uses=1]
  %40 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0), double %39, double 0.000000e+00, double 0.000000e+00) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @putchar(i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
