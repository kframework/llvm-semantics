; ModuleID = 'ackermann.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1 ; <[15 x i8]*> [#uses=1]

define internal fastcc i32 @Ack(i32 %M, i32 %N) nounwind readnone {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb3.i, %Ack.exit3, %Ack.exit.i, %entry
  %M.tr = phi i32 [ %M, %entry ], [ %3, %Ack.exit.i ], [ %22, %bb3.i ], [ %.pre, %Ack.exit3 ] ; <i32> [#uses=7]
  %N.tr = phi i32 [ %N, %entry ], [ %4, %Ack.exit.i ], [ %23, %bb3.i ], [ %19, %Ack.exit3 ] ; <i32> [#uses=3]
  %0 = icmp eq i32 %M.tr, 0                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %tailrecurse
  %1 = add nsw i32 %N.tr, 1                       ; <i32> [#uses=1]
  ret i32 %1

bb1:                                              ; preds = %tailrecurse
  switch i32 %N.tr, label %bb3.i [
    i32 0, label %bb2
    i32 1, label %bb2.i
  ]

bb2:                                              ; preds = %bb1
  %2 = icmp eq i32 %M.tr, 1                       ; <i1> [#uses=1]
  br i1 %2, label %Ack.exit4, label %Ack.exit.i

Ack.exit.i:                                       ; preds = %bb2
  %3 = add i32 %M.tr, -2                          ; <i32> [#uses=2]
  %4 = tail call fastcc i32 @Ack(i32 %3, i32 1) nounwind ; <i32> [#uses=1]
  br label %tailrecurse

Ack.exit4:                                        ; preds = %bb2
  ret i32 2

bb2.i:                                            ; preds = %bb1
  %5 = add i32 %M.tr, -1                          ; <i32> [#uses=1]
  br label %tailrecurse.i

tailrecurse.i:                                    ; preds = %Ack.exit.i2, %Ack.exit.i.i, %bb2.i
  %M.tr.i = phi i32 [ %5, %bb2.i ], [ %9, %Ack.exit.i.i ], [ %18, %Ack.exit.i2 ] ; <i32> [#uses=7]
  %N.tr.i = phi i32 [ 1, %bb2.i ], [ %10, %Ack.exit.i.i ], [ %17, %Ack.exit.i2 ] ; <i32> [#uses=3]
  %6 = icmp eq i32 %M.tr.i, 0                     ; <i1> [#uses=1]
  br i1 %6, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %tailrecurse.i
  %7 = add nsw i32 %N.tr.i, 1                     ; <i32> [#uses=1]
  br label %Ack.exit3

bb1.i:                                            ; preds = %tailrecurse.i
  switch i32 %N.tr.i, label %bb3.i.i [
    i32 0, label %bb2.i1
    i32 1, label %bb2.i.i
  ]

bb2.i1:                                           ; preds = %bb1.i
  %8 = icmp eq i32 %M.tr.i, 1                     ; <i1> [#uses=1]
  br i1 %8, label %Ack.exit3, label %Ack.exit.i.i

Ack.exit.i.i:                                     ; preds = %bb2.i1
  %9 = add i32 %M.tr.i, -2                        ; <i32> [#uses=2]
  %10 = tail call fastcc i32 @Ack(i32 %9, i32 1) nounwind ; <i32> [#uses=1]
  br label %tailrecurse.i

bb2.i.i:                                          ; preds = %bb1.i
  %11 = add i32 %M.tr.i, -1                       ; <i32> [#uses=1]
  %12 = tail call fastcc i32 @Ack(i32 %11, i32 1) nounwind ; <i32> [#uses=1]
  br label %Ack.exit.i2

bb3.i.i:                                          ; preds = %bb1.i
  %13 = add i32 %N.tr.i, -2                       ; <i32> [#uses=1]
  %14 = tail call fastcc i32 @Ack(i32 %M.tr.i, i32 %13) nounwind ; <i32> [#uses=1]
  %15 = add i32 %M.tr.i, -1                       ; <i32> [#uses=1]
  %16 = tail call fastcc i32 @Ack(i32 %15, i32 %14) nounwind ; <i32> [#uses=1]
  br label %Ack.exit.i2

Ack.exit.i2:                                      ; preds = %bb3.i.i, %bb2.i.i
  %17 = phi i32 [ %16, %bb3.i.i ], [ %12, %bb2.i.i ] ; <i32> [#uses=1]
  %18 = add i32 %M.tr.i, -1                       ; <i32> [#uses=1]
  br label %tailrecurse.i

Ack.exit3:                                        ; preds = %bb2.i1, %bb.i
  %19 = phi i32 [ %7, %bb.i ], [ 2, %bb2.i1 ]     ; <i32> [#uses=1]
  %.pre = add i32 %M.tr, -1                       ; <i32> [#uses=1]
  br label %tailrecurse

bb3.i:                                            ; preds = %bb1
  %20 = add i32 %N.tr, -2                         ; <i32> [#uses=1]
  %21 = tail call fastcc i32 @Ack(i32 %M.tr, i32 %20) nounwind ; <i32> [#uses=1]
  %22 = add i32 %M.tr, -1                         ; <i32> [#uses=2]
  %23 = tail call fastcc i32 @Ack(i32 %22, i32 %21) nounwind ; <i32> [#uses=1]
  br label %tailrecurse
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.17.0 = phi i32 [ %3, %bb ], [ 8, %entry ] ; <i32> [#uses=2]
  %4 = tail call fastcc i32 @Ack(i32 3, i32 %iftmp.17.0) nounwind ; <i32> [#uses=1]
  %5 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %iftmp.17.0, i32 %4) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
