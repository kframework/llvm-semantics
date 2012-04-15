; ModuleID = 'nestedloop.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb17.preheader.preheader

bb2:                                              ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=2]
  %4 = icmp sgt i32 %3, 0                         ; <i1> [#uses=1]
  br i1 %4, label %bb17.preheader.preheader, label %bb20

bb17.preheader.preheader:                         ; preds = %bb2, %entry
  %iftmp.17.0.reg2mem.0.ph = phi i32 [ %3, %bb2 ], [ 46, %entry ] ; <i32> [#uses=6]
  br label %bb17.preheader

bb9.preheader.us:                                 ; preds = %bb11.preheader, %bb9.preheader.us
  %x.15.us = phi i32 [ %x.29, %bb11.preheader ], [ %tmp, %bb9.preheader.us ] ; <i32> [#uses=1]
  %e.04.us = phi i32 [ 0, %bb11.preheader ], [ %5, %bb9.preheader.us ] ; <i32> [#uses=1]
  %tmp = add i32 %x.15.us, %iftmp.17.0.reg2mem.0.ph ; <i32> [#uses=6]
  %5 = add nsw i32 %e.04.us, 1                    ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %5, %iftmp.17.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond, label %bb12, label %bb9.preheader.us

bb12:                                             ; preds = %bb9.preheader.us
  %6 = add i32 %d.08, 1                           ; <i32> [#uses=2]
  %exitcond25 = icmp eq i32 %6, %iftmp.17.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond25, label %bb14, label %bb11.preheader

bb11.preheader:                                   ; preds = %bb13.preheader, %bb12
  %x.29 = phi i32 [ %x.313, %bb13.preheader ], [ %tmp, %bb12 ] ; <i32> [#uses=1]
  %d.08 = phi i32 [ 0, %bb13.preheader ], [ %6, %bb12 ] ; <i32> [#uses=1]
  br label %bb9.preheader.us

bb14:                                             ; preds = %bb12
  %7 = add i32 %c.012, 1                          ; <i32> [#uses=2]
  %exitcond26 = icmp eq i32 %7, %iftmp.17.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond26, label %bb16, label %bb13.preheader

bb13.preheader:                                   ; preds = %bb15.preheader, %bb14
  %x.313 = phi i32 [ %x.416, %bb15.preheader ], [ %tmp, %bb14 ] ; <i32> [#uses=1]
  %c.012 = phi i32 [ 0, %bb15.preheader ], [ %7, %bb14 ] ; <i32> [#uses=1]
  br label %bb11.preheader

bb16:                                             ; preds = %bb14
  %8 = add i32 %b.017, 1                          ; <i32> [#uses=2]
  %exitcond27 = icmp eq i32 %8, %iftmp.17.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond27, label %bb18, label %bb15.preheader

bb15.preheader:                                   ; preds = %bb17.preheader, %bb16
  %b.017 = phi i32 [ 0, %bb17.preheader ], [ %8, %bb16 ] ; <i32> [#uses=1]
  %x.416 = phi i32 [ %x.520, %bb17.preheader ], [ %tmp, %bb16 ] ; <i32> [#uses=1]
  br label %bb13.preheader

bb18:                                             ; preds = %bb16
  %9 = add i32 %a.021, 1                          ; <i32> [#uses=2]
  %exitcond28 = icmp eq i32 %9, %iftmp.17.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond28, label %bb20, label %bb17.preheader

bb17.preheader:                                   ; preds = %bb18, %bb17.preheader.preheader
  %a.021 = phi i32 [ %9, %bb18 ], [ 0, %bb17.preheader.preheader ] ; <i32> [#uses=1]
  %x.520 = phi i32 [ %tmp, %bb18 ], [ 0, %bb17.preheader.preheader ] ; <i32> [#uses=1]
  br label %bb15.preheader

bb20:                                             ; preds = %bb18, %bb2
  %x.5.lcssa = phi i32 [ 0, %bb2 ], [ %tmp, %bb18 ] ; <i32> [#uses=1]
  %10 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %x.5.lcssa) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
