; ModuleID = 'oourafft.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.timeval = type { i32, i32 }

@.str = private constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1 ; <[45 x i8]*> [#uses=1]
@.str1 = private constant [7 x i8] c"%e %e\0A\00", align 1 ; <[7 x i8]*> [#uses=1]

declare double @fabs(double)

define internal fastcc void @bitrv2(i32 %n, i32* nocapture %ip, double* nocapture %a) nounwind {
entry:
  store i32 0, i32* %ip, align 4
  %0 = icmp sgt i32 %n, 8                         ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb5

bb:                                               ; preds = %bb3, %entry
  %m.012 = phi i32 [ %6, %bb3 ], [ 1, %entry ]    ; <i32> [#uses=5]
  %l.011 = phi i32 [ %1, %bb3 ], [ %n, %entry ]   ; <i32> [#uses=1]
  %1 = ashr i32 %l.011, 1                         ; <i32> [#uses=4]
  %2 = icmp sgt i32 %m.012, 0                     ; <i1> [#uses=1]
  br i1 %2, label %bb1, label %bb3

bb1:                                              ; preds = %bb1, %bb
  %j.09 = phi i32 [ %5, %bb1 ], [ 0, %bb ]        ; <i32> [#uses=3]
  %scevgep115 = getelementptr i32* %ip, i32 %j.09 ; <i32*> [#uses=1]
  %tmp116 = add i32 %j.09, %m.012                 ; <i32> [#uses=1]
  %scevgep117 = getelementptr i32* %ip, i32 %tmp116 ; <i32*> [#uses=1]
  %3 = load i32* %scevgep115, align 4             ; <i32> [#uses=1]
  %4 = add nsw i32 %3, %1                         ; <i32> [#uses=1]
  store i32 %4, i32* %scevgep117, align 4
  %5 = add nsw i32 %j.09, 1                       ; <i32> [#uses=2]
  %exitcond114 = icmp eq i32 %5, %m.012           ; <i1> [#uses=1]
  br i1 %exitcond114, label %bb3, label %bb1

bb3:                                              ; preds = %bb1, %bb
  %6 = shl i32 %m.012, 1                          ; <i32> [#uses=2]
  %7 = shl i32 %m.012, 4                          ; <i32> [#uses=1]
  %8 = icmp slt i32 %7, %1                        ; <i1> [#uses=1]
  br i1 %8, label %bb, label %bb5

bb5:                                              ; preds = %bb3, %entry
  %m.0.lcssa = phi i32 [ 1, %entry ], [ %6, %bb3 ] ; <i32> [#uses=12]
  %l.0.lcssa = phi i32 [ %n, %entry ], [ %1, %bb3 ] ; <i32> [#uses=1]
  %9 = shl i32 %m.0.lcssa, 3                      ; <i32> [#uses=1]
  %10 = icmp eq i32 %9, %l.0.lcssa                ; <i1> [#uses=1]
  br i1 %10, label %bb11.preheader, label %bb17.preheader

bb17.preheader:                                   ; preds = %bb5
  %11 = icmp sgt i32 %m.0.lcssa, 1                ; <i1> [#uses=1]
  br i1 %11, label %bb.nph4, label %return

bb11.preheader:                                   ; preds = %bb5
  %12 = icmp sgt i32 %m.0.lcssa, 0                ; <i1> [#uses=1]
  br i1 %12, label %bb.nph8, label %return

bb8:                                              ; preds = %bb9.preheader, %bb8
  %j.15 = phi i32 [ %47, %bb8 ], [ 0, %bb9.preheader ] ; <i32> [#uses=4]
  %scevgep49 = getelementptr i32* %ip, i32 %j.15  ; <i32*> [#uses=1]
  %tmp50 = shl i32 %j.15, 1                       ; <i32> [#uses=7]
  %tmp53 = add i32 %tmp50, %tmp52125              ; <i32> [#uses=1]
  %tmp56 = add i32 %tmp50, %tmp51                 ; <i32> [#uses=1]
  %tmp61 = add i32 %tmp50, %tmp60124              ; <i32> [#uses=1]
  %tmp64 = add i32 %tmp50, %tmp59                 ; <i32> [#uses=1]
  %tmp69 = add i32 %tmp50, %tmp68123              ; <i32> [#uses=1]
  %tmp50120 = add i32 %j.15, %m.0.lcssa           ; <i32> [#uses=1]
  %tmp72 = shl i32 %tmp50120, 1                   ; <i32> [#uses=1]
  %tmp75119 = or i32 %tmp50, 1                    ; <i32> [#uses=1]
  %13 = load i32* %scevgep81, align 4             ; <i32> [#uses=8]
  %14 = load i32* %scevgep49, align 4             ; <i32> [#uses=8]
  %tmp79 = add i32 %13, %tmp50                    ; <i32> [#uses=1]
  %15 = getelementptr inbounds double* %a, i32 %tmp79 ; <double*> [#uses=2]
  %16 = load double* %15, align 4                 ; <double> [#uses=1]
  %tmp77 = add i32 %13, %tmp75119                 ; <i32> [#uses=1]
  %17 = getelementptr inbounds double* %a, i32 %tmp77 ; <double*> [#uses=2]
  %18 = load double* %17, align 4                 ; <double> [#uses=1]
  %tmp105 = add i32 %14, %tmp82                   ; <i32> [#uses=1]
  %19 = getelementptr inbounds double* %a, i32 %tmp105 ; <double*> [#uses=2]
  %20 = load double* %19, align 4                 ; <double> [#uses=1]
  %tmp103 = add i32 %14, %tmp101121               ; <i32> [#uses=1]
  %21 = getelementptr inbounds double* %a, i32 %tmp103 ; <double*> [#uses=2]
  %22 = load double* %21, align 4                 ; <double> [#uses=1]
  store double %20, double* %15, align 4
  store double %22, double* %17, align 4
  store double %16, double* %19, align 4
  store double %18, double* %21, align 4
  %tmp74 = add i32 %13, %tmp72                    ; <i32> [#uses=1]
  %23 = getelementptr inbounds double* %a, i32 %tmp74 ; <double*> [#uses=2]
  %24 = load double* %23, align 4                 ; <double> [#uses=1]
  %tmp71 = add i32 %13, %tmp69                    ; <i32> [#uses=1]
  %25 = getelementptr inbounds double* %a, i32 %tmp71 ; <double*> [#uses=2]
  %26 = load double* %25, align 4                 ; <double> [#uses=1]
  %tmp100 = add i32 %14, %tmp98                   ; <i32> [#uses=1]
  %27 = getelementptr inbounds double* %a, i32 %tmp100 ; <double*> [#uses=2]
  %28 = load double* %27, align 4                 ; <double> [#uses=1]
  %tmp85 = add i32 %14, %tmp83                    ; <i32> [#uses=1]
  %29 = getelementptr inbounds double* %a, i32 %tmp85 ; <double*> [#uses=2]
  %30 = load double* %29, align 4                 ; <double> [#uses=1]
  store double %28, double* %23, align 4
  store double %30, double* %25, align 4
  store double %24, double* %27, align 4
  store double %26, double* %29, align 4
  %tmp66 = add i32 %13, %tmp64                    ; <i32> [#uses=1]
  %31 = getelementptr inbounds double* %a, i32 %tmp66 ; <double*> [#uses=2]
  %32 = load double* %31, align 4                 ; <double> [#uses=1]
  %tmp63 = add i32 %13, %tmp61                    ; <i32> [#uses=1]
  %33 = getelementptr inbounds double* %a, i32 %tmp63 ; <double*> [#uses=2]
  %34 = load double* %33, align 4                 ; <double> [#uses=1]
  %tmp97 = add i32 %14, %tmp95                    ; <i32> [#uses=1]
  %35 = getelementptr inbounds double* %a, i32 %tmp97 ; <double*> [#uses=2]
  %36 = load double* %35, align 4                 ; <double> [#uses=1]
  %tmp94 = add i32 %14, %tmp92                    ; <i32> [#uses=1]
  %37 = getelementptr inbounds double* %a, i32 %tmp94 ; <double*> [#uses=2]
  %38 = load double* %37, align 4                 ; <double> [#uses=1]
  store double %36, double* %31, align 4
  store double %38, double* %33, align 4
  store double %32, double* %35, align 4
  store double %34, double* %37, align 4
  %tmp58 = add i32 %13, %tmp56                    ; <i32> [#uses=1]
  %39 = getelementptr inbounds double* %a, i32 %tmp58 ; <double*> [#uses=2]
  %40 = load double* %39, align 4                 ; <double> [#uses=1]
  %tmp55 = add i32 %13, %tmp53                    ; <i32> [#uses=1]
  %41 = getelementptr inbounds double* %a, i32 %tmp55 ; <double*> [#uses=2]
  %42 = load double* %41, align 4                 ; <double> [#uses=1]
  %tmp91 = add i32 %14, %tmp89                    ; <i32> [#uses=1]
  %43 = getelementptr inbounds double* %a, i32 %tmp91 ; <double*> [#uses=2]
  %44 = load double* %43, align 4                 ; <double> [#uses=1]
  %tmp88 = add i32 %14, %tmp86                    ; <i32> [#uses=1]
  %45 = getelementptr inbounds double* %a, i32 %tmp88 ; <double*> [#uses=2]
  %46 = load double* %45, align 4                 ; <double> [#uses=1]
  store double %44, double* %39, align 4
  store double %46, double* %41, align 4
  store double %40, double* %43, align 4
  store double %42, double* %45, align 4
  %47 = add nsw i32 %j.15, 1                      ; <i32> [#uses=2]
  %exitcond48 = icmp eq i32 %47, %58              ; <i1> [#uses=1]
  br i1 %exitcond48, label %bb10, label %bb8

bb10:                                             ; preds = %bb9.preheader, %bb8
  %48 = load i32* %scevgep81, align 4             ; <i32> [#uses=4]
  %tmp113 = add i32 %48, %tmp95                   ; <i32> [#uses=1]
  %49 = getelementptr inbounds double* %a, i32 %tmp113 ; <double*> [#uses=2]
  %50 = load double* %49, align 4                 ; <double> [#uses=1]
  %tmp107 = add i32 %48, %tmp92                   ; <i32> [#uses=1]
  %51 = getelementptr inbounds double* %a, i32 %tmp107 ; <double*> [#uses=2]
  %52 = load double* %51, align 4                 ; <double> [#uses=1]
  %tmp111 = add i32 %48, %tmp98                   ; <i32> [#uses=1]
  %53 = getelementptr inbounds double* %a, i32 %tmp111 ; <double*> [#uses=2]
  %54 = load double* %53, align 4                 ; <double> [#uses=1]
  %tmp109 = add i32 %48, %tmp83                   ; <i32> [#uses=1]
  %55 = getelementptr inbounds double* %a, i32 %tmp109 ; <double*> [#uses=2]
  %56 = load double* %55, align 4                 ; <double> [#uses=1]
  store double %54, double* %49, align 4
  store double %56, double* %51, align 4
  store double %50, double* %53, align 4
  store double %52, double* %55, align 4
  %57 = add i32 %58, 1                            ; <i32> [#uses=2]
  %exitcond80 = icmp eq i32 %57, %m.0.lcssa       ; <i1> [#uses=1]
  br i1 %exitcond80, label %return, label %bb9.preheader

bb.nph8:                                          ; preds = %bb11.preheader
  %tmp51 = mul i32 %m.0.lcssa, 6                  ; <i32> [#uses=3]
  %tmp52125 = or i32 %tmp51, 1                    ; <i32> [#uses=2]
  %tmp59 = shl i32 %m.0.lcssa, 2                  ; <i32> [#uses=3]
  %tmp60124 = or i32 %tmp59, 1                    ; <i32> [#uses=2]
  %tmp67 = shl i32 %m.0.lcssa, 1                  ; <i32> [#uses=1]
  %tmp68123 = or i32 %tmp67, 1                    ; <i32> [#uses=2]
  br label %bb9.preheader

bb9.preheader:                                    ; preds = %bb.nph8, %bb10
  %58 = phi i32 [ 0, %bb.nph8 ], [ %57, %bb10 ]   ; <i32> [#uses=6]
  %scevgep81 = getelementptr i32* %ip, i32 %58    ; <i32*> [#uses=2]
  %tmp82 = shl i32 %58, 1                         ; <i32> [#uses=7]
  %tmp83 = add i32 %tmp82, %tmp60124              ; <i32> [#uses=2]
  %tmp86 = add i32 %tmp82, %tmp52125              ; <i32> [#uses=1]
  %tmp89 = add i32 %tmp82, %tmp51                 ; <i32> [#uses=1]
  %tmp92 = add i32 %tmp82, %tmp68123              ; <i32> [#uses=2]
  %tmp82122 = add i32 %58, %m.0.lcssa             ; <i32> [#uses=1]
  %tmp95 = shl i32 %tmp82122, 1                   ; <i32> [#uses=2]
  %tmp98 = add i32 %tmp82, %tmp59                 ; <i32> [#uses=2]
  %tmp101121 = or i32 %tmp82, 1                   ; <i32> [#uses=1]
  %59 = icmp sgt i32 %58, 0                       ; <i1> [#uses=1]
  br i1 %59, label %bb8, label %bb10

bb14:                                             ; preds = %bb15.preheader, %bb14
  %j.22 = phi i32 [ %78, %bb14 ], [ 0, %bb15.preheader ] ; <i32> [#uses=4]
  %scevgep = getelementptr i32* %ip, i32 %j.22    ; <i32*> [#uses=1]
  %tmp16 = shl i32 %j.22, 1                       ; <i32> [#uses=3]
  %tmp19 = add i32 %tmp16, %tmp18128              ; <i32> [#uses=1]
  %tmp16127 = add i32 %j.22, %m.0.lcssa           ; <i32> [#uses=1]
  %tmp22 = shl i32 %tmp16127, 1                   ; <i32> [#uses=1]
  %tmp25126 = or i32 %tmp16, 1                    ; <i32> [#uses=1]
  %60 = load i32* %scevgep33, align 4             ; <i32> [#uses=4]
  %61 = load i32* %scevgep, align 4               ; <i32> [#uses=4]
  %tmp29 = add i32 %60, %tmp16                    ; <i32> [#uses=1]
  %62 = getelementptr inbounds double* %a, i32 %tmp29 ; <double*> [#uses=2]
  %63 = load double* %62, align 4                 ; <double> [#uses=1]
  %tmp27 = add i32 %60, %tmp25126                 ; <i32> [#uses=1]
  %64 = getelementptr inbounds double* %a, i32 %tmp27 ; <double*> [#uses=2]
  %65 = load double* %64, align 4                 ; <double> [#uses=1]
  %tmp47 = add i32 %61, %tmp45                    ; <i32> [#uses=1]
  %66 = getelementptr inbounds double* %a, i32 %tmp47 ; <double*> [#uses=2]
  %67 = load double* %66, align 4                 ; <double> [#uses=1]
  %tmp44 = add i32 %61, %tmp42                    ; <i32> [#uses=1]
  %68 = getelementptr inbounds double* %a, i32 %tmp44 ; <double*> [#uses=2]
  %69 = load double* %68, align 4                 ; <double> [#uses=1]
  store double %67, double* %62, align 4
  store double %69, double* %64, align 4
  store double %63, double* %66, align 4
  store double %65, double* %68, align 4
  %tmp24 = add i32 %60, %tmp22                    ; <i32> [#uses=1]
  %70 = getelementptr inbounds double* %a, i32 %tmp24 ; <double*> [#uses=2]
  %71 = load double* %70, align 4                 ; <double> [#uses=1]
  %tmp21 = add i32 %60, %tmp19                    ; <i32> [#uses=1]
  %72 = getelementptr inbounds double* %a, i32 %tmp21 ; <double*> [#uses=2]
  %73 = load double* %72, align 4                 ; <double> [#uses=1]
  %tmp41 = add i32 %61, %tmp39                    ; <i32> [#uses=1]
  %74 = getelementptr inbounds double* %a, i32 %tmp41 ; <double*> [#uses=2]
  %75 = load double* %74, align 4                 ; <double> [#uses=1]
  %tmp37 = add i32 %61, %tmp35                    ; <i32> [#uses=1]
  %76 = getelementptr inbounds double* %a, i32 %tmp37 ; <double*> [#uses=2]
  %77 = load double* %76, align 4                 ; <double> [#uses=1]
  store double %75, double* %70, align 4
  store double %77, double* %72, align 4
  store double %71, double* %74, align 4
  store double %73, double* %76, align 4
  %78 = add nsw i32 %j.22, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %78, %k.13              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb16, label %bb14

bb16:                                             ; preds = %bb15.preheader, %bb14
  %exitcond31 = icmp eq i32 %k.13, %tmp30         ; <i1> [#uses=1]
  br i1 %exitcond31, label %return, label %bb15.preheader

bb.nph4:                                          ; preds = %bb17.preheader
  %tmp17 = shl i32 %m.0.lcssa, 1                  ; <i32> [#uses=3]
  %tmp18128 = or i32 %tmp17, 1                    ; <i32> [#uses=1]
  %tmp30 = add i32 %m.0.lcssa, -1                 ; <i32> [#uses=1]
  %tmp34 = add i32 %tmp17, 3                      ; <i32> [#uses=1]
  %tmp38 = add i32 %tmp17, 2                      ; <i32> [#uses=1]
  br label %bb15.preheader

bb15.preheader:                                   ; preds = %bb.nph4, %bb16
  %indvar = phi i32 [ 0, %bb.nph4 ], [ %k.13, %bb16 ] ; <i32> [#uses=2]
  %k.13 = add i32 %indvar, 1                      ; <i32> [#uses=5]
  %scevgep33 = getelementptr i32* %ip, i32 %k.13  ; <i32*> [#uses=1]
  %tmp = shl i32 %indvar, 1                       ; <i32> [#uses=4]
  %tmp35 = add i32 %tmp, %tmp34                   ; <i32> [#uses=1]
  %tmp39 = add i32 %tmp, %tmp38                   ; <i32> [#uses=1]
  %tmp42 = add i32 %tmp, 3                        ; <i32> [#uses=1]
  %tmp45 = add i32 %tmp, 2                        ; <i32> [#uses=1]
  %79 = icmp sgt i32 %k.13, 0                     ; <i1> [#uses=1]
  br i1 %79, label %bb14, label %bb16

return:                                           ; preds = %bb16, %bb10, %bb11.preheader, %bb17.preheader
  ret void
}

define internal fastcc void @cft1st(double* nocapture %a, double* nocapture %w) nounwind {
entry:
  %0 = load double* %a, align 4                   ; <double> [#uses=2]
  %1 = getelementptr inbounds double* %a, i32 2   ; <double*> [#uses=2]
  %2 = load double* %1, align 4                   ; <double> [#uses=2]
  %3 = fadd double %0, %2                         ; <double> [#uses=2]
  %4 = getelementptr inbounds double* %a, i32 1   ; <double*> [#uses=2]
  %5 = load double* %4, align 4                   ; <double> [#uses=2]
  %6 = getelementptr inbounds double* %a, i32 3   ; <double*> [#uses=2]
  %7 = load double* %6, align 4                   ; <double> [#uses=2]
  %8 = fadd double %5, %7                         ; <double> [#uses=2]
  %9 = fsub double %0, %2                         ; <double> [#uses=2]
  %10 = fsub double %5, %7                        ; <double> [#uses=2]
  %11 = getelementptr inbounds double* %a, i32 4  ; <double*> [#uses=2]
  %12 = load double* %11, align 4                 ; <double> [#uses=2]
  %13 = getelementptr inbounds double* %a, i32 6  ; <double*> [#uses=2]
  %14 = load double* %13, align 4                 ; <double> [#uses=2]
  %15 = fadd double %12, %14                      ; <double> [#uses=2]
  %16 = getelementptr inbounds double* %a, i32 5  ; <double*> [#uses=2]
  %17 = load double* %16, align 4                 ; <double> [#uses=2]
  %18 = getelementptr inbounds double* %a, i32 7  ; <double*> [#uses=2]
  %19 = load double* %18, align 4                 ; <double> [#uses=2]
  %20 = fadd double %17, %19                      ; <double> [#uses=2]
  %21 = fsub double %12, %14                      ; <double> [#uses=2]
  %22 = fsub double %17, %19                      ; <double> [#uses=2]
  %23 = fadd double %3, %15                       ; <double> [#uses=1]
  store double %23, double* %a, align 4
  %24 = fadd double %8, %20                       ; <double> [#uses=1]
  store double %24, double* %4, align 4
  %25 = fsub double %3, %15                       ; <double> [#uses=1]
  store double %25, double* %11, align 4
  %26 = fsub double %8, %20                       ; <double> [#uses=1]
  store double %26, double* %16, align 4
  %27 = fsub double %9, %22                       ; <double> [#uses=1]
  store double %27, double* %1, align 4
  %28 = fadd double %10, %21                      ; <double> [#uses=1]
  store double %28, double* %6, align 4
  %29 = fadd double %9, %22                       ; <double> [#uses=1]
  store double %29, double* %13, align 4
  %30 = fsub double %10, %21                      ; <double> [#uses=1]
  store double %30, double* %18, align 4
  %31 = getelementptr inbounds double* %w, i32 2  ; <double*> [#uses=1]
  %32 = load double* %31, align 4                 ; <double> [#uses=4]
  %33 = getelementptr inbounds double* %a, i32 8  ; <double*> [#uses=2]
  %34 = load double* %33, align 4                 ; <double> [#uses=2]
  %35 = getelementptr inbounds double* %a, i32 10 ; <double*> [#uses=2]
  %36 = load double* %35, align 4                 ; <double> [#uses=2]
  %37 = fadd double %34, %36                      ; <double> [#uses=2]
  %38 = getelementptr inbounds double* %a, i32 9  ; <double*> [#uses=2]
  %39 = load double* %38, align 4                 ; <double> [#uses=2]
  %40 = getelementptr inbounds double* %a, i32 11 ; <double*> [#uses=2]
  %41 = load double* %40, align 4                 ; <double> [#uses=2]
  %42 = fadd double %39, %41                      ; <double> [#uses=2]
  %43 = fsub double %34, %36                      ; <double> [#uses=2]
  %44 = fsub double %39, %41                      ; <double> [#uses=2]
  %45 = getelementptr inbounds double* %a, i32 12 ; <double*> [#uses=2]
  %46 = load double* %45, align 4                 ; <double> [#uses=2]
  %47 = getelementptr inbounds double* %a, i32 14 ; <double*> [#uses=2]
  %48 = load double* %47, align 4                 ; <double> [#uses=2]
  %49 = fadd double %46, %48                      ; <double> [#uses=2]
  %50 = getelementptr inbounds double* %a, i32 13 ; <double*> [#uses=2]
  %51 = load double* %50, align 4                 ; <double> [#uses=2]
  %52 = getelementptr inbounds double* %a, i32 15 ; <double*> [#uses=2]
  %53 = load double* %52, align 4                 ; <double> [#uses=2]
  %54 = fadd double %51, %53                      ; <double> [#uses=2]
  %55 = fsub double %46, %48                      ; <double> [#uses=2]
  %56 = fsub double %51, %53                      ; <double> [#uses=2]
  %57 = fadd double %37, %49                      ; <double> [#uses=1]
  store double %57, double* %33, align 4
  %58 = fadd double %42, %54                      ; <double> [#uses=1]
  store double %58, double* %38, align 4
  %59 = fsub double %54, %42                      ; <double> [#uses=1]
  store double %59, double* %45, align 4
  %60 = fsub double %37, %49                      ; <double> [#uses=1]
  store double %60, double* %50, align 4
  %61 = fsub double %43, %56                      ; <double> [#uses=2]
  %62 = fadd double %44, %55                      ; <double> [#uses=2]
  %63 = fsub double %61, %62                      ; <double> [#uses=1]
  %64 = fmul double %63, %32                      ; <double> [#uses=1]
  store double %64, double* %35, align 4
  %65 = fadd double %61, %62                      ; <double> [#uses=1]
  %66 = fmul double %65, %32                      ; <double> [#uses=1]
  store double %66, double* %40, align 4
  %67 = fadd double %56, %43                      ; <double> [#uses=2]
  %68 = fsub double %55, %44                      ; <double> [#uses=2]
  %69 = fsub double %68, %67                      ; <double> [#uses=1]
  %70 = fmul double %69, %32                      ; <double> [#uses=1]
  store double %70, double* %47, align 4
  %71 = fadd double %68, %67                      ; <double> [#uses=1]
  %72 = fmul double %71, %32                      ; <double> [#uses=1]
  store double %72, double* %52, align 4
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb ] ; <i32> [#uses=4]
  %tmp = shl i32 %indvar, 4                       ; <i32> [#uses=17]
  %tmp3 = add i32 %tmp, 16                        ; <i32> [#uses=1]
  %scevgep = getelementptr double* %a, i32 %tmp3  ; <double*> [#uses=2]
  %tmp4 = add i32 %tmp, 18                        ; <i32> [#uses=1]
  %scevgep5 = getelementptr double* %a, i32 %tmp4 ; <double*> [#uses=2]
  %tmp6 = add i32 %tmp, 17                        ; <i32> [#uses=1]
  %scevgep7 = getelementptr double* %a, i32 %tmp6 ; <double*> [#uses=2]
  %tmp8 = add i32 %tmp, 19                        ; <i32> [#uses=1]
  %scevgep9 = getelementptr double* %a, i32 %tmp8 ; <double*> [#uses=2]
  %tmp10 = add i32 %tmp, 20                       ; <i32> [#uses=1]
  %scevgep11 = getelementptr double* %a, i32 %tmp10 ; <double*> [#uses=2]
  %tmp12 = add i32 %tmp, 22                       ; <i32> [#uses=1]
  %scevgep13 = getelementptr double* %a, i32 %tmp12 ; <double*> [#uses=2]
  %tmp14 = add i32 %tmp, 21                       ; <i32> [#uses=1]
  %scevgep15 = getelementptr double* %a, i32 %tmp14 ; <double*> [#uses=2]
  %tmp16 = add i32 %tmp, 23                       ; <i32> [#uses=1]
  %scevgep17 = getelementptr double* %a, i32 %tmp16 ; <double*> [#uses=2]
  %tmp18 = add i32 %tmp, 24                       ; <i32> [#uses=1]
  %scevgep19 = getelementptr double* %a, i32 %tmp18 ; <double*> [#uses=2]
  %tmp20 = add i32 %tmp, 26                       ; <i32> [#uses=1]
  %scevgep21 = getelementptr double* %a, i32 %tmp20 ; <double*> [#uses=2]
  %tmp22 = add i32 %tmp, 25                       ; <i32> [#uses=1]
  %scevgep23 = getelementptr double* %a, i32 %tmp22 ; <double*> [#uses=2]
  %tmp24 = add i32 %tmp, 27                       ; <i32> [#uses=1]
  %scevgep25 = getelementptr double* %a, i32 %tmp24 ; <double*> [#uses=2]
  %tmp26 = add i32 %tmp, 28                       ; <i32> [#uses=1]
  %scevgep27 = getelementptr double* %a, i32 %tmp26 ; <double*> [#uses=2]
  %tmp28 = add i32 %tmp, 30                       ; <i32> [#uses=1]
  %scevgep29 = getelementptr double* %a, i32 %tmp28 ; <double*> [#uses=2]
  %tmp30 = add i32 %tmp, 29                       ; <i32> [#uses=1]
  %scevgep31 = getelementptr double* %a, i32 %tmp30 ; <double*> [#uses=2]
  %tmp32 = add i32 %tmp, 31                       ; <i32> [#uses=1]
  %scevgep33 = getelementptr double* %a, i32 %tmp32 ; <double*> [#uses=2]
  %tmp35 = shl i32 %indvar, 1                     ; <i32> [#uses=2]
  %tmp36 = add i32 %tmp35, 2                      ; <i32> [#uses=1]
  %scevgep37 = getelementptr double* %w, i32 %tmp36 ; <double*> [#uses=1]
  %tmp38 = add i32 %tmp35, 3                      ; <i32> [#uses=1]
  %scevgep39 = getelementptr double* %w, i32 %tmp38 ; <double*> [#uses=1]
  %tmp40 = shl i32 %indvar, 2                     ; <i32> [#uses=4]
  %tmp41 = add i32 %tmp40, 7                      ; <i32> [#uses=1]
  %scevgep42 = getelementptr double* %w, i32 %tmp41 ; <double*> [#uses=1]
  %tmp43 = add i32 %tmp40, 6                      ; <i32> [#uses=1]
  %scevgep44 = getelementptr double* %w, i32 %tmp43 ; <double*> [#uses=1]
  %tmp45 = add i32 %tmp40, 5                      ; <i32> [#uses=1]
  %scevgep46 = getelementptr double* %w, i32 %tmp45 ; <double*> [#uses=1]
  %tmp47 = add i32 %tmp40, 4                      ; <i32> [#uses=1]
  %scevgep48 = getelementptr double* %w, i32 %tmp47 ; <double*> [#uses=1]
  %73 = load double* %scevgep37, align 4          ; <double> [#uses=6]
  %74 = load double* %scevgep39, align 4          ; <double> [#uses=5]
  %75 = load double* %scevgep48, align 4          ; <double> [#uses=4]
  %76 = load double* %scevgep46, align 4          ; <double> [#uses=4]
  %77 = fmul double %74, -2.000000e+00            ; <double> [#uses=1]
  %78 = fmul double %77, %76                      ; <double> [#uses=1]
  %79 = fadd double %78, %75                      ; <double> [#uses=2]
  %80 = fmul double %74, 2.000000e+00             ; <double> [#uses=1]
  %81 = fmul double %80, %75                      ; <double> [#uses=1]
  %82 = fsub double %81, %76                      ; <double> [#uses=2]
  %83 = load double* %scevgep, align 4            ; <double> [#uses=2]
  %84 = load double* %scevgep5, align 4           ; <double> [#uses=2]
  %85 = fadd double %83, %84                      ; <double> [#uses=2]
  %86 = load double* %scevgep7, align 4           ; <double> [#uses=2]
  %87 = load double* %scevgep9, align 4           ; <double> [#uses=2]
  %88 = fadd double %86, %87                      ; <double> [#uses=2]
  %89 = fsub double %83, %84                      ; <double> [#uses=2]
  %90 = fsub double %86, %87                      ; <double> [#uses=2]
  %91 = load double* %scevgep11, align 4          ; <double> [#uses=2]
  %92 = load double* %scevgep13, align 4          ; <double> [#uses=2]
  %93 = fadd double %91, %92                      ; <double> [#uses=2]
  %94 = load double* %scevgep15, align 4          ; <double> [#uses=2]
  %95 = load double* %scevgep17, align 4          ; <double> [#uses=2]
  %96 = fadd double %94, %95                      ; <double> [#uses=2]
  %97 = fsub double %91, %92                      ; <double> [#uses=2]
  %98 = fsub double %94, %95                      ; <double> [#uses=2]
  %99 = fadd double %85, %93                      ; <double> [#uses=1]
  store double %99, double* %scevgep, align 4
  %100 = fadd double %88, %96                     ; <double> [#uses=1]
  store double %100, double* %scevgep7, align 4
  %101 = fsub double %85, %93                     ; <double> [#uses=2]
  %102 = fsub double %88, %96                     ; <double> [#uses=2]
  %103 = fmul double %73, %101                    ; <double> [#uses=1]
  %104 = fmul double %74, %102                    ; <double> [#uses=1]
  %105 = fsub double %103, %104                   ; <double> [#uses=1]
  store double %105, double* %scevgep11, align 4
  %106 = fmul double %73, %102                    ; <double> [#uses=1]
  %107 = fmul double %74, %101                    ; <double> [#uses=1]
  %108 = fadd double %106, %107                   ; <double> [#uses=1]
  store double %108, double* %scevgep15, align 4
  %109 = fsub double %89, %98                     ; <double> [#uses=2]
  %110 = fadd double %90, %97                     ; <double> [#uses=2]
  %111 = fmul double %75, %109                    ; <double> [#uses=1]
  %112 = fmul double %76, %110                    ; <double> [#uses=1]
  %113 = fsub double %111, %112                   ; <double> [#uses=1]
  store double %113, double* %scevgep5, align 4
  %114 = fmul double %75, %110                    ; <double> [#uses=1]
  %115 = fmul double %76, %109                    ; <double> [#uses=1]
  %116 = fadd double %114, %115                   ; <double> [#uses=1]
  store double %116, double* %scevgep9, align 4
  %117 = fadd double %89, %98                     ; <double> [#uses=2]
  %118 = fsub double %90, %97                     ; <double> [#uses=2]
  %119 = fmul double %79, %117                    ; <double> [#uses=1]
  %120 = fmul double %82, %118                    ; <double> [#uses=1]
  %121 = fsub double %119, %120                   ; <double> [#uses=1]
  store double %121, double* %scevgep13, align 4
  %122 = fmul double %79, %118                    ; <double> [#uses=1]
  %123 = fmul double %82, %117                    ; <double> [#uses=1]
  %124 = fadd double %122, %123                   ; <double> [#uses=1]
  store double %124, double* %scevgep17, align 4
  %125 = load double* %scevgep44, align 4         ; <double> [#uses=4]
  %126 = load double* %scevgep42, align 4         ; <double> [#uses=4]
  %127 = fmul double %73, -2.000000e+00           ; <double> [#uses=1]
  %128 = fmul double %127, %126                   ; <double> [#uses=1]
  %129 = fadd double %128, %125                   ; <double> [#uses=2]
  %130 = fmul double %73, 2.000000e+00            ; <double> [#uses=1]
  %131 = fmul double %130, %125                   ; <double> [#uses=1]
  %132 = fsub double %131, %126                   ; <double> [#uses=2]
  %133 = load double* %scevgep19, align 4         ; <double> [#uses=2]
  %134 = load double* %scevgep21, align 4         ; <double> [#uses=2]
  %135 = fadd double %133, %134                   ; <double> [#uses=2]
  %136 = load double* %scevgep23, align 4         ; <double> [#uses=2]
  %137 = load double* %scevgep25, align 4         ; <double> [#uses=2]
  %138 = fadd double %136, %137                   ; <double> [#uses=2]
  %139 = fsub double %133, %134                   ; <double> [#uses=2]
  %140 = fsub double %136, %137                   ; <double> [#uses=2]
  %141 = load double* %scevgep27, align 4         ; <double> [#uses=2]
  %142 = load double* %scevgep29, align 4         ; <double> [#uses=2]
  %143 = fadd double %141, %142                   ; <double> [#uses=2]
  %144 = load double* %scevgep31, align 4         ; <double> [#uses=2]
  %145 = load double* %scevgep33, align 4         ; <double> [#uses=2]
  %146 = fadd double %144, %145                   ; <double> [#uses=2]
  %147 = fsub double %141, %142                   ; <double> [#uses=2]
  %148 = fsub double %144, %145                   ; <double> [#uses=2]
  %149 = fadd double %135, %143                   ; <double> [#uses=1]
  store double %149, double* %scevgep19, align 4
  %150 = fadd double %138, %146                   ; <double> [#uses=1]
  store double %150, double* %scevgep23, align 4
  %151 = fsub double %135, %143                   ; <double> [#uses=2]
  %152 = fsub double %138, %146                   ; <double> [#uses=2]
  %153 = fsub double -0.000000e+00, %74           ; <double> [#uses=2]
  %154 = fmul double %151, %153                   ; <double> [#uses=1]
  %155 = fmul double %73, %152                    ; <double> [#uses=1]
  %156 = fsub double %154, %155                   ; <double> [#uses=1]
  store double %156, double* %scevgep27, align 4
  %157 = fmul double %152, %153                   ; <double> [#uses=1]
  %158 = fmul double %73, %151                    ; <double> [#uses=1]
  %159 = fadd double %157, %158                   ; <double> [#uses=1]
  store double %159, double* %scevgep31, align 4
  %160 = fsub double %139, %148                   ; <double> [#uses=2]
  %161 = fadd double %140, %147                   ; <double> [#uses=2]
  %162 = fmul double %125, %160                   ; <double> [#uses=1]
  %163 = fmul double %126, %161                   ; <double> [#uses=1]
  %164 = fsub double %162, %163                   ; <double> [#uses=1]
  store double %164, double* %scevgep21, align 4
  %165 = fmul double %125, %161                   ; <double> [#uses=1]
  %166 = fmul double %126, %160                   ; <double> [#uses=1]
  %167 = fadd double %165, %166                   ; <double> [#uses=1]
  store double %167, double* %scevgep25, align 4
  %168 = fadd double %139, %148                   ; <double> [#uses=2]
  %169 = fsub double %140, %147                   ; <double> [#uses=2]
  %170 = fmul double %129, %168                   ; <double> [#uses=1]
  %171 = fmul double %132, %169                   ; <double> [#uses=1]
  %172 = fsub double %170, %171                   ; <double> [#uses=1]
  store double %172, double* %scevgep29, align 4
  %173 = fmul double %129, %169                   ; <double> [#uses=1]
  %174 = fmul double %132, %168                   ; <double> [#uses=1]
  %175 = fadd double %173, %174                   ; <double> [#uses=1]
  store double %175, double* %scevgep33, align 4
  %tmp34 = add i32 %tmp, 32                       ; <i32> [#uses=1]
  %176 = icmp slt i32 %tmp34, 2048                ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %176, label %bb, label %return

return:                                           ; preds = %bb
  ret void
}

define internal fastcc void @cftmdl(i32 %l, double* nocapture %a, double* nocapture %w) nounwind {
entry:
  %0 = shl i32 %l, 2                              ; <i32> [#uses=5]
  %1 = icmp sgt i32 %l, 0                         ; <i1> [#uses=1]
  br i1 %1, label %bb.nph13, label %bb2

bb.nph13:                                         ; preds = %entry
  %tmp179 = add i32 %l, 1                         ; <i32> [#uses=1]
  %tmp182 = shl i32 %l, 1                         ; <i32> [#uses=1]
  %tmp183201 = or i32 %tmp182, 1                  ; <i32> [#uses=1]
  %tmp186 = mul i32 %l, 3                         ; <i32> [#uses=2]
  %tmp187 = add i32 %tmp186, 1                    ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb, %bb.nph13
  %indvar175 = phi i32 [ 0, %bb.nph13 ], [ %indvar.next176, %bb ] ; <i32> [#uses=3]
  %tmp177 = shl i32 %indvar175, 1                 ; <i32> [#uses=8]
  %scevgep178 = getelementptr double* %a, i32 %tmp177 ; <double*> [#uses=2]
  %tmp180 = add i32 %tmp177, %tmp179              ; <i32> [#uses=1]
  %scevgep181 = getelementptr double* %a, i32 %tmp180 ; <double*> [#uses=2]
  %tmp184 = add i32 %tmp177, %tmp183201           ; <i32> [#uses=1]
  %scevgep185 = getelementptr double* %a, i32 %tmp184 ; <double*> [#uses=2]
  %tmp188 = add i32 %tmp177, %tmp187              ; <i32> [#uses=1]
  %scevgep189 = getelementptr double* %a, i32 %tmp188 ; <double*> [#uses=2]
  %tmp190 = add i32 %tmp177, %tmp186              ; <i32> [#uses=1]
  %scevgep191 = getelementptr double* %a, i32 %tmp190 ; <double*> [#uses=2]
  %tmp177200 = add i32 %indvar175, %l             ; <i32> [#uses=1]
  %tmp192 = shl i32 %tmp177200, 1                 ; <i32> [#uses=1]
  %scevgep193 = getelementptr double* %a, i32 %tmp192 ; <double*> [#uses=2]
  %tmp194 = add i32 %tmp177, %l                   ; <i32> [#uses=1]
  %scevgep195 = getelementptr double* %a, i32 %tmp194 ; <double*> [#uses=2]
  %tmp196199 = or i32 %tmp177, 1                  ; <i32> [#uses=1]
  %scevgep197 = getelementptr double* %a, i32 %tmp196199 ; <double*> [#uses=2]
  %2 = load double* %scevgep178, align 4          ; <double> [#uses=2]
  %3 = load double* %scevgep195, align 4          ; <double> [#uses=2]
  %4 = fadd double %2, %3                         ; <double> [#uses=2]
  %5 = load double* %scevgep197, align 4          ; <double> [#uses=2]
  %6 = load double* %scevgep181, align 4          ; <double> [#uses=2]
  %7 = fadd double %5, %6                         ; <double> [#uses=2]
  %8 = fsub double %2, %3                         ; <double> [#uses=2]
  %9 = fsub double %5, %6                         ; <double> [#uses=2]
  %10 = load double* %scevgep193, align 4         ; <double> [#uses=2]
  %11 = load double* %scevgep191, align 4         ; <double> [#uses=2]
  %12 = fadd double %10, %11                      ; <double> [#uses=2]
  %13 = load double* %scevgep185, align 4         ; <double> [#uses=2]
  %14 = load double* %scevgep189, align 4         ; <double> [#uses=2]
  %15 = fadd double %13, %14                      ; <double> [#uses=2]
  %16 = fsub double %10, %11                      ; <double> [#uses=2]
  %17 = fsub double %13, %14                      ; <double> [#uses=2]
  %18 = fadd double %4, %12                       ; <double> [#uses=1]
  store double %18, double* %scevgep178, align 4
  %19 = fadd double %7, %15                       ; <double> [#uses=1]
  store double %19, double* %scevgep197, align 4
  %20 = fsub double %4, %12                       ; <double> [#uses=1]
  store double %20, double* %scevgep193, align 4
  %21 = fsub double %7, %15                       ; <double> [#uses=1]
  store double %21, double* %scevgep185, align 4
  %22 = fsub double %8, %17                       ; <double> [#uses=1]
  store double %22, double* %scevgep195, align 4
  %23 = fadd double %9, %16                       ; <double> [#uses=1]
  store double %23, double* %scevgep181, align 4
  %24 = fadd double %8, %17                       ; <double> [#uses=1]
  store double %24, double* %scevgep191, align 4
  %25 = fsub double %9, %16                       ; <double> [#uses=1]
  store double %25, double* %scevgep189, align 4
  %tmp198 = add i32 %tmp177, 2                    ; <i32> [#uses=1]
  %26 = icmp slt i32 %tmp198, %l                  ; <i1> [#uses=1]
  %indvar.next176 = add i32 %indvar175, 1         ; <i32> [#uses=1]
  br i1 %26, label %bb, label %bb2

bb2:                                              ; preds = %bb, %entry
  %27 = getelementptr inbounds double* %w, i32 2  ; <double*> [#uses=1]
  %28 = load double* %27, align 4                 ; <double> [#uses=4]
  %29 = add nsw i32 %0, %l                        ; <i32> [#uses=2]
  %30 = icmp sgt i32 %29, %0                      ; <i1> [#uses=1]
  br i1 %30, label %bb.nph11, label %bb5

bb.nph11:                                         ; preds = %bb2
  %tmp152 = mul i32 %l, 5                         ; <i32> [#uses=2]
  %tmp153 = add i32 %tmp152, 1                    ; <i32> [#uses=1]
  %tmp156 = mul i32 %l, 6                         ; <i32> [#uses=2]
  %tmp157204 = or i32 %tmp156, 1                  ; <i32> [#uses=1]
  %tmp160 = mul i32 %l, 7                         ; <i32> [#uses=2]
  %tmp161 = add i32 %tmp160, 1                    ; <i32> [#uses=1]
  %tmp170203 = or i32 %0, 1                       ; <i32> [#uses=1]
  %tmp173202 = or i32 %0, 2                       ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb3, %bb.nph11
  %indvar146 = phi i32 [ 0, %bb.nph11 ], [ %indvar.next147, %bb3 ] ; <i32> [#uses=2]
  %tmp148 = shl i32 %indvar146, 1                 ; <i32> [#uses=9]
  %tmp150 = add i32 %tmp148, %0                   ; <i32> [#uses=1]
  %scevgep151 = getelementptr double* %a, i32 %tmp150 ; <double*> [#uses=2]
  %tmp154 = add i32 %tmp148, %tmp153              ; <i32> [#uses=1]
  %scevgep155 = getelementptr double* %a, i32 %tmp154 ; <double*> [#uses=2]
  %tmp158 = add i32 %tmp148, %tmp157204           ; <i32> [#uses=1]
  %scevgep159 = getelementptr double* %a, i32 %tmp158 ; <double*> [#uses=2]
  %tmp162 = add i32 %tmp148, %tmp161              ; <i32> [#uses=1]
  %scevgep163 = getelementptr double* %a, i32 %tmp162 ; <double*> [#uses=2]
  %tmp164 = add i32 %tmp148, %tmp160              ; <i32> [#uses=1]
  %scevgep165 = getelementptr double* %a, i32 %tmp164 ; <double*> [#uses=2]
  %tmp166 = add i32 %tmp148, %tmp156              ; <i32> [#uses=1]
  %scevgep167 = getelementptr double* %a, i32 %tmp166 ; <double*> [#uses=2]
  %tmp168 = add i32 %tmp148, %tmp152              ; <i32> [#uses=1]
  %scevgep169 = getelementptr double* %a, i32 %tmp168 ; <double*> [#uses=2]
  %tmp171 = add i32 %tmp148, %tmp170203           ; <i32> [#uses=1]
  %scevgep172 = getelementptr double* %a, i32 %tmp171 ; <double*> [#uses=2]
  %31 = load double* %scevgep151, align 4         ; <double> [#uses=2]
  %32 = load double* %scevgep169, align 4         ; <double> [#uses=2]
  %33 = fadd double %31, %32                      ; <double> [#uses=2]
  %34 = load double* %scevgep172, align 4         ; <double> [#uses=2]
  %35 = load double* %scevgep155, align 4         ; <double> [#uses=2]
  %36 = fadd double %34, %35                      ; <double> [#uses=2]
  %37 = fsub double %31, %32                      ; <double> [#uses=2]
  %38 = fsub double %34, %35                      ; <double> [#uses=2]
  %39 = load double* %scevgep167, align 4         ; <double> [#uses=2]
  %40 = load double* %scevgep165, align 4         ; <double> [#uses=2]
  %41 = fadd double %39, %40                      ; <double> [#uses=2]
  %42 = load double* %scevgep159, align 4         ; <double> [#uses=2]
  %43 = load double* %scevgep163, align 4         ; <double> [#uses=2]
  %44 = fadd double %42, %43                      ; <double> [#uses=2]
  %45 = fsub double %39, %40                      ; <double> [#uses=2]
  %46 = fsub double %42, %43                      ; <double> [#uses=2]
  %47 = fadd double %33, %41                      ; <double> [#uses=1]
  store double %47, double* %scevgep151, align 4
  %48 = fadd double %36, %44                      ; <double> [#uses=1]
  store double %48, double* %scevgep172, align 4
  %49 = fsub double %44, %36                      ; <double> [#uses=1]
  store double %49, double* %scevgep167, align 4
  %50 = fsub double %33, %41                      ; <double> [#uses=1]
  store double %50, double* %scevgep159, align 4
  %51 = fsub double %37, %46                      ; <double> [#uses=2]
  %52 = fadd double %38, %45                      ; <double> [#uses=2]
  %53 = fsub double %51, %52                      ; <double> [#uses=1]
  %54 = fmul double %53, %28                      ; <double> [#uses=1]
  store double %54, double* %scevgep169, align 4
  %55 = fadd double %51, %52                      ; <double> [#uses=1]
  %56 = fmul double %55, %28                      ; <double> [#uses=1]
  store double %56, double* %scevgep155, align 4
  %57 = fadd double %46, %37                      ; <double> [#uses=2]
  %58 = fsub double %45, %38                      ; <double> [#uses=2]
  %59 = fsub double %58, %57                      ; <double> [#uses=1]
  %60 = fmul double %59, %28                      ; <double> [#uses=1]
  store double %60, double* %scevgep165, align 4
  %61 = fadd double %58, %57                      ; <double> [#uses=1]
  %62 = fmul double %61, %28                      ; <double> [#uses=1]
  store double %62, double* %scevgep163, align 4
  %tmp174 = add i32 %tmp148, %tmp173202           ; <i32> [#uses=1]
  %63 = icmp sgt i32 %29, %tmp174                 ; <i1> [#uses=1]
  %indvar.next147 = add i32 %indvar146, 1         ; <i32> [#uses=1]
  br i1 %63, label %bb3, label %bb5

bb5:                                              ; preds = %bb3, %bb2
  %64 = shl i32 %l, 3                             ; <i32> [#uses=3]
  %65 = icmp slt i32 %64, 2048                    ; <i1> [#uses=1]
  br i1 %65, label %bb.nph9, label %return

bb.nph9:                                          ; preds = %bb5
  %tmp94 = mul i32 %l, 12                         ; <i32> [#uses=3]
  %tmp95211 = or i32 %tmp94, 1                    ; <i32> [#uses=1]
  %tmp97 = mul i32 %l, 13                         ; <i32> [#uses=2]
  %tmp99 = mul i32 %l, 14                         ; <i32> [#uses=2]
  %tmp101 = mul i32 %l, 15                        ; <i32> [#uses=2]
  %tmp103 = add i32 %tmp101, 1                    ; <i32> [#uses=1]
  %tmp105210 = or i32 %tmp99, 1                   ; <i32> [#uses=1]
  %tmp107 = add i32 %tmp97, 1                     ; <i32> [#uses=1]
  %tmp110209 = or i32 %tmp94, 2                   ; <i32> [#uses=1]
  %tmp113208 = or i32 %64, 2                      ; <i32> [#uses=1]
  %tmp115207 = or i32 %64, 1                      ; <i32> [#uses=1]
  %tmp117 = mul i32 %l, 9                         ; <i32> [#uses=2]
  %tmp119 = mul i32 %l, 10                        ; <i32> [#uses=2]
  %tmp121 = mul i32 %l, 11                        ; <i32> [#uses=2]
  %tmp123 = add i32 %tmp121, 1                    ; <i32> [#uses=1]
  %tmp125206 = or i32 %tmp119, 1                  ; <i32> [#uses=1]
  %tmp127 = add i32 %tmp117, 1                    ; <i32> [#uses=1]
  %tmp130 = shl i32 %l, 4                         ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb12, %bb.nph9
  %indvar14 = phi i32 [ 0, %bb.nph9 ], [ %indvar.next15, %bb12 ] ; <i32> [#uses=4]
  %tmp92 = mul i32 %indvar14, %l                  ; <i32> [#uses=2]
  %tmp93 = shl i32 %tmp92, 3                      ; <i32> [#uses=18]
  %tmp89 = add i32 %tmp93, %tmp95211              ; <i32> [#uses=1]
  %tmp85 = add i32 %tmp93, %tmp97                 ; <i32> [#uses=3]
  %tmp82 = add i32 %tmp93, %tmp99                 ; <i32> [#uses=1]
  %tmp79 = add i32 %tmp93, %tmp101                ; <i32> [#uses=1]
  %tmp76 = add i32 %tmp93, %tmp103                ; <i32> [#uses=1]
  %tmp71 = add i32 %tmp93, %tmp105210             ; <i32> [#uses=1]
  %tmp66 = add i32 %tmp93, %tmp107                ; <i32> [#uses=1]
  %j.34 = add i32 %tmp93, %tmp94                  ; <i32> [#uses=2]
  %tmp59 = add i32 %tmp93, %tmp110209             ; <i32> [#uses=1]
  %tmp50 = add i32 %tmp93, %tmp113208             ; <i32> [#uses=1]
  %tmp46 = add i32 %tmp93, %tmp115207             ; <i32> [#uses=1]
  %tmp42 = add i32 %tmp93, %tmp117                ; <i32> [#uses=3]
  %tmp39 = add i32 %tmp93, %tmp119                ; <i32> [#uses=1]
  %tmp36 = add i32 %tmp93, %tmp121                ; <i32> [#uses=1]
  %tmp33 = add i32 %tmp93, %tmp123                ; <i32> [#uses=1]
  %tmp28 = add i32 %tmp93, %tmp125206             ; <i32> [#uses=1]
  %tmp23 = add i32 %tmp93, %tmp127                ; <i32> [#uses=1]
  %tmp93205 = add i32 %tmp92, %l                  ; <i32> [#uses=1]
  %k.08 = shl i32 %tmp93205, 3                    ; <i32> [#uses=2]
  %tmp131 = add i32 %tmp93, %tmp130               ; <i32> [#uses=1]
  %tmp132 = shl i32 %indvar14, 2                  ; <i32> [#uses=4]
  %tmp133 = add i32 %tmp132, 7                    ; <i32> [#uses=1]
  %scevgep134 = getelementptr double* %w, i32 %tmp133 ; <double*> [#uses=1]
  %tmp135 = add i32 %tmp132, 6                    ; <i32> [#uses=1]
  %scevgep136 = getelementptr double* %w, i32 %tmp135 ; <double*> [#uses=1]
  %tmp137 = add i32 %tmp132, 5                    ; <i32> [#uses=1]
  %scevgep138 = getelementptr double* %w, i32 %tmp137 ; <double*> [#uses=1]
  %tmp139 = add i32 %tmp132, 4                    ; <i32> [#uses=1]
  %scevgep140 = getelementptr double* %w, i32 %tmp139 ; <double*> [#uses=1]
  %tmp141 = shl i32 %indvar14, 1                  ; <i32> [#uses=2]
  %tmp142 = add i32 %tmp141, 2                    ; <i32> [#uses=1]
  %scevgep143 = getelementptr double* %w, i32 %tmp142 ; <double*> [#uses=1]
  %tmp144 = add i32 %tmp141, 3                    ; <i32> [#uses=1]
  %scevgep145 = getelementptr double* %w, i32 %tmp144 ; <double*> [#uses=1]
  %66 = load double* %scevgep143, align 4         ; <double> [#uses=6]
  %67 = load double* %scevgep145, align 4         ; <double> [#uses=5]
  %68 = load double* %scevgep140, align 4         ; <double> [#uses=4]
  %69 = load double* %scevgep138, align 4         ; <double> [#uses=4]
  %70 = fmul double %67, -2.000000e+00            ; <double> [#uses=1]
  %71 = fmul double %70, %69                      ; <double> [#uses=1]
  %72 = fadd double %71, %68                      ; <double> [#uses=2]
  %73 = fmul double %67, 2.000000e+00             ; <double> [#uses=1]
  %74 = fmul double %73, %68                      ; <double> [#uses=1]
  %75 = fsub double %74, %69                      ; <double> [#uses=2]
  %76 = icmp sgt i32 %tmp42, %k.08                ; <i1> [#uses=1]
  br i1 %76, label %bb7, label %bb9

bb7:                                              ; preds = %bb7, %bb6
  %indvar = phi i32 [ %indvar.next, %bb7 ], [ 0, %bb6 ] ; <i32> [#uses=2]
  %tmp = shl i32 %indvar, 1                       ; <i32> [#uses=9]
  %tmp20 = add i32 %tmp, %k.08                    ; <i32> [#uses=1]
  %scevgep = getelementptr double* %a, i32 %tmp20 ; <double*> [#uses=2]
  %tmp24 = add i32 %tmp, %tmp23                   ; <i32> [#uses=1]
  %scevgep25 = getelementptr double* %a, i32 %tmp24 ; <double*> [#uses=2]
  %tmp29 = add i32 %tmp, %tmp28                   ; <i32> [#uses=1]
  %scevgep30 = getelementptr double* %a, i32 %tmp29 ; <double*> [#uses=2]
  %tmp34 = add i32 %tmp, %tmp33                   ; <i32> [#uses=1]
  %scevgep35 = getelementptr double* %a, i32 %tmp34 ; <double*> [#uses=2]
  %tmp37 = add i32 %tmp, %tmp36                   ; <i32> [#uses=1]
  %scevgep38 = getelementptr double* %a, i32 %tmp37 ; <double*> [#uses=2]
  %tmp40 = add i32 %tmp, %tmp39                   ; <i32> [#uses=1]
  %scevgep41 = getelementptr double* %a, i32 %tmp40 ; <double*> [#uses=2]
  %tmp43 = add i32 %tmp, %tmp42                   ; <i32> [#uses=1]
  %scevgep44 = getelementptr double* %a, i32 %tmp43 ; <double*> [#uses=2]
  %tmp47 = add i32 %tmp, %tmp46                   ; <i32> [#uses=1]
  %scevgep48 = getelementptr double* %a, i32 %tmp47 ; <double*> [#uses=2]
  %77 = load double* %scevgep, align 4            ; <double> [#uses=2]
  %78 = load double* %scevgep44, align 4          ; <double> [#uses=2]
  %79 = fadd double %77, %78                      ; <double> [#uses=2]
  %80 = load double* %scevgep48, align 4          ; <double> [#uses=2]
  %81 = load double* %scevgep25, align 4          ; <double> [#uses=2]
  %82 = fadd double %80, %81                      ; <double> [#uses=2]
  %83 = fsub double %77, %78                      ; <double> [#uses=2]
  %84 = fsub double %80, %81                      ; <double> [#uses=2]
  %85 = load double* %scevgep41, align 4          ; <double> [#uses=2]
  %86 = load double* %scevgep38, align 4          ; <double> [#uses=2]
  %87 = fadd double %85, %86                      ; <double> [#uses=2]
  %88 = load double* %scevgep30, align 4          ; <double> [#uses=2]
  %89 = load double* %scevgep35, align 4          ; <double> [#uses=2]
  %90 = fadd double %88, %89                      ; <double> [#uses=2]
  %91 = fsub double %85, %86                      ; <double> [#uses=2]
  %92 = fsub double %88, %89                      ; <double> [#uses=2]
  %93 = fadd double %79, %87                      ; <double> [#uses=1]
  store double %93, double* %scevgep, align 4
  %94 = fadd double %82, %90                      ; <double> [#uses=1]
  store double %94, double* %scevgep48, align 4
  %95 = fsub double %79, %87                      ; <double> [#uses=2]
  %96 = fsub double %82, %90                      ; <double> [#uses=2]
  %97 = fmul double %66, %95                      ; <double> [#uses=1]
  %98 = fmul double %67, %96                      ; <double> [#uses=1]
  %99 = fsub double %97, %98                      ; <double> [#uses=1]
  store double %99, double* %scevgep41, align 4
  %100 = fmul double %66, %96                     ; <double> [#uses=1]
  %101 = fmul double %67, %95                     ; <double> [#uses=1]
  %102 = fadd double %100, %101                   ; <double> [#uses=1]
  store double %102, double* %scevgep30, align 4
  %103 = fsub double %83, %92                     ; <double> [#uses=2]
  %104 = fadd double %84, %91                     ; <double> [#uses=2]
  %105 = fmul double %68, %103                    ; <double> [#uses=1]
  %106 = fmul double %69, %104                    ; <double> [#uses=1]
  %107 = fsub double %105, %106                   ; <double> [#uses=1]
  store double %107, double* %scevgep44, align 4
  %108 = fmul double %68, %104                    ; <double> [#uses=1]
  %109 = fmul double %69, %103                    ; <double> [#uses=1]
  %110 = fadd double %108, %109                   ; <double> [#uses=1]
  store double %110, double* %scevgep25, align 4
  %111 = fadd double %83, %92                     ; <double> [#uses=2]
  %112 = fsub double %84, %91                     ; <double> [#uses=2]
  %113 = fmul double %72, %111                    ; <double> [#uses=1]
  %114 = fmul double %75, %112                    ; <double> [#uses=1]
  %115 = fsub double %113, %114                   ; <double> [#uses=1]
  store double %115, double* %scevgep38, align 4
  %116 = fmul double %72, %112                    ; <double> [#uses=1]
  %117 = fmul double %75, %111                    ; <double> [#uses=1]
  %118 = fadd double %116, %117                   ; <double> [#uses=1]
  store double %118, double* %scevgep35, align 4
  %tmp51 = add i32 %tmp, %tmp50                   ; <i32> [#uses=1]
  %119 = icmp sgt i32 %tmp42, %tmp51              ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %119, label %bb7, label %bb9

bb9:                                              ; preds = %bb7, %bb6
  %120 = load double* %scevgep136, align 4        ; <double> [#uses=4]
  %121 = load double* %scevgep134, align 4        ; <double> [#uses=4]
  %122 = fmul double %66, -2.000000e+00           ; <double> [#uses=1]
  %123 = fmul double %122, %121                   ; <double> [#uses=1]
  %124 = fadd double %123, %120                   ; <double> [#uses=2]
  %125 = fmul double %66, 2.000000e+00            ; <double> [#uses=1]
  %126 = fmul double %125, %120                   ; <double> [#uses=1]
  %127 = fsub double %126, %121                   ; <double> [#uses=2]
  %128 = icmp sgt i32 %tmp85, %j.34               ; <i1> [#uses=1]
  br i1 %128, label %bb.nph6, label %bb12

bb.nph6:                                          ; preds = %bb9
  %129 = fsub double -0.000000e+00, %67           ; <double> [#uses=2]
  br label %bb10

bb10:                                             ; preds = %bb10, %bb.nph6
  %indvar52 = phi i32 [ 0, %bb.nph6 ], [ %indvar.next53, %bb10 ] ; <i32> [#uses=2]
  %tmp54 = shl i32 %indvar52, 1                   ; <i32> [#uses=9]
  %tmp62 = add i32 %tmp54, %j.34                  ; <i32> [#uses=1]
  %scevgep63 = getelementptr double* %a, i32 %tmp62 ; <double*> [#uses=2]
  %tmp67 = add i32 %tmp54, %tmp66                 ; <i32> [#uses=1]
  %scevgep68 = getelementptr double* %a, i32 %tmp67 ; <double*> [#uses=2]
  %tmp72 = add i32 %tmp54, %tmp71                 ; <i32> [#uses=1]
  %scevgep73 = getelementptr double* %a, i32 %tmp72 ; <double*> [#uses=2]
  %tmp77 = add i32 %tmp54, %tmp76                 ; <i32> [#uses=1]
  %scevgep78 = getelementptr double* %a, i32 %tmp77 ; <double*> [#uses=2]
  %tmp80 = add i32 %tmp54, %tmp79                 ; <i32> [#uses=1]
  %scevgep81 = getelementptr double* %a, i32 %tmp80 ; <double*> [#uses=2]
  %tmp83 = add i32 %tmp54, %tmp82                 ; <i32> [#uses=1]
  %scevgep84 = getelementptr double* %a, i32 %tmp83 ; <double*> [#uses=2]
  %tmp86 = add i32 %tmp54, %tmp85                 ; <i32> [#uses=1]
  %scevgep87 = getelementptr double* %a, i32 %tmp86 ; <double*> [#uses=2]
  %tmp90 = add i32 %tmp54, %tmp89                 ; <i32> [#uses=1]
  %scevgep91 = getelementptr double* %a, i32 %tmp90 ; <double*> [#uses=2]
  %130 = load double* %scevgep63, align 4         ; <double> [#uses=2]
  %131 = load double* %scevgep87, align 4         ; <double> [#uses=2]
  %132 = fadd double %130, %131                   ; <double> [#uses=2]
  %133 = load double* %scevgep91, align 4         ; <double> [#uses=2]
  %134 = load double* %scevgep68, align 4         ; <double> [#uses=2]
  %135 = fadd double %133, %134                   ; <double> [#uses=2]
  %136 = fsub double %130, %131                   ; <double> [#uses=2]
  %137 = fsub double %133, %134                   ; <double> [#uses=2]
  %138 = load double* %scevgep84, align 4         ; <double> [#uses=2]
  %139 = load double* %scevgep81, align 4         ; <double> [#uses=2]
  %140 = fadd double %138, %139                   ; <double> [#uses=2]
  %141 = load double* %scevgep73, align 4         ; <double> [#uses=2]
  %142 = load double* %scevgep78, align 4         ; <double> [#uses=2]
  %143 = fadd double %141, %142                   ; <double> [#uses=2]
  %144 = fsub double %138, %139                   ; <double> [#uses=2]
  %145 = fsub double %141, %142                   ; <double> [#uses=2]
  %146 = fadd double %132, %140                   ; <double> [#uses=1]
  store double %146, double* %scevgep63, align 4
  %147 = fadd double %135, %143                   ; <double> [#uses=1]
  store double %147, double* %scevgep91, align 4
  %148 = fsub double %132, %140                   ; <double> [#uses=2]
  %149 = fsub double %135, %143                   ; <double> [#uses=2]
  %150 = fmul double %148, %129                   ; <double> [#uses=1]
  %151 = fmul double %66, %149                    ; <double> [#uses=1]
  %152 = fsub double %150, %151                   ; <double> [#uses=1]
  store double %152, double* %scevgep84, align 4
  %153 = fmul double %149, %129                   ; <double> [#uses=1]
  %154 = fmul double %66, %148                    ; <double> [#uses=1]
  %155 = fadd double %153, %154                   ; <double> [#uses=1]
  store double %155, double* %scevgep73, align 4
  %156 = fsub double %136, %145                   ; <double> [#uses=2]
  %157 = fadd double %137, %144                   ; <double> [#uses=2]
  %158 = fmul double %120, %156                   ; <double> [#uses=1]
  %159 = fmul double %121, %157                   ; <double> [#uses=1]
  %160 = fsub double %158, %159                   ; <double> [#uses=1]
  store double %160, double* %scevgep87, align 4
  %161 = fmul double %120, %157                   ; <double> [#uses=1]
  %162 = fmul double %121, %156                   ; <double> [#uses=1]
  %163 = fadd double %161, %162                   ; <double> [#uses=1]
  store double %163, double* %scevgep68, align 4
  %164 = fadd double %136, %145                   ; <double> [#uses=2]
  %165 = fsub double %137, %144                   ; <double> [#uses=2]
  %166 = fmul double %124, %164                   ; <double> [#uses=1]
  %167 = fmul double %127, %165                   ; <double> [#uses=1]
  %168 = fsub double %166, %167                   ; <double> [#uses=1]
  store double %168, double* %scevgep81, align 4
  %169 = fmul double %124, %165                   ; <double> [#uses=1]
  %170 = fmul double %127, %164                   ; <double> [#uses=1]
  %171 = fadd double %169, %170                   ; <double> [#uses=1]
  store double %171, double* %scevgep78, align 4
  %j.3 = add i32 %tmp54, %tmp59                   ; <i32> [#uses=1]
  %172 = icmp sgt i32 %tmp85, %j.3                ; <i1> [#uses=1]
  %indvar.next53 = add i32 %indvar52, 1           ; <i32> [#uses=1]
  br i1 %172, label %bb10, label %bb12

bb12:                                             ; preds = %bb10, %bb9
  %173 = icmp slt i32 %tmp131, 2048               ; <i1> [#uses=1]
  %indvar.next15 = add i32 %indvar14, 1           ; <i32> [#uses=1]
  br i1 %173, label %bb6, label %return

return:                                           ; preds = %bb12, %bb5
  ret void
}

define internal fastcc void @cdft(i32 %isgn, double* nocapture %a, i32* nocapture %ip, double* nocapture %w) nounwind {
bb:
  %0 = icmp slt i32 %isgn, 0                      ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb1

bb1:                                              ; preds = %bb
  tail call fastcc void @bitrv2(i32 2048, i32* %ip, double* %a) nounwind
  tail call fastcc void @cft1st(double* %a, double* %w) nounwind
  br label %bb1.i4

bb1.i4:                                           ; preds = %bb1.i4, %bb1
  %l.15.i3 = phi i32 [ 8, %bb1 ], [ %1, %bb1.i4 ] ; <i32> [#uses=5]
  tail call fastcc void @cftmdl(i32 %l.15.i3, double* %a, double* %w) nounwind
  %1 = shl i32 %l.15.i3, 2                        ; <i32> [#uses=10]
  %2 = shl i32 %l.15.i3, 4                        ; <i32> [#uses=1]
  %3 = icmp slt i32 %2, 2048                      ; <i1> [#uses=1]
  br i1 %3, label %bb1.i4, label %bb3.i6

bb3.i6:                                           ; preds = %bb1.i4
  %.mask.i = and i32 %1, 1073741808               ; <i32> [#uses=1]
  %4 = icmp eq i32 %.mask.i, 512                  ; <i1> [#uses=1]
  %5 = icmp sgt i32 %1, 0                         ; <i1> [#uses=2]
  br i1 %4, label %bb6.preheader.i8, label %bb9.preheader.i7

bb9.preheader.i7:                                 ; preds = %bb3.i6
  br i1 %5, label %bb.nph.i24, label %cftfsub.exit

bb6.preheader.i8:                                 ; preds = %bb3.i6
  br i1 %5, label %bb.nph4.i10, label %cftfsub.exit

bb.nph4.i10:                                      ; preds = %bb6.preheader.i8
  %tmp202.i = or i32 %1, 1                        ; <i32> [#uses=1]
  %tmp23.i = shl i32 %l.15.i3, 3                  ; <i32> [#uses=1]
  %tmp2442.i = or i32 %tmp23.i, 1                 ; <i32> [#uses=1]
  %tmp27.i9 = mul i32 %l.15.i3, 12                ; <i32> [#uses=2]
  %tmp281.i = or i32 %tmp27.i9, 1                 ; <i32> [#uses=1]
  br label %bb5.i23

bb5.i23:                                          ; preds = %bb5.i23, %bb.nph4.i10
  %indvar16.i11 = phi i32 [ 0, %bb.nph4.i10 ], [ %indvar.next17.i22, %bb5.i23 ] ; <i32> [#uses=3]
  %tmp18.i = shl i32 %indvar16.i11, 1             ; <i32> [#uses=8]
  %scevgep19.i12 = getelementptr double* %a, i32 %tmp18.i ; <double*> [#uses=2]
  %tmp21.i13 = add i32 %tmp18.i, %tmp202.i        ; <i32> [#uses=1]
  %scevgep22.i14 = getelementptr double* %a, i32 %tmp21.i13 ; <double*> [#uses=2]
  %tmp25.i = add i32 %tmp18.i, %tmp2442.i         ; <i32> [#uses=1]
  %scevgep26.i15 = getelementptr double* %a, i32 %tmp25.i ; <double*> [#uses=2]
  %tmp29.i16 = add i32 %tmp18.i, %tmp281.i        ; <i32> [#uses=1]
  %scevgep30.i17 = getelementptr double* %a, i32 %tmp29.i16 ; <double*> [#uses=2]
  %tmp31.i = add i32 %tmp18.i, %tmp27.i9          ; <i32> [#uses=1]
  %scevgep32.i18 = getelementptr double* %a, i32 %tmp31.i ; <double*> [#uses=2]
  %tmp1841.i = add i32 %indvar16.i11, %1          ; <i32> [#uses=1]
  %tmp33.i = shl i32 %tmp1841.i, 1                ; <i32> [#uses=1]
  %scevgep34.i19 = getelementptr double* %a, i32 %tmp33.i ; <double*> [#uses=2]
  %tmp35.i = add i32 %1, %tmp18.i                 ; <i32> [#uses=1]
  %scevgep36.i20 = getelementptr double* %a, i32 %tmp35.i ; <double*> [#uses=2]
  %tmp3740.i = or i32 %tmp18.i, 1                 ; <i32> [#uses=1]
  %scevgep38.i21 = getelementptr double* %a, i32 %tmp3740.i ; <double*> [#uses=2]
  %6 = load double* %scevgep19.i12, align 4       ; <double> [#uses=2]
  %7 = load double* %scevgep36.i20, align 4       ; <double> [#uses=2]
  %8 = fadd double %6, %7                         ; <double> [#uses=2]
  %9 = load double* %scevgep38.i21, align 4       ; <double> [#uses=2]
  %10 = load double* %scevgep22.i14, align 4      ; <double> [#uses=2]
  %11 = fadd double %9, %10                       ; <double> [#uses=2]
  %12 = fsub double %6, %7                        ; <double> [#uses=2]
  %13 = fsub double %9, %10                       ; <double> [#uses=2]
  %14 = load double* %scevgep34.i19, align 4      ; <double> [#uses=2]
  %15 = load double* %scevgep32.i18, align 4      ; <double> [#uses=2]
  %16 = fadd double %14, %15                      ; <double> [#uses=2]
  %17 = load double* %scevgep26.i15, align 4      ; <double> [#uses=2]
  %18 = load double* %scevgep30.i17, align 4      ; <double> [#uses=2]
  %19 = fadd double %17, %18                      ; <double> [#uses=2]
  %20 = fsub double %14, %15                      ; <double> [#uses=2]
  %21 = fsub double %17, %18                      ; <double> [#uses=2]
  %22 = fadd double %8, %16                       ; <double> [#uses=1]
  store double %22, double* %scevgep19.i12, align 4
  %23 = fadd double %11, %19                      ; <double> [#uses=1]
  store double %23, double* %scevgep38.i21, align 4
  %24 = fsub double %8, %16                       ; <double> [#uses=1]
  store double %24, double* %scevgep34.i19, align 4
  %25 = fsub double %11, %19                      ; <double> [#uses=1]
  store double %25, double* %scevgep26.i15, align 4
  %26 = fsub double %12, %21                      ; <double> [#uses=1]
  store double %26, double* %scevgep36.i20, align 4
  %27 = fadd double %13, %20                      ; <double> [#uses=1]
  store double %27, double* %scevgep22.i14, align 4
  %28 = fadd double %12, %21                      ; <double> [#uses=1]
  store double %28, double* %scevgep32.i18, align 4
  %29 = fsub double %13, %20                      ; <double> [#uses=1]
  store double %29, double* %scevgep30.i17, align 4
  %tmp39.i = add i32 %tmp18.i, 2                  ; <i32> [#uses=1]
  %30 = icmp slt i32 %tmp39.i, %1                 ; <i1> [#uses=1]
  %indvar.next17.i22 = add i32 %indvar16.i11, 1   ; <i32> [#uses=1]
  br i1 %30, label %bb5.i23, label %cftfsub.exit

bb.nph.i24:                                       ; preds = %bb9.preheader.i7
  %tmp83.i = or i32 %1, 1                         ; <i32> [#uses=1]
  br label %bb8.i32

bb8.i32:                                          ; preds = %bb8.i32, %bb.nph.i24
  %indvar.i25 = phi i32 [ 0, %bb.nph.i24 ], [ %indvar.next.i31, %bb8.i32 ] ; <i32> [#uses=2]
  %tmp.i = shl i32 %indvar.i25, 1                 ; <i32> [#uses=5]
  %scevgep.i26 = getelementptr double* %a, i32 %tmp.i ; <double*> [#uses=2]
  %tmp9.i = add i32 %tmp.i, %tmp83.i              ; <i32> [#uses=1]
  %scevgep10.i27 = getelementptr double* %a, i32 %tmp9.i ; <double*> [#uses=3]
  %tmp11.i = add i32 %1, %tmp.i                   ; <i32> [#uses=1]
  %scevgep12.i28 = getelementptr double* %a, i32 %tmp11.i ; <double*> [#uses=2]
  %tmp1343.i = or i32 %tmp.i, 1                   ; <i32> [#uses=1]
  %scevgep14.i29 = getelementptr double* %a, i32 %tmp1343.i ; <double*> [#uses=3]
  %31 = load double* %scevgep.i26, align 4        ; <double> [#uses=2]
  %32 = load double* %scevgep12.i28, align 4      ; <double> [#uses=2]
  %33 = fsub double %31, %32                      ; <double> [#uses=1]
  %34 = load double* %scevgep14.i29, align 4      ; <double> [#uses=1]
  %35 = load double* %scevgep10.i27, align 4      ; <double> [#uses=1]
  %36 = fsub double %34, %35                      ; <double> [#uses=1]
  %37 = fadd double %31, %32                      ; <double> [#uses=1]
  store double %37, double* %scevgep.i26, align 4
  %38 = load double* %scevgep14.i29, align 4      ; <double> [#uses=1]
  %39 = load double* %scevgep10.i27, align 4      ; <double> [#uses=1]
  %40 = fadd double %38, %39                      ; <double> [#uses=1]
  store double %40, double* %scevgep14.i29, align 4
  store double %33, double* %scevgep12.i28, align 4
  store double %36, double* %scevgep10.i27, align 4
  %tmp15.i30 = add i32 %tmp.i, 2                  ; <i32> [#uses=1]
  %41 = icmp slt i32 %tmp15.i30, %1               ; <i1> [#uses=1]
  %indvar.next.i31 = add i32 %indvar.i25, 1       ; <i32> [#uses=1]
  br i1 %41, label %bb8.i32, label %cftfsub.exit

cftfsub.exit:                                     ; preds = %bb8.i32, %bb5.i23, %bb6.preheader.i8, %bb9.preheader.i7
  ret void

bb2:                                              ; preds = %bb
  store i32 0, i32* %ip, align 4
  br label %bb.i

bb.i:                                             ; preds = %bb3.i, %bb2
  %m.012.i = phi i32 [ 1, %bb2 ], [ %47, %bb3.i ] ; <i32> [#uses=10]
  %l.011.i = phi i32 [ 2048, %bb2 ], [ %42, %bb3.i ] ; <i32> [#uses=1]
  %42 = ashr i32 %l.011.i, 1                      ; <i32> [#uses=4]
  %43 = icmp sgt i32 %m.012.i, 0                  ; <i1> [#uses=1]
  br i1 %43, label %bb1.i, label %bb3.i

bb1.i:                                            ; preds = %bb1.i, %bb.i
  %j.09.i = phi i32 [ %46, %bb1.i ], [ 0, %bb.i ] ; <i32> [#uses=3]
  %tmp114 = add i32 %j.09.i, %m.012.i             ; <i32> [#uses=1]
  %scevgep121.i = getelementptr i32* %ip, i32 %tmp114 ; <i32*> [#uses=1]
  %scevgep119.i = getelementptr i32* %ip, i32 %j.09.i ; <i32*> [#uses=1]
  %44 = load i32* %scevgep119.i, align 4          ; <i32> [#uses=1]
  %45 = add nsw i32 %44, %42                      ; <i32> [#uses=1]
  store i32 %45, i32* %scevgep121.i, align 4
  %46 = add nsw i32 %j.09.i, 1                    ; <i32> [#uses=2]
  %exitcond113 = icmp eq i32 %46, %m.012.i        ; <i1> [#uses=1]
  br i1 %exitcond113, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %bb1.i, %bb.i
  %47 = shl i32 %m.012.i, 1                       ; <i32> [#uses=8]
  %48 = shl i32 %m.012.i, 4                       ; <i32> [#uses=1]
  %49 = icmp slt i32 %48, %42                     ; <i1> [#uses=1]
  br i1 %49, label %bb.i, label %bb5.i

bb5.i:                                            ; preds = %bb3.i
  %50 = shl i32 %m.012.i, 4                       ; <i32> [#uses=1]
  %51 = icmp eq i32 %50, %42                      ; <i1> [#uses=1]
  br i1 %51, label %bb11.preheader.i, label %bb12.i

bb11.preheader.i:                                 ; preds = %bb5.i
  %52 = icmp sgt i32 %47, 0                       ; <i1> [#uses=1]
  br i1 %52, label %bb.nph8.i, label %bb.i1

bb8.i:                                            ; preds = %bb9.preheader.i, %bb8.i
  %j.15.i = phi i32 [ %95, %bb8.i ], [ 0, %bb9.preheader.i ] ; <i32> [#uses=4]
  %tmp67 = shl i32 %j.15.i, 1                     ; <i32> [#uses=7]
  %tmp67118 = add i32 %j.15.i, %47                ; <i32> [#uses=1]
  %tmp69 = shl i32 %tmp67118, 1                   ; <i32> [#uses=1]
  %tmp72 = add i32 %tmp67, %tmp71124              ; <i32> [#uses=1]
  %tmp74 = add i32 %tmp67, %tmp53.i               ; <i32> [#uses=1]
  %tmp78 = add i32 %tmp67, %tmp77123              ; <i32> [#uses=1]
  %tmp80 = add i32 %tmp67, %tmp76                 ; <i32> [#uses=1]
  %tmp83 = add i32 %tmp67, %tmp82122              ; <i32> [#uses=1]
  %tmp86117 = or i32 %tmp67, 1                    ; <i32> [#uses=1]
  %scevgep51.i = getelementptr i32* %ip, i32 %j.15.i ; <i32*> [#uses=1]
  %53 = load i32* %scevgep83.i, align 4           ; <i32> [#uses=8]
  %54 = load i32* %scevgep51.i, align 4           ; <i32> [#uses=8]
  %tmp81.i = add i32 %53, %tmp67                  ; <i32> [#uses=1]
  %55 = getelementptr inbounds double* %a, i32 %tmp81.i ; <double*> [#uses=2]
  %56 = load double* %55, align 4                 ; <double> [#uses=1]
  %tmp79.i = add i32 %53, %tmp86117               ; <i32> [#uses=1]
  %57 = getelementptr inbounds double* %a, i32 %tmp79.i ; <double*> [#uses=2]
  %58 = load double* %57, align 4                 ; <double> [#uses=1]
  %59 = fsub double -0.000000e+00, %58            ; <double> [#uses=1]
  %tmp107.i = add i32 %54, %tmp89                 ; <i32> [#uses=1]
  %60 = getelementptr inbounds double* %a, i32 %tmp107.i ; <double*> [#uses=2]
  %61 = load double* %60, align 4                 ; <double> [#uses=1]
  %tmp105.i = add i32 %54, %tmp93119              ; <i32> [#uses=1]
  %62 = getelementptr inbounds double* %a, i32 %tmp105.i ; <double*> [#uses=2]
  %63 = load double* %62, align 4                 ; <double> [#uses=1]
  %64 = fsub double -0.000000e+00, %63            ; <double> [#uses=1]
  store double %61, double* %55, align 4
  store double %64, double* %57, align 4
  store double %56, double* %60, align 4
  store double %59, double* %62, align 4
  %tmp76.i = add i32 %53, %tmp69                  ; <i32> [#uses=1]
  %65 = getelementptr inbounds double* %a, i32 %tmp76.i ; <double*> [#uses=2]
  %66 = load double* %65, align 4                 ; <double> [#uses=1]
  %tmp73.i = add i32 %53, %tmp83                  ; <i32> [#uses=1]
  %67 = getelementptr inbounds double* %a, i32 %tmp73.i ; <double*> [#uses=2]
  %68 = load double* %67, align 4                 ; <double> [#uses=1]
  %69 = fsub double -0.000000e+00, %68            ; <double> [#uses=1]
  %tmp102.i = add i32 %54, %tmp96                 ; <i32> [#uses=1]
  %70 = getelementptr inbounds double* %a, i32 %tmp102.i ; <double*> [#uses=2]
  %71 = load double* %70, align 4                 ; <double> [#uses=1]
  %tmp87.i = add i32 %54, %tmp107                 ; <i32> [#uses=1]
  %72 = getelementptr inbounds double* %a, i32 %tmp87.i ; <double*> [#uses=2]
  %73 = load double* %72, align 4                 ; <double> [#uses=1]
  %74 = fsub double -0.000000e+00, %73            ; <double> [#uses=1]
  store double %71, double* %65, align 4
  store double %74, double* %67, align 4
  store double %66, double* %70, align 4
  store double %69, double* %72, align 4
  %tmp68.i = add i32 %53, %tmp80                  ; <i32> [#uses=1]
  %75 = getelementptr inbounds double* %a, i32 %tmp68.i ; <double*> [#uses=2]
  %76 = load double* %75, align 4                 ; <double> [#uses=1]
  %tmp65.i = add i32 %53, %tmp78                  ; <i32> [#uses=1]
  %77 = getelementptr inbounds double* %a, i32 %tmp65.i ; <double*> [#uses=2]
  %78 = load double* %77, align 4                 ; <double> [#uses=1]
  %79 = fsub double -0.000000e+00, %78            ; <double> [#uses=1]
  %tmp99.i = add i32 %54, %tmp90                  ; <i32> [#uses=1]
  %80 = getelementptr inbounds double* %a, i32 %tmp99.i ; <double*> [#uses=2]
  %81 = load double* %80, align 4                 ; <double> [#uses=1]
  %tmp96.i = add i32 %54, %tmp99                  ; <i32> [#uses=1]
  %82 = getelementptr inbounds double* %a, i32 %tmp96.i ; <double*> [#uses=2]
  %83 = load double* %82, align 4                 ; <double> [#uses=1]
  %84 = fsub double -0.000000e+00, %83            ; <double> [#uses=1]
  store double %81, double* %75, align 4
  store double %84, double* %77, align 4
  store double %76, double* %80, align 4
  store double %79, double* %82, align 4
  %tmp60.i = add i32 %53, %tmp74                  ; <i32> [#uses=1]
  %85 = getelementptr inbounds double* %a, i32 %tmp60.i ; <double*> [#uses=2]
  %86 = load double* %85, align 4                 ; <double> [#uses=1]
  %tmp57.i = add i32 %53, %tmp72                  ; <i32> [#uses=1]
  %87 = getelementptr inbounds double* %a, i32 %tmp57.i ; <double*> [#uses=2]
  %88 = load double* %87, align 4                 ; <double> [#uses=1]
  %89 = fsub double -0.000000e+00, %88            ; <double> [#uses=1]
  %tmp93.i = add i32 %54, %tmp110                 ; <i32> [#uses=1]
  %90 = getelementptr inbounds double* %a, i32 %tmp93.i ; <double*> [#uses=2]
  %91 = load double* %90, align 4                 ; <double> [#uses=1]
  %tmp90.i = add i32 %54, %tmp104                 ; <i32> [#uses=1]
  %92 = getelementptr inbounds double* %a, i32 %tmp90.i ; <double*> [#uses=2]
  %93 = load double* %92, align 4                 ; <double> [#uses=1]
  %94 = fsub double -0.000000e+00, %93            ; <double> [#uses=1]
  store double %91, double* %85, align 4
  store double %94, double* %87, align 4
  store double %86, double* %90, align 4
  store double %89, double* %92, align 4
  %95 = add nsw i32 %j.15.i, 1                    ; <i32> [#uses=2]
  %exitcond66 = icmp eq i32 %95, %114             ; <i1> [#uses=1]
  br i1 %exitcond66, label %bb10.i, label %bb8.i

bb10.i:                                           ; preds = %bb9.preheader.i, %bb8.i
  %96 = load i32* %scevgep83.i, align 4           ; <i32> [#uses=6]
  %tmp117.i = add i32 %96, %tmp93119              ; <i32> [#uses=1]
  %97 = getelementptr inbounds double* %a, i32 %tmp117.i ; <double*> [#uses=2]
  %98 = load double* %97, align 4                 ; <double> [#uses=1]
  %99 = fsub double -0.000000e+00, %98            ; <double> [#uses=1]
  store double %99, double* %97, align 4
  %tmp116.i = add i32 %96, %tmp90                 ; <i32> [#uses=1]
  %100 = getelementptr inbounds double* %a, i32 %tmp116.i ; <double*> [#uses=2]
  %101 = load double* %100, align 4               ; <double> [#uses=1]
  %tmp109.i = add i32 %96, %tmp99                 ; <i32> [#uses=1]
  %102 = getelementptr inbounds double* %a, i32 %tmp109.i ; <double*> [#uses=2]
  %103 = load double* %102, align 4               ; <double> [#uses=1]
  %104 = fsub double -0.000000e+00, %103          ; <double> [#uses=1]
  %tmp114.i = add i32 %96, %tmp96                 ; <i32> [#uses=1]
  %105 = getelementptr inbounds double* %a, i32 %tmp114.i ; <double*> [#uses=2]
  %106 = load double* %105, align 4               ; <double> [#uses=1]
  %tmp112.i = add i32 %96, %tmp107                ; <i32> [#uses=1]
  %107 = getelementptr inbounds double* %a, i32 %tmp112.i ; <double*> [#uses=2]
  %108 = load double* %107, align 4               ; <double> [#uses=1]
  %109 = fsub double -0.000000e+00, %108          ; <double> [#uses=1]
  store double %106, double* %100, align 4
  store double %109, double* %102, align 4
  store double %101, double* %105, align 4
  store double %104, double* %107, align 4
  %tmp110.i = add i32 %96, %tmp104                ; <i32> [#uses=1]
  %110 = getelementptr inbounds double* %a, i32 %tmp110.i ; <double*> [#uses=2]
  %111 = load double* %110, align 4               ; <double> [#uses=1]
  %112 = fsub double -0.000000e+00, %111          ; <double> [#uses=1]
  store double %112, double* %110, align 4
  %113 = add i32 %114, 1                          ; <i32> [#uses=2]
  %exitcond88 = icmp eq i32 %113, %47             ; <i1> [#uses=1]
  br i1 %exitcond88, label %bb.i1, label %bb9.preheader.i

bb.nph8.i:                                        ; preds = %bb11.preheader.i
  %tmp53.i = mul i32 %m.012.i, 12                 ; <i32> [#uses=3]
  %tmp68 = shl i32 %m.012.i, 2                    ; <i32> [#uses=1]
  %tmp71124 = or i32 %tmp53.i, 1                  ; <i32> [#uses=2]
  %tmp76 = shl i32 %m.012.i, 3                    ; <i32> [#uses=3]
  %tmp77123 = or i32 %tmp76, 1                    ; <i32> [#uses=2]
  %tmp82122 = or i32 %tmp68, 1                    ; <i32> [#uses=2]
  br label %bb9.preheader.i

bb9.preheader.i:                                  ; preds = %bb.nph8.i, %bb10.i
  %114 = phi i32 [ 0, %bb.nph8.i ], [ %113, %bb10.i ] ; <i32> [#uses=6]
  %tmp89 = shl i32 %114, 1                        ; <i32> [#uses=7]
  %tmp89120 = add i32 %114, %47                   ; <i32> [#uses=1]
  %tmp90 = shl i32 %tmp89120, 1                   ; <i32> [#uses=2]
  %tmp93119 = or i32 %tmp89, 1                    ; <i32> [#uses=2]
  %tmp96 = add i32 %tmp89, %tmp76                 ; <i32> [#uses=2]
  %tmp99 = add i32 %tmp89, %tmp82122              ; <i32> [#uses=2]
  %tmp104 = add i32 %tmp89, %tmp71124             ; <i32> [#uses=2]
  %tmp107 = add i32 %tmp89, %tmp77123             ; <i32> [#uses=2]
  %tmp110 = add i32 %tmp89, %tmp53.i              ; <i32> [#uses=1]
  %scevgep83.i = getelementptr i32* %ip, i32 %114 ; <i32*> [#uses=2]
  %115 = icmp sgt i32 %114, 0                     ; <i1> [#uses=1]
  br i1 %115, label %bb8.i, label %bb10.i

bb12.i:                                           ; preds = %bb5.i
  %116 = shl i32 %m.012.i, 2                      ; <i32> [#uses=3]
  %117 = getelementptr inbounds double* %a, i32 1 ; <double*> [#uses=2]
  %118 = load double* %117, align 4               ; <double> [#uses=1]
  %119 = fsub double -0.000000e+00, %118          ; <double> [#uses=1]
  store double %119, double* %117, align 4
  %120 = or i32 %116, 1                           ; <i32> [#uses=2]
  %121 = getelementptr inbounds double* %a, i32 %120 ; <double*> [#uses=2]
  %122 = load double* %121, align 4               ; <double> [#uses=1]
  %123 = fsub double -0.000000e+00, %122          ; <double> [#uses=1]
  store double %123, double* %121, align 4
  %124 = icmp sgt i32 %47, 1                      ; <i1> [#uses=1]
  br i1 %124, label %bb.nph4.i, label %bb.i1

bb14.i:                                           ; preds = %bb15.preheader.i, %bb14.i
  %j.22.i = phi i32 [ %147, %bb14.i ], [ 0, %bb15.preheader.i ] ; <i32> [#uses=4]
  %tmp23 = shl i32 %j.22.i, 1                     ; <i32> [#uses=3]
  %tmp23126 = add i32 %j.22.i, %47                ; <i32> [#uses=1]
  %tmp25 = shl i32 %tmp23126, 1                   ; <i32> [#uses=1]
  %tmp28 = add i32 %tmp23, %120                   ; <i32> [#uses=1]
  %tmp31125 = or i32 %tmp23, 1                    ; <i32> [#uses=1]
  %scevgep.i = getelementptr i32* %ip, i32 %j.22.i ; <i32*> [#uses=1]
  %125 = load i32* %scevgep33.i, align 4          ; <i32> [#uses=4]
  %126 = load i32* %scevgep.i, align 4            ; <i32> [#uses=4]
  %tmp29.i = add i32 %125, %tmp23                 ; <i32> [#uses=1]
  %127 = getelementptr inbounds double* %a, i32 %tmp29.i ; <double*> [#uses=2]
  %128 = load double* %127, align 4               ; <double> [#uses=1]
  %tmp27.i = add i32 %125, %tmp31125              ; <i32> [#uses=1]
  %129 = getelementptr inbounds double* %a, i32 %tmp27.i ; <double*> [#uses=2]
  %130 = load double* %129, align 4               ; <double> [#uses=1]
  %131 = fsub double -0.000000e+00, %130          ; <double> [#uses=1]
  %tmp47.i = add i32 %126, %tmp45                 ; <i32> [#uses=1]
  %132 = getelementptr inbounds double* %a, i32 %tmp47.i ; <double*> [#uses=2]
  %133 = load double* %132, align 4               ; <double> [#uses=1]
  %tmp44.i = add i32 %126, %tmp35                 ; <i32> [#uses=1]
  %134 = getelementptr inbounds double* %a, i32 %tmp44.i ; <double*> [#uses=2]
  %135 = load double* %134, align 4               ; <double> [#uses=1]
  %136 = fsub double -0.000000e+00, %135          ; <double> [#uses=1]
  store double %133, double* %127, align 4
  store double %136, double* %129, align 4
  store double %128, double* %132, align 4
  store double %131, double* %134, align 4
  %tmp24.i = add i32 %125, %tmp25                 ; <i32> [#uses=1]
  %137 = getelementptr inbounds double* %a, i32 %tmp24.i ; <double*> [#uses=2]
  %138 = load double* %137, align 4               ; <double> [#uses=1]
  %tmp21.i = add i32 %125, %tmp28                 ; <i32> [#uses=1]
  %139 = getelementptr inbounds double* %a, i32 %tmp21.i ; <double*> [#uses=2]
  %140 = load double* %139, align 4               ; <double> [#uses=1]
  %141 = fsub double -0.000000e+00, %140          ; <double> [#uses=1]
  %tmp41.i = add i32 %126, %tmp43                 ; <i32> [#uses=1]
  %142 = getelementptr inbounds double* %a, i32 %tmp41.i ; <double*> [#uses=2]
  %143 = load double* %142, align 4               ; <double> [#uses=1]
  %tmp37.i = add i32 %126, %tmp39                 ; <i32> [#uses=1]
  %144 = getelementptr inbounds double* %a, i32 %tmp37.i ; <double*> [#uses=2]
  %145 = load double* %144, align 4               ; <double> [#uses=1]
  %146 = fsub double -0.000000e+00, %145          ; <double> [#uses=1]
  store double %143, double* %137, align 4
  store double %146, double* %139, align 4
  store double %138, double* %142, align 4
  store double %141, double* %144, align 4
  %147 = add nsw i32 %j.22.i, 1                   ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %147, %k.13.i           ; <i1> [#uses=1]
  br i1 %exitcond, label %bb16.i, label %bb14.i

bb16.i:                                           ; preds = %bb15.preheader.i, %bb14.i
  %148 = load i32* %scevgep33.i, align 4          ; <i32> [#uses=2]
  %tmp49.i = add i32 %148, %tmp35                 ; <i32> [#uses=1]
  %149 = getelementptr inbounds double* %a, i32 %tmp49.i ; <double*> [#uses=2]
  %150 = load double* %149, align 4               ; <double> [#uses=1]
  %151 = fsub double -0.000000e+00, %150          ; <double> [#uses=1]
  store double %151, double* %149, align 4
  %tmp48.i = add i32 %148, %tmp39                 ; <i32> [#uses=1]
  %152 = getelementptr inbounds double* %a, i32 %tmp48.i ; <double*> [#uses=2]
  %153 = load double* %152, align 4               ; <double> [#uses=1]
  %154 = fsub double -0.000000e+00, %153          ; <double> [#uses=1]
  store double %154, double* %152, align 4
  %exitcond33 = icmp eq i32 %k.13.i, %tmp30.i     ; <i1> [#uses=1]
  br i1 %exitcond33, label %bb.i1, label %bb15.preheader.i

bb.nph4.i:                                        ; preds = %bb12.i
  %tmp30.i = add i32 %47, -1                      ; <i32> [#uses=1]
  %tmp3837 = or i32 %116, 3                       ; <i32> [#uses=1]
  %tmp4236 = or i32 %116, 2                       ; <i32> [#uses=1]
  br label %bb15.preheader.i

bb15.preheader.i:                                 ; preds = %bb.nph4.i, %bb16.i
  %indvar.i = phi i32 [ 0, %bb.nph4.i ], [ %k.13.i, %bb16.i ] ; <i32> [#uses=2]
  %k.13.i = add i32 %indvar.i, 1                  ; <i32> [#uses=5]
  %scevgep33.i = getelementptr i32* %ip, i32 %k.13.i ; <i32*> [#uses=2]
  %tmp = shl i32 %indvar.i, 1                     ; <i32> [#uses=4]
  %tmp35 = add i32 %tmp, 3                        ; <i32> [#uses=2]
  %tmp39 = add i32 %tmp, %tmp3837                 ; <i32> [#uses=2]
  %tmp43 = add i32 %tmp, %tmp4236                 ; <i32> [#uses=1]
  %tmp45 = add i32 %tmp, 2                        ; <i32> [#uses=1]
  %155 = icmp sgt i32 %k.13.i, 0                  ; <i1> [#uses=1]
  br i1 %155, label %bb14.i, label %bb16.i

bb.i1:                                            ; preds = %bb16.i, %bb12.i, %bb10.i, %bb11.preheader.i
  tail call fastcc void @cft1st(double* %a, double* %w) nounwind
  br label %bb1.i2

bb1.i2:                                           ; preds = %bb1.i2, %bb.i1
  %l.15.i = phi i32 [ 8, %bb.i1 ], [ %156, %bb1.i2 ] ; <i32> [#uses=5]
  tail call fastcc void @cftmdl(i32 %l.15.i, double* %a, double* %w) nounwind
  %156 = shl i32 %l.15.i, 2                       ; <i32> [#uses=10]
  %157 = shl i32 %l.15.i, 4                       ; <i32> [#uses=1]
  %158 = icmp slt i32 %157, 2048                  ; <i1> [#uses=1]
  br i1 %158, label %bb1.i2, label %bb3.i3

bb3.i3:                                           ; preds = %bb1.i2
  %.mask = and i32 %156, 1073741808               ; <i32> [#uses=1]
  %159 = icmp eq i32 %.mask, 512                  ; <i1> [#uses=1]
  %160 = icmp sgt i32 %156, 0                     ; <i1> [#uses=2]
  br i1 %159, label %bb6.preheader.i, label %bb9.preheader.i4

bb9.preheader.i4:                                 ; preds = %bb3.i3
  br i1 %160, label %bb.nph.i, label %cftbsub.exit

bb6.preheader.i:                                  ; preds = %bb3.i3
  br i1 %160, label %bb.nph4.i6, label %cftbsub.exit

bb.nph4.i6:                                       ; preds = %bb6.preheader.i
  %tmp27.i5 = mul i32 %l.15.i, 12                 ; <i32> [#uses=2]
  %tmp54 = shl i32 %l.15.i, 3                     ; <i32> [#uses=1]
  %tmp59132 = or i32 %tmp27.i5, 1                 ; <i32> [#uses=1]
  %tmp61131 = or i32 %tmp54, 1                    ; <i32> [#uses=1]
  %tmp63130 = or i32 %156, 1                      ; <i32> [#uses=1]
  br label %bb5.i11

bb5.i11:                                          ; preds = %bb5.i11, %bb.nph4.i6
  %indvar16.i = phi i32 [ 0, %bb.nph4.i6 ], [ %indvar.next17.i, %bb5.i11 ] ; <i32> [#uses=3]
  %tmp53 = shl i32 %indvar16.i, 1                 ; <i32> [#uses=8]
  %tmp53129 = add i32 %indvar16.i, %156           ; <i32> [#uses=1]
  %tmp55 = shl i32 %tmp53129, 1                   ; <i32> [#uses=1]
  %scevgep34.i = getelementptr double* %a, i32 %tmp55 ; <double*> [#uses=2]
  %tmp56128 = or i32 %tmp53, 1                    ; <i32> [#uses=1]
  %scevgep38.i = getelementptr double* %a, i32 %tmp56128 ; <double*> [#uses=2]
  %tmp57 = add i32 %156, %tmp53                   ; <i32> [#uses=1]
  %scevgep36.i = getelementptr double* %a, i32 %tmp57 ; <double*> [#uses=2]
  %tmp58 = add i32 %tmp53, %tmp27.i5              ; <i32> [#uses=1]
  %scevgep32.i = getelementptr double* %a, i32 %tmp58 ; <double*> [#uses=2]
  %tmp60 = add i32 %tmp53, %tmp59132              ; <i32> [#uses=1]
  %scevgep30.i = getelementptr double* %a, i32 %tmp60 ; <double*> [#uses=2]
  %tmp62 = add i32 %tmp53, %tmp61131              ; <i32> [#uses=1]
  %scevgep26.i = getelementptr double* %a, i32 %tmp62 ; <double*> [#uses=2]
  %tmp64 = add i32 %tmp53, %tmp63130              ; <i32> [#uses=1]
  %scevgep22.i = getelementptr double* %a, i32 %tmp64 ; <double*> [#uses=2]
  %scevgep19.i = getelementptr double* %a, i32 %tmp53 ; <double*> [#uses=2]
  %tmp39.i10 = add i32 %tmp53, 2                  ; <i32> [#uses=1]
  %161 = load double* %scevgep19.i, align 4       ; <double> [#uses=2]
  %162 = load double* %scevgep36.i, align 4       ; <double> [#uses=2]
  %163 = fadd double %161, %162                   ; <double> [#uses=2]
  %164 = load double* %scevgep38.i, align 4       ; <double> [#uses=2]
  %165 = fsub double -0.000000e+00, %164          ; <double> [#uses=1]
  %166 = load double* %scevgep22.i, align 4       ; <double> [#uses=2]
  %167 = fsub double %165, %166                   ; <double> [#uses=2]
  %168 = fsub double %161, %162                   ; <double> [#uses=2]
  %169 = fsub double %166, %164                   ; <double> [#uses=2]
  %170 = load double* %scevgep34.i, align 4       ; <double> [#uses=2]
  %171 = load double* %scevgep32.i, align 4       ; <double> [#uses=2]
  %172 = fadd double %170, %171                   ; <double> [#uses=2]
  %173 = load double* %scevgep26.i, align 4       ; <double> [#uses=2]
  %174 = load double* %scevgep30.i, align 4       ; <double> [#uses=2]
  %175 = fadd double %173, %174                   ; <double> [#uses=2]
  %176 = fsub double %170, %171                   ; <double> [#uses=2]
  %177 = fsub double %173, %174                   ; <double> [#uses=2]
  %178 = fadd double %163, %172                   ; <double> [#uses=1]
  store double %178, double* %scevgep19.i, align 4
  %179 = fsub double %167, %175                   ; <double> [#uses=1]
  store double %179, double* %scevgep38.i, align 4
  %180 = fsub double %163, %172                   ; <double> [#uses=1]
  store double %180, double* %scevgep34.i, align 4
  %181 = fadd double %167, %175                   ; <double> [#uses=1]
  store double %181, double* %scevgep26.i, align 4
  %182 = fsub double %168, %177                   ; <double> [#uses=1]
  store double %182, double* %scevgep36.i, align 4
  %183 = fsub double %169, %176                   ; <double> [#uses=1]
  store double %183, double* %scevgep22.i, align 4
  %184 = fadd double %168, %177                   ; <double> [#uses=1]
  store double %184, double* %scevgep32.i, align 4
  %185 = fadd double %169, %176                   ; <double> [#uses=1]
  store double %185, double* %scevgep30.i, align 4
  %186 = icmp slt i32 %tmp39.i10, %156            ; <i1> [#uses=1]
  %indvar.next17.i = add i32 %indvar16.i, 1       ; <i32> [#uses=1]
  br i1 %186, label %bb5.i11, label %cftbsub.exit

bb.nph.i:                                         ; preds = %bb9.preheader.i4
  %tmp51134 = or i32 %156, 1                      ; <i32> [#uses=1]
  br label %bb8.i15

bb8.i15:                                          ; preds = %bb8.i15, %bb.nph.i
  %indvar.i12 = phi i32 [ 0, %bb.nph.i ], [ %indvar.next.i, %bb8.i15 ] ; <i32> [#uses=2]
  %tmp47 = shl i32 %indvar.i12, 1                 ; <i32> [#uses=5]
  %tmp15.i = add i32 %tmp47, 2                    ; <i32> [#uses=1]
  %tmp49133 = or i32 %tmp47, 1                    ; <i32> [#uses=1]
  %scevgep14.i = getelementptr double* %a, i32 %tmp49133 ; <double*> [#uses=3]
  %tmp50 = add i32 %156, %tmp47                   ; <i32> [#uses=1]
  %scevgep12.i = getelementptr double* %a, i32 %tmp50 ; <double*> [#uses=2]
  %tmp52 = add i32 %tmp47, %tmp51134              ; <i32> [#uses=1]
  %scevgep10.i = getelementptr double* %a, i32 %tmp52 ; <double*> [#uses=3]
  %scevgep.i14 = getelementptr double* %a, i32 %tmp47 ; <double*> [#uses=2]
  %187 = load double* %scevgep.i14, align 4       ; <double> [#uses=2]
  %188 = load double* %scevgep12.i, align 4       ; <double> [#uses=2]
  %189 = fsub double %187, %188                   ; <double> [#uses=1]
  %190 = load double* %scevgep10.i, align 4       ; <double> [#uses=1]
  %191 = load double* %scevgep14.i, align 4       ; <double> [#uses=1]
  %192 = fsub double %190, %191                   ; <double> [#uses=1]
  %193 = fadd double %187, %188                   ; <double> [#uses=1]
  store double %193, double* %scevgep.i14, align 4
  %194 = load double* %scevgep14.i, align 4       ; <double> [#uses=1]
  %195 = fsub double -0.000000e+00, %194          ; <double> [#uses=1]
  %196 = load double* %scevgep10.i, align 4       ; <double> [#uses=1]
  %197 = fsub double %195, %196                   ; <double> [#uses=1]
  store double %197, double* %scevgep14.i, align 4
  store double %189, double* %scevgep12.i, align 4
  store double %192, double* %scevgep10.i, align 4
  %198 = icmp slt i32 %tmp15.i, %156              ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i12, 1         ; <i32> [#uses=1]
  br i1 %198, label %bb8.i15, label %cftbsub.exit

cftbsub.exit:                                     ; preds = %bb8.i15, %bb5.i11, %bb6.preheader.i, %bb9.preheader.i4
  ret void
}

declare double @cos(double) nounwind readonly

declare double @sin(double) nounwind readonly

declare i32 @gettimeofday(%struct.timeval* noalias, %struct.timeval* noalias) nounwind

define i32 @main() nounwind {
entry:
  %tv.i3 = alloca %struct.timeval, align 8        ; <%struct.timeval*> [#uses=1]
  %tv.i2 = alloca %struct.timeval, align 8        ; <%struct.timeval*> [#uses=1]
  %tv.i1 = alloca %struct.timeval, align 8        ; <%struct.timeval*> [#uses=1]
  %tv.i = alloca %struct.timeval, align 8         ; <%struct.timeval*> [#uses=1]
  %0 = call i32 @gettimeofday(%struct.timeval* noalias %tv.i, %struct.timeval* noalias null) nounwind ; <i32> [#uses=0]
  %1 = call i32 @gettimeofday(%struct.timeval* noalias %tv.i2, %struct.timeval* noalias null) nounwind ; <i32> [#uses=0]
  %2 = call noalias i8* @memalign(i32 16, i32 128) nounwind ; <i8*> [#uses=2]
  %3 = call noalias i8* @memalign(i32 16, i32 20480) nounwind ; <i8*> [#uses=9]
  %4 = bitcast i8* %3 to double*                  ; <double*> [#uses=7]
  store double 1.000000e+00, double* %4, align 4
  %5 = getelementptr inbounds i8* %3, i32 8       ; <i8*> [#uses=1]
  %6 = bitcast i8* %5 to double*                  ; <double*> [#uses=1]
  store double 0.000000e+00, double* %6, align 4
  %7 = getelementptr inbounds i8* %3, i32 2048    ; <i8*> [#uses=1]
  %8 = bitcast i8* %7 to double*                  ; <double*> [#uses=1]
  store double 0x3FE6A09E667F3BCD, double* %8, align 4
  %9 = getelementptr inbounds i8* %3, i32 2056    ; <i8*> [#uses=1]
  %10 = bitcast i8* %9 to double*                 ; <double*> [#uses=1]
  store double 0x3FE6A09E667F3BCD, double* %10, align 4
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %entry
  %indvar.i = phi i32 [ 0, %entry ], [ %indvar.next.i, %bb2.i ] ; <i32> [#uses=4]
  %tmp77 = mul i32 %indvar.i, -16                 ; <i32> [#uses=2]
  %tmp78 = add i32 %tmp77, 4080                   ; <i32> [#uses=1]
  %scevgep79 = getelementptr i8* %3, i32 %tmp78   ; <i8*> [#uses=1]
  %scevgep6.i = bitcast i8* %scevgep79 to double* ; <double*> [#uses=1]
  %tmp81 = add i32 %tmp77, 4088                   ; <i32> [#uses=1]
  %scevgep82 = getelementptr i8* %3, i32 %tmp81   ; <i8*> [#uses=1]
  %scevgep.i = bitcast i8* %scevgep82 to double*  ; <double*> [#uses=1]
  %tmp84 = shl i32 %indvar.i, 1                   ; <i32> [#uses=1]
  %j.01.i = add i32 %tmp84, 2                     ; <i32> [#uses=1]
  %tmp86 = shl i32 %indvar.i, 4                   ; <i32> [#uses=2]
  %tmp87 = add i32 %tmp86, 24                     ; <i32> [#uses=1]
  %scevgep88 = getelementptr i8* %3, i32 %tmp87   ; <i8*> [#uses=1]
  %scevgep12.i = bitcast i8* %scevgep88 to double* ; <double*> [#uses=1]
  %tmp90 = add i32 %tmp86, 16                     ; <i32> [#uses=1]
  %scevgep91 = getelementptr i8* %3, i32 %tmp90   ; <i8*> [#uses=1]
  %scevgep10.i = bitcast i8* %scevgep91 to double* ; <double*> [#uses=1]
  %11 = sitofp i32 %j.01.i to double              ; <double> [#uses=1]
  %12 = fmul double %11, 0x3F6921FB54442D18       ; <double> [#uses=2]
  %13 = call double @cos(double %12) nounwind readonly ; <double> [#uses=2]
  %14 = call double @sin(double %12) nounwind readonly ; <double> [#uses=2]
  store double %13, double* %scevgep10.i, align 4
  store double %14, double* %scevgep12.i, align 4
  store double %14, double* %scevgep6.i, align 4
  store double %13, double* %scevgep.i, align 4
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond76 = icmp eq i32 %indvar.next.i, 127   ; <i1> [#uses=1]
  br i1 %exitcond76, label %makewt.exit, label %bb2.i

makewt.exit:                                      ; preds = %bb2.i
  %15 = bitcast i8* %2 to i32*                    ; <i32*> [#uses=6]
  call fastcc void @bitrv2(i32 512, i32* %15, double* %4) nounwind
  %16 = call noalias i8* @memalign(i32 16, i32 16384) nounwind ; <i8*> [#uses=9]
  %17 = call noalias i8* @memalign(i32 16, i32 16384) nounwind ; <i8*> [#uses=7]
  %18 = call noalias i8* @memalign(i32 16, i32 16384) nounwind ; <i8*> [#uses=4]
  br label %bb.i14

bb.i14:                                           ; preds = %bb.i14, %makewt.exit
  %indvar.i8 = phi i32 [ 0, %makewt.exit ], [ %indvar.next.i13, %bb.i14 ] ; <i32> [#uses=2]
  %seed.01.i9 = phi i32 [ 0, %makewt.exit ], [ %21, %bb.i14 ] ; <i32> [#uses=1]
  %tmp73 = shl i32 %indvar.i8, 3                  ; <i32> [#uses=1]
  %scevgep74 = getelementptr i8* %16, i32 %tmp73  ; <i8*> [#uses=1]
  %scevgep.i11 = bitcast i8* %scevgep74 to double* ; <double*> [#uses=1]
  %19 = mul i32 %seed.01.i9, 7141                 ; <i32> [#uses=1]
  %20 = add nsw i32 %19, 54773                    ; <i32> [#uses=1]
  %21 = srem i32 %20, 259200                      ; <i32> [#uses=2]
  %22 = sitofp i32 %21 to double                  ; <double> [#uses=1]
  %23 = fmul double %22, 0x3ED02E85C0898B71       ; <double> [#uses=1]
  store double %23, double* %scevgep.i11, align 4
  %indvar.next.i13 = add i32 %indvar.i8, 1        ; <i32> [#uses=2]
  %exitcond72 = icmp eq i32 %indvar.next.i13, 2048 ; <i1> [#uses=1]
  br i1 %exitcond72, label %putdata.exit15, label %bb.i14

putdata.exit15:                                   ; preds = %bb.i14
  %24 = bitcast i8* %16 to double*                ; <double*> [#uses=3]
  %25 = bitcast i8* %17 to double*                ; <double*> [#uses=2]
  call fastcc void @cdft(i32 1, double* %24, i32* %15, double* %4) nounwind
  call fastcc void @cdft(i32 -1, double* %24, i32* %15, double* %4) nounwind
  br label %bb.i28

bb.i28:                                           ; preds = %bb.i28, %putdata.exit15
  %indvar.i24 = phi i32 [ 0, %putdata.exit15 ], [ %indvar.next.i27, %bb.i28 ] ; <i32> [#uses=2]
  %seed.04.i = phi i32 [ 54773, %putdata.exit15 ], [ %phitmp2.i, %bb.i28 ] ; <i32> [#uses=2]
  %err.03.i = phi double [ 0.000000e+00, %putdata.exit15 ], [ %iftmp.30.0.i, %bb.i28 ] ; <double> [#uses=2]
  %tmp69 = shl i32 %indvar.i24, 3                 ; <i32> [#uses=1]
  %scevgep70 = getelementptr i8* %16, i32 %tmp69  ; <i8*> [#uses=1]
  %scevgep.i26 = bitcast i8* %scevgep70 to double* ; <double*> [#uses=1]
  %26 = sitofp i32 %seed.04.i to double           ; <double> [#uses=1]
  %27 = fmul double %26, 0x3ED02E85C0898B71       ; <double> [#uses=1]
  %28 = load double* %scevgep.i26, align 4        ; <double> [#uses=1]
  %29 = fmul double %28, 9.765625e-04             ; <double> [#uses=1]
  %30 = fsub double %27, %29                      ; <double> [#uses=1]
  %31 = call double @fabs(double %30) nounwind readnone ; <double> [#uses=2]
  %32 = fcmp uge double %31, %err.03.i            ; <i1> [#uses=1]
  %iftmp.30.0.i = select i1 %32, double %31, double %err.03.i ; <double> [#uses=3]
  %phitmp.i = mul i32 %seed.04.i, 7141            ; <i32> [#uses=1]
  %phitmp1.i = add i32 %phitmp.i, 54773           ; <i32> [#uses=1]
  %phitmp2.i = srem i32 %phitmp1.i, 259200        ; <i32> [#uses=1]
  %indvar.next.i27 = add i32 %indvar.i24, 1       ; <i32> [#uses=2]
  %exitcond68 = icmp eq i32 %indvar.next.i27, 2048 ; <i1> [#uses=1]
  br i1 %exitcond68, label %errorcheck.exit, label %bb.i28

errorcheck.exit:                                  ; preds = %bb.i28
  %33 = call double @fabs(double %iftmp.30.0.i) nounwind readnone ; <double> [#uses=1]
  %34 = fcmp ogt double %33, 1.000000e-10         ; <i1> [#uses=1]
  br i1 %34, label %bb, label %bb1

bb:                                               ; preds = %errorcheck.exit
  %35 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([45 x i8]* @.str, i32 0, i32 0), double %iftmp.30.0.i) nounwind ; <i32> [#uses=0]
  call void @abort() noreturn nounwind
  unreachable

bb1:                                              ; preds = %errorcheck.exit
  call void @llvm.memset.i32(i8* %16, i8 0, i32 16384, i32 8)
  br label %bb.i22

bb.i22:                                           ; preds = %bb.i22, %bb1
  %indvar.i16 = phi i32 [ 0, %bb1 ], [ %indvar.next.i21, %bb.i22 ] ; <i32> [#uses=2]
  %seed.01.i17 = phi i32 [ 0, %bb1 ], [ %38, %bb.i22 ] ; <i32> [#uses=1]
  %tmp65 = shl i32 %indvar.i16, 3                 ; <i32> [#uses=1]
  %scevgep66 = getelementptr i8* %16, i32 %tmp65  ; <i8*> [#uses=1]
  %scevgep.i19 = bitcast i8* %scevgep66 to double* ; <double*> [#uses=1]
  %36 = mul i32 %seed.01.i17, 7141                ; <i32> [#uses=1]
  %37 = add nsw i32 %36, 54773                    ; <i32> [#uses=1]
  %38 = srem i32 %37, 259200                      ; <i32> [#uses=2]
  %39 = sitofp i32 %38 to double                  ; <double> [#uses=1]
  %40 = fmul double %39, 0x3ED02E85C0898B71       ; <double> [#uses=1]
  store double %40, double* %scevgep.i19, align 4
  %indvar.next.i21 = add i32 %indvar.i16, 1       ; <i32> [#uses=2]
  %exitcond64 = icmp eq i32 %indvar.next.i21, 1024 ; <i1> [#uses=1]
  br i1 %exitcond64, label %putdata.exit23, label %bb.i22

putdata.exit23:                                   ; preds = %bb.i22
  call fastcc void @cdft(i32 1, double* %24, i32* %15, double* %4) nounwind
  br label %bb2

bb2:                                              ; preds = %bb2, %putdata.exit23
  %j.034 = phi i32 [ 0, %putdata.exit23 ], [ %43, %bb2 ] ; <i32> [#uses=2]
  %tmp60 = shl i32 %j.034, 4                      ; <i32> [#uses=1]
  %tmp6195 = or i32 %tmp60, 8                     ; <i32> [#uses=1]
  %scevgep62 = getelementptr i8* %16, i32 %tmp6195 ; <i8*> [#uses=1]
  %scevgep6263 = bitcast i8* %scevgep62 to double* ; <double*> [#uses=2]
  %41 = load double* %scevgep6263, align 4        ; <double> [#uses=1]
  %42 = fsub double -0.000000e+00, %41            ; <double> [#uses=1]
  store double %42, double* %scevgep6263, align 4
  %43 = add nsw i32 %j.034, 1                     ; <i32> [#uses=2]
  %exitcond59 = icmp eq i32 %43, 1024             ; <i1> [#uses=1]
  br i1 %exitcond59, label %bb4, label %bb2

bb4:                                              ; preds = %bb2
  call void @llvm.memset.i32(i8* %18, i8 0, i32 16384, i32 8)
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb4
  %indvar.i4 = phi i32 [ 0, %bb4 ], [ %indvar.next.i7, %bb.i ] ; <i32> [#uses=2]
  %seed.01.i = phi i32 [ 0, %bb4 ], [ %46, %bb.i ] ; <i32> [#uses=1]
  %tmp56 = shl i32 %indvar.i4, 3                  ; <i32> [#uses=1]
  %scevgep57 = getelementptr i8* %18, i32 %tmp56  ; <i8*> [#uses=1]
  %scevgep.i6 = bitcast i8* %scevgep57 to double* ; <double*> [#uses=1]
  %44 = mul i32 %seed.01.i, 7141                  ; <i32> [#uses=1]
  %45 = add nsw i32 %44, 54773                    ; <i32> [#uses=1]
  %46 = srem i32 %45, 259200                      ; <i32> [#uses=2]
  %47 = sitofp i32 %46 to double                  ; <double> [#uses=1]
  %48 = fmul double %47, 0x3ED02E85C0898B71       ; <double> [#uses=1]
  store double %48, double* %scevgep.i6, align 4
  %indvar.next.i7 = add i32 %indvar.i4, 1         ; <i32> [#uses=2]
  %exitcond55 = icmp eq i32 %indvar.next.i7, 1024 ; <i1> [#uses=1]
  br i1 %exitcond55, label %putdata.exit, label %bb.i

putdata.exit:                                     ; preds = %bb.i
  %49 = call i32 @gettimeofday(%struct.timeval* noalias %tv.i3, %struct.timeval* noalias null) nounwind ; <i32> [#uses=0]
  br label %bb5

bb5:                                              ; preds = %bb8, %putdata.exit
  %i.032 = phi i32 [ 0, %putdata.exit ], [ %61, %bb8 ] ; <i32> [#uses=1]
  call void @llvm.memcpy.i32(i8* %17, i8* %18, i32 16384, i32 8)
  call fastcc void @cdft(i32 1, double* %25, i32* %15, double* %4) nounwind
  br label %bb6

bb6:                                              ; preds = %bb6, %bb5
  %k.030 = phi i32 [ 0, %bb5 ], [ %60, %bb6 ]     ; <i32> [#uses=2]
  %tmp44 = shl i32 %k.030, 4                      ; <i32> [#uses=3]
  %tmp4594 = or i32 %tmp44, 8                     ; <i32> [#uses=2]
  %scevgep46 = getelementptr i8* %17, i32 %tmp4594 ; <i8*> [#uses=1]
  %scevgep4647 = bitcast i8* %scevgep46 to double* ; <double*> [#uses=2]
  %scevgep48 = getelementptr i8* %17, i32 %tmp44  ; <i8*> [#uses=1]
  %scevgep4849 = bitcast i8* %scevgep48 to double* ; <double*> [#uses=2]
  %scevgep50 = getelementptr i8* %16, i32 %tmp4594 ; <i8*> [#uses=1]
  %scevgep5051 = bitcast i8* %scevgep50 to double* ; <double*> [#uses=1]
  %scevgep52 = getelementptr i8* %16, i32 %tmp44  ; <i8*> [#uses=1]
  %scevgep5253 = bitcast i8* %scevgep52 to double* ; <double*> [#uses=1]
  %50 = load double* %scevgep4849, align 4        ; <double> [#uses=2]
  %51 = load double* %scevgep5253, align 4        ; <double> [#uses=2]
  %52 = load double* %scevgep4647, align 4        ; <double> [#uses=2]
  %53 = load double* %scevgep5051, align 4        ; <double> [#uses=2]
  %54 = fmul double %50, %51                      ; <double> [#uses=1]
  %55 = fmul double %52, %53                      ; <double> [#uses=1]
  %56 = fsub double %54, %55                      ; <double> [#uses=1]
  store double %56, double* %scevgep4849, align 4
  %57 = fmul double %50, %53                      ; <double> [#uses=1]
  %58 = fmul double %52, %51                      ; <double> [#uses=1]
  %59 = fadd double %57, %58                      ; <double> [#uses=1]
  store double %59, double* %scevgep4647, align 4
  %60 = add nsw i32 %k.030, 1                     ; <i32> [#uses=2]
  %exitcond43 = icmp eq i32 %60, 1024             ; <i1> [#uses=1]
  br i1 %exitcond43, label %bb8, label %bb6

bb8:                                              ; preds = %bb6
  call fastcc void @cdft(i32 -1, double* %25, i32* %15, double* %4) nounwind
  %61 = add nsw i32 %i.032, 1                     ; <i32> [#uses=2]
  %exitcond54 = icmp eq i32 %61, 150000           ; <i1> [#uses=1]
  br i1 %exitcond54, label %bb10, label %bb5

bb10:                                             ; preds = %bb8
  %62 = call i32 @gettimeofday(%struct.timeval* noalias %tv.i1, %struct.timeval* noalias null) nounwind ; <i32> [#uses=0]
  br label %bb11

bb11:                                             ; preds = %bb11, %bb10
  %j.129 = phi i32 [ 0, %bb10 ], [ %70, %bb11 ]   ; <i32> [#uses=2]
  %tmp = shl i32 %j.129, 4                        ; <i32> [#uses=2]
  %tmp3993 = or i32 %tmp, 8                       ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %17, i32 %tmp3993  ; <i8*> [#uses=1]
  %scevgep40 = bitcast i8* %scevgep to double*    ; <double*> [#uses=1]
  %scevgep41 = getelementptr i8* %17, i32 %tmp    ; <i8*> [#uses=1]
  %scevgep4142 = bitcast i8* %scevgep41 to double* ; <double*> [#uses=1]
  %63 = load double* %scevgep40, align 4          ; <double> [#uses=2]
  %64 = call double @fabs(double %63) nounwind readnone ; <double> [#uses=1]
  %65 = fcmp ogt double %64, 1.000000e-09         ; <i1> [#uses=1]
  %iftmp.24.0 = select i1 %65, double %63, double 0.000000e+00 ; <double> [#uses=1]
  %66 = load double* %scevgep4142, align 4        ; <double> [#uses=2]
  %67 = call double @fabs(double %66) nounwind readnone ; <double> [#uses=1]
  %68 = fcmp ogt double %67, 1.000000e-09         ; <i1> [#uses=1]
  %iftmp.25.0 = select i1 %68, double %66, double 0.000000e+00 ; <double> [#uses=1]
  %69 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), double %iftmp.25.0, double %iftmp.24.0) nounwind ; <i32> [#uses=0]
  %70 = add nsw i32 %j.129, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %70, 1024               ; <i1> [#uses=1]
  br i1 %exitcond, label %bb19, label %bb11

bb19:                                             ; preds = %bb11
  free i8* %16
  free i8* %3
  free i8* %2
  free i8* %17
  free i8* %18
  ret i32 0
}

declare noalias i8* @memalign(i32, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.memset.i32(i8* nocapture, i8, i32, i32) nounwind

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind
