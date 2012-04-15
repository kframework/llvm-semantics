; ModuleID = 'mandel-text.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb20, %entry
  %0 = phi i32 [ 0, %entry ], [ %31, %bb20 ]      ; <i32> [#uses=2]
  %1 = sitofp i32 %0 to double                    ; <double> [#uses=1]
  %2 = fmul double %1, 5.000000e-02               ; <double> [#uses=1]
  %3 = fadd double %2, -1.000000e+00              ; <double> [#uses=2]
  br label %bb8.preheader

bb2:                                              ; preds = %bb8.preheader, %bb7
  %SLOW.01 = phi i32 [ 0, %bb8.preheader ], [ %16, %bb7 ] ; <i32> [#uses=1]
  br label %bb6

bb3:                                              ; preds = %bb6
  %4 = fmul double %fZReal.0, %fZReal.0           ; <double> [#uses=2]
  %5 = fmul double %fZImg.0, %fZImg.0             ; <double> [#uses=2]
  %6 = fadd double %4, %5                         ; <double> [#uses=1]
  %7 = fcmp ogt double %6, 4.000000e+00           ; <i1> [#uses=1]
  br i1 %7, label %bb7, label %bb5

bb5:                                              ; preds = %bb3
  %8 = fmul double %fZReal.0, 2.000000e+00        ; <double> [#uses=1]
  %9 = fmul double %8, %fZImg.0                   ; <double> [#uses=1]
  %10 = fadd double %9, %3                        ; <double> [#uses=1]
  %11 = fsub double %4, %5                        ; <double> [#uses=1]
  %12 = fadd double %11, %29                      ; <double> [#uses=1]
  %13 = add i32 %14, 1                            ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb5, %bb2
  %14 = phi i32 [ 0, %bb2 ], [ %13, %bb5 ]        ; <i32> [#uses=5]
  %fZReal.0 = phi double [ %29, %bb2 ], [ %12, %bb5 ] ; <double> [#uses=3]
  %fZImg.0 = phi double [ %3, %bb2 ], [ %10, %bb5 ] ; <double> [#uses=3]
  %15 = icmp slt i32 %14, 255                     ; <i1> [#uses=1]
  br i1 %15, label %bb3, label %bb7

bb7:                                              ; preds = %bb6, %bb3
  %bInside.3 = phi i8 [ 0, %bb3 ], [ 1, %bb6 ]    ; <i8> [#uses=1]
  %16 = add nsw i32 %SLOW.01, 1                   ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %16, 2000               ; <i1> [#uses=1]
  br i1 %exitcond, label %bb9, label %bb2

bb9:                                              ; preds = %bb7
  %17 = icmp sgt i32 %14, 99999                   ; <i1> [#uses=1]
  br i1 %17, label %bb11, label %bb10

bb10:                                             ; preds = %bb9
  %18 = tail call i32 @putchar(i32 88)            ; <i32> [#uses=0]
  br label %bb18

bb11:                                             ; preds = %bb9
  %toBool = icmp eq i8 %bInside.3, 0              ; <i1> [#uses=1]
  br i1 %toBool, label %bb13, label %bb12

bb12:                                             ; preds = %bb11
  %19 = tail call i32 @putchar(i32 32)            ; <i32> [#uses=0]
  br label %bb18

bb13:                                             ; preds = %bb11
  %20 = icmp sgt i32 %14, 4                       ; <i1> [#uses=1]
  br i1 %20, label %bb14, label %bb15

bb14:                                             ; preds = %bb13
  %21 = tail call i32 @putchar(i32 46)            ; <i32> [#uses=0]
  br label %bb18

bb15:                                             ; preds = %bb13
  %22 = icmp sgt i32 %14, 2                       ; <i1> [#uses=1]
  br i1 %22, label %bb16, label %bb17

bb16:                                             ; preds = %bb15
  %23 = tail call i32 @putchar(i32 43)            ; <i32> [#uses=0]
  br label %bb18

bb17:                                             ; preds = %bb15
  %24 = tail call i32 @putchar(i32 42)            ; <i32> [#uses=0]
  br label %bb18

bb18:                                             ; preds = %bb17, %bb16, %bb14, %bb12, %bb10
  %25 = add i32 %26, 1                            ; <i32> [#uses=2]
  %exitcond18 = icmp eq i32 %25, 78               ; <i1> [#uses=1]
  br i1 %exitcond18, label %bb20, label %bb8.preheader

bb8.preheader:                                    ; preds = %bb18, %bb
  %26 = phi i32 [ 0, %bb ], [ %25, %bb18 ]        ; <i32> [#uses=2]
  %27 = sitofp i32 %26 to double                  ; <double> [#uses=1]
  %28 = fmul double %27, 5.000000e-02             ; <double> [#uses=1]
  %29 = fadd double %28, -2.300000e+00            ; <double> [#uses=2]
  br label %bb2

bb20:                                             ; preds = %bb18
  %30 = tail call i32 @putchar(i32 10)            ; <i32> [#uses=0]
  %31 = add nsw i32 %0, 1                         ; <i32> [#uses=2]
  %exitcond19 = icmp eq i32 %31, 40               ; <i1> [#uses=1]
  br i1 %exitcond19, label %bb22, label %bb

bb22:                                             ; preds = %bb20
  ret i32 0
}

declare i32 @putchar(i32) nounwind
