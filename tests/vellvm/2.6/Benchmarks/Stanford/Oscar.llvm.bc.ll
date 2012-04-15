; ModuleID = 'Oscar.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@.str = private constant [15 x i8] c"  %15.3f%15.3f\00", align 1 ; <[15 x i8]*> [#uses=1]
@e = internal global [130 x %struct.complex] zeroinitializer, align 32 ; <[130 x %struct.complex]*> [#uses=14]
@z = internal global [257 x %struct.complex] zeroinitializer, align 32 ; <[257 x %struct.complex]*> [#uses=14]
@w = internal global [257 x %struct.complex] zeroinitializer, align 32 ; <[257 x %struct.complex]*> [#uses=6]

declare i32 @putchar(i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  %h.i.i = alloca [26 x float], align 4           ; <[26 x float]*> [#uses=2]
  br label %bb

bb:                                               ; preds = %Oscar.exit, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %84, %Oscar.exit ] ; <i32> [#uses=1]
  br label %bb.i1.i

bb.i1.i:                                          ; preds = %Cos.exit.i.i, %bb
  %indvar21.i.i = phi i32 [ 0, %bb ], [ %tmp24.i.i, %Cos.exit.i.i ] ; <i32> [#uses=1]
  %divisor.03.i.i = phi float [ 4.000000e+00, %bb ], [ %13, %Cos.exit.i.i ] ; <float> [#uses=2]
  %tmp24.i.i = add i32 %indvar21.i.i, 1           ; <i32> [#uses=3]
  %scevgep25.i.i = getelementptr [26 x float]* %h.i.i, i32 0, i32 %tmp24.i.i ; <float*> [#uses=1]
  %0 = fdiv float 0x400921FB60000000, %divisor.03.i.i ; <float> [#uses=2]
  br label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb4.i.i.i, %bb.i1.i
  %indvar.i.i.i = phi i32 [ 0, %bb.i1.i ], [ %indvar.next.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=2]
  %factor.03.i.i.i = phi i32 [ 1, %bb.i1.i ], [ %1, %bb4.i.i.i ] ; <i32> [#uses=1]
  %power.02.i.i.i = phi float [ %0, %bb.i1.i ], [ %2, %bb4.i.i.i ] ; <float> [#uses=1]
  %result.11.i.i.i = phi float [ 1.000000e+00, %bb.i1.i ], [ %result.0.i.i.i, %bb4.i.i.i ] ; <float> [#uses=3]
  %i.04.i.i.i = add i32 %indvar.i.i.i, 2          ; <i32> [#uses=3]
  %1 = mul i32 %i.04.i.i.i, %factor.03.i.i.i      ; <i32> [#uses=2]
  %2 = fmul float %power.02.i.i.i, %0             ; <float> [#uses=2]
  %3 = and i32 %i.04.i.i.i, 1                     ; <i32> [#uses=1]
  %4 = icmp eq i32 %3, 0                          ; <i1> [#uses=1]
  br i1 %4, label %bb1.i.i.i, label %bb4.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i
  %5 = and i32 %i.04.i.i.i, 3                     ; <i32> [#uses=1]
  %6 = icmp eq i32 %5, 0                          ; <i1> [#uses=1]
  %7 = sitofp i32 %1 to float                     ; <float> [#uses=1]
  %8 = fdiv float %2, %7                          ; <float> [#uses=2]
  br i1 %6, label %bb2.i.i.i, label %bb3.i.i.i

bb2.i.i.i:                                        ; preds = %bb1.i.i.i
  %9 = fadd float %8, %result.11.i.i.i            ; <float> [#uses=1]
  br label %bb4.i.i.i

bb3.i.i.i:                                        ; preds = %bb1.i.i.i
  %10 = fsub float %result.11.i.i.i, %8           ; <float> [#uses=1]
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb3.i.i.i, %bb2.i.i.i, %bb.i.i.i
  %result.0.i.i.i = phi float [ %9, %bb2.i.i.i ], [ %10, %bb3.i.i.i ], [ %result.11.i.i.i, %bb.i.i.i ] ; <float> [#uses=2]
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=2]
  %exitcond.i.i = icmp eq i32 %indvar.next.i.i.i, 9 ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %Cos.exit.i.i, label %bb.i.i.i

Cos.exit.i.i:                                     ; preds = %bb4.i.i.i
  %11 = fmul float %result.0.i.i.i, 2.000000e+00  ; <float> [#uses=1]
  %12 = fdiv float 1.000000e+00, %11              ; <float> [#uses=1]
  store float %12, float* %scevgep25.i.i, align 4
  %13 = fmul float %divisor.03.i.i, 2.000000e+00  ; <float> [#uses=1]
  %exitcond23.i.i = icmp eq i32 %tmp24.i.i, 25    ; <i1> [#uses=1]
  br i1 %exitcond23.i.i, label %bb2.i.i, label %bb.i1.i

bb2.i.i:                                          ; preds = %Cos.exit.i.i
  store float 1.000000e+00, float* getelementptr inbounds ([130 x %struct.complex]* @e, i32 0, i32 1, i32 0), align 8
  store float 0.000000e+00, float* getelementptr inbounds ([130 x %struct.complex]* @e, i32 0, i32 1, i32 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([130 x %struct.complex]* @e, i32 0, i32 65, i32 0), align 8
  store float 1.000000e+00, float* getelementptr inbounds ([130 x %struct.complex]* @e, i32 0, i32 65, i32 1), align 4
  store float -1.000000e+00, float* getelementptr inbounds ([130 x %struct.complex]* @e, i32 0, i32 129, i32 0), align 8
  store float 0.000000e+00, float* getelementptr inbounds ([130 x %struct.complex]* @e, i32 0, i32 129, i32 1), align 4
  br label %bb3.i.i

bb3.i.i:                                          ; preds = %bb5.i.i, %bb2.i.i
  %l.0.i.i = phi i32 [ 64, %bb2.i.i ], [ %14, %bb5.i.i ] ; <i32> [#uses=4]
  %j.0.i.i = phi i32 [ 1, %bb2.i.i ], [ %.0.i.i.i, %bb5.i.i ] ; <i32> [#uses=2]
  %14 = sdiv i32 %l.0.i.i, 2                      ; <i32> [#uses=4]
  %15 = getelementptr inbounds [26 x float]* %h.i.i, i32 0, i32 %j.0.i.i ; <float*> [#uses=1]
  %16 = load float* %15, align 4                  ; <float> [#uses=2]
  %17 = add nsw i32 %14, 1                        ; <i32> [#uses=1]
  %tmp8.i.i = shl i32 %14, 1                      ; <i32> [#uses=1]
  %tmp926.i.i = or i32 %tmp8.i.i, 1               ; <i32> [#uses=1]
  %tmp18.i.i = add i32 %l.0.i.i, %14              ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb4.i.i, %bb3.i.i
  %indvar.i2.i = phi i32 [ 0, %bb3.i.i ], [ %indvar.next.i3.i, %bb4.i.i ] ; <i32> [#uses=2]
  %tmp.i.i = mul i32 %indvar.i2.i, %l.0.i.i       ; <i32> [#uses=4]
  %tmp5.i.i = add i32 %tmp.i.i, 1                 ; <i32> [#uses=2]
  %scevgep6.i.i = getelementptr inbounds [130 x %struct.complex]* @e, i32 0, i32 %tmp5.i.i, i32 0 ; <float*> [#uses=1]
  %scevgep7.i.i = getelementptr [130 x %struct.complex]* @e, i32 0, i32 %tmp5.i.i, i32 1 ; <float*> [#uses=1]
  %tmp10.i.i = add i32 %tmp.i.i, %tmp926.i.i      ; <i32> [#uses=2]
  %scevgep11.i.i = getelementptr [130 x %struct.complex]* @e, i32 0, i32 %tmp10.i.i, i32 1 ; <float*> [#uses=1]
  %tmp12.i.i = add i32 %tmp.i.i, %17              ; <i32> [#uses=2]
  %scevgep13.i.i = getelementptr [130 x %struct.complex]* @e, i32 0, i32 %tmp12.i.i, i32 1 ; <float*> [#uses=1]
  %scevgep1415.i.i = getelementptr inbounds [130 x %struct.complex]* @e, i32 0, i32 %tmp10.i.i, i32 0 ; <float*> [#uses=1]
  %scevgep1617.i.i = getelementptr inbounds [130 x %struct.complex]* @e, i32 0, i32 %tmp12.i.i, i32 0 ; <float*> [#uses=1]
  %tmp19.i.i = add i32 %tmp.i.i, %tmp18.i.i       ; <i32> [#uses=1]
  %18 = load float* %scevgep1415.i.i, align 8     ; <float> [#uses=1]
  %19 = load float* %scevgep6.i.i, align 8        ; <float> [#uses=1]
  %20 = fadd float %18, %19                       ; <float> [#uses=1]
  %21 = fmul float %16, %20                       ; <float> [#uses=1]
  store float %21, float* %scevgep1617.i.i, align 8
  %22 = load float* %scevgep11.i.i, align 4       ; <float> [#uses=1]
  %23 = load float* %scevgep7.i.i, align 4        ; <float> [#uses=1]
  %24 = fadd float %22, %23                       ; <float> [#uses=1]
  %25 = fmul float %16, %24                       ; <float> [#uses=1]
  store float %25, float* %scevgep13.i.i, align 4
  %26 = icmp sgt i32 %tmp19.i.i, 128              ; <i1> [#uses=1]
  %indvar.next.i3.i = add i32 %indvar.i2.i, 1     ; <i32> [#uses=1]
  br i1 %26, label %bb5.i.i, label %bb4.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %27 = add nsw i32 %j.0.i.i, 1                   ; <i32> [#uses=2]
  %28 = icmp slt i32 %27, 25                      ; <i1> [#uses=1]
  %.0.i.i.i = select i1 %28, i32 %27, i32 25      ; <i32> [#uses=1]
  %29 = icmp slt i32 %l.0.i.i, 4                  ; <i1> [#uses=1]
  br i1 %29, label %bb.i, label %bb3.i.i

bb.i:                                             ; preds = %bb.i, %bb5.i.i
  %indvar18.i = phi i32 [ %tmp21.i, %bb.i ], [ 0, %bb5.i.i ] ; <i32> [#uses=1]
  %seed.tmp.0.i = phi i32 [ %37, %bb.i ], [ 5767, %bb5.i.i ] ; <i32> [#uses=1]
  %tmp21.i = add i32 %indvar18.i, 1               ; <i32> [#uses=4]
  %scevgep22.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp21.i, i32 1 ; <float*> [#uses=1]
  %scevgep2324.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp21.i, i32 0 ; <float*> [#uses=1]
  %30 = mul i32 %seed.tmp.0.i, 4855               ; <i32> [#uses=1]
  %31 = add nsw i32 %30, 1731                     ; <i32> [#uses=1]
  %32 = and i32 %31, 8191                         ; <i32> [#uses=2]
  %33 = sitofp i32 %32 to float                   ; <float> [#uses=1]
  %34 = fmul float %33, 0x3F20000000000000        ; <float> [#uses=1]
  %35 = mul i32 %32, 4855                         ; <i32> [#uses=1]
  %36 = add nsw i32 %35, 1731                     ; <i32> [#uses=1]
  %37 = and i32 %36, 8191                         ; <i32> [#uses=2]
  %38 = sitofp i32 %37 to float                   ; <float> [#uses=1]
  %39 = fmul float %38, 0x3F20000000000000        ; <float> [#uses=1]
  %40 = fmul float %34, 2.000000e+01              ; <float> [#uses=1]
  %41 = fadd float %40, -1.000000e+01             ; <float> [#uses=1]
  store float %41, float* %scevgep2324.i, align 8
  %42 = fmul float %39, 2.000000e+01              ; <float> [#uses=1]
  %43 = fadd float %42, -1.000000e+01             ; <float> [#uses=1]
  store float %43, float* %scevgep22.i, align 4
  %exitcond20.i = icmp eq i32 %tmp21.i, 256       ; <i1> [#uses=1]
  br i1 %exitcond20.i, label %bb3.i, label %bb.i

bb3.i:                                            ; preds = %Fft.exit.i, %bb.i
  %indvar.i = phi i32 [ %indvar.next.i, %Fft.exit.i ], [ 0, %bb.i ] ; <i32> [#uses=1]
  br label %bb.i5.i

bb.i5.i:                                          ; preds = %bb5.i16.i, %bb3.i
  %l.0.i4.i = phi i32 [ 1, %bb3.i ], [ %65, %bb5.i16.i ] ; <i32> [#uses=4]
  br label %bb1.outer.i.i

bb1.outer.i.i:                                    ; preds = %bb2.i14.i, %bb.i5.i
  %indvar14.i.i = phi i32 [ 0, %bb.i5.i ], [ %indvar.next15.i.i, %bb2.i14.i ] ; <i32> [#uses=3]
  %i.0.ph.i.i = phi i32 [ 1, %bb.i5.i ], [ %tmp8.i7.i, %bb2.i14.i ] ; <i32> [#uses=5]
  %tmp32.i.i = mul i32 %indvar14.i.i, %l.0.i4.i   ; <i32> [#uses=3]
  %j.0.ph.i.i = add i32 %l.0.i4.i, %tmp32.i.i     ; <i32> [#uses=2]
  %tmp3252.i.i = add i32 %indvar14.i.i, 2         ; <i32> [#uses=1]
  %tmp37.i.i = mul i32 %l.0.i4.i, %tmp3252.i.i    ; <i32> [#uses=1]
  %tmp38.i.i = add i32 %tmp32.i.i, 1              ; <i32> [#uses=2]
  %scevgep3940.i.i = getelementptr inbounds [130 x %struct.complex]* @e, i32 0, i32 %tmp38.i.i, i32 0 ; <float*> [#uses=1]
  %scevgep41.i.i = getelementptr [130 x %struct.complex]* @e, i32 0, i32 %tmp38.i.i, i32 1 ; <float*> [#uses=1]
  %tmp7.i.i = add i32 %i.0.ph.i.i, 1              ; <i32> [#uses=1]
  %tmp9.i.i = add i32 %i.0.ph.i.i, 128            ; <i32> [#uses=1]
  %tmp23.i.i = add i32 %i.0.ph.i.i, %tmp32.i.i    ; <i32> [#uses=1]
  %tmp18.i6.i = add i32 %i.0.ph.i.i, %j.0.ph.i.i  ; <i32> [#uses=1]
  %44 = load float* %scevgep3940.i.i, align 8     ; <float> [#uses=2]
  %45 = load float* %scevgep41.i.i, align 4       ; <float> [#uses=2]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb1.i.i, %bb1.outer.i.i
  %indvar5.i.i = phi i32 [ 0, %bb1.outer.i.i ], [ %indvar.next6.i.i, %bb1.i.i ] ; <i32> [#uses=6]
  %tmp8.i7.i = add i32 %indvar5.i.i, %tmp7.i.i    ; <i32> [#uses=2]
  %tmp10.i8.i = add i32 %indvar5.i.i, %tmp9.i.i   ; <i32> [#uses=2]
  %scevgep1112.i9.i = getelementptr inbounds [257 x %struct.complex]* @z, i32 0, i32 %tmp10.i8.i, i32 0 ; <float*> [#uses=1]
  %scevgep13.i10.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp10.i8.i, i32 1 ; <float*> [#uses=1]
  %tmp19.i11.i = add i32 %indvar5.i.i, %tmp18.i6.i ; <i32> [#uses=2]
  %scevgep20.i.i = getelementptr [257 x %struct.complex]* @w, i32 0, i32 %tmp19.i11.i, i32 1 ; <float*> [#uses=1]
  %scevgep2122.i.i = getelementptr inbounds [257 x %struct.complex]* @w, i32 0, i32 %tmp19.i11.i, i32 0 ; <float*> [#uses=1]
  %tmp24.i12.i = add i32 %indvar5.i.i, %tmp23.i.i ; <i32> [#uses=2]
  %scevgep25.i13.i = getelementptr [257 x %struct.complex]* @w, i32 0, i32 %tmp24.i12.i, i32 1 ; <float*> [#uses=1]
  %scevgep2627.i.i = getelementptr inbounds [257 x %struct.complex]* @w, i32 0, i32 %tmp24.i12.i, i32 0 ; <float*> [#uses=1]
  %tmp28.i.i = add i32 %indvar5.i.i, %i.0.ph.i.i  ; <i32> [#uses=2]
  %scevgep2930.i.i = getelementptr inbounds [257 x %struct.complex]* @z, i32 0, i32 %tmp28.i.i, i32 0 ; <float*> [#uses=1]
  %scevgep31.i.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp28.i.i, i32 1 ; <float*> [#uses=1]
  %46 = load float* %scevgep2930.i.i, align 8     ; <float> [#uses=2]
  %47 = load float* %scevgep1112.i9.i, align 8    ; <float> [#uses=2]
  %48 = fadd float %46, %47                       ; <float> [#uses=1]
  store float %48, float* %scevgep2627.i.i, align 8
  %49 = load float* %scevgep31.i.i, align 4       ; <float> [#uses=2]
  %50 = load float* %scevgep13.i10.i, align 4     ; <float> [#uses=2]
  %51 = fadd float %49, %50                       ; <float> [#uses=1]
  store float %51, float* %scevgep25.i13.i, align 4
  %52 = fsub float %46, %47                       ; <float> [#uses=2]
  %53 = fmul float %44, %52                       ; <float> [#uses=1]
  %54 = fsub float %49, %50                       ; <float> [#uses=2]
  %55 = fmul float %45, %54                       ; <float> [#uses=1]
  %56 = fsub float %53, %55                       ; <float> [#uses=1]
  store float %56, float* %scevgep2122.i.i, align 8
  %57 = fmul float %44, %54                       ; <float> [#uses=1]
  %58 = fmul float %45, %52                       ; <float> [#uses=1]
  %59 = fadd float %57, %58                       ; <float> [#uses=1]
  store float %59, float* %scevgep20.i.i, align 4
  %60 = icmp sgt i32 %tmp8.i7.i, %j.0.ph.i.i      ; <i1> [#uses=1]
  %indvar.next6.i.i = add i32 %indvar5.i.i, 1     ; <i32> [#uses=1]
  br i1 %60, label %bb2.i14.i, label %bb1.i.i

bb2.i14.i:                                        ; preds = %bb1.i.i
  %61 = icmp sgt i32 %tmp37.i.i, 128              ; <i1> [#uses=1]
  %indvar.next15.i.i = add i32 %indvar14.i.i, 1   ; <i32> [#uses=1]
  br i1 %61, label %bb4.i15.i, label %bb1.outer.i.i

bb4.i15.i:                                        ; preds = %bb4.i15.i, %bb2.i14.i
  %indvar42.i.i = phi i32 [ %tmp45.i.i, %bb4.i15.i ], [ 0, %bb2.i14.i ] ; <i32> [#uses=2]
  %tmp44.i.i = add i32 %indvar42.i.i, 2           ; <i32> [#uses=1]
  %tmp45.i.i = add i32 %indvar42.i.i, 1           ; <i32> [#uses=5]
  %scevgep4647.i.i = getelementptr inbounds [257 x %struct.complex]* @w, i32 0, i32 %tmp45.i.i, i32 0 ; <float*> [#uses=1]
  %scevgep48.i.i = getelementptr [257 x %struct.complex]* @w, i32 0, i32 %tmp45.i.i, i32 1 ; <float*> [#uses=1]
  %scevgep4950.i.i = getelementptr inbounds [257 x %struct.complex]* @z, i32 0, i32 %tmp45.i.i, i32 0 ; <float*> [#uses=1]
  %scevgep51.i.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp45.i.i, i32 1 ; <float*> [#uses=1]
  %62 = load float* %scevgep4647.i.i, align 8     ; <float> [#uses=1]
  %63 = load float* %scevgep48.i.i, align 4       ; <float> [#uses=1]
  store float %62, float* %scevgep4950.i.i, align 8
  store float %63, float* %scevgep51.i.i, align 4
  %64 = icmp sgt i32 %tmp44.i.i, 256              ; <i1> [#uses=1]
  br i1 %64, label %bb5.i16.i, label %bb4.i15.i

bb5.i16.i:                                        ; preds = %bb4.i15.i
  %65 = shl i32 %l.0.i4.i, 1                      ; <i32> [#uses=2]
  %66 = icmp sgt i32 %65, 128                     ; <i1> [#uses=1]
  br i1 %66, label %bb7.i.i, label %bb.i5.i

bb7.i.i:                                          ; preds = %bb7.i.i, %bb5.i16.i
  %indvar.i17.i = phi i32 [ %tmp.i18.i, %bb7.i.i ], [ 0, %bb5.i16.i ] ; <i32> [#uses=2]
  %tmp.i18.i = add i32 %indvar.i17.i, 1           ; <i32> [#uses=3]
  %scevgep.i19.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp.i18.i, i32 1 ; <float*> [#uses=2]
  %scevgep23.i.i = getelementptr inbounds [257 x %struct.complex]* @z, i32 0, i32 %tmp.i18.i, i32 0 ; <float*> [#uses=2]
  %67 = load float* %scevgep23.i.i, align 8       ; <float> [#uses=1]
  %68 = fmul float %67, 6.250000e-02              ; <float> [#uses=1]
  store float %68, float* %scevgep23.i.i, align 8
  %69 = load float* %scevgep.i19.i, align 4       ; <float> [#uses=1]
  %70 = fmul float %69, -6.250000e-02             ; <float> [#uses=1]
  store float %70, float* %scevgep.i19.i, align 4
  %tmp4.i.i = add i32 %indvar.i17.i, 2            ; <i32> [#uses=1]
  %71 = icmp sgt i32 %tmp4.i.i, 256               ; <i1> [#uses=1]
  br i1 %71, label %Fft.exit.i, label %bb7.i.i

Fft.exit.i:                                       ; preds = %bb7.i.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond15.i = icmp eq i32 %indvar.next.i, 20  ; <i1> [#uses=1]
  br i1 %exitcond15.i, label %bb5.i, label %bb3.i

bb5.i:                                            ; preds = %Fft.exit.i
  %72 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb5.i
  %indvar.i.i = phi i32 [ 0, %bb5.i ], [ %indvar.next.i.i, %bb.i.i ] ; <i32> [#uses=2]
  %tmp.i = mul i32 %indvar.i.i, 34                ; <i32> [#uses=2]
  %tmp825.i = or i32 %tmp.i, 1                    ; <i32> [#uses=2]
  %scevgep1112.i.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp825.i, i32 0 ; <float*> [#uses=1]
  %scevgep10.i.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp825.i, i32 1 ; <float*> [#uses=1]
  %tmp11.i = add i32 %tmp.i, 18                   ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp11.i, i32 1 ; <float*> [#uses=1]
  %scevgep78.i.i = getelementptr [257 x %struct.complex]* @z, i32 0, i32 %tmp11.i, i32 0 ; <float*> [#uses=1]
  %73 = load float* %scevgep10.i.i, align 4       ; <float> [#uses=1]
  %74 = fpext float %73 to double                 ; <double> [#uses=1]
  %75 = load float* %scevgep1112.i.i, align 8     ; <float> [#uses=1]
  %76 = fpext float %75 to double                 ; <double> [#uses=1]
  %77 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), double %76, double %74) nounwind ; <i32> [#uses=0]
  %78 = load float* %scevgep.i.i, align 4         ; <float> [#uses=1]
  %79 = fpext float %78 to double                 ; <double> [#uses=1]
  %80 = load float* %scevgep78.i.i, align 16      ; <float> [#uses=1]
  %81 = fpext float %80 to double                 ; <double> [#uses=1]
  %82 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), double %81, double %79) nounwind ; <i32> [#uses=0]
  %83 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i, 8   ; <i1> [#uses=1]
  br i1 %exitcond.i, label %Oscar.exit, label %bb.i.i

Oscar.exit:                                       ; preds = %bb.i.i
  %84 = add nsw i32 %i.01, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %84, 10                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Oscar.exit
  ret i32 0
}
