; ModuleID = 'pi.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [15 x i8] c"Starting PI...\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str1 = private constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1 ; <[45 x i8]*> [#uses=1]
@.str2 = private constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1 ; <[37 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb ] ; <i32> [#uses=1]
  %yran.011 = phi float [ 7.597591e+06, %entry ], [ %phitmp, %bb ] ; <float> [#uses=2]
  %low.18 = phi i32 [ 1, %entry ], [ %low.0, %bb ] ; <i32> [#uses=1]
  %ixran.06 = phi i32 [ 65396, %entry ], [ %phitmp2, %bb ] ; <i32> [#uses=2]
  %ztot.05 = phi float [ 0.000000e+00, %entry ], [ %12, %bb ] ; <float> [#uses=1]
  %1 = sitofp i32 %ixran.06 to float              ; <float> [#uses=1]
  %2 = fdiv float %1, 7.438300e+04                ; <float> [#uses=3]
  %3 = fdiv float %yran.011, 5.471000e+03         ; <float> [#uses=1]
  %4 = fptosi float %3 to i32                     ; <i32> [#uses=1]
  %5 = sitofp i32 %4 to float                     ; <float> [#uses=1]
  %6 = fmul float %5, 5.471000e+03                ; <float> [#uses=1]
  %7 = fsub float %yran.011, %6                   ; <float> [#uses=2]
  %8 = fdiv float %7, 5.471000e+03                ; <float> [#uses=3]
  %9 = fmul float %2, %2                          ; <float> [#uses=1]
  %10 = fmul float %8, %8                         ; <float> [#uses=1]
  %11 = fadd float %9, %10                        ; <float> [#uses=2]
  %12 = fadd float %ztot.05, %11                  ; <float> [#uses=2]
  %not. = fcmp ole float %11, 1.000000e+00        ; <i1> [#uses=1]
  %13 = zext i1 %not. to i32                      ; <i32> [#uses=1]
  %low.0 = add i32 %13, %low.18                   ; <i32> [#uses=3]
  %phitmp = fmul float %7, 1.307000e+03           ; <float> [#uses=1]
  %phitmp1 = mul i32 %ixran.06, 27611             ; <i32> [#uses=1]
  %phitmp2 = srem i32 %phitmp1, 74383             ; <i32> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 40000000  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3.bb4_crit_edge, label %bb

bb3.bb4_crit_edge:                                ; preds = %bb
  %phitmp3 = fpext float %2 to double             ; <double> [#uses=1]
  %phitmp4 = fpext float %8 to double             ; <double> [#uses=1]
  %phitmp17 = fpext float %12 to double           ; <double> [#uses=1]
  %phitmp18 = fmul double %phitmp17, 0.000000e+00 ; <double> [#uses=1]
  %14 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([45 x i8]* @.str1, i32 0, i32 0), double %phitmp3, double %phitmp4, i32 %low.0, i32 40000001) nounwind ; <i32> [#uses=0]
  %15 = sitofp i32 %low.0 to float                ; <float> [#uses=1]
  %16 = fpext float %15 to double                 ; <double> [#uses=1]
  %17 = fmul double %16, 4.000000e+00             ; <double> [#uses=1]
  %18 = fdiv double %17, 4.000000e+07             ; <double> [#uses=1]
  %19 = fptrunc double %18 to float               ; <float> [#uses=1]
  %20 = fpext float %19 to double                 ; <double> [#uses=1]
  %21 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([37 x i8]* @.str2, i32 0, i32 0), double %20, double %phitmp18, i32 40000000) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
