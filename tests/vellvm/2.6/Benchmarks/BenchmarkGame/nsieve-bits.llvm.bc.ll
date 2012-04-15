; ModuleID = 'nsieve-bits.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1 ; <[22 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = malloc [1280001 x i32]                     ; <[1280001 x i32]*> [#uses=5]
  %tmpcast = bitcast [1280001 x i32]* %0 to i8*   ; <i8*> [#uses=1]
  %1 = icmp eq [1280001 x i32]* %0, null          ; <i1> [#uses=1]
  br i1 %1, label %bb14, label %bb2

bb2:                                              ; preds = %bb11, %entry
  %2 = phi i32 [ %27, %bb11 ], [ 0, %entry ]      ; <i32> [#uses=2]
  %3 = lshr i32 40960000, %2                      ; <i32> [#uses=6]
  %4 = lshr i32 %3, 3                             ; <i32> [#uses=1]
  %5 = add i32 %4, 4                              ; <i32> [#uses=1]
  tail call void @llvm.memset.i32(i8* %tmpcast, i8 -1, i32 %5, i32 4)
  %6 = icmp ult i32 %3, 2                         ; <i1> [#uses=1]
  br i1 %6, label %bb11, label %bb3

bb3:                                              ; preds = %bb9, %bb2
  %indvar10 = phi i32 [ %indvar.next11, %bb9 ], [ 0, %bb2 ] ; <i32> [#uses=5]
  %count.14 = phi i32 [ %count.0, %bb9 ], [ 0, %bb2 ] ; <i32> [#uses=2]
  %tmp19 = shl i32 %indvar10, 1                   ; <i32> [#uses=1]
  %j.02 = add i32 %tmp19, 4                       ; <i32> [#uses=2]
  %tmp21 = mul i32 %indvar10, 3                   ; <i32> [#uses=1]
  %tmp14 = add i32 %tmp21, 6                      ; <i32> [#uses=1]
  %i.05 = add i32 %indvar10, 2                    ; <i32> [#uses=3]
  %tmp = add i32 %indvar10, 3                     ; <i32> [#uses=1]
  %7 = lshr i32 %i.05, 5                          ; <i32> [#uses=1]
  %8 = getelementptr inbounds [1280001 x i32]* %0, i32 0, i32 %7 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  %10 = and i32 %i.05, 31                         ; <i32> [#uses=1]
  %11 = shl i32 1, %10                            ; <i32> [#uses=1]
  %12 = and i32 %9, %11                           ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb9, label %bb4

bb4:                                              ; preds = %bb3
  %14 = add i32 %count.14, 1                      ; <i32> [#uses=2]
  %15 = icmp ugt i32 %j.02, %3                    ; <i1> [#uses=1]
  br i1 %15, label %bb9, label %bb5

bb5:                                              ; preds = %bb8.backedge, %bb4
  %indvar = phi i32 [ %indvar.next, %bb8.backedge ], [ 0, %bb4 ] ; <i32> [#uses=2]
  %tmp12 = mul i32 %indvar, %i.05                 ; <i32> [#uses=2]
  %j.0 = add i32 %tmp12, %tmp14                   ; <i32> [#uses=1]
  %j.03 = add i32 %tmp12, %j.02                   ; <i32> [#uses=2]
  %16 = lshr i32 %j.03, 5                         ; <i32> [#uses=1]
  %17 = getelementptr inbounds [1280001 x i32]* %0, i32 0, i32 %16 ; <i32*> [#uses=2]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=2]
  %19 = and i32 %j.03, 31                         ; <i32> [#uses=1]
  %20 = shl i32 1, %19                            ; <i32> [#uses=2]
  %21 = and i32 %18, %20                          ; <i32> [#uses=1]
  %22 = icmp eq i32 %21, 0                        ; <i1> [#uses=1]
  br i1 %22, label %bb8.backedge, label %bb6

bb6:                                              ; preds = %bb5
  %23 = xor i32 %18, %20                          ; <i32> [#uses=1]
  store i32 %23, i32* %17, align 4
  br label %bb8.backedge

bb8.backedge:                                     ; preds = %bb6, %bb5
  %24 = icmp ugt i32 %j.0, %3                     ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %24, label %bb9, label %bb5

bb9:                                              ; preds = %bb8.backedge, %bb4, %bb3
  %count.0 = phi i32 [ %count.14, %bb3 ], [ %14, %bb4 ], [ %14, %bb8.backedge ] ; <i32> [#uses=2]
  %25 = icmp ugt i32 %tmp, %3                     ; <i1> [#uses=1]
  %indvar.next11 = add i32 %indvar10, 1           ; <i32> [#uses=1]
  br i1 %25, label %bb11, label %bb3

bb11:                                             ; preds = %bb9, %bb2
  %count.1.lcssa = phi i32 [ 0, %bb2 ], [ %count.0, %bb9 ] ; <i32> [#uses=1]
  %26 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %count.1.lcssa) nounwind ; <i32> [#uses=0]
  %27 = add i32 %2, 1                             ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %27, 3                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb13, label %bb2

bb13:                                             ; preds = %bb11
  free [1280001 x i32]* %0
  ret i32 0

bb14:                                             ; preds = %entry
  ret i32 1
}

declare void @llvm.memset.i32(i8* nocapture, i8, i32, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
