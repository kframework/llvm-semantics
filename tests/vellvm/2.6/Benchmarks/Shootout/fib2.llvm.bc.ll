; ModuleID = 'fib2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [5 x i8] c"%ld\0A\00", align 1 ; <[5 x i8]*> [#uses=1]

define internal fastcc i32 @fib(i32 %n) nounwind readnone {
entry:
  %0 = icmp ugt i32 %n, 1                         ; <i1> [#uses=1]
  br i1 %0, label %bb1, label %bb2

bb1:                                              ; preds = %entry
  %1 = add i32 %n, -2                             ; <i32> [#uses=2]
  %2 = icmp ugt i32 %1, 1                         ; <i1> [#uses=1]
  br i1 %2, label %bb1.i1, label %fib.exit3

bb1.i1:                                           ; preds = %bb1
  %3 = add i32 %n, -4                             ; <i32> [#uses=1]
  %4 = tail call fastcc i32 @fib(i32 %3) nounwind ; <i32> [#uses=2]
  %5 = add i32 %n, -3                             ; <i32> [#uses=1]
  %6 = icmp ugt i32 %5, 1                         ; <i1> [#uses=1]
  br i1 %6, label %bb1.i.i, label %fib.exit.i

bb1.i.i:                                          ; preds = %bb1.i1
  %7 = add i32 %n, -5                             ; <i32> [#uses=1]
  %8 = tail call fastcc i32 @fib(i32 %7) nounwind ; <i32> [#uses=1]
  %9 = add i32 %4, %8                             ; <i32> [#uses=1]
  br label %fib.exit.i

fib.exit.i:                                       ; preds = %bb1.i.i, %bb1.i1
  %10 = phi i32 [ %9, %bb1.i.i ], [ 1, %bb1.i1 ]  ; <i32> [#uses=1]
  %11 = add i32 %10, %4                           ; <i32> [#uses=1]
  br label %fib.exit3

fib.exit3:                                        ; preds = %fib.exit.i, %bb1
  %12 = phi i32 [ %11, %fib.exit.i ], [ 1, %bb1 ] ; <i32> [#uses=1]
  %13 = add i32 %n, -1                            ; <i32> [#uses=1]
  %14 = icmp ugt i32 %13, 1                       ; <i1> [#uses=1]
  br i1 %14, label %bb1.i, label %fib.exit

bb1.i:                                            ; preds = %fib.exit3
  %15 = add i32 %n, -3                            ; <i32> [#uses=1]
  %16 = tail call fastcc i32 @fib(i32 %15) nounwind ; <i32> [#uses=1]
  %17 = tail call fastcc i32 @fib(i32 %1) nounwind ; <i32> [#uses=1]
  %18 = add i32 %17, %16                          ; <i32> [#uses=1]
  br label %fib.exit

fib.exit:                                         ; preds = %bb1.i, %fib.exit3
  %19 = phi i32 [ %18, %bb1.i ], [ 1, %fib.exit3 ] ; <i32> [#uses=1]
  %20 = add i32 %19, %12                          ; <i32> [#uses=1]
  ret i32 %20

bb2:                                              ; preds = %entry
  ret i32 1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @atoi(i8* %2) nounwind       ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.17.0 = phi i32 [ %3, %bb ], [ 43, %entry ] ; <i32> [#uses=1]
  %4 = tail call fastcc i32 @fib(i32 %iftmp.17.0) nounwind ; <i32> [#uses=1]
  %5 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 %4) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare i32 @printf(i8* nocapture, ...) nounwind
