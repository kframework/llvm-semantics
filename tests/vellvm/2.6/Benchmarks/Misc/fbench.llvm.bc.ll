; ModuleID = 'fbench.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@paraxial = internal global i16 0                 ; <i16*> [#uses=5]
@object_distance = internal global double 0.000000e+00, align 8 ; <double*> [#uses=9]
@axis_slope_angle = internal global double 0.000000e+00, align 8 ; <double*> [#uses=11]
@s = internal global [10 x [5 x double]] zeroinitializer, align 32 ; <[10 x [5 x double]]*> [#uses=8]
@spectral_line = internal global [9 x double] zeroinitializer, align 32 ; <[9 x double]*> [#uses=9]
@current_surfaces.b = internal global i1 false    ; <i1*> [#uses=2]
@testcase = internal constant [4 x [4 x double]] [[4 x double] [double 2.705000e+01, double 1.513700e+00, double 6.360000e+01, double 5.200000e-01], [4 x double] [double -1.668000e+01, double 1.000000e+00, double 0.000000e+00, double 1.380000e-01], [4 x double] [double -1.668000e+01, double 1.616400e+00, double 3.670000e+01, double 3.800000e-01], [4 x double] [double -7.810000e+01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00]], align 32 ; <[4 x [4 x double]]*> [#uses=4]
@.str = private constant [53 x i8] c"Ready to begin John Walker's floating point accuracy\00", align 1 ; <[53 x i8]*> [#uses=1]
@.str1 = private constant [58 x i8] c"and performance benchmark.  %d iterations will be made.\0A\0A\00", align 1 ; <[58 x i8]*> [#uses=1]
@.str2 = private constant [56 x i8] c"\0AMeasured run time in seconds should be divided by %.f\0A\00", align 1 ; <[56 x i8]*> [#uses=1]
@.str3 = private constant [59 x i8] c"to normalise for reporting results.  For archival results,\00", align 1 ; <[59 x i8]*> [#uses=1]
@.str4 = private constant [66 x i8] c"adjust iteration count so the benchmark runs about five minutes.\0A\00", align 1 ; <[66 x i8]*> [#uses=1]
@od_sa = internal global [2 x [2 x double]] zeroinitializer, align 32 ; <[2 x [2 x double]]*> [#uses=6]
@outarr = internal global [8 x [80 x i8]] zeroinitializer, align 32 ; <[8 x [80 x i8]]*> [#uses=10]
@.str5 = private constant [24 x i8] c"%15s   %21.11f  %14.11f\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str6 = private constant [13 x i8] c"Marginal ray\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str7 = private constant [13 x i8] c"Paraxial ray\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str8 = private constant [48 x i8] c"Longitudinal spherical aberration:      %16.11f\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str9 = private constant [48 x i8] c"    (Maximum permissible):              %16.11f\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str10 = private constant [48 x i8] c"Offense against sine condition (coma):  %16.11f\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str11 = private constant [48 x i8] c"Axial chromatic aberration:             %16.11f\00", align 1 ; <[48 x i8]*> [#uses=1]
@refarr = internal constant [8 x i8*] [i8* getelementptr ([56 x i8]* @.str12, i32 0, i32 0), i8* getelementptr ([56 x i8]* @.str13, i32 0, i32 0), i8* getelementptr ([57 x i8]* @.str14, i32 0, i32 0), i8* getelementptr ([57 x i8]* @.str15, i32 0, i32 0), i8* getelementptr ([57 x i8]* @.str16, i32 0, i32 0), i8* getelementptr ([57 x i8]* @.str17, i32 0, i32 0), i8* getelementptr ([57 x i8]* @.str18, i32 0, i32 0), i8* getelementptr ([57 x i8]* @.str15, i32 0, i32 0)], align 32 ; <[8 x i8*]*> [#uses=1]
@.str12 = private constant [56 x i8] c"   Marginal ray          47.09479120920   0.04178472683\00", align 1 ; <[56 x i8]*> [#uses=1]
@.str13 = private constant [56 x i8] c"   Paraxial ray          47.08372160249   0.04177864821\00", align 1 ; <[56 x i8]*> [#uses=1]
@.str14 = private constant [57 x i8] c"Longitudinal spherical aberration:        -0.01106960671\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str15 = private constant [57 x i8] c"    (Maximum permissible):                 0.05306749907\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str16 = private constant [57 x i8] c"Offense against sine condition (coma):     0.00008954761\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str17 = private constant [57 x i8] c"    (Maximum permissible):                 0.00250000000\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str18 = private constant [57 x i8] c"Axial chromatic aberration:                0.00448229032\00", align 1 ; <[57 x i8]*> [#uses=1]
@.str19 = private constant [33 x i8] c"\0AError in results on line %d...\0A\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str20 = private constant [17 x i8] c"Expected:  \22%s\22\0A\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str21 = private constant [17 x i8] c"Received:  \22%s\22\0A\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str22 = private constant [13 x i8] c"(Errors)    \00", align 1 ; <[13 x i8]*> [#uses=1]
@.str23 = private constant [2 x i8] c"s\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str24 = private constant [1 x i8] zeroinitializer, align 1 ; <[1 x i8]*> [#uses=1]
@.str25 = private constant [48 x i8] c"\0A%d error%s in results.  This is VERY SERIOUS.\0A\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str26 = private constant [23 x i8] c"\0ANo errors in results.\00", align 1 ; <[23 x i8]*> [#uses=1]

declare double @sin(double) nounwind readonly

declare double @asin(double) nounwind readonly

declare double @tan(double) nounwind readonly

declare double @cos(double) nounwind readonly

define internal fastcc void @trace_line(i32 %line) nounwind {
entry:
  store double 0.000000e+00, double* @object_distance, align 8
  %.b3 = load i1* @current_surfaces.b             ; <i1> [#uses=2]
  br i1 %.b3, label %bb.nph, label %return

bb.nph:                                           ; preds = %entry
  %0 = getelementptr inbounds [9 x double]* @spectral_line, i32 0, i32 %line ; <double*> [#uses=1]
  %1 = select i1 %.b3, i32 4, i32 0               ; <i32> [#uses=2]
  br label %bb

bb:                                               ; preds = %bb4, %bb.nph
  %2 = phi double [ 1.000000e+00, %bb.nph ], [ %20, %bb4 ] ; <double> [#uses=6]
  %3 = phi double [ 2.000000e+00, %bb.nph ], [ %.rle12, %bb4 ] ; <double> [#uses=6]
  %4 = phi double [ 0.000000e+00, %bb.nph ], [ %.rle8, %bb4 ] ; <double> [#uses=8]
  %indvar = phi i32 [ 0, %bb.nph ], [ %i.02, %bb4 ] ; <i32> [#uses=2]
  %i.02 = add i32 %indvar, 1                      ; <i32> [#uses=6]
  %tmp = add i32 %indvar, 2                       ; <i32> [#uses=1]
  %scevgep4 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 %i.02, i32 2 ; <double*> [#uses=1]
  %scevgep5 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 %i.02, i32 4 ; <double*> [#uses=1]
  %scevgep6 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 %i.02, i32 1 ; <double*> [#uses=1]
  %5 = load double* %scevgep6, align 8            ; <double> [#uses=9]
  %6 = load double* %scevgep4, align 8            ; <double> [#uses=4]
  %7 = fcmp ogt double %6, 1.000000e+00           ; <i1> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %scevgep = getelementptr [10 x [5 x double]]* @s, i32 0, i32 %i.02, i32 3 ; <double*> [#uses=1]
  %8 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 4), align 32 ; <double> [#uses=1]
  %9 = load double* %0, align 8                   ; <double> [#uses=1]
  %10 = fsub double %8, %9                        ; <double> [#uses=1]
  %11 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 3), align 8 ; <double> [#uses=1]
  %12 = load double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 6), align 16 ; <double> [#uses=1]
  %13 = fsub double %11, %12                      ; <double> [#uses=1]
  %14 = fdiv double %10, %13                      ; <double> [#uses=1]
  %15 = fadd double %6, -1.000000e+00             ; <double> [#uses=1]
  %16 = load double* %scevgep, align 8            ; <double> [#uses=1]
  %17 = fdiv double %15, %16                      ; <double> [#uses=1]
  %18 = fmul double %14, %17                      ; <double> [#uses=1]
  %19 = fadd double %18, %6                       ; <double> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb1, %bb
  %20 = phi double [ %19, %bb1 ], [ %6, %bb ]     ; <double> [#uses=7]
  %21 = load i16* @paraxial, align 2              ; <i16> [#uses=1]
  %22 = icmp eq i16 %21, 0                        ; <i1> [#uses=1]
  %23 = fcmp une double %5, 0.000000e+00          ; <i1> [#uses=2]
  br i1 %22, label %bb8.i, label %bb.i

bb.i:                                             ; preds = %bb2
  br i1 %23, label %bb1.i, label %bb7.i

bb1.i:                                            ; preds = %bb.i
  %24 = fcmp oeq double %4, 0.000000e+00          ; <i1> [#uses=1]
  br i1 %24, label %bb2.i, label %bb3.i

bb2.i:                                            ; preds = %bb1.i
  store double 0.000000e+00, double* @axis_slope_angle, align 8
  %25 = fdiv double %3, %5                        ; <double> [#uses=1]
  br label %bb4.i

bb3.i:                                            ; preds = %bb1.i
  %26 = fsub double %4, %5                        ; <double> [#uses=1]
  %27 = fdiv double %26, %5                       ; <double> [#uses=1]
  %28 = load double* @axis_slope_angle, align 8   ; <double> [#uses=2]
  %29 = fmul double %27, %28                      ; <double> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %bb2.i
  %30 = phi double [ %28, %bb3.i ], [ 0.000000e+00, %bb2.i ] ; <double> [#uses=2]
  %iang_sin.0.i = phi double [ %25, %bb2.i ], [ %29, %bb3.i ] ; <double> [#uses=2]
  %31 = fdiv double %2, %20                       ; <double> [#uses=1]
  %32 = fmul double %31, %iang_sin.0.i            ; <double> [#uses=1]
  %33 = fadd double %30, %iang_sin.0.i            ; <double> [#uses=1]
  %34 = fsub double %33, %32                      ; <double> [#uses=2]
  store double %34, double* @axis_slope_angle, align 8
  %35 = fcmp une double %4, 0.000000e+00          ; <i1> [#uses=1]
  br i1 %35, label %bb5.i, label %bb6.i

bb5.i:                                            ; preds = %bb4.i
  %36 = fmul double %4, %30                       ; <double> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %bb5.i, %bb4.i
  %37 = phi double [ %36, %bb5.i ], [ %3, %bb4.i ] ; <double> [#uses=2]
  %38 = fdiv double %37, %34                      ; <double> [#uses=2]
  store double %38, double* @object_distance, align 8
  br label %transit_surface.exit

bb7.i:                                            ; preds = %bb.i
  %39 = fdiv double %20, %2                       ; <double> [#uses=1]
  %40 = fmul double %39, %4                       ; <double> [#uses=2]
  store double %40, double* @object_distance, align 8
  %41 = fdiv double %2, %20                       ; <double> [#uses=1]
  %42 = load double* @axis_slope_angle, align 8   ; <double> [#uses=1]
  %43 = fmul double %41, %42                      ; <double> [#uses=1]
  store double %43, double* @axis_slope_angle, align 8
  br label %transit_surface.exit

bb8.i:                                            ; preds = %bb2
  br i1 %23, label %bb9.i, label %bb13.i

bb9.i:                                            ; preds = %bb8.i
  %44 = fcmp oeq double %4, 0.000000e+00          ; <i1> [#uses=1]
  br i1 %44, label %bb10.i, label %bb11.i

bb10.i:                                           ; preds = %bb9.i
  store double 0.000000e+00, double* @axis_slope_angle, align 8
  %45 = fdiv double %3, %5                        ; <double> [#uses=1]
  br label %bb12.i

bb11.i:                                           ; preds = %bb9.i
  %46 = fsub double %4, %5                        ; <double> [#uses=1]
  %47 = fdiv double %46, %5                       ; <double> [#uses=1]
  %48 = load double* @axis_slope_angle, align 8   ; <double> [#uses=2]
  %49 = tail call double @sin(double %48) nounwind readonly ; <double> [#uses=1]
  %50 = fmul double %47, %49                      ; <double> [#uses=1]
  br label %bb12.i

bb12.i:                                           ; preds = %bb11.i, %bb10.i
  %51 = phi double [ %48, %bb11.i ], [ 0.000000e+00, %bb10.i ] ; <double> [#uses=1]
  %iang_sin.1.i = phi double [ %45, %bb10.i ], [ %50, %bb11.i ] ; <double> [#uses=2]
  %52 = tail call double @asin(double %iang_sin.1.i) nounwind readonly ; <double> [#uses=1]
  %53 = fdiv double %2, %20                       ; <double> [#uses=1]
  %54 = fmul double %53, %iang_sin.1.i            ; <double> [#uses=1]
  %55 = fadd double %51, %52                      ; <double> [#uses=3]
  %56 = tail call double @asin(double %54) nounwind readonly ; <double> [#uses=1]
  %57 = fsub double %55, %56                      ; <double> [#uses=2]
  store double %57, double* @axis_slope_angle, align 8
  %58 = fmul double %55, 5.000000e-01             ; <double> [#uses=1]
  %59 = tail call double @sin(double %58) nounwind readonly ; <double> [#uses=2]
  %60 = fmul double %5, 2.000000e+00              ; <double> [#uses=1]
  %61 = fmul double %60, %59                      ; <double> [#uses=1]
  %62 = fmul double %61, %59                      ; <double> [#uses=1]
  %63 = tail call double @sin(double %55) nounwind readonly ; <double> [#uses=1]
  %64 = fmul double %63, %5                       ; <double> [#uses=1]
  %65 = tail call double @tan(double %57) nounwind readonly ; <double> [#uses=1]
  %66 = fdiv double 1.000000e+00, %65             ; <double> [#uses=1]
  %67 = fmul double %64, %66                      ; <double> [#uses=1]
  %68 = fadd double %67, %62                      ; <double> [#uses=2]
  store double %68, double* @object_distance, align 8
  br label %transit_surface.exit

bb13.i:                                           ; preds = %bb8.i
  %69 = fdiv double %2, %20                       ; <double> [#uses=1]
  %70 = load double* @axis_slope_angle, align 8   ; <double> [#uses=2]
  %71 = tail call double @sin(double %70) nounwind readonly ; <double> [#uses=1]
  %72 = fmul double %69, %71                      ; <double> [#uses=1]
  %73 = tail call double @asin(double %72) nounwind readonly ; <double> [#uses=2]
  %74 = fsub double -0.000000e+00, %73            ; <double> [#uses=1]
  %75 = tail call double @cos(double %74) nounwind readonly ; <double> [#uses=1]
  %76 = fmul double %75, %20                      ; <double> [#uses=1]
  %77 = tail call double @cos(double %70) nounwind readonly ; <double> [#uses=1]
  %78 = fmul double %77, %2                       ; <double> [#uses=1]
  %79 = fdiv double %76, %78                      ; <double> [#uses=1]
  %80 = fmul double %79, %4                       ; <double> [#uses=2]
  store double %80, double* @object_distance, align 8
  store double %73, double* @axis_slope_angle, align 8
  br label %transit_surface.exit

transit_surface.exit:                             ; preds = %bb13.i, %bb12.i, %bb7.i, %bb6.i
  %.rle12 = phi double [ %3, %bb12.i ], [ %3, %bb13.i ], [ %37, %bb6.i ], [ %3, %bb7.i ] ; <double> [#uses=1]
  %81 = phi double [ %68, %bb12.i ], [ %80, %bb13.i ], [ %38, %bb6.i ], [ %40, %bb7.i ] ; <double> [#uses=2]
  %82 = icmp sgt i32 %1, %i.02                    ; <i1> [#uses=1]
  br i1 %82, label %bb3, label %bb4

bb3:                                              ; preds = %transit_surface.exit
  %83 = load double* %scevgep5, align 8           ; <double> [#uses=1]
  %84 = fsub double %81, %83                      ; <double> [#uses=2]
  store double %84, double* @object_distance, align 8
  br label %bb4

bb4:                                              ; preds = %bb3, %transit_surface.exit
  %.rle8 = phi double [ %84, %bb3 ], [ %81, %transit_surface.exit ] ; <double> [#uses=1]
  %85 = icmp slt i32 %1, %tmp                     ; <i1> [#uses=1]
  br i1 %85, label %return, label %bb

return:                                           ; preds = %bb4, %entry
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  store double 7.621000e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 1), align 8
  store double 6.869955e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 2), align 16
  store double 6.562816e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 3), align 8
  store double 5.895944e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 4), align 32
  store double 5.269557e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 5), align 8
  store double 4.861344e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 6), align 16
  store double 4.340477e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 7), align 8
  store double 3.968494e+03, double* getelementptr inbounds ([9 x double]* @spectral_line, i32 0, i32 8), align 32
  store i1 true, i1* @current_surfaces.b
  br label %bb2.preheader

bb2.preheader:                                    ; preds = %bb2.preheader, %entry
  %i.028 = phi i32 [ 0, %entry ], [ %0, %bb2.preheader ] ; <i32> [#uses=5]
  %0 = add nsw i32 %i.028, 1                      ; <i32> [#uses=3]
  %scevgep42 = getelementptr [4 x [4 x double]]* @testcase, i32 0, i32 %i.028, i32 0 ; <double*> [#uses=1]
  %1 = load double* %scevgep42, align 32          ; <double> [#uses=1]
  %tmp45 = mul i32 %0, 5                          ; <i32> [#uses=4]
  %.sum49 = add i32 %tmp45, 1                     ; <i32> [#uses=1]
  %scevgep46 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 0, i32 %.sum49 ; <double*> [#uses=1]
  store double %1, double* %scevgep46, align 8
  %scevgep42.1 = getelementptr [4 x [4 x double]]* @testcase, i32 0, i32 %i.028, i32 1 ; <double*> [#uses=1]
  %2 = load double* %scevgep42.1, align 8         ; <double> [#uses=1]
  %.sum48 = add i32 %tmp45, 2                     ; <i32> [#uses=1]
  %scevgep46.1 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 0, i32 %.sum48 ; <double*> [#uses=1]
  store double %2, double* %scevgep46.1, align 8
  %scevgep42.2 = getelementptr [4 x [4 x double]]* @testcase, i32 0, i32 %i.028, i32 2 ; <double*> [#uses=1]
  %3 = load double* %scevgep42.2, align 16        ; <double> [#uses=1]
  %.sum47 = add i32 %tmp45, 3                     ; <i32> [#uses=1]
  %scevgep46.2 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 0, i32 %.sum47 ; <double*> [#uses=1]
  store double %3, double* %scevgep46.2, align 8
  %scevgep42.3 = getelementptr [4 x [4 x double]]* @testcase, i32 0, i32 %i.028, i32 3 ; <double*> [#uses=1]
  %4 = load double* %scevgep42.3, align 8         ; <double> [#uses=1]
  %.sum = add i32 %tmp45, 4                       ; <i32> [#uses=1]
  %scevgep46.3 = getelementptr [10 x [5 x double]]* @s, i32 0, i32 0, i32 %.sum ; <double*> [#uses=1]
  store double %4, double* %scevgep46.3, align 8
  %5 = icmp slt i32 %0, 4                         ; <i1> [#uses=1]
  br i1 %5, label %bb2.preheader, label %bb8.preheader.preheader

bb8.preheader.preheader:                          ; preds = %bb2.preheader
  %6 = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %7 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0), i32 1000000) nounwind ; <i32> [#uses=0]
  %8 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), double 1.000000e+03) nounwind ; <i32> [#uses=0]
  %9 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %10 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb8.preheader

bb7:                                              ; preds = %bb8.preheader, %bb7
  tail call fastcc void @trace_line(i32 4) nounwind
  %11 = load i16* @paraxial, align 2              ; <i16> [#uses=2]
  %12 = sext i16 %11 to i32                       ; <i32> [#uses=2]
  %13 = load double* @object_distance, align 8    ; <double> [#uses=1]
  %14 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i32 0, i32 %12, i32 0 ; <double*> [#uses=1]
  store double %13, double* %14, align 16
  %15 = load double* @axis_slope_angle, align 8   ; <double> [#uses=1]
  %16 = getelementptr inbounds [2 x [2 x double]]* @od_sa, i32 0, i32 %12, i32 1 ; <double*> [#uses=1]
  store double %15, double* %16, align 8
  %17 = add nsw i16 %11, 1                        ; <i16> [#uses=2]
  store i16 %17, i16* @paraxial
  %18 = icmp sgt i16 %17, 1                       ; <i1> [#uses=1]
  br i1 %18, label %bb9, label %bb7

bb9:                                              ; preds = %bb7
  store i16 0, i16* @paraxial, align 2
  tail call fastcc void @trace_line(i32 3) nounwind
  %19 = load double* @object_distance, align 8    ; <double> [#uses=1]
  tail call fastcc void @trace_line(i32 6) nounwind
  %20 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 1, i32 0), align 16 ; <double> [#uses=2]
  %21 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 0, i32 0), align 32 ; <double> [#uses=2]
  %22 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 0, i32 1), align 8 ; <double> [#uses=1]
  %23 = tail call double @sin(double %22) nounwind readonly ; <double> [#uses=3]
  %24 = add i32 %itercount.0, 1                   ; <i32> [#uses=2]
  %25 = icmp slt i32 %24, 1000000                 ; <i1> [#uses=1]
  br i1 %25, label %bb8.preheader, label %bb11

bb8.preheader:                                    ; preds = %bb9, %bb8.preheader.preheader
  %itercount.0 = phi i32 [ %24, %bb9 ], [ 0, %bb8.preheader.preheader ] ; <i32> [#uses=1]
  store i16 0, i16* @paraxial
  br label %bb7

bb11:                                             ; preds = %bb9
  %26 = load double* @object_distance, align 8    ; <double> [#uses=1]
  %27 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 1, i32 1), align 8 ; <double> [#uses=1]
  %28 = fsub double %20, %21                      ; <double> [#uses=1]
  %29 = fmul double %20, %27                      ; <double> [#uses=1]
  %30 = fmul double %23, %21                      ; <double> [#uses=1]
  %31 = fdiv double %29, %30                      ; <double> [#uses=1]
  %32 = fsub double 1.000000e+00, %31             ; <double> [#uses=1]
  %33 = fsub double %26, %19                      ; <double> [#uses=1]
  %34 = fmul double %23, %23                      ; <double> [#uses=1]
  %35 = fdiv double 9.260000e-05, %34             ; <double> [#uses=2]
  %36 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 0, i32 1), align 8 ; <double> [#uses=1]
  %37 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 0, i32 0), align 32 ; <double> [#uses=1]
  %38 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 0, i32 0), i8* noalias getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0), double %37, double %36) nounwind ; <i32> [#uses=0]
  %39 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 1, i32 1), align 8 ; <double> [#uses=1]
  %40 = load double* getelementptr inbounds ([2 x [2 x double]]* @od_sa, i32 0, i32 1, i32 0), align 16 ; <double> [#uses=1]
  %41 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 1, i32 0), i8* noalias getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), double %40, double %39) nounwind ; <i32> [#uses=0]
  %42 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 2, i32 0), i8* noalias getelementptr inbounds ([48 x i8]* @.str8, i32 0, i32 0), double %28) nounwind ; <i32> [#uses=0]
  %43 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 3, i32 0), i8* noalias getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %35) nounwind ; <i32> [#uses=0]
  %44 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 4, i32 0), i8* noalias getelementptr inbounds ([48 x i8]* @.str10, i32 0, i32 0), double %32) nounwind ; <i32> [#uses=0]
  %45 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 5, i32 0), i8* noalias getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double 2.500000e-03) nounwind ; <i32> [#uses=0]
  %46 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 6, i32 0), i8* noalias getelementptr inbounds ([48 x i8]* @.str11, i32 0, i32 0), double %33) nounwind ; <i32> [#uses=0]
  %47 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* noalias getelementptr inbounds ([8 x [80 x i8]]* @outarr, i32 0, i32 7, i32 0), i8* noalias getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), double %35) nounwind ; <i32> [#uses=0]
  br label %bb12

bb12:                                             ; preds = %bb22, %bb11
  %48 = phi i32 [ 0, %bb11 ], [ %71, %bb22 ]      ; <i32> [#uses=5]
  %errors.35 = phi i32 [ 0, %bb11 ], [ %errors.2, %bb22 ] ; <i32> [#uses=3]
  %scevgep35 = getelementptr [8 x i8*]* @refarr, i32 0, i32 %48 ; <i8**> [#uses=4]
  %scevgep36 = getelementptr [8 x [80 x i8]]* @outarr, i32 0, i32 %48, i32 0 ; <i8*> [#uses=2]
  %49 = load i8** %scevgep35, align 4             ; <i8*> [#uses=1]
  %50 = tail call i32 @strcmp(i8* %scevgep36, i8* %49) nounwind readonly ; <i32> [#uses=1]
  %51 = icmp eq i32 %50, 0                        ; <i1> [#uses=1]
  br i1 %51, label %bb22, label %bb13

bb13:                                             ; preds = %bb12
  %tmp = add i32 %48, 1                           ; <i32> [#uses=1]
  %52 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([33 x i8]* @.str19, i32 0, i32 0), i32 %tmp) nounwind ; <i32> [#uses=0]
  %53 = load i8** %scevgep35, align 4             ; <i8*> [#uses=1]
  %54 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str20, i32 0, i32 0), i8* %53) nounwind ; <i32> [#uses=0]
  %55 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str21, i32 0, i32 0), i8* %scevgep36) nounwind ; <i32> [#uses=0]
  %56 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %57 = load i8** %scevgep35, align 4             ; <i8*> [#uses=2]
  %58 = tail call i32 @strlen(i8* %57) nounwind readonly ; <i32> [#uses=2]
  %59 = icmp sgt i32 %58, 0                       ; <i1> [#uses=1]
  br i1 %59, label %bb14, label %bb21

bb14:                                             ; preds = %bb14, %bb13
  %60 = phi i8* [ %65, %bb14 ], [ %57, %bb13 ]    ; <i8*> [#uses=1]
  %j.13 = phi i32 [ %69, %bb14 ], [ 0, %bb13 ]    ; <i32> [#uses=4]
  %errors.12 = phi i32 [ %errors.1., %bb14 ], [ %errors.35, %bb13 ] ; <i32> [#uses=1]
  %scevgep33 = getelementptr [8 x [80 x i8]]* @outarr, i32 0, i32 %48, i32 %j.13 ; <i8*> [#uses=2]
  %scevgep = getelementptr i8* %60, i32 %j.13     ; <i8*> [#uses=1]
  %61 = load i8* %scevgep, align 1                ; <i8> [#uses=1]
  %62 = load i8* %scevgep33, align 1              ; <i8> [#uses=1]
  %63 = icmp eq i8 %61, %62                       ; <i1> [#uses=1]
  %iftmp.110.0 = select i1 %63, i32 32, i32 94    ; <i32> [#uses=1]
  %64 = tail call i32 @putchar(i32 %iftmp.110.0) nounwind ; <i32> [#uses=0]
  %65 = load i8** %scevgep35, align 4             ; <i8*> [#uses=2]
  %scevgep32 = getelementptr i8* %65, i32 %j.13   ; <i8*> [#uses=1]
  %66 = load i8* %scevgep32, align 1              ; <i8> [#uses=1]
  %67 = load i8* %scevgep33, align 1              ; <i8> [#uses=1]
  %not. = icmp ne i8 %66, %67                     ; <i1> [#uses=1]
  %68 = zext i1 %not. to i32                      ; <i32> [#uses=1]
  %errors.1. = add i32 %68, %errors.12            ; <i32> [#uses=2]
  %69 = add nsw i32 %j.13, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %69, %58                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb21, label %bb14

bb21:                                             ; preds = %bb14, %bb13
  %errors.1.lcssa = phi i32 [ %errors.35, %bb13 ], [ %errors.1., %bb14 ] ; <i32> [#uses=1]
  %70 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  br label %bb22

bb22:                                             ; preds = %bb21, %bb12
  %errors.2 = phi i32 [ %errors.1.lcssa, %bb21 ], [ %errors.35, %bb12 ] ; <i32> [#uses=4]
  %71 = add nsw i32 %48, 1                        ; <i32> [#uses=2]
  %exitcond34 = icmp eq i32 %71, 8                ; <i1> [#uses=1]
  br i1 %exitcond34, label %bb24, label %bb12

bb24:                                             ; preds = %bb22
  %72 = icmp sgt i32 %errors.2, 0                 ; <i1> [#uses=1]
  br i1 %72, label %bb25, label %bb29

bb25:                                             ; preds = %bb24
  %73 = icmp sgt i32 %errors.2, 1                 ; <i1> [#uses=1]
  %iftmp.117.0 = select i1 %73, i8* getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str24, i32 0, i32 0) ; <i8*> [#uses=1]
  %74 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([48 x i8]* @.str25, i32 0, i32 0), i32 %errors.2, i8* %iftmp.117.0) nounwind ; <i32> [#uses=0]
  ret i32 0

bb29:                                             ; preds = %bb24
  %75 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @.str26, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @sprintf(i8* nocapture, i8* nocapture, ...) nounwind

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare i32 @strlen(i8* nocapture) nounwind readonly

declare i32 @putchar(i32) nounwind
