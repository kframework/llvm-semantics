; ModuleID = 'lpbench.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdout = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=2]
@.str1 = private constant [3 x i8] c"%f\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str2 = private constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1 ; <[33 x i8]*> [#uses=1]

declare double @fabs(double)

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb20.preheader, label %bb21

bb20.preheader:                                   ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  br label %bb20

bb3:                                              ; preds = %bb20
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=4]
  %3 = load i8* %2, align 1                       ; <i8> [#uses=2]
  %4 = zext i8 %3 to i32                          ; <i32> [#uses=1]
  %5 = add i32 %4, -45                            ; <i32> [#uses=1]
  %6 = icmp eq i8 %3, 45                          ; <i1> [#uses=1]
  br i1 %6, label %bb6, label %bb17

bb6:                                              ; preds = %bb3
  %7 = getelementptr inbounds i8* %2, i32 1       ; <i8*> [#uses=1]
  %8 = load i8* %7, align 1                       ; <i8> [#uses=2]
  %9 = zext i8 %8 to i32                          ; <i32> [#uses=1]
  %10 = add i32 %9, -103                          ; <i32> [#uses=1]
  %11 = icmp eq i8 %8, 103                        ; <i1> [#uses=1]
  br i1 %11, label %bb10, label %bb17

bb10:                                             ; preds = %bb6
  %12 = getelementptr inbounds i8* %2, i32 2      ; <i8*> [#uses=1]
  %13 = load i8* %12, align 1                     ; <i8> [#uses=2]
  %14 = zext i8 %13 to i32                        ; <i32> [#uses=1]
  %15 = add i32 %14, -97                          ; <i32> [#uses=1]
  %16 = icmp eq i8 %13, 97                        ; <i1> [#uses=1]
  br i1 %16, label %bb14, label %bb17

bb14:                                             ; preds = %bb10
  %17 = getelementptr inbounds i8* %2, i32 3      ; <i8*> [#uses=1]
  %18 = load i8* %17, align 1                     ; <i8> [#uses=1]
  %19 = zext i8 %18 to i32                        ; <i32> [#uses=1]
  br label %bb17

bb17:                                             ; preds = %bb14, %bb10, %bb6, %bb3
  %__result.0 = phi i32 [ %19, %bb14 ], [ %5, %bb3 ], [ %10, %bb6 ], [ %15, %bb10 ] ; <i32> [#uses=1]
  %20 = icmp eq i32 %__result.0, 0                ; <i1> [#uses=1]
  br i1 %20, label %bb21, label %bb19

bb19:                                             ; preds = %bb17
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb20

bb20:                                             ; preds = %bb19, %bb20.preheader
  %indvar = phi i32 [ 1, %bb20.preheader ], [ %phitmp, %bb19 ] ; <i32> [#uses=2]
  %21 = icmp slt i32 %indvar, %argc               ; <i1> [#uses=1]
  br i1 %21, label %bb3, label %bb21

bb21:                                             ; preds = %bb20, %bb17, %entry
  %ga_testing.0 = phi i8 [ 0, %entry ], [ 0, %bb20 ], [ 1, %bb17 ] ; <i8> [#uses=1]
  %22 = malloc [4000 x double*]                   ; <[4000 x double*]*> [#uses=11]
  br label %bb22

bb22:                                             ; preds = %bb22, %bb21
  %i.16 = phi i32 [ 0, %bb21 ], [ %24, %bb22 ]    ; <i32> [#uses=2]
  %scevgep10 = getelementptr [4000 x double*]* %22, i32 0, i32 %i.16 ; <double**> [#uses=1]
  %23 = malloc [2001 x double]                    ; <[2001 x double]*> [#uses=1]
  %.sub = getelementptr inbounds [2001 x double]* %23, i32 0, i32 0 ; <double*> [#uses=1]
  store double* %.sub, double** %scevgep10, align 4
  %24 = add nsw i32 %i.16, 1                      ; <i32> [#uses=2]
  %exitcond9 = icmp eq i32 %24, 2000              ; <i1> [#uses=1]
  br i1 %exitcond9, label %bb24, label %bb22

bb24:                                             ; preds = %bb22
  %25 = malloc [2000 x double]                    ; <[2000 x double]*> [#uses=8]
  %26 = malloc [2000 x i32]                       ; <[2000 x i32]*> [#uses=4]
  br label %bb2.preheader.i

bb1.i:                                            ; preds = %bb2.preheader.i, %bb1.i
  %27 = phi i32 [ %seed.0, %bb2.preheader.i ], [ %40, %bb1.i ] ; <i32> [#uses=1]
  %j.06.i = phi i32 [ 0, %bb2.preheader.i ], [ %41, %bb1.i ] ; <i32> [#uses=2]
  %scevgep20.i = getelementptr [4000 x double*]* %22, i32 0, i32 %j.06.i ; <double**> [#uses=1]
  %28 = load double** %scevgep20.i, align 4       ; <double*> [#uses=1]
  %29 = xor i32 %27, 123459876                    ; <i32> [#uses=2]
  %30 = sdiv i32 %29, 127773                      ; <i32> [#uses=2]
  %31 = mul i32 %30, 127773                       ; <i32> [#uses=1]
  %32 = sub i32 %29, %31                          ; <i32> [#uses=1]
  %33 = mul i32 %32, 16807                        ; <i32> [#uses=1]
  %34 = mul i32 %30, 2836                         ; <i32> [#uses=1]
  %35 = sub i32 %33, %34                          ; <i32> [#uses=3]
  %36 = add nsw i32 %35, 2147483647               ; <i32> [#uses=1]
  %37 = icmp slt i32 %35, 0                       ; <i1> [#uses=1]
  %..i.i = select i1 %37, i32 %36, i32 %35        ; <i32> [#uses=2]
  %38 = sitofp i32 %..i.i to double               ; <double> [#uses=1]
  %39 = fmul double %38, 0x3E00000000200FE1       ; <double> [#uses=1]
  %40 = xor i32 %..i.i, 123459876                 ; <i32> [#uses=2]
  %scevgep22.i = getelementptr double* %28, i32 %i.08.i ; <double*> [#uses=1]
  store double %39, double* %scevgep22.i, align 4
  %41 = add nsw i32 %j.06.i, 1                    ; <i32> [#uses=2]
  %exitcond19.i = icmp eq i32 %41, 2000           ; <i1> [#uses=1]
  br i1 %exitcond19.i, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %bb1.i
  %42 = add i32 %i.08.i, 1                        ; <i32> [#uses=2]
  %exitcond21.i = icmp eq i32 %42, 2000           ; <i1> [#uses=1]
  br i1 %exitcond21.i, label %bb6.i, label %bb2.preheader.i

bb2.preheader.i:                                  ; preds = %bb3.i, %bb24
  %seed.0 = phi i32 [ 1325, %bb24 ], [ %40, %bb3.i ] ; <i32> [#uses=1]
  %i.08.i = phi i32 [ 0, %bb24 ], [ %42, %bb3.i ] ; <i32> [#uses=2]
  br label %bb1.i

bb6.i:                                            ; preds = %bb6.i, %bb3.i
  %i.14.i = phi i32 [ %43, %bb6.i ], [ 0, %bb3.i ] ; <i32> [#uses=2]
  %scevgep18.i = getelementptr [2000 x double]* %25, i32 0, i32 %i.14.i ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep18.i, align 4
  %43 = add nsw i32 %i.14.i, 1                    ; <i32> [#uses=2]
  %exitcond17.i = icmp eq i32 %43, 2000           ; <i1> [#uses=1]
  br i1 %exitcond17.i, label %bb11.preheader.i, label %bb6.i

bb10.i:                                           ; preds = %bb11.preheader.i, %bb10.i
  %i.21.i = phi i32 [ 0, %bb11.preheader.i ], [ %48, %bb10.i ] ; <i32> [#uses=3]
  %scevgep.i = getelementptr [2000 x double]* %25, i32 0, i32 %i.21.i ; <double*> [#uses=2]
  %44 = load double* %scevgep.i, align 4          ; <double> [#uses=1]
  %45 = load double** %scevgep16.i, align 4       ; <double*> [#uses=1]
  %scevgep14.i = getelementptr double* %45, i32 %i.21.i ; <double*> [#uses=1]
  %46 = load double* %scevgep14.i, align 4        ; <double> [#uses=1]
  %47 = fadd double %44, %46                      ; <double> [#uses=1]
  store double %47, double* %scevgep.i, align 4
  %48 = add nsw i32 %i.21.i, 1                    ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %48, 2000             ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb12.i, label %bb10.i

bb12.i:                                           ; preds = %bb10.i
  %49 = add i32 %j.12.i, 1                        ; <i32> [#uses=2]
  %exitcond15.i = icmp eq i32 %49, 2000           ; <i1> [#uses=1]
  br i1 %exitcond15.i, label %bb.i5, label %bb11.preheader.i

bb11.preheader.i:                                 ; preds = %bb12.i, %bb6.i
  %j.12.i = phi i32 [ %49, %bb12.i ], [ 0, %bb6.i ] ; <i32> [#uses=2]
  %scevgep16.i = getelementptr [4000 x double*]* %22, i32 0, i32 %j.12.i ; <double**> [#uses=1]
  br label %bb10.i

bb.i5:                                            ; preds = %bb8.i, %bb12.i
  %50 = phi i32 [ %tmp33.i, %bb8.i ], [ 0, %bb12.i ] ; <i32> [#uses=14]
  %tmp33.i = add i32 %50, 1                       ; <i32> [#uses=10]
  %tmp35.i = add i32 %50, 2                       ; <i32> [#uses=4]
  %tmp32.i = sub i32 1999, %50                    ; <i32> [#uses=5]
  %tmp88.i = sub i32 2000, %50                    ; <i32> [#uses=2]
  %scevgep89.i = getelementptr [4000 x double*]* %22, i32 0, i32 %50 ; <double**> [#uses=1]
  %scevgep90.i = getelementptr [2000 x i32]* %26, i32 0, i32 %50 ; <i32*> [#uses=1]
  %51 = load double** %scevgep89.i, align 4       ; <double*> [#uses=8]
  %52 = icmp sgt i32 %tmp88.i, 0                  ; <i1> [#uses=1]
  br i1 %52, label %bb1.i.i, label %idamax.exit.i

bb1.i.i:                                          ; preds = %bb.i5
  %53 = icmp eq i32 %50, 1999                     ; <i1> [#uses=1]
  br i1 %53, label %idamax.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %scevgep96.i = getelementptr double* %51, i32 %50 ; <double*> [#uses=1]
  %54 = load double* %scevgep96.i, align 4        ; <double> [#uses=1]
  %55 = tail call double @fabs(double %54) nounwind readnone ; <double> [#uses=1]
  %56 = icmp sgt i32 %tmp88.i, 1                  ; <i1> [#uses=1]
  br i1 %56, label %bb10.i.i, label %idamax.exit.i

bb10.i.i:                                         ; preds = %bb10.i.i, %bb3.i.i
  %indvar13.i.i = phi i32 [ %i.18.i.i, %bb10.i.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=2]
  %dmax.39.i.i = phi double [ %dmax.2.i.i, %bb10.i.i ], [ %55, %bb3.i.i ] ; <double> [#uses=2]
  %itemp.47.i.i = phi i32 [ %itemp.3.i.i, %bb10.i.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=1]
  %tmp74.i = add i32 %indvar13.i.i, %tmp33.i      ; <i32> [#uses=1]
  %scevgep.i.i6 = getelementptr double* %51, i32 %tmp74.i ; <double*> [#uses=1]
  %i.18.i.i = add i32 %indvar13.i.i, 1            ; <i32> [#uses=3]
  %57 = load double* %scevgep.i.i6, align 4       ; <double> [#uses=1]
  %58 = tail call double @fabs(double %57) nounwind readnone ; <double> [#uses=2]
  %59 = fcmp ogt double %58, %dmax.39.i.i         ; <i1> [#uses=2]
  %itemp.3.i.i = select i1 %59, i32 %i.18.i.i, i32 %itemp.47.i.i ; <i32> [#uses=2]
  %dmax.2.i.i = select i1 %59, double %58, double %dmax.39.i.i ; <double> [#uses=1]
  %exitcond72.i = icmp eq i32 %i.18.i.i, %tmp32.i ; <i1> [#uses=1]
  br i1 %exitcond72.i, label %idamax.exit.i, label %bb10.i.i

idamax.exit.i:                                    ; preds = %bb10.i.i, %bb3.i.i, %bb1.i.i, %bb.i5
  %itemp.0.i.i = phi i32 [ -1, %bb.i5 ], [ 0, %bb1.i.i ], [ 0, %bb3.i.i ], [ %itemp.3.i.i, %bb10.i.i ] ; <i32> [#uses=1]
  %60 = add nsw i32 %itemp.0.i.i, %50             ; <i32> [#uses=6]
  store i32 %60, i32* %scevgep90.i, align 4
  %61 = getelementptr inbounds double* %51, i32 %60 ; <double*> [#uses=2]
  %62 = load double* %61, align 4                 ; <double> [#uses=2]
  %63 = fcmp une double %62, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %63, label %bb1.i7, label %bb8.i

bb1.i7:                                           ; preds = %idamax.exit.i
  %64 = icmp eq i32 %60, %50                      ; <i1> [#uses=2]
  br i1 %64, label %bb3.i9, label %bb2.i8

bb2.i8:                                           ; preds = %bb1.i7
  %scevgep91.i = getelementptr double* %51, i32 %50 ; <double*> [#uses=2]
  %65 = load double* %scevgep91.i, align 4        ; <double> [#uses=1]
  store double %65, double* %61, align 4
  store double %62, double* %scevgep91.i, align 4
  br label %bb3.i9

bb3.i9:                                           ; preds = %bb2.i8, %bb1.i7
  %scevgep93.i = getelementptr double* %51, i32 %50 ; <double*> [#uses=1]
  %66 = load double* %scevgep93.i, align 4        ; <double> [#uses=1]
  %67 = fdiv double -1.000000e+00, %66            ; <double> [#uses=1]
  %68 = icmp sgt i32 %tmp32.i, 0                  ; <i1> [#uses=3]
  br i1 %68, label %bb5.i.i, label %bb7.preheader.i

bb5.i.i:                                          ; preds = %bb5.i.i, %bb3.i9
  %i.13.i.i = phi i32 [ %71, %bb5.i.i ], [ 0, %bb3.i9 ] ; <i32> [#uses=2]
  %tmp61.i = add i32 %i.13.i.i, %tmp33.i          ; <i32> [#uses=1]
  %scevgep8.i4.i = getelementptr double* %51, i32 %tmp61.i ; <double*> [#uses=2]
  %69 = load double* %scevgep8.i4.i, align 4      ; <double> [#uses=1]
  %70 = fmul double %69, %67                      ; <double> [#uses=1]
  store double %70, double* %scevgep8.i4.i, align 4
  %71 = add nsw i32 %i.13.i.i, 1                  ; <i32> [#uses=2]
  %exitcond59.i = icmp eq i32 %71, %tmp32.i       ; <i1> [#uses=1]
  br i1 %exitcond59.i, label %bb7.preheader.i, label %bb5.i.i

bb7.preheader.i:                                  ; preds = %bb5.i.i, %bb3.i9
  %72 = icmp sgt i32 %tmp33.i, 1999               ; <i1> [#uses=1]
  br i1 %72, label %bb8.i, label %bb.nph.i

bb.nph.i:                                         ; preds = %bb7.preheader.i
  br i1 %64, label %bb.nph.split.us.i, label %bb.nph.split.i

bb.nph.split.us.i:                                ; preds = %bb.nph.i
  br i1 %68, label %bb4.us.us.i, label %bb4.us.i

bb4.us.us.i:                                      ; preds = %daxpy.exit.us.us.i, %bb.nph.split.us.i
  %indvar.i = phi i32 [ %indvar.next.i, %daxpy.exit.us.us.i ], [ 0, %bb.nph.split.us.i ] ; <i32> [#uses=3]
  %tmp36.i = add i32 %indvar.i, %tmp35.i          ; <i32> [#uses=1]
  %tmp38.i = add i32 %indvar.i, %tmp33.i          ; <i32> [#uses=1]
  %scevgep.i10 = getelementptr [4000 x double*]* %22, i32 0, i32 %tmp38.i ; <double**> [#uses=1]
  %73 = load double** %scevgep.i10, align 4       ; <double*> [#uses=2]
  %74 = getelementptr inbounds double* %73, i32 %60 ; <double*> [#uses=1]
  %75 = load double* %74, align 4                 ; <double> [#uses=2]
  %76 = fcmp une double %75, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %76, label %bb12.i.us.us.i, label %daxpy.exit.us.us.i

daxpy.exit.us.us.i:                               ; preds = %bb12.i.us.us.i, %bb4.us.us.i
  %phitmp.i = icmp sgt i32 %tmp36.i, 1999         ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %phitmp.i, label %bb8.i, label %bb4.us.us.i

bb12.i.us.us.i:                                   ; preds = %bb12.i.us.us.i, %bb4.us.us.i
  %i.12.i.us.us.i = phi i32 [ %81, %bb12.i.us.us.i ], [ 0, %bb4.us.us.i ] ; <i32> [#uses=2]
  %tmp34.i = add i32 %i.12.i.us.us.i, %tmp33.i    ; <i32> [#uses=2]
  %scevgep8.i.us.us.i = getelementptr double* %51, i32 %tmp34.i ; <double*> [#uses=1]
  %scevgep.i2.us.us.i = getelementptr double* %73, i32 %tmp34.i ; <double*> [#uses=2]
  %77 = load double* %scevgep.i2.us.us.i, align 4 ; <double> [#uses=1]
  %78 = load double* %scevgep8.i.us.us.i, align 4 ; <double> [#uses=1]
  %79 = fmul double %78, %75                      ; <double> [#uses=1]
  %80 = fadd double %77, %79                      ; <double> [#uses=1]
  store double %80, double* %scevgep.i2.us.us.i, align 4
  %81 = add nsw i32 %i.12.i.us.us.i, 1            ; <i32> [#uses=2]
  %exitcond.i11 = icmp eq i32 %81, %tmp32.i       ; <i1> [#uses=1]
  br i1 %exitcond.i11, label %daxpy.exit.us.us.i, label %bb12.i.us.us.i

bb4.us.i:                                         ; preds = %bb4.us.i, %bb.nph.split.us.i
  %indvar53.i = phi i32 [ %indvar.next54.i, %bb4.us.i ], [ 0, %bb.nph.split.us.i ] ; <i32> [#uses=2]
  %tmp56.i = add i32 %indvar53.i, %tmp35.i        ; <i32> [#uses=1]
  %phitmp28.i = icmp sgt i32 %tmp56.i, 1999       ; <i1> [#uses=1]
  %indvar.next54.i = add i32 %indvar53.i, 1       ; <i32> [#uses=1]
  br i1 %phitmp28.i, label %bb8.i, label %bb4.us.i

bb.nph.split.i:                                   ; preds = %bb.nph.i
  br i1 %68, label %bb4.us8.i, label %bb4.i

bb4.us8.i:                                        ; preds = %daxpy.exit.us10.i, %bb.nph.split.i
  %indvar46.i = phi i32 [ %indvar.next47.i, %daxpy.exit.us10.i ], [ 0, %bb.nph.split.i ] ; <i32> [#uses=3]
  %tmp49.i = add i32 %indvar46.i, %tmp35.i        ; <i32> [#uses=1]
  %tmp51.i = add i32 %indvar46.i, %tmp33.i        ; <i32> [#uses=1]
  %scevgep52.i = getelementptr [4000 x double*]* %22, i32 0, i32 %tmp51.i ; <double**> [#uses=1]
  %82 = load double** %scevgep52.i, align 4       ; <double*> [#uses=3]
  %83 = getelementptr inbounds double* %82, i32 %60 ; <double*> [#uses=2]
  %84 = load double* %83, align 4                 ; <double> [#uses=3]
  %scevgep97.i = getelementptr double* %82, i32 %50 ; <double*> [#uses=2]
  %85 = load double* %scevgep97.i, align 4        ; <double> [#uses=1]
  store double %85, double* %83, align 4
  store double %84, double* %scevgep97.i, align 4
  %86 = fcmp une double %84, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %86, label %bb12.i.us16.i, label %daxpy.exit.us10.i

daxpy.exit.us10.i:                                ; preds = %bb12.i.us16.i, %bb4.us8.i
  %phitmp29.i = icmp sgt i32 %tmp49.i, 1999       ; <i1> [#uses=1]
  %indvar.next47.i = add i32 %indvar46.i, 1       ; <i32> [#uses=1]
  br i1 %phitmp29.i, label %bb8.i, label %bb4.us8.i

bb12.i.us16.i:                                    ; preds = %bb12.i.us16.i, %bb4.us8.i
  %i.12.i.us17.i = phi i32 [ %91, %bb12.i.us16.i ], [ 0, %bb4.us8.i ] ; <i32> [#uses=2]
  %tmp43.i = add i32 %i.12.i.us17.i, %tmp33.i     ; <i32> [#uses=2]
  %scevgep8.i.us21.i = getelementptr double* %51, i32 %tmp43.i ; <double*> [#uses=1]
  %scevgep.i2.us19.i = getelementptr double* %82, i32 %tmp43.i ; <double*> [#uses=2]
  %87 = load double* %scevgep.i2.us19.i, align 4  ; <double> [#uses=1]
  %88 = load double* %scevgep8.i.us21.i, align 4  ; <double> [#uses=1]
  %89 = fmul double %88, %84                      ; <double> [#uses=1]
  %90 = fadd double %87, %89                      ; <double> [#uses=1]
  store double %90, double* %scevgep.i2.us19.i, align 4
  %91 = add nsw i32 %i.12.i.us17.i, 1             ; <i32> [#uses=2]
  %exitcond41.i = icmp eq i32 %91, %tmp32.i       ; <i1> [#uses=1]
  br i1 %exitcond41.i, label %daxpy.exit.us10.i, label %bb12.i.us16.i

bb4.i:                                            ; preds = %bb4.i, %bb.nph.split.i
  %indvar63.i = phi i32 [ %indvar.next64.i, %bb4.i ], [ 0, %bb.nph.split.i ] ; <i32> [#uses=3]
  %tmp66.i = add i32 %indvar63.i, %tmp33.i        ; <i32> [#uses=1]
  %scevgep67.i = getelementptr [4000 x double*]* %22, i32 0, i32 %tmp66.i ; <double**> [#uses=1]
  %tmp69.i = add i32 %indvar63.i, %tmp35.i        ; <i32> [#uses=1]
  %92 = load double** %scevgep67.i, align 4       ; <double*> [#uses=2]
  %93 = getelementptr inbounds double* %92, i32 %60 ; <double*> [#uses=2]
  %94 = load double* %93, align 4                 ; <double> [#uses=1]
  %scevgep94.i = getelementptr double* %92, i32 %50 ; <double*> [#uses=2]
  %95 = load double* %scevgep94.i, align 4        ; <double> [#uses=1]
  store double %95, double* %93, align 4
  store double %94, double* %scevgep94.i, align 4
  %phitmp30.i = icmp sgt i32 %tmp69.i, 1999       ; <i1> [#uses=1]
  %indvar.next64.i = add i32 %indvar63.i, 1       ; <i32> [#uses=1]
  br i1 %phitmp30.i, label %bb8.i, label %bb4.i

bb8.i:                                            ; preds = %bb4.i, %daxpy.exit.us10.i, %bb4.us.i, %daxpy.exit.us.us.i, %bb7.preheader.i, %idamax.exit.i
  %exitcond77.i = icmp eq i32 %tmp33.i, 1999      ; <i1> [#uses=1]
  br i1 %exitcond77.i, label %dgefa.exit, label %bb.i5

dgefa.exit:                                       ; preds = %bb8.i
  %96 = getelementptr inbounds [2000 x i32]* %26, i32 0, i32 1999 ; <i32*> [#uses=1]
  store i32 1999, i32* %96, align 4
  br label %bb.i

bb.i:                                             ; preds = %daxpy.exit.i, %dgefa.exit
  %97 = phi i32 [ 0, %dgefa.exit ], [ %tmp25.i, %daxpy.exit.i ] ; <i32> [#uses=6]
  %tmp25.i = add i32 %97, 1                       ; <i32> [#uses=3]
  %tmp23.i = sub i32 1999, %97                    ; <i32> [#uses=2]
  %scevgep33.i = getelementptr [2000 x i32]* %26, i32 0, i32 %97 ; <i32*> [#uses=1]
  %scevgep34.i = getelementptr [4000 x double*]* %22, i32 0, i32 %97 ; <double**> [#uses=1]
  %scevgep35.i = getelementptr [2000 x double]* %25, i32 0, i32 %97 ; <double*> [#uses=2]
  %98 = load i32* %scevgep33.i, align 4           ; <i32> [#uses=2]
  %99 = getelementptr inbounds [2000 x double]* %25, i32 0, i32 %98 ; <double*> [#uses=2]
  %100 = load double* %99, align 4                ; <double> [#uses=3]
  %101 = icmp eq i32 %98, %97                     ; <i1> [#uses=1]
  br i1 %101, label %bb2.i, label %bb1.i1

bb1.i1:                                           ; preds = %bb.i
  %102 = load double* %scevgep35.i, align 4       ; <double> [#uses=1]
  store double %102, double* %99, align 4
  store double %100, double* %scevgep35.i, align 4
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i1, %bb.i
  %103 = load double** %scevgep34.i, align 4      ; <double*> [#uses=1]
  %104 = fcmp une double %100, 0.000000e+00       ; <i1> [#uses=1]
  %brmerge.demorgan.i = icmp sgt i32 %tmp23.i, 0  ; <i1> [#uses=1]
  %or.cond.i.i = and i1 %104, %brmerge.demorgan.i ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb12.i.i, label %daxpy.exit.i

bb12.i.i:                                         ; preds = %bb12.i.i, %bb2.i
  %i.12.i.i = phi i32 [ %109, %bb12.i.i ], [ 0, %bb2.i ] ; <i32> [#uses=2]
  %tmp26.i = add i32 %i.12.i.i, %tmp25.i          ; <i32> [#uses=2]
  %scevgep8.i.i = getelementptr double* %103, i32 %tmp26.i ; <double*> [#uses=1]
  %scevgep.i.i = getelementptr [2000 x double]* %25, i32 0, i32 %tmp26.i ; <double*> [#uses=2]
  %105 = load double* %scevgep.i.i, align 4       ; <double> [#uses=1]
  %106 = load double* %scevgep8.i.i, align 4      ; <double> [#uses=1]
  %107 = fmul double %106, %100                   ; <double> [#uses=1]
  %108 = fadd double %105, %107                   ; <double> [#uses=1]
  store double %108, double* %scevgep.i.i, align 4
  %109 = add nsw i32 %i.12.i.i, 1                 ; <i32> [#uses=2]
  %exitcond24.i = icmp eq i32 %109, %tmp23.i      ; <i1> [#uses=1]
  br i1 %exitcond24.i, label %daxpy.exit.i, label %bb12.i.i

daxpy.exit.i:                                     ; preds = %bb12.i.i, %bb2.i
  %exitcond29.i = icmp eq i32 %tmp25.i, 1999      ; <i1> [#uses=1]
  br i1 %exitcond29.i, label %bb5.i, label %bb.i

bb5.i:                                            ; preds = %daxpy.exit10.i, %daxpy.exit.i
  %kb.013.i = phi i32 [ %121, %daxpy.exit10.i ], [ 0, %daxpy.exit.i ] ; <i32> [#uses=2]
  %tmp17.i = sub i32 1999, %kb.013.i              ; <i32> [#uses=5]
  %scevgep.i2 = getelementptr [4000 x double*]* %22, i32 0, i32 %tmp17.i ; <double**> [#uses=1]
  %scevgep21.i = getelementptr [2000 x double]* %25, i32 0, i32 %tmp17.i ; <double*> [#uses=2]
  %110 = load double* %scevgep21.i, align 4       ; <double> [#uses=1]
  %111 = load double** %scevgep.i2, align 4       ; <double*> [#uses=2]
  %scevgep22.i3 = getelementptr double* %111, i32 %tmp17.i ; <double*> [#uses=1]
  %112 = load double* %scevgep22.i3, align 4      ; <double> [#uses=1]
  %113 = fdiv double %110, %112                   ; <double> [#uses=2]
  store double %113, double* %scevgep21.i, align 4
  %114 = fsub double -0.000000e+00, %113          ; <double> [#uses=2]
  %115 = fcmp une double %114, 0.000000e+00       ; <i1> [#uses=1]
  %brmerge12.demorgan.i = icmp sgt i32 %tmp17.i, 0 ; <i1> [#uses=1]
  %or.cond.i1.i = and i1 %115, %brmerge12.demorgan.i ; <i1> [#uses=1]
  br i1 %or.cond.i1.i, label %bb12.i9.i, label %daxpy.exit10.i

bb12.i9.i:                                        ; preds = %bb12.i9.i, %bb5.i
  %i.12.i3.i = phi i32 [ %120, %bb12.i9.i ], [ 0, %bb5.i ] ; <i32> [#uses=3]
  %scevgep.i5.i = getelementptr [2000 x double]* %25, i32 0, i32 %i.12.i3.i ; <double*> [#uses=2]
  %scevgep8.i7.i = getelementptr double* %111, i32 %i.12.i3.i ; <double*> [#uses=1]
  %116 = load double* %scevgep.i5.i, align 4      ; <double> [#uses=1]
  %117 = load double* %scevgep8.i7.i, align 4     ; <double> [#uses=1]
  %118 = fmul double %117, %114                   ; <double> [#uses=1]
  %119 = fadd double %116, %118                   ; <double> [#uses=1]
  store double %119, double* %scevgep.i5.i, align 4
  %120 = add nsw i32 %i.12.i3.i, 1                ; <i32> [#uses=2]
  %exitcond.i4 = icmp eq i32 %120, %tmp17.i       ; <i1> [#uses=1]
  br i1 %exitcond.i4, label %daxpy.exit10.i, label %bb12.i9.i

daxpy.exit10.i:                                   ; preds = %bb12.i9.i, %bb5.i
  %121 = add nsw i32 %kb.013.i, 1                 ; <i32> [#uses=2]
  %exitcond18.i = icmp eq i32 %121, 2000          ; <i1> [#uses=1]
  br i1 %exitcond18.i, label %dgesl.exit, label %bb5.i

dgesl.exit:                                       ; preds = %daxpy.exit10.i
  free [2000 x i32]* %26
  free [2000 x double]* %25
  br label %bb25

bb25:                                             ; preds = %bb25, %dgesl.exit
  %i.25 = phi i32 [ 0, %dgesl.exit ], [ %123, %bb25 ] ; <i32> [#uses=2]
  %scevgep = getelementptr [4000 x double*]* %22, i32 0, i32 %i.25 ; <double**> [#uses=1]
  %122 = load double** %scevgep, align 4          ; <double*> [#uses=1]
  free double* %122
  %123 = add nsw i32 %i.25, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %123, 2000              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb27, label %bb25

bb27:                                             ; preds = %bb25
  free [4000 x double*]* %22
  %toBool28 = icmp eq i8 %ga_testing.0, 0         ; <i1> [#uses=1]
  %124 = load %struct._IO_FILE** @stdout, align 4 ; <%struct._IO_FILE*> [#uses=2]
  br i1 %toBool28, label %bb30, label %bb29

bb29:                                             ; preds = %bb27
  %125 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %124, i8* noalias getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), double 0.000000e+00) nounwind ; <i32> [#uses=0]
  br label %bb31

bb30:                                             ; preds = %bb27
  %126 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %124, i8* noalias getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0), double 0.000000e+00) nounwind ; <i32> [#uses=0]
  br label %bb31

bb31:                                             ; preds = %bb30, %bb29
  %127 = load %struct._IO_FILE** @stdout, align 4 ; <%struct._IO_FILE*> [#uses=1]
  %128 = tail call i32 @fflush(%struct._IO_FILE* %127) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE* noalias nocapture, i8* noalias nocapture, ...) nounwind

declare i32 @fflush(%struct._IO_FILE* nocapture) nounwind
