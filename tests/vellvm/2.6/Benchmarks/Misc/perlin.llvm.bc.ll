; ModuleID = 'perlin.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@permutation = internal constant [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 32 ; <[256 x i32]*> [#uses=1]
@p = internal global [512 x i32] zeroinitializer, align 32 ; <[512 x i32]*> [#uses=16]
@.str = private constant [4 x i8] c"%e\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare double @floor(double) nounwind readnone

define i32 @main() nounwind {
entry:
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %entry
  %i.01.i = phi i32 [ 0, %entry ], [ %1, %bb.i ]  ; <i32> [#uses=4]
  %tmp = add i32 %i.01.i, 256                     ; <i32> [#uses=1]
  %scevgep3.i = getelementptr [512 x i32]* @p, i32 0, i32 %tmp ; <i32*> [#uses=1]
  %scevgep2.i = getelementptr [256 x i32]* @permutation, i32 0, i32 %i.01.i ; <i32*> [#uses=1]
  %scevgep.i = getelementptr [512 x i32]* @p, i32 0, i32 %i.01.i ; <i32*> [#uses=1]
  %0 = load i32* %scevgep2.i, align 4             ; <i32> [#uses=2]
  store i32 %0, i32* %scevgep.i, align 4
  store i32 %0, i32* %scevgep3.i, align 4
  %1 = add nsw i32 %i.01.i, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %1, 256                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5.preheader, label %bb.i

bb.nph:                                           ; preds = %bb3.preheader
  %2 = tail call double @floor(double %x.018) nounwind readnone ; <double> [#uses=2]
  %3 = fptosi double %2 to i32                    ; <i32> [#uses=1]
  %4 = and i32 %3, 255                            ; <i32> [#uses=2]
  %5 = fsub double %x.018, %2                     ; <double> [#uses=18]
  %6 = fmul double %5, %5                         ; <double> [#uses=1]
  %7 = fmul double %6, %5                         ; <double> [#uses=1]
  %8 = fmul double %5, 6.000000e+00               ; <double> [#uses=1]
  %9 = fadd double %8, -1.500000e+01              ; <double> [#uses=1]
  %10 = fmul double %9, %5                        ; <double> [#uses=1]
  %11 = fadd double %10, 1.000000e+01             ; <double> [#uses=1]
  %12 = fmul double %7, %11                       ; <double> [#uses=4]
  %13 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %4 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = add nsw i32 %4, 1                         ; <i32> [#uses=1]
  %16 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %15 ; <i32*> [#uses=1]
  %17 = load i32* %16, align 4                    ; <i32> [#uses=1]
  %18 = fadd double %5, -1.000000e+00             ; <double> [#uses=12]
  br label %bb2

bb2:                                              ; preds = %noise.exit, %bb.nph
  %sum.010 = phi double [ %sum.114, %bb.nph ], [ %168, %noise.exit ] ; <double> [#uses=1]
  %y.09 = phi double [ %y.113, %bb.nph ], [ %169, %noise.exit ] ; <double> [#uses=3]
  %19 = tail call double @floor(double %y.09) nounwind readnone ; <double> [#uses=2]
  %20 = fptosi double %19 to i32                  ; <i32> [#uses=1]
  %21 = and i32 %20, 255                          ; <i32> [#uses=2]
  %22 = fsub double %y.09, %19                    ; <double> [#uses=14]
  %23 = fmul double %22, %22                      ; <double> [#uses=1]
  %24 = fmul double %23, %22                      ; <double> [#uses=1]
  %25 = fmul double %22, 6.000000e+00             ; <double> [#uses=1]
  %26 = fadd double %25, -1.500000e+01            ; <double> [#uses=1]
  %27 = fmul double %26, %22                      ; <double> [#uses=1]
  %28 = fadd double %27, 1.000000e+01             ; <double> [#uses=1]
  %29 = fmul double %24, %28                      ; <double> [#uses=2]
  %30 = add nsw i32 %21, %14                      ; <i32> [#uses=2]
  %31 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %30 ; <i32*> [#uses=1]
  %32 = load i32* %31, align 4                    ; <i32> [#uses=2]
  %33 = add nsw i32 %32, 99                       ; <i32> [#uses=1]
  %34 = add nsw i32 %30, 1                        ; <i32> [#uses=1]
  %35 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %34 ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=2]
  %37 = add nsw i32 %36, 99                       ; <i32> [#uses=1]
  %38 = add nsw i32 %17, %21                      ; <i32> [#uses=2]
  %39 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %38 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=2]
  %41 = add nsw i32 %40, 99                       ; <i32> [#uses=1]
  %42 = add nsw i32 %38, 1                        ; <i32> [#uses=1]
  %43 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %42 ; <i32*> [#uses=1]
  %44 = load i32* %43, align 4                    ; <i32> [#uses=2]
  %45 = add nsw i32 %44, 99                       ; <i32> [#uses=1]
  %46 = fadd double %22, -1.000000e+00            ; <double> [#uses=8]
  %47 = add nsw i32 %44, 100                      ; <i32> [#uses=1]
  %48 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %47 ; <i32*> [#uses=1]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=3]
  %50 = and i32 %49, 15                           ; <i32> [#uses=3]
  %51 = icmp ugt i32 %50, 7                       ; <i1> [#uses=1]
  %iftmp.17.0.i67.i = select i1 %51, double %46, double %18 ; <double> [#uses=2]
  %52 = icmp ugt i32 %50, 3                       ; <i1> [#uses=1]
  br i1 %52, label %bb3.i68.i, label %bb10.i71.i

bb3.i68.i:                                        ; preds = %bb2
  switch i32 %50, label %bb7.i69.i [
    i32 12, label %bb10.i71.i
    i32 14, label %bb10.i71.i
  ]

bb7.i69.i:                                        ; preds = %bb3.i68.i
  br label %bb10.i71.i

bb10.i71.i:                                       ; preds = %bb7.i69.i, %bb3.i68.i, %bb3.i68.i, %bb2
  %iftmp.18.0.i70.i = phi double [ 0xBFCE147AE147B000, %bb7.i69.i ], [ %46, %bb2 ], [ %18, %bb3.i68.i ], [ %18, %bb3.i68.i ] ; <double> [#uses=2]
  %53 = and i32 %49, 1                            ; <i32> [#uses=1]
  %54 = icmp eq i32 %53, 0                        ; <i1> [#uses=1]
  br i1 %54, label %bb13.i74.i, label %bb11.i72.i

bb11.i72.i:                                       ; preds = %bb10.i71.i
  %55 = fsub double -0.000000e+00, %iftmp.17.0.i67.i ; <double> [#uses=1]
  br label %bb13.i74.i

bb13.i74.i:                                       ; preds = %bb11.i72.i, %bb10.i71.i
  %iftmp.20.0.i73.i = phi double [ %55, %bb11.i72.i ], [ %iftmp.17.0.i67.i, %bb10.i71.i ] ; <double> [#uses=1]
  %56 = and i32 %49, 2                            ; <i32> [#uses=1]
  %57 = icmp eq i32 %56, 0                        ; <i1> [#uses=1]
  br i1 %57, label %grad.exit77.i, label %bb14.i75.i

bb14.i75.i:                                       ; preds = %bb13.i74.i
  %58 = fsub double -0.000000e+00, %iftmp.18.0.i70.i ; <double> [#uses=1]
  br label %grad.exit77.i

grad.exit77.i:                                    ; preds = %bb14.i75.i, %bb13.i74.i
  %iftmp.21.0.i76.i = phi double [ %58, %bb14.i75.i ], [ %iftmp.18.0.i70.i, %bb13.i74.i ] ; <double> [#uses=1]
  %59 = fadd double %iftmp.20.0.i73.i, %iftmp.21.0.i76.i ; <double> [#uses=1]
  %60 = add nsw i32 %36, 100                      ; <i32> [#uses=1]
  %61 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %60 ; <i32*> [#uses=1]
  %62 = load i32* %61, align 4                    ; <i32> [#uses=3]
  %63 = and i32 %62, 15                           ; <i32> [#uses=3]
  %64 = icmp ugt i32 %63, 7                       ; <i1> [#uses=1]
  %iftmp.17.0.i56.i = select i1 %64, double %46, double %5 ; <double> [#uses=2]
  %65 = icmp ugt i32 %63, 3                       ; <i1> [#uses=1]
  br i1 %65, label %bb3.i57.i, label %bb10.i60.i

bb3.i57.i:                                        ; preds = %grad.exit77.i
  switch i32 %63, label %bb7.i58.i [
    i32 12, label %bb10.i60.i
    i32 14, label %bb10.i60.i
  ]

bb7.i58.i:                                        ; preds = %bb3.i57.i
  br label %bb10.i60.i

bb10.i60.i:                                       ; preds = %bb7.i58.i, %bb3.i57.i, %bb3.i57.i, %grad.exit77.i
  %iftmp.18.0.i59.i = phi double [ 0xBFCE147AE147B000, %bb7.i58.i ], [ %46, %grad.exit77.i ], [ %5, %bb3.i57.i ], [ %5, %bb3.i57.i ] ; <double> [#uses=2]
  %66 = and i32 %62, 1                            ; <i32> [#uses=1]
  %67 = icmp eq i32 %66, 0                        ; <i1> [#uses=1]
  br i1 %67, label %bb13.i63.i, label %bb11.i61.i

bb11.i61.i:                                       ; preds = %bb10.i60.i
  %68 = fsub double -0.000000e+00, %iftmp.17.0.i56.i ; <double> [#uses=1]
  br label %bb13.i63.i

bb13.i63.i:                                       ; preds = %bb11.i61.i, %bb10.i60.i
  %iftmp.20.0.i62.i = phi double [ %68, %bb11.i61.i ], [ %iftmp.17.0.i56.i, %bb10.i60.i ] ; <double> [#uses=1]
  %69 = and i32 %62, 2                            ; <i32> [#uses=1]
  %70 = icmp eq i32 %69, 0                        ; <i1> [#uses=1]
  br i1 %70, label %grad.exit66.i, label %bb14.i64.i

bb14.i64.i:                                       ; preds = %bb13.i63.i
  %71 = fsub double -0.000000e+00, %iftmp.18.0.i59.i ; <double> [#uses=1]
  br label %grad.exit66.i

grad.exit66.i:                                    ; preds = %bb14.i64.i, %bb13.i63.i
  %iftmp.21.0.i65.i = phi double [ %71, %bb14.i64.i ], [ %iftmp.18.0.i59.i, %bb13.i63.i ] ; <double> [#uses=1]
  %72 = fadd double %iftmp.20.0.i62.i, %iftmp.21.0.i65.i ; <double> [#uses=2]
  %73 = fsub double %59, %72                      ; <double> [#uses=1]
  %74 = fmul double %73, %12                      ; <double> [#uses=1]
  %75 = fadd double %74, %72                      ; <double> [#uses=1]
  %76 = add nsw i32 %40, 100                      ; <i32> [#uses=1]
  %77 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %76 ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=3]
  %79 = and i32 %78, 15                           ; <i32> [#uses=3]
  %80 = icmp ugt i32 %79, 7                       ; <i1> [#uses=1]
  %iftmp.17.0.i45.i = select i1 %80, double %22, double %18 ; <double> [#uses=2]
  %81 = icmp ugt i32 %79, 3                       ; <i1> [#uses=1]
  br i1 %81, label %bb3.i46.i, label %bb10.i49.i

bb3.i46.i:                                        ; preds = %grad.exit66.i
  switch i32 %79, label %bb7.i47.i [
    i32 12, label %bb10.i49.i
    i32 14, label %bb10.i49.i
  ]

bb7.i47.i:                                        ; preds = %bb3.i46.i
  br label %bb10.i49.i

bb10.i49.i:                                       ; preds = %bb7.i47.i, %bb3.i46.i, %bb3.i46.i, %grad.exit66.i
  %iftmp.18.0.i48.i = phi double [ 0xBFCE147AE147B000, %bb7.i47.i ], [ %22, %grad.exit66.i ], [ %18, %bb3.i46.i ], [ %18, %bb3.i46.i ] ; <double> [#uses=2]
  %82 = and i32 %78, 1                            ; <i32> [#uses=1]
  %83 = icmp eq i32 %82, 0                        ; <i1> [#uses=1]
  br i1 %83, label %bb13.i52.i, label %bb11.i50.i

bb11.i50.i:                                       ; preds = %bb10.i49.i
  %84 = fsub double -0.000000e+00, %iftmp.17.0.i45.i ; <double> [#uses=1]
  br label %bb13.i52.i

bb13.i52.i:                                       ; preds = %bb11.i50.i, %bb10.i49.i
  %iftmp.20.0.i51.i = phi double [ %84, %bb11.i50.i ], [ %iftmp.17.0.i45.i, %bb10.i49.i ] ; <double> [#uses=1]
  %85 = and i32 %78, 2                            ; <i32> [#uses=1]
  %86 = icmp eq i32 %85, 0                        ; <i1> [#uses=1]
  br i1 %86, label %grad.exit55.i, label %bb14.i53.i

bb14.i53.i:                                       ; preds = %bb13.i52.i
  %87 = fsub double -0.000000e+00, %iftmp.18.0.i48.i ; <double> [#uses=1]
  br label %grad.exit55.i

grad.exit55.i:                                    ; preds = %bb14.i53.i, %bb13.i52.i
  %iftmp.21.0.i54.i = phi double [ %87, %bb14.i53.i ], [ %iftmp.18.0.i48.i, %bb13.i52.i ] ; <double> [#uses=1]
  %88 = fadd double %iftmp.20.0.i51.i, %iftmp.21.0.i54.i ; <double> [#uses=1]
  %89 = add nsw i32 %32, 100                      ; <i32> [#uses=1]
  %90 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %89 ; <i32*> [#uses=1]
  %91 = load i32* %90, align 4                    ; <i32> [#uses=3]
  %92 = and i32 %91, 15                           ; <i32> [#uses=3]
  %93 = icmp ugt i32 %92, 7                       ; <i1> [#uses=1]
  %iftmp.17.0.i34.i = select i1 %93, double %22, double %5 ; <double> [#uses=2]
  %94 = icmp ugt i32 %92, 3                       ; <i1> [#uses=1]
  br i1 %94, label %bb3.i35.i, label %bb10.i38.i

bb3.i35.i:                                        ; preds = %grad.exit55.i
  switch i32 %92, label %bb7.i36.i [
    i32 12, label %bb10.i38.i
    i32 14, label %bb10.i38.i
  ]

bb7.i36.i:                                        ; preds = %bb3.i35.i
  br label %bb10.i38.i

bb10.i38.i:                                       ; preds = %bb7.i36.i, %bb3.i35.i, %bb3.i35.i, %grad.exit55.i
  %iftmp.18.0.i37.i = phi double [ 0xBFCE147AE147B000, %bb7.i36.i ], [ %22, %grad.exit55.i ], [ %5, %bb3.i35.i ], [ %5, %bb3.i35.i ] ; <double> [#uses=2]
  %95 = and i32 %91, 1                            ; <i32> [#uses=1]
  %96 = icmp eq i32 %95, 0                        ; <i1> [#uses=1]
  br i1 %96, label %bb13.i41.i, label %bb11.i39.i

bb11.i39.i:                                       ; preds = %bb10.i38.i
  %97 = fsub double -0.000000e+00, %iftmp.17.0.i34.i ; <double> [#uses=1]
  br label %bb13.i41.i

bb13.i41.i:                                       ; preds = %bb11.i39.i, %bb10.i38.i
  %iftmp.20.0.i40.i = phi double [ %97, %bb11.i39.i ], [ %iftmp.17.0.i34.i, %bb10.i38.i ] ; <double> [#uses=1]
  %98 = and i32 %91, 2                            ; <i32> [#uses=1]
  %99 = icmp eq i32 %98, 0                        ; <i1> [#uses=1]
  br i1 %99, label %grad.exit44.i, label %bb14.i42.i

bb14.i42.i:                                       ; preds = %bb13.i41.i
  %100 = fsub double -0.000000e+00, %iftmp.18.0.i37.i ; <double> [#uses=1]
  br label %grad.exit44.i

grad.exit44.i:                                    ; preds = %bb14.i42.i, %bb13.i41.i
  %iftmp.21.0.i43.i = phi double [ %100, %bb14.i42.i ], [ %iftmp.18.0.i37.i, %bb13.i41.i ] ; <double> [#uses=1]
  %101 = fadd double %iftmp.20.0.i40.i, %iftmp.21.0.i43.i ; <double> [#uses=2]
  %102 = fsub double %88, %101                    ; <double> [#uses=1]
  %103 = fmul double %102, %12                    ; <double> [#uses=1]
  %104 = fadd double %103, %101                   ; <double> [#uses=2]
  %105 = fsub double %75, %104                    ; <double> [#uses=1]
  %106 = fmul double %105, %29                    ; <double> [#uses=1]
  %107 = fadd double %106, %104                   ; <double> [#uses=1]
  %108 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %45 ; <i32*> [#uses=1]
  %109 = load i32* %108, align 4                  ; <i32> [#uses=3]
  %110 = and i32 %109, 15                         ; <i32> [#uses=3]
  %111 = icmp ugt i32 %110, 7                     ; <i1> [#uses=1]
  %iftmp.17.0.i23.i = select i1 %111, double %46, double %18 ; <double> [#uses=2]
  %112 = icmp ugt i32 %110, 3                     ; <i1> [#uses=1]
  br i1 %112, label %bb3.i24.i, label %bb10.i27.i

bb3.i24.i:                                        ; preds = %grad.exit44.i
  switch i32 %110, label %bb7.i25.i [
    i32 12, label %bb10.i27.i
    i32 14, label %bb10.i27.i
  ]

bb7.i25.i:                                        ; preds = %bb3.i24.i
  br label %bb10.i27.i

bb10.i27.i:                                       ; preds = %bb7.i25.i, %bb3.i24.i, %bb3.i24.i, %grad.exit44.i
  %iftmp.18.0.i26.i = phi double [ 0x3FE87AE147AE1400, %bb7.i25.i ], [ %46, %grad.exit44.i ], [ %18, %bb3.i24.i ], [ %18, %bb3.i24.i ] ; <double> [#uses=2]
  %113 = and i32 %109, 1                          ; <i32> [#uses=1]
  %114 = icmp eq i32 %113, 0                      ; <i1> [#uses=1]
  br i1 %114, label %bb13.i30.i, label %bb11.i28.i

bb11.i28.i:                                       ; preds = %bb10.i27.i
  %115 = fsub double -0.000000e+00, %iftmp.17.0.i23.i ; <double> [#uses=1]
  br label %bb13.i30.i

bb13.i30.i:                                       ; preds = %bb11.i28.i, %bb10.i27.i
  %iftmp.20.0.i29.i = phi double [ %115, %bb11.i28.i ], [ %iftmp.17.0.i23.i, %bb10.i27.i ] ; <double> [#uses=1]
  %116 = and i32 %109, 2                          ; <i32> [#uses=1]
  %117 = icmp eq i32 %116, 0                      ; <i1> [#uses=1]
  br i1 %117, label %grad.exit33.i, label %bb14.i31.i

bb14.i31.i:                                       ; preds = %bb13.i30.i
  %118 = fsub double -0.000000e+00, %iftmp.18.0.i26.i ; <double> [#uses=1]
  br label %grad.exit33.i

grad.exit33.i:                                    ; preds = %bb14.i31.i, %bb13.i30.i
  %iftmp.21.0.i32.i = phi double [ %118, %bb14.i31.i ], [ %iftmp.18.0.i26.i, %bb13.i30.i ] ; <double> [#uses=1]
  %119 = fadd double %iftmp.20.0.i29.i, %iftmp.21.0.i32.i ; <double> [#uses=1]
  %120 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %37 ; <i32*> [#uses=1]
  %121 = load i32* %120, align 4                  ; <i32> [#uses=3]
  %122 = and i32 %121, 15                         ; <i32> [#uses=3]
  %123 = icmp ugt i32 %122, 7                     ; <i1> [#uses=1]
  %iftmp.17.0.i12.i = select i1 %123, double %46, double %5 ; <double> [#uses=2]
  %124 = icmp ugt i32 %122, 3                     ; <i1> [#uses=1]
  br i1 %124, label %bb3.i13.i, label %bb10.i16.i

bb3.i13.i:                                        ; preds = %grad.exit33.i
  switch i32 %122, label %bb7.i14.i [
    i32 12, label %bb10.i16.i
    i32 14, label %bb10.i16.i
  ]

bb7.i14.i:                                        ; preds = %bb3.i13.i
  br label %bb10.i16.i

bb10.i16.i:                                       ; preds = %bb7.i14.i, %bb3.i13.i, %bb3.i13.i, %grad.exit33.i
  %iftmp.18.0.i15.i = phi double [ 0x3FE87AE147AE1400, %bb7.i14.i ], [ %46, %grad.exit33.i ], [ %5, %bb3.i13.i ], [ %5, %bb3.i13.i ] ; <double> [#uses=2]
  %125 = and i32 %121, 1                          ; <i32> [#uses=1]
  %126 = icmp eq i32 %125, 0                      ; <i1> [#uses=1]
  br i1 %126, label %bb13.i19.i, label %bb11.i17.i

bb11.i17.i:                                       ; preds = %bb10.i16.i
  %127 = fsub double -0.000000e+00, %iftmp.17.0.i12.i ; <double> [#uses=1]
  br label %bb13.i19.i

bb13.i19.i:                                       ; preds = %bb11.i17.i, %bb10.i16.i
  %iftmp.20.0.i18.i = phi double [ %127, %bb11.i17.i ], [ %iftmp.17.0.i12.i, %bb10.i16.i ] ; <double> [#uses=1]
  %128 = and i32 %121, 2                          ; <i32> [#uses=1]
  %129 = icmp eq i32 %128, 0                      ; <i1> [#uses=1]
  br i1 %129, label %grad.exit22.i, label %bb14.i20.i

bb14.i20.i:                                       ; preds = %bb13.i19.i
  %130 = fsub double -0.000000e+00, %iftmp.18.0.i15.i ; <double> [#uses=1]
  br label %grad.exit22.i

grad.exit22.i:                                    ; preds = %bb14.i20.i, %bb13.i19.i
  %iftmp.21.0.i21.i = phi double [ %130, %bb14.i20.i ], [ %iftmp.18.0.i15.i, %bb13.i19.i ] ; <double> [#uses=1]
  %131 = fadd double %iftmp.20.0.i18.i, %iftmp.21.0.i21.i ; <double> [#uses=2]
  %132 = fsub double %119, %131                   ; <double> [#uses=1]
  %133 = fmul double %132, %12                    ; <double> [#uses=1]
  %134 = fadd double %133, %131                   ; <double> [#uses=1]
  %135 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %41 ; <i32*> [#uses=1]
  %136 = load i32* %135, align 4                  ; <i32> [#uses=3]
  %137 = and i32 %136, 15                         ; <i32> [#uses=3]
  %138 = icmp ugt i32 %137, 7                     ; <i1> [#uses=1]
  %iftmp.17.0.i1.i = select i1 %138, double %22, double %18 ; <double> [#uses=2]
  %139 = icmp ugt i32 %137, 3                     ; <i1> [#uses=1]
  br i1 %139, label %bb3.i2.i, label %bb10.i5.i

bb3.i2.i:                                         ; preds = %grad.exit22.i
  switch i32 %137, label %bb7.i3.i [
    i32 12, label %bb10.i5.i
    i32 14, label %bb10.i5.i
  ]

bb7.i3.i:                                         ; preds = %bb3.i2.i
  br label %bb10.i5.i

bb10.i5.i:                                        ; preds = %bb7.i3.i, %bb3.i2.i, %bb3.i2.i, %grad.exit22.i
  %iftmp.18.0.i4.i = phi double [ 0x3FE87AE147AE1400, %bb7.i3.i ], [ %22, %grad.exit22.i ], [ %18, %bb3.i2.i ], [ %18, %bb3.i2.i ] ; <double> [#uses=2]
  %140 = and i32 %136, 1                          ; <i32> [#uses=1]
  %141 = icmp eq i32 %140, 0                      ; <i1> [#uses=1]
  br i1 %141, label %bb13.i8.i, label %bb11.i6.i

bb11.i6.i:                                        ; preds = %bb10.i5.i
  %142 = fsub double -0.000000e+00, %iftmp.17.0.i1.i ; <double> [#uses=1]
  br label %bb13.i8.i

bb13.i8.i:                                        ; preds = %bb11.i6.i, %bb10.i5.i
  %iftmp.20.0.i7.i = phi double [ %142, %bb11.i6.i ], [ %iftmp.17.0.i1.i, %bb10.i5.i ] ; <double> [#uses=1]
  %143 = and i32 %136, 2                          ; <i32> [#uses=1]
  %144 = icmp eq i32 %143, 0                      ; <i1> [#uses=1]
  br i1 %144, label %grad.exit11.i, label %bb14.i9.i

bb14.i9.i:                                        ; preds = %bb13.i8.i
  %145 = fsub double -0.000000e+00, %iftmp.18.0.i4.i ; <double> [#uses=1]
  br label %grad.exit11.i

grad.exit11.i:                                    ; preds = %bb14.i9.i, %bb13.i8.i
  %iftmp.21.0.i10.i = phi double [ %145, %bb14.i9.i ], [ %iftmp.18.0.i4.i, %bb13.i8.i ] ; <double> [#uses=1]
  %146 = fadd double %iftmp.20.0.i7.i, %iftmp.21.0.i10.i ; <double> [#uses=1]
  %147 = getelementptr inbounds [512 x i32]* @p, i32 0, i32 %33 ; <i32*> [#uses=1]
  %148 = load i32* %147, align 4                  ; <i32> [#uses=3]
  %149 = and i32 %148, 15                         ; <i32> [#uses=3]
  %150 = icmp ugt i32 %149, 7                     ; <i1> [#uses=1]
  %iftmp.17.0.i.i = select i1 %150, double %22, double %5 ; <double> [#uses=2]
  %151 = icmp ugt i32 %149, 3                     ; <i1> [#uses=1]
  br i1 %151, label %bb3.i.i, label %bb10.i.i

bb3.i.i:                                          ; preds = %grad.exit11.i
  switch i32 %149, label %bb7.i.i [
    i32 12, label %bb10.i.i
    i32 14, label %bb10.i.i
  ]

bb7.i.i:                                          ; preds = %bb3.i.i
  br label %bb10.i.i

bb10.i.i:                                         ; preds = %bb7.i.i, %bb3.i.i, %bb3.i.i, %grad.exit11.i
  %iftmp.18.0.i.i = phi double [ 0x3FE87AE147AE1400, %bb7.i.i ], [ %22, %grad.exit11.i ], [ %5, %bb3.i.i ], [ %5, %bb3.i.i ] ; <double> [#uses=2]
  %152 = and i32 %148, 1                          ; <i32> [#uses=1]
  %153 = icmp eq i32 %152, 0                      ; <i1> [#uses=1]
  br i1 %153, label %bb13.i.i, label %bb11.i.i

bb11.i.i:                                         ; preds = %bb10.i.i
  %154 = fsub double -0.000000e+00, %iftmp.17.0.i.i ; <double> [#uses=1]
  br label %bb13.i.i

bb13.i.i:                                         ; preds = %bb11.i.i, %bb10.i.i
  %iftmp.20.0.i.i = phi double [ %154, %bb11.i.i ], [ %iftmp.17.0.i.i, %bb10.i.i ] ; <double> [#uses=1]
  %155 = and i32 %148, 2                          ; <i32> [#uses=1]
  %156 = icmp eq i32 %155, 0                      ; <i1> [#uses=1]
  br i1 %156, label %noise.exit, label %bb14.i.i

bb14.i.i:                                         ; preds = %bb13.i.i
  %157 = fsub double -0.000000e+00, %iftmp.18.0.i.i ; <double> [#uses=1]
  br label %noise.exit

noise.exit:                                       ; preds = %bb14.i.i, %bb13.i.i
  %iftmp.21.0.i.i = phi double [ %157, %bb14.i.i ], [ %iftmp.18.0.i.i, %bb13.i.i ] ; <double> [#uses=1]
  %158 = fadd double %iftmp.20.0.i.i, %iftmp.21.0.i.i ; <double> [#uses=2]
  %159 = fsub double %146, %158                   ; <double> [#uses=1]
  %160 = fmul double %159, %12                    ; <double> [#uses=1]
  %161 = fadd double %160, %158                   ; <double> [#uses=2]
  %162 = fsub double %134, %161                   ; <double> [#uses=1]
  %163 = fmul double %162, %29                    ; <double> [#uses=1]
  %164 = fadd double %163, %161                   ; <double> [#uses=2]
  %165 = fsub double %107, %164                   ; <double> [#uses=1]
  %166 = fmul double %165, 0x3FED2C62745753FF     ; <double> [#uses=1]
  %167 = fadd double %166, %164                   ; <double> [#uses=1]
  %168 = fadd double %167, %sum.010               ; <double> [#uses=2]
  %169 = fadd double %y.09, 2.450000e+00          ; <double> [#uses=3]
  %170 = fcmp olt double %169, 2.323450e+01       ; <i1> [#uses=1]
  br i1 %170, label %bb2, label %bb4

bb4:                                              ; preds = %bb3.preheader, %noise.exit
  %sum.0.lcssa = phi double [ %sum.114, %bb3.preheader ], [ %168, %noise.exit ] ; <double> [#uses=3]
  %y.0.lcssa = phi double [ %y.113, %bb3.preheader ], [ %169, %noise.exit ] ; <double> [#uses=1]
  %171 = fadd double %y.0.lcssa, 1.432500e+00     ; <double> [#uses=2]
  %phitmp21 = fcmp olt double %171, 1.241240e+02  ; <i1> [#uses=1]
  br i1 %phitmp21, label %bb3.preheader, label %bb6

bb3.preheader:                                    ; preds = %bb5.preheader, %bb4
  %sum.114 = phi double [ %sum.217, %bb5.preheader ], [ %sum.0.lcssa, %bb4 ] ; <double> [#uses=2]
  %y.113 = phi double [ -3.461235e+02, %bb5.preheader ], [ %171, %bb4 ] ; <double> [#uses=3]
  %172 = fcmp olt double %y.113, 2.323450e+01     ; <i1> [#uses=1]
  br i1 %172, label %bb.nph, label %bb4

bb6:                                              ; preds = %bb4
  %173 = fadd double %x.018, 1.235000e-01         ; <double> [#uses=2]
  %phitmp = fcmp olt double %173, 2.356157e+04    ; <i1> [#uses=1]
  br i1 %phitmp, label %bb5.preheader, label %bb8

bb5.preheader:                                    ; preds = %bb6, %bb.i
  %x.018 = phi double [ %173, %bb6 ], [ -1.135257e+04, %bb.i ] ; <double> [#uses=3]
  %sum.217 = phi double [ %sum.0.lcssa, %bb6 ], [ 0.000000e+00, %bb.i ] ; <double> [#uses=1]
  br label %bb3.preheader

bb8:                                              ; preds = %bb6
  %174 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %sum.0.lcssa) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
