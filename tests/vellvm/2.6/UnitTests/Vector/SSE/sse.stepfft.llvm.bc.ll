; ModuleID = 'sse.stepfft.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [29 x i8] c" for n=%d, fwd/bck error=%e\0A\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str1 = private constant [11 x i8] c" for n=%d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str2 = private constant [5 x i8] c"%g  \00", align 1 ; <[5 x i8]*> [#uses=1]

declare double @fmod(double, double) nounwind readonly

declare float @cosf(float) nounwind readonly

declare float @sinf(float) nounwind readonly

define internal fastcc void @cfft2([2 x float]* nocapture %x, [2 x float]* nocapture %y, [2 x float]* nocapture %w, double %sign1) nounwind {
bb.nph24.i:
  %0 = tail call double @llvm.log.f64(double 1.024000e+03) ; <double> [#uses=1]
  %1 = tail call double @llvm.log.f64(double 1.990000e+00) ; <double> [#uses=1]
  %2 = fdiv double %0, %1                         ; <double> [#uses=1]
  %3 = fptosi double %2 to i32                    ; <i32> [#uses=1]
  %sign.i = fptrunc double %sign1 to float        ; <float> [#uses=1]
  %4 = fcmp olt float %sign.i, 0.000000e+00       ; <i1> [#uses=4]
  br i1 %4, label %bb.i.us, label %bb.i

bb.i.us:                                          ; preds = %bb.i.us, %bb.nph24.i
  %j.023.i.us = phi i32 [ %32, %bb.i.us ], [ 0, %bb.nph24.i ] ; <i32> [#uses=7]
  %tmp759 = add i32 %j.023.i.us, 512              ; <i32> [#uses=2]
  %scevgep45.i.us = getelementptr [2 x float]* %x, i32 %tmp759, i32 1 ; <float*> [#uses=3]
  %scevgep44.i.us = getelementptr [2 x float]* %x, i32 %j.023.i.us, i32 1 ; <float*> [#uses=3]
  %scevgep43.i.us = getelementptr [2 x float]* %x, i32 %tmp759, i32 0 ; <float*> [#uses=3]
  %scevgep42.i.us = getelementptr [2 x float]* %x, i32 %j.023.i.us, i32 0 ; <float*> [#uses=3]
  %scevgep41.i.us = getelementptr [2 x float]* %w, i32 %j.023.i.us, i32 1 ; <float*> [#uses=1]
  %scevgep40.i.us = getelementptr [2 x float]* %w, i32 %j.023.i.us, i32 0 ; <float*> [#uses=1]
  %tmp766 = shl i32 %j.023.i.us, 1                ; <i32> [#uses=3]
  %scevgep49.i.us = getelementptr [2 x float]* %y, i32 %tmp766, i32 1 ; <float*> [#uses=1]
  %scevgep48.i.us = getelementptr [2 x float]* %y, i32 %tmp766, i32 0 ; <float*> [#uses=1]
  %tmp7691050 = or i32 %tmp766, 1                 ; <i32> [#uses=2]
  %scevgep47.i.us = getelementptr [2 x float]* %y, i32 %tmp7691050, i32 1 ; <float*> [#uses=1]
  %scevgep46.i.us = getelementptr [2 x float]* %y, i32 %tmp7691050, i32 0 ; <float*> [#uses=1]
  %5 = load float* %scevgep40.i.us, align 4       ; <float> [#uses=2]
  %6 = load float* %scevgep41.i.us, align 4       ; <float> [#uses=1]
  %7 = fsub float -0.000000e+00, %6               ; <float> [#uses=2]
  %8 = load float* %scevgep42.i.us, align 4       ; <float> [#uses=1]
  %9 = load float* %scevgep43.i.us, align 4       ; <float> [#uses=1]
  %10 = fsub float %8, %9                         ; <float> [#uses=1]
  %11 = fmul float %10, %5                        ; <float> [#uses=1]
  %12 = load float* %scevgep44.i.us, align 4      ; <float> [#uses=1]
  %13 = load float* %scevgep45.i.us, align 4      ; <float> [#uses=1]
  %14 = fsub float %12, %13                       ; <float> [#uses=1]
  %15 = fmul float %14, %7                        ; <float> [#uses=1]
  %16 = fsub float %11, %15                       ; <float> [#uses=1]
  store float %16, float* %scevgep46.i.us, align 4
  %17 = load float* %scevgep42.i.us, align 4      ; <float> [#uses=1]
  %18 = load float* %scevgep43.i.us, align 4      ; <float> [#uses=1]
  %19 = fsub float %17, %18                       ; <float> [#uses=1]
  %20 = fmul float %19, %7                        ; <float> [#uses=1]
  %21 = load float* %scevgep44.i.us, align 4      ; <float> [#uses=1]
  %22 = load float* %scevgep45.i.us, align 4      ; <float> [#uses=1]
  %23 = fsub float %21, %22                       ; <float> [#uses=1]
  %24 = fmul float %23, %5                        ; <float> [#uses=1]
  %25 = fadd float %20, %24                       ; <float> [#uses=1]
  store float %25, float* %scevgep47.i.us, align 4
  %26 = load float* %scevgep42.i.us, align 4      ; <float> [#uses=1]
  %27 = load float* %scevgep43.i.us, align 4      ; <float> [#uses=1]
  %28 = fadd float %26, %27                       ; <float> [#uses=1]
  store float %28, float* %scevgep48.i.us, align 4
  %29 = load float* %scevgep44.i.us, align 4      ; <float> [#uses=1]
  %30 = load float* %scevgep45.i.us, align 4      ; <float> [#uses=1]
  %31 = fadd float %29, %30                       ; <float> [#uses=1]
  store float %31, float* %scevgep49.i.us, align 4
  %32 = add nsw i32 %j.023.i.us, 1                ; <i32> [#uses=2]
  %exitcond758 = icmp eq i32 %32, 512             ; <i1> [#uses=1]
  br i1 %exitcond758, label %bb5.preheader, label %bb.i.us

bb.i:                                             ; preds = %bb.i, %bb.nph24.i
  %j.023.i = phi i32 [ %59, %bb.i ], [ 0, %bb.nph24.i ] ; <i32> [#uses=7]
  %tmp773 = add i32 %j.023.i, 512                 ; <i32> [#uses=2]
  %scevgep45.i = getelementptr [2 x float]* %x, i32 %tmp773, i32 1 ; <float*> [#uses=3]
  %scevgep43.i = getelementptr [2 x float]* %x, i32 %tmp773, i32 0 ; <float*> [#uses=3]
  %scevgep40.i = getelementptr [2 x float]* %w, i32 %j.023.i, i32 0 ; <float*> [#uses=1]
  %scevgep41.i = getelementptr [2 x float]* %w, i32 %j.023.i, i32 1 ; <float*> [#uses=1]
  %scevgep42.i = getelementptr [2 x float]* %x, i32 %j.023.i, i32 0 ; <float*> [#uses=3]
  %scevgep44.i = getelementptr [2 x float]* %x, i32 %j.023.i, i32 1 ; <float*> [#uses=3]
  %tmp780 = shl i32 %j.023.i, 1                   ; <i32> [#uses=3]
  %tmp7811057 = or i32 %tmp780, 1                 ; <i32> [#uses=2]
  %scevgep47.i = getelementptr [2 x float]* %y, i32 %tmp7811057, i32 1 ; <float*> [#uses=1]
  %scevgep46.i = getelementptr [2 x float]* %y, i32 %tmp7811057, i32 0 ; <float*> [#uses=1]
  %scevgep49.i = getelementptr [2 x float]* %y, i32 %tmp780, i32 1 ; <float*> [#uses=1]
  %scevgep48.i = getelementptr [2 x float]* %y, i32 %tmp780, i32 0 ; <float*> [#uses=1]
  %33 = load float* %scevgep40.i, align 4         ; <float> [#uses=2]
  %34 = load float* %scevgep41.i, align 4         ; <float> [#uses=2]
  %35 = load float* %scevgep42.i, align 4         ; <float> [#uses=1]
  %36 = load float* %scevgep43.i, align 4         ; <float> [#uses=1]
  %37 = fsub float %35, %36                       ; <float> [#uses=1]
  %38 = fmul float %37, %33                       ; <float> [#uses=1]
  %39 = load float* %scevgep44.i, align 4         ; <float> [#uses=1]
  %40 = load float* %scevgep45.i, align 4         ; <float> [#uses=1]
  %41 = fsub float %39, %40                       ; <float> [#uses=1]
  %42 = fmul float %41, %34                       ; <float> [#uses=1]
  %43 = fsub float %38, %42                       ; <float> [#uses=1]
  store float %43, float* %scevgep46.i, align 4
  %44 = load float* %scevgep42.i, align 4         ; <float> [#uses=1]
  %45 = load float* %scevgep43.i, align 4         ; <float> [#uses=1]
  %46 = fsub float %44, %45                       ; <float> [#uses=1]
  %47 = fmul float %46, %34                       ; <float> [#uses=1]
  %48 = load float* %scevgep44.i, align 4         ; <float> [#uses=1]
  %49 = load float* %scevgep45.i, align 4         ; <float> [#uses=1]
  %50 = fsub float %48, %49                       ; <float> [#uses=1]
  %51 = fmul float %50, %33                       ; <float> [#uses=1]
  %52 = fadd float %47, %51                       ; <float> [#uses=1]
  store float %52, float* %scevgep47.i, align 4
  %53 = load float* %scevgep42.i, align 4         ; <float> [#uses=1]
  %54 = load float* %scevgep43.i, align 4         ; <float> [#uses=1]
  %55 = fadd float %53, %54                       ; <float> [#uses=1]
  store float %55, float* %scevgep48.i, align 4
  %56 = load float* %scevgep44.i, align 4         ; <float> [#uses=1]
  %57 = load float* %scevgep45.i, align 4         ; <float> [#uses=1]
  %58 = fadd float %56, %57                       ; <float> [#uses=1]
  store float %58, float* %scevgep49.i, align 4
  %59 = add nsw i32 %j.023.i, 1                   ; <i32> [#uses=2]
  %exitcond772 = icmp eq i32 %59, 512             ; <i1> [#uses=1]
  br i1 %exitcond772, label %bb5.preheader, label %bb.i

bb5.preheader:                                    ; preds = %bb.i, %bb.i.us
  %60 = add i32 %3, -2                            ; <i32> [#uses=2]
  %61 = icmp sgt i32 %60, 0                       ; <i1> [#uses=1]
  br i1 %61, label %bb, label %bb.i36

bb:                                               ; preds = %bb4, %bb5.preheader
  %62 = phi i1 [ %tgle.0, %bb4 ], [ false, %bb5.preheader ] ; <i1> [#uses=1]
  %j.0647 = phi i32 [ %326, %bb4 ], [ 0, %bb5.preheader ] ; <i32> [#uses=1]
  %mj.0646 = phi i32 [ %63, %bb4 ], [ 2, %bb5.preheader ] ; <i32> [#uses=33]
  %63 = shl i32 %mj.0646, 1                       ; <i32> [#uses=2]
  %64 = sdiv i32 1024, %63                        ; <i32> [#uses=17]
  %65 = icmp sgt i32 %64, 0                       ; <i1> [#uses=2]
  br i1 %62, label %bb3, label %bb2

bb2:                                              ; preds = %bb
  br i1 %65, label %bb.nph24.i91, label %bb4

bb.nph24.i91:                                     ; preds = %bb2
  %66 = icmp sgt i32 %mj.0646, 1                  ; <i1> [#uses=2]
  %67 = icmp sgt i32 %mj.0646, 0                  ; <i1> [#uses=4]
  br i1 %4, label %bb.nph24.i91.split.us, label %bb.nph24.i91.split

bb.nph24.i91.split.us:                            ; preds = %bb.nph24.i91
  br i1 %66, label %bb.nph24.i91.split.us.split.us, label %bb.nph24.i91.split.us.split

bb.nph24.i91.split.us.split.us:                   ; preds = %bb.nph24.i91.split.us
  br i1 %67, label %bb.i105.us.us.us, label %bb3.i108.us.us

bb.i105.us.us.us:                                 ; preds = %bb10.i141.loopexit.us.us.us, %bb.nph24.i91.split.us.split.us
  %j.023.i92.us.us.us = phi i32 [ %71, %bb10.i141.loopexit.us.us.us ], [ 0, %bb.nph24.i91.split.us.split.us ] ; <i32> [#uses=2]
  %tmp817 = mul i32 %j.023.i92.us.us.us, %mj.0646 ; <i32> [#uses=6]
  %tmp826 = add i32 %tmp817, 512                  ; <i32> [#uses=1]
  %tmp818 = shl i32 %tmp817, 1                    ; <i32> [#uses=1]
  %tmp819 = add i32 %mj.0646, %tmp818             ; <i32> [#uses=1]
  %scevgep41.i96.us.us.us = getelementptr [2 x float]* %w, i32 %tmp817, i32 1 ; <float*> [#uses=1]
  %scevgep40.i95.us.us.us = getelementptr [2 x float]* %w, i32 %tmp817, i32 0 ; <float*> [#uses=1]
  %68 = load float* %scevgep40.i95.us.us.us, align 4 ; <float> [#uses=4]
  %69 = load float* %scevgep41.i96.us.us.us, align 4 ; <float> [#uses=3]
  %70 = fsub float -0.000000e+00, %69             ; <float> [#uses=2]
  %tmp.i110.us.us.us = insertelement <4 x float> undef, float %68, i32 0 ; <<4 x float>> [#uses=1]
  %tmp8.i111.us.us.us = insertelement <4 x float> %tmp.i110.us.us.us, float %68, i32 1 ; <<4 x float>> [#uses=1]
  %tmp10.i112.us.us.us = insertelement <4 x float> %tmp8.i111.us.us.us, float %68, i32 2 ; <<4 x float>> [#uses=1]
  %tmp12.i113.us.us.us = insertelement <4 x float> %tmp10.i112.us.us.us, float %68, i32 3 ; <<4 x float>> [#uses=1]
  %tmp14.i114.us.us.us = insertelement <4 x float> undef, float %69, i32 0 ; <<4 x float>> [#uses=1]
  %tmp17.i115.us.us.us = insertelement <4 x float> %tmp14.i114.us.us.us, float %70, i32 1 ; <<4 x float>> [#uses=1]
  %tmp19.i116.us.us.us = insertelement <4 x float> %tmp17.i115.us.us.us, float %69, i32 2 ; <<4 x float>> [#uses=1]
  %tmp21.i117.us.us.us = insertelement <4 x float> %tmp19.i116.us.us.us, float %70, i32 3 ; <<4 x float>> [#uses=1]
  br label %bb8.i139.us.us.us

bb10.i141.loopexit.us.us.us:                      ; preds = %bb8.i139.us.us.us
  %71 = add nsw i32 %j.023.i92.us.us.us, 1        ; <i32> [#uses=2]
  %exitcond834 = icmp eq i32 %71, %64             ; <i1> [#uses=1]
  br i1 %exitcond834, label %bb4, label %bb.i105.us.us.us

bb8.i139.us.us.us:                                ; preds = %bb8.i139.us.us.us, %bb.i105.us.us.us
  %indvar.i119.us.us.us = phi i32 [ 0, %bb.i105.us.us.us ], [ %indvar.next.i138.us.us.us, %bb8.i139.us.us.us ] ; <i32> [#uses=3]
  %tmp816 = shl i32 %indvar.i119.us.us.us, 1      ; <i32> [#uses=4]
  %tmp820 = add i32 %tmp816, %tmp819              ; <i32> [#uses=1]
  %scevgep821 = getelementptr [2 x float]* %x, i32 %tmp820, i32 0 ; <float*> [#uses=1]
  %scevgep3536.i131.us.us.us = bitcast float* %scevgep821 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp8161053 = add i32 %indvar.i119.us.us.us, %tmp817 ; <i32> [#uses=1]
  %tmp823 = shl i32 %tmp8161053, 1                ; <i32> [#uses=1]
  %scevgep824 = getelementptr [2 x float]* %x, i32 %tmp823, i32 0 ; <float*> [#uses=1]
  %scevgep3334.i129.us.us.us = bitcast float* %scevgep824 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp827 = add i32 %tmp816, %tmp826              ; <i32> [#uses=1]
  %scevgep828 = getelementptr [2 x float]* %y, i32 %tmp827, i32 0 ; <float*> [#uses=1]
  %scevgep2930.i125.us.us.us = bitcast float* %scevgep828 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp830 = add i32 %tmp816, %tmp817              ; <i32> [#uses=1]
  %scevgep831 = getelementptr [2 x float]* %y, i32 %tmp830, i32 0 ; <float*> [#uses=1]
  %scevgep28.i123.us.us.us = bitcast float* %scevgep831 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp37.i137.us.us.us = add i32 %tmp816, 2       ; <i32> [#uses=1]
  %72 = load <4 x float>* %scevgep28.i123.us.us.us, align 16 ; <<4 x float>> [#uses=2]
  %73 = load <4 x float>* %scevgep2930.i125.us.us.us, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i4.i132.us.us.us = fadd <4 x float> %72, %73 ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i4.i132.us.us.us, <4 x float>* %scevgep3334.i129.us.us.us, align 16
  %tmp.i3.i133.us.us.us = fsub <4 x float> %72, %73 ; <<4 x float>> [#uses=2]
  %74 = shufflevector <4 x float> %tmp.i3.i133.us.us.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i2.i134.us.us.us = fmul <4 x float> %tmp12.i113.us.us.us, %tmp.i3.i133.us.us.us ; <<4 x float>> [#uses=1]
  %tmp.i1.i135.us.us.us = fmul <4 x float> %tmp21.i117.us.us.us, %74 ; <<4 x float>> [#uses=1]
  %tmp.i.i136.us.us.us = fadd <4 x float> %tmp.i2.i134.us.us.us, %tmp.i1.i135.us.us.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i.i136.us.us.us, <4 x float>* %scevgep3536.i131.us.us.us, align 16
  %75 = icmp slt i32 %tmp37.i137.us.us.us, %mj.0646 ; <i1> [#uses=1]
  %indvar.next.i138.us.us.us = add i32 %indvar.i119.us.us.us, 1 ; <i32> [#uses=1]
  br i1 %75, label %bb8.i139.us.us.us, label %bb10.i141.loopexit.us.us.us

bb3.i108.us.us:                                   ; preds = %bb3.i108.us.us, %bb.nph24.i91.split.us.split.us
  %j.023.i92.us.us = phi i32 [ %76, %bb3.i108.us.us ], [ 0, %bb.nph24.i91.split.us.split.us ] ; <i32> [#uses=1]
  %76 = add nsw i32 %j.023.i92.us.us, 1           ; <i32> [#uses=2]
  %exitcond907 = icmp eq i32 %76, %64             ; <i1> [#uses=1]
  br i1 %exitcond907, label %bb4, label %bb3.i108.us.us

bb.nph24.i91.split.us.split:                      ; preds = %bb.nph24.i91.split.us
  br i1 %67, label %bb.i105.us.us586, label %bb.i105.us

bb.i105.us.us586:                                 ; preds = %bb.i105.us.us586, %bb.nph24.i91.split.us.split
  %j.023.i92.us.us587 = phi i32 [ %104, %bb.i105.us.us586 ], [ 0, %bb.nph24.i91.split.us.split ] ; <i32> [#uses=2]
  %tmp892 = mul i32 %j.023.i92.us.us587, %mj.0646 ; <i32> [#uses=6]
  %tmp893 = add i32 %tmp892, 512                  ; <i32> [#uses=2]
  %scevgep45.i100.us.us597 = getelementptr [2 x float]* %y, i32 %tmp893, i32 1 ; <float*> [#uses=3]
  %scevgep44.i99.us.us595 = getelementptr [2 x float]* %y, i32 %tmp892, i32 1 ; <float*> [#uses=3]
  %scevgep43.i98.us.us594 = getelementptr [2 x float]* %y, i32 %tmp893, i32 0 ; <float*> [#uses=3]
  %scevgep42.i97.us.us592 = getelementptr [2 x float]* %y, i32 %tmp892, i32 0 ; <float*> [#uses=3]
  %scevgep41.i96.us.us591 = getelementptr [2 x float]* %w, i32 %tmp892, i32 1 ; <float*> [#uses=1]
  %scevgep40.i95.us.us590 = getelementptr [2 x float]* %w, i32 %tmp892, i32 0 ; <float*> [#uses=1]
  %tmp901 = shl i32 %tmp892, 1                    ; <i32> [#uses=3]
  %scevgep49.i104.us.us603 = getelementptr [2 x float]* %x, i32 %tmp901, i32 1 ; <float*> [#uses=1]
  %scevgep48.i103.us.us602 = getelementptr [2 x float]* %x, i32 %tmp901, i32 0 ; <float*> [#uses=1]
  %tmp904 = add i32 %mj.0646, %tmp901             ; <i32> [#uses=2]
  %scevgep47.i102.us.us601 = getelementptr [2 x float]* %x, i32 %tmp904, i32 1 ; <float*> [#uses=1]
  %scevgep46.i101.us.us599 = getelementptr [2 x float]* %x, i32 %tmp904, i32 0 ; <float*> [#uses=1]
  %77 = load float* %scevgep40.i95.us.us590, align 4 ; <float> [#uses=2]
  %78 = load float* %scevgep41.i96.us.us591, align 4 ; <float> [#uses=1]
  %79 = fsub float -0.000000e+00, %78             ; <float> [#uses=2]
  %80 = load float* %scevgep42.i97.us.us592, align 4 ; <float> [#uses=1]
  %81 = load float* %scevgep43.i98.us.us594, align 4 ; <float> [#uses=1]
  %82 = fsub float %80, %81                       ; <float> [#uses=1]
  %83 = fmul float %82, %77                       ; <float> [#uses=1]
  %84 = load float* %scevgep44.i99.us.us595, align 4 ; <float> [#uses=1]
  %85 = load float* %scevgep45.i100.us.us597, align 4 ; <float> [#uses=1]
  %86 = fsub float %84, %85                       ; <float> [#uses=1]
  %87 = fmul float %86, %79                       ; <float> [#uses=1]
  %88 = fsub float %83, %87                       ; <float> [#uses=1]
  store float %88, float* %scevgep46.i101.us.us599, align 4
  %89 = load float* %scevgep42.i97.us.us592, align 4 ; <float> [#uses=1]
  %90 = load float* %scevgep43.i98.us.us594, align 4 ; <float> [#uses=1]
  %91 = fsub float %89, %90                       ; <float> [#uses=1]
  %92 = fmul float %91, %79                       ; <float> [#uses=1]
  %93 = load float* %scevgep44.i99.us.us595, align 4 ; <float> [#uses=1]
  %94 = load float* %scevgep45.i100.us.us597, align 4 ; <float> [#uses=1]
  %95 = fsub float %93, %94                       ; <float> [#uses=1]
  %96 = fmul float %95, %77                       ; <float> [#uses=1]
  %97 = fadd float %92, %96                       ; <float> [#uses=1]
  store float %97, float* %scevgep47.i102.us.us601, align 4
  %98 = load float* %scevgep42.i97.us.us592, align 4 ; <float> [#uses=1]
  %99 = load float* %scevgep43.i98.us.us594, align 4 ; <float> [#uses=1]
  %100 = fadd float %98, %99                      ; <float> [#uses=1]
  store float %100, float* %scevgep48.i103.us.us602, align 4
  %101 = load float* %scevgep44.i99.us.us595, align 4 ; <float> [#uses=1]
  %102 = load float* %scevgep45.i100.us.us597, align 4 ; <float> [#uses=1]
  %103 = fadd float %101, %102                    ; <float> [#uses=1]
  store float %103, float* %scevgep49.i104.us.us603, align 4
  %104 = add nsw i32 %j.023.i92.us.us587, 1       ; <i32> [#uses=2]
  %exitcond891 = icmp eq i32 %104, %64            ; <i1> [#uses=1]
  br i1 %exitcond891, label %bb4, label %bb.i105.us.us586

bb.i105.us:                                       ; preds = %bb.i105.us, %bb.nph24.i91.split.us.split
  %j.023.i92.us = phi i32 [ %132, %bb.i105.us ], [ 0, %bb.nph24.i91.split.us.split ] ; <i32> [#uses=2]
  %tmp968 = mul i32 %j.023.i92.us, %mj.0646       ; <i32> [#uses=6]
  %tmp969 = add i32 %tmp968, 512                  ; <i32> [#uses=2]
  %scevgep45.i100.us = getelementptr [2 x float]* %y, i32 %tmp969, i32 1 ; <float*> [#uses=3]
  %scevgep44.i99.us = getelementptr [2 x float]* %y, i32 %tmp968, i32 1 ; <float*> [#uses=3]
  %scevgep43.i98.us = getelementptr [2 x float]* %y, i32 %tmp969, i32 0 ; <float*> [#uses=3]
  %scevgep42.i97.us = getelementptr [2 x float]* %y, i32 %tmp968, i32 0 ; <float*> [#uses=3]
  %scevgep41.i96.us = getelementptr [2 x float]* %w, i32 %tmp968, i32 1 ; <float*> [#uses=1]
  %scevgep40.i95.us = getelementptr [2 x float]* %w, i32 %tmp968, i32 0 ; <float*> [#uses=1]
  %tmp977 = shl i32 %tmp968, 1                    ; <i32> [#uses=3]
  %scevgep49.i104.us = getelementptr [2 x float]* %x, i32 %tmp977, i32 1 ; <float*> [#uses=1]
  %scevgep48.i103.us = getelementptr [2 x float]* %x, i32 %tmp977, i32 0 ; <float*> [#uses=1]
  %tmp980 = add i32 %mj.0646, %tmp977             ; <i32> [#uses=2]
  %scevgep47.i102.us = getelementptr [2 x float]* %x, i32 %tmp980, i32 1 ; <float*> [#uses=1]
  %scevgep46.i101.us = getelementptr [2 x float]* %x, i32 %tmp980, i32 0 ; <float*> [#uses=1]
  %105 = load float* %scevgep40.i95.us, align 4   ; <float> [#uses=2]
  %106 = load float* %scevgep41.i96.us, align 4   ; <float> [#uses=1]
  %107 = fsub float -0.000000e+00, %106           ; <float> [#uses=2]
  %108 = load float* %scevgep42.i97.us, align 4   ; <float> [#uses=1]
  %109 = load float* %scevgep43.i98.us, align 4   ; <float> [#uses=1]
  %110 = fsub float %108, %109                    ; <float> [#uses=1]
  %111 = fmul float %110, %105                    ; <float> [#uses=1]
  %112 = load float* %scevgep44.i99.us, align 4   ; <float> [#uses=1]
  %113 = load float* %scevgep45.i100.us, align 4  ; <float> [#uses=1]
  %114 = fsub float %112, %113                    ; <float> [#uses=1]
  %115 = fmul float %114, %107                    ; <float> [#uses=1]
  %116 = fsub float %111, %115                    ; <float> [#uses=1]
  store float %116, float* %scevgep46.i101.us, align 4
  %117 = load float* %scevgep42.i97.us, align 4   ; <float> [#uses=1]
  %118 = load float* %scevgep43.i98.us, align 4   ; <float> [#uses=1]
  %119 = fsub float %117, %118                    ; <float> [#uses=1]
  %120 = fmul float %119, %107                    ; <float> [#uses=1]
  %121 = load float* %scevgep44.i99.us, align 4   ; <float> [#uses=1]
  %122 = load float* %scevgep45.i100.us, align 4  ; <float> [#uses=1]
  %123 = fsub float %121, %122                    ; <float> [#uses=1]
  %124 = fmul float %123, %105                    ; <float> [#uses=1]
  %125 = fadd float %120, %124                    ; <float> [#uses=1]
  store float %125, float* %scevgep47.i102.us, align 4
  %126 = load float* %scevgep42.i97.us, align 4   ; <float> [#uses=1]
  %127 = load float* %scevgep43.i98.us, align 4   ; <float> [#uses=1]
  %128 = fadd float %126, %127                    ; <float> [#uses=1]
  store float %128, float* %scevgep48.i103.us, align 4
  %129 = load float* %scevgep44.i99.us, align 4   ; <float> [#uses=1]
  %130 = load float* %scevgep45.i100.us, align 4  ; <float> [#uses=1]
  %131 = fadd float %129, %130                    ; <float> [#uses=1]
  store float %131, float* %scevgep49.i104.us, align 4
  %132 = add nsw i32 %j.023.i92.us, 1             ; <i32> [#uses=2]
  %exitcond967 = icmp eq i32 %132, %64            ; <i1> [#uses=1]
  br i1 %exitcond967, label %bb4, label %bb.i105.us

bb.nph24.i91.split:                               ; preds = %bb.nph24.i91
  br i1 %66, label %bb.nph24.i91.split.split.us, label %bb.nph24.i91.split.split

bb.nph24.i91.split.split.us:                      ; preds = %bb.nph24.i91.split
  br i1 %67, label %bb.i105.us406.us, label %bb3.i108.us427

bb.i105.us406.us:                                 ; preds = %bb10.i141.loopexit.us463.us, %bb.nph24.i91.split.split.us
  %j.023.i92.us407.us = phi i32 [ %136, %bb10.i141.loopexit.us463.us ], [ 0, %bb.nph24.i91.split.split.us ] ; <i32> [#uses=2]
  %tmp867 = mul i32 %j.023.i92.us407.us, %mj.0646 ; <i32> [#uses=6]
  %tmp876 = add i32 %tmp867, 512                  ; <i32> [#uses=1]
  %tmp868 = shl i32 %tmp867, 1                    ; <i32> [#uses=1]
  %tmp869 = add i32 %mj.0646, %tmp868             ; <i32> [#uses=1]
  %scevgep41.i96.us411.us = getelementptr [2 x float]* %w, i32 %tmp867, i32 1 ; <float*> [#uses=1]
  %scevgep40.i95.us410.us = getelementptr [2 x float]* %w, i32 %tmp867, i32 0 ; <float*> [#uses=1]
  %133 = load float* %scevgep40.i95.us410.us, align 4 ; <float> [#uses=4]
  %134 = load float* %scevgep41.i96.us411.us, align 4 ; <float> [#uses=3]
  %tmp.i110.us431.us = insertelement <4 x float> undef, float %133, i32 0 ; <<4 x float>> [#uses=1]
  %tmp8.i111.us432.us = insertelement <4 x float> %tmp.i110.us431.us, float %133, i32 1 ; <<4 x float>> [#uses=1]
  %tmp10.i112.us433.us = insertelement <4 x float> %tmp8.i111.us432.us, float %133, i32 2 ; <<4 x float>> [#uses=1]
  %tmp12.i113.us434.us = insertelement <4 x float> %tmp10.i112.us433.us, float %133, i32 3 ; <<4 x float>> [#uses=1]
  %135 = fsub float -0.000000e+00, %134           ; <float> [#uses=2]
  %tmp14.i114.us435.us = insertelement <4 x float> undef, float %135, i32 0 ; <<4 x float>> [#uses=1]
  %tmp17.i115.us436.us = insertelement <4 x float> %tmp14.i114.us435.us, float %134, i32 1 ; <<4 x float>> [#uses=1]
  %tmp19.i116.us437.us = insertelement <4 x float> %tmp17.i115.us436.us, float %135, i32 2 ; <<4 x float>> [#uses=1]
  %tmp21.i117.us438.us = insertelement <4 x float> %tmp19.i116.us437.us, float %134, i32 3 ; <<4 x float>> [#uses=1]
  br label %bb8.i139.us439.us

bb10.i141.loopexit.us463.us:                      ; preds = %bb8.i139.us439.us
  %136 = add nsw i32 %j.023.i92.us407.us, 1       ; <i32> [#uses=2]
  %exitcond884 = icmp eq i32 %136, %64            ; <i1> [#uses=1]
  br i1 %exitcond884, label %bb4, label %bb.i105.us406.us

bb8.i139.us439.us:                                ; preds = %bb8.i139.us439.us, %bb.i105.us406.us
  %indvar.i119.us440.us = phi i32 [ 0, %bb.i105.us406.us ], [ %indvar.next.i138.us461.us, %bb8.i139.us439.us ] ; <i32> [#uses=3]
  %tmp866 = shl i32 %indvar.i119.us440.us, 1      ; <i32> [#uses=4]
  %tmp870 = add i32 %tmp866, %tmp869              ; <i32> [#uses=1]
  %scevgep871 = getelementptr [2 x float]* %x, i32 %tmp870, i32 0 ; <float*> [#uses=1]
  %scevgep3536.i131.us454.us = bitcast float* %scevgep871 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp8661054 = add i32 %indvar.i119.us440.us, %tmp867 ; <i32> [#uses=1]
  %tmp873 = shl i32 %tmp8661054, 1                ; <i32> [#uses=1]
  %scevgep874 = getelementptr [2 x float]* %x, i32 %tmp873, i32 0 ; <float*> [#uses=1]
  %scevgep3334.i129.us451.us = bitcast float* %scevgep874 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp877 = add i32 %tmp866, %tmp876              ; <i32> [#uses=1]
  %scevgep878 = getelementptr [2 x float]* %y, i32 %tmp877, i32 0 ; <float*> [#uses=1]
  %scevgep2930.i125.us447.us = bitcast float* %scevgep878 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp880 = add i32 %tmp866, %tmp867              ; <i32> [#uses=1]
  %scevgep881 = getelementptr [2 x float]* %y, i32 %tmp880, i32 0 ; <float*> [#uses=1]
  %scevgep28.i123.us444.us = bitcast float* %scevgep881 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp37.i137.us460.us = add i32 %tmp866, 2       ; <i32> [#uses=1]
  %137 = load <4 x float>* %scevgep28.i123.us444.us, align 16 ; <<4 x float>> [#uses=2]
  %138 = load <4 x float>* %scevgep2930.i125.us447.us, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i4.i132.us455.us = fadd <4 x float> %137, %138 ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i4.i132.us455.us, <4 x float>* %scevgep3334.i129.us451.us, align 16
  %tmp.i3.i133.us456.us = fsub <4 x float> %137, %138 ; <<4 x float>> [#uses=2]
  %139 = shufflevector <4 x float> %tmp.i3.i133.us456.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i2.i134.us457.us = fmul <4 x float> %tmp12.i113.us434.us, %tmp.i3.i133.us456.us ; <<4 x float>> [#uses=1]
  %tmp.i1.i135.us458.us = fmul <4 x float> %tmp21.i117.us438.us, %139 ; <<4 x float>> [#uses=1]
  %tmp.i.i136.us459.us = fadd <4 x float> %tmp.i2.i134.us457.us, %tmp.i1.i135.us458.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i.i136.us459.us, <4 x float>* %scevgep3536.i131.us454.us, align 16
  %140 = icmp slt i32 %tmp37.i137.us460.us, %mj.0646 ; <i1> [#uses=1]
  %indvar.next.i138.us461.us = add i32 %indvar.i119.us440.us, 1 ; <i32> [#uses=1]
  br i1 %140, label %bb8.i139.us439.us, label %bb10.i141.loopexit.us463.us

bb3.i108.us427:                                   ; preds = %bb3.i108.us427, %bb.nph24.i91.split.split.us
  %j.023.i92.us407 = phi i32 [ %141, %bb3.i108.us427 ], [ 0, %bb.nph24.i91.split.split.us ] ; <i32> [#uses=1]
  %141 = add nsw i32 %j.023.i92.us407, 1          ; <i32> [#uses=2]
  %exitcond966 = icmp eq i32 %141, %64            ; <i1> [#uses=1]
  br i1 %exitcond966, label %bb4, label %bb3.i108.us427

bb.nph24.i91.split.split:                         ; preds = %bb.nph24.i91.split
  br i1 %67, label %bb.i105.us466, label %bb.i105

bb.i105.us466:                                    ; preds = %bb.i105.us466, %bb.nph24.i91.split.split
  %j.023.i92.us467 = phi i32 [ %168, %bb.i105.us466 ], [ 0, %bb.nph24.i91.split.split ] ; <i32> [#uses=2]
  %tmp951 = mul i32 %j.023.i92.us467, %mj.0646    ; <i32> [#uses=6]
  %tmp952 = add i32 %tmp951, 512                  ; <i32> [#uses=2]
  %scevgep45.i100.us477 = getelementptr [2 x float]* %y, i32 %tmp952, i32 1 ; <float*> [#uses=3]
  %scevgep44.i99.us475 = getelementptr [2 x float]* %y, i32 %tmp951, i32 1 ; <float*> [#uses=3]
  %scevgep43.i98.us474 = getelementptr [2 x float]* %y, i32 %tmp952, i32 0 ; <float*> [#uses=3]
  %scevgep42.i97.us472 = getelementptr [2 x float]* %y, i32 %tmp951, i32 0 ; <float*> [#uses=3]
  %scevgep41.i96.us471 = getelementptr [2 x float]* %w, i32 %tmp951, i32 1 ; <float*> [#uses=1]
  %scevgep40.i95.us470 = getelementptr [2 x float]* %w, i32 %tmp951, i32 0 ; <float*> [#uses=1]
  %tmp960 = shl i32 %tmp951, 1                    ; <i32> [#uses=3]
  %scevgep49.i104.us483 = getelementptr [2 x float]* %x, i32 %tmp960, i32 1 ; <float*> [#uses=1]
  %scevgep48.i103.us482 = getelementptr [2 x float]* %x, i32 %tmp960, i32 0 ; <float*> [#uses=1]
  %tmp963 = add i32 %mj.0646, %tmp960             ; <i32> [#uses=2]
  %scevgep47.i102.us481 = getelementptr [2 x float]* %x, i32 %tmp963, i32 1 ; <float*> [#uses=1]
  %scevgep46.i101.us479 = getelementptr [2 x float]* %x, i32 %tmp963, i32 0 ; <float*> [#uses=1]
  %142 = load float* %scevgep40.i95.us470, align 4 ; <float> [#uses=2]
  %143 = load float* %scevgep41.i96.us471, align 4 ; <float> [#uses=2]
  %144 = load float* %scevgep42.i97.us472, align 4 ; <float> [#uses=1]
  %145 = load float* %scevgep43.i98.us474, align 4 ; <float> [#uses=1]
  %146 = fsub float %144, %145                    ; <float> [#uses=1]
  %147 = fmul float %146, %142                    ; <float> [#uses=1]
  %148 = load float* %scevgep44.i99.us475, align 4 ; <float> [#uses=1]
  %149 = load float* %scevgep45.i100.us477, align 4 ; <float> [#uses=1]
  %150 = fsub float %148, %149                    ; <float> [#uses=1]
  %151 = fmul float %150, %143                    ; <float> [#uses=1]
  %152 = fsub float %147, %151                    ; <float> [#uses=1]
  store float %152, float* %scevgep46.i101.us479, align 4
  %153 = load float* %scevgep42.i97.us472, align 4 ; <float> [#uses=1]
  %154 = load float* %scevgep43.i98.us474, align 4 ; <float> [#uses=1]
  %155 = fsub float %153, %154                    ; <float> [#uses=1]
  %156 = fmul float %155, %143                    ; <float> [#uses=1]
  %157 = load float* %scevgep44.i99.us475, align 4 ; <float> [#uses=1]
  %158 = load float* %scevgep45.i100.us477, align 4 ; <float> [#uses=1]
  %159 = fsub float %157, %158                    ; <float> [#uses=1]
  %160 = fmul float %159, %142                    ; <float> [#uses=1]
  %161 = fadd float %156, %160                    ; <float> [#uses=1]
  store float %161, float* %scevgep47.i102.us481, align 4
  %162 = load float* %scevgep42.i97.us472, align 4 ; <float> [#uses=1]
  %163 = load float* %scevgep43.i98.us474, align 4 ; <float> [#uses=1]
  %164 = fadd float %162, %163                    ; <float> [#uses=1]
  store float %164, float* %scevgep48.i103.us482, align 4
  %165 = load float* %scevgep44.i99.us475, align 4 ; <float> [#uses=1]
  %166 = load float* %scevgep45.i100.us477, align 4 ; <float> [#uses=1]
  %167 = fadd float %165, %166                    ; <float> [#uses=1]
  store float %167, float* %scevgep49.i104.us483, align 4
  %168 = add nsw i32 %j.023.i92.us467, 1          ; <i32> [#uses=2]
  %exitcond950 = icmp eq i32 %168, %64            ; <i1> [#uses=1]
  br i1 %exitcond950, label %bb4, label %bb.i105.us466

bb.i105:                                          ; preds = %bb.i105, %bb.nph24.i91.split.split
  %j.023.i92 = phi i32 [ %195, %bb.i105 ], [ 0, %bb.nph24.i91.split.split ] ; <i32> [#uses=2]
  %tmp1033 = mul i32 %j.023.i92, %mj.0646         ; <i32> [#uses=6]
  %tmp1034 = add i32 %tmp1033, 512                ; <i32> [#uses=2]
  %scevgep45.i100 = getelementptr [2 x float]* %y, i32 %tmp1034, i32 1 ; <float*> [#uses=3]
  %scevgep43.i98 = getelementptr [2 x float]* %y, i32 %tmp1034, i32 0 ; <float*> [#uses=3]
  %scevgep44.i99 = getelementptr [2 x float]* %y, i32 %tmp1033, i32 1 ; <float*> [#uses=3]
  %scevgep42.i97 = getelementptr [2 x float]* %y, i32 %tmp1033, i32 0 ; <float*> [#uses=3]
  %scevgep41.i96 = getelementptr [2 x float]* %w, i32 %tmp1033, i32 1 ; <float*> [#uses=1]
  %scevgep40.i95 = getelementptr [2 x float]* %w, i32 %tmp1033, i32 0 ; <float*> [#uses=1]
  %tmp1042 = shl i32 %tmp1033, 1                  ; <i32> [#uses=3]
  %tmp1043 = add i32 %mj.0646, %tmp1042           ; <i32> [#uses=2]
  %scevgep47.i102 = getelementptr [2 x float]* %x, i32 %tmp1043, i32 1 ; <float*> [#uses=1]
  %scevgep46.i101 = getelementptr [2 x float]* %x, i32 %tmp1043, i32 0 ; <float*> [#uses=1]
  %scevgep49.i104 = getelementptr [2 x float]* %x, i32 %tmp1042, i32 1 ; <float*> [#uses=1]
  %scevgep48.i103 = getelementptr [2 x float]* %x, i32 %tmp1042, i32 0 ; <float*> [#uses=1]
  %169 = load float* %scevgep40.i95, align 4      ; <float> [#uses=2]
  %170 = load float* %scevgep41.i96, align 4      ; <float> [#uses=2]
  %171 = load float* %scevgep42.i97, align 4      ; <float> [#uses=1]
  %172 = load float* %scevgep43.i98, align 4      ; <float> [#uses=1]
  %173 = fsub float %171, %172                    ; <float> [#uses=1]
  %174 = fmul float %173, %169                    ; <float> [#uses=1]
  %175 = load float* %scevgep44.i99, align 4      ; <float> [#uses=1]
  %176 = load float* %scevgep45.i100, align 4     ; <float> [#uses=1]
  %177 = fsub float %175, %176                    ; <float> [#uses=1]
  %178 = fmul float %177, %170                    ; <float> [#uses=1]
  %179 = fsub float %174, %178                    ; <float> [#uses=1]
  store float %179, float* %scevgep46.i101, align 4
  %180 = load float* %scevgep42.i97, align 4      ; <float> [#uses=1]
  %181 = load float* %scevgep43.i98, align 4      ; <float> [#uses=1]
  %182 = fsub float %180, %181                    ; <float> [#uses=1]
  %183 = fmul float %182, %170                    ; <float> [#uses=1]
  %184 = load float* %scevgep44.i99, align 4      ; <float> [#uses=1]
  %185 = load float* %scevgep45.i100, align 4     ; <float> [#uses=1]
  %186 = fsub float %184, %185                    ; <float> [#uses=1]
  %187 = fmul float %186, %169                    ; <float> [#uses=1]
  %188 = fadd float %183, %187                    ; <float> [#uses=1]
  store float %188, float* %scevgep47.i102, align 4
  %189 = load float* %scevgep42.i97, align 4      ; <float> [#uses=1]
  %190 = load float* %scevgep43.i98, align 4      ; <float> [#uses=1]
  %191 = fadd float %189, %190                    ; <float> [#uses=1]
  store float %191, float* %scevgep48.i103, align 4
  %192 = load float* %scevgep44.i99, align 4      ; <float> [#uses=1]
  %193 = load float* %scevgep45.i100, align 4     ; <float> [#uses=1]
  %194 = fadd float %192, %193                    ; <float> [#uses=1]
  store float %194, float* %scevgep49.i104, align 4
  %195 = add nsw i32 %j.023.i92, 1                ; <i32> [#uses=2]
  %exitcond1032 = icmp eq i32 %195, %64           ; <i1> [#uses=1]
  br i1 %exitcond1032, label %bb4, label %bb.i105

bb3:                                              ; preds = %bb
  br i1 %65, label %bb.nph24.i38, label %bb4

bb.nph24.i38:                                     ; preds = %bb3
  %196 = icmp sgt i32 %mj.0646, 1                 ; <i1> [#uses=2]
  %197 = icmp sgt i32 %mj.0646, 0                 ; <i1> [#uses=4]
  br i1 %4, label %bb.nph24.i38.split.us, label %bb.nph24.i38.split

bb.nph24.i38.split.us:                            ; preds = %bb.nph24.i38
  br i1 %196, label %bb.nph24.i38.split.us.split.us, label %bb.nph24.i38.split.us.split

bb.nph24.i38.split.us.split.us:                   ; preds = %bb.nph24.i38.split.us
  br i1 %197, label %bb.i52.us.us.us, label %bb3.i55.us.us

bb.i52.us.us.us:                                  ; preds = %bb10.i88.loopexit.us.us.us, %bb.nph24.i38.split.us.split.us
  %j.023.i39.us.us.us = phi i32 [ %201, %bb10.i88.loopexit.us.us.us ], [ 0, %bb.nph24.i38.split.us.split.us ] ; <i32> [#uses=2]
  %tmp842 = mul i32 %j.023.i39.us.us.us, %mj.0646 ; <i32> [#uses=6]
  %tmp851 = add i32 %tmp842, 512                  ; <i32> [#uses=1]
  %tmp843 = shl i32 %tmp842, 1                    ; <i32> [#uses=1]
  %tmp844 = add i32 %mj.0646, %tmp843             ; <i32> [#uses=1]
  %scevgep41.i43.us.us.us = getelementptr [2 x float]* %w, i32 %tmp842, i32 1 ; <float*> [#uses=1]
  %scevgep40.i42.us.us.us = getelementptr [2 x float]* %w, i32 %tmp842, i32 0 ; <float*> [#uses=1]
  %198 = load float* %scevgep40.i42.us.us.us, align 4 ; <float> [#uses=4]
  %199 = load float* %scevgep41.i43.us.us.us, align 4 ; <float> [#uses=3]
  %200 = fsub float -0.000000e+00, %199           ; <float> [#uses=2]
  %tmp.i57.us.us.us = insertelement <4 x float> undef, float %198, i32 0 ; <<4 x float>> [#uses=1]
  %tmp8.i58.us.us.us = insertelement <4 x float> %tmp.i57.us.us.us, float %198, i32 1 ; <<4 x float>> [#uses=1]
  %tmp10.i59.us.us.us = insertelement <4 x float> %tmp8.i58.us.us.us, float %198, i32 2 ; <<4 x float>> [#uses=1]
  %tmp12.i60.us.us.us = insertelement <4 x float> %tmp10.i59.us.us.us, float %198, i32 3 ; <<4 x float>> [#uses=1]
  %tmp14.i61.us.us.us = insertelement <4 x float> undef, float %199, i32 0 ; <<4 x float>> [#uses=1]
  %tmp17.i62.us.us.us = insertelement <4 x float> %tmp14.i61.us.us.us, float %200, i32 1 ; <<4 x float>> [#uses=1]
  %tmp19.i63.us.us.us = insertelement <4 x float> %tmp17.i62.us.us.us, float %199, i32 2 ; <<4 x float>> [#uses=1]
  %tmp21.i64.us.us.us = insertelement <4 x float> %tmp19.i63.us.us.us, float %200, i32 3 ; <<4 x float>> [#uses=1]
  br label %bb8.i86.us.us.us

bb10.i88.loopexit.us.us.us:                       ; preds = %bb8.i86.us.us.us
  %201 = add nsw i32 %j.023.i39.us.us.us, 1       ; <i32> [#uses=2]
  %exitcond859 = icmp eq i32 %201, %64            ; <i1> [#uses=1]
  br i1 %exitcond859, label %bb4, label %bb.i52.us.us.us

bb8.i86.us.us.us:                                 ; preds = %bb8.i86.us.us.us, %bb.i52.us.us.us
  %indvar.i66.us.us.us = phi i32 [ 0, %bb.i52.us.us.us ], [ %indvar.next.i85.us.us.us, %bb8.i86.us.us.us ] ; <i32> [#uses=3]
  %tmp841 = shl i32 %indvar.i66.us.us.us, 1       ; <i32> [#uses=4]
  %tmp845 = add i32 %tmp841, %tmp844              ; <i32> [#uses=1]
  %scevgep846 = getelementptr [2 x float]* %y, i32 %tmp845, i32 0 ; <float*> [#uses=1]
  %scevgep3536.i78.us.us.us = bitcast float* %scevgep846 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp8411051 = add i32 %indvar.i66.us.us.us, %tmp842 ; <i32> [#uses=1]
  %tmp848 = shl i32 %tmp8411051, 1                ; <i32> [#uses=1]
  %scevgep849 = getelementptr [2 x float]* %y, i32 %tmp848, i32 0 ; <float*> [#uses=1]
  %scevgep3334.i76.us.us.us = bitcast float* %scevgep849 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp852 = add i32 %tmp841, %tmp851              ; <i32> [#uses=1]
  %scevgep853 = getelementptr [2 x float]* %x, i32 %tmp852, i32 0 ; <float*> [#uses=1]
  %scevgep2930.i72.us.us.us = bitcast float* %scevgep853 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp855 = add i32 %tmp841, %tmp842              ; <i32> [#uses=1]
  %scevgep856 = getelementptr [2 x float]* %x, i32 %tmp855, i32 0 ; <float*> [#uses=1]
  %scevgep28.i70.us.us.us = bitcast float* %scevgep856 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp37.i84.us.us.us = add i32 %tmp841, 2        ; <i32> [#uses=1]
  %202 = load <4 x float>* %scevgep28.i70.us.us.us, align 16 ; <<4 x float>> [#uses=2]
  %203 = load <4 x float>* %scevgep2930.i72.us.us.us, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i4.i79.us.us.us = fadd <4 x float> %202, %203 ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i4.i79.us.us.us, <4 x float>* %scevgep3334.i76.us.us.us, align 16
  %tmp.i3.i80.us.us.us = fsub <4 x float> %202, %203 ; <<4 x float>> [#uses=2]
  %204 = shufflevector <4 x float> %tmp.i3.i80.us.us.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i2.i81.us.us.us = fmul <4 x float> %tmp12.i60.us.us.us, %tmp.i3.i80.us.us.us ; <<4 x float>> [#uses=1]
  %tmp.i1.i82.us.us.us = fmul <4 x float> %tmp21.i64.us.us.us, %204 ; <<4 x float>> [#uses=1]
  %tmp.i.i83.us.us.us = fadd <4 x float> %tmp.i2.i81.us.us.us, %tmp.i1.i82.us.us.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i.i83.us.us.us, <4 x float>* %scevgep3536.i78.us.us.us, align 16
  %205 = icmp slt i32 %tmp37.i84.us.us.us, %mj.0646 ; <i1> [#uses=1]
  %indvar.next.i85.us.us.us = add i32 %indvar.i66.us.us.us, 1 ; <i32> [#uses=1]
  br i1 %205, label %bb8.i86.us.us.us, label %bb10.i88.loopexit.us.us.us

bb3.i55.us.us:                                    ; preds = %bb3.i55.us.us, %bb.nph24.i38.split.us.split.us
  %j.023.i39.us.us = phi i32 [ %206, %bb3.i55.us.us ], [ 0, %bb.nph24.i38.split.us.split.us ] ; <i32> [#uses=1]
  %206 = add nsw i32 %j.023.i39.us.us, 1          ; <i32> [#uses=2]
  %exitcond949 = icmp eq i32 %206, %64            ; <i1> [#uses=1]
  br i1 %exitcond949, label %bb4, label %bb3.i55.us.us

bb.nph24.i38.split.us.split:                      ; preds = %bb.nph24.i38.split.us
  br i1 %197, label %bb.i52.us.us526, label %bb.i52.us

bb.i52.us.us526:                                  ; preds = %bb.i52.us.us526, %bb.nph24.i38.split.us.split
  %j.023.i39.us.us527 = phi i32 [ %234, %bb.i52.us.us526 ], [ 0, %bb.nph24.i38.split.us.split ] ; <i32> [#uses=2]
  %tmp934 = mul i32 %j.023.i39.us.us527, %mj.0646 ; <i32> [#uses=6]
  %tmp935 = add i32 %tmp934, 512                  ; <i32> [#uses=2]
  %scevgep45.i47.us.us537 = getelementptr [2 x float]* %x, i32 %tmp935, i32 1 ; <float*> [#uses=3]
  %scevgep44.i46.us.us535 = getelementptr [2 x float]* %x, i32 %tmp934, i32 1 ; <float*> [#uses=3]
  %scevgep43.i45.us.us534 = getelementptr [2 x float]* %x, i32 %tmp935, i32 0 ; <float*> [#uses=3]
  %scevgep42.i44.us.us532 = getelementptr [2 x float]* %x, i32 %tmp934, i32 0 ; <float*> [#uses=3]
  %scevgep41.i43.us.us531 = getelementptr [2 x float]* %w, i32 %tmp934, i32 1 ; <float*> [#uses=1]
  %scevgep40.i42.us.us530 = getelementptr [2 x float]* %w, i32 %tmp934, i32 0 ; <float*> [#uses=1]
  %tmp943 = shl i32 %tmp934, 1                    ; <i32> [#uses=3]
  %scevgep49.i51.us.us543 = getelementptr [2 x float]* %y, i32 %tmp943, i32 1 ; <float*> [#uses=1]
  %scevgep48.i50.us.us542 = getelementptr [2 x float]* %y, i32 %tmp943, i32 0 ; <float*> [#uses=1]
  %tmp946 = add i32 %mj.0646, %tmp943             ; <i32> [#uses=2]
  %scevgep47.i49.us.us541 = getelementptr [2 x float]* %y, i32 %tmp946, i32 1 ; <float*> [#uses=1]
  %scevgep46.i48.us.us539 = getelementptr [2 x float]* %y, i32 %tmp946, i32 0 ; <float*> [#uses=1]
  %207 = load float* %scevgep40.i42.us.us530, align 4 ; <float> [#uses=2]
  %208 = load float* %scevgep41.i43.us.us531, align 4 ; <float> [#uses=1]
  %209 = fsub float -0.000000e+00, %208           ; <float> [#uses=2]
  %210 = load float* %scevgep42.i44.us.us532, align 4 ; <float> [#uses=1]
  %211 = load float* %scevgep43.i45.us.us534, align 4 ; <float> [#uses=1]
  %212 = fsub float %210, %211                    ; <float> [#uses=1]
  %213 = fmul float %212, %207                    ; <float> [#uses=1]
  %214 = load float* %scevgep44.i46.us.us535, align 4 ; <float> [#uses=1]
  %215 = load float* %scevgep45.i47.us.us537, align 4 ; <float> [#uses=1]
  %216 = fsub float %214, %215                    ; <float> [#uses=1]
  %217 = fmul float %216, %209                    ; <float> [#uses=1]
  %218 = fsub float %213, %217                    ; <float> [#uses=1]
  store float %218, float* %scevgep46.i48.us.us539, align 4
  %219 = load float* %scevgep42.i44.us.us532, align 4 ; <float> [#uses=1]
  %220 = load float* %scevgep43.i45.us.us534, align 4 ; <float> [#uses=1]
  %221 = fsub float %219, %220                    ; <float> [#uses=1]
  %222 = fmul float %221, %209                    ; <float> [#uses=1]
  %223 = load float* %scevgep44.i46.us.us535, align 4 ; <float> [#uses=1]
  %224 = load float* %scevgep45.i47.us.us537, align 4 ; <float> [#uses=1]
  %225 = fsub float %223, %224                    ; <float> [#uses=1]
  %226 = fmul float %225, %207                    ; <float> [#uses=1]
  %227 = fadd float %222, %226                    ; <float> [#uses=1]
  store float %227, float* %scevgep47.i49.us.us541, align 4
  %228 = load float* %scevgep42.i44.us.us532, align 4 ; <float> [#uses=1]
  %229 = load float* %scevgep43.i45.us.us534, align 4 ; <float> [#uses=1]
  %230 = fadd float %228, %229                    ; <float> [#uses=1]
  store float %230, float* %scevgep48.i50.us.us542, align 4
  %231 = load float* %scevgep44.i46.us.us535, align 4 ; <float> [#uses=1]
  %232 = load float* %scevgep45.i47.us.us537, align 4 ; <float> [#uses=1]
  %233 = fadd float %231, %232                    ; <float> [#uses=1]
  store float %233, float* %scevgep49.i51.us.us543, align 4
  %234 = add nsw i32 %j.023.i39.us.us527, 1       ; <i32> [#uses=2]
  %exitcond933 = icmp eq i32 %234, %64            ; <i1> [#uses=1]
  br i1 %exitcond933, label %bb4, label %bb.i52.us.us526

bb.i52.us:                                        ; preds = %bb.i52.us, %bb.nph24.i38.split.us.split
  %j.023.i39.us = phi i32 [ %262, %bb.i52.us ], [ 0, %bb.nph24.i38.split.us.split ] ; <i32> [#uses=2]
  %tmp1001 = mul i32 %j.023.i39.us, %mj.0646      ; <i32> [#uses=6]
  %tmp1002 = add i32 %tmp1001, 512                ; <i32> [#uses=2]
  %scevgep45.i47.us = getelementptr [2 x float]* %x, i32 %tmp1002, i32 1 ; <float*> [#uses=3]
  %scevgep44.i46.us = getelementptr [2 x float]* %x, i32 %tmp1001, i32 1 ; <float*> [#uses=3]
  %scevgep43.i45.us = getelementptr [2 x float]* %x, i32 %tmp1002, i32 0 ; <float*> [#uses=3]
  %scevgep42.i44.us = getelementptr [2 x float]* %x, i32 %tmp1001, i32 0 ; <float*> [#uses=3]
  %scevgep41.i43.us = getelementptr [2 x float]* %w, i32 %tmp1001, i32 1 ; <float*> [#uses=1]
  %scevgep40.i42.us = getelementptr [2 x float]* %w, i32 %tmp1001, i32 0 ; <float*> [#uses=1]
  %tmp1010 = shl i32 %tmp1001, 1                  ; <i32> [#uses=3]
  %scevgep49.i51.us = getelementptr [2 x float]* %y, i32 %tmp1010, i32 1 ; <float*> [#uses=1]
  %scevgep48.i50.us = getelementptr [2 x float]* %y, i32 %tmp1010, i32 0 ; <float*> [#uses=1]
  %tmp1013 = add i32 %mj.0646, %tmp1010           ; <i32> [#uses=2]
  %scevgep47.i49.us = getelementptr [2 x float]* %y, i32 %tmp1013, i32 1 ; <float*> [#uses=1]
  %scevgep46.i48.us = getelementptr [2 x float]* %y, i32 %tmp1013, i32 0 ; <float*> [#uses=1]
  %235 = load float* %scevgep40.i42.us, align 4   ; <float> [#uses=2]
  %236 = load float* %scevgep41.i43.us, align 4   ; <float> [#uses=1]
  %237 = fsub float -0.000000e+00, %236           ; <float> [#uses=2]
  %238 = load float* %scevgep42.i44.us, align 4   ; <float> [#uses=1]
  %239 = load float* %scevgep43.i45.us, align 4   ; <float> [#uses=1]
  %240 = fsub float %238, %239                    ; <float> [#uses=1]
  %241 = fmul float %240, %235                    ; <float> [#uses=1]
  %242 = load float* %scevgep44.i46.us, align 4   ; <float> [#uses=1]
  %243 = load float* %scevgep45.i47.us, align 4   ; <float> [#uses=1]
  %244 = fsub float %242, %243                    ; <float> [#uses=1]
  %245 = fmul float %244, %237                    ; <float> [#uses=1]
  %246 = fsub float %241, %245                    ; <float> [#uses=1]
  store float %246, float* %scevgep46.i48.us, align 4
  %247 = load float* %scevgep42.i44.us, align 4   ; <float> [#uses=1]
  %248 = load float* %scevgep43.i45.us, align 4   ; <float> [#uses=1]
  %249 = fsub float %247, %248                    ; <float> [#uses=1]
  %250 = fmul float %249, %237                    ; <float> [#uses=1]
  %251 = load float* %scevgep44.i46.us, align 4   ; <float> [#uses=1]
  %252 = load float* %scevgep45.i47.us, align 4   ; <float> [#uses=1]
  %253 = fsub float %251, %252                    ; <float> [#uses=1]
  %254 = fmul float %253, %235                    ; <float> [#uses=1]
  %255 = fadd float %250, %254                    ; <float> [#uses=1]
  store float %255, float* %scevgep47.i49.us, align 4
  %256 = load float* %scevgep42.i44.us, align 4   ; <float> [#uses=1]
  %257 = load float* %scevgep43.i45.us, align 4   ; <float> [#uses=1]
  %258 = fadd float %256, %257                    ; <float> [#uses=1]
  store float %258, float* %scevgep48.i50.us, align 4
  %259 = load float* %scevgep44.i46.us, align 4   ; <float> [#uses=1]
  %260 = load float* %scevgep45.i47.us, align 4   ; <float> [#uses=1]
  %261 = fadd float %259, %260                    ; <float> [#uses=1]
  store float %261, float* %scevgep49.i51.us, align 4
  %262 = add nsw i32 %j.023.i39.us, 1             ; <i32> [#uses=2]
  %exitcond1000 = icmp eq i32 %262, %64           ; <i1> [#uses=1]
  br i1 %exitcond1000, label %bb4, label %bb.i52.us

bb.nph24.i38.split:                               ; preds = %bb.nph24.i38
  br i1 %196, label %bb.nph24.i38.split.split.us, label %bb.nph24.i38.split.split

bb.nph24.i38.split.split.us:                      ; preds = %bb.nph24.i38.split
  br i1 %197, label %bb.i52.us286.us, label %bb3.i55.us307

bb.i52.us286.us:                                  ; preds = %bb10.i88.loopexit.us343.us, %bb.nph24.i38.split.split.us
  %j.023.i39.us287.us = phi i32 [ %266, %bb10.i88.loopexit.us343.us ], [ 0, %bb.nph24.i38.split.split.us ] ; <i32> [#uses=2]
  %tmp909 = mul i32 %j.023.i39.us287.us, %mj.0646 ; <i32> [#uses=6]
  %tmp918 = add i32 %tmp909, 512                  ; <i32> [#uses=1]
  %tmp910 = shl i32 %tmp909, 1                    ; <i32> [#uses=1]
  %tmp911 = add i32 %mj.0646, %tmp910             ; <i32> [#uses=1]
  %scevgep41.i43.us291.us = getelementptr [2 x float]* %w, i32 %tmp909, i32 1 ; <float*> [#uses=1]
  %scevgep40.i42.us290.us = getelementptr [2 x float]* %w, i32 %tmp909, i32 0 ; <float*> [#uses=1]
  %263 = load float* %scevgep40.i42.us290.us, align 4 ; <float> [#uses=4]
  %264 = load float* %scevgep41.i43.us291.us, align 4 ; <float> [#uses=3]
  %tmp.i57.us311.us = insertelement <4 x float> undef, float %263, i32 0 ; <<4 x float>> [#uses=1]
  %tmp8.i58.us312.us = insertelement <4 x float> %tmp.i57.us311.us, float %263, i32 1 ; <<4 x float>> [#uses=1]
  %tmp10.i59.us313.us = insertelement <4 x float> %tmp8.i58.us312.us, float %263, i32 2 ; <<4 x float>> [#uses=1]
  %tmp12.i60.us314.us = insertelement <4 x float> %tmp10.i59.us313.us, float %263, i32 3 ; <<4 x float>> [#uses=1]
  %265 = fsub float -0.000000e+00, %264           ; <float> [#uses=2]
  %tmp14.i61.us315.us = insertelement <4 x float> undef, float %265, i32 0 ; <<4 x float>> [#uses=1]
  %tmp17.i62.us316.us = insertelement <4 x float> %tmp14.i61.us315.us, float %264, i32 1 ; <<4 x float>> [#uses=1]
  %tmp19.i63.us317.us = insertelement <4 x float> %tmp17.i62.us316.us, float %265, i32 2 ; <<4 x float>> [#uses=1]
  %tmp21.i64.us318.us = insertelement <4 x float> %tmp19.i63.us317.us, float %264, i32 3 ; <<4 x float>> [#uses=1]
  br label %bb8.i86.us319.us

bb10.i88.loopexit.us343.us:                       ; preds = %bb8.i86.us319.us
  %266 = add nsw i32 %j.023.i39.us287.us, 1       ; <i32> [#uses=2]
  %exitcond926 = icmp eq i32 %266, %64            ; <i1> [#uses=1]
  br i1 %exitcond926, label %bb4, label %bb.i52.us286.us

bb8.i86.us319.us:                                 ; preds = %bb8.i86.us319.us, %bb.i52.us286.us
  %indvar.i66.us320.us = phi i32 [ 0, %bb.i52.us286.us ], [ %indvar.next.i85.us341.us, %bb8.i86.us319.us ] ; <i32> [#uses=3]
  %tmp908 = shl i32 %indvar.i66.us320.us, 1       ; <i32> [#uses=4]
  %tmp912 = add i32 %tmp908, %tmp911              ; <i32> [#uses=1]
  %scevgep913 = getelementptr [2 x float]* %y, i32 %tmp912, i32 0 ; <float*> [#uses=1]
  %scevgep3536.i78.us334.us = bitcast float* %scevgep913 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp9081052 = add i32 %indvar.i66.us320.us, %tmp909 ; <i32> [#uses=1]
  %tmp915 = shl i32 %tmp9081052, 1                ; <i32> [#uses=1]
  %scevgep916 = getelementptr [2 x float]* %y, i32 %tmp915, i32 0 ; <float*> [#uses=1]
  %scevgep3334.i76.us331.us = bitcast float* %scevgep916 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp919 = add i32 %tmp908, %tmp918              ; <i32> [#uses=1]
  %scevgep920 = getelementptr [2 x float]* %x, i32 %tmp919, i32 0 ; <float*> [#uses=1]
  %scevgep2930.i72.us327.us = bitcast float* %scevgep920 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp922 = add i32 %tmp908, %tmp909              ; <i32> [#uses=1]
  %scevgep923 = getelementptr [2 x float]* %x, i32 %tmp922, i32 0 ; <float*> [#uses=1]
  %scevgep28.i70.us324.us = bitcast float* %scevgep923 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp37.i84.us340.us = add i32 %tmp908, 2        ; <i32> [#uses=1]
  %267 = load <4 x float>* %scevgep28.i70.us324.us, align 16 ; <<4 x float>> [#uses=2]
  %268 = load <4 x float>* %scevgep2930.i72.us327.us, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i4.i79.us335.us = fadd <4 x float> %267, %268 ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i4.i79.us335.us, <4 x float>* %scevgep3334.i76.us331.us, align 16
  %tmp.i3.i80.us336.us = fsub <4 x float> %267, %268 ; <<4 x float>> [#uses=2]
  %269 = shufflevector <4 x float> %tmp.i3.i80.us336.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i2.i81.us337.us = fmul <4 x float> %tmp12.i60.us314.us, %tmp.i3.i80.us336.us ; <<4 x float>> [#uses=1]
  %tmp.i1.i82.us338.us = fmul <4 x float> %tmp21.i64.us318.us, %269 ; <<4 x float>> [#uses=1]
  %tmp.i.i83.us339.us = fadd <4 x float> %tmp.i2.i81.us337.us, %tmp.i1.i82.us338.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i.i83.us339.us, <4 x float>* %scevgep3536.i78.us334.us, align 16
  %270 = icmp slt i32 %tmp37.i84.us340.us, %mj.0646 ; <i1> [#uses=1]
  %indvar.next.i85.us341.us = add i32 %indvar.i66.us320.us, 1 ; <i32> [#uses=1]
  br i1 %270, label %bb8.i86.us319.us, label %bb10.i88.loopexit.us343.us

bb3.i55.us307:                                    ; preds = %bb3.i55.us307, %bb.nph24.i38.split.split.us
  %j.023.i39.us287 = phi i32 [ %271, %bb3.i55.us307 ], [ 0, %bb.nph24.i38.split.split.us ] ; <i32> [#uses=1]
  %271 = add nsw i32 %j.023.i39.us287, 1          ; <i32> [#uses=2]
  %exitcond999 = icmp eq i32 %271, %64            ; <i1> [#uses=1]
  br i1 %exitcond999, label %bb4, label %bb3.i55.us307

bb.nph24.i38.split.split:                         ; preds = %bb.nph24.i38.split
  br i1 %197, label %bb.i52.us346, label %bb.i52

bb.i52.us346:                                     ; preds = %bb.i52.us346, %bb.nph24.i38.split.split
  %j.023.i39.us347 = phi i32 [ %298, %bb.i52.us346 ], [ 0, %bb.nph24.i38.split.split ] ; <i32> [#uses=2]
  %tmp984 = mul i32 %j.023.i39.us347, %mj.0646    ; <i32> [#uses=6]
  %tmp985 = add i32 %tmp984, 512                  ; <i32> [#uses=2]
  %scevgep45.i47.us357 = getelementptr [2 x float]* %x, i32 %tmp985, i32 1 ; <float*> [#uses=3]
  %scevgep44.i46.us355 = getelementptr [2 x float]* %x, i32 %tmp984, i32 1 ; <float*> [#uses=3]
  %scevgep43.i45.us354 = getelementptr [2 x float]* %x, i32 %tmp985, i32 0 ; <float*> [#uses=3]
  %scevgep42.i44.us352 = getelementptr [2 x float]* %x, i32 %tmp984, i32 0 ; <float*> [#uses=3]
  %scevgep41.i43.us351 = getelementptr [2 x float]* %w, i32 %tmp984, i32 1 ; <float*> [#uses=1]
  %scevgep40.i42.us350 = getelementptr [2 x float]* %w, i32 %tmp984, i32 0 ; <float*> [#uses=1]
  %tmp993 = shl i32 %tmp984, 1                    ; <i32> [#uses=3]
  %scevgep49.i51.us363 = getelementptr [2 x float]* %y, i32 %tmp993, i32 1 ; <float*> [#uses=1]
  %scevgep48.i50.us362 = getelementptr [2 x float]* %y, i32 %tmp993, i32 0 ; <float*> [#uses=1]
  %tmp996 = add i32 %mj.0646, %tmp993             ; <i32> [#uses=2]
  %scevgep47.i49.us361 = getelementptr [2 x float]* %y, i32 %tmp996, i32 1 ; <float*> [#uses=1]
  %scevgep46.i48.us359 = getelementptr [2 x float]* %y, i32 %tmp996, i32 0 ; <float*> [#uses=1]
  %272 = load float* %scevgep40.i42.us350, align 4 ; <float> [#uses=2]
  %273 = load float* %scevgep41.i43.us351, align 4 ; <float> [#uses=2]
  %274 = load float* %scevgep42.i44.us352, align 4 ; <float> [#uses=1]
  %275 = load float* %scevgep43.i45.us354, align 4 ; <float> [#uses=1]
  %276 = fsub float %274, %275                    ; <float> [#uses=1]
  %277 = fmul float %276, %272                    ; <float> [#uses=1]
  %278 = load float* %scevgep44.i46.us355, align 4 ; <float> [#uses=1]
  %279 = load float* %scevgep45.i47.us357, align 4 ; <float> [#uses=1]
  %280 = fsub float %278, %279                    ; <float> [#uses=1]
  %281 = fmul float %280, %273                    ; <float> [#uses=1]
  %282 = fsub float %277, %281                    ; <float> [#uses=1]
  store float %282, float* %scevgep46.i48.us359, align 4
  %283 = load float* %scevgep42.i44.us352, align 4 ; <float> [#uses=1]
  %284 = load float* %scevgep43.i45.us354, align 4 ; <float> [#uses=1]
  %285 = fsub float %283, %284                    ; <float> [#uses=1]
  %286 = fmul float %285, %273                    ; <float> [#uses=1]
  %287 = load float* %scevgep44.i46.us355, align 4 ; <float> [#uses=1]
  %288 = load float* %scevgep45.i47.us357, align 4 ; <float> [#uses=1]
  %289 = fsub float %287, %288                    ; <float> [#uses=1]
  %290 = fmul float %289, %272                    ; <float> [#uses=1]
  %291 = fadd float %286, %290                    ; <float> [#uses=1]
  store float %291, float* %scevgep47.i49.us361, align 4
  %292 = load float* %scevgep42.i44.us352, align 4 ; <float> [#uses=1]
  %293 = load float* %scevgep43.i45.us354, align 4 ; <float> [#uses=1]
  %294 = fadd float %292, %293                    ; <float> [#uses=1]
  store float %294, float* %scevgep48.i50.us362, align 4
  %295 = load float* %scevgep44.i46.us355, align 4 ; <float> [#uses=1]
  %296 = load float* %scevgep45.i47.us357, align 4 ; <float> [#uses=1]
  %297 = fadd float %295, %296                    ; <float> [#uses=1]
  store float %297, float* %scevgep49.i51.us363, align 4
  %298 = add nsw i32 %j.023.i39.us347, 1          ; <i32> [#uses=2]
  %exitcond983 = icmp eq i32 %298, %64            ; <i1> [#uses=1]
  br i1 %exitcond983, label %bb4, label %bb.i52.us346

bb.i52:                                           ; preds = %bb.i52, %bb.nph24.i38.split.split
  %j.023.i39 = phi i32 [ %325, %bb.i52 ], [ 0, %bb.nph24.i38.split.split ] ; <i32> [#uses=2]
  %tmp1017 = mul i32 %j.023.i39, %mj.0646         ; <i32> [#uses=6]
  %tmp1018 = add i32 %tmp1017, 512                ; <i32> [#uses=2]
  %scevgep45.i47 = getelementptr [2 x float]* %x, i32 %tmp1018, i32 1 ; <float*> [#uses=3]
  %scevgep43.i45 = getelementptr [2 x float]* %x, i32 %tmp1018, i32 0 ; <float*> [#uses=3]
  %scevgep44.i46 = getelementptr [2 x float]* %x, i32 %tmp1017, i32 1 ; <float*> [#uses=3]
  %scevgep42.i44 = getelementptr [2 x float]* %x, i32 %tmp1017, i32 0 ; <float*> [#uses=3]
  %scevgep41.i43 = getelementptr [2 x float]* %w, i32 %tmp1017, i32 1 ; <float*> [#uses=1]
  %scevgep40.i42 = getelementptr [2 x float]* %w, i32 %tmp1017, i32 0 ; <float*> [#uses=1]
  %tmp1026 = shl i32 %tmp1017, 1                  ; <i32> [#uses=3]
  %tmp1027 = add i32 %mj.0646, %tmp1026           ; <i32> [#uses=2]
  %scevgep47.i49 = getelementptr [2 x float]* %y, i32 %tmp1027, i32 1 ; <float*> [#uses=1]
  %scevgep46.i48 = getelementptr [2 x float]* %y, i32 %tmp1027, i32 0 ; <float*> [#uses=1]
  %scevgep49.i51 = getelementptr [2 x float]* %y, i32 %tmp1026, i32 1 ; <float*> [#uses=1]
  %scevgep48.i50 = getelementptr [2 x float]* %y, i32 %tmp1026, i32 0 ; <float*> [#uses=1]
  %299 = load float* %scevgep40.i42, align 4      ; <float> [#uses=2]
  %300 = load float* %scevgep41.i43, align 4      ; <float> [#uses=2]
  %301 = load float* %scevgep42.i44, align 4      ; <float> [#uses=1]
  %302 = load float* %scevgep43.i45, align 4      ; <float> [#uses=1]
  %303 = fsub float %301, %302                    ; <float> [#uses=1]
  %304 = fmul float %303, %299                    ; <float> [#uses=1]
  %305 = load float* %scevgep44.i46, align 4      ; <float> [#uses=1]
  %306 = load float* %scevgep45.i47, align 4      ; <float> [#uses=1]
  %307 = fsub float %305, %306                    ; <float> [#uses=1]
  %308 = fmul float %307, %300                    ; <float> [#uses=1]
  %309 = fsub float %304, %308                    ; <float> [#uses=1]
  store float %309, float* %scevgep46.i48, align 4
  %310 = load float* %scevgep42.i44, align 4      ; <float> [#uses=1]
  %311 = load float* %scevgep43.i45, align 4      ; <float> [#uses=1]
  %312 = fsub float %310, %311                    ; <float> [#uses=1]
  %313 = fmul float %312, %300                    ; <float> [#uses=1]
  %314 = load float* %scevgep44.i46, align 4      ; <float> [#uses=1]
  %315 = load float* %scevgep45.i47, align 4      ; <float> [#uses=1]
  %316 = fsub float %314, %315                    ; <float> [#uses=1]
  %317 = fmul float %316, %299                    ; <float> [#uses=1]
  %318 = fadd float %313, %317                    ; <float> [#uses=1]
  store float %318, float* %scevgep47.i49, align 4
  %319 = load float* %scevgep42.i44, align 4      ; <float> [#uses=1]
  %320 = load float* %scevgep43.i45, align 4      ; <float> [#uses=1]
  %321 = fadd float %319, %320                    ; <float> [#uses=1]
  store float %321, float* %scevgep48.i50, align 4
  %322 = load float* %scevgep44.i46, align 4      ; <float> [#uses=1]
  %323 = load float* %scevgep45.i47, align 4      ; <float> [#uses=1]
  %324 = fadd float %322, %323                    ; <float> [#uses=1]
  store float %324, float* %scevgep49.i51, align 4
  %325 = add nsw i32 %j.023.i39, 1                ; <i32> [#uses=2]
  %exitcond1016 = icmp eq i32 %325, %64           ; <i1> [#uses=1]
  br i1 %exitcond1016, label %bb4, label %bb.i52

bb4:                                              ; preds = %bb.i52, %bb.i52.us346, %bb3.i55.us307, %bb10.i88.loopexit.us343.us, %bb.i52.us, %bb.i52.us.us526, %bb3.i55.us.us, %bb10.i88.loopexit.us.us.us, %bb3, %bb.i105, %bb.i105.us466, %bb3.i108.us427, %bb10.i141.loopexit.us463.us, %bb.i105.us, %bb.i105.us.us586, %bb3.i108.us.us, %bb10.i141.loopexit.us.us.us, %bb2
  %tgle.0 = phi i1 [ true, %bb2 ], [ false, %bb3 ], [ true, %bb10.i141.loopexit.us.us.us ], [ true, %bb3.i108.us.us ], [ true, %bb.i105.us.us586 ], [ true, %bb.i105.us ], [ true, %bb10.i141.loopexit.us463.us ], [ true, %bb3.i108.us427 ], [ true, %bb.i105.us466 ], [ true, %bb.i105 ], [ false, %bb10.i88.loopexit.us.us.us ], [ false, %bb3.i55.us.us ], [ false, %bb.i52.us.us526 ], [ false, %bb.i52.us ], [ false, %bb10.i88.loopexit.us343.us ], [ false, %bb3.i55.us307 ], [ false, %bb.i52.us346 ], [ false, %bb.i52 ] ; <i1> [#uses=2]
  %326 = add nsw i32 %j.0647, 1                   ; <i32> [#uses=2]
  %exitcond1049 = icmp eq i32 %326, %60           ; <i1> [#uses=1]
  br i1 %exitcond1049, label %bb6, label %bb

bb6:                                              ; preds = %bb4
  br i1 %tgle.0, label %bb.nph24.i14, label %bb.i36

bb.i36:                                           ; preds = %bb.i36, %bb6, %bb5.preheader
  %i.01.i = phi i32 [ %329, %bb.i36 ], [ 0, %bb5.preheader ], [ 0, %bb6 ] ; <i32> [#uses=5]
  %scevgep4.i = getelementptr [2 x float]* %y, i32 %i.01.i, i32 0 ; <float*> [#uses=1]
  %scevgep3.i = getelementptr [2 x float]* %x, i32 %i.01.i, i32 0 ; <float*> [#uses=1]
  %scevgep2.i = getelementptr [2 x float]* %y, i32 %i.01.i, i32 1 ; <float*> [#uses=1]
  %scevgep.i34 = getelementptr [2 x float]* %x, i32 %i.01.i, i32 1 ; <float*> [#uses=1]
  %327 = load float* %scevgep4.i, align 4         ; <float> [#uses=1]
  store float %327, float* %scevgep3.i, align 4
  %328 = load float* %scevgep2.i, align 4         ; <float> [#uses=1]
  store float %328, float* %scevgep.i34, align 4
  %329 = add nsw i32 %i.01.i, 1                   ; <i32> [#uses=2]
  %exitcond811 = icmp eq i32 %329, 1024           ; <i1> [#uses=1]
  br i1 %exitcond811, label %bb.nph24.i14, label %bb.i36

bb.nph24.i14:                                     ; preds = %bb.i36, %bb6
  %scevgep41.i19.us = getelementptr [2 x float]* %w, i32 0, i32 1 ; <float*> [#uses=1]
  %scevgep40.i18.us = getelementptr [2 x float]* %w, i32 0, i32 0 ; <float*> [#uses=1]
  %330 = load float* %scevgep40.i18.us, align 4   ; <float> [#uses=8]
  %331 = load float* %scevgep41.i19.us, align 4   ; <float> [#uses=6]
  br i1 %4, label %bb.i28.us, label %bb.i28

bb.i28.us:                                        ; preds = %bb.nph24.i14
  %332 = fsub float -0.000000e+00, %331           ; <float> [#uses=2]
  %tmp.i.us = insertelement <4 x float> undef, float %330, i32 0 ; <<4 x float>> [#uses=1]
  %tmp8.i.us = insertelement <4 x float> %tmp.i.us, float %330, i32 1 ; <<4 x float>> [#uses=1]
  %tmp10.i.us = insertelement <4 x float> %tmp8.i.us, float %330, i32 2 ; <<4 x float>> [#uses=1]
  %tmp12.i.us = insertelement <4 x float> %tmp10.i.us, float %330, i32 3 ; <<4 x float>> [#uses=1]
  %tmp14.i.us = insertelement <4 x float> undef, float %331, i32 0 ; <<4 x float>> [#uses=1]
  %tmp17.i.us = insertelement <4 x float> %tmp14.i.us, float %332, i32 1 ; <<4 x float>> [#uses=1]
  %tmp19.i.us = insertelement <4 x float> %tmp17.i.us, float %331, i32 2 ; <<4 x float>> [#uses=1]
  %tmp21.i.us = insertelement <4 x float> %tmp19.i.us, float %332, i32 3 ; <<4 x float>> [#uses=1]
  br label %bb8.i.us

bb8.i.us:                                         ; preds = %bb8.i.us, %bb.i28.us
  %indvar.i.us = phi i32 [ 0, %bb.i28.us ], [ %indvar.next.i.us, %bb8.i.us ] ; <i32> [#uses=2]
  %tmp734 = shl i32 %indvar.i.us, 1               ; <i32> [#uses=4]
  %tmp738 = add i32 %tmp734, 512                  ; <i32> [#uses=2]
  %scevgep = getelementptr [2 x float]* %y, i32 %tmp738, i32 0 ; <float*> [#uses=1]
  %scevgep3536.i.us = bitcast float* %scevgep to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep741 = getelementptr [2 x float]* %y, i32 %tmp734, i32 0 ; <float*> [#uses=1]
  %scevgep3334.i.us = bitcast float* %scevgep741 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep745 = getelementptr [2 x float]* %x, i32 %tmp738, i32 0 ; <float*> [#uses=1]
  %scevgep2930.i.us = bitcast float* %scevgep745 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep748 = getelementptr [2 x float]* %x, i32 %tmp734, i32 0 ; <float*> [#uses=1]
  %scevgep28.i.us = bitcast float* %scevgep748 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp37.i.us = add i32 %tmp734, 2                ; <i32> [#uses=1]
  %333 = load <4 x float>* %scevgep28.i.us, align 16 ; <<4 x float>> [#uses=2]
  %334 = load <4 x float>* %scevgep2930.i.us, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i4.i.us = fadd <4 x float> %333, %334      ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i4.i.us, <4 x float>* %scevgep3334.i.us, align 16
  %tmp.i3.i.us = fsub <4 x float> %333, %334      ; <<4 x float>> [#uses=2]
  %335 = shufflevector <4 x float> %tmp.i3.i.us, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i2.i.us = fmul <4 x float> %tmp12.i.us, %tmp.i3.i.us ; <<4 x float>> [#uses=1]
  %tmp.i1.i.us = fmul <4 x float> %tmp21.i.us, %335 ; <<4 x float>> [#uses=1]
  %tmp.i.i.us = fadd <4 x float> %tmp.i2.i.us, %tmp.i1.i.us ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i.i.us, <4 x float>* %scevgep3536.i.us, align 16
  %336 = icmp slt i32 %tmp37.i.us, 512            ; <i1> [#uses=1]
  %indvar.next.i.us = add i32 %indvar.i.us, 1     ; <i32> [#uses=1]
  br i1 %336, label %bb8.i.us, label %step.exit33

bb.i28:                                           ; preds = %bb.nph24.i14
  %tmp.i = insertelement <4 x float> undef, float %330, i32 0 ; <<4 x float>> [#uses=1]
  %tmp8.i = insertelement <4 x float> %tmp.i, float %330, i32 1 ; <<4 x float>> [#uses=1]
  %tmp10.i = insertelement <4 x float> %tmp8.i, float %330, i32 2 ; <<4 x float>> [#uses=1]
  %tmp12.i = insertelement <4 x float> %tmp10.i, float %330, i32 3 ; <<4 x float>> [#uses=1]
  %337 = fsub float -0.000000e+00, %331           ; <float> [#uses=2]
  %tmp14.i = insertelement <4 x float> undef, float %337, i32 0 ; <<4 x float>> [#uses=1]
  %tmp17.i = insertelement <4 x float> %tmp14.i, float %331, i32 1 ; <<4 x float>> [#uses=1]
  %tmp19.i = insertelement <4 x float> %tmp17.i, float %337, i32 2 ; <<4 x float>> [#uses=1]
  %tmp21.i = insertelement <4 x float> %tmp19.i, float %331, i32 3 ; <<4 x float>> [#uses=1]
  br label %bb8.i

bb8.i:                                            ; preds = %bb8.i, %bb.i28
  %indvar.i = phi i32 [ 0, %bb.i28 ], [ %indvar.next.i, %bb8.i ] ; <i32> [#uses=2]
  %tmp786 = shl i32 %indvar.i, 1                  ; <i32> [#uses=4]
  %tmp790 = add i32 %tmp786, 512                  ; <i32> [#uses=2]
  %scevgep791 = getelementptr [2 x float]* %y, i32 %tmp790, i32 0 ; <float*> [#uses=1]
  %scevgep3536.i = bitcast float* %scevgep791 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep794 = getelementptr [2 x float]* %y, i32 %tmp786, i32 0 ; <float*> [#uses=1]
  %scevgep3334.i = bitcast float* %scevgep794 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep798 = getelementptr [2 x float]* %x, i32 %tmp790, i32 0 ; <float*> [#uses=1]
  %scevgep2930.i = bitcast float* %scevgep798 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %scevgep801 = getelementptr [2 x float]* %x, i32 %tmp786, i32 0 ; <float*> [#uses=1]
  %scevgep28.i = bitcast float* %scevgep801 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %tmp37.i = add i32 %tmp786, 2                   ; <i32> [#uses=1]
  %338 = load <4 x float>* %scevgep28.i, align 16 ; <<4 x float>> [#uses=2]
  %339 = load <4 x float>* %scevgep2930.i, align 16 ; <<4 x float>> [#uses=2]
  %tmp.i4.i = fadd <4 x float> %338, %339         ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i4.i, <4 x float>* %scevgep3334.i, align 16
  %tmp.i3.i = fsub <4 x float> %338, %339         ; <<4 x float>> [#uses=2]
  %340 = shufflevector <4 x float> %tmp.i3.i, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2> ; <<4 x float>> [#uses=1]
  %tmp.i2.i = fmul <4 x float> %tmp12.i, %tmp.i3.i ; <<4 x float>> [#uses=1]
  %tmp.i1.i = fmul <4 x float> %tmp21.i, %340     ; <<4 x float>> [#uses=1]
  %tmp.i.i = fadd <4 x float> %tmp.i2.i, %tmp.i1.i ; <<4 x float>> [#uses=1]
  store <4 x float> %tmp.i.i, <4 x float>* %scevgep3536.i, align 16
  %341 = icmp slt i32 %tmp37.i, 512               ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %341, label %bb8.i, label %step.exit33

step.exit33:                                      ; preds = %bb8.i, %bb8.i.us
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
  %error.024 = phi float [ 0.000000e+00, %bb8 ], [ %36, %bb9 ] ; <float> [#uses=1]
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
  %36 = fadd float %35, %error.024                ; <float> [#uses=2]
  %indvar.next74 = add i32 %indvar73, 1           ; <i32> [#uses=2]
  %exitcond75 = icmp eq i32 %indvar.next74, 1024  ; <i1> [#uses=1]
  br i1 %exitcond75, label %bb10.bb11_crit_edge, label %bb9

bb10.bb11_crit_edge:                              ; preds = %bb9
  %phitmp37 = fmul float %36, 9.765625e-04        ; <float> [#uses=1]
  %37 = tail call float @llvm.sqrt.f32(float %phitmp37) ; <float> [#uses=1]
  %38 = fpext float %37 to double                 ; <double> [#uses=1]
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

declare float @llvm.sqrt.f32(float) nounwind readonly

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32) nounwind
