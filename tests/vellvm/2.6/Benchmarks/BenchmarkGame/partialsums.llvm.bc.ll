; ModuleID = 'partialsums.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [9 x i8] c"%.9f\09%s\0A\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str1 = private constant [8 x i8] c"(2/3)^k\00", align 1 ; <[8 x i8]*> [#uses=1]
@.str2 = private constant [7 x i8] c"k^-0.5\00", align 1 ; <[7 x i8]*> [#uses=1]
@.str3 = private constant [9 x i8] c"1/k(k+1)\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str4 = private constant [12 x i8] c"Flint Hills\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str5 = private constant [14 x i8] c"Cookson Hills\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str6 = private constant [9 x i8] c"Harmonic\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str7 = private constant [13 x i8] c"Riemann Zeta\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str8 = private constant [21 x i8] c"Alternating Harmonic\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str9 = private constant [8 x i8] c"Gregory\00", align 1 ; <[8 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %k.023.int, %bb ] ; <i32> [#uses=1]
  %twoThrd.027 = phi double [ 0.000000e+00, %entry ], [ %2, %bb ] ; <double> [#uses=1]
  %sqrts.026 = phi double [ 0.000000e+00, %entry ], [ %5, %bb ] ; <double> [#uses=1]
  %Flint.025 = phi double [ 0.000000e+00, %entry ], [ %13, %bb ] ; <double> [#uses=1]
  %Cookson.024 = phi double [ 0.000000e+00, %entry ], [ %17, %bb ] ; <double> [#uses=1]
  %k.023.int = add i32 %indvar, 1                 ; <i32> [#uses=3]
  %indvar.conv = sitofp i32 %k.023.int to double  ; <double> [#uses=7]
  %0 = fadd double %indvar.conv, -1.000000e+00    ; <double> [#uses=1]
  %1 = tail call double @llvm.pow.f64(double 0x3FE5555555555555, double %0) ; <double> [#uses=1]
  %2 = fadd double %1, %twoThrd.027               ; <double> [#uses=2]
  %3 = tail call double @llvm.sqrt.f64(double %indvar.conv) ; <double> [#uses=1]
  %4 = fdiv double 1.000000e+00, %3               ; <double> [#uses=1]
  %5 = fadd double %4, %sqrts.026                 ; <double> [#uses=2]
  %6 = fmul double %indvar.conv, %indvar.conv     ; <double> [#uses=1]
  %7 = fmul double %6, %indvar.conv               ; <double> [#uses=2]
  %8 = tail call double @sin(double %indvar.conv) nounwind readonly ; <double> [#uses=2]
  %9 = tail call double @cos(double %indvar.conv) nounwind readonly ; <double> [#uses=2]
  %10 = fmul double %7, %8                        ; <double> [#uses=1]
  %11 = fmul double %10, %8                       ; <double> [#uses=1]
  %12 = fdiv double 1.000000e+00, %11             ; <double> [#uses=1]
  %13 = fadd double %12, %Flint.025               ; <double> [#uses=2]
  %14 = fmul double %7, %9                        ; <double> [#uses=1]
  %15 = fmul double %14, %9                       ; <double> [#uses=1]
  %16 = fdiv double 1.000000e+00, %15             ; <double> [#uses=1]
  %17 = fadd double %16, %Cookson.024             ; <double> [#uses=2]
  %exitcond = icmp eq i32 %k.023.int, 2500000     ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3, label %bb

bb3:                                              ; preds = %bb3, %bb
  %Harmonic.016 = phi <2 x double> [ %23, %bb3 ], [ zeroinitializer, %bb ] ; <<2 x double>> [#uses=1]
  %zeta.015 = phi <2 x double> [ %26, %bb3 ], [ zeroinitializer, %bb ] ; <<2 x double>> [#uses=1]
  %poly.014 = phi <2 x double> [ %21, %bb3 ], [ zeroinitializer, %bb ] ; <<2 x double>> [#uses=1]
  %alt.013 = phi <2 x double> [ %28, %bb3 ], [ zeroinitializer, %bb ] ; <<2 x double>> [#uses=1]
  %Gregory.012 = phi <2 x double> [ %32, %bb3 ], [ zeroinitializer, %bb ] ; <<2 x double>> [#uses=1]
  %storemerge11 = phi <2 x double> [ %33, %bb3 ], [ <double 1.000000e+00, double 2.000000e+00>, %bb ] ; <<2 x double>> [#uses=8]
  %18 = fadd <2 x double> %storemerge11, <double 1.000000e+00, double 1.000000e+00> ; <<2 x double>> [#uses=1]
  %19 = fmul <2 x double> %18, %storemerge11      ; <<2 x double>> [#uses=1]
  %20 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %19 ; <<2 x double>> [#uses=1]
  %21 = fadd <2 x double> %20, %poly.014          ; <<2 x double>> [#uses=3]
  %22 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %storemerge11 ; <<2 x double>> [#uses=1]
  %23 = fadd <2 x double> %22, %Harmonic.016      ; <<2 x double>> [#uses=3]
  %24 = fmul <2 x double> %storemerge11, %storemerge11 ; <<2 x double>> [#uses=1]
  %25 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %24 ; <<2 x double>> [#uses=1]
  %26 = fadd <2 x double> %25, %zeta.015          ; <<2 x double>> [#uses=3]
  %27 = fdiv <2 x double> <double 1.000000e+00, double -1.000000e+00>, %storemerge11 ; <<2 x double>> [#uses=1]
  %28 = fadd <2 x double> %27, %alt.013           ; <<2 x double>> [#uses=3]
  %29 = fmul <2 x double> %storemerge11, <double 2.000000e+00, double 2.000000e+00> ; <<2 x double>> [#uses=1]
  %30 = fadd <2 x double> %29, <double -1.000000e+00, double -1.000000e+00> ; <<2 x double>> [#uses=1]
  %31 = fdiv <2 x double> <double 1.000000e+00, double -1.000000e+00>, %30 ; <<2 x double>> [#uses=1]
  %32 = fadd <2 x double> %31, %Gregory.012       ; <<2 x double>> [#uses=3]
  %33 = fadd <2 x double> %storemerge11, <double 2.000000e+00, double 2.000000e+00> ; <<2 x double>> [#uses=2]
  %tmp9 = extractelement <2 x double> %33, i32 0  ; <double> [#uses=1]
  %34 = fcmp ugt double %tmp9, 2.500000e+06       ; <i1> [#uses=1]
  br i1 %34, label %bb7, label %bb3

bb7:                                              ; preds = %bb3
  %35 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %2, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %36 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %5, i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp3.i7 = extractelement <2 x double> %21, i32 0 ; <double> [#uses=1]
  %tmp1.i8 = extractelement <2 x double> %21, i32 1 ; <double> [#uses=1]
  %37 = fadd double %tmp3.i7, %tmp1.i8            ; <double> [#uses=1]
  %38 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %37, i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %39 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %13, i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %40 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %17, i8* getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp3.i5 = extractelement <2 x double> %23, i32 0 ; <double> [#uses=1]
  %tmp1.i6 = extractelement <2 x double> %23, i32 1 ; <double> [#uses=1]
  %41 = fadd double %tmp3.i5, %tmp1.i6            ; <double> [#uses=1]
  %42 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %41, i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp3.i3 = extractelement <2 x double> %26, i32 0 ; <double> [#uses=1]
  %tmp1.i4 = extractelement <2 x double> %26, i32 1 ; <double> [#uses=1]
  %43 = fadd double %tmp3.i3, %tmp1.i4            ; <double> [#uses=1]
  %44 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %43, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp3.i1 = extractelement <2 x double> %28, i32 0 ; <double> [#uses=1]
  %tmp1.i2 = extractelement <2 x double> %28, i32 1 ; <double> [#uses=1]
  %45 = fadd double %tmp3.i1, %tmp1.i2            ; <double> [#uses=1]
  %46 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %45, i8* getelementptr inbounds ([21 x i8]* @.str8, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp3.i = extractelement <2 x double> %32, i32 0 ; <double> [#uses=1]
  %tmp1.i = extractelement <2 x double> %32, i32 1 ; <double> [#uses=1]
  %47 = fadd double %tmp3.i, %tmp1.i              ; <double> [#uses=1]
  %48 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), double %47, i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare double @llvm.pow.f64(double, double) nounwind readonly

declare double @llvm.sqrt.f64(double) nounwind readonly

declare double @sin(double) nounwind readonly

declare double @cos(double) nounwind readonly

declare i32 @printf(i8* nocapture, ...) nounwind
