; ModuleID = 'mandel-2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [2 x i8] c"*\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str1 = private constant [2 x i8] c" \00", align 1 ; <[2 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  br label %bb33.preheader

bb1:                                              ; preds = %bb33.preheader, %loop.exit
  %indvar = phi i32 [ 0, %bb33.preheader ], [ %indvar.next, %loop.exit ] ; <i32> [#uses=2]
  %i.09 = add i32 %indvar, -39                    ; <i32> [#uses=1]
  %0 = sitofp i32 %i.09 to double                 ; <double> [#uses=1]
  %1 = fdiv double %0, 4.000000e+01               ; <double> [#uses=2]
  %2 = fmul double %1, 0.000000e+00               ; <double> [#uses=1]
  %3 = fadd double %1, 0.000000e+00               ; <double> [#uses=2]
  %tmpr = fadd double %17, %2                     ; <double> [#uses=2]
  br label %bb22.i

bb.i:                                             ; preds = %bb24.i
  %4 = fsub double %7, %8                         ; <double> [#uses=1]
  %5 = fmul double %z.0.0.i, %z.1.0.i             ; <double> [#uses=2]
  %6 = fadd double %5, %5                         ; <double> [#uses=1]
  %tmpr.i = fadd double %4, %tmpr                 ; <double> [#uses=1]
  %tmpi.i = fadd double %6, %3                    ; <double> [#uses=1]
  br label %bb22.i

bb22.i:                                           ; preds = %bb.i, %bb1
  %indvar.i = phi i32 [ 0, %bb1 ], [ %i.0.i, %bb.i ] ; <i32> [#uses=2]
  %z.0.0.i = phi double [ %tmpr, %bb1 ], [ %tmpr.i, %bb.i ] ; <double> [#uses=3]
  %z.1.0.i = phi double [ %3, %bb1 ], [ %tmpi.i, %bb.i ] ; <double> [#uses=3]
  %i.0.i = add i32 %indvar.i, 1                   ; <i32> [#uses=3]
  %tmp.i = add i32 %indvar.i, 2                   ; <i32> [#uses=1]
  %7 = fmul double %z.0.0.i, %z.0.0.i             ; <double> [#uses=2]
  %8 = fmul double %z.1.0.i, %z.1.0.i             ; <double> [#uses=2]
  %9 = fadd double %7, %8                         ; <double> [#uses=1]
  %10 = fcmp ugt double %9, 4.000000e+00          ; <i1> [#uses=1]
  br i1 %10, label %loop.exit, label %bb24.i

bb24.i:                                           ; preds = %bb22.i
  %11 = icmp slt i32 %i.0.i, 65536                ; <i1> [#uses=1]
  br i1 %11, label %bb.i, label %loop.exit

loop.exit:                                        ; preds = %bb24.i, %bb22.i
  %i.1.i = phi i32 [ %i.0.i, %bb22.i ], [ %tmp.i, %bb24.i ] ; <i32> [#uses=1]
  %12 = icmp sgt i32 %i.1.i, 65536                ; <i1> [#uses=1]
  %iftmp.18.0 = select i1 %12, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0) ; <i8*> [#uses=1]
  %13 = tail call i32 (i8*, ...)* @printf(i8* noalias %iftmp.18.0) nounwind ; <i32> [#uses=0]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 78        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb34, label %bb1

bb34:                                             ; preds = %loop.exit
  %14 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  %indvar.next14 = add i32 %indvar13, 1           ; <i32> [#uses=2]
  %exitcond15 = icmp eq i32 %indvar.next14, 78    ; <i1> [#uses=1]
  br i1 %exitcond15, label %bb36, label %bb33.preheader

bb33.preheader:                                   ; preds = %bb34, %entry
  %indvar13 = phi i32 [ 0, %entry ], [ %indvar.next14, %bb34 ] ; <i32> [#uses=2]
  %j.010 = add i32 %indvar13, -39                 ; <i32> [#uses=1]
  %15 = sitofp i32 %j.010 to double               ; <double> [#uses=1]
  %16 = fdiv double %15, 4.000000e+01             ; <double> [#uses=1]
  %17 = fadd double %16, -5.000000e-01            ; <double> [#uses=1]
  br label %bb1

bb36:                                             ; preds = %bb34
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32) nounwind
