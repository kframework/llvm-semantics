; ModuleID = 'stepanov_v1p2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct.._27 = type <{ i8 }>
%struct.Double = type { double }
%struct.Double_pointer = type { %struct.Double* }
%struct.double_pointer = type { double* }
%"struct.reverse_iterator<Double_pointer,Double>" = type { %struct.Double_pointer }
%"struct.reverse_iterator<double_pointer,double>" = type { %struct.double_pointer }
%"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>" = type { %"struct.reverse_iterator<Double_pointer,Double>" }
%"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>" = type { %"struct.reverse_iterator<double_pointer,double>" }

@Data = internal global [2000 x %struct.Double] zeroinitializer, align 32 ; <[2000 x %struct.Double]*> [#uses=7]
@data = internal global [2000 x double] zeroinitializer, align 32 ; <[2000 x double]*> [#uses=8]
@rdPb = internal global %"struct.reverse_iterator<double_pointer,double>" { %struct.double_pointer { double* getelementptr ([2000 x double]* @data, i32 1, i32 0) } } ; <%"struct.reverse_iterator<double_pointer,double>"*> [#uses=1]
@rdPe = internal global %"struct.reverse_iterator<double_pointer,double>" { %struct.double_pointer { double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) } } ; <%"struct.reverse_iterator<double_pointer,double>"*> [#uses=1]
@rDPb = internal global %"struct.reverse_iterator<Double_pointer,Double>" { %struct.Double_pointer { %struct.Double* getelementptr ([2000 x %struct.Double]* @Data, i32 1, i32 0) } } ; <%"struct.reverse_iterator<Double_pointer,Double>"*> [#uses=1]
@rDPe = internal global %"struct.reverse_iterator<Double_pointer,Double>" { %struct.Double_pointer { %struct.Double* getelementptr inbounds ([2000 x %struct.Double]* @Data, i32 0, i32 0) } } ; <%"struct.reverse_iterator<Double_pointer,Double>"*> [#uses=1]
@rrdpb = internal global %"struct.reverse_iterator<double_pointer,double>" { %struct.double_pointer { double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) } } ; <%"struct.reverse_iterator<double_pointer,double>"*> [#uses=1]
@rrdpe = internal global %"struct.reverse_iterator<double_pointer,double>" { %struct.double_pointer { double* getelementptr ([2000 x double]* @data, i32 1, i32 0) } } ; <%"struct.reverse_iterator<double_pointer,double>"*> [#uses=1]
@rrDpb = internal global %"struct.reverse_iterator<Double_pointer,Double>" { %struct.Double_pointer { %struct.Double* getelementptr inbounds ([2000 x %struct.Double]* @Data, i32 0, i32 0) } } ; <%"struct.reverse_iterator<Double_pointer,Double>"*> [#uses=1]
@rrDpe = internal global %"struct.reverse_iterator<Double_pointer,Double>" { %struct.Double_pointer { %struct.Double* getelementptr ([2000 x %struct.Double]* @Data, i32 1, i32 0) } } ; <%"struct.reverse_iterator<Double_pointer,Double>"*> [#uses=1]
@rrdPb = internal global %"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>" { %"struct.reverse_iterator<double_pointer,double>" { %struct.double_pointer { double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) } } } ; <%"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>"*> [#uses=1]
@rrdPe = internal global %"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>" { %"struct.reverse_iterator<double_pointer,double>" { %struct.double_pointer { double* getelementptr ([2000 x double]* @data, i32 1, i32 0) } } } ; <%"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>"*> [#uses=1]
@rrDPb = internal global %"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>" { %"struct.reverse_iterator<Double_pointer,Double>" { %struct.Double_pointer { %struct.Double* getelementptr inbounds ([2000 x %struct.Double]* @Data, i32 0, i32 0) } } } ; <%"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>"*> [#uses=1]
@rrDPe = internal global %"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>" { %"struct.reverse_iterator<Double_pointer,Double>" { %struct.Double_pointer { %struct.Double* getelementptr ([2000 x %struct.Double]* @Data, i32 1, i32 0) } } } ; <%"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>"*> [#uses=1]
@.str = private constant [16 x i8] c"test %i failed\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@result_times = internal global [20 x double] zeroinitializer, align 32 ; <[20 x double]*> [#uses=15]
@.str1 = private constant [48 x i8] c"\0Atest      absolute   additions      ratio with\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str2 = private constant [43 x i8] c"number    time       per second     test0\0A\00", align 1 ; <[43 x i8]*> [#uses=1]
@.str3 = private constant [43 x i8] c"%2i       %5.2fsec    %5.2fM         %.2f\0A\00", align 1 ; <[43 x i8]*> [#uses=1]
@.str4 = private constant [42 x i8] c"mean:    %5.2fsec    %5.2fM         %.2f\0A\00", align 1 ; <[42 x i8]*> [#uses=1]
@.str5 = private constant [32 x i8] c"\0ATotal absolute time: %.2f sec\0A\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str6 = private constant [29 x i8] c"\0AAbstraction Penalty: %.2f\0A\0A\00", align 1 ; <[29 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [0 x %0] zeroinitializer ; <[0 x %0]*> [#uses=0]

declare i32 @clock() nounwind

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare double @llvm.log.f64(double) nounwind readonly

declare double @llvm.exp.f64(double) nounwind readonly

define i32 @main(i32 %argv, i8** nocapture %argc) nounwind {
entry:
  %0 = icmp sgt i32 %argv, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argc, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @atoi(i8* %2) nounwind readonly ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %iterations.0 = phi i32 [ %3, %bb ], [ 250000, %entry ] ; <i32> [#uses=22]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb1
  %indvar.i = phi i32 [ 0, %bb1 ], [ %tmp, %bb.i ] ; <i32> [#uses=2]
  %tmp = add i32 %indvar.i, 1                     ; <i32> [#uses=2]
  %first_addr.01.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i ; <double*> [#uses=1]
  store double 3.000000e+00, double* %first_addr.01.i, align 8
  %scevgep.i.idx.mask = and i32 %tmp, 536870911   ; <i32> [#uses=1]
  %4 = icmp eq i32 %scevgep.i.idx.mask, 2000      ; <i1> [#uses=1]
  br i1 %4, label %bb.i3, label %bb.i

bb.i3:                                            ; preds = %bb.i3, %bb.i
  %indvar.i1 = phi i32 [ %tmp4, %bb.i3 ], [ 0, %bb.i ] ; <i32> [#uses=2]
  %tmp4 = add i32 %indvar.i1, 1                   ; <i32> [#uses=2]
  %scevgep2.i = getelementptr inbounds [2000 x %struct.Double]* @Data, i32 0, i32 %indvar.i1, i32 0 ; <double*> [#uses=1]
  store double 3.000000e+00, double* %scevgep2.i, align 8
  %scevgep3.i.idx.mask = and i32 %tmp4, 536870911 ; <i32> [#uses=1]
  %5 = icmp eq i32 %scevgep3.i.idx.mask, 2000     ; <i1> [#uses=1]
  br i1 %5, label %_Z4fillIP6DoubleS0_EvT_S2_T0_.exit, label %bb.i3

_Z4fillIP6DoubleS0_EvT_S2_T0_.exit:               ; preds = %bb.i3
  %6 = tail call i32 @clock() nounwind            ; <i32> [#uses=1]
  %7 = icmp sgt i32 %iterations.0, 0              ; <i1> [#uses=13]
  br i1 %7, label %bb.nph5.i, label %_Z5test0PdS_.exit

bb.nph5.i:                                        ; preds = %_Z4fillIP6DoubleS0_EvT_S2_T0_.exit
  br i1 icmp sgt (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 0), label %bb2.preheader.us.i, label %bb2.preheader.i

bb2.preheader.us.i:                               ; preds = %_Z5checkd.exit.us.i, %bb.nph5.i
  %i.04.us.i = phi i32 [ %tmp6.i, %_Z5checkd.exit.us.i ], [ 0, %bb.nph5.i ] ; <i32> [#uses=1]
  %tmp6.i = add i32 %i.04.us.i, 1                 ; <i32> [#uses=2]
  br label %bb1.us.i

_Z5checkd.exit.us.i:                              ; preds = %bb2.bb3_crit_edge.us.i, %bb.i.us.i
  %8 = icmp slt i32 %tmp6.i, %iterations.0        ; <i1> [#uses=1]
  br i1 %8, label %bb2.preheader.us.i, label %_Z5test0PdS_.exit

bb.i.us.i:                                        ; preds = %bb2.bb3_crit_edge.us.i
  %9 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.us.i

bb1.us.i:                                         ; preds = %bb1.us.i, %bb2.preheader.us.i
  %result.02.us.i = phi double [ 0.000000e+00, %bb2.preheader.us.i ], [ %11, %bb1.us.i ] ; <double> [#uses=1]
  %n.01.us.i = phi i32 [ 0, %bb2.preheader.us.i ], [ %12, %bb1.us.i ] ; <i32> [#uses=2]
  %scevgep.i = getelementptr [2000 x double]* @data, i32 0, i32 %n.01.us.i ; <double*> [#uses=1]
  %10 = load double* %scevgep.i, align 8          ; <double> [#uses=1]
  %11 = fadd double %10, %result.02.us.i          ; <double> [#uses=2]
  %12 = add nsw i32 %n.01.us.i, 1                 ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %12, select (i1 icmp sgt (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 1), i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 1) ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb2.bb3_crit_edge.us.i, label %bb1.us.i

bb2.bb3_crit_edge.us.i:                           ; preds = %bb1.us.i
  %phitmp.i = fcmp une double %11, 6.000000e+03   ; <i1> [#uses=1]
  br i1 %phitmp.i, label %bb.i.us.i, label %_Z5checkd.exit.us.i

bb2.preheader.i:                                  ; preds = %bb2.preheader.i, %bb.nph5.i
  %i.04.i = phi i32 [ %tmp7.i, %bb2.preheader.i ], [ 0, %bb.nph5.i ] ; <i32> [#uses=1]
  %tmp7.i = add i32 %i.04.i, 1                    ; <i32> [#uses=2]
  %13 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  %14 = icmp slt i32 %tmp7.i, %iterations.0       ; <i1> [#uses=1]
  br i1 %14, label %bb2.preheader.i, label %_Z5test0PdS_.exit

_Z5test0PdS_.exit:                                ; preds = %bb2.preheader.i, %_Z5checkd.exit.us.i, %_Z4fillIP6DoubleS0_EvT_S2_T0_.exit
  %15 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %16 = sub i32 %15, %6                           ; <i32> [#uses=1]
  %17 = sitofp i32 %16 to double                  ; <double> [#uses=1]
  %18 = fdiv double %17, 1.000000e+06             ; <double> [#uses=1]
  store double %18, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 0), align 32
  %19 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.i206, label %_Z4testIPddEvT_S1_T0_.exit

bb.i206:                                          ; preds = %_Z5checkd.exit.i213, %_Z5test0PdS_.exit
  %i.02.i204 = phi i32 [ %tmp4.i205, %_Z5checkd.exit.i213 ], [ 0, %_Z5test0PdS_.exit ] ; <i32> [#uses=1]
  %tmp4.i205 = add i32 %i.02.i204, 1              ; <i32> [#uses=2]
  br label %bb.i1.i211

bb.i1.i211:                                       ; preds = %bb.i1.i211, %bb.i206
  %indvar.i.i207 = phi i32 [ 0, %bb.i206 ], [ %tmp3.i209, %bb.i1.i211 ] ; <i32> [#uses=2]
  %storemerge1.i.i208 = phi double [ 0.000000e+00, %bb.i206 ], [ %20, %bb.i1.i211 ] ; <double> [#uses=1]
  %tmp3.i209 = add i32 %indvar.i.i207, 1          ; <i32> [#uses=2]
  %first_addr.02.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i207 ; <double*> [#uses=1]
  %first_addr.0.val.i.i = load double* %first_addr.02.i.i, align 8 ; <double> [#uses=1]
  %20 = fadd double %storemerge1.i.i208, %first_addr.0.val.i.i ; <double> [#uses=2]
  %scevgep.i.idx.mask.i210 = and i32 %tmp3.i209, 536870911 ; <i32> [#uses=1]
  %21 = icmp eq i32 %scevgep.i.idx.mask.i210, 2000 ; <i1> [#uses=1]
  br i1 %21, label %_Z10accumulateIPddET0_T_S2_S1_.exit.i, label %bb.i1.i211

_Z10accumulateIPddET0_T_S2_S1_.exit.i:            ; preds = %bb.i1.i211
  %22 = fcmp une double %20, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %22, label %bb.i.i212, label %_Z5checkd.exit.i213

bb.i.i212:                                        ; preds = %_Z10accumulateIPddET0_T_S2_S1_.exit.i
  %23 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 1) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i213

_Z5checkd.exit.i213:                              ; preds = %bb.i.i212, %_Z10accumulateIPddET0_T_S2_S1_.exit.i
  %24 = icmp slt i32 %tmp4.i205, %iterations.0    ; <i1> [#uses=1]
  br i1 %24, label %bb.i206, label %_Z4testIPddEvT_S1_T0_.exit

_Z4testIPddEvT_S1_T0_.exit:                       ; preds = %_Z5checkd.exit.i213, %_Z5test0PdS_.exit
  %25 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %26 = sub i32 %25, %19                          ; <i32> [#uses=1]
  %27 = sitofp i32 %26 to double                  ; <double> [#uses=1]
  %28 = fdiv double %27, 1.000000e+06             ; <double> [#uses=1]
  store double %28, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 1), align 8
  %29 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.i196, label %_Z4testIP6DoubleS0_EvT_S2_T0_.exit

bb.i196:                                          ; preds = %_Z5checkd.exit.i202, %_Z4testIPddEvT_S1_T0_.exit
  %i.02.i194 = phi i32 [ %tmp5.i195, %_Z5checkd.exit.i202 ], [ 0, %_Z4testIPddEvT_S1_T0_.exit ] ; <i32> [#uses=1]
  %tmp5.i195 = add i32 %i.02.i194, 1              ; <i32> [#uses=2]
  br label %bb.i1.i200

bb.i1.i200:                                       ; preds = %bb.i1.i200, %bb.i196
  %indvar.i.i197 = phi i32 [ 0, %bb.i196 ], [ %tmp3.i199, %bb.i1.i200 ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i198 = phi double [ 0.000000e+00, %bb.i196 ], [ %30, %bb.i1.i200 ] ; <double> [#uses=1]
  %tmp3.i199 = add i32 %indvar.i.i197, 1          ; <i32> [#uses=2]
  %first_addr.0.idx.i.i = getelementptr inbounds [2000 x %struct.Double]* @Data, i32 0, i32 %indvar.i.i197, i32 0 ; <double*> [#uses=1]
  %first_addr.0.idx.val.i.i = load double* %first_addr.0.idx.i.i, align 8 ; <double> [#uses=1]
  %30 = fadd double %result_addr.0.01.i.i198, %first_addr.0.idx.val.i.i ; <double> [#uses=2]
  %scevgep.i.idx.mask.i = and i32 %tmp3.i199, 536870911 ; <i32> [#uses=1]
  %31 = icmp eq i32 %scevgep.i.idx.mask.i, 2000   ; <i1> [#uses=1]
  br i1 %31, label %_Z10accumulateIP6DoubleS0_ET0_T_S3_S2_.exit.i, label %bb.i1.i200

_Z10accumulateIP6DoubleS0_ET0_T_S3_S2_.exit.i:    ; preds = %bb.i1.i200
  %32 = fcmp une double %30, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %32, label %bb.i.i201, label %_Z5checkd.exit.i202

bb.i.i201:                                        ; preds = %_Z10accumulateIP6DoubleS0_ET0_T_S3_S2_.exit.i
  %33 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 2) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i202

_Z5checkd.exit.i202:                              ; preds = %bb.i.i201, %_Z10accumulateIP6DoubleS0_ET0_T_S3_S2_.exit.i
  %34 = icmp slt i32 %tmp5.i195, %iterations.0    ; <i1> [#uses=1]
  br i1 %34, label %bb.i196, label %_Z4testIP6DoubleS0_EvT_S2_T0_.exit

_Z4testIP6DoubleS0_EvT_S2_T0_.exit:               ; preds = %_Z5checkd.exit.i202, %_Z4testIPddEvT_S1_T0_.exit
  %35 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %36 = sub i32 %35, %29                          ; <i32> [#uses=1]
  %37 = sitofp i32 %36 to double                  ; <double> [#uses=1]
  %38 = fdiv double %37, 1.000000e+06             ; <double> [#uses=1]
  store double %38, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 2), align 16
  %39 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.i184, label %_Z4testI14double_pointerdEvT_S1_T0_.exit

bb.i184:                                          ; preds = %_Z5checkd.exit.i192, %_Z4testIP6DoubleS0_EvT_S2_T0_.exit
  %i.02.i182 = phi i32 [ %tmp4.i183, %_Z5checkd.exit.i192 ], [ 0, %_Z4testIP6DoubleS0_EvT_S2_T0_.exit ] ; <i32> [#uses=1]
  %tmp4.i183 = add i32 %i.02.i182, 1              ; <i32> [#uses=2]
  br label %bb.i1.i190

bb.i1.i190:                                       ; preds = %bb.i1.i190, %bb.i184
  %indvar.i.i185 = phi i32 [ 0, %bb.i184 ], [ %tmp3.i187, %bb.i1.i190 ] ; <i32> [#uses=2]
  %storemerge2.i.i186 = phi double [ 0.000000e+00, %bb.i184 ], [ %40, %bb.i1.i190 ] ; <double> [#uses=1]
  %tmp3.i187 = add i32 %indvar.i.i185, 1          ; <i32> [#uses=2]
  %first_addr.0.01.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i185 ; <double*> [#uses=1]
  %.val.i.i189 = load double* %first_addr.0.01.i.i, align 8 ; <double> [#uses=1]
  %40 = fadd double %storemerge2.i.i186, %.val.i.i189 ; <double> [#uses=2]
  %scevgep.i.i188.idx.mask = and i32 %tmp3.i187, 536870911 ; <i32> [#uses=1]
  %41 = icmp eq i32 %scevgep.i.i188.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %41, label %_Z10accumulateI14double_pointerdET0_T_S2_S1_.exit.i, label %bb.i1.i190

_Z10accumulateI14double_pointerdET0_T_S2_S1_.exit.i: ; preds = %bb.i1.i190
  %42 = fcmp une double %40, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %42, label %bb.i.i191, label %_Z5checkd.exit.i192

bb.i.i191:                                        ; preds = %_Z10accumulateI14double_pointerdET0_T_S2_S1_.exit.i
  %43 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 3) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i192

_Z5checkd.exit.i192:                              ; preds = %bb.i.i191, %_Z10accumulateI14double_pointerdET0_T_S2_S1_.exit.i
  %44 = icmp slt i32 %tmp4.i183, %iterations.0    ; <i1> [#uses=1]
  br i1 %44, label %bb.i184, label %_Z4testI14double_pointerdEvT_S1_T0_.exit

_Z4testI14double_pointerdEvT_S1_T0_.exit:         ; preds = %_Z5checkd.exit.i192, %_Z4testIP6DoubleS0_EvT_S2_T0_.exit
  %45 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %46 = sub i32 %45, %39                          ; <i32> [#uses=1]
  %47 = sitofp i32 %46 to double                  ; <double> [#uses=1]
  %48 = fdiv double %47, 1.000000e+06             ; <double> [#uses=1]
  store double %48, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 3), align 8
  %49 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.i172, label %_Z4testI14Double_pointer6DoubleEvT_S2_T0_.exit

bb.i172:                                          ; preds = %_Z5checkd.exit.i180, %_Z4testI14double_pointerdEvT_S1_T0_.exit
  %i.02.i170 = phi i32 [ %tmp5.i171, %_Z5checkd.exit.i180 ], [ 0, %_Z4testI14double_pointerdEvT_S1_T0_.exit ] ; <i32> [#uses=1]
  %tmp5.i171 = add i32 %i.02.i170, 1              ; <i32> [#uses=2]
  br label %bb.i1.i178

bb.i1.i178:                                       ; preds = %bb.i1.i178, %bb.i172
  %indvar.i.i173 = phi i32 [ 0, %bb.i172 ], [ %tmp3.i, %bb.i1.i178 ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i174 = phi double [ 0.000000e+00, %bb.i172 ], [ %50, %bb.i1.i178 ] ; <double> [#uses=1]
  %tmp3.i = add i32 %indvar.i.i173, 1             ; <i32> [#uses=2]
  %.idx.i.i176 = getelementptr inbounds [2000 x %struct.Double]* @Data, i32 0, i32 %indvar.i.i173, i32 0 ; <double*> [#uses=1]
  %.idx.val.i.i177 = load double* %.idx.i.i176, align 8 ; <double> [#uses=1]
  %50 = fadd double %result_addr.0.01.i.i174, %.idx.val.i.i177 ; <double> [#uses=2]
  %scevgep5.i.i175.idx.mask = and i32 %tmp3.i, 536870911 ; <i32> [#uses=1]
  %51 = icmp eq i32 %scevgep5.i.i175.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %51, label %_Z10accumulateI14Double_pointer6DoubleET0_T_S3_S2_.exit.i, label %bb.i1.i178

_Z10accumulateI14Double_pointer6DoubleET0_T_S3_S2_.exit.i: ; preds = %bb.i1.i178
  %52 = fcmp une double %50, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %52, label %bb.i.i179, label %_Z5checkd.exit.i180

bb.i.i179:                                        ; preds = %_Z10accumulateI14Double_pointer6DoubleET0_T_S3_S2_.exit.i
  %53 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 4) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i180

_Z5checkd.exit.i180:                              ; preds = %bb.i.i179, %_Z10accumulateI14Double_pointer6DoubleET0_T_S3_S2_.exit.i
  %54 = icmp slt i32 %tmp5.i171, %iterations.0    ; <i1> [#uses=1]
  br i1 %54, label %bb.i172, label %_Z4testI14Double_pointer6DoubleEvT_S2_T0_.exit

_Z4testI14Double_pointer6DoubleEvT_S2_T0_.exit:   ; preds = %_Z5checkd.exit.i180, %_Z4testI14double_pointerdEvT_S1_T0_.exit
  %55 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %56 = sub i32 %55, %49                          ; <i32> [#uses=1]
  %57 = sitofp i32 %56 to double                  ; <double> [#uses=1]
  %58 = fdiv double %57, 1.000000e+06             ; <double> [#uses=1]
  store double %58, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 4), align 32
  %59 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.i160, label %_Z4testI16reverse_iteratorIPddEdEvT_S3_T0_.exit

bb.i160:                                          ; preds = %_Z5checkd.exit.i168, %_Z4testI14Double_pointer6DoubleEvT_S2_T0_.exit
  %i.02.i159 = phi i32 [ %tmp5.i, %_Z5checkd.exit.i168 ], [ 0, %_Z4testI14Double_pointer6DoubleEvT_S2_T0_.exit ] ; <i32> [#uses=1]
  %tmp5.i = add i32 %i.02.i159, 1                 ; <i32> [#uses=2]
  br label %bb.i1.i166

bb.i1.i166:                                       ; preds = %bb.i1.i166, %bb.i160
  %indvar.i.i161 = phi i32 [ 0, %bb.i160 ], [ %indvar.next.i.i165, %bb.i1.i166 ] ; <i32> [#uses=2]
  %storemerge2.i.i = phi double [ 0.000000e+00, %bb.i160 ], [ %60, %bb.i1.i166 ] ; <double> [#uses=1]
  %tmp4.i162 = xor i32 %indvar.i.i161, -1         ; <i32> [#uses=1]
  %scevgep.i.i163 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp4.i162 ; <double*> [#uses=2]
  %.val.i.i164 = load double* %scevgep.i.i163, align 8 ; <double> [#uses=1]
  %60 = fadd double %storemerge2.i.i, %.val.i.i164 ; <double> [#uses=2]
  %61 = icmp eq double* %scevgep.i.i163, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  %indvar.next.i.i165 = add i32 %indvar.i.i161, 1 ; <i32> [#uses=1]
  br i1 %61, label %_Z10accumulateI16reverse_iteratorIPddEdET0_T_S4_S3_.exit.i, label %bb.i1.i166

_Z10accumulateI16reverse_iteratorIPddEdET0_T_S4_S3_.exit.i: ; preds = %bb.i1.i166
  %62 = fcmp une double %60, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %62, label %bb.i.i167, label %_Z5checkd.exit.i168

bb.i.i167:                                        ; preds = %_Z10accumulateI16reverse_iteratorIPddEdET0_T_S4_S3_.exit.i
  %63 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 5) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i168

_Z5checkd.exit.i168:                              ; preds = %bb.i.i167, %_Z10accumulateI16reverse_iteratorIPddEdET0_T_S4_S3_.exit.i
  %64 = icmp slt i32 %tmp5.i, %iterations.0       ; <i1> [#uses=1]
  br i1 %64, label %bb.i160, label %_Z4testI16reverse_iteratorIPddEdEvT_S3_T0_.exit

_Z4testI16reverse_iteratorIPddEdEvT_S3_T0_.exit:  ; preds = %_Z5checkd.exit.i168, %_Z4testI14Double_pointer6DoubleEvT_S2_T0_.exit
  %65 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %66 = sub i32 %65, %59                          ; <i32> [#uses=1]
  %67 = sitofp i32 %66 to double                  ; <double> [#uses=1]
  %68 = fdiv double %67, 1.000000e+06             ; <double> [#uses=1]
  store double %68, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 5), align 8
  %69 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.i149, label %_Z4testI16reverse_iteratorIP6DoubleS1_ES1_EvT_S4_T0_.exit

bb.i149:                                          ; preds = %_Z5checkd.exit.i157, %_Z4testI16reverse_iteratorIPddEdEvT_S3_T0_.exit
  %i.02.i = phi i32 [ %tmp6.i148, %_Z5checkd.exit.i157 ], [ 0, %_Z4testI16reverse_iteratorIPddEdEvT_S3_T0_.exit ] ; <i32> [#uses=1]
  %tmp6.i148 = add i32 %i.02.i, 1                 ; <i32> [#uses=2]
  br label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i1.i, %bb.i149
  %indvar.i.i150 = phi i32 [ 0, %bb.i149 ], [ %indvar.next.i.i155, %bb.i1.i ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i151 = phi double [ 0.000000e+00, %bb.i149 ], [ %70, %bb.i1.i ] ; <double> [#uses=1]
  %tmp4.i = xor i32 %indvar.i.i150, -1            ; <i32> [#uses=2]
  %scevgep.i.i152 = getelementptr [2000 x %struct.Double]* @Data, i32 1, i32 %tmp4.i ; <%struct.Double*> [#uses=1]
  %.idx.i.i153 = getelementptr [2000 x %struct.Double]* @Data, i32 1, i32 %tmp4.i, i32 0 ; <double*> [#uses=1]
  %.idx.val.i.i154 = load double* %.idx.i.i153, align 8 ; <double> [#uses=1]
  %70 = fadd double %result_addr.0.01.i.i151, %.idx.val.i.i154 ; <double> [#uses=2]
  %71 = icmp eq %struct.Double* %scevgep.i.i152, getelementptr inbounds ([2000 x %struct.Double]* @Data, i32 0, i32 0) ; <i1> [#uses=1]
  %indvar.next.i.i155 = add i32 %indvar.i.i150, 1 ; <i32> [#uses=1]
  br i1 %71, label %_Z10accumulateI16reverse_iteratorIP6DoubleS1_ES1_ET0_T_S5_S4_.exit.i, label %bb.i1.i

_Z10accumulateI16reverse_iteratorIP6DoubleS1_ES1_ET0_T_S5_S4_.exit.i: ; preds = %bb.i1.i
  %72 = fcmp une double %70, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %72, label %bb.i.i156, label %_Z5checkd.exit.i157

bb.i.i156:                                        ; preds = %_Z10accumulateI16reverse_iteratorIP6DoubleS1_ES1_ET0_T_S5_S4_.exit.i
  %73 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 6) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i157

_Z5checkd.exit.i157:                              ; preds = %bb.i.i156, %_Z10accumulateI16reverse_iteratorIP6DoubleS1_ES1_ET0_T_S5_S4_.exit.i
  %74 = icmp slt i32 %tmp6.i148, %iterations.0    ; <i1> [#uses=1]
  br i1 %74, label %bb.i149, label %_Z4testI16reverse_iteratorIP6DoubleS1_ES1_EvT_S4_T0_.exit

_Z4testI16reverse_iteratorIP6DoubleS1_ES1_EvT_S4_T0_.exit: ; preds = %_Z5checkd.exit.i157, %_Z4testI16reverse_iteratorIPddEdEvT_S3_T0_.exit
  %75 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %76 = sub i32 %75, %69                          ; <i32> [#uses=1]
  %77 = sitofp i32 %76 to double                  ; <double> [#uses=1]
  %78 = fdiv double %77, 1.000000e+06             ; <double> [#uses=1]
  store double %78, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 6), align 16
  %tmp237 = load double** getelementptr inbounds (%"struct.reverse_iterator<double_pointer,double>"* @rdPb, i32 0, i32 0, i32 0), align 8 ; <double*> [#uses=2]
  %tmp235 = load double** getelementptr inbounds (%"struct.reverse_iterator<double_pointer,double>"* @rdPe, i32 0, i32 0, i32 0), align 8 ; <double*> [#uses=2]
  %79 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.nph.i129, label %_Z4testI16reverse_iteratorI14double_pointerdEdEvT_S3_T0_.exit

bb.nph.i129:                                      ; preds = %_Z4testI16reverse_iteratorIP6DoubleS1_ES1_EvT_S4_T0_.exit
  %80 = icmp eq double* %tmp237, %tmp235          ; <i1> [#uses=1]
  br i1 %80, label %bb.us.i132, label %bb.i137

bb.us.i132:                                       ; preds = %bb.us.i132, %bb.nph.i129
  %i.013.us.i130 = phi i32 [ %tmp.i131, %bb.us.i132 ], [ 0, %bb.nph.i129 ] ; <i32> [#uses=1]
  %tmp.i131 = add i32 %i.013.us.i130, 1           ; <i32> [#uses=2]
  %81 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 7) nounwind ; <i32> [#uses=0]
  %82 = icmp slt i32 %tmp.i131, %iterations.0     ; <i1> [#uses=1]
  br i1 %82, label %bb.us.i132, label %_Z4testI16reverse_iteratorI14double_pointerdEdEvT_S3_T0_.exit

bb.i137:                                          ; preds = %_Z5checkd.exit.i146, %bb.nph.i129
  %i.013.i135 = phi i32 [ %tmp16.i136, %_Z5checkd.exit.i146 ], [ 0, %bb.nph.i129 ] ; <i32> [#uses=1]
  %tmp16.i136 = add i32 %i.013.i135, 1            ; <i32> [#uses=2]
  br label %bb.i6.i144

bb.i6.i144:                                       ; preds = %bb.i6.i144, %bb.i137
  %indvar.i.i138 = phi i32 [ 0, %bb.i137 ], [ %indvar.next.i.i143, %bb.i6.i144 ] ; <i32> [#uses=2]
  %storemerge1.i.i139 = phi double [ 0.000000e+00, %bb.i137 ], [ %83, %bb.i6.i144 ] ; <double> [#uses=1]
  %tmp15.i140 = xor i32 %indvar.i.i138, -1        ; <i32> [#uses=1]
  %scevgep.i.i141 = getelementptr double* %tmp237, i32 %tmp15.i140 ; <double*> [#uses=2]
  %.val.i.i142 = load double* %scevgep.i.i141     ; <double> [#uses=1]
  %83 = fadd double %storemerge1.i.i139, %.val.i.i142 ; <double> [#uses=2]
  %84 = icmp eq double* %scevgep.i.i141, %tmp235  ; <i1> [#uses=1]
  %indvar.next.i.i143 = add i32 %indvar.i.i138, 1 ; <i32> [#uses=1]
  br i1 %84, label %_Z10accumulateI16reverse_iteratorI14double_pointerdEdET0_T_S4_S3_.exit.i, label %bb.i6.i144

_Z10accumulateI16reverse_iteratorI14double_pointerdEdET0_T_S4_S3_.exit.i: ; preds = %bb.i6.i144
  %85 = fcmp une double %83, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %85, label %bb.i.i145, label %_Z5checkd.exit.i146

bb.i.i145:                                        ; preds = %_Z10accumulateI16reverse_iteratorI14double_pointerdEdET0_T_S4_S3_.exit.i
  %86 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 7) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i146

_Z5checkd.exit.i146:                              ; preds = %bb.i.i145, %_Z10accumulateI16reverse_iteratorI14double_pointerdEdET0_T_S4_S3_.exit.i
  %87 = icmp slt i32 %tmp16.i136, %iterations.0   ; <i1> [#uses=1]
  br i1 %87, label %bb.i137, label %_Z4testI16reverse_iteratorI14double_pointerdEdEvT_S3_T0_.exit

_Z4testI16reverse_iteratorI14double_pointerdEdEvT_S3_T0_.exit: ; preds = %_Z5checkd.exit.i146, %bb.us.i132, %_Z4testI16reverse_iteratorIP6DoubleS1_ES1_EvT_S4_T0_.exit
  %88 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  %89 = sub i32 %88, %79                          ; <i32> [#uses=1]
  %90 = sitofp i32 %89 to double                  ; <double> [#uses=1]
  %91 = fdiv double %90, 1.000000e+06             ; <double> [#uses=1]
  store double %91, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 7), align 8
  %tmp233 = load %struct.Double** getelementptr inbounds (%"struct.reverse_iterator<Double_pointer,Double>"* @rDPb, i32 0, i32 0, i32 0), align 8 ; <%struct.Double*> [#uses=3]
  %tmp231 = load %struct.Double** getelementptr inbounds (%"struct.reverse_iterator<Double_pointer,Double>"* @rDPe, i32 0, i32 0, i32 0), align 8 ; <%struct.Double*> [#uses=2]
  %92 = tail call i32 @clock() nounwind           ; <i32> [#uses=1]
  br i1 %7, label %bb.nph.i102, label %_Z4testI16reverse_iteratorI14Double_pointer6DoubleES2_EvT_S4_T0_.exit

bb.nph.i102:                                      ; preds = %_Z4testI16reverse_iteratorI14double_pointerdEdEvT_S3_T0_.exit
  %93 = icmp eq %struct.Double* %tmp233, %tmp231  ; <i1> [#uses=1]
  br i1 %93, label %bb.us.i105, label %bb.i109

bb.us.i105:                                       ; preds = %bb.us.i105, %bb.nph.i102
  %i.013.us.i103 = phi i32 [ %tmp.i104, %bb.us.i105 ], [ 0, %bb.nph.i102 ] ; <i32> [#uses=1]
  %tmp.i104 = add i32 %i.013.us.i103, 1           ; <i32> [#uses=2]
  %94 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 8) nounwind ; <i32> [#uses=0]
  %95 = icmp slt i32 %tmp.i104, %iterations.0     ; <i1> [#uses=1]
  br i1 %95, label %bb.us.i105, label %_Z4testI16reverse_iteratorI14Double_pointer6DoubleES2_EvT_S4_T0_.exit

bb.i109:                                          ; preds = %_Z5checkd.exit.i118, %bb.nph.i102
  %i.013.i108 = phi i32 [ %tmp17.i, %_Z5checkd.exit.i118 ], [ 0, %bb.nph.i102 ] ; <i32> [#uses=1]
  %tmp17.i = add i32 %i.013.i108, 1               ; <i32> [#uses=2]
  br label %bb.i6.i116

bb.i6.i116:                                       ; preds = %bb.i6.i116, %bb.i109
  %indvar.i.i110 = phi i32 [ 0, %bb.i109 ], [ %indvar.next.i.i, %bb.i6.i116 ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i111 = phi double [ 0.000000e+00, %bb.i109 ], [ %96, %bb.i6.i116 ] ; <double> [#uses=1]
  %tmp15.i112 = xor i32 %indvar.i.i110, -1        ; <i32> [#uses=2]
  %scevgep.i.i113 = getelementptr %struct.Double* %tmp233, i32 %tmp15.i112 ; <%struct.Double*> [#uses=1]
  %.idx.i.i114 = getelementptr inbounds %struct.Double* %tmp233, i32 %tmp15.i112, i32 0 ; <double*> [#uses=1]
  %.idx.val.i.i115 = load double* %.idx.i.i114    ; <double> [#uses=1]
  %96 = fadd double %result_addr.0.01.i.i111, %.idx.val.i.i115 ; <double> [#uses=2]
  %97 = icmp eq %struct.Double* %scevgep.i.i113, %tmp231 ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i110, 1    ; <i32> [#uses=1]
  br i1 %97, label %_Z10accumulateI16reverse_iteratorI14Double_pointer6DoubleES2_ET0_T_S5_S4_.exit.i, label %bb.i6.i116

_Z10accumulateI16reverse_iteratorI14Double_pointer6DoubleES2_ET0_T_S5_S4_.exit.i: ; preds = %bb.i6.i116
  %98 = fcmp une double %96, 6.000000e+03         ; <i1> [#uses=1]
  br i1 %98, label %bb.i.i117, label %_Z5checkd.exit.i118

bb.i.i117:                                        ; preds = %_Z10accumulateI16reverse_iteratorI14Double_pointer6DoubleES2_ET0_T_S5_S4_.exit.i
  %99 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 8) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i118

_Z5checkd.exit.i118:                              ; preds = %bb.i.i117, %_Z10accumulateI16reverse_iteratorI14Double_pointer6DoubleES2_ET0_T_S5_S4_.exit.i
  %100 = icmp slt i32 %tmp17.i, %iterations.0     ; <i1> [#uses=1]
  br i1 %100, label %bb.i109, label %_Z4testI16reverse_iteratorI14Double_pointer6DoubleES2_EvT_S4_T0_.exit

_Z4testI16reverse_iteratorI14Double_pointer6DoubleES2_EvT_S4_T0_.exit: ; preds = %_Z5checkd.exit.i118, %bb.us.i105, %_Z4testI16reverse_iteratorI14double_pointerdEdEvT_S3_T0_.exit
  %101 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %102 = sub i32 %101, %92                        ; <i32> [#uses=1]
  %103 = sitofp i32 %102 to double                ; <double> [#uses=1]
  %104 = fdiv double %103, 1.000000e+06           ; <double> [#uses=1]
  store double %104, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 8), align 32
  %tmp229 = load double** getelementptr inbounds (%"struct.reverse_iterator<double_pointer,double>"* @rrdpb, i32 0, i32 0, i32 0), align 8 ; <double*> [#uses=3]
  %tmp227 = load double** getelementptr inbounds (%"struct.reverse_iterator<double_pointer,double>"* @rrdpe, i32 0, i32 0, i32 0), align 8 ; <double*> [#uses=2]
  %105 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %7, label %bb.nph.i74, label %_Z4testI16reverse_iteratorIS0_IPddEdEdEvT_S4_T0_.exit

bb.nph.i74:                                       ; preds = %_Z4testI16reverse_iteratorI14Double_pointer6DoubleES2_EvT_S4_T0_.exit
  %106 = icmp eq double* %tmp229, %tmp227         ; <i1> [#uses=1]
  br i1 %106, label %bb.us.i77, label %bb.i82

bb.us.i77:                                        ; preds = %bb.us.i77, %bb.nph.i74
  %i.013.us.i75 = phi i32 [ %tmp.i76, %bb.us.i77 ], [ 0, %bb.nph.i74 ] ; <i32> [#uses=1]
  %tmp.i76 = add i32 %i.013.us.i75, 1             ; <i32> [#uses=2]
  %107 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 9) nounwind ; <i32> [#uses=0]
  %108 = icmp slt i32 %tmp.i76, %iterations.0     ; <i1> [#uses=1]
  br i1 %108, label %bb.us.i77, label %_Z4testI16reverse_iteratorIS0_IPddEdEdEvT_S4_T0_.exit

bb.i82:                                           ; preds = %_Z5checkd.exit.i91, %bb.nph.i74
  %i.013.i80 = phi i32 [ %tmp15.i81, %_Z5checkd.exit.i91 ], [ 0, %bb.nph.i74 ] ; <i32> [#uses=1]
  %tmp15.i81 = add i32 %i.013.i80, 1              ; <i32> [#uses=2]
  br label %bb.i6.i89

bb.i6.i89:                                        ; preds = %bb.i6.i89, %bb.i82
  %indvar.i.i83 = phi i32 [ 0, %bb.i82 ], [ %tmp14.i85, %bb.i6.i89 ] ; <i32> [#uses=2]
  %storemerge1.i.i84 = phi double [ 0.000000e+00, %bb.i82 ], [ %109, %bb.i6.i89 ] ; <double> [#uses=1]
  %tmp14.i85 = add i32 %indvar.i.i83, 1           ; <i32> [#uses=2]
  %scevgep.i.i86 = getelementptr double* %tmp229, i32 %tmp14.i85 ; <double*> [#uses=1]
  %.tmp.0.i.i87 = getelementptr double* %tmp229, i32 %indvar.i.i83 ; <double*> [#uses=1]
  %.val.i.i88 = load double* %.tmp.0.i.i87        ; <double> [#uses=1]
  %109 = fadd double %storemerge1.i.i84, %.val.i.i88 ; <double> [#uses=2]
  %110 = icmp eq double* %scevgep.i.i86, %tmp227  ; <i1> [#uses=1]
  br i1 %110, label %_Z10accumulateI16reverse_iteratorIS0_IPddEdEdET0_T_S5_S4_.exit.i, label %bb.i6.i89

_Z10accumulateI16reverse_iteratorIS0_IPddEdEdET0_T_S5_S4_.exit.i: ; preds = %bb.i6.i89
  %111 = fcmp une double %109, 6.000000e+03       ; <i1> [#uses=1]
  br i1 %111, label %bb.i.i90, label %_Z5checkd.exit.i91

bb.i.i90:                                         ; preds = %_Z10accumulateI16reverse_iteratorIS0_IPddEdEdET0_T_S5_S4_.exit.i
  %112 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 9) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i91

_Z5checkd.exit.i91:                               ; preds = %bb.i.i90, %_Z10accumulateI16reverse_iteratorIS0_IPddEdEdET0_T_S5_S4_.exit.i
  %113 = icmp slt i32 %tmp15.i81, %iterations.0   ; <i1> [#uses=1]
  br i1 %113, label %bb.i82, label %_Z4testI16reverse_iteratorIS0_IPddEdEdEvT_S4_T0_.exit

_Z4testI16reverse_iteratorIS0_IPddEdEdEvT_S4_T0_.exit: ; preds = %_Z5checkd.exit.i91, %bb.us.i77, %_Z4testI16reverse_iteratorI14Double_pointer6DoubleES2_EvT_S4_T0_.exit
  %114 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %115 = sub i32 %114, %105                       ; <i32> [#uses=1]
  %116 = sitofp i32 %115 to double                ; <double> [#uses=1]
  %117 = fdiv double %116, 1.000000e+06           ; <double> [#uses=1]
  store double %117, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 9), align 8
  %tmp225 = load %struct.Double** getelementptr inbounds (%"struct.reverse_iterator<Double_pointer,Double>"* @rrDpb, i32 0, i32 0, i32 0), align 8 ; <%struct.Double*> [#uses=3]
  %tmp223 = load %struct.Double** getelementptr inbounds (%"struct.reverse_iterator<Double_pointer,Double>"* @rrDpe, i32 0, i32 0, i32 0), align 8 ; <%struct.Double*> [#uses=2]
  %118 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %7, label %bb.nph.i46, label %_Z4testI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_EvT_S5_T0_.exit

bb.nph.i46:                                       ; preds = %_Z4testI16reverse_iteratorIS0_IPddEdEdEvT_S4_T0_.exit
  %119 = icmp eq %struct.Double* %tmp225, %tmp223 ; <i1> [#uses=1]
  br i1 %119, label %bb.us.i49, label %bb.i54

bb.us.i49:                                        ; preds = %bb.us.i49, %bb.nph.i46
  %i.013.us.i47 = phi i32 [ %tmp.i48, %bb.us.i49 ], [ 0, %bb.nph.i46 ] ; <i32> [#uses=1]
  %tmp.i48 = add i32 %i.013.us.i47, 1             ; <i32> [#uses=2]
  %120 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 10) nounwind ; <i32> [#uses=0]
  %121 = icmp slt i32 %tmp.i48, %iterations.0     ; <i1> [#uses=1]
  br i1 %121, label %bb.us.i49, label %_Z4testI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_EvT_S5_T0_.exit

bb.i54:                                           ; preds = %_Z5checkd.exit.i63, %bb.nph.i46
  %i.013.i52 = phi i32 [ %tmp16.i53, %_Z5checkd.exit.i63 ], [ 0, %bb.nph.i46 ] ; <i32> [#uses=1]
  %tmp16.i53 = add i32 %i.013.i52, 1              ; <i32> [#uses=2]
  br label %bb.i6.i61

bb.i6.i61:                                        ; preds = %bb.i6.i61, %bb.i54
  %indvar.i.i55 = phi i32 [ 0, %bb.i54 ], [ %tmp14.i57, %bb.i6.i61 ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i56 = phi double [ 0.000000e+00, %bb.i54 ], [ %122, %bb.i6.i61 ] ; <double> [#uses=1]
  %tmp14.i57 = add i32 %indvar.i.i55, 1           ; <i32> [#uses=2]
  %scevgep5.i.i58 = getelementptr %struct.Double* %tmp225, i32 %tmp14.i57 ; <%struct.Double*> [#uses=1]
  %.idx.i.i59 = getelementptr inbounds %struct.Double* %tmp225, i32 %indvar.i.i55, i32 0 ; <double*> [#uses=1]
  %.idx.val.i.i60 = load double* %.idx.i.i59      ; <double> [#uses=1]
  %122 = fadd double %result_addr.0.01.i.i56, %.idx.val.i.i60 ; <double> [#uses=2]
  %123 = icmp eq %struct.Double* %scevgep5.i.i58, %tmp223 ; <i1> [#uses=1]
  br i1 %123, label %_Z10accumulateI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_ET0_T_S6_S5_.exit.i, label %bb.i6.i61

_Z10accumulateI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_ET0_T_S6_S5_.exit.i: ; preds = %bb.i6.i61
  %124 = fcmp une double %122, 6.000000e+03       ; <i1> [#uses=1]
  br i1 %124, label %bb.i.i62, label %_Z5checkd.exit.i63

bb.i.i62:                                         ; preds = %_Z10accumulateI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_ET0_T_S6_S5_.exit.i
  %125 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 10) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i63

_Z5checkd.exit.i63:                               ; preds = %bb.i.i62, %_Z10accumulateI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_ET0_T_S6_S5_.exit.i
  %126 = icmp slt i32 %tmp16.i53, %iterations.0   ; <i1> [#uses=1]
  br i1 %126, label %bb.i54, label %_Z4testI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_EvT_S5_T0_.exit

_Z4testI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_EvT_S5_T0_.exit: ; preds = %_Z5checkd.exit.i63, %bb.us.i49, %_Z4testI16reverse_iteratorIS0_IPddEdEdEvT_S4_T0_.exit
  %127 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %128 = sub i32 %127, %118                       ; <i32> [#uses=1]
  %129 = sitofp i32 %128 to double                ; <double> [#uses=1]
  %130 = fdiv double %129, 1.000000e+06           ; <double> [#uses=1]
  store double %130, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 10), align 16
  %tmp221 = load double** getelementptr inbounds (%"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>"* @rrdPb, i32 0, i32 0, i32 0, i32 0), align 8 ; <double*> [#uses=3]
  %tmp219 = load double** getelementptr inbounds (%"struct.reverse_iterator<reverse_iterator<double_pointer, double>,double>"* @rrdPe, i32 0, i32 0, i32 0, i32 0), align 8 ; <double*> [#uses=2]
  %131 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %7, label %bb.nph.i23, label %_Z4testI16reverse_iteratorIS0_I14double_pointerdEdEdEvT_S4_T0_.exit

bb.nph.i23:                                       ; preds = %_Z4testI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_EvT_S5_T0_.exit
  %132 = icmp eq double* %tmp221, %tmp219         ; <i1> [#uses=1]
  br i1 %132, label %bb.us.i26, label %bb.i30

bb.us.i26:                                        ; preds = %bb.us.i26, %bb.nph.i23
  %i.013.us.i24 = phi i32 [ %tmp.i25, %bb.us.i26 ], [ 0, %bb.nph.i23 ] ; <i32> [#uses=1]
  %tmp.i25 = add i32 %i.013.us.i24, 1             ; <i32> [#uses=2]
  %133 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 11) nounwind ; <i32> [#uses=0]
  %134 = icmp slt i32 %tmp.i25, %iterations.0     ; <i1> [#uses=1]
  br i1 %134, label %bb.us.i26, label %_Z4testI16reverse_iteratorIS0_I14double_pointerdEdEdEvT_S4_T0_.exit

bb.i30:                                           ; preds = %_Z5checkd.exit.i35, %bb.nph.i23
  %i.013.i29 = phi i32 [ %tmp15.i, %_Z5checkd.exit.i35 ], [ 0, %bb.nph.i23 ] ; <i32> [#uses=1]
  %tmp15.i = add i32 %i.013.i29, 1                ; <i32> [#uses=2]
  br label %bb.i6.i33

bb.i6.i33:                                        ; preds = %bb.i6.i33, %bb.i30
  %indvar.i.i31 = phi i32 [ 0, %bb.i30 ], [ %tmp14.i32, %bb.i6.i33 ] ; <i32> [#uses=2]
  %storemerge1.i.i = phi double [ 0.000000e+00, %bb.i30 ], [ %135, %bb.i6.i33 ] ; <double> [#uses=1]
  %tmp14.i32 = add i32 %indvar.i.i31, 1           ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr double* %tmp221, i32 %tmp14.i32 ; <double*> [#uses=1]
  %.tmp.0.i.i = getelementptr double* %tmp221, i32 %indvar.i.i31 ; <double*> [#uses=1]
  %.val.i.i = load double* %.tmp.0.i.i            ; <double> [#uses=1]
  %135 = fadd double %storemerge1.i.i, %.val.i.i  ; <double> [#uses=2]
  %136 = icmp eq double* %scevgep.i.i, %tmp219    ; <i1> [#uses=1]
  br i1 %136, label %_Z10accumulateI16reverse_iteratorIS0_I14double_pointerdEdEdET0_T_S5_S4_.exit.i, label %bb.i6.i33

_Z10accumulateI16reverse_iteratorIS0_I14double_pointerdEdEdET0_T_S5_S4_.exit.i: ; preds = %bb.i6.i33
  %137 = fcmp une double %135, 6.000000e+03       ; <i1> [#uses=1]
  br i1 %137, label %bb.i.i34, label %_Z5checkd.exit.i35

bb.i.i34:                                         ; preds = %_Z10accumulateI16reverse_iteratorIS0_I14double_pointerdEdEdET0_T_S5_S4_.exit.i
  %138 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 11) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i35

_Z5checkd.exit.i35:                               ; preds = %bb.i.i34, %_Z10accumulateI16reverse_iteratorIS0_I14double_pointerdEdEdET0_T_S5_S4_.exit.i
  %139 = icmp slt i32 %tmp15.i, %iterations.0     ; <i1> [#uses=1]
  br i1 %139, label %bb.i30, label %_Z4testI16reverse_iteratorIS0_I14double_pointerdEdEdEvT_S4_T0_.exit

_Z4testI16reverse_iteratorIS0_I14double_pointerdEdEdEvT_S4_T0_.exit: ; preds = %_Z5checkd.exit.i35, %bb.us.i26, %_Z4testI16reverse_iteratorIS0_IP6DoubleS1_ES1_ES1_EvT_S5_T0_.exit
  %140 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %141 = sub i32 %140, %131                       ; <i32> [#uses=1]
  %142 = sitofp i32 %141 to double                ; <double> [#uses=1]
  %143 = fdiv double %142, 1.000000e+06           ; <double> [#uses=1]
  store double %143, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 11), align 8
  %tmp217 = load %struct.Double** getelementptr inbounds (%"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>"* @rrDPb, i32 0, i32 0, i32 0, i32 0), align 8 ; <%struct.Double*> [#uses=3]
  %tmp215 = load %struct.Double** getelementptr inbounds (%"struct.reverse_iterator<reverse_iterator<Double_pointer, Double>,Double>"* @rrDPe, i32 0, i32 0, i32 0, i32 0), align 8 ; <%struct.Double*> [#uses=2]
  %144 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  br i1 %7, label %bb.nph.i9, label %bb.i1.preheader

bb.nph.i9:                                        ; preds = %_Z4testI16reverse_iteratorIS0_I14double_pointerdEdEdEvT_S4_T0_.exit
  %145 = icmp eq %struct.Double* %tmp217, %tmp215 ; <i1> [#uses=1]
  br i1 %145, label %bb.us.i, label %bb.i12

bb.us.i:                                          ; preds = %bb.us.i, %bb.nph.i9
  %i.013.us.i = phi i32 [ %tmp.i, %bb.us.i ], [ 0, %bb.nph.i9 ] ; <i32> [#uses=1]
  %tmp.i = add i32 %i.013.us.i, 1                 ; <i32> [#uses=2]
  %146 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 12) nounwind ; <i32> [#uses=0]
  %147 = icmp slt i32 %tmp.i, %iterations.0       ; <i1> [#uses=1]
  br i1 %147, label %bb.us.i, label %bb.i1.preheader

bb.i12:                                           ; preds = %_Z5checkd.exit.i, %bb.nph.i9
  %i.013.i = phi i32 [ %tmp16.i, %_Z5checkd.exit.i ], [ 0, %bb.nph.i9 ] ; <i32> [#uses=1]
  %tmp16.i = add i32 %i.013.i, 1                  ; <i32> [#uses=2]
  br label %bb.i6.i

bb.i6.i:                                          ; preds = %bb.i6.i, %bb.i12
  %indvar.i.i = phi i32 [ 0, %bb.i12 ], [ %tmp14.i, %bb.i6.i ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i = phi double [ 0.000000e+00, %bb.i12 ], [ %148, %bb.i6.i ] ; <double> [#uses=1]
  %tmp14.i = add i32 %indvar.i.i, 1               ; <i32> [#uses=2]
  %scevgep5.i.i = getelementptr %struct.Double* %tmp217, i32 %tmp14.i ; <%struct.Double*> [#uses=1]
  %.idx.i.i = getelementptr inbounds %struct.Double* %tmp217, i32 %indvar.i.i, i32 0 ; <double*> [#uses=1]
  %.idx.val.i.i = load double* %.idx.i.i          ; <double> [#uses=1]
  %148 = fadd double %result_addr.0.01.i.i, %.idx.val.i.i ; <double> [#uses=2]
  %149 = icmp eq %struct.Double* %scevgep5.i.i, %tmp215 ; <i1> [#uses=1]
  br i1 %149, label %_Z10accumulateI16reverse_iteratorIS0_I14Double_pointer6DoubleES2_ES2_ET0_T_S6_S5_.exit.i, label %bb.i6.i

_Z10accumulateI16reverse_iteratorIS0_I14Double_pointer6DoubleES2_ES2_ET0_T_S6_S5_.exit.i: ; preds = %bb.i6.i
  %150 = fcmp une double %148, 6.000000e+03       ; <i1> [#uses=1]
  br i1 %150, label %bb.i.i, label %_Z5checkd.exit.i

bb.i.i:                                           ; preds = %_Z10accumulateI16reverse_iteratorIS0_I14Double_pointer6DoubleES2_ES2_ET0_T_S6_S5_.exit.i
  %151 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 12) nounwind ; <i32> [#uses=0]
  br label %_Z5checkd.exit.i

_Z5checkd.exit.i:                                 ; preds = %bb.i.i, %_Z10accumulateI16reverse_iteratorIS0_I14Double_pointer6DoubleES2_ES2_ET0_T_S6_S5_.exit.i
  %152 = icmp slt i32 %tmp16.i, %iterations.0     ; <i1> [#uses=1]
  br i1 %152, label %bb.i12, label %bb.i1.preheader

bb.i1.preheader:                                  ; preds = %_Z5checkd.exit.i, %bb.us.i, %_Z4testI16reverse_iteratorIS0_I14double_pointerdEdEdEvT_S4_T0_.exit
  %153 = tail call i32 @clock() nounwind          ; <i32> [#uses=1]
  %154 = sub i32 %153, %144                       ; <i32> [#uses=1]
  %155 = sitofp i32 %154 to double                ; <double> [#uses=1]
  %156 = fdiv double %155, 1.000000e+06           ; <double> [#uses=1]
  store double %156, double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 12), align 32
  %157 = tail call i32 @puts(i8* getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %158 = tail call i32 @puts(i8* getelementptr inbounds ([43 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %159 = sitofp i32 %iterations.0 to double       ; <double> [#uses=1]
  %160 = fmul double %159, 2.000000e+03           ; <double> [#uses=1]
  %161 = fdiv double %160, 1.000000e+06           ; <double> [#uses=2]
  br label %bb.i1

bb.i1:                                            ; preds = %bb.i1, %bb.i1.preheader
  %162 = phi i32 [ %171, %bb.i1 ], [ 0, %bb.i1.preheader ] ; <i32> [#uses=3]
  %scevgep15.i = getelementptr [20 x double]* @result_times, i32 0, i32 %162 ; <double*> [#uses=1]
  %163 = load double* %scevgep15.i, align 8       ; <double> [#uses=3]
  %164 = load double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 0), align 32 ; <double> [#uses=1]
  %165 = fdiv double %163, %164                   ; <double> [#uses=1]
  %166 = fmul double %165, 1.000000e-07           ; <double> [#uses=1]
  %167 = fdiv double %161, %163                   ; <double> [#uses=1]
  %168 = fmul double %167, 1.000000e-07           ; <double> [#uses=1]
  %169 = fmul double %163, 1.000000e-07           ; <double> [#uses=1]
  %170 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([43 x i8]* @.str3, i32 0, i32 0), i32 %162, double %169, double %168, double %166) nounwind ; <i32> [#uses=0]
  %171 = add nsw i32 %162, 1                      ; <i32> [#uses=2]
  %172 = icmp slt i32 %171, 13                    ; <i1> [#uses=1]
  br i1 %172, label %bb.i1, label %bb.nph.i

bb.nph.i:                                         ; preds = %bb.i1
  %173 = load double* getelementptr inbounds ([20 x double]* @result_times, i32 0, i32 0), align 32 ; <double> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %bb3.i, %bb.nph.i
  %gmean_ratio.05.i = phi double [ 0.000000e+00, %bb.nph.i ], [ %183, %bb3.i ] ; <double> [#uses=1]
  %gmean_rate.04.i = phi double [ 0.000000e+00, %bb.nph.i ], [ %180, %bb3.i ] ; <double> [#uses=1]
  %total_absolute_times.03.i = phi double [ 0.000000e+00, %bb.nph.i ], [ %175, %bb3.i ] ; <double> [#uses=1]
  %gmean_times.02.i = phi double [ 0.000000e+00, %bb.nph.i ], [ %177, %bb3.i ] ; <double> [#uses=1]
  %i.11.i = phi i32 [ 0, %bb.nph.i ], [ %184, %bb3.i ] ; <i32> [#uses=2]
  %scevgep.i2 = getelementptr [20 x double]* @result_times, i32 0, i32 %i.11.i ; <double*> [#uses=1]
  %174 = load double* %scevgep.i2, align 8        ; <double> [#uses=4]
  %175 = fadd double %174, %total_absolute_times.03.i ; <double> [#uses=2]
  %176 = tail call double @llvm.log.f64(double %174) nounwind ; <double> [#uses=1]
  %177 = fadd double %176, %gmean_times.02.i      ; <double> [#uses=2]
  %178 = fdiv double %161, %174                   ; <double> [#uses=1]
  %179 = tail call double @llvm.log.f64(double %178) nounwind ; <double> [#uses=1]
  %180 = fadd double %179, %gmean_rate.04.i       ; <double> [#uses=2]
  %181 = fdiv double %174, %173                   ; <double> [#uses=1]
  %182 = tail call double @llvm.log.f64(double %181) nounwind ; <double> [#uses=1]
  %183 = fadd double %182, %gmean_ratio.05.i      ; <double> [#uses=2]
  %184 = add nsw i32 %i.11.i, 1                   ; <i32> [#uses=2]
  %exitcond.i3 = icmp eq i32 %184, 13             ; <i1> [#uses=1]
  br i1 %exitcond.i3, label %_Z9summarizev.exit, label %bb3.i

_Z9summarizev.exit:                               ; preds = %bb3.i
  %phitmp.i4 = fmul double %175, 1.000000e-07     ; <double> [#uses=1]
  %185 = fdiv double %183, 1.300000e+01           ; <double> [#uses=2]
  %186 = tail call double @llvm.exp.f64(double %185) nounwind ; <double> [#uses=1]
  %187 = fmul double %186, 1.000000e-07           ; <double> [#uses=1]
  %188 = fdiv double %180, 1.300000e+01           ; <double> [#uses=1]
  %189 = tail call double @llvm.exp.f64(double %188) nounwind ; <double> [#uses=1]
  %190 = fmul double %189, 1.000000e-07           ; <double> [#uses=1]
  %191 = fdiv double %177, 1.300000e+01           ; <double> [#uses=1]
  %192 = tail call double @llvm.exp.f64(double %191) nounwind ; <double> [#uses=1]
  %193 = fmul double %192, 1.000000e-07           ; <double> [#uses=1]
  %194 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([42 x i8]* @.str4, i32 0, i32 0), double %193, double %190, double %187) nounwind ; <i32> [#uses=0]
  %195 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), double %phitmp.i4) nounwind ; <i32> [#uses=0]
  %196 = tail call double @llvm.exp.f64(double %185) nounwind ; <double> [#uses=1]
  %197 = fmul double %196, 1.000000e-07           ; <double> [#uses=1]
  %198 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), double %197) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @atoi(i8* nocapture) nounwind readonly
