; ModuleID = 'almabench.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@dlm = internal constant [8 x [3 x double]] [[3 x double] [double 0x406F88076B035926, double 0x41F40BBCADEE3CB4, double -1.927890e+00], [3 x double] [double 0x4066BF5A874FEAFA, double 0x41DF6432F5157881, double 5.938100e-01], [3 x double] [double 0x40591DDA6DBF7622, double 0x41D34FC2F3B56502, double -2.044110e+00], [3 x double] [double 0x407636ED90F7B482, double 0x41C4890A4B784DFD, double 9.426400e-01], [3 x double] [double 0x40412CFE90EA1D96, double 0x419A0C7E6F1EA0BA, double -3.060378e+01], [3 x double] [double 0x404909E9B1DFE17D, double 0x4184FA9E14756430, double 7.561614e+01], [3 x double] [double 0x4073A0E14D09C902, double 0x416D6BA57E0EFDCA, double -1.750830e+00], [3 x double] [double 0x4073059422411D82, double 0x415E0127CD46B26C, double 2.110300e-01]], align 32 ; <[8 x [3 x double]]*> [#uses=3]
@e = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FCA52242A37D430, double 2.040653e-04, double -2.834900e-06], [3 x double] [double 0x3F7BBCDE77820827, double -4.776521e-04, double 9.812700e-06], [3 x double] [double 0x3F911C1175CC9F7B, double -4.203654e-04, double -1.267340e-05], [3 x double] [double 0x3FB7E91AD74BF5B0, double 9.048438e-04, double -8.064100e-06], [3 x double] [double 0x3FA8D4B857E48742, double 0x3F5ABE2B9A18B7B5, double -4.713660e-05], [3 x double] [double 0x3FAC70CE5FA41E66, double 0xBF6C6594A86FD58E, double -6.436390e-05], [3 x double] [double 0x3FA7BF479022D287, double -2.729293e-04, double 7.891300e-06], [3 x double] [double 9.455747e-03, double 6.032630e-05, double 0.000000e+00]], align 32 ; <[8 x [3 x double]]*> [#uses=3]
@pi = internal constant [8 x [3 x double]] [[3 x double] [double 0x40535D310DE9F882, double 0x40B6571DAB9F559B, double -4.830160e+00], [3 x double] [double 0x40607209DADFB507, double 1.754864e+02, double 0xC07F27B59DDC1E79], [3 x double] [double 0x4059BBFD82CD2461, double 0x40C6AE2D2BD3C361, double 5.327577e+01], [3 x double] [double 0x407500F6B7DFD5BE, double 0x40CF363AC3222920, double -6.232800e+01], [3 x double] [double 0x402CA993F265B897, double 0x40BE4EC06AD2DCB1, double 0x40703F599ED7C6FC], [3 x double] [double 0x405743A9C7642D26, double 0x40D3EADFA415F45E, double 0x4067C84DFCE3150E], [3 x double] [double 0x4065A02B58283528, double 0x40A91F1FF04577D9, double -3.409288e+01], [3 x double] [double 0x40480F65305B6785, double 0x40906AE060FE4799, double 2.739717e+01]], align 32 ; <[8 x [3 x double]]*> [#uses=3]
@kq = internal constant [8 x [10 x double]] [[10 x double] [double 3.086000e+03, double 1.574600e+04, double 6.961300e+04, double 5.989900e+04, double 7.564500e+04, double 8.830600e+04, double 1.266100e+04, double 2.658000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.186300e+04, double 3.279400e+04, double 1.093100e+04, double 7.300000e+01, double 4.387000e+03, double 2.693400e+04, double 1.473000e+03, double 2.157000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 1.600200e+04, double 2.186300e+04, double 1.093100e+04, double 1.473000e+03, double 3.200400e+04, double 4.387000e+03, double 7.300000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 6.345000e+03, double 7.818000e+03, double 1.107000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 5.320000e+02, double 1.000000e+01, double 0.000000e+00], [10 x double] [double 1.900000e+01, double 1.760000e+03, double 1.454000e+03, double 2.870000e+02, double 1.167000e+03, double 8.800000e+02, double 5.740000e+02, double 2.640000e+03, double 1.900000e+01, double 1.454000e+03], [10 x double] [double 1.900000e+01, double 5.740000e+02, double 2.870000e+02, double 3.060000e+02, double 1.760000e+03, double 1.200000e+01, double 3.100000e+01, double 3.800000e+01, double 1.900000e+01, double 5.740000e+02], [10 x double] [double 4.000000e+00, double 2.040000e+02, double 1.770000e+02, double 8.000000e+00, double 3.100000e+01, double 2.000000e+02, double 1.265000e+03, double 1.020000e+02, double 4.000000e+00, double 2.040000e+02], [10 x double] [double 4.000000e+00, double 1.020000e+02, double 1.060000e+02, double 8.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 4.000000e+00, double 1.020000e+02]], align 32 ; <[8 x [10 x double]]*> [#uses=3]
@cl = internal constant [8 x [10 x double]] [[10 x double] [double 2.100000e+01, double -9.500000e+01, double -1.570000e+02, double 4.100000e+01, double -5.000000e+00, double 4.200000e+01, double 2.300000e+01, double 3.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.600000e+02, double -3.130000e+02, double -2.350000e+02, double 6.000000e+01, double -7.400000e+01, double -7.600000e+01, double -2.700000e+01, double 3.400000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -3.250000e+02, double -3.220000e+02, double -7.900000e+01, double 2.320000e+02, double -5.200000e+01, double 9.700000e+01, double 5.500000e+01, double -4.100000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.268000e+03, double -9.790000e+02, double 8.020000e+02, double 6.020000e+02, double -6.680000e+02, double -3.300000e+01, double 3.450000e+02, double 2.010000e+02, double -5.500000e+01, double 0.000000e+00], [10 x double] [double 7.610000e+03, double -4.997000e+03, double -7.689000e+03, double -5.841000e+03, double -2.617000e+03, double 1.115000e+03, double -7.480000e+02, double -6.070000e+02, double 6.074000e+03, double 3.540000e+02], [10 x double] [double -1.854900e+04, double 3.012500e+04, double 2.001200e+04, double -7.300000e+02, double 8.240000e+02, double 2.300000e+01, double 1.289000e+03, double -3.520000e+02, double -1.476700e+04, double -2.062000e+03], [10 x double] [double -1.352450e+05, double -1.459400e+04, double 4.197000e+03, double -4.030000e+03, double -5.630000e+03, double -2.898000e+03, double 2.540000e+03, double -3.060000e+02, double 2.939000e+03, double 1.986000e+03], [10 x double] [double 8.994800e+04, double 2.103000e+03, double 8.963000e+03, double 2.695000e+03, double 3.682000e+03, double 1.648000e+03, double 8.660000e+02, double -1.540000e+02, double -1.963000e+03, double -2.830000e+02]], align 32 ; <[8 x [10 x double]]*> [#uses=3]
@sl = internal constant [8 x [10 x double]] [[10 x double] [double -3.420000e+02, double 1.360000e+02, double -2.300000e+01, double 6.200000e+01, double 6.600000e+01, double -5.200000e+01, double -3.300000e+01, double 1.700000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 5.240000e+02, double -1.490000e+02, double -3.500000e+01, double 1.170000e+02, double 1.510000e+02, double 1.220000e+02, double -7.100000e+01, double -6.200000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.050000e+02, double -1.370000e+02, double 2.580000e+02, double 3.500000e+01, double -1.160000e+02, double -8.800000e+01, double -1.120000e+02, double -8.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 8.540000e+02, double -2.050000e+02, double -9.360000e+02, double -2.400000e+02, double 1.400000e+02, double -3.410000e+02, double -9.700000e+01, double -2.320000e+02, double 5.360000e+02, double 0.000000e+00], [10 x double] [double -5.698000e+04, double 8.016000e+03, double 1.012000e+03, double 1.448000e+03, double -3.024000e+03, double -3.710000e+03, double 3.180000e+02, double 5.030000e+02, double 3.767000e+03, double 5.770000e+02], [10 x double] [double 1.386060e+05, double -1.347800e+04, double -4.964000e+03, double 1.441000e+03, double -1.319000e+03, double -1.482000e+03, double 4.270000e+02, double 1.236000e+03, double -9.167000e+03, double -1.918000e+03], [10 x double] [double 7.123400e+04, double -4.111600e+04, double 5.334000e+03, double -4.935000e+03, double -1.848000e+03, double 6.600000e+01, double 4.340000e+02, double -1.748000e+03, double 3.780000e+03, double -7.010000e+02], [10 x double] [double -4.764500e+04, double 1.164700e+04, double 2.166000e+03, double 3.194000e+03, double 6.790000e+02, double 0.000000e+00, double -2.440000e+02, double -4.190000e+02, double -2.531000e+03, double 4.800000e+01]], align 32 ; <[8 x [10 x double]]*> [#uses=3]
@stdout = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=1]

declare double @fmod(double, double) nounwind readonly

declare double @fabs(double)

declare double @cos(double) nounwind readonly

declare double @sin(double) nounwind readonly

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb20.preheader, label %bb22

bb20.preheader:                                   ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  br label %bb20

bb3:                                              ; preds = %bb20
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=4]
  %3 = load i8* %2, align 1                       ; <i8> [#uses=2]
  %4 = zext i8 %3 to i32                          ; <i32> [#uses=1]
  %5 = add i32 %4, -45                            ; <i32> [#uses=1]
  %6 = icmp eq i8 %3, 45                          ; <i1> [#uses=1]
  br i1 %6, label %bb6, label %bb17

bb6:                                              ; preds = %bb3
  %7 = getelementptr inbounds i8* %2, i32 1       ; <i8*> [#uses=1]
  %8 = load i8* %7, align 1                       ; <i8> [#uses=2]
  %9 = zext i8 %8 to i32                          ; <i32> [#uses=1]
  %10 = add i32 %9, -103                          ; <i32> [#uses=1]
  %11 = icmp eq i8 %8, 103                        ; <i1> [#uses=1]
  br i1 %11, label %bb10, label %bb17

bb10:                                             ; preds = %bb6
  %12 = getelementptr inbounds i8* %2, i32 2      ; <i8*> [#uses=1]
  %13 = load i8* %12, align 1                     ; <i8> [#uses=2]
  %14 = zext i8 %13 to i32                        ; <i32> [#uses=1]
  %15 = add i32 %14, -97                          ; <i32> [#uses=1]
  %16 = icmp eq i8 %13, 97                        ; <i1> [#uses=1]
  br i1 %16, label %bb14, label %bb17

bb14:                                             ; preds = %bb10
  %17 = getelementptr inbounds i8* %2, i32 3      ; <i8*> [#uses=1]
  %18 = load i8* %17, align 1                     ; <i8> [#uses=1]
  %19 = zext i8 %18 to i32                        ; <i32> [#uses=1]
  br label %bb17

bb17:                                             ; preds = %bb14, %bb10, %bb6, %bb3
  %__result.0 = phi i32 [ %19, %bb14 ], [ %5, %bb3 ], [ %10, %bb6 ], [ %15, %bb10 ] ; <i32> [#uses=1]
  %20 = icmp eq i32 %__result.0, 0                ; <i1> [#uses=1]
  br i1 %20, label %bb22, label %bb19

bb19:                                             ; preds = %bb17
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb20

bb20:                                             ; preds = %bb19, %bb20.preheader
  %indvar = phi i32 [ 1, %bb20.preheader ], [ %phitmp, %bb19 ] ; <i32> [#uses=2]
  %21 = icmp slt i32 %indvar, %argc               ; <i1> [#uses=1]
  br i1 %21, label %bb3, label %bb22

bb22:                                             ; preds = %bb32, %bb20, %bb17, %entry
  %i.15 = phi i32 [ %121, %bb32 ], [ 0, %bb20 ], [ 0, %bb17 ], [ 0, %entry ] ; <i32> [#uses=1]
  br label %bb23

bb23:                                             ; preds = %bb30, %bb22
  %jd.0.0 = phi double [ 2.451545e+06, %bb22 ], [ %22, %bb30 ] ; <double> [#uses=1]
  %n.03 = phi i32 [ 0, %bb22 ], [ %120, %bb30 ]   ; <i32> [#uses=1]
  %22 = fadd double %jd.0.0, 1.000000e+00         ; <double> [#uses=2]
  %23 = fadd double %22, -2.451545e+06            ; <double> [#uses=1]
  %24 = fadd double %23, 0.000000e+00             ; <double> [#uses=1]
  %25 = fdiv double %24, 3.652500e+05             ; <double> [#uses=9]
  %26 = fmul double %25, 3.595362e-01             ; <double> [#uses=3]
  br label %bb24

bb24:                                             ; preds = %planetpv.exit, %bb23
  %27 = phi i32 [ 0, %bb23 ], [ %119, %planetpv.exit ] ; <i32> [#uses=19]
  %28 = getelementptr inbounds [8 x [3 x double]]* @dlm, i32 0, i32 %27, i32 0 ; <double*> [#uses=1]
  %29 = load double* %28, align 8                 ; <double> [#uses=1]
  %30 = fmul double %29, 3.600000e+03             ; <double> [#uses=1]
  %31 = getelementptr inbounds [8 x [3 x double]]* @dlm, i32 0, i32 %27, i32 1 ; <double*> [#uses=1]
  %32 = load double* %31, align 8                 ; <double> [#uses=1]
  %33 = getelementptr inbounds [8 x [3 x double]]* @dlm, i32 0, i32 %27, i32 2 ; <double*> [#uses=1]
  %34 = load double* %33, align 8                 ; <double> [#uses=1]
  %35 = fmul double %34, %25                      ; <double> [#uses=1]
  %36 = fadd double %32, %35                      ; <double> [#uses=1]
  %37 = fmul double %36, %25                      ; <double> [#uses=1]
  %38 = fadd double %30, %37                      ; <double> [#uses=1]
  %39 = fmul double %38, 0x3ED455A5B2FF8F9D       ; <double> [#uses=1]
  %40 = getelementptr inbounds [8 x [3 x double]]* @e, i32 0, i32 %27, i32 0 ; <double*> [#uses=1]
  %41 = load double* %40, align 8                 ; <double> [#uses=1]
  %42 = getelementptr inbounds [8 x [3 x double]]* @e, i32 0, i32 %27, i32 1 ; <double*> [#uses=1]
  %43 = load double* %42, align 8                 ; <double> [#uses=1]
  %44 = getelementptr inbounds [8 x [3 x double]]* @e, i32 0, i32 %27, i32 2 ; <double*> [#uses=1]
  %45 = load double* %44, align 8                 ; <double> [#uses=1]
  %46 = fmul double %45, %25                      ; <double> [#uses=1]
  %47 = fadd double %43, %46                      ; <double> [#uses=1]
  %48 = fmul double %47, %25                      ; <double> [#uses=1]
  %49 = fadd double %41, %48                      ; <double> [#uses=3]
  %50 = getelementptr inbounds [8 x [3 x double]]* @pi, i32 0, i32 %27, i32 0 ; <double*> [#uses=1]
  %51 = load double* %50, align 8                 ; <double> [#uses=1]
  %52 = fmul double %51, 3.600000e+03             ; <double> [#uses=1]
  %53 = getelementptr inbounds [8 x [3 x double]]* @pi, i32 0, i32 %27, i32 1 ; <double*> [#uses=1]
  %54 = load double* %53, align 8                 ; <double> [#uses=1]
  %55 = getelementptr inbounds [8 x [3 x double]]* @pi, i32 0, i32 %27, i32 2 ; <double*> [#uses=1]
  %56 = load double* %55, align 8                 ; <double> [#uses=1]
  %57 = fmul double %56, %25                      ; <double> [#uses=1]
  %58 = fadd double %54, %57                      ; <double> [#uses=1]
  %59 = fmul double %58, %25                      ; <double> [#uses=1]
  %60 = fadd double %52, %59                      ; <double> [#uses=1]
  %61 = fmul double %60, 0x3ED455A5B2FF8F9D       ; <double> [#uses=2]
  %62 = call double @fmod(double %61, double 0x401921FB54442D18) nounwind readonly ; <double> [#uses=3]
  %63 = call double @fabs(double %62) nounwind readnone ; <double> [#uses=1]
  %64 = fcmp ult double %63, 0x400921FB54442D18   ; <i1> [#uses=1]
  br i1 %64, label %anpm.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb24
  %65 = fcmp olt double %61, 0.000000e+00         ; <i1> [#uses=1]
  %iftmp.24.0.i.i = select i1 %65, double 0xC01921FB54442D18, double 0x401921FB54442D18 ; <double> [#uses=1]
  %66 = fsub double %62, %iftmp.24.0.i.i          ; <double> [#uses=1]
  br label %anpm.exit.i

anpm.exit.i:                                      ; preds = %bb.i.i, %bb24
  %67 = phi double [ %66, %bb.i.i ], [ %62, %bb24 ] ; <double> [#uses=1]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %anpm.exit.i
  %k.012.i = phi i32 [ %79, %bb.i ], [ 0, %anpm.exit.i ] ; <i32> [#uses=4]
  %dl.09.i = phi double [ %78, %bb.i ], [ %39, %anpm.exit.i ] ; <double> [#uses=1]
  %scevgep26.i = getelementptr [8 x [10 x double]]* @sl, i32 0, i32 %27, i32 %k.012.i ; <double*> [#uses=1]
  %scevgep27.i = getelementptr [8 x [10 x double]]* @cl, i32 0, i32 %27, i32 %k.012.i ; <double*> [#uses=1]
  %scevgep30.i = getelementptr [8 x [10 x double]]* @kq, i32 0, i32 %27, i32 %k.012.i ; <double*> [#uses=1]
  %68 = load double* %scevgep30.i, align 8        ; <double> [#uses=1]
  %69 = fmul double %68, %26                      ; <double> [#uses=2]
  %70 = load double* %scevgep27.i, align 8        ; <double> [#uses=1]
  %71 = call double @cos(double %69) nounwind readonly ; <double> [#uses=1]
  %72 = fmul double %70, %71                      ; <double> [#uses=1]
  %73 = load double* %scevgep26.i, align 8        ; <double> [#uses=1]
  %74 = call double @sin(double %69) nounwind readonly ; <double> [#uses=1]
  %75 = fmul double %73, %74                      ; <double> [#uses=1]
  %76 = fadd double %72, %75                      ; <double> [#uses=1]
  %77 = fmul double %76, 1.000000e-07             ; <double> [#uses=1]
  %78 = fadd double %77, %dl.09.i                 ; <double> [#uses=2]
  %79 = add nsw i32 %k.012.i, 1                   ; <i32> [#uses=2]
  %exitcond25.i = icmp eq i32 %79, 8              ; <i1> [#uses=1]
  br i1 %exitcond25.i, label %bb2.i, label %bb.i

bb2.i:                                            ; preds = %bb.i
  %scevgep22.i = getelementptr [8 x [10 x double]]* @kq, i32 0, i32 %27, i32 8 ; <double*> [#uses=1]
  %80 = load double* %scevgep22.i, align 16       ; <double> [#uses=1]
  %81 = fmul double %80, %26                      ; <double> [#uses=2]
  %scevgep.i = getelementptr [8 x [10 x double]]* @sl, i32 0, i32 %27, i32 8 ; <double*> [#uses=1]
  %scevgep21.i = getelementptr [8 x [10 x double]]* @cl, i32 0, i32 %27, i32 8 ; <double*> [#uses=1]
  %82 = load double* %scevgep21.i, align 16       ; <double> [#uses=1]
  %83 = call double @cos(double %81) nounwind readonly ; <double> [#uses=1]
  %84 = fmul double %82, %83                      ; <double> [#uses=1]
  %85 = load double* %scevgep.i, align 16         ; <double> [#uses=1]
  %86 = call double @sin(double %81) nounwind readonly ; <double> [#uses=1]
  %87 = fmul double %85, %86                      ; <double> [#uses=1]
  %88 = fadd double %84, %87                      ; <double> [#uses=1]
  %89 = fmul double %88, %25                      ; <double> [#uses=1]
  %90 = fmul double %89, 1.000000e-07             ; <double> [#uses=1]
  %91 = fadd double %90, %78                      ; <double> [#uses=1]
  %scevgep.1.i = getelementptr [8 x [10 x double]]* @sl, i32 0, i32 %27, i32 9 ; <double*> [#uses=1]
  %scevgep21.1.i = getelementptr [8 x [10 x double]]* @cl, i32 0, i32 %27, i32 9 ; <double*> [#uses=1]
  %scevgep22.1.i = getelementptr [8 x [10 x double]]* @kq, i32 0, i32 %27, i32 9 ; <double*> [#uses=1]
  %92 = load double* %scevgep22.1.i, align 8      ; <double> [#uses=1]
  %93 = fmul double %92, %26                      ; <double> [#uses=2]
  %94 = load double* %scevgep21.1.i, align 8      ; <double> [#uses=1]
  %95 = call double @cos(double %93) nounwind readonly ; <double> [#uses=1]
  %96 = fmul double %94, %95                      ; <double> [#uses=1]
  %97 = load double* %scevgep.1.i, align 8        ; <double> [#uses=1]
  %98 = call double @sin(double %93) nounwind readonly ; <double> [#uses=1]
  %99 = fmul double %97, %98                      ; <double> [#uses=1]
  %100 = fadd double %96, %99                     ; <double> [#uses=1]
  %101 = fmul double %100, %25                    ; <double> [#uses=1]
  %102 = fmul double %101, 1.000000e-07           ; <double> [#uses=1]
  %103 = fadd double %102, %91                    ; <double> [#uses=1]
  %104 = call double @fmod(double %103, double 0x401921FB54442D18) nounwind readonly ; <double> [#uses=1]
  %105 = fsub double %104, %67                    ; <double> [#uses=3]
  %106 = call double @sin(double %105) nounwind readonly ; <double> [#uses=1]
  %107 = fmul double %106, %49                    ; <double> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %bb7.i, %bb2.i
  %.pn = phi double [ %107, %bb2.i ], [ %ae.0.i, %bb7.i ] ; <double> [#uses=1]
  %.pn1 = phi double [ %105, %bb2.i ], [ %115, %bb7.i ] ; <double> [#uses=1]
  %k.2.i = phi i32 [ 0, %bb2.i ], [ %tmp.i, %bb7.i ] ; <i32> [#uses=1]
  %ae.0.i = fadd double %.pn, %.pn1               ; <double> [#uses=4]
  %tmp.i = add i32 %k.2.i, 1                      ; <i32> [#uses=2]
  %108 = fsub double %105, %ae.0.i                ; <double> [#uses=1]
  %109 = call double @sin(double %ae.0.i) nounwind readonly ; <double> [#uses=1]
  %110 = fmul double %109, %49                    ; <double> [#uses=1]
  %111 = fadd double %108, %110                   ; <double> [#uses=1]
  %112 = call double @cos(double %ae.0.i) nounwind readonly ; <double> [#uses=1]
  %113 = fmul double %112, %49                    ; <double> [#uses=1]
  %114 = fsub double 1.000000e+00, %113           ; <double> [#uses=1]
  %115 = fdiv double %111, %114                   ; <double> [#uses=2]
  %116 = icmp sgt i32 %tmp.i, 9                   ; <i1> [#uses=1]
  br i1 %116, label %planetpv.exit, label %bb7.i

bb7.i:                                            ; preds = %bb6.i
  %117 = call double @fabs(double %115) nounwind readnone ; <double> [#uses=1]
  %118 = fcmp olt double %117, 1.000000e-12       ; <i1> [#uses=1]
  br i1 %118, label %planetpv.exit, label %bb6.i

planetpv.exit:                                    ; preds = %bb7.i, %bb6.i
  %119 = add nsw i32 %27, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %119, 8                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb30, label %bb24

bb30:                                             ; preds = %planetpv.exit
  %120 = add nsw i32 %n.03, 1                     ; <i32> [#uses=2]
  %exitcond9 = icmp eq i32 %120, 36525            ; <i1> [#uses=1]
  br i1 %exitcond9, label %bb32, label %bb23

bb32:                                             ; preds = %bb30
  %121 = add nsw i32 %i.15, 1                     ; <i32> [#uses=2]
  %exitcond10 = icmp eq i32 %121, 20              ; <i1> [#uses=1]
  br i1 %exitcond10, label %bb34, label %bb22

bb34:                                             ; preds = %bb32
  %122 = load %struct._IO_FILE** @stdout, align 4 ; <%struct._IO_FILE*> [#uses=1]
  %123 = call i32 @fflush(%struct._IO_FILE* %122) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @fflush(%struct._IO_FILE* nocapture) nounwind
