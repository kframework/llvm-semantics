; ModuleID = 'ffbench.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@nsize.4066 = internal global [3 x i32] zeroinitializer ; <[3 x i32]*> [#uses=4]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=4]
@.str = private constant [28 x i8] c"Can't allocate data array.\0A\00", align 1 ; <[28 x i8]*> [#uses=1]
@.str1 = private constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1 ; <[35 x i8]*> [#uses=1]

define internal fastcc void @fourn(double* nocapture %data, i32 %isign) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar153 = phi i32 [ 0, %entry ], [ %tmp155, %bb ] ; <i32> [#uses=2]
  %ntot.027 = phi i32 [ 1, %entry ], [ %1, %bb ]  ; <i32> [#uses=1]
  %tmp155 = add i32 %indvar153, 1                 ; <i32> [#uses=2]
  %scevgep156 = getelementptr [3 x i32]* @nsize.4066, i32 0, i32 %tmp155 ; <i32*> [#uses=1]
  %0 = load i32* %scevgep156, align 4             ; <i32> [#uses=1]
  %1 = mul i32 %0, %ntot.027                      ; <i32> [#uses=2]
  %tmp157 = add i32 %indvar153, 2                 ; <i32> [#uses=1]
  %2 = icmp sgt i32 %tmp157, 2                    ; <i1> [#uses=1]
  br i1 %2, label %bb.nph26, label %bb

bb.nph26:                                         ; preds = %bb
  %3 = sitofp i32 %isign to double                ; <double> [#uses=1]
  %4 = fmul double %3, 0x401921FB54442D1C         ; <double> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb30, %bb.nph26
  %indvar147 = phi i32 [ 0, %bb.nph26 ], [ %indvar.next148, %bb30 ] ; <i32> [#uses=2]
  %nprev.024 = phi i32 [ 1, %bb.nph26 ], [ %6, %bb30 ] ; <i32> [#uses=6]
  %tmp150 = sub i32 2, %indvar147                 ; <i32> [#uses=1]
  %scevgep151 = getelementptr [3 x i32]* @nsize.4066, i32 0, i32 %tmp150 ; <i32*> [#uses=1]
  %5 = load i32* %scevgep151, align 4             ; <i32> [#uses=4]
  %6 = mul i32 %5, %nprev.024                     ; <i32> [#uses=2]
  %7 = sdiv i32 %1, %6                            ; <i32> [#uses=1]
  %8 = shl i32 %nprev.024, 1                      ; <i32> [#uses=10]
  %9 = mul i32 %5, %8                             ; <i32> [#uses=6]
  %10 = mul i32 %9, %7                            ; <i32> [#uses=4]
  %11 = icmp slt i32 %9, 1                        ; <i1> [#uses=1]
  br i1 %11, label %bb29.preheader, label %bb.nph13

bb.nph13:                                         ; preds = %bb3
  %ibit.06 = ashr i32 %9, 1                       ; <i32> [#uses=4]
  %12 = icmp sge i32 %ibit.06, %8                 ; <i1> [#uses=1]
  %tmp54 = mul i32 %nprev.024, %5                 ; <i32> [#uses=1]
  %tmp55 = shl i32 %tmp54, 1                      ; <i32> [#uses=1]
  %tmp56167 = or i32 %tmp55, 1                    ; <i32> [#uses=1]
  %tmp81 = add i32 %8, -1                         ; <i32> [#uses=1]
  %tmp83166 = or i32 %8, 1                        ; <i32> [#uses=1]
  br label %bb4

bb4:                                              ; preds = %bb16, %bb.nph13
  %indvar36 = phi i32 [ 0, %bb.nph13 ], [ %indvar.next37, %bb16 ] ; <i32> [#uses=2]
  %i2rev.111 = phi i32 [ 1, %bb.nph13 ], [ %27, %bb16 ] ; <i32> [#uses=6]
  %tmp74 = mul i32 %indvar36, %nprev.024          ; <i32> [#uses=1]
  %tmp75 = shl i32 %tmp74, 1                      ; <i32> [#uses=6]
  %tmp71 = add i32 %tmp75, 3                      ; <i32> [#uses=1]
  %i2.012164 = or i32 %tmp75, 1                   ; <i32> [#uses=3]
  %tmp65 = add i32 %tmp75, 2                      ; <i32> [#uses=1]
  %tmp63 = add i32 %tmp75, %tmp56167              ; <i32> [#uses=1]
  %tmp82 = add i32 %tmp75, %tmp81                 ; <i32> [#uses=2]
  %tmp84 = add i32 %tmp75, %tmp83166              ; <i32> [#uses=1]
  %.not = icmp sge i32 %i2.012164, %i2rev.111     ; <i1> [#uses=1]
  %13 = icmp slt i32 %tmp82, %i2.012164           ; <i1> [#uses=1]
  %or.cond = or i1 %13, %.not                     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb13.preheader, label %bb.nph3

bb7:                                              ; preds = %bb8.preheader, %bb7
  %indvar = phi i32 [ %indvar.next, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=2]
  %tmp = mul i32 %indvar, %nprev.024              ; <i32> [#uses=1]
  %tmp31 = mul i32 %tmp, %5                       ; <i32> [#uses=1]
  %tmp32 = shl i32 %tmp31, 1                      ; <i32> [#uses=5]
  %tmp42 = add i32 %tmp32, %i1.02                 ; <i32> [#uses=1]
  %scevgep = getelementptr double* %data, i32 %tmp42 ; <double*> [#uses=2]
  %tmp45 = add i32 %tmp32, %tmp44                 ; <i32> [#uses=1]
  %scevgep46 = getelementptr double* %data, i32 %tmp45 ; <double*> [#uses=2]
  %tmp48 = add i32 %tmp32, %tmp47                 ; <i32> [#uses=1]
  %scevgep49 = getelementptr double* %data, i32 %tmp48 ; <double*> [#uses=2]
  %tmp52 = add i32 %tmp32, %tmp51                 ; <i32> [#uses=1]
  %scevgep53 = getelementptr double* %data, i32 %tmp52 ; <double*> [#uses=2]
  %14 = load double* %scevgep, align 4            ; <double> [#uses=1]
  %15 = load double* %scevgep49, align 4          ; <double> [#uses=1]
  store double %15, double* %scevgep, align 4
  store double %14, double* %scevgep49, align 4
  %16 = load double* %scevgep53, align 4          ; <double> [#uses=1]
  %17 = load double* %scevgep46, align 4          ; <double> [#uses=1]
  store double %17, double* %scevgep53, align 4
  store double %16, double* %scevgep46, align 4
  %tmp59 = add i32 %tmp32, %tmp58                 ; <i32> [#uses=1]
  %18 = icmp sgt i32 %tmp59, %10                  ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %18, label %bb9, label %bb7

bb9:                                              ; preds = %bb8.preheader, %bb7
  %19 = icmp slt i32 %tmp82, %tmp72               ; <i1> [#uses=1]
  %indvar.next34 = add i32 %indvar33, 1           ; <i32> [#uses=1]
  br i1 %19, label %bb13.preheader, label %bb8.preheader

bb.nph3:                                          ; preds = %bb4
  %tmp43 = add i32 %i2rev.111, 1                  ; <i32> [#uses=1]
  br label %bb8.preheader

bb8.preheader:                                    ; preds = %bb.nph3, %bb9
  %indvar33 = phi i32 [ 0, %bb.nph3 ], [ %indvar.next34, %bb9 ] ; <i32> [#uses=2]
  %tmp60 = shl i32 %indvar33, 1                   ; <i32> [#uses=6]
  %tmp58 = add i32 %tmp60, %tmp63                 ; <i32> [#uses=1]
  %tmp51 = add i32 %tmp60, %tmp65                 ; <i32> [#uses=1]
  %tmp47 = add i32 %i2rev.111, %tmp60             ; <i32> [#uses=1]
  %tmp44 = add i32 %tmp60, %tmp43                 ; <i32> [#uses=1]
  %i1.02 = add i32 %tmp60, %i2.012164             ; <i32> [#uses=2]
  %tmp72 = add i32 %tmp60, %tmp71                 ; <i32> [#uses=1]
  %20 = icmp sgt i32 %i1.02, %10                  ; <i1> [#uses=1]
  br i1 %20, label %bb9, label %bb7

bb13.preheader:                                   ; preds = %bb9, %bb4
  %21 = icmp sgt i32 %i2rev.111, %ibit.06         ; <i1> [#uses=1]
  %22 = and i1 %12, %21                           ; <i1> [#uses=1]
  br i1 %22, label %bb12, label %bb16

bb12:                                             ; preds = %bb12, %bb13.preheader
  %ibit.07 = phi i32 [ %ibit.0, %bb12 ], [ %ibit.06, %bb13.preheader ] ; <i32> [#uses=2]
  %i2rev.05 = phi i32 [ %23, %bb12 ], [ %i2rev.111, %bb13.preheader ] ; <i32> [#uses=1]
  %23 = sub i32 %i2rev.05, %ibit.07               ; <i32> [#uses=3]
  %ibit.0 = ashr i32 %ibit.07, 1                  ; <i32> [#uses=4]
  %24 = icmp sge i32 %ibit.0, %8                  ; <i1> [#uses=1]
  %25 = icmp sgt i32 %23, %ibit.0                 ; <i1> [#uses=1]
  %26 = and i1 %24, %25                           ; <i1> [#uses=1]
  br i1 %26, label %bb12, label %bb16

bb16:                                             ; preds = %bb12, %bb13.preheader
  %ibit.0.lcssa = phi i32 [ %ibit.06, %bb13.preheader ], [ %ibit.0, %bb12 ] ; <i32> [#uses=1]
  %i2rev.0.lcssa = phi i32 [ %i2rev.111, %bb13.preheader ], [ %23, %bb12 ] ; <i32> [#uses=1]
  %27 = add nsw i32 %i2rev.0.lcssa, %ibit.0.lcssa ; <i32> [#uses=1]
  %28 = icmp sgt i32 %tmp84, %9                   ; <i1> [#uses=1]
  %indvar.next37 = add i32 %indvar36, 1           ; <i32> [#uses=1]
  br i1 %28, label %bb29.preheader, label %bb4

bb29.preheader:                                   ; preds = %bb16, %bb3
  %29 = icmp slt i32 %8, %9                       ; <i1> [#uses=1]
  br i1 %29, label %bb.nph23, label %bb30

bb.nph23:                                         ; preds = %bb29.preheader
  %tmp143 = add i32 %8, -1                        ; <i32> [#uses=1]
  %tmp145163 = or i32 %8, 1                       ; <i32> [#uses=1]
  br label %bb19

bb19:                                             ; preds = %bb29.loopexit, %bb.nph23
  %ifp1.022 = phi i32 [ %8, %bb.nph23 ], [ %30, %bb29.loopexit ] ; <i32> [#uses=6]
  %30 = shl i32 %ifp1.022, 1                      ; <i32> [#uses=4]
  %31 = sdiv i32 %30, %8                          ; <i32> [#uses=1]
  %32 = sitofp i32 %31 to double                  ; <double> [#uses=1]
  %33 = fdiv double %4, %32                       ; <double> [#uses=2]
  %34 = fmul double %33, 5.000000e-01             ; <double> [#uses=1]
  %35 = tail call double @sin(double %34) nounwind readonly ; <double> [#uses=2]
  %36 = fmul double %35, -2.000000e+00            ; <double> [#uses=1]
  %37 = fmul double %36, %35                      ; <double> [#uses=2]
  %38 = tail call double @sin(double %33) nounwind readonly ; <double> [#uses=2]
  %39 = icmp slt i32 %ifp1.022, 1                 ; <i1> [#uses=1]
  br i1 %39, label %bb29.loopexit, label %bb.nph21

bb22:                                             ; preds = %bb23.preheader, %bb22
  %indvar85 = phi i32 [ %indvar.next86, %bb22 ], [ 0, %bb23.preheader ] ; <i32> [#uses=2]
  %tmp87 = mul i32 %indvar85, %ifp1.022           ; <i32> [#uses=1]
  %tmp88 = shl i32 %tmp87, 1                      ; <i32> [#uses=5]
  %tmp98 = add i32 %tmp88, %i1.116                ; <i32> [#uses=1]
  %scevgep99 = getelementptr double* %data, i32 %tmp98 ; <double*> [#uses=3]
  %tmp103 = add i32 %tmp88, %tmp102               ; <i32> [#uses=1]
  %scevgep104 = getelementptr double* %data, i32 %tmp103 ; <double*> [#uses=2]
  %tmp108 = add i32 %tmp88, %tmp107               ; <i32> [#uses=1]
  %scevgep109 = getelementptr double* %data, i32 %tmp108 ; <double*> [#uses=2]
  %tmp112 = add i32 %tmp88, %tmp111               ; <i32> [#uses=1]
  %scevgep113 = getelementptr double* %data, i32 %tmp112 ; <double*> [#uses=3]
  %40 = load double* %scevgep109, align 4         ; <double> [#uses=2]
  %41 = fmul double %40, %wr.019                  ; <double> [#uses=1]
  %42 = load double* %scevgep104, align 4         ; <double> [#uses=2]
  %43 = fmul double %42, %wi.018                  ; <double> [#uses=1]
  %44 = fsub double %41, %43                      ; <double> [#uses=2]
  %45 = fmul double %42, %wr.019                  ; <double> [#uses=1]
  %46 = fmul double %40, %wi.018                  ; <double> [#uses=1]
  %47 = fadd double %45, %46                      ; <double> [#uses=2]
  %48 = load double* %scevgep99, align 4          ; <double> [#uses=1]
  %49 = fsub double %48, %44                      ; <double> [#uses=1]
  store double %49, double* %scevgep109, align 4
  %50 = load double* %scevgep113, align 4         ; <double> [#uses=1]
  %51 = fsub double %50, %47                      ; <double> [#uses=1]
  store double %51, double* %scevgep104, align 4
  %52 = load double* %scevgep99, align 4          ; <double> [#uses=1]
  %53 = fadd double %52, %44                      ; <double> [#uses=1]
  store double %53, double* %scevgep99, align 4
  %54 = load double* %scevgep113, align 4         ; <double> [#uses=1]
  %55 = fadd double %54, %47                      ; <double> [#uses=1]
  store double %55, double* %scevgep113, align 4
  %tmp118 = add i32 %tmp88, %tmp117               ; <i32> [#uses=1]
  %56 = icmp sgt i32 %tmp118, %10                 ; <i1> [#uses=1]
  %indvar.next86 = add i32 %indvar85, 1           ; <i32> [#uses=1]
  br i1 %56, label %bb24, label %bb22

bb24:                                             ; preds = %bb23.preheader, %bb22
  %57 = icmp slt i32 %tmp144, %tmp133             ; <i1> [#uses=1]
  %indvar.next90 = add i32 %indvar89, 1           ; <i32> [#uses=1]
  br i1 %57, label %bb26, label %bb23.preheader

bb23.preheader:                                   ; preds = %bb25.preheader, %bb24
  %indvar89 = phi i32 [ %indvar.next90, %bb24 ], [ 0, %bb25.preheader ] ; <i32> [#uses=2]
  %tmp119 = shl i32 %indvar89, 1                  ; <i32> [#uses=6]
  %tmp117 = add i32 %tmp119, %tmp122              ; <i32> [#uses=1]
  %tmp111 = add i32 %tmp119, %tmp124              ; <i32> [#uses=1]
  %tmp107 = add i32 %tmp119, %tmp126              ; <i32> [#uses=1]
  %tmp102 = add i32 %tmp119, %tmp128              ; <i32> [#uses=1]
  %i1.116 = add i32 %tmp119, %i3.120159           ; <i32> [#uses=2]
  %tmp133 = add i32 %tmp119, %tmp132              ; <i32> [#uses=1]
  %58 = icmp sgt i32 %i1.116, %10                 ; <i1> [#uses=1]
  br i1 %58, label %bb24, label %bb22

bb26:                                             ; preds = %bb25.preheader, %bb24
  %59 = fmul double %wr.019, %37                  ; <double> [#uses=1]
  %60 = fmul double %wi.018, %38                  ; <double> [#uses=1]
  %61 = fsub double %59, %60                      ; <double> [#uses=1]
  %62 = fadd double %61, %wr.019                  ; <double> [#uses=1]
  %63 = fmul double %wi.018, %37                  ; <double> [#uses=1]
  %64 = fmul double %wr.019, %38                  ; <double> [#uses=1]
  %65 = fadd double %63, %64                      ; <double> [#uses=1]
  %66 = fadd double %65, %wi.018                  ; <double> [#uses=1]
  %67 = icmp sgt i32 %tmp146, %ifp1.022           ; <i1> [#uses=1]
  %indvar.next93 = add i32 %indvar92, 1           ; <i32> [#uses=1]
  br i1 %67, label %bb29.loopexit, label %bb25.preheader

bb.nph21:                                         ; preds = %bb19
  %tmp100 = add i32 %ifp1.022, 2                  ; <i32> [#uses=1]
  %tmp105162 = or i32 %ifp1.022, 1                ; <i32> [#uses=1]
  %tmp115161 = or i32 %30, 1                      ; <i32> [#uses=1]
  br label %bb25.preheader

bb25.preheader:                                   ; preds = %bb.nph21, %bb26
  %indvar92 = phi i32 [ 0, %bb.nph21 ], [ %indvar.next93, %bb26 ] ; <i32> [#uses=2]
  %wr.019 = phi double [ 1.000000e+00, %bb.nph21 ], [ %62, %bb26 ] ; <double> [#uses=5]
  %wi.018 = phi double [ 0.000000e+00, %bb.nph21 ], [ %66, %bb26 ] ; <double> [#uses=5]
  %tmp134 = mul i32 %indvar92, %nprev.024         ; <i32> [#uses=1]
  %tmp135 = shl i32 %tmp134, 1                    ; <i32> [#uses=8]
  %tmp132 = add i32 %tmp135, 3                    ; <i32> [#uses=1]
  %i3.120159 = or i32 %tmp135, 1                  ; <i32> [#uses=2]
  %tmp128 = add i32 %tmp135, %tmp100              ; <i32> [#uses=1]
  %tmp126 = add i32 %tmp135, %tmp105162           ; <i32> [#uses=1]
  %tmp124 = add i32 %tmp135, 2                    ; <i32> [#uses=1]
  %tmp122 = add i32 %tmp135, %tmp115161           ; <i32> [#uses=1]
  %tmp144 = add i32 %tmp135, %tmp143              ; <i32> [#uses=2]
  %tmp146 = add i32 %tmp135, %tmp145163           ; <i32> [#uses=1]
  %68 = icmp slt i32 %tmp144, %i3.120159          ; <i1> [#uses=1]
  br i1 %68, label %bb26, label %bb23.preheader

bb29.loopexit:                                    ; preds = %bb26, %bb19
  %69 = icmp slt i32 %30, %9                      ; <i1> [#uses=1]
  br i1 %69, label %bb19, label %bb30

bb30:                                             ; preds = %bb29.loopexit, %bb29.preheader
  %indvar.next148 = add i32 %indvar147, 1         ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next148, 2      ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb3

return:                                           ; preds = %bb30
  ret void
}

declare double @sin(double) nounwind readonly

define i32 @main() nounwind {
entry:
  store i32 256, i32* getelementptr inbounds ([3 x i32]* @nsize.4066, i32 0, i32 2), align 4
  store i32 256, i32* getelementptr inbounds ([3 x i32]* @nsize.4066, i32 0, i32 1), align 4
  %0 = malloc [131074 x double]                   ; <[131074 x double]*> [#uses=8]
  %.sub = getelementptr inbounds [131074 x double]* %0, i32 0, i32 0 ; <double*> [#uses=2]
  %1 = icmp eq [131074 x double]* %0, null        ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb1

bb:                                               ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 4   ; <%struct._IO_FILE*> [#uses=1]
  %3 = bitcast %struct._IO_FILE* %2 to i8*        ; <i8*> [#uses=1]
  %4 = tail call i32 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i32 1, i32 27, i8* %3) nounwind ; <i32> [#uses=0]
  ret i32 1

bb1:                                              ; preds = %entry
  %tmpcast = bitcast [131074 x double]* %0 to i8* ; <i8*> [#uses=1]
  tail call void @llvm.memset.i32(i8* %tmpcast, i8 0, i32 1048592, i32 8)
  br label %bb7.preheader

bb3.us:                                           ; preds = %bb7.preheader, %bb3.us
  %j.018.us = phi i32 [ %5, %bb3.us ], [ 0, %bb7.preheader ] ; <i32> [#uses=2]
  %tmp49 = shl i32 %j.018.us, 1                   ; <i32> [#uses=1]
  %tmp52 = add i32 %tmp49, %tmp5165               ; <i32> [#uses=1]
  %scevgep53 = getelementptr [131074 x double]* %0, i32 0, i32 %tmp52 ; <double*> [#uses=1]
  store double 1.280000e+02, double* %scevgep53, align 4
  %5 = add nsw i32 %j.018.us, 1                   ; <i32> [#uses=2]
  %exitcond48 = icmp eq i32 %5, 256               ; <i1> [#uses=1]
  br i1 %exitcond48, label %bb8, label %bb3.us

bb3:                                              ; preds = %bb7.preheader, %bb6
  %6 = phi i32 [ %9, %bb6 ], [ 0, %bb7.preheader ] ; <i32> [#uses=3]
  %7 = and i32 %6, 15                             ; <i32> [#uses=1]
  %8 = icmp eq i32 %7, 8                          ; <i1> [#uses=1]
  br i1 %8, label %bb5, label %bb6

bb5:                                              ; preds = %bb3
  %tmp55 = shl i32 %6, 1                          ; <i32> [#uses=1]
  %tmp58 = add i32 %tmp55, %tmp5165               ; <i32> [#uses=1]
  %scevgep59 = getelementptr [131074 x double]* %0, i32 0, i32 %tmp58 ; <double*> [#uses=1]
  store double 1.280000e+02, double* %scevgep59, align 4
  br label %bb6

bb6:                                              ; preds = %bb5, %bb3
  %9 = add nsw i32 %6, 1                          ; <i32> [#uses=2]
  %exitcond54 = icmp eq i32 %9, 256               ; <i1> [#uses=1]
  br i1 %exitcond54, label %bb8, label %bb3

bb8:                                              ; preds = %bb6, %bb3.us
  %10 = add i32 %11, 1                            ; <i32> [#uses=2]
  %exitcond60 = icmp eq i32 %10, 256              ; <i1> [#uses=1]
  br i1 %exitcond60, label %bb11, label %bb7.preheader

bb7.preheader:                                    ; preds = %bb8, %bb1
  %11 = phi i32 [ 0, %bb1 ], [ %10, %bb8 ]        ; <i32> [#uses=3]
  %tmp61 = shl i32 %11, 9                         ; <i32> [#uses=1]
  %tmp5165 = or i32 %tmp61, 1                     ; <i32> [#uses=2]
  %12 = and i32 %11, 15                           ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, 8                        ; <i1> [#uses=1]
  br i1 %13, label %bb3.us, label %bb3

bb11:                                             ; preds = %bb11, %bb8
  %i.116 = phi i32 [ %14, %bb11 ], [ 0, %bb8 ]    ; <i32> [#uses=1]
  tail call fastcc void @fourn(double* %.sub, i32 1) nounwind
  tail call fastcc void @fourn(double* %.sub, i32 -1) nounwind
  %14 = add nsw i32 %i.116, 1                     ; <i32> [#uses=2]
  %exitcond47 = icmp eq i32 %14, 63               ; <i1> [#uses=1]
  br i1 %exitcond47, label %bb14, label %bb11

bb14:                                             ; preds = %bb14, %bb11
  %indvar = phi i32 [ %indvar.next, %bb14 ], [ 0, %bb11 ] ; <i32> [#uses=2]
  %rmax.010 = phi double [ %iftmp.28.0, %bb14 ], [ -1.000000e+10, %bb11 ] ; <double> [#uses=2]
  %rmin.09 = phi double [ %iftmp.27.0, %bb14 ], [ 1.000000e+10, %bb11 ] ; <double> [#uses=2]
  %tmp42 = shl i32 %indvar, 1                     ; <i32> [#uses=1]
  %tmp4364 = or i32 %tmp42, 1                     ; <i32> [#uses=1]
  %scevgep44 = getelementptr [131074 x double]* %0, i32 0, i32 %tmp4364 ; <double*> [#uses=1]
  %15 = load double* %scevgep44, align 4          ; <double> [#uses=4]
  %16 = fcmp ugt double %15, %rmin.09             ; <i1> [#uses=1]
  %iftmp.27.0 = select i1 %16, double %rmin.09, double %15 ; <double> [#uses=4]
  %17 = fcmp ogt double %15, %rmax.010            ; <i1> [#uses=1]
  %iftmp.28.0 = select i1 %17, double %15, double %rmax.010 ; <double> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond41 = icmp eq i32 %indvar.next, 32768   ; <i1> [#uses=1]
  br i1 %exitcond41, label %bb28, label %bb14

bb28:                                             ; preds = %bb14
  %18 = fsub double %iftmp.28.0, %iftmp.27.0      ; <double> [#uses=1]
  %19 = fdiv double 2.550000e+02, %18             ; <double> [#uses=2]
  br label %bb37.preheader

bb30.us:                                          ; preds = %bb37.preheader, %bb36.us
  %20 = phi i32 [ %26, %bb36.us ], [ 0, %bb37.preheader ] ; <i32> [#uses=3]
  %m.11.us = phi i32 [ %m.0.us, %bb36.us ], [ %m.24, %bb37.preheader ] ; <i32> [#uses=2]
  %tmp = shl i32 %20, 1                           ; <i32> [#uses=1]
  %tmp31 = add i32 %tmp, %tmp3063                 ; <i32> [#uses=1]
  %scevgep = getelementptr [131074 x double]* %0, i32 0, i32 %tmp31 ; <double*> [#uses=1]
  %21 = load double* %scevgep, align 4            ; <double> [#uses=1]
  %22 = fsub double %21, %iftmp.27.0              ; <double> [#uses=1]
  %23 = fmul double %22, %19                      ; <double> [#uses=1]
  %24 = fptosi double %23 to i32                  ; <i32> [#uses=2]
  %25 = icmp eq i32 %24, 255                      ; <i1> [#uses=1]
  br i1 %25, label %bb36.us, label %bb35.us

bb36.us:                                          ; preds = %bb35.us, %bb30.us
  %m.0.us = phi i32 [ %27, %bb35.us ], [ %m.11.us, %bb30.us ] ; <i32> [#uses=2]
  %26 = add nsw i32 %20, 1                        ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %26, 256                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb38, label %bb30.us

bb35.us:                                          ; preds = %bb30.us
  %27 = add nsw i32 %m.11.us, 1                   ; <i32> [#uses=1]
  %28 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %28, i8* noalias getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0), i32 %43, i32 %20, i32 255, i32 %24) nounwind ; <i32> [#uses=0]
  br label %bb36.us

bb30:                                             ; preds = %bb37.preheader, %bb36
  %30 = phi i32 [ %41, %bb36 ], [ 0, %bb37.preheader ] ; <i32> [#uses=4]
  %m.11 = phi i32 [ %m.0, %bb36 ], [ %m.24, %bb37.preheader ] ; <i32> [#uses=2]
  %tmp33 = shl i32 %30, 1                         ; <i32> [#uses=1]
  %tmp36 = add i32 %tmp33, %tmp3063               ; <i32> [#uses=1]
  %scevgep37 = getelementptr [131074 x double]* %0, i32 0, i32 %tmp36 ; <double*> [#uses=1]
  %31 = load double* %scevgep37, align 4          ; <double> [#uses=1]
  %32 = fsub double %31, %iftmp.27.0              ; <double> [#uses=1]
  %33 = fmul double %32, %19                      ; <double> [#uses=1]
  %34 = fptosi double %33 to i32                  ; <i32> [#uses=2]
  %35 = and i32 %30, 15                           ; <i32> [#uses=1]
  %36 = icmp eq i32 %35, 8                        ; <i1> [#uses=1]
  %iftmp.31.0 = select i1 %36, i32 255, i32 0     ; <i32> [#uses=2]
  %37 = icmp eq i32 %34, %iftmp.31.0              ; <i1> [#uses=1]
  br i1 %37, label %bb36, label %bb35

bb35:                                             ; preds = %bb30
  %38 = add nsw i32 %m.11, 1                      ; <i32> [#uses=1]
  %39 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %39, i8* noalias getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0), i32 %43, i32 %30, i32 %iftmp.31.0, i32 %34) nounwind ; <i32> [#uses=0]
  br label %bb36

bb36:                                             ; preds = %bb35, %bb30
  %m.0 = phi i32 [ %38, %bb35 ], [ %m.11, %bb30 ] ; <i32> [#uses=2]
  %41 = add nsw i32 %30, 1                        ; <i32> [#uses=2]
  %exitcond32 = icmp eq i32 %41, 256              ; <i1> [#uses=1]
  br i1 %exitcond32, label %bb38, label %bb30

bb38:                                             ; preds = %bb36, %bb36.us
  %m.1.lcssa3.us-lcssa = phi i32 [ %m.0.us, %bb36.us ], [ %m.0, %bb36 ] ; <i32> [#uses=3]
  %42 = add i32 %43, 1                            ; <i32> [#uses=2]
  %exitcond38 = icmp eq i32 %42, 256              ; <i1> [#uses=1]
  br i1 %exitcond38, label %bb40, label %bb37.preheader

bb37.preheader:                                   ; preds = %bb38, %bb28
  %43 = phi i32 [ 0, %bb28 ], [ %42, %bb38 ]      ; <i32> [#uses=5]
  %m.24 = phi i32 [ 0, %bb28 ], [ %m.1.lcssa3.us-lcssa, %bb38 ] ; <i32> [#uses=2]
  %tmp39 = shl i32 %43, 9                         ; <i32> [#uses=1]
  %tmp3063 = or i32 %tmp39, 1                     ; <i32> [#uses=2]
  %44 = and i32 %43, 15                           ; <i32> [#uses=1]
  %45 = icmp eq i32 %44, 8                        ; <i1> [#uses=1]
  br i1 %45, label %bb30.us, label %bb30

bb40:                                             ; preds = %bb38
  %46 = icmp eq i32 %m.1.lcssa3.us-lcssa, 0       ; <i1> [#uses=1]
  %47 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=2]
  br i1 %46, label %bb41, label %bb42

bb41:                                             ; preds = %bb40
  %48 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %47, i8* noalias getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0), i32 63) nounwind ; <i32> [#uses=0]
  ret i32 0

bb42:                                             ; preds = %bb40
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %47, i8* noalias getelementptr inbounds ([35 x i8]* @.str3, i32 0, i32 0), i32 63, i32 %m.1.lcssa3.us-lcssa) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

declare void @llvm.memset.i32(i8* nocapture, i8, i32, i32) nounwind

declare i32 @fprintf(%struct._IO_FILE* noalias nocapture, i8* noalias nocapture, ...) nounwind
