; ModuleID = 'Bubblesort.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@sortlist = internal global [5001 x i32] zeroinitializer, align 32 ; <[5001 x i32]*> [#uses=6]
@.str = private constant [18 x i8] c"Error3 in Bubble.\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Bubble.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %17, %Bubble.exit ] ; <i32> [#uses=1]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb4.i.i, %bb
  %indvar.i.i = phi i32 [ 0, %bb ], [ %tmp.i, %bb4.i.i ] ; <i32> [#uses=1]
  %littlest.tmp.1.i.i = phi i32 [ 0, %bb ], [ %littlest.tmp.0.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %biggest.tmp.1.i.i = phi i32 [ 0, %bb ], [ %biggest.tmp.0.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %seed.tmp.0.i.i = phi i32 [ 74755, %bb ], [ %3, %bb4.i.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i.i, 1                 ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp.i ; <i32*> [#uses=1]
  %1 = mul i32 %seed.tmp.0.i.i, 1309              ; <i32> [#uses=1]
  %2 = add nsw i32 %1, 13849                      ; <i32> [#uses=1]
  %3 = and i32 %2, 65535                          ; <i32> [#uses=2]
  %4 = urem i32 %3, 100000                        ; <i32> [#uses=1]
  %5 = add i32 %4, -50000                         ; <i32> [#uses=5]
  store i32 %5, i32* %scevgep.i.i, align 4
  %6 = icmp sgt i32 %5, %biggest.tmp.1.i.i        ; <i1> [#uses=1]
  br i1 %6, label %bb4.i.i, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb.i.i
  %7 = icmp slt i32 %5, %littlest.tmp.1.i.i       ; <i1> [#uses=1]
  br i1 %7, label %bb3.i.i, label %bb4.i.i

bb3.i.i:                                          ; preds = %bb2.i.i
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb3.i.i, %bb2.i.i, %bb.i.i
  %littlest.tmp.0.i.i = phi i32 [ %5, %bb3.i.i ], [ %littlest.tmp.1.i.i, %bb.i.i ], [ %littlest.tmp.1.i.i, %bb2.i.i ] ; <i32> [#uses=2]
  %biggest.tmp.0.i.i = phi i32 [ %biggest.tmp.1.i.i, %bb3.i.i ], [ %5, %bb.i.i ], [ %biggest.tmp.1.i.i, %bb2.i.i ] ; <i32> [#uses=2]
  %exitcond22.i = icmp eq i32 %tmp.i, 500         ; <i1> [#uses=1]
  br i1 %exitcond22.i, label %bb4.preheader.i, label %bb.i.i

bb1.i:                                            ; preds = %bb4.preheader.i, %bb3.i
  %indvar.i = phi i32 [ %tmp8.i, %bb3.i ], [ 0, %bb4.preheader.i ] ; <i32> [#uses=2]
  %tmp8.i = add i32 %indvar.i, 1                  ; <i32> [#uses=3]
  %scevgep.i = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp8.i ; <i32*> [#uses=2]
  %tmp9.i = add i32 %indvar.i, 2                  ; <i32> [#uses=1]
  %scevgep10.i = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp9.i ; <i32*> [#uses=2]
  %8 = load i32* %scevgep.i, align 4              ; <i32> [#uses=2]
  %9 = load i32* %scevgep10.i, align 4            ; <i32> [#uses=2]
  %10 = icmp sgt i32 %8, %9                       ; <i1> [#uses=1]
  br i1 %10, label %bb2.i, label %bb3.i

bb2.i:                                            ; preds = %bb1.i
  store i32 %9, i32* %scevgep.i, align 4
  store i32 %8, i32* %scevgep10.i, align 4
  br label %bb3.i

bb3.i:                                            ; preds = %bb2.i, %bb1.i
  %exitcond.i = icmp eq i32 %tmp8.i, %tmp7.i      ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb5.i, label %bb1.i

bb5.i:                                            ; preds = %bb4.preheader.i, %bb3.i
  %indvar.next5.i = add i32 %indvar4.i, 1         ; <i32> [#uses=2]
  %exitcond17.i = icmp eq i32 %indvar.next5.i, 499 ; <i1> [#uses=1]
  br i1 %exitcond17.i, label %bb6.bb7_crit_edge.i, label %bb4.preheader.i

bb6.bb7_crit_edge.i:                              ; preds = %bb5.i
  %11 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i32 1), align 4 ; <i32> [#uses=1]
  %12 = icmp eq i32 %11, %littlest.tmp.0.i.i      ; <i1> [#uses=1]
  br i1 %12, label %bb8.i, label %bb9.i

bb4.preheader.i:                                  ; preds = %bb5.i, %bb4.i.i
  %indvar4.i = phi i32 [ %indvar.next5.i, %bb5.i ], [ 0, %bb4.i.i ] ; <i32> [#uses=3]
  %tmp7.i = sub i32 499, %indvar4.i               ; <i32> [#uses=1]
  %top.tmp.0.i = sub i32 500, %indvar4.i          ; <i32> [#uses=1]
  %13 = icmp sgt i32 %top.tmp.0.i, 1              ; <i1> [#uses=1]
  br i1 %13, label %bb1.i, label %bb5.i

bb8.i:                                            ; preds = %bb6.bb7_crit_edge.i
  %14 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i32 500), align 16 ; <i32> [#uses=1]
  %15 = icmp eq i32 %14, %biggest.tmp.0.i.i       ; <i1> [#uses=1]
  br i1 %15, label %Bubble.exit, label %bb9.i

bb9.i:                                            ; preds = %bb8.i, %bb6.bb7_crit_edge.i
  %16 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Bubble.exit

Bubble.exit:                                      ; preds = %bb9.i, %bb8.i
  %17 = add nsw i32 %0, 1                         ; <i32> [#uses=3]
  %18 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %17 ; <i32*> [#uses=1]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  %20 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %19) nounwind ; <i32> [#uses=0]
  %exitcond = icmp eq i32 %17, 100                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Bubble.exit
  ret i32 0
}
