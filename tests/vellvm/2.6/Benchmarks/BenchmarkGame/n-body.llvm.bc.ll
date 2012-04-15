; ModuleID = 'n-body.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = internal global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 32 ; <[5 x %struct.planet]*> [#uses=62]
@.str = private constant [6 x i8] c"%.9f\0A\00", align 1 ; <[6 x i8]*> [#uses=1]

declare double @llvm.sqrt.f64(double) nounwind readonly

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 3), align 8 ; <double> [#uses=1]
  %1 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 6), align 16 ; <double> [#uses=3]
  %2 = fmul double %0, %1                         ; <double> [#uses=1]
  %3 = fadd double %2, 0.000000e+00               ; <double> [#uses=1]
  %4 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 4), align 32 ; <double> [#uses=1]
  %5 = fmul double %4, %1                         ; <double> [#uses=1]
  %6 = fadd double %5, 0.000000e+00               ; <double> [#uses=1]
  %7 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 5), align 8 ; <double> [#uses=1]
  %8 = fmul double %7, %1                         ; <double> [#uses=1]
  %9 = fadd double %8, 0.000000e+00               ; <double> [#uses=1]
  %10 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 1, i32 3), align 8 ; <double> [#uses=1]
  %11 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 1, i32 6), align 8 ; <double> [#uses=3]
  %12 = fmul double %10, %11                      ; <double> [#uses=1]
  %13 = fadd double %12, %3                       ; <double> [#uses=1]
  %14 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 1, i32 4), align 8 ; <double> [#uses=1]
  %15 = fmul double %14, %11                      ; <double> [#uses=1]
  %16 = fadd double %15, %6                       ; <double> [#uses=1]
  %17 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 1, i32 5), align 8 ; <double> [#uses=1]
  %18 = fmul double %17, %11                      ; <double> [#uses=1]
  %19 = fadd double %18, %9                       ; <double> [#uses=1]
  %20 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 2, i32 3), align 8 ; <double> [#uses=1]
  %21 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 2, i32 6), align 16 ; <double> [#uses=3]
  %22 = fmul double %20, %21                      ; <double> [#uses=1]
  %23 = fadd double %22, %13                      ; <double> [#uses=1]
  %24 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 2, i32 4), align 16 ; <double> [#uses=1]
  %25 = fmul double %24, %21                      ; <double> [#uses=1]
  %26 = fadd double %25, %16                      ; <double> [#uses=1]
  %27 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 2, i32 5), align 8 ; <double> [#uses=1]
  %28 = fmul double %27, %21                      ; <double> [#uses=1]
  %29 = fadd double %28, %19                      ; <double> [#uses=1]
  %30 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 3, i32 3), align 8 ; <double> [#uses=1]
  %31 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 3, i32 6), align 8 ; <double> [#uses=3]
  %32 = fmul double %30, %31                      ; <double> [#uses=1]
  %33 = fadd double %32, %23                      ; <double> [#uses=1]
  %34 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 3, i32 4), align 8 ; <double> [#uses=1]
  %35 = fmul double %34, %31                      ; <double> [#uses=1]
  %36 = fadd double %35, %26                      ; <double> [#uses=1]
  %37 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 3, i32 5), align 8 ; <double> [#uses=1]
  %38 = fmul double %37, %31                      ; <double> [#uses=1]
  %39 = fadd double %38, %29                      ; <double> [#uses=1]
  %40 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 4, i32 3), align 8 ; <double> [#uses=1]
  %41 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 4, i32 6), align 16 ; <double> [#uses=3]
  %42 = fmul double %40, %41                      ; <double> [#uses=1]
  %43 = fadd double %42, %33                      ; <double> [#uses=1]
  %44 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 4, i32 4), align 32 ; <double> [#uses=1]
  %45 = fmul double %44, %41                      ; <double> [#uses=1]
  %46 = fadd double %45, %36                      ; <double> [#uses=1]
  %47 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 4, i32 5), align 8 ; <double> [#uses=1]
  %48 = fmul double %47, %41                      ; <double> [#uses=1]
  %49 = fadd double %48, %39                      ; <double> [#uses=1]
  %50 = fdiv double %43, 0xC043BD3CC9BE45DE       ; <double> [#uses=1]
  store double %50, double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 3), align 8
  %51 = fdiv double %46, 0xC043BD3CC9BE45DE       ; <double> [#uses=1]
  store double %51, double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 4), align 32
  %52 = fdiv double %49, 0xC043BD3CC9BE45DE       ; <double> [#uses=1]
  store double %52, double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i32 0, i32 0, i32 5), align 8
  br label %bb.i11

bb.i11:                                           ; preds = %bb3.i28, %entry
  %e.07.i3 = phi double [ 0.000000e+00, %entry ], [ %e.1.lcssa.i26, %bb3.i28 ] ; <double> [#uses=1]
  %i.06.i4 = phi i32 [ 0, %entry ], [ %j.03.i5, %bb3.i28 ] ; <i32> [#uses=9]
  %j.03.i5 = add i32 %i.06.i4, 1                  ; <i32> [#uses=4]
  %tmp57 = sub i32 4, %i.06.i4                    ; <i32> [#uses=1]
  %scevgep22.i7 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 6 ; <double*> [#uses=1]
  %scevgep27.i8 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 5 ; <double*> [#uses=1]
  %scevgep28.i9 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 4 ; <double*> [#uses=1]
  %scevgep29.i10 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 3 ; <double*> [#uses=1]
  %53 = load double* %scevgep22.i7, align 8       ; <double> [#uses=2]
  %54 = fmul double %53, 5.000000e-01             ; <double> [#uses=1]
  %55 = load double* %scevgep29.i10, align 8      ; <double> [#uses=2]
  %56 = fmul double %55, %55                      ; <double> [#uses=1]
  %57 = load double* %scevgep28.i9, align 8       ; <double> [#uses=2]
  %58 = fmul double %57, %57                      ; <double> [#uses=1]
  %59 = fadd double %56, %58                      ; <double> [#uses=1]
  %60 = load double* %scevgep27.i8, align 8       ; <double> [#uses=2]
  %61 = fmul double %60, %60                      ; <double> [#uses=1]
  %62 = fadd double %59, %61                      ; <double> [#uses=1]
  %63 = fmul double %54, %62                      ; <double> [#uses=1]
  %64 = fadd double %63, %e.07.i3                 ; <double> [#uses=2]
  %65 = icmp slt i32 %j.03.i5, 5                  ; <i1> [#uses=1]
  br i1 %65, label %bb.nph.i15, label %bb3.i28

bb.nph.i15:                                       ; preds = %bb.i11
  %scevgep23.i12 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 2 ; <double*> [#uses=1]
  %scevgep24.i13 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 1 ; <double*> [#uses=1]
  %scevgep2526.i14 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i4, i32 0 ; <double*> [#uses=1]
  %66 = load double* %scevgep2526.i14, align 8    ; <double> [#uses=1]
  %67 = load double* %scevgep24.i13, align 8      ; <double> [#uses=1]
  %68 = load double* %scevgep23.i12, align 8      ; <double> [#uses=1]
  br label %bb1.i25

bb1.i25:                                          ; preds = %bb1.i25, %bb.nph.i15
  %indvar.i16 = phi i32 [ 0, %bb.nph.i15 ], [ %indvar.next.i23, %bb1.i25 ] ; <i32> [#uses=2]
  %e.12.i17 = phi double [ %64, %bb.nph.i15 ], [ %84, %bb1.i25 ] ; <double> [#uses=1]
  %tmp60 = add i32 %indvar.i16, %j.03.i5          ; <i32> [#uses=4]
  %scevgep14.i19 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp60, i32 0 ; <double*> [#uses=1]
  %scevgep15.i20 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp60, i32 1 ; <double*> [#uses=1]
  %scevgep16.i21 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp60, i32 2 ; <double*> [#uses=1]
  %scevgep17.i22 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp60, i32 6 ; <double*> [#uses=1]
  %69 = load double* %scevgep14.i19, align 8      ; <double> [#uses=1]
  %70 = fsub double %66, %69                      ; <double> [#uses=2]
  %71 = load double* %scevgep15.i20, align 8      ; <double> [#uses=1]
  %72 = fsub double %67, %71                      ; <double> [#uses=2]
  %73 = load double* %scevgep16.i21, align 8      ; <double> [#uses=1]
  %74 = fsub double %68, %73                      ; <double> [#uses=2]
  %75 = fmul double %70, %70                      ; <double> [#uses=1]
  %76 = fmul double %72, %72                      ; <double> [#uses=1]
  %77 = fadd double %75, %76                      ; <double> [#uses=1]
  %78 = fmul double %74, %74                      ; <double> [#uses=1]
  %79 = fadd double %77, %78                      ; <double> [#uses=1]
  %80 = tail call double @llvm.sqrt.f64(double %79) nounwind ; <double> [#uses=1]
  %81 = load double* %scevgep17.i22, align 8      ; <double> [#uses=1]
  %82 = fmul double %53, %81                      ; <double> [#uses=1]
  %83 = fdiv double %82, %80                      ; <double> [#uses=1]
  %84 = fsub double %e.12.i17, %83                ; <double> [#uses=2]
  %indvar.next.i23 = add i32 %indvar.i16, 1       ; <i32> [#uses=2]
  %exitcond58 = icmp eq i32 %indvar.next.i23, %tmp57 ; <i1> [#uses=1]
  br i1 %exitcond58, label %bb3.i28, label %bb1.i25

bb3.i28:                                          ; preds = %bb1.i25, %bb.i11
  %e.1.lcssa.i26 = phi double [ %64, %bb.i11 ], [ %84, %bb1.i25 ] ; <double> [#uses=2]
  %exitcond66 = icmp eq i32 %j.03.i5, 5           ; <i1> [#uses=1]
  br i1 %exitcond66, label %energy.exit30, label %bb.i11

energy.exit30:                                    ; preds = %bb3.i28
  %85 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %e.1.lcssa.i26) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %advance.exit, %energy.exit30
  %indvar = phi i32 [ 0, %energy.exit30 ], [ %indvar.next, %advance.exit ] ; <i32> [#uses=1]
  br label %bb3.preheader.i

bb.nph5.i:                                        ; preds = %bb3.preheader.i
  %scevgep31.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 6 ; <double*> [#uses=1]
  %scevgep35.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 2 ; <double*> [#uses=1]
  %scevgep36.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 1 ; <double*> [#uses=1]
  %scevgep3738.i = getelementptr inbounds [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 0 ; <double*> [#uses=1]
  %.pre.i = load double* %scevgep31.i, align 8    ; <double> [#uses=3]
  %86 = load double* %scevgep3738.i, align 8      ; <double> [#uses=1]
  %87 = load double* %scevgep36.i, align 8        ; <double> [#uses=1]
  %88 = load double* %scevgep35.i, align 8        ; <double> [#uses=1]
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %bb.nph5.i
  %indvar.i1 = phi i32 [ 0, %bb.nph5.i ], [ %indvar.next.i5, %bb2.i ] ; <i32> [#uses=2]
  %tmp18.i = add i32 %indvar.i1, %j.03.i7         ; <i32> [#uses=7]
  %scevgep1920.i = getelementptr inbounds [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 0 ; <double*> [#uses=1]
  %scevgep21.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 1 ; <double*> [#uses=1]
  %scevgep22.i2 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 2 ; <double*> [#uses=1]
  %scevgep23.i3 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 6 ; <double*> [#uses=1]
  %scevgep24.i4 = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 3 ; <double*> [#uses=2]
  %scevgep25.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 4 ; <double*> [#uses=2]
  %scevgep26.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp18.i, i32 5 ; <double*> [#uses=2]
  %89 = load double* %scevgep1920.i, align 8      ; <double> [#uses=1]
  %90 = fsub double %86, %89                      ; <double> [#uses=4]
  %91 = load double* %scevgep21.i, align 8        ; <double> [#uses=1]
  %92 = fsub double %87, %91                      ; <double> [#uses=4]
  %93 = load double* %scevgep22.i2, align 8       ; <double> [#uses=1]
  %94 = fsub double %88, %93                      ; <double> [#uses=4]
  %95 = fmul double %90, %90                      ; <double> [#uses=1]
  %96 = fmul double %92, %92                      ; <double> [#uses=1]
  %97 = fadd double %95, %96                      ; <double> [#uses=1]
  %98 = fmul double %94, %94                      ; <double> [#uses=1]
  %99 = fadd double %97, %98                      ; <double> [#uses=1]
  %100 = tail call double @llvm.sqrt.f64(double %99) nounwind ; <double> [#uses=3]
  %101 = fmul double %100, %100                   ; <double> [#uses=1]
  %102 = fmul double %101, %100                   ; <double> [#uses=1]
  %103 = fdiv double 1.000000e-02, %102           ; <double> [#uses=6]
  %104 = load double* %scevgep34.i, align 8       ; <double> [#uses=1]
  %105 = load double* %scevgep23.i3, align 8      ; <double> [#uses=3]
  %106 = fmul double %105, %90                    ; <double> [#uses=1]
  %107 = fmul double %106, %103                   ; <double> [#uses=1]
  %108 = fsub double %104, %107                   ; <double> [#uses=1]
  store double %108, double* %scevgep34.i, align 8
  %109 = load double* %scevgep33.i, align 8       ; <double> [#uses=1]
  %110 = fmul double %105, %92                    ; <double> [#uses=1]
  %111 = fmul double %110, %103                   ; <double> [#uses=1]
  %112 = fsub double %109, %111                   ; <double> [#uses=1]
  store double %112, double* %scevgep33.i, align 8
  %113 = load double* %scevgep32.i, align 8       ; <double> [#uses=1]
  %114 = fmul double %105, %94                    ; <double> [#uses=1]
  %115 = fmul double %114, %103                   ; <double> [#uses=1]
  %116 = fsub double %113, %115                   ; <double> [#uses=1]
  store double %116, double* %scevgep32.i, align 8
  %117 = load double* %scevgep24.i4, align 8      ; <double> [#uses=1]
  %118 = fmul double %.pre.i, %90                 ; <double> [#uses=1]
  %119 = fmul double %118, %103                   ; <double> [#uses=1]
  %120 = fadd double %117, %119                   ; <double> [#uses=1]
  store double %120, double* %scevgep24.i4, align 8
  %121 = load double* %scevgep25.i, align 8       ; <double> [#uses=1]
  %122 = fmul double %.pre.i, %92                 ; <double> [#uses=1]
  %123 = fmul double %122, %103                   ; <double> [#uses=1]
  %124 = fadd double %121, %123                   ; <double> [#uses=1]
  store double %124, double* %scevgep25.i, align 8
  %125 = load double* %scevgep26.i, align 8       ; <double> [#uses=1]
  %126 = fmul double %.pre.i, %94                 ; <double> [#uses=1]
  %127 = fmul double %126, %103                   ; <double> [#uses=1]
  %128 = fadd double %125, %127                   ; <double> [#uses=1]
  store double %128, double* %scevgep26.i, align 8
  %indvar.next.i5 = add i32 %indvar.i1, 1         ; <i32> [#uses=2]
  %exitcond16.i = icmp eq i32 %indvar.next.i5, %tmp15.i ; <i1> [#uses=1]
  br i1 %exitcond16.i, label %bb4.i, label %bb2.i

bb4.i:                                            ; preds = %bb3.preheader.i, %bb2.i
  %exitcond27.i = icmp eq i32 %j.03.i7, 5         ; <i1> [#uses=1]
  br i1 %exitcond27.i, label %bb7.i, label %bb3.preheader.i

bb3.preheader.i:                                  ; preds = %bb4.i, %bb
  %i.06.i6 = phi i32 [ 0, %bb ], [ %j.03.i7, %bb4.i ] ; <i32> [#uses=9]
  %j.03.i7 = add i32 %i.06.i6, 1                  ; <i32> [#uses=4]
  %tmp15.i = sub i32 4, %i.06.i6                  ; <i32> [#uses=1]
  %scevgep32.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 5 ; <double*> [#uses=2]
  %scevgep33.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 4 ; <double*> [#uses=2]
  %scevgep34.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i6, i32 3 ; <double*> [#uses=2]
  %129 = icmp slt i32 %j.03.i7, 5                 ; <i1> [#uses=1]
  br i1 %129, label %bb.nph5.i, label %bb4.i

bb7.i:                                            ; preds = %bb7.i, %bb4.i
  %i.11.i = phi i32 [ %142, %bb7.i ], [ 0, %bb4.i ] ; <i32> [#uses=7]
  %scevgep.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.11.i, i32 2 ; <double*> [#uses=2]
  %scevgep8.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.11.i, i32 5 ; <double*> [#uses=1]
  %scevgep9.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.11.i, i32 1 ; <double*> [#uses=2]
  %scevgep10.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.11.i, i32 4 ; <double*> [#uses=1]
  %scevgep1112.i = getelementptr inbounds [5 x %struct.planet]* @bodies, i32 0, i32 %i.11.i, i32 0 ; <double*> [#uses=2]
  %scevgep13.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.11.i, i32 3 ; <double*> [#uses=1]
  %130 = load double* %scevgep1112.i, align 8     ; <double> [#uses=1]
  %131 = load double* %scevgep13.i, align 8       ; <double> [#uses=1]
  %132 = fmul double %131, 1.000000e-02           ; <double> [#uses=1]
  %133 = fadd double %130, %132                   ; <double> [#uses=1]
  store double %133, double* %scevgep1112.i, align 8
  %134 = load double* %scevgep9.i, align 8        ; <double> [#uses=1]
  %135 = load double* %scevgep10.i, align 8       ; <double> [#uses=1]
  %136 = fmul double %135, 1.000000e-02           ; <double> [#uses=1]
  %137 = fadd double %134, %136                   ; <double> [#uses=1]
  store double %137, double* %scevgep9.i, align 8
  %138 = load double* %scevgep.i, align 8         ; <double> [#uses=1]
  %139 = load double* %scevgep8.i, align 8        ; <double> [#uses=1]
  %140 = fmul double %139, 1.000000e-02           ; <double> [#uses=1]
  %141 = fadd double %138, %140                   ; <double> [#uses=1]
  store double %141, double* %scevgep.i, align 8
  %142 = add nsw i32 %i.11.i, 1                   ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %142, 5               ; <i1> [#uses=1]
  br i1 %exitcond.i, label %advance.exit, label %bb7.i

advance.exit:                                     ; preds = %bb7.i
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond55 = icmp eq i32 %indvar.next, 5000000 ; <i1> [#uses=1]
  br i1 %exitcond55, label %bb.i1, label %bb

bb.i1:                                            ; preds = %bb3.i, %advance.exit
  %e.07.i = phi double [ %e.1.lcssa.i, %bb3.i ], [ 0.000000e+00, %advance.exit ] ; <double> [#uses=1]
  %i.06.i = phi i32 [ %j.03.i, %bb3.i ], [ 0, %advance.exit ] ; <i32> [#uses=9]
  %j.03.i = add i32 %i.06.i, 1                    ; <i32> [#uses=4]
  %tmp36 = sub i32 4, %i.06.i                     ; <i32> [#uses=1]
  %scevgep22.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 6 ; <double*> [#uses=1]
  %scevgep27.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 5 ; <double*> [#uses=1]
  %scevgep28.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 4 ; <double*> [#uses=1]
  %scevgep29.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 3 ; <double*> [#uses=1]
  %143 = load double* %scevgep22.i, align 8       ; <double> [#uses=2]
  %144 = fmul double %143, 5.000000e-01           ; <double> [#uses=1]
  %145 = load double* %scevgep29.i, align 8       ; <double> [#uses=2]
  %146 = fmul double %145, %145                   ; <double> [#uses=1]
  %147 = load double* %scevgep28.i, align 8       ; <double> [#uses=2]
  %148 = fmul double %147, %147                   ; <double> [#uses=1]
  %149 = fadd double %146, %148                   ; <double> [#uses=1]
  %150 = load double* %scevgep27.i, align 8       ; <double> [#uses=2]
  %151 = fmul double %150, %150                   ; <double> [#uses=1]
  %152 = fadd double %149, %151                   ; <double> [#uses=1]
  %153 = fmul double %144, %152                   ; <double> [#uses=1]
  %154 = fadd double %153, %e.07.i                ; <double> [#uses=2]
  %155 = icmp slt i32 %j.03.i, 5                  ; <i1> [#uses=1]
  br i1 %155, label %bb.nph.i, label %bb3.i

bb.nph.i:                                         ; preds = %bb.i1
  %scevgep23.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 2 ; <double*> [#uses=1]
  %scevgep24.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 1 ; <double*> [#uses=1]
  %scevgep2526.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %i.06.i, i32 0 ; <double*> [#uses=1]
  %156 = load double* %scevgep2526.i, align 8     ; <double> [#uses=1]
  %157 = load double* %scevgep24.i, align 8       ; <double> [#uses=1]
  %158 = load double* %scevgep23.i, align 8       ; <double> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb.nph.i
  %indvar.i = phi i32 [ 0, %bb.nph.i ], [ %indvar.next.i, %bb1.i ] ; <i32> [#uses=2]
  %e.12.i = phi double [ %154, %bb.nph.i ], [ %174, %bb1.i ] ; <double> [#uses=1]
  %tmp38 = add i32 %indvar.i, %j.03.i             ; <i32> [#uses=4]
  %scevgep14.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp38, i32 0 ; <double*> [#uses=1]
  %scevgep15.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp38, i32 1 ; <double*> [#uses=1]
  %scevgep16.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp38, i32 2 ; <double*> [#uses=1]
  %scevgep17.i = getelementptr [5 x %struct.planet]* @bodies, i32 0, i32 %tmp38, i32 6 ; <double*> [#uses=1]
  %159 = load double* %scevgep14.i, align 8       ; <double> [#uses=1]
  %160 = fsub double %156, %159                   ; <double> [#uses=2]
  %161 = load double* %scevgep15.i, align 8       ; <double> [#uses=1]
  %162 = fsub double %157, %161                   ; <double> [#uses=2]
  %163 = load double* %scevgep16.i, align 8       ; <double> [#uses=1]
  %164 = fsub double %158, %163                   ; <double> [#uses=2]
  %165 = fmul double %160, %160                   ; <double> [#uses=1]
  %166 = fmul double %162, %162                   ; <double> [#uses=1]
  %167 = fadd double %165, %166                   ; <double> [#uses=1]
  %168 = fmul double %164, %164                   ; <double> [#uses=1]
  %169 = fadd double %167, %168                   ; <double> [#uses=1]
  %170 = tail call double @llvm.sqrt.f64(double %169) nounwind ; <double> [#uses=1]
  %171 = load double* %scevgep17.i, align 8       ; <double> [#uses=1]
  %172 = fmul double %143, %171                   ; <double> [#uses=1]
  %173 = fdiv double %172, %170                   ; <double> [#uses=1]
  %174 = fsub double %e.12.i, %173                ; <double> [#uses=2]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i, %tmp36  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %bb1.i, %bb.i1
  %e.1.lcssa.i = phi double [ %154, %bb.i1 ], [ %174, %bb1.i ] ; <double> [#uses=2]
  %exitcond43 = icmp eq i32 %j.03.i, 5            ; <i1> [#uses=1]
  br i1 %exitcond43, label %energy.exit, label %bb.i1

energy.exit:                                      ; preds = %bb3.i
  %175 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %e.1.lcssa.i) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
