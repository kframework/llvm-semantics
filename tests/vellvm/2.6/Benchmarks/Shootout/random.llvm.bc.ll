; ModuleID = 'random.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [6 x i8] c"%.9f\0A\00", align 1 ; <[6 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb4.preheader

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  br label %bb4.preheader

bb4.preheader:                                    ; preds = %bb, %entry
  %N.0.ph = phi i32 [ %3, %bb ], [ 400000000, %entry ] ; <i32> [#uses=1]
  br label %bb4

bb4:                                              ; preds = %bb4, %bb4.preheader
  %indvar = phi i32 [ 0, %bb4.preheader ], [ %indvar.next, %bb4 ] ; <i32> [#uses=1]
  %last.3486.tmp.0 = phi i32 [ 42, %bb4.preheader ], [ %6, %bb4 ] ; <i32> [#uses=1]
  %4 = mul i32 %last.3486.tmp.0, 3877             ; <i32> [#uses=1]
  %5 = add nsw i32 %4, 29573                      ; <i32> [#uses=1]
  %6 = srem i32 %5, 139968                        ; <i32> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %N.0.ph   ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb4

bb5:                                              ; preds = %bb4
  %7 = sitofp i32 %6 to double                    ; <double> [#uses=1]
  %8 = fmul double %7, 1.000000e+02               ; <double> [#uses=1]
  %9 = fdiv double %8, 1.399680e+05               ; <double> [#uses=1]
  %10 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %9) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
