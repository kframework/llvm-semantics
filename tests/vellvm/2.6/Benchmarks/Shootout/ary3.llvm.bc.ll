; ModuleID = 'ary3.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [7 x i8] c"%d %d\0A\00", align 1 ; <[7 x i8]*> [#uses=1]

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
  %iftmp.17.0 = phi i32 [ %3, %bb ], [ 1500000, %entry ] ; <i32> [#uses=6]
  %4 = tail call noalias i8* @calloc(i32 %iftmp.17.0, i32 4) nounwind ; <i8*> [#uses=3]
  %5 = tail call noalias i8* @calloc(i32 %iftmp.17.0, i32 4) nounwind ; <i8*> [#uses=3]
  %6 = bitcast i8* %5 to i32*                     ; <i32*> [#uses=2]
  %7 = icmp sgt i32 %iftmp.17.0, 0                ; <i1> [#uses=1]
  br i1 %7, label %bb3, label %bb10.loopexit

bb3:                                              ; preds = %bb3, %bb2
  %i.05 = phi i32 [ %tmp20, %bb3 ], [ 0, %bb2 ]   ; <i32> [#uses=2]
  %tmp17 = shl i32 %i.05, 2                       ; <i32> [#uses=1]
  %scevgep18 = getelementptr i8* %4, i32 %tmp17   ; <i8*> [#uses=1]
  %scevgep1819 = bitcast i8* %scevgep18 to i32*   ; <i32*> [#uses=1]
  %tmp20 = add i32 %i.05, 1                       ; <i32> [#uses=3]
  store i32 %tmp20, i32* %scevgep1819, align 4
  %exitcond16 = icmp eq i32 %tmp20, %iftmp.17.0   ; <i1> [#uses=1]
  br i1 %exitcond16, label %bb10.loopexit, label %bb3

bb7:                                              ; preds = %bb8.preheader, %bb7
  %indvar = phi i32 [ %indvar.next, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=3]
  %tmp = mul i32 %indvar, -4                      ; <i32> [#uses=1]
  %tmp9 = add i32 %tmp, %tmp8                     ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %5, i32 %tmp9      ; <i8*> [#uses=1]
  %scevgep10 = bitcast i8* %scevgep to i32*       ; <i32*> [#uses=2]
  %scevgep11 = getelementptr i8* %4, i32 %tmp9    ; <i8*> [#uses=1]
  %scevgep1112 = bitcast i8* %scevgep11 to i32*   ; <i32*> [#uses=1]
  %8 = load i32* %scevgep10, align 4              ; <i32> [#uses=1]
  %9 = load i32* %scevgep1112, align 4            ; <i32> [#uses=1]
  %10 = add nsw i32 %9, %8                        ; <i32> [#uses=1]
  store i32 %10, i32* %scevgep10, align 4
  %tmp15 = sub i32 %tmp14, %indvar                ; <i32> [#uses=1]
  %phitmp7 = icmp slt i32 %tmp15, 0               ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %phitmp7, label %bb9, label %bb7

bb9:                                              ; preds = %bb8.preheader, %bb7
  %11 = add i32 %k.02, 1                          ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %11, 1000               ; <i1> [#uses=1]
  br i1 %exitcond, label %bb11, label %bb8.preheader

bb10.loopexit:                                    ; preds = %bb3, %bb2
  %12 = add i32 %iftmp.17.0, -1                   ; <i32> [#uses=3]
  %13 = icmp slt i32 %12, 0                       ; <i1> [#uses=1]
  %tmp8 = shl i32 %12, 2                          ; <i32> [#uses=1]
  %tmp14 = add i32 %iftmp.17.0, -2                ; <i32> [#uses=1]
  br label %bb8.preheader

bb8.preheader:                                    ; preds = %bb10.loopexit, %bb9
  %k.02 = phi i32 [ 0, %bb10.loopexit ], [ %11, %bb9 ] ; <i32> [#uses=1]
  br i1 %13, label %bb9, label %bb7

bb11:                                             ; preds = %bb9
  %14 = getelementptr inbounds i32* %6, i32 %12   ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = load i32* %6, align 4                     ; <i32> [#uses=1]
  %17 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %16, i32 %15) nounwind ; <i32> [#uses=0]
  free i8* %4
  free i8* %5
  ret i32 0
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare noalias i8* @calloc(i32, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
