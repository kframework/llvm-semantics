; ModuleID = 'sieve.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@flags.2373 = internal global [8193 x i8] zeroinitializer, align 32 ; <[8193 x i8]*> [#uses=3]
@.str = private constant [11 x i8] c"Count: %d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb14.preheader, label %bb.nph12

bb14.preheader:                                   ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  %phitmp15 = add i32 %3, -1                      ; <i32> [#uses=2]
  %4 = icmp eq i32 %phitmp15, -1                  ; <i1> [#uses=1]
  br i1 %4, label %bb15, label %bb.nph12

bb4:                                              ; preds = %bb5.preheader, %bb4
  %indvar = phi i32 [ 0, %bb5.preheader ], [ %indvar.next, %bb4 ] ; <i32> [#uses=2]
  %tmp = add i32 %indvar, 2                       ; <i32> [#uses=1]
  %scevgep = getelementptr [8193 x i8]* @flags.2373, i32 0, i32 %tmp ; <i8*> [#uses=1]
  store i8 1, i8* %scevgep, align 1
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 8191      ; <i1> [#uses=1]
  br i1 %exitcond, label %bb7, label %bb4

bb7:                                              ; preds = %bb12, %bb4
  %indvar18 = phi i32 [ %indvar.next19, %bb12 ], [ 0, %bb4 ] ; <i32> [#uses=4]
  %count.26 = phi i32 [ %count.1, %bb12 ], [ 0, %bb4 ] ; <i32> [#uses=2]
  %tmp30 = shl i32 %indvar18, 1                   ; <i32> [#uses=1]
  %k.03 = add i32 %tmp30, 4                       ; <i32> [#uses=2]
  %tmp32 = mul i32 %indvar18, 3                   ; <i32> [#uses=1]
  %tmp23 = add i32 %tmp32, 6                      ; <i32> [#uses=1]
  %tmp20 = add i32 %indvar18, 2                   ; <i32> [#uses=2]
  %scevgep35 = getelementptr [8193 x i8]* @flags.2373, i32 0, i32 %tmp20 ; <i8*> [#uses=1]
  %5 = load i8* %scevgep35, align 1               ; <i8> [#uses=1]
  %6 = icmp eq i8 %5, 0                           ; <i1> [#uses=1]
  br i1 %6, label %bb12, label %bb10.preheader

bb10.preheader:                                   ; preds = %bb7
  %7 = icmp sgt i32 %k.03, 8192                   ; <i1> [#uses=1]
  br i1 %7, label %bb11, label %bb9

bb9:                                              ; preds = %bb9, %bb10.preheader
  %indvar16 = phi i32 [ %indvar.next17, %bb9 ], [ 0, %bb10.preheader ] ; <i32> [#uses=2]
  %tmp21 = mul i32 %indvar16, %tmp20              ; <i32> [#uses=2]
  %tmp27 = add i32 %tmp21, %k.03                  ; <i32> [#uses=1]
  %scevgep28 = getelementptr [8193 x i8]* @flags.2373, i32 0, i32 %tmp27 ; <i8*> [#uses=1]
  store i8 0, i8* %scevgep28, align 1
  %k.0 = add i32 %tmp21, %tmp23                   ; <i32> [#uses=1]
  %8 = icmp sgt i32 %k.0, 8192                    ; <i1> [#uses=1]
  %indvar.next17 = add i32 %indvar16, 1           ; <i32> [#uses=1]
  br i1 %8, label %bb11, label %bb9

bb11:                                             ; preds = %bb9, %bb10.preheader
  %9 = add nsw i32 %count.26, 1                   ; <i32> [#uses=1]
  br label %bb12

bb12:                                             ; preds = %bb11, %bb7
  %count.1 = phi i32 [ %9, %bb11 ], [ %count.26, %bb7 ] ; <i32> [#uses=2]
  %indvar.next19 = add i32 %indvar18, 1           ; <i32> [#uses=2]
  %exitcond29 = icmp eq i32 %indvar.next19, 8191  ; <i1> [#uses=1]
  br i1 %exitcond29, label %bb14.loopexit, label %bb7

bb14.loopexit:                                    ; preds = %bb12
  %indvar.next37 = add i32 %indvar36, 1           ; <i32> [#uses=2]
  %exitcond39 = icmp eq i32 %indvar.next37, %tmp38 ; <i1> [#uses=1]
  br i1 %exitcond39, label %bb15, label %bb5.preheader

bb.nph12:                                         ; preds = %bb14.preheader, %entry
  %NUM.0.ph.reg2mem.0 = phi i32 [ %phitmp15, %bb14.preheader ], [ 169999, %entry ] ; <i32> [#uses=1]
  %tmp38 = add i32 %NUM.0.ph.reg2mem.0, 1         ; <i32> [#uses=1]
  br label %bb5.preheader

bb5.preheader:                                    ; preds = %bb.nph12, %bb14.loopexit
  %indvar36 = phi i32 [ 0, %bb.nph12 ], [ %indvar.next37, %bb14.loopexit ] ; <i32> [#uses=1]
  br label %bb4

bb15:                                             ; preds = %bb14.loopexit, %bb14.preheader
  %count.0.lcssa = phi i32 [ 0, %bb14.preheader ], [ %count.1, %bb14.loopexit ] ; <i32> [#uses=1]
  %10 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %count.0.lcssa) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
