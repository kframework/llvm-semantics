; ModuleID = 'sse.expandfft.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [29 x i8] c" for n=%d, fwd/bck error=%e\0A\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str1 = private constant [11 x i8] c" for n=%d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str2 = private constant [5 x i8] c"%g  \00", align 1 ; <[5 x i8]*> [#uses=1]

declare double @fmod(double, double) nounwind readonly

declare float @cosf(float) nounwind readonly

declare float @sinf(float) nounwind readonly

define internal fastcc void @cfft2([2 x float]* nocapture %x, [2 x float]* nocapture %y, [2 x float]* nocapture %w, double %sign1) nounwind {
bb.nph126:
  %sign = fptrunc double %sign1 to float          ; <float> [#uses=1]
  %0 = tail call double @llvm.log.f64(double 1.024000e+03) ; <double> [#uses=1]
  %1 = tail call double @llvm.log.f64(double 1.990000e+00) ; <double> [#uses=1]
  %2 = fdiv double %0, %1                         ; <double> [#uses=1]
  %3 = fptosi double %2 to i32                    ; <i32> [#uses=2]
  %4 = fcmp olt float %sign, 0.000000e+00         ; <i1> [#uses=3]
  br i1 %4, label %bb4.us, label %bb4

bb4.us:                                           ; preds = %bb4.us, %bb.nph126
  %j.0125.us = phi i32 [ %32, %bb4.us ], [ 0, %bb.nph126 ] ; <i32> [#uses=7]
  %tmp128 = add i32 %j.0125.us, 512               ; <i32> [#uses=2]
  %scevgep = getelementptr [2 x float]* %x, i32 %tmp128, i32 1 ; <float*> [#uses=3]
  %scevgep129 = getelementptr [2 x float]* %x, i32 %j.0125.us, i32 1 ; <float*> [#uses=3]
  %scevgep130 = getelementptr [2 x float]* %x, i32 %tmp128, i32 0 ; <float*> [#uses=3]
  %scevgep131 = getelementptr [2 x float]* %x, i32 %j.0125.us, i32 0 ; <float*> [#uses=3]
  %scevgep132 = getelementptr [2 x float]* %w, i32 %j.0125.us, i32 1 ; <float*> [#uses=1]
  %scevgep133 = getelementptr [2 x float]* %w, i32 %j.0125.us, i32 0 ; <float*> [#uses=1]
  %tmp134 = shl i32 %j.0125.us, 1                 ; <i32> [#uses=3]
  %scevgep135 = getelementptr [2 x float]* %y, i32 %tmp134, i32 1 ; <float*> [#uses=1]
  %scevgep136 = getelementptr [2 x float]* %y, i32 %tmp134, i32 0 ; <float*> [#uses=1]
  %tmp137318 = or i32 %tmp134, 1                  ; <i32> [#uses=2]
  %scevgep138 = getelementptr [2 x float]* %y, i32 %tmp137318, i32 1 ; <float*> [#uses=1]
  %scevgep139 = getelementptr [2 x float]* %y, i32 %tmp137318, i32 0 ; <float*> [#uses=1]
  %5 = load float* %scevgep133, align 4           ; <float> [#uses=2]
  %6 = load float* %scevgep132, align 4           ; <float> [#uses=1]
  %7 = fsub float -0.000000e+00, %6               ; <float> [#uses=2]
  %8 = load float* %scevgep131, align 4           ; <float> [#uses=1]
  %9 = load float* %scevgep130, align 4           ; <float> [#uses=1]
  %10 = fsub float %8, %9                         ; <float> [#uses=1]
  %11 = fmul float %10, %5                        ; <float> [#uses=1]
  %12 = load float* %scevgep129, align 4          ; <float> [#uses=1]
  %13 = load float* %scevgep, align 4             ; <float> [#uses=1]
  %14 = fsub float %12, %13                       ; <float> [#uses=1]
  %15 = fmul float %14, %7                        ; <float> [#uses=1]
  %16 = fsub float %11, %15                       ; <float> [#uses=1]
  store float %16, float* %scevgep139, align 4
  %17 = load float* %scevgep131, align 4          ; <float> [#uses=1]
  %18 = load float* %scevgep130, align 4          ; <float> [#uses=1]
  %19 = fsub float %17, %18                       ; <float> [#uses=1]
  %20 = fmul float %19, %7                        ; <float> [#uses=1]
  %21 = load float* %scevgep129, align 4          ; <float> [#uses=1]
  %22 = load float* %scevgep, align 4             ; <float> [#uses=1]
  %23 = fsub float %21, %22                       ; <float> [#uses=1]
  %24 = fmul float %23, %5                        ; <float> [#uses=1]
  %25 = fadd float %20, %24                       ; <float> [#uses=1]
  store float %25, float* %scevgep138, align 4
  %26 = load float* %scevgep131, align 4          ; <float> [#uses=1]
  %27 = load float* %scevgep130, align 4          ; <float> [#uses=1]
  %28 = fadd float %26, %27                       ; <float> [#uses=1]
  store float %28, float* %scevgep136, align 4
  %29 = load float* %scevgep129, align 4          ; <float> [#uses=1]
  %30 = load float* %scevgep, align 4             ; <float> [#uses=1]
  %31 = fadd float %29, %30                       ; <float> [#uses=1]
  store float %31, float* %scevgep135, align 4
  %32 = add nsw i32 %j.0125.us, 1                 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %32, 512                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb.nph124, label %bb4.us

bb4:                                              ; preds = %bb4, %bb.nph126
  %j.0125 = phi i32 [ %59, %bb4 ], [ 0, %bb.nph126 ] ; <i32> [#uses=7]
  %scevgep305 = getelementptr [2 x float]* %x, i32 %j.0125, i32 1 ; <float*> [#uses=3]
  %scevgep306 = getelementptr [2 x float]* %x, i32 %j.0125, i32 0 ; <float*> [#uses=3]
  %scevgep307 = getelementptr [2 x float]* %w, i32 %j.0125, i32 1 ; <float*> [#uses=1]
  %scevgep308 = getelementptr [2 x float]* %w, i32 %j.0125, i32 0 ; <float*> [#uses=1]
  %tmp309 = add i32 %j.0125, 512                  ; <i32> [#uses=2]
  %scevgep310 = getelementptr [2 x float]* %x, i32 %tmp309, i32 0 ; <float*> [#uses=3]
  %scevgep311 = getelementptr [2 x float]* %x, i32 %tmp309, i32 1 ; <float*> [#uses=3]
  %tmp312 = shl i32 %j.0125, 1                    ; <i32> [#uses=3]
  %tmp313324 = or i32 %tmp312, 1                  ; <i32> [#uses=2]
  %scevgep314 = getelementptr [2 x float]* %y, i32 %tmp313324, i32 1 ; <float*> [#uses=1]
  %scevgep315 = getelementptr [2 x float]* %y, i32 %tmp313324, i32 0 ; <float*> [#uses=1]
  %scevgep316 = getelementptr [2 x float]* %y, i32 %tmp312, i32 1 ; <float*> [#uses=1]
  %scevgep317 = getelementptr [2 x float]* %y, i32 %tmp312, i32 0 ; <float*> [#uses=1]
  %33 = load float* %scevgep308, align 4          ; <float> [#uses=2]
  %34 = load float* %scevgep307, align 4          ; <float> [#uses=2]
  %35 = load float* %scevgep306, align 4          ; <float> [#uses=1]
  %36 = load float* %scevgep310, align 4          ; <float> [#uses=1]
  %37 = fsub float %35, %36                       ; <float> [#uses=1]
  %38 = fmul float %37, %33                       ; <float> [#uses=1]
  %39 = load float* %scevgep305, align 4          ; <float> [#uses=1]
  %40 = load float* %scevgep311, align 4          ; <float> [#uses=1]
  %41 = fsub float %39, %40                       ; <float> [#uses=1]
  %42 = fmul float %41, %34                       ; <float> [#uses=1]
  %43 = fsub float %38, %42                       ; <float> [#uses=1]
  store float %43, float* %scevgep315, align 4
  %44 = load float* %scevgep306, align 4          ; <float> [#uses=1]
  %45 = load float* %scevgep310, align 4          ; <float> [#uses=1]
  %46 = fsub float %44, %45                       ; <float> [#uses=1]
  %47 = fmul float %46, %34                       ; <float> [#uses=1]
  %48 = load float* %scevgep305, align 4          ; <float> [#uses=1]
  %49 = load float* %scevgep311, align 4          ; <float> [#uses=1]
  %50 = fsub float %48, %49                       ; <float> [#uses=1]
  %51 = fmul float %50, %33                       ; <float> [#uses=1]
  %52 = fadd float %47, %51                       ; <float> [#uses=1]
  store float %52, float* %scevgep314, align 4
  %53 = load float* %scevgep306, align 4          ; <float> [#uses=1]
  %54 = load float* %scevgep310, align 4          ; <float> [#uses=1]
  %55 = fadd float %53, %54                       ; <float> [#uses=1]
  store float %55, float* %scevgep317, align 4
  %56 = load float* %scevgep305, align 4          ; <float> [#uses=1]
  %57 = load float* %scevgep311, align 4          ; <float> [#uses=1]
  %58 = fadd float %56, %57                       ; <float> [#uses=1]
  store float %58, float* %scevgep316, align 4
  %59 = add nsw i32 %j.0125, 1                    ; <i32> [#uses=2]
  %exitcond304 = icmp eq i32 %59, 512             ; <i1> [#uses=1]
  br i1 %exitcond304, label %bb.nph124, label %bb4

bb.nph124:                                        ; preds = %bb4, %bb4.us
  br i1 %4, label %bb12.us, label %bb12

bb12.us:                                          ; preds = %bb12.us, %bb.nph124
  %j.1123.us = phi i32 [ %66, %bb12.us ], [ 0, %bb.nph124 ] ; <i32> [#uses=3]
  %tmp143 = shl i32 %j.1123.us, 2                 ; <i32> [#uses=2]
  %tmp144319 = or i32 %tmp143, 2                  ; <i32> [#uses=1]
  %scevgep145 = getelementptr [2 x float]* %x, i32 %tmp144319, i32 0 ; <float*> [#uses=1]
  %scevgep145146 = bitcast float* %scevgep145 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep147 = getelementptr [2 x float]* %x, i32 %tmp143, i32 0 ; <float*> [#uses=1]
  %scevgep147148 = bitcast float* %scevgep147 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp149 = shl i32 %j.1123.us, 1                 ; <i32> [#uses=4]
  %tmp150 = add i32 %tmp149, 512                  ; <i32> [#uses=1]
  %scevgep151 = getelementptr [2 x float]* %y, i32 %tmp150, i32 0 ; <float*> [#uses=1]
  %scevgep151152 = bitcast float* %scevgep151 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep153 = getelementptr [2 x float]* %y, i32 %tmp149, i32 0 ; <float*> [#uses=1]
  %scevgep153154 = bitcast float* %scevgep153 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep155 = getelementptr [2 x float]* %w, i32 %tmp149, i32 1 ; <float*> [#uses=1]
  %scevgep156 = getelementptr [2 x float]* %w, i32 %tmp149, i32 0 ; <float*> [#uses=1]
  %60 = load float* %scevgep156, align 4          ; <float> [#uses=4]
  %61 = load float* %scevgep155, align 4          ; <float> [#uses=3]
  %62 = fsub float -0.000000e+00, %61             ; <float> [#uses=2]
  %tmp41.us = insertelement <4 x float> undef, float %60, i32 0 ; <<4 x float>> [#uses=1]
  %tmp44.us = insertelement <4 x float> %tmp41.us, float %60, i32 1 ; <<4 x float>> [#uses=1]
  %tmp46.us = insertelement <4 x float> %tmp44.us, float %60, i32 2 ; <<4 x float>> [#uses=1]
  %tmp48.us = insertelement <4 x float> %tmp46.us, float %60, i32 3 ; <<4 x float>> [#uses=1]
  %tmp59.us = insertelement <4 x float> undef, float %61, i32 0 ; <<4 x float>> [#uses=1]
  %tmp62.us = insertelement <4 x float> %tmp59.us, float %62, i32 1 ; <<4 x float>> [#uses=1]
  %tmp64.us = insertelement <4 x float> %tmp62.us, float %61, i32 2 ; <<4 x float>> [#uses=1]
  %tmp66.us = insertelement <4 x float> %tmp64.us, float %62, i32 3 ; <<4 x float>> [#uses=1]
  %63 = load <4 x float>* %scevgep153154, align 16 ; <<4 x float>> [#uses=2]
  %64 = load <4 x float>* %scevgep151152, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i37.us = fadd <4 x float> %63, %64         ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i37.us, <4 x float>* %scevgep147148, align 16
  %tmp.i36.us = fsub <4 x float> %63, %64         ; <<4 x float>> [#uses=2]
  %65 = shufflevector <4 x float> %tmp.i36.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i35.us = fmul <4 x float> %tmp48.us, %tmp.i36.us ; <<4 x float>> [#uses=1]
  %tmp.i34.us = fmul <4 x float> %tmp66.us, %65   ; <<4 x float>> [#uses=1]
  %tmp.i33.us = fadd <4 x float> %tmp.i35.us, %tmp.i34.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i33.us, <4 x float>* %scevgep145146, align 16
  %66 = add nsw i32 %j.1123.us, 1                 ; <i32> [#uses=2]
  %exitcond142 = icmp eq i32 %66, 256             ; <i1> [#uses=1]
  br i1 %exitcond142, label %bb19, label %bb12.us

bb12:                                             ; preds = %bb12, %bb.nph124
  %j.1123 = phi i32 [ %73, %bb12 ], [ 0, %bb.nph124 ] ; <i32> [#uses=3]
  %tmp288 = shl i32 %j.1123, 2                    ; <i32> [#uses=2]
  %tmp289323 = or i32 %tmp288, 2                  ; <i32> [#uses=1]
  %scevgep290 = getelementptr [2 x float]* %x, i32 %tmp289323, i32 0 ; <float*> [#uses=1]
  %scevgep290291 = bitcast float* %scevgep290 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep292 = getelementptr [2 x float]* %x, i32 %tmp288, i32 0 ; <float*> [#uses=1]
  %scevgep292293 = bitcast float* %scevgep292 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp294 = shl i32 %j.1123, 1                    ; <i32> [#uses=4]
  %tmp295 = add i32 %tmp294, 512                  ; <i32> [#uses=1]
  %scevgep296 = getelementptr [2 x float]* %y, i32 %tmp295, i32 0 ; <float*> [#uses=1]
  %scevgep296297 = bitcast float* %scevgep296 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep298 = getelementptr [2 x float]* %y, i32 %tmp294, i32 0 ; <float*> [#uses=1]
  %scevgep298299 = bitcast float* %scevgep298 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep300 = getelementptr [2 x float]* %w, i32 %tmp294, i32 1 ; <float*> [#uses=1]
  %scevgep301 = getelementptr [2 x float]* %w, i32 %tmp294, i32 0 ; <float*> [#uses=1]
  %67 = load float* %scevgep301, align 4          ; <float> [#uses=4]
  %68 = load float* %scevgep300, align 4          ; <float> [#uses=3]
  %tmp41 = insertelement <4 x float> undef, float %67, i32 0 ; <<4 x float>> [#uses=1]
  %tmp44 = insertelement <4 x float> %tmp41, float %67, i32 1 ; <<4 x float>> [#uses=1]
  %tmp46 = insertelement <4 x float> %tmp44, float %67, i32 2 ; <<4 x float>> [#uses=1]
  %tmp48 = insertelement <4 x float> %tmp46, float %67, i32 3 ; <<4 x float>> [#uses=1]
  %69 = fsub float -0.000000e+00, %68             ; <float> [#uses=2]
  %tmp59 = insertelement <4 x float> undef, float %69, i32 0 ; <<4 x float>> [#uses=1]
  %tmp62 = insertelement <4 x float> %tmp59, float %68, i32 1 ; <<4 x float>> [#uses=1]
  %tmp64 = insertelement <4 x float> %tmp62, float %69, i32 2 ; <<4 x float>> [#uses=1]
  %tmp66 = insertelement <4 x float> %tmp64, float %68, i32 3 ; <<4 x float>> [#uses=1]
  %70 = load <4 x float>* %scevgep298299, align 16 ; <<4 x float>> [#uses=2]
  %71 = load <4 x float>* %scevgep296297, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i37 = fadd <4 x float> %70, %71            ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i37, <4 x float>* %scevgep292293, align 16
  %tmp.i36 = fsub <4 x float> %70, %71            ; <<4 x float>> [#uses=2]
  %72 = shufflevector <4 x float> %tmp.i36, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i35 = fmul <4 x float> %tmp48, %tmp.i36    ; <<4 x float>> [#uses=1]
  %tmp.i34 = fmul <4 x float> %tmp66, %72         ; <<4 x float>> [#uses=1]
  %tmp.i33 = fadd <4 x float> %tmp.i35, %tmp.i34  ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i33, <4 x float>* %scevgep290291, align 16
  %73 = add nsw i32 %j.1123, 1                    ; <i32> [#uses=2]
  %exitcond287 = icmp eq i32 %73, 256             ; <i1> [#uses=1]
  br i1 %exitcond287, label %bb19, label %bb12

bb19:                                             ; preds = %bb12, %bb12.us
  %74 = add i32 %3, -1                            ; <i32> [#uses=1]
  %75 = icmp sgt i32 %74, 2                       ; <i1> [#uses=1]
  br i1 %75, label %bb.nph121, label %bb.nph

bb.nph121:                                        ; preds = %bb19
  %tmp283 = add i32 %3, -3                        ; <i32> [#uses=1]
  br label %bb20

bb20:                                             ; preds = %bb33, %bb.nph121
  %indvar281 = phi i32 [ 0, %bb.nph121 ], [ %indvar.next282, %bb33 ] ; <i32> [#uses=1]
  %.pn127 = phi i32 [ 8, %bb.nph121 ], [ %104, %bb33 ] ; <i32> [#uses=1]
  %mj.0119 = phi i32 [ 4, %bb.nph121 ], [ %103, %bb33 ] ; <i32> [#uses=11]
  %mj2.0118 = phi i32 [ 8, %bb.nph121 ], [ %104, %bb33 ] ; <i32> [#uses=2]
  %tgle.1116 = phi i32 [ 0, %bb.nph121 ], [ %tgle.0, %bb33 ] ; <i32> [#uses=1]
  %lj.0120 = sdiv i32 1024, %.pn127               ; <i32> [#uses=5]
  %76 = icmp eq i32 %tgle.1116, 0                 ; <i1> [#uses=1]
  br i1 %76, label %bb22, label %bb23

bb22:                                             ; preds = %bb20
  br label %bb23

bb23:                                             ; preds = %bb22, %bb20
  %x.pn = phi [2 x float]* [ %y, %bb22 ], [ %x, %bb20 ] ; <[2 x float]*> [#uses=4]
  %c.1 = phi [2 x float]* [ %y, %bb22 ], [ %x, %bb20 ] ; <[2 x float]*> [#uses=4]
  %y.pn = phi [2 x float]* [ %x, %bb22 ], [ %y, %bb20 ] ; <[2 x float]*> [#uses=4]
  %a.0 = phi [2 x float]* [ %x, %bb22 ], [ %y, %bb20 ] ; <[2 x float]*> [#uses=4]
  %tgle.0 = phi i32 [ 1, %bb22 ], [ 0, %bb20 ]    ; <i32> [#uses=2]
  %77 = icmp sgt i32 %lj.0120, 0                  ; <i1> [#uses=1]
  br i1 %77, label %bb.nph77, label %bb33

bb.nph77:                                         ; preds = %bb23
  %78 = icmp sgt i32 %mj.0119, 0                  ; <i1> [#uses=2]
  br i1 %4, label %bb.nph77.split.us, label %bb.nph77.split

bb.nph77.split.us:                                ; preds = %bb.nph77
  br i1 %78, label %bb.nph77.split.us.split.us, label %bb26.us

bb.nph77.split.us.split.us:                       ; preds = %bb.nph77.split.us
  %tmp202 = add i32 %mj.0119, 2                   ; <i32> [#uses=1]
  br label %bb24.us.us

bb24.us.us:                                       ; preds = %bb30.bb31_crit_edge.us.us, %bb.nph77.split.us.split.us
  %j.276.us.us = phi i32 [ 0, %bb.nph77.split.us.split.us ], [ %82, %bb30.bb31_crit_edge.us.us ] ; <i32> [#uses=3]
  %tmp194 = mul i32 %j.276.us.us, %mj.0119        ; <i32> [#uses=6]
  %tmp216 = add i32 %tmp194, 2                    ; <i32> [#uses=1]
  %tmp212 = add i32 %tmp194, 514                  ; <i32> [#uses=1]
  %tmp195 = add i32 %tmp194, 512                  ; <i32> [#uses=1]
  %tmp186 = mul i32 %j.276.us.us, %mj2.0118       ; <i32> [#uses=4]
  %tmp207320 = or i32 %tmp186, 2                  ; <i32> [#uses=1]
  %tmp203 = add i32 %tmp186, %tmp202              ; <i32> [#uses=1]
  %tmp187 = add i32 %mj.0119, %tmp186             ; <i32> [#uses=1]
  %scevgep229 = getelementptr [2 x float]* %w, i32 %tmp194, i32 1 ; <float*> [#uses=1]
  %scevgep230 = getelementptr [2 x float]* %w, i32 %tmp194, i32 0 ; <float*> [#uses=1]
  %79 = load float* %scevgep230, align 4          ; <float> [#uses=4]
  %80 = load float* %scevgep229, align 4          ; <float> [#uses=3]
  %81 = fsub float -0.000000e+00, %80             ; <float> [#uses=2]
  %tmp.us.us = insertelement <4 x float> undef, float %79, i32 0 ; <<4 x float>> [#uses=1]
  %tmp50.us.us = insertelement <4 x float> %tmp.us.us, float %79, i32 1 ; <<4 x float>> [#uses=1]
  %tmp52.us.us = insertelement <4 x float> %tmp50.us.us, float %79, i32 2 ; <<4 x float>> [#uses=1]
  %tmp54.us.us = insertelement <4 x float> %tmp52.us.us, float %79, i32 3 ; <<4 x float>> [#uses=2]
  %tmp56.us.us = insertelement <4 x float> undef, float %80, i32 0 ; <<4 x float>> [#uses=1]
  %tmp68.us.us = insertelement <4 x float> %tmp56.us.us, float %81, i32 1 ; <<4 x float>> [#uses=1]
  %tmp70.us.us = insertelement <4 x float> %tmp68.us.us, float %80, i32 2 ; <<4 x float>> [#uses=1]
  %tmp72.us.us = insertelement <4 x float> %tmp70.us.us, float %81, i32 3 ; <<4 x float>> [#uses=2]
  br label %bb29.us.us

bb30.bb31_crit_edge.us.us:                        ; preds = %bb29.us.us
  %82 = add nsw i32 %j.276.us.us, 1               ; <i32> [#uses=2]
  %exitcond220 = icmp eq i32 %82, %lj.0120        ; <i1> [#uses=1]
  br i1 %exitcond220, label %bb33, label %bb24.us.us

bb29.us.us:                                       ; preds = %bb29.us.us, %bb24.us.us
  %indvar182 = phi i32 [ 0, %bb24.us.us ], [ %indvar.next183, %bb29.us.us ] ; <i32> [#uses=2]
  %tmp184 = shl i32 %indvar182, 2                 ; <i32> [#uses=9]
  %tmp188 = add i32 %tmp184, %tmp187              ; <i32> [#uses=1]
  %scevgep189 = getelementptr [2 x float]* %x.pn, i32 %tmp188, i32 0 ; <float*> [#uses=1]
  %scevgep189190 = bitcast float* %scevgep189 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp191 = add i32 %tmp184, %tmp186              ; <i32> [#uses=1]
  %scevgep192 = getelementptr [2 x float]* %c.1, i32 %tmp191, i32 0 ; <float*> [#uses=1]
  %scevgep192193 = bitcast float* %scevgep192 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp196 = add i32 %tmp184, %tmp195              ; <i32> [#uses=1]
  %scevgep197 = getelementptr [2 x float]* %y.pn, i32 %tmp196, i32 0 ; <float*> [#uses=1]
  %scevgep197198 = bitcast float* %scevgep197 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp199 = add i32 %tmp184, %tmp194              ; <i32> [#uses=1]
  %scevgep200 = getelementptr [2 x float]* %a.0, i32 %tmp199, i32 0 ; <float*> [#uses=1]
  %scevgep200201 = bitcast float* %scevgep200 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp204 = add i32 %tmp184, %tmp203              ; <i32> [#uses=1]
  %scevgep205 = getelementptr [2 x float]* %x.pn, i32 %tmp204, i32 0 ; <float*> [#uses=1]
  %scevgep205206 = bitcast float* %scevgep205 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp208 = add i32 %tmp184, %tmp207320           ; <i32> [#uses=1]
  %scevgep209 = getelementptr [2 x float]* %c.1, i32 %tmp208, i32 0 ; <float*> [#uses=1]
  %scevgep209210 = bitcast float* %scevgep209 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp213 = add i32 %tmp184, %tmp212              ; <i32> [#uses=1]
  %scevgep214 = getelementptr [2 x float]* %y.pn, i32 %tmp213, i32 0 ; <float*> [#uses=1]
  %scevgep214215 = bitcast float* %scevgep214 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp217 = add i32 %tmp184, %tmp216              ; <i32> [#uses=1]
  %scevgep218 = getelementptr [2 x float]* %a.0, i32 %tmp217, i32 0 ; <float*> [#uses=1]
  %scevgep218219 = bitcast float* %scevgep218 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %83 = load <4 x float>* %scevgep200201, align 16 ; <<4 x float>> [#uses=2]
  %84 = load <4 x float>* %scevgep197198, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i32.us.us = fadd <4 x float> %83, %84      ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i32.us.us, <4 x float>* %scevgep192193, align 16
  %tmp.i31.us.us = fsub <4 x float> %83, %84      ; <<4 x float>> [#uses=2]
  %85 = shufflevector <4 x float> %tmp.i31.us.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i30.us.us = fmul <4 x float> %tmp54.us.us, %tmp.i31.us.us ; <<4 x float>> [#uses=1]
  %tmp.i29.us.us = fmul <4 x float> %tmp72.us.us, %85 ; <<4 x float>> [#uses=1]
  %tmp.i28.us.us = fadd <4 x float> %tmp.i30.us.us, %tmp.i29.us.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i28.us.us, <4 x float>* %scevgep189190, align 16
  %86 = load <4 x float>* %scevgep218219, align 16 ; <<4 x float>> [#uses=2]
  %87 = load <4 x float>* %scevgep214215, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i27.us.us = fadd <4 x float> %86, %87      ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i27.us.us, <4 x float>* %scevgep209210, align 16
  %tmp.i26.us.us = fsub <4 x float> %86, %87      ; <<4 x float>> [#uses=2]
  %88 = shufflevector <4 x float> %tmp.i26.us.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i25.us.us = fmul <4 x float> %tmp54.us.us, %tmp.i26.us.us ; <<4 x float>> [#uses=1]
  %tmp.i24.us.us = fmul <4 x float> %tmp72.us.us, %88 ; <<4 x float>> [#uses=1]
  %tmp.i23.us.us = fadd <4 x float> %tmp.i25.us.us, %tmp.i24.us.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i23.us.us, <4 x float>* %scevgep205206, align 16
  %tmp185 = add i32 %tmp184, 4                    ; <i32> [#uses=1]
  %89 = icmp slt i32 %tmp185, %mj.0119            ; <i1> [#uses=1]
  %indvar.next183 = add i32 %indvar182, 1         ; <i32> [#uses=1]
  br i1 %89, label %bb29.us.us, label %bb30.bb31_crit_edge.us.us

bb26.us:                                          ; preds = %bb26.us, %bb.nph77.split.us
  %j.276.us = phi i32 [ %90, %bb26.us ], [ 0, %bb.nph77.split.us ] ; <i32> [#uses=1]
  %90 = add nsw i32 %j.276.us, 1                  ; <i32> [#uses=2]
  %exitcond279 = icmp eq i32 %90, %lj.0120        ; <i1> [#uses=1]
  br i1 %exitcond279, label %bb33, label %bb26.us

bb.nph77.split:                                   ; preds = %bb.nph77
  br i1 %78, label %bb.nph77.split.split.us, label %bb31

bb.nph77.split.split.us:                          ; preds = %bb.nph77.split
  %tmp251 = add i32 %mj.0119, 2                   ; <i32> [#uses=1]
  br label %bb24.us79

bb24.us79:                                        ; preds = %bb30.bb31_crit_edge.us114, %bb.nph77.split.split.us
  %j.276.us80 = phi i32 [ 0, %bb.nph77.split.split.us ], [ %101, %bb30.bb31_crit_edge.us114 ] ; <i32> [#uses=3]
  %tmp243 = mul i32 %j.276.us80, %mj.0119         ; <i32> [#uses=6]
  %tmp264 = add i32 %tmp243, 2                    ; <i32> [#uses=1]
  %tmp260 = add i32 %tmp243, 514                  ; <i32> [#uses=1]
  %tmp244 = add i32 %tmp243, 512                  ; <i32> [#uses=1]
  %tmp235 = mul i32 %j.276.us80, %mj2.0118        ; <i32> [#uses=4]
  %tmp256321 = or i32 %tmp235, 2                  ; <i32> [#uses=1]
  %tmp252 = add i32 %tmp235, %tmp251              ; <i32> [#uses=1]
  %tmp236 = add i32 %mj.0119, %tmp235             ; <i32> [#uses=1]
  %scevgep277 = getelementptr [2 x float]* %w, i32 %tmp243, i32 1 ; <float*> [#uses=1]
  %scevgep278 = getelementptr [2 x float]* %w, i32 %tmp243, i32 0 ; <float*> [#uses=1]
  %91 = load float* %scevgep278, align 4          ; <float> [#uses=4]
  %92 = load float* %scevgep277, align 4          ; <float> [#uses=3]
  %tmp.us86 = insertelement <4 x float> undef, float %91, i32 0 ; <<4 x float>> [#uses=1]
  %tmp50.us87 = insertelement <4 x float> %tmp.us86, float %91, i32 1 ; <<4 x float>> [#uses=1]
  %tmp52.us88 = insertelement <4 x float> %tmp50.us87, float %91, i32 2 ; <<4 x float>> [#uses=1]
  %tmp54.us89 = insertelement <4 x float> %tmp52.us88, float %91, i32 3 ; <<4 x float>> [#uses=2]
  %93 = fsub float -0.000000e+00, %92             ; <float> [#uses=2]
  %tmp56.us90 = insertelement <4 x float> undef, float %93, i32 0 ; <<4 x float>> [#uses=1]
  %tmp68.us91 = insertelement <4 x float> %tmp56.us90, float %92, i32 1 ; <<4 x float>> [#uses=1]
  %tmp70.us92 = insertelement <4 x float> %tmp68.us91, float %93, i32 2 ; <<4 x float>> [#uses=1]
  %tmp72.us93 = insertelement <4 x float> %tmp70.us92, float %92, i32 3 ; <<4 x float>> [#uses=2]
  br label %bb29.us97

bb29.us97:                                        ; preds = %bb29.us97, %bb24.us79
  %indvar231 = phi i32 [ 0, %bb24.us79 ], [ %indvar.next232, %bb29.us97 ] ; <i32> [#uses=2]
  %tmp233 = shl i32 %indvar231, 2                 ; <i32> [#uses=9]
  %tmp237 = add i32 %tmp233, %tmp236              ; <i32> [#uses=1]
  %scevgep238 = getelementptr [2 x float]* %x.pn, i32 %tmp237, i32 0 ; <float*> [#uses=1]
  %scevgep238239 = bitcast float* %scevgep238 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp240 = add i32 %tmp233, %tmp235              ; <i32> [#uses=1]
  %scevgep241 = getelementptr [2 x float]* %c.1, i32 %tmp240, i32 0 ; <float*> [#uses=1]
  %scevgep241242 = bitcast float* %scevgep241 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp245 = add i32 %tmp233, %tmp244              ; <i32> [#uses=1]
  %scevgep246 = getelementptr [2 x float]* %y.pn, i32 %tmp245, i32 0 ; <float*> [#uses=1]
  %scevgep246247 = bitcast float* %scevgep246 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp248 = add i32 %tmp233, %tmp243              ; <i32> [#uses=1]
  %scevgep249 = getelementptr [2 x float]* %a.0, i32 %tmp248, i32 0 ; <float*> [#uses=1]
  %scevgep249250 = bitcast float* %scevgep249 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp253 = add i32 %tmp233, %tmp252              ; <i32> [#uses=1]
  %scevgep254 = getelementptr [2 x float]* %x.pn, i32 %tmp253, i32 0 ; <float*> [#uses=1]
  %scevgep254255 = bitcast float* %scevgep254 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp257 = add i32 %tmp233, %tmp256321           ; <i32> [#uses=1]
  %scevgep258 = getelementptr [2 x float]* %c.1, i32 %tmp257, i32 0 ; <float*> [#uses=1]
  %scevgep258259 = bitcast float* %scevgep258 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp261 = add i32 %tmp233, %tmp260              ; <i32> [#uses=1]
  %scevgep262 = getelementptr [2 x float]* %y.pn, i32 %tmp261, i32 0 ; <float*> [#uses=1]
  %scevgep262263 = bitcast float* %scevgep262 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp265 = add i32 %tmp233, %tmp264              ; <i32> [#uses=1]
  %scevgep266 = getelementptr [2 x float]* %a.0, i32 %tmp265, i32 0 ; <float*> [#uses=1]
  %scevgep266267 = bitcast float* %scevgep266 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %94 = load <4 x float>* %scevgep249250, align 16 ; <<4 x float>> [#uses=2]
  %95 = load <4 x float>* %scevgep246247, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i32.us100 = fadd <4 x float> %94, %95      ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i32.us100, <4 x float>* %scevgep241242, align 16
  %tmp.i31.us101 = fsub <4 x float> %94, %95      ; <<4 x float>> [#uses=2]
  %96 = shufflevector <4 x float> %tmp.i31.us101, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i30.us102 = fmul <4 x float> %tmp54.us89, %tmp.i31.us101 ; <<4 x float>> [#uses=1]
  %tmp.i29.us103 = fmul <4 x float> %tmp72.us93, %96 ; <<4 x float>> [#uses=1]
  %tmp.i28.us104 = fadd <4 x float> %tmp.i30.us102, %tmp.i29.us103 ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i28.us104, <4 x float>* %scevgep238239, align 16
  %97 = load <4 x float>* %scevgep266267, align 16 ; <<4 x float>> [#uses=2]
  %98 = load <4 x float>* %scevgep262263, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i27.us107 = fadd <4 x float> %97, %98      ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i27.us107, <4 x float>* %scevgep258259, align 16
  %tmp.i26.us108 = fsub <4 x float> %97, %98      ; <<4 x float>> [#uses=2]
  %99 = shufflevector <4 x float> %tmp.i26.us108, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i25.us109 = fmul <4 x float> %tmp54.us89, %tmp.i26.us108 ; <<4 x float>> [#uses=1]
  %tmp.i24.us110 = fmul <4 x float> %tmp72.us93, %99 ; <<4 x float>> [#uses=1]
  %tmp.i23.us111 = fadd <4 x float> %tmp.i25.us109, %tmp.i24.us110 ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i23.us111, <4 x float>* %scevgep254255, align 16
  %tmp234 = add i32 %tmp233, 4                    ; <i32> [#uses=1]
  %100 = icmp slt i32 %tmp234, %mj.0119           ; <i1> [#uses=1]
  %indvar.next232 = add i32 %indvar231, 1         ; <i32> [#uses=1]
  br i1 %100, label %bb29.us97, label %bb30.bb31_crit_edge.us114

bb30.bb31_crit_edge.us114:                        ; preds = %bb29.us97
  %101 = add nsw i32 %j.276.us80, 1               ; <i32> [#uses=2]
  %exitcond268 = icmp eq i32 %101, %lj.0120       ; <i1> [#uses=1]
  br i1 %exitcond268, label %bb33, label %bb24.us79

bb31:                                             ; preds = %bb31, %bb.nph77.split
  %j.276 = phi i32 [ %102, %bb31 ], [ 0, %bb.nph77.split ] ; <i32> [#uses=1]
  %102 = add nsw i32 %j.276, 1                    ; <i32> [#uses=2]
  %exitcond280 = icmp eq i32 %102, %lj.0120       ; <i1> [#uses=1]
  br i1 %exitcond280, label %bb33, label %bb31

bb33:                                             ; preds = %bb31, %bb30.bb31_crit_edge.us114, %bb26.us, %bb30.bb31_crit_edge.us.us, %bb23
  %103 = shl i32 %mj.0119, 1                      ; <i32> [#uses=1]
  %104 = shl i32 %mj.0119, 2                      ; <i32> [#uses=2]
  %indvar.next282 = add i32 %indvar281, 1         ; <i32> [#uses=2]
  %exitcond284 = icmp eq i32 %indvar.next282, %tmp283 ; <i1> [#uses=1]
  br i1 %exitcond284, label %bb.nph, label %bb20

bb.nph:                                           ; preds = %bb33, %bb19
  %tgle.1.lcssa = phi i32 [ 0, %bb19 ], [ %tgle.0, %bb33 ] ; <i32> [#uses=1]
  %105 = icmp eq i32 %tgle.1.lcssa, 0             ; <i1> [#uses=1]
  %y.pn15 = select i1 %105, [2 x float]* %x, [2 x float]* %y ; <[2 x float]*> [#uses=4]
  br label %bb39

bb39:                                             ; preds = %bb39, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb39 ] ; <i32> [#uses=2]
  %tmp157 = shl i32 %indvar, 2                    ; <i32> [#uses=6]
  %scevgep158 = getelementptr [2 x float]* %y, i32 %tmp157, i32 0 ; <float*> [#uses=1]
  %scevgep158159 = bitcast float* %scevgep158 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep160 = getelementptr [2 x float]* %y.pn15, i32 %tmp157, i32 0 ; <float*> [#uses=1]
  %scevgep160161 = bitcast float* %scevgep160 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp163 = add i32 %tmp157, 514                  ; <i32> [#uses=2]
  %scevgep164 = getelementptr [2 x float]* %y, i32 %tmp163, i32 0 ; <float*> [#uses=1]
  %scevgep164165 = bitcast float* %scevgep164 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep168 = getelementptr [2 x float]* %y.pn15, i32 %tmp163, i32 0 ; <float*> [#uses=1]
  %scevgep168169 = bitcast float* %scevgep168 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp170322 = or i32 %tmp157, 2                  ; <i32> [#uses=2]
  %scevgep171 = getelementptr [2 x float]* %y, i32 %tmp170322, i32 0 ; <float*> [#uses=1]
  %scevgep171172 = bitcast float* %scevgep171 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep173 = getelementptr [2 x float]* %y.pn15, i32 %tmp170322, i32 0 ; <float*> [#uses=1]
  %scevgep173174 = bitcast float* %scevgep173 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp175 = add i32 %tmp157, 512                  ; <i32> [#uses=2]
  %scevgep176 = getelementptr [2 x float]* %y.pn15, i32 %tmp175, i32 0 ; <float*> [#uses=1]
  %scevgep176177 = bitcast float* %scevgep176 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep179 = getelementptr [2 x float]* %y, i32 %tmp175, i32 0 ; <float*> [#uses=1]
  %scevgep179180 = bitcast float* %scevgep179 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %106 = load <4 x float>* %scevgep160161, align 16 ; <<4 x float>> [#uses=2]
  %107 = load <4 x float>* %scevgep176177, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i22 = fadd <4 x float> %106, %107          ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i22, <4 x float>* %scevgep158159, align 16
  %tmp.i21 = fsub <4 x float> %106, %107          ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i21, <4 x float>* %scevgep179180, align 16
  %108 = load <4 x float>* %scevgep173174, align 16 ; <<4 x float>> [#uses=2]
  %109 = load <4 x float>* %scevgep168169, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i20 = fadd <4 x float> %108, %109          ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i20, <4 x float>* %scevgep171172, align 16
  %tmp.i = fsub <4 x float> %108, %109            ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i, <4 x float>* %scevgep164165, align 16
  %tmp181 = add i32 %tmp157, 4                    ; <i32> [#uses=1]
  %110 = icmp slt i32 %tmp181, 512                ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %110, label %bb39, label %return

return:                                           ; preds = %bb39
  ret void
}

declare double @llvm.log.f64(double) nounwind readonly

define i32 @main() nounwind {
entry:
  %0 = tail call noalias i8* @valloc(i32 8192) nounwind ; <i8*> [#uses=7]
  %1 = tail call noalias i8* @valloc(i32 8192) nounwind ; <i8*> [#uses=1]
  %2 = tail call noalias i8* @valloc(i32 8192) nounwind ; <i8*> [#uses=6]
  %3 = tail call noalias i8* @valloc(i32 4096) nounwind ; <i8*> [#uses=4]
  %tmp3 = bitcast i8* %0 to [2 x float]*          ; <[2 x float]*> [#uses=4]
  %tmp4 = bitcast i8* %1 to [2 x float]*          ; <[2 x float]*> [#uses=4]
  %tmp5 = bitcast i8* %3 to [2 x float]*          ; <[2 x float]*> [#uses=4]
  br label %bb

bb:                                               ; preds = %bb20, %entry
  %first.130 = phi i32 [ 1, %entry ], [ %first.0, %bb20 ] ; <i32> [#uses=2]
  %icase.029 = phi i32 [ 0, %entry ], [ %49, %bb20 ] ; <i32> [#uses=1]
  %seed.228 = phi float [ 3.310000e+02, %entry ], [ %seed.1, %bb20 ] ; <float> [#uses=2]
  %4 = icmp eq i32 %first.130, 0                  ; <i1> [#uses=2]
  br i1 %4, label %bb5, label %bb2

bb2:                                              ; preds = %bb2, %bb
  %indvar52 = phi i32 [ %indvar.next53, %bb2 ], [ 0, %bb ] ; <i32> [#uses=2]
  %seed.020 = phi float [ %15, %bb2 ], [ %seed.228, %bb ] ; <float> [#uses=1]
  %tmp55 = shl i32 %indvar52, 3                   ; <i32> [#uses=3]
  %scevgep56 = getelementptr i8* %0, i32 %tmp55   ; <i8*> [#uses=1]
  %scevgep5657 = bitcast i8* %scevgep56 to float* ; <float*> [#uses=1]
  %scevgep58 = getelementptr i8* %2, i32 %tmp55   ; <i8*> [#uses=1]
  %scevgep5859 = bitcast i8* %scevgep58 to float* ; <float*> [#uses=1]
  %tmp6090 = or i32 %tmp55, 4                     ; <i32> [#uses=2]
  %scevgep61 = getelementptr i8* %0, i32 %tmp6090 ; <i8*> [#uses=1]
  %scevgep6162 = bitcast i8* %scevgep61 to float* ; <float*> [#uses=1]
  %scevgep63 = getelementptr i8* %2, i32 %tmp6090 ; <i8*> [#uses=1]
  %scevgep6364 = bitcast i8* %scevgep63 to float* ; <float*> [#uses=1]
  %5 = fpext float %seed.020 to double            ; <double> [#uses=1]
  %6 = fmul double %5, 1.680700e+04               ; <double> [#uses=1]
  %7 = tail call double @fmod(double %6, double 0x41DFFFFFFFC00000) nounwind readonly ; <double> [#uses=2]
  %8 = fptrunc double %7 to float                 ; <float> [#uses=1]
  %9 = fadd double %7, -1.000000e+00              ; <double> [#uses=1]
  %10 = fdiv double %9, 0x41DFFFFFFF800000        ; <double> [#uses=1]
  %11 = fptrunc double %10 to float               ; <float> [#uses=2]
  %12 = fpext float %8 to double                  ; <double> [#uses=1]
  %13 = fmul double %12, 1.680700e+04             ; <double> [#uses=1]
  %14 = tail call double @fmod(double %13, double 0x41DFFFFFFFC00000) nounwind readonly ; <double> [#uses=2]
  %15 = fptrunc double %14 to float               ; <float> [#uses=2]
  %16 = fadd double %14, -1.000000e+00            ; <double> [#uses=1]
  %17 = fdiv double %16, 0x41DFFFFFFF800000       ; <double> [#uses=1]
  %18 = fptrunc double %17 to float               ; <float> [#uses=2]
  store float %11, float* %scevgep5657, align 4
  store float %11, float* %scevgep5859, align 4
  store float %18, float* %scevgep6162, align 4
  store float %18, float* %scevgep6364, align 4
  %indvar.next53 = add i32 %indvar52, 1           ; <i32> [#uses=2]
  %exitcond54 = icmp eq i32 %indvar.next53, 1024  ; <i1> [#uses=1]
  br i1 %exitcond54, label %bb7, label %bb2

bb5:                                              ; preds = %bb5, %bb
  %indvar = phi i32 [ %indvar.next, %bb5 ], [ 0, %bb ] ; <i32> [#uses=2]
  %tmp42 = shl i32 %indvar, 3                     ; <i32> [#uses=3]
  %scevgep43 = getelementptr i8* %0, i32 %tmp42   ; <i8*> [#uses=1]
  %scevgep4344 = bitcast i8* %scevgep43 to float* ; <float*> [#uses=1]
  %scevgep45 = getelementptr i8* %2, i32 %tmp42   ; <i8*> [#uses=1]
  %scevgep4546 = bitcast i8* %scevgep45 to float* ; <float*> [#uses=1]
  %tmp4787 = or i32 %tmp42, 4                     ; <i32> [#uses=2]
  %scevgep48 = getelementptr i8* %0, i32 %tmp4787 ; <i8*> [#uses=1]
  %scevgep4849 = bitcast i8* %scevgep48 to float* ; <float*> [#uses=1]
  %scevgep50 = getelementptr i8* %2, i32 %tmp4787 ; <i8*> [#uses=1]
  %scevgep5051 = bitcast i8* %scevgep50 to float* ; <float*> [#uses=1]
  store float 0.000000e+00, float* %scevgep4344, align 4
  store float 0.000000e+00, float* %scevgep4546, align 4
  store float 0.000000e+00, float* %scevgep4849, align 4
  store float 0.000000e+00, float* %scevgep5051, align 4
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond41 = icmp eq i32 %indvar.next, 1024    ; <i1> [#uses=1]
  br i1 %exitcond41, label %bb7, label %bb5

bb7:                                              ; preds = %bb5, %bb2
  %seed.1 = phi float [ %15, %bb2 ], [ %seed.228, %bb5 ] ; <float> [#uses=1]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb7
  %19 = phi i32 [ 0, %bb7 ], [ %24, %bb.i ]       ; <i32> [#uses=3]
  %tmp66 = shl i32 %19, 3                         ; <i32> [#uses=2]
  %scevgep67 = getelementptr i8* %3, i32 %tmp66   ; <i8*> [#uses=1]
  %scevgep2.i = bitcast i8* %scevgep67 to float*  ; <float*> [#uses=1]
  %tmp6989 = or i32 %tmp66, 4                     ; <i32> [#uses=1]
  %scevgep70 = getelementptr i8* %3, i32 %tmp6989 ; <i8*> [#uses=1]
  %scevgep.i = bitcast i8* %scevgep70 to float*   ; <float*> [#uses=1]
  %20 = sitofp i32 %19 to float                   ; <float> [#uses=1]
  %21 = fmul float %20, 0x3F7921FB60000000        ; <float> [#uses=2]
  %22 = tail call float @cosf(float %21) nounwind readonly ; <float> [#uses=1]
  store float %22, float* %scevgep2.i, align 4
  %23 = tail call float @sinf(float %21) nounwind readonly ; <float> [#uses=1]
  store float %23, float* %scevgep.i, align 4
  %24 = add nsw i32 %19, 1                        ; <i32> [#uses=2]
  %exitcond65 = icmp eq i32 %24, 512              ; <i1> [#uses=1]
  br i1 %exitcond65, label %cffti.exit, label %bb.i

cffti.exit:                                       ; preds = %bb.i
  br i1 %4, label %bb13, label %bb8

bb8:                                              ; preds = %cffti.exit
  tail call fastcc void @cfft2([2 x float]* %tmp3, [2 x float]* %tmp4, [2 x float]* %tmp5, double 1.000000e+00) nounwind
  tail call fastcc void @cfft2([2 x float]* %tmp4, [2 x float]* %tmp3, [2 x float]* %tmp5, double -1.000000e+00) nounwind
  br label %bb9

bb9:                                              ; preds = %bb9, %bb8
  %indvar73 = phi i32 [ 0, %bb8 ], [ %indvar.next74, %bb9 ] ; <i32> [#uses=2]
  %error.024 = phi double [ 0.000000e+00, %bb8 ], [ %37, %bb9 ] ; <double> [#uses=1]
  %tmp76 = shl i32 %indvar73, 3                   ; <i32> [#uses=3]
  %scevgep77 = getelementptr i8* %2, i32 %tmp76   ; <i8*> [#uses=1]
  %scevgep7778 = bitcast i8* %scevgep77 to float* ; <float*> [#uses=1]
  %scevgep79 = getelementptr i8* %0, i32 %tmp76   ; <i8*> [#uses=1]
  %scevgep7980 = bitcast i8* %scevgep79 to float* ; <float*> [#uses=1]
  %tmp8188 = or i32 %tmp76, 4                     ; <i32> [#uses=2]
  %scevgep82 = getelementptr i8* %2, i32 %tmp8188 ; <i8*> [#uses=1]
  %scevgep8283 = bitcast i8* %scevgep82 to float* ; <float*> [#uses=1]
  %scevgep84 = getelementptr i8* %0, i32 %tmp8188 ; <i8*> [#uses=1]
  %scevgep8485 = bitcast i8* %scevgep84 to float* ; <float*> [#uses=1]
  %25 = load float* %scevgep7778, align 4         ; <float> [#uses=1]
  %26 = load float* %scevgep7980, align 4         ; <float> [#uses=1]
  %27 = fmul float %26, 9.765625e-04              ; <float> [#uses=1]
  %28 = fsub float %25, %27                       ; <float> [#uses=2]
  %29 = fmul float %28, %28                       ; <float> [#uses=1]
  %30 = load float* %scevgep8283, align 4         ; <float> [#uses=1]
  %31 = load float* %scevgep8485, align 4         ; <float> [#uses=1]
  %32 = fmul float %31, 9.765625e-04              ; <float> [#uses=1]
  %33 = fsub float %30, %32                       ; <float> [#uses=2]
  %34 = fmul float %33, %33                       ; <float> [#uses=1]
  %35 = fadd float %29, %34                       ; <float> [#uses=1]
  %36 = fpext float %35 to double                 ; <double> [#uses=1]
  %37 = fadd double %36, %error.024               ; <double> [#uses=2]
  %indvar.next74 = add i32 %indvar73, 1           ; <i32> [#uses=2]
  %exitcond75 = icmp eq i32 %indvar.next74, 1024  ; <i1> [#uses=1]
  br i1 %exitcond75, label %bb10.bb11_crit_edge, label %bb9

bb10.bb11_crit_edge:                              ; preds = %bb9
  %phitmp37 = fmul double %37, 9.765625e-04       ; <double> [#uses=1]
  %38 = tail call double @llvm.sqrt.f64(double %phitmp37) ; <double> [#uses=1]
  %39 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0), i32 1024, double %38) nounwind ; <i32> [#uses=0]
  br label %bb20

bb13:                                             ; preds = %bb13, %cffti.exit
  %it.014 = phi i32 [ %40, %bb13 ], [ 0, %cffti.exit ] ; <i32> [#uses=1]
  tail call fastcc void @cfft2([2 x float]* %tmp3, [2 x float]* %tmp4, [2 x float]* %tmp5, double 1.000000e+00) nounwind
  tail call fastcc void @cfft2([2 x float]* %tmp4, [2 x float]* %tmp3, [2 x float]* %tmp5, double -1.000000e+00) nounwind
  %40 = add nsw i32 %it.014, 1                    ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %40, 20000              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb15, label %bb13

bb15:                                             ; preds = %bb13
  %41 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 1024) nounwind ; <i32> [#uses=0]
  br label %bb16

bb16:                                             ; preds = %bb18, %bb15
  %j.016 = phi i32 [ 0, %bb15 ], [ %j.1, %bb18 ]  ; <i32> [#uses=1]
  %i.315 = phi i32 [ 0, %bb15 ], [ %48, %bb18 ]   ; <i32> [#uses=2]
  %tmp39 = shl i32 %i.315, 2                      ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %3, i32 %tmp39     ; <i8*> [#uses=1]
  %scevgep40 = bitcast i8* %scevgep to float*     ; <float*> [#uses=1]
  %42 = load float* %scevgep40, align 4           ; <float> [#uses=1]
  %43 = fpext float %42 to double                 ; <double> [#uses=1]
  %44 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0), double %43) nounwind ; <i32> [#uses=0]
  %45 = add i32 %j.016, 1                         ; <i32> [#uses=2]
  %46 = icmp eq i32 %45, 4                        ; <i1> [#uses=1]
  br i1 %46, label %bb17, label %bb18

bb17:                                             ; preds = %bb16
  %47 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  br label %bb18

bb18:                                             ; preds = %bb17, %bb16
  %j.1 = phi i32 [ 0, %bb17 ], [ %45, %bb16 ]     ; <i32> [#uses=1]
  %48 = add nsw i32 %i.315, 1                     ; <i32> [#uses=2]
  %exitcond38 = icmp eq i32 %48, 1024             ; <i1> [#uses=1]
  br i1 %exitcond38, label %bb20, label %bb16

bb20:                                             ; preds = %bb18, %bb10.bb11_crit_edge
  %first.0 = phi i32 [ 0, %bb10.bb11_crit_edge ], [ %first.130, %bb18 ] ; <i32> [#uses=1]
  %49 = add nsw i32 %icase.029, 1                 ; <i32> [#uses=2]
  %exitcond86 = icmp eq i32 %49, 2                ; <i1> [#uses=1]
  br i1 %exitcond86, label %bb22, label %bb

bb22:                                             ; preds = %bb20
  ret i32 0
}

declare noalias i8* @valloc(i32) nounwind

declare double @llvm.sqrt.f64(double) nounwind readonly

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32) nounwind
