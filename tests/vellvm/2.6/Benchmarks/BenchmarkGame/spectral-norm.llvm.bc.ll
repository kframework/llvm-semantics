; ModuleID = 'spectral-norm.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [7 x i8] c"%0.9f\0A\00", align 1 ; <[7 x i8]*> [#uses=1]

declare i8* @llvm.stacksave() nounwind

declare void @llvm.stackrestore(i8*) nounwind

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb2.thread

bb2.thread:                                       ; preds = %entry
  %1 = alloca [2000 x double], align 8            ; <[2000 x double]*> [#uses=1]
  %2 = alloca [2000 x double], align 8            ; <[2000 x double]*> [#uses=1]
  %.sub31 = getelementptr inbounds [2000 x double]* %1, i32 0, i32 0 ; <double*> [#uses=1]
  %.sub = getelementptr inbounds [2000 x double]* %2, i32 0, i32 0 ; <double*> [#uses=1]
  br label %bb3.preheader

bb2:                                              ; preds = %entry
  %3 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %4 = load i8** %3, align 4                      ; <i8*> [#uses=1]
  %5 = call i32 @strtol(i8* noalias nocapture %4, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=5]
  %6 = alloca double, i32 %5, align 8             ; <double*> [#uses=2]
  %7 = alloca double, i32 %5, align 8             ; <double*> [#uses=2]
  %8 = icmp sgt i32 %5, 0                         ; <i1> [#uses=3]
  br i1 %8, label %bb3.preheader, label %bb6.preheader

bb3.preheader:                                    ; preds = %bb2, %bb2.thread
  %iftmp.26.0.reg2mem.0.ph = phi i32 [ 2000, %bb2.thread ], [ %5, %bb2 ] ; <i32> [#uses=2]
  %.reg2mem.0.ph = phi double* [ %.sub31, %bb2.thread ], [ %6, %bb2 ] ; <double*> [#uses=2]
  %.reg2mem18.0.ph = phi double* [ %.sub, %bb2.thread ], [ %7, %bb2 ] ; <double*> [#uses=1]
  %.reg2mem22.0.ph = phi i1 [ true, %bb2.thread ], [ %8, %bb2 ] ; <i1> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb3, %bb3.preheader
  %i.040 = phi i32 [ %9, %bb3 ], [ 0, %bb3.preheader ] ; <i32> [#uses=2]
  %scevgep79 = getelementptr double* %.reg2mem.0.ph, i32 %i.040 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %scevgep79, align 8
  %9 = add nsw i32 %i.040, 1                      ; <i32> [#uses=2]
  %exitcond78 = icmp eq i32 %9, %iftmp.26.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond78, label %bb6.preheader, label %bb3

bb6.preheader:                                    ; preds = %bb3, %bb2
  %iftmp.26.0.reg2mem.1.ph = phi i32 [ %5, %bb2 ], [ %iftmp.26.0.reg2mem.0.ph, %bb3 ] ; <i32> [#uses=11]
  %.reg2mem.1.ph = phi double* [ %6, %bb2 ], [ %.reg2mem.0.ph, %bb3 ] ; <double*> [#uses=3]
  %.reg2mem18.1.ph = phi double* [ %7, %bb2 ], [ %.reg2mem18.0.ph, %bb3 ] ; <double*> [#uses=3]
  %.reg2mem22.1.ph = phi i1 [ %8, %bb2 ], [ %.reg2mem22.0.ph, %bb3 ] ; <i1> [#uses=3]
  br label %bb6

bb6:                                              ; preds = %eval_AtA_times_u.exit, %bb6.preheader
  %i.138 = phi i32 [ %52, %eval_AtA_times_u.exit ], [ 0, %bb6.preheader ] ; <i32> [#uses=1]
  %savedstack26 = call i8* @llvm.stacksave()      ; <i8*> [#uses=2]
  %10 = alloca double, i32 %iftmp.26.0.reg2mem.1.ph, align 8 ; <double*> [#uses=2]
  br i1 %.reg2mem22.1.ph, label %bb.us.i.i4, label %eval_AtA_times_u.exit27.thread

eval_AtA_times_u.exit27.thread:                   ; preds = %bb6
  call void @llvm.stackrestore(i8* %savedstack26)
  %savedstack29 = call i8* @llvm.stacksave()      ; <i8*> [#uses=1]
  br label %eval_AtA_times_u.exit

bb.us.i.i4:                                       ; preds = %bb2.bb3_crit_edge.us.i.i12, %bb6
  %11 = phi i32 [ %tmp5.i.i2, %bb2.bb3_crit_edge.us.i.i12 ], [ 0, %bb6 ] ; <i32> [#uses=3]
  %tmp5.i.i2 = add i32 %11, 1                     ; <i32> [#uses=4]
  %scevgep7.i.i3 = getelementptr double* %10, i32 %11 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %scevgep7.i.i3, align 8
  br label %bb1.us.i.i10

bb1.us.i.i10:                                     ; preds = %bb1.us.i.i10, %bb.us.i.i4
  %12 = phi double [ 0.000000e+00, %bb.us.i.i4 ], [ %20, %bb1.us.i.i10 ] ; <double> [#uses=1]
  %j.01.us.i.i5 = phi i32 [ 0, %bb.us.i.i4 ], [ %21, %bb1.us.i.i10 ] ; <i32> [#uses=4]
  %tmp.i.i6 = add i32 %j.01.us.i.i5, %11          ; <i32> [#uses=1]
  %scevgep.i.i7 = getelementptr double* %.reg2mem.1.ph, i32 %j.01.us.i.i5 ; <double*> [#uses=1]
  %13 = add nsw i32 %j.01.us.i.i5, %tmp5.i.i2     ; <i32> [#uses=1]
  %14 = mul i32 %tmp.i.i6, %13                    ; <i32> [#uses=1]
  %15 = sdiv i32 %14, 2                           ; <i32> [#uses=1]
  %tmp6.i.i8 = add i32 %15, %tmp5.i.i2            ; <i32> [#uses=1]
  %16 = sitofp i32 %tmp6.i.i8 to double           ; <double> [#uses=1]
  %17 = fdiv double 1.000000e+00, %16             ; <double> [#uses=1]
  %18 = load double* %scevgep.i.i7, align 8       ; <double> [#uses=1]
  %19 = fmul double %17, %18                      ; <double> [#uses=1]
  %20 = fadd double %12, %19                      ; <double> [#uses=2]
  %21 = add nsw i32 %j.01.us.i.i5, 1              ; <i32> [#uses=2]
  %exitcond60 = icmp eq i32 %21, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond60, label %bb2.bb3_crit_edge.us.i.i12, label %bb1.us.i.i10

bb2.bb3_crit_edge.us.i.i12:                       ; preds = %bb1.us.i.i10
  store double %20, double* %scevgep7.i.i3, align 8
  %exitcond63 = icmp eq i32 %tmp5.i.i2, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond63, label %bb.us.i2.i15, label %bb.us.i.i4

bb.us.i2.i15:                                     ; preds = %bb2.bb3_crit_edge.us.i9.i25, %bb2.bb3_crit_edge.us.i.i12
  %22 = phi i32 [ %tmp69, %bb2.bb3_crit_edge.us.i9.i25 ], [ 0, %bb2.bb3_crit_edge.us.i.i12 ] ; <i32> [#uses=3]
  %tmp69 = add i32 %22, 1                         ; <i32> [#uses=3]
  %scevgep7.i1.i14 = getelementptr double* %.reg2mem18.1.ph, i32 %22 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %scevgep7.i1.i14, align 8
  br label %bb1.us.i8.i23

bb1.us.i8.i23:                                    ; preds = %bb1.us.i8.i23, %bb.us.i2.i15
  %23 = phi double [ 0.000000e+00, %bb.us.i2.i15 ], [ %30, %bb1.us.i8.i23 ] ; <double> [#uses=1]
  %j.01.us.i3.i16 = phi i32 [ 0, %bb.us.i2.i15 ], [ %tmp71, %bb1.us.i8.i23 ] ; <i32> [#uses=4]
  %tmp13.i18 = add i32 %j.01.us.i3.i16, %tmp69    ; <i32> [#uses=1]
  %tmp71 = add i32 %j.01.us.i3.i16, 1             ; <i32> [#uses=3]
  %scevgep.i6.i19 = getelementptr double* %10, i32 %j.01.us.i3.i16 ; <double*> [#uses=1]
  %tmp5.i5.i20 = add i32 %j.01.us.i3.i16, %22     ; <i32> [#uses=1]
  %24 = mul i32 %tmp13.i18, %tmp5.i5.i20          ; <i32> [#uses=1]
  %25 = sdiv i32 %24, 2                           ; <i32> [#uses=1]
  %tmp4.i.i21 = add i32 %25, %tmp71               ; <i32> [#uses=1]
  %26 = sitofp i32 %tmp4.i.i21 to double          ; <double> [#uses=1]
  %27 = fdiv double 1.000000e+00, %26             ; <double> [#uses=1]
  %28 = load double* %scevgep.i6.i19, align 8     ; <double> [#uses=1]
  %29 = fmul double %27, %28                      ; <double> [#uses=1]
  %30 = fadd double %23, %29                      ; <double> [#uses=2]
  %exitcond68 = icmp eq i32 %tmp71, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond68, label %bb2.bb3_crit_edge.us.i9.i25, label %bb1.us.i8.i23

bb2.bb3_crit_edge.us.i9.i25:                      ; preds = %bb1.us.i8.i23
  store double %30, double* %scevgep7.i1.i14, align 8
  %exitcond74 = icmp eq i32 %tmp69, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond74, label %eval_AtA_times_u.exit27, label %bb.us.i2.i15

eval_AtA_times_u.exit27:                          ; preds = %bb2.bb3_crit_edge.us.i9.i25
  call void @llvm.stackrestore(i8* %savedstack26)
  %savedstack = call i8* @llvm.stacksave()        ; <i8*> [#uses=2]
  %31 = alloca double, i32 %iftmp.26.0.reg2mem.1.ph, align 8 ; <double*> [#uses=2]
  br i1 %.reg2mem22.1.ph, label %bb.us.i.i, label %eval_AtA_times_u.exit

bb.us.i.i:                                        ; preds = %bb2.bb3_crit_edge.us.i.i, %eval_AtA_times_u.exit27
  %32 = phi i32 [ %tmp5.i.i, %bb2.bb3_crit_edge.us.i.i ], [ 0, %eval_AtA_times_u.exit27 ] ; <i32> [#uses=3]
  %tmp5.i.i = add i32 %32, 1                      ; <i32> [#uses=4]
  %scevgep7.i.i = getelementptr double* %31, i32 %32 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %scevgep7.i.i, align 8
  br label %bb1.us.i.i

bb1.us.i.i:                                       ; preds = %bb1.us.i.i, %bb.us.i.i
  %33 = phi double [ 0.000000e+00, %bb.us.i.i ], [ %41, %bb1.us.i.i ] ; <double> [#uses=1]
  %j.01.us.i.i = phi i32 [ 0, %bb.us.i.i ], [ %42, %bb1.us.i.i ] ; <i32> [#uses=4]
  %tmp.i.i = add i32 %j.01.us.i.i, %32            ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr double* %.reg2mem18.1.ph, i32 %j.01.us.i.i ; <double*> [#uses=1]
  %34 = add nsw i32 %j.01.us.i.i, %tmp5.i.i       ; <i32> [#uses=1]
  %35 = mul i32 %tmp.i.i, %34                     ; <i32> [#uses=1]
  %36 = sdiv i32 %35, 2                           ; <i32> [#uses=1]
  %tmp6.i.i = add i32 %36, %tmp5.i.i              ; <i32> [#uses=1]
  %37 = sitofp i32 %tmp6.i.i to double            ; <double> [#uses=1]
  %38 = fdiv double 1.000000e+00, %37             ; <double> [#uses=1]
  %39 = load double* %scevgep.i.i, align 8        ; <double> [#uses=1]
  %40 = fmul double %38, %39                      ; <double> [#uses=1]
  %41 = fadd double %33, %40                      ; <double> [#uses=2]
  %42 = add nsw i32 %j.01.us.i.i, 1               ; <i32> [#uses=2]
  %exitcond45 = icmp eq i32 %42, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond45, label %bb2.bb3_crit_edge.us.i.i, label %bb1.us.i.i

bb2.bb3_crit_edge.us.i.i:                         ; preds = %bb1.us.i.i
  store double %41, double* %scevgep7.i.i, align 8
  %exitcond47 = icmp eq i32 %tmp5.i.i, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond47, label %bb.us.i2.i, label %bb.us.i.i

bb.us.i2.i:                                       ; preds = %bb2.bb3_crit_edge.us.i9.i, %bb2.bb3_crit_edge.us.i.i
  %43 = phi i32 [ %tmp, %bb2.bb3_crit_edge.us.i9.i ], [ 0, %bb2.bb3_crit_edge.us.i.i ] ; <i32> [#uses=3]
  %tmp = add i32 %43, 1                           ; <i32> [#uses=3]
  %scevgep7.i1.i = getelementptr double* %.reg2mem.1.ph, i32 %43 ; <double*> [#uses=2]
  store double 0.000000e+00, double* %scevgep7.i1.i, align 8
  br label %bb1.us.i8.i

bb1.us.i8.i:                                      ; preds = %bb1.us.i8.i, %bb.us.i2.i
  %44 = phi double [ 0.000000e+00, %bb.us.i2.i ], [ %51, %bb1.us.i8.i ] ; <double> [#uses=1]
  %j.01.us.i3.i = phi i32 [ 0, %bb.us.i2.i ], [ %tmp53, %bb1.us.i8.i ] ; <i32> [#uses=4]
  %tmp13.i = add i32 %j.01.us.i3.i, %tmp          ; <i32> [#uses=1]
  %tmp53 = add i32 %j.01.us.i3.i, 1               ; <i32> [#uses=3]
  %scevgep.i6.i = getelementptr double* %31, i32 %j.01.us.i3.i ; <double*> [#uses=1]
  %tmp5.i5.i = add i32 %j.01.us.i3.i, %43         ; <i32> [#uses=1]
  %45 = mul i32 %tmp13.i, %tmp5.i5.i              ; <i32> [#uses=1]
  %46 = sdiv i32 %45, 2                           ; <i32> [#uses=1]
  %tmp4.i.i = add i32 %46, %tmp53                 ; <i32> [#uses=1]
  %47 = sitofp i32 %tmp4.i.i to double            ; <double> [#uses=1]
  %48 = fdiv double 1.000000e+00, %47             ; <double> [#uses=1]
  %49 = load double* %scevgep.i6.i, align 8       ; <double> [#uses=1]
  %50 = fmul double %48, %49                      ; <double> [#uses=1]
  %51 = fadd double %44, %50                      ; <double> [#uses=2]
  %exitcond51 = icmp eq i32 %tmp53, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond51, label %bb2.bb3_crit_edge.us.i9.i, label %bb1.us.i8.i

bb2.bb3_crit_edge.us.i9.i:                        ; preds = %bb1.us.i8.i
  store double %51, double* %scevgep7.i1.i, align 8
  %exitcond56 = icmp eq i32 %tmp, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond56, label %eval_AtA_times_u.exit, label %bb.us.i2.i

eval_AtA_times_u.exit:                            ; preds = %bb2.bb3_crit_edge.us.i9.i, %eval_AtA_times_u.exit27, %eval_AtA_times_u.exit27.thread
  %savedstack.reg2mem.0 = phi i8* [ %savedstack29, %eval_AtA_times_u.exit27.thread ], [ %savedstack, %eval_AtA_times_u.exit27 ], [ %savedstack, %bb2.bb3_crit_edge.us.i9.i ] ; <i8*> [#uses=1]
  call void @llvm.stackrestore(i8* %savedstack.reg2mem.0)
  %52 = add nsw i32 %i.138, 1                     ; <i32> [#uses=2]
  %exitcond77 = icmp eq i32 %52, 10               ; <i1> [#uses=1]
  br i1 %exitcond77, label %bb10.loopexit, label %bb6

bb9:                                              ; preds = %bb10.loopexit, %bb9
  %i.232 = phi i32 [ %59, %bb9 ], [ 0, %bb10.loopexit ] ; <i32> [#uses=3]
  %vBv.031 = phi double [ %56, %bb9 ], [ 0.000000e+00, %bb10.loopexit ] ; <double> [#uses=1]
  %vv.030 = phi double [ %58, %bb9 ], [ 0.000000e+00, %bb10.loopexit ] ; <double> [#uses=1]
  %scevgep = getelementptr double* %.reg2mem18.1.ph, i32 %i.232 ; <double*> [#uses=1]
  %scevgep43 = getelementptr double* %.reg2mem.1.ph, i32 %i.232 ; <double*> [#uses=1]
  %53 = load double* %scevgep43, align 8          ; <double> [#uses=1]
  %54 = load double* %scevgep, align 8            ; <double> [#uses=3]
  %55 = fmul double %53, %54                      ; <double> [#uses=1]
  %56 = fadd double %55, %vBv.031                 ; <double> [#uses=2]
  %57 = fmul double %54, %54                      ; <double> [#uses=1]
  %58 = fadd double %57, %vv.030                  ; <double> [#uses=2]
  %59 = add nsw i32 %i.232, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %59, %iftmp.26.0.reg2mem.1.ph ; <i1> [#uses=1]
  br i1 %exitcond, label %bb11, label %bb9

bb10.loopexit:                                    ; preds = %eval_AtA_times_u.exit
  br i1 %.reg2mem22.1.ph, label %bb9, label %bb11

bb11:                                             ; preds = %bb10.loopexit, %bb9
  %vBv.0.lcssa = phi double [ 0.000000e+00, %bb10.loopexit ], [ %56, %bb9 ] ; <double> [#uses=1]
  %vv.0.lcssa = phi double [ 0.000000e+00, %bb10.loopexit ], [ %58, %bb9 ] ; <double> [#uses=1]
  %60 = fdiv double %vBv.0.lcssa, %vv.0.lcssa     ; <double> [#uses=1]
  %61 = call double @llvm.sqrt.f64(double %60)    ; <double> [#uses=1]
  %62 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %61) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare double @llvm.sqrt.f64(double) nounwind readonly

declare i32 @printf(i8* nocapture, ...) nounwind
