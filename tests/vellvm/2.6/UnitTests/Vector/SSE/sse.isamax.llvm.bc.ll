; ModuleID = 'sse.isamax.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [21 x i8] c" maximum index = %d\0A\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str1 = private constant [21 x i8] c" maximum value = %e\0A\00", align 1 ; <[21 x i8]*> [#uses=1]

declare <4 x float> @llvm.x86.sse.cmp.ps(<4 x float>, <4 x float>, i8) nounwind readnone

declare i32 @llvm.x86.sse.movmsk.ps(<4 x float>) nounwind readnone

declare <4 x float> @llvm.x86.sse.max.ps(<4 x float>, <4 x float>) nounwind readnone

declare float @fabsf(float)

define i32 @main() nounwind {
entry:
  %indx16.i = alloca [2 x <4 x float>], align 16  ; <[2 x <4 x float>]*> [#uses=3]
  %xbig18.i = alloca [2 x <4 x float>], align 16  ; <[2 x <4 x float>]*> [#uses=3]
  %x = alloca [20 x float], align 4               ; <[20 x float]*> [#uses=12]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %0 = phi i32 [ 0, %entry ], [ %3, %bb ]         ; <i32> [#uses=3]
  %scevgep = getelementptr [20 x float]* %x, i32 0, i32 %0 ; <float*> [#uses=1]
  %1 = sitofp i32 %0 to float                     ; <float> [#uses=1]
  %2 = fadd float %1, -2.000000e+00               ; <float> [#uses=1]
  store float %2, float* %scevgep, align 4
  %3 = add nsw i32 %0, 1                          ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %3, 20                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  %4 = getelementptr inbounds [20 x float]* %x, i32 0, i32 7 ; <float*> [#uses=1]
  store float 3.300000e+01, float* %4, align 4
  %x3 = getelementptr inbounds [20 x float]* %x, i32 0, i32 0 ; <float*> [#uses=3]
  %indx1675.i = bitcast [2 x <4 x float>]* %indx16.i to i8* ; <i8*> [#uses=1]
  %indx16.sub.i = getelementptr inbounds [2 x <4 x float>]* %indx16.i, i32 0, i32 0 ; <<4 x float>*> [#uses=1]
  %xbig1872.i = bitcast [2 x <4 x float>]* %xbig18.i to i8* ; <i8*> [#uses=1]
  %xbig18.sub.i = getelementptr inbounds [2 x <4 x float>]* %xbig18.i, i32 0, i32 0 ; <<4 x float>*> [#uses=1]
  %5 = ptrtoint [20 x float]* %x to i32           ; <i32> [#uses=1]
  %6 = lshr i32 %5, 2                             ; <i32> [#uses=1]
  %7 = and i32 %6, 3                              ; <i32> [#uses=1]
  switch i32 %7, label %bb18.i [
    i32 1, label %bb7.i
    i32 2, label %bb13.i
    i32 3, label %bb16.i
  ]

bb7.i:                                            ; preds = %bb2
  %8 = load float* %x3, align 4                   ; <float> [#uses=1]
  %9 = call float @fabsf(float %8) nounwind readnone ; <float> [#uses=2]
  %scevgep68.i = getelementptr [20 x float]* %x, i32 0, i32 1 ; <float*> [#uses=1]
  %10 = load float* %scevgep68.i, align 4         ; <float> [#uses=1]
  %11 = call float @fabsf(float %10) nounwind readnone ; <float> [#uses=2]
  %12 = fcmp ogt float %11, %9                    ; <i1> [#uses=2]
  %ibbig.1.i = zext i1 %12 to i32                 ; <i32> [#uses=1]
  %bbig.3.i = select i1 %12, float %11, float %9  ; <float> [#uses=2]
  %scevgep68.1.i = getelementptr [20 x float]* %x, i32 0, i32 2 ; <float*> [#uses=1]
  %13 = load float* %scevgep68.1.i, align 4       ; <float> [#uses=1]
  %14 = call float @fabsf(float %13) nounwind readnone ; <float> [#uses=2]
  %15 = fcmp ogt float %14, %bbig.3.i             ; <i1> [#uses=2]
  %ibbig.1.1.i = select i1 %15, i32 2, i32 %ibbig.1.i ; <i32> [#uses=1]
  %bbig.3.1.i = select i1 %15, float %14, float %bbig.3.i ; <float> [#uses=1]
  br label %bb18.i

bb13.i:                                           ; preds = %bb2
  %16 = load float* %x3, align 4                  ; <float> [#uses=1]
  %17 = call float @fabsf(float %16) nounwind readnone ; <float> [#uses=2]
  %18 = getelementptr inbounds [20 x float]* %x, i32 0, i32 1 ; <float*> [#uses=1]
  %19 = load float* %18, align 4                  ; <float> [#uses=1]
  %20 = call float @fabsf(float %19) nounwind readnone ; <float> [#uses=2]
  %21 = fcmp ogt float %20, %17                   ; <i1> [#uses=1]
  br i1 %21, label %bb14.i, label %bb18.i

bb14.i:                                           ; preds = %bb13.i
  br label %bb18.i

bb16.i:                                           ; preds = %bb2
  %22 = load float* %x3, align 4                  ; <float> [#uses=1]
  %23 = call float @fabsf(float %22) nounwind readnone ; <float> [#uses=1]
  br label %bb18.i

bb18.i:                                           ; preds = %bb16.i, %bb14.i, %bb13.i, %bb7.i, %bb2
  %ibbig.0.i = phi i32 [ 1, %bb14.i ], [ 0, %bb16.i ], [ 0, %bb2 ], [ 0, %bb13.i ], [ %ibbig.1.1.i, %bb7.i ] ; <i32> [#uses=2]
  %nn.0.i = phi i32 [ 18, %bb14.i ], [ 19, %bb16.i ], [ 20, %bb2 ], [ 18, %bb13.i ], [ 17, %bb7.i ] ; <i32> [#uses=6]
  %bres.0.i = phi float [ 2.000000e+00, %bb14.i ], [ 1.000000e+00, %bb16.i ], [ 0.000000e+00, %bb2 ], [ 2.000000e+00, %bb13.i ], [ 3.000000e+00, %bb7.i ] ; <float> [#uses=2]
  %bbig.2.i = phi float [ %20, %bb14.i ], [ %23, %bb16.i ], [ 0.000000e+00, %bb2 ], [ %17, %bb13.i ], [ %bbig.3.1.i, %bb7.i ] ; <float> [#uses=1]
  %24 = fptosi float %bres.0.i to i32             ; <i32> [#uses=4]
  %25 = getelementptr inbounds [20 x float]* %x, i32 0, i32 %24 ; <float*> [#uses=1]
  %26 = lshr i32 %nn.0.i, 2                       ; <i32> [#uses=3]
  %27 = add i32 %26, -2                           ; <i32> [#uses=3]
  %28 = shl i32 %27, 2                            ; <i32> [#uses=1]
  %.neg20.i = add nsw i32 %nn.0.i, -8             ; <i32> [#uses=1]
  %29 = sub i32 %.neg20.i, %28                    ; <i32> [#uses=2]
  %30 = bitcast float* %25 to <4 x float>*        ; <<4 x float>*> [#uses=1]
  %31 = load <4 x float>* %30, align 16           ; <<4 x float>> [#uses=1]
  %.sum.i = add i32 %24, 4                        ; <i32> [#uses=1]
  %32 = getelementptr inbounds [20 x float]* %x, i32 0, i32 %.sum.i ; <float*> [#uses=1]
  %tmp1.i12.i = bitcast <4 x float> %31 to <4 x i32> ; <<4 x i32>> [#uses=1]
  %tmp3.i14.i = and <4 x i32> %tmp1.i12.i, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647> ; <<4 x i32>> [#uses=1]
  %tmp4.i15.i = bitcast <4 x i32> %tmp3.i14.i to <4 x float> ; <<4 x float>> [#uses=3]
  %V1.0.in46.i = bitcast float* %32 to <4 x float>* ; <<4 x float>*> [#uses=1]
  %V1.047.i = load <4 x float>* %V1.0.in46.i      ; <<4 x float>> [#uses=1]
  %33 = icmp sgt i32 %27, 0                       ; <i1> [#uses=1]
  %tmp1.i450.i = bitcast <4 x float> %V1.047.i to <4 x i32> ; <<4 x i32>> [#uses=1]
  %tmp3.i651.i = and <4 x i32> %tmp1.i450.i, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647> ; <<4 x i32>> [#uses=1]
  %tmp4.i52.i = bitcast <4 x i32> %tmp3.i651.i to <4 x float> ; <<4 x float>> [#uses=3]
  %tmp.i254.i = call <4 x float> @llvm.x86.sse.cmp.ps(<4 x float> %tmp4.i52.i, <4 x float> %tmp4.i15.i, i8 6) nounwind ; <<4 x float>> [#uses=3]
  %34 = call i32 @llvm.x86.sse.movmsk.ps(<4 x float> %tmp.i254.i) nounwind readnone ; <i32> [#uses=1]
  %35 = icmp sgt i32 %34, 0                       ; <i1> [#uses=2]
  br i1 %33, label %bb.nph56.i, label %bb23.i

bb.nph56.i:                                       ; preds = %bb18.i
  %tmp96.i = and i32 %nn.0.i, 20                  ; <i32> [#uses=1]
  %tmp102.i = add i32 %24, 8                      ; <i32> [#uses=1]
  br label %bb19.i

bb19.i:                                           ; preds = %bb21.i, %bb.nph56.i
  %36 = phi i1 [ %35, %bb.nph56.i ], [ %41, %bb21.i ] ; <i1> [#uses=1]
  %tmp.i255.i = phi <4 x float> [ %tmp.i254.i, %bb.nph56.i ], [ %tmp.i2.i, %bb21.i ] ; <<4 x float>> [#uses=1]
  %tmp4.i53.i = phi <4 x float> [ %tmp4.i52.i, %bb.nph56.i ], [ %tmp4.i.i, %bb21.i ] ; <<4 x float>> [#uses=1]
  %V7.145.i = phi <4 x float> [ <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, %bb.nph56.i ], [ %V7.0.i, %bb21.i ] ; <<4 x float>> [#uses=2]
  %V2.044.i = phi <4 x float> [ <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>, %bb.nph56.i ], [ %phitmp.i, %bb21.i ] ; <<4 x float>> [#uses=2]
  %V0.142.i = phi <4 x float> [ %tmp4.i15.i, %bb.nph56.i ], [ %V0.0.i, %bb21.i ] ; <<4 x float>> [#uses=2]
  %i.240.i = phi i32 [ 0, %bb.nph56.i ], [ %39, %bb21.i ] ; <i32> [#uses=2]
  %tmp101.i = shl i32 %i.240.i, 2                 ; <i32> [#uses=1]
  %tmp103.i = add i32 %tmp101.i, %tmp102.i        ; <i32> [#uses=1]
  %scevgep104.i = getelementptr [20 x float]* %x, i32 0, i32 %tmp103.i ; <float*> [#uses=1]
  %V1.0.in.i = bitcast float* %scevgep104.i to <4 x float>* ; <<4 x float>*> [#uses=1]
  br i1 %36, label %bb20.i, label %bb21.i

bb20.i:                                           ; preds = %bb19.i
  %37 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %V0.142.i, <4 x float> %tmp4.i53.i) nounwind readnone ; <<4 x float>> [#uses=1]
  %tmp.i7.i = bitcast <4 x float> %V2.044.i to <4 x i32> ; <<4 x i32>> [#uses=1]
  %tmp1.i8.i = bitcast <4 x float> %tmp.i255.i to <4 x i32> ; <<4 x i32>> [#uses=1]
  %tmp2.i9.i = and <4 x i32> %tmp.i7.i, %tmp1.i8.i ; <<4 x i32>> [#uses=1]
  %tmp3.i10.i = bitcast <4 x i32> %tmp2.i9.i to <4 x float> ; <<4 x float>> [#uses=1]
  %38 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %V7.145.i, <4 x float> %tmp3.i10.i) nounwind readnone ; <<4 x float>> [#uses=1]
  br label %bb21.i

bb21.i:                                           ; preds = %bb20.i, %bb19.i
  %V0.0.i = phi <4 x float> [ %37, %bb20.i ], [ %V0.142.i, %bb19.i ] ; <<4 x float>> [#uses=3]
  %V7.0.i = phi <4 x float> [ %38, %bb20.i ], [ %V7.145.i, %bb19.i ] ; <<4 x float>> [#uses=2]
  %39 = add nsw i32 %i.240.i, 1                   ; <i32> [#uses=2]
  %phitmp.i = fadd <4 x float> %V2.044.i, <float 4.000000e+00, float 4.000000e+00, float 4.000000e+00, float 4.000000e+00> ; <<4 x float>> [#uses=2]
  %V1.0.i = load <4 x float>* %V1.0.in.i          ; <<4 x float>> [#uses=1]
  %tmp1.i4.i = bitcast <4 x float> %V1.0.i to <4 x i32> ; <<4 x i32>> [#uses=1]
  %tmp3.i6.i = and <4 x i32> %tmp1.i4.i, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647> ; <<4 x i32>> [#uses=1]
  %tmp4.i.i = bitcast <4 x i32> %tmp3.i6.i to <4 x float> ; <<4 x float>> [#uses=3]
  %tmp.i2.i = call <4 x float> @llvm.x86.sse.cmp.ps(<4 x float> %tmp4.i.i, <4 x float> %V0.0.i, i8 6) nounwind ; <<4 x float>> [#uses=3]
  %40 = call i32 @llvm.x86.sse.movmsk.ps(<4 x float> %tmp.i2.i) nounwind readnone ; <i32> [#uses=1]
  %41 = icmp sgt i32 %40, 0                       ; <i1> [#uses=2]
  %exitcond100.i = icmp eq i32 %39, %27           ; <i1> [#uses=1]
  br i1 %exitcond100.i, label %bb22.bb23_crit_edge.i, label %bb19.i

bb22.bb23_crit_edge.i:                            ; preds = %bb21.i
  %phitmp65.i = bitcast <4 x float> %phitmp.i to <4 x i32> ; <<4 x i32>> [#uses=1]
  br label %bb23.i

bb23.i:                                           ; preds = %bb22.bb23_crit_edge.i, %bb18.i
  %.lcssa.i = phi i1 [ %41, %bb22.bb23_crit_edge.i ], [ %35, %bb18.i ] ; <i1> [#uses=1]
  %tmp.i2.lcssa.i = phi <4 x float> [ %tmp.i2.i, %bb22.bb23_crit_edge.i ], [ %tmp.i254.i, %bb18.i ] ; <<4 x float>> [#uses=1]
  %tmp4.i.lcssa.i = phi <4 x float> [ %tmp4.i.i, %bb22.bb23_crit_edge.i ], [ %tmp4.i52.i, %bb18.i ] ; <<4 x float>> [#uses=1]
  %tmp96.pn.i = phi i32 [ %tmp96.i, %bb22.bb23_crit_edge.i ], [ 8, %bb18.i ] ; <i32> [#uses=1]
  %V7.1.lcssa.i = phi <4 x float> [ %V7.0.i, %bb22.bb23_crit_edge.i ], [ <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, %bb18.i ] ; <<4 x float>> [#uses=2]
  %V2.0.lcssa.i = phi <4 x i32> [ %phitmp65.i, %bb22.bb23_crit_edge.i ], [ <i32 1082130432, i32 1084227584, i32 1086324736, i32 1088421888>, %bb18.i ] ; <<4 x i32>> [#uses=1]
  %V0.1.lcssa.i = phi <4 x float> [ %V0.0.i, %bb22.bb23_crit_edge.i ], [ %tmp4.i15.i, %bb18.i ] ; <<4 x float>> [#uses=2]
  %tmp97.pn.i = add i32 %24, %tmp96.pn.i          ; <i32> [#uses=1]
  br i1 %.lcssa.i, label %bb24.i, label %bb25.i

bb24.i:                                           ; preds = %bb23.i
  %42 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %V0.1.lcssa.i, <4 x float> %tmp4.i.lcssa.i) nounwind readnone ; <<4 x float>> [#uses=1]
  %tmp1.i.i = bitcast <4 x float> %tmp.i2.lcssa.i to <4 x i32> ; <<4 x i32>> [#uses=1]
  %tmp2.i.i = and <4 x i32> %V2.0.lcssa.i, %tmp1.i.i ; <<4 x i32>> [#uses=1]
  %tmp3.i.i = bitcast <4 x i32> %tmp2.i.i to <4 x float> ; <<4 x float>> [#uses=1]
  %43 = call <4 x float> @llvm.x86.sse.max.ps(<4 x float> %V7.1.lcssa.i, <4 x float> %tmp3.i.i) nounwind readnone ; <<4 x float>> [#uses=1]
  br label %bb25.i

bb25.i:                                           ; preds = %bb24.i, %bb23.i
  %V0.2.i = phi <4 x float> [ %42, %bb24.i ], [ %V0.1.lcssa.i, %bb23.i ] ; <<4 x float>> [#uses=1]
  %V7.2.i = phi <4 x float> [ %43, %bb24.i ], [ %V7.1.lcssa.i, %bb23.i ] ; <<4 x float>> [#uses=1]
  store <4 x float> %V0.2.i, <4 x float>* %xbig18.sub.i, align 16
  store <4 x float> %V7.2.i, <4 x float>* %indx16.sub.i, align 16
  %44 = icmp sgt i32 %29, 0                       ; <i1> [#uses=1]
  br i1 %44, label %bb30.preheader.i, label %bb35.preheader.i

bb30.preheader.i:                                 ; preds = %bb25.i
  %tmp78.i = mul i32 %26, -4                      ; <i32> [#uses=1]
  %tmp79.i = add i32 %nn.0.i, %tmp78.i            ; <i32> [#uses=1]
  %scevgep82.i = getelementptr [2 x <4 x float>]* %xbig18.i, i32 0, i32 1 ; <<4 x float>*> [#uses=1]
  %scevgep8283.i = bitcast <4 x float>* %scevgep82.i to i8* ; <i8*> [#uses=1]
  %scevgep87.i = getelementptr [2 x <4 x float>]* %indx16.i, i32 0, i32 1 ; <<4 x float>*> [#uses=1]
  %scevgep8788.i = bitcast <4 x float>* %scevgep87.i to i8* ; <i8*> [#uses=1]
  br label %bb29.i

bb29.i:                                           ; preds = %bb29.i, %bb30.preheader.i
  %i.337.i = phi i32 [ 0, %bb30.preheader.i ], [ %48, %bb29.i ] ; <i32> [#uses=4]
  %xp.0.lcssa.sum.i = add i32 %tmp97.pn.i, %i.337.i ; <i32> [#uses=1]
  %xp.138.i = getelementptr [20 x float]* %x, i32 0, i32 %xp.0.lcssa.sum.i ; <float*> [#uses=1]
  %tmp84.i = shl i32 %i.337.i, 2                  ; <i32> [#uses=2]
  %uglygep85.i = getelementptr i8* %scevgep8283.i, i32 %tmp84.i ; <i8*> [#uses=1]
  %uglygep8586.i = bitcast i8* %uglygep85.i to float* ; <float*> [#uses=1]
  %uglygep89.i = getelementptr i8* %scevgep8788.i, i32 %tmp84.i ; <i8*> [#uses=1]
  %uglygep8990.i = bitcast i8* %uglygep89.i to float* ; <float*> [#uses=1]
  %tmp91.i = add i32 %i.337.i, %nn.0.i            ; <i32> [#uses=1]
  %45 = load float* %xp.138.i, align 4            ; <float> [#uses=1]
  %46 = call float @fabsf(float %45) nounwind readnone ; <float> [#uses=1]
  store float %46, float* %uglygep8586.i, align 4
  %47 = sitofp i32 %tmp91.i to float              ; <float> [#uses=1]
  store float %47, float* %uglygep8990.i, align 4
  %48 = add nsw i32 %i.337.i, 1                   ; <i32> [#uses=2]
  %exitcond80.i = icmp eq i32 %48, %tmp79.i       ; <i1> [#uses=1]
  br i1 %exitcond80.i, label %bb35.preheader.i, label %bb29.i

bb.nph35.i:                                       ; preds = %bb35.preheader.i
  %tmp.i = mul i32 %26, -4                        ; <i32> [#uses=1]
  %tmp69.i = add i32 %nn.0.i, %tmp.i              ; <i32> [#uses=1]
  %tmp70.i = add i32 %tmp69.i, 4                  ; <i32> [#uses=1]
  br label %bb32.i

bb32.i:                                           ; preds = %bb34.i, %bb.nph35.i
  %ebig.134.i = phi float [ %bbig.2.i, %bb.nph35.i ], [ %ebig.0.i, %bb34.i ] ; <float> [#uses=2]
  %i.433.i = phi i32 [ 0, %bb.nph35.i ], [ %54, %bb34.i ] ; <i32> [#uses=2]
  %iebig.332.i = phi i32 [ %ibbig.0.i, %bb.nph35.i ], [ %iebig.2.i, %bb34.i ] ; <i32> [#uses=1]
  %tmp73.i = shl i32 %i.433.i, 2                  ; <i32> [#uses=2]
  %uglygep.i = getelementptr i8* %xbig1872.i, i32 %tmp73.i ; <i8*> [#uses=1]
  %uglygep74.i = bitcast i8* %uglygep.i to float* ; <float*> [#uses=1]
  %49 = load float* %uglygep74.i, align 4         ; <float> [#uses=2]
  %50 = fcmp ogt float %49, %ebig.134.i           ; <i1> [#uses=1]
  br i1 %50, label %bb33.i, label %bb34.i

bb33.i:                                           ; preds = %bb32.i
  %uglygep76.i = getelementptr i8* %indx1675.i, i32 %tmp73.i ; <i8*> [#uses=1]
  %uglygep7677.i = bitcast i8* %uglygep76.i to float* ; <float*> [#uses=1]
  %51 = load float* %uglygep7677.i, align 4       ; <float> [#uses=1]
  %52 = fadd float %51, %bres.0.i                 ; <float> [#uses=1]
  %53 = fptosi float %52 to i32                   ; <i32> [#uses=1]
  br label %bb34.i

bb34.i:                                           ; preds = %bb33.i, %bb32.i
  %iebig.2.i = phi i32 [ %53, %bb33.i ], [ %iebig.332.i, %bb32.i ] ; <i32> [#uses=2]
  %ebig.0.i = phi float [ %49, %bb33.i ], [ %ebig.134.i, %bb32.i ] ; <float> [#uses=1]
  %54 = add nsw i32 %i.433.i, 1                   ; <i32> [#uses=2]
  %exitcond71.i = icmp eq i32 %54, %tmp70.i       ; <i1> [#uses=1]
  br i1 %exitcond71.i, label %isamax0.exit, label %bb32.i

bb35.preheader.i:                                 ; preds = %bb29.i, %bb25.i
  %55 = add nsw i32 %29, 4                        ; <i32> [#uses=1]
  %56 = icmp sgt i32 %55, 0                       ; <i1> [#uses=1]
  br i1 %56, label %bb.nph35.i, label %isamax0.exit

isamax0.exit:                                     ; preds = %bb35.preheader.i, %bb34.i
  %.0.i = phi i32 [ %ibbig.0.i, %bb35.preheader.i ], [ %iebig.2.i, %bb34.i ] ; <i32> [#uses=2]
  %57 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %.0.i) nounwind ; <i32> [#uses=0]
  %58 = getelementptr inbounds [20 x float]* %x, i32 0, i32 %.0.i ; <float*> [#uses=1]
  %59 = load float* %58, align 4                  ; <float> [#uses=1]
  %60 = fpext float %59 to double                 ; <double> [#uses=1]
  %61 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), double %60) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
