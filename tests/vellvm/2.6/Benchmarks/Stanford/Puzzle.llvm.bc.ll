; ModuleID = 'Puzzle.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@p = internal global [13 x [512 x i32]] zeroinitializer, align 32 ; <[13 x [512 x i32]]*> [#uses=83]
@puzzl = internal global [512 x i32] zeroinitializer, align 32 ; <[512 x i32]*> [#uses=13]
@piecemax = internal global [13 x i32] zeroinitializer, align 32 ; <[13 x i32]*> [#uses=14]
@class = internal global [13 x i32] zeroinitializer, align 32 ; <[13 x i32]*> [#uses=14]
@piececount = internal global [4 x i32] zeroinitializer ; <[4 x i32]*> [#uses=6]
@kount = internal global i32 0                    ; <i32*> [#uses=5]
@.str = private constant [17 x i8] c"Error1 in Puzzle\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str1 = private constant [18 x i8] c"Error2 in Puzzle.\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str2 = private constant [18 x i8] c"Error3 in Puzzle.\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str3 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal fastcc i32 @Trial(i32 %j) nounwind {
entry:
  %0 = load i32* @kount, align 4                  ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1                          ; <i32> [#uses=1]
  store i32 %1, i32* @kount, align 4
  br label %bb7

bb:                                               ; preds = %bb7
  %2 = load i32* %scevgep, align 4                ; <i32> [#uses=1]
  %3 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i32 %2 ; <i32*> [#uses=2]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=2]
  %5 = icmp eq i32 %4, 0                          ; <i1> [#uses=1]
  br i1 %5, label %bb6, label %bb1

bb1:                                              ; preds = %bb
  %6 = load i32* %scevgep20, align 4              ; <i32> [#uses=3]
  br label %bb4.i

bb.i:                                             ; preds = %bb4.i
  %scevgep1.i = getelementptr [13 x [512 x i32]]* @p, i32 0, i32 %34, i32 %12 ; <i32*> [#uses=1]
  %7 = load i32* %scevgep1.i, align 4             ; <i32> [#uses=1]
  %8 = icmp eq i32 %7, 0                          ; <i1> [#uses=1]
  br i1 %8, label %bb3.i, label %bb1.i

bb1.i:                                            ; preds = %bb.i
  %9 = load i32* %scevgep.i, align 4              ; <i32> [#uses=1]
  %10 = icmp eq i32 %9, 0                         ; <i1> [#uses=1]
  br i1 %10, label %bb3.i, label %bb6

bb3.i:                                            ; preds = %bb1.i, %bb.i
  %11 = add i32 %12, 1                            ; <i32> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %bb1
  %12 = phi i32 [ 0, %bb1 ], [ %11, %bb3.i ]      ; <i32> [#uses=4]
  %tmp18 = add i32 %12, %j                        ; <i32> [#uses=1]
  %scevgep.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp18 ; <i32*> [#uses=1]
  %13 = icmp slt i32 %6, %12                      ; <i1> [#uses=1]
  br i1 %13, label %bb2, label %bb.i

bb2:                                              ; preds = %bb4.i
  %14 = icmp slt i32 %6, 0                        ; <i1> [#uses=1]
  br i1 %14, label %bb4.i4, label %bb.i1

bb.i1:                                            ; preds = %bb2.i, %bb2
  %k.01.i = phi i32 [ %tmp4.i, %bb2.i ], [ 0, %bb2 ] ; <i32> [#uses=3]
  %scevgep2.i = getelementptr [13 x [512 x i32]]* @p, i32 0, i32 %34, i32 %k.01.i ; <i32*> [#uses=1]
  %tmp4.i = add i32 %k.01.i, 1                    ; <i32> [#uses=2]
  %15 = load i32* %scevgep2.i, align 4            ; <i32> [#uses=1]
  %16 = icmp eq i32 %15, 0                        ; <i1> [#uses=1]
  br i1 %16, label %bb2.i, label %bb1.i3

bb1.i3:                                           ; preds = %bb.i1
  %tmp16 = add i32 %k.01.i, %j                    ; <i32> [#uses=1]
  %scevgep3.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp16 ; <i32*> [#uses=1]
  store i32 1, i32* %scevgep3.i, align 4
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i3, %bb.i1
  %17 = icmp slt i32 %6, %tmp4.i                  ; <i1> [#uses=1]
  br i1 %17, label %bb4.i4, label %bb.i1

bb4.i4:                                           ; preds = %bb2.i, %bb2
  %18 = add i32 %4, -1                            ; <i32> [#uses=1]
  store i32 %18, i32* %3, align 4
  br label %bb8.i

bb5.i:                                            ; preds = %bb8.i
  %scevgep.i5 = getelementptr [512 x i32]* @puzzl, i32 0, i32 %k.1.i ; <i32*> [#uses=1]
  %19 = load i32* %scevgep.i5, align 4            ; <i32> [#uses=1]
  %20 = icmp eq i32 %19, 0                        ; <i1> [#uses=1]
  br i1 %20, label %Place.exit, label %bb7.i

bb7.i:                                            ; preds = %bb5.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb8.i

bb8.i:                                            ; preds = %bb7.i, %bb4.i4
  %indvar.i = phi i32 [ 0, %bb4.i4 ], [ %indvar.next.i, %bb7.i ] ; <i32> [#uses=2]
  %k.1.i = add i32 %indvar.i, %j                  ; <i32> [#uses=3]
  %21 = icmp sgt i32 %k.1.i, 511                  ; <i1> [#uses=1]
  br i1 %21, label %Place.exit, label %bb5.i

Place.exit:                                       ; preds = %bb8.i, %bb5.i
  %.0.i6 = phi i32 [ %k.1.i, %bb5.i ], [ 0, %bb8.i ] ; <i32> [#uses=2]
  %22 = tail call fastcc i32 @Trial(i32 %.0.i6) nounwind ; <i32> [#uses=1]
  %.not = icmp ne i32 %22, 0                      ; <i1> [#uses=1]
  %23 = icmp eq i32 %.0.i6, 0                     ; <i1> [#uses=1]
  %or.cond = or i1 %.not, %23                     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb9, label %bb5

bb5:                                              ; preds = %Place.exit
  %24 = load i32* %scevgep20, align 4             ; <i32> [#uses=2]
  %25 = icmp slt i32 %24, 0                       ; <i1> [#uses=1]
  br i1 %25, label %Remove.exit, label %bb.i9

bb.i9:                                            ; preds = %bb2.i13, %bb5
  %k.01.i7 = phi i32 [ %tmp3.i, %bb2.i13 ], [ 0, %bb5 ] ; <i32> [#uses=3]
  %scevgep.i8 = getelementptr [13 x [512 x i32]]* @p, i32 0, i32 %34, i32 %k.01.i7 ; <i32*> [#uses=1]
  %tmp3.i = add i32 %k.01.i7, 1                   ; <i32> [#uses=2]
  %26 = load i32* %scevgep.i8, align 4            ; <i32> [#uses=1]
  %27 = icmp eq i32 %26, 0                        ; <i1> [#uses=1]
  br i1 %27, label %bb2.i13, label %bb1.i12

bb1.i12:                                          ; preds = %bb.i9
  %tmp = add i32 %k.01.i7, %j                     ; <i32> [#uses=1]
  %scevgep2.i11 = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i11, align 4
  br label %bb2.i13

bb2.i13:                                          ; preds = %bb1.i12, %bb.i9
  %28 = icmp slt i32 %24, %tmp3.i                 ; <i1> [#uses=1]
  br i1 %28, label %Remove.exit, label %bb.i9

Remove.exit:                                      ; preds = %bb2.i13, %bb5
  %29 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  %30 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i32 %29 ; <i32*> [#uses=2]
  %31 = load i32* %30, align 4                    ; <i32> [#uses=1]
  %32 = add nsw i32 %31, 1                        ; <i32> [#uses=1]
  store i32 %32, i32* %30, align 4
  br label %bb6

bb6:                                              ; preds = %Remove.exit, %bb1.i, %bb
  %33 = add i32 %34, 1                            ; <i32> [#uses=1]
  br label %bb7

bb7:                                              ; preds = %bb6, %entry
  %34 = phi i32 [ 0, %entry ], [ %33, %bb6 ]      ; <i32> [#uses=7]
  %scevgep = getelementptr [13 x i32]* @class, i32 0, i32 %34 ; <i32*> [#uses=2]
  %scevgep20 = getelementptr [13 x i32]* @piecemax, i32 0, i32 %34 ; <i32*> [#uses=2]
  %35 = icmp sgt i32 %34, 12                      ; <i1> [#uses=1]
  br i1 %35, label %bb9, label %bb

bb9:                                              ; preds = %bb7, %Place.exit
  %.0 = phi i32 [ 1, %Place.exit ], [ 0, %bb7 ]   ; <i32> [#uses=1]
  ret i32 %.0
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Puzzle.exit, %entry
  %n.1 = phi i32 [ 0, %entry ], [ %n.0, %Puzzle.exit ] ; <i32> [#uses=2]
  %i.01 = phi i32 [ 0, %entry ], [ %28, %Puzzle.exit ] ; <i32> [#uses=1]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb
  %m.094.i = phi i32 [ 0, %bb ], [ %0, %bb.i ]    ; <i32> [#uses=2]
  %scevgep292.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %m.094.i ; <i32*> [#uses=1]
  store i32 1, i32* %scevgep292.i, align 4
  %0 = add nsw i32 %m.094.i, 1                    ; <i32> [#uses=2]
  %exitcond291.i = icmp eq i32 %0, 512            ; <i1> [#uses=1]
  br i1 %exitcond291.i, label %bb8.preheader.i, label %bb.i

bb6.preheader.i:                                  ; preds = %bb8.preheader.i, %bb6.preheader.i
  %indvar276.i = phi i32 [ 0, %bb8.preheader.i ], [ %indvar.next277.i, %bb6.preheader.i ] ; <i32> [#uses=2]
  %tmp286.i = shl i32 %indvar276.i, 3             ; <i32> [#uses=1]
  %tmp282.i = add i32 %tmp286.i, %tmp287.i        ; <i32> [#uses=5]
  %scevgep284.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp282.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep284.i, align 4
  %tmp283.1.i = add i32 %tmp282.i, 64             ; <i32> [#uses=1]
  %scevgep284.1.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp283.1.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep284.1.i, align 4
  %tmp283.2.i = add i32 %tmp282.i, 128            ; <i32> [#uses=1]
  %scevgep284.2.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp283.2.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep284.2.i, align 4
  %tmp283.3.i = add i32 %tmp282.i, 192            ; <i32> [#uses=1]
  %scevgep284.3.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp283.3.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep284.3.i, align 4
  %tmp283.4.i = add i32 %tmp282.i, 256            ; <i32> [#uses=1]
  %scevgep284.4.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp283.4.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep284.4.i, align 4
  %indvar.next277.i = add i32 %indvar276.i, 1     ; <i32> [#uses=2]
  %exitcond285.i = icmp eq i32 %indvar.next277.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond285.i, label %bb9.i, label %bb6.preheader.i

bb9.i:                                            ; preds = %bb6.preheader.i
  %indvar.next280.i = add i32 %indvar279.i, 1     ; <i32> [#uses=2]
  %exitcond289.i = icmp eq i32 %indvar.next280.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond289.i, label %bb14.preheader.i, label %bb8.preheader.i

bb8.preheader.i:                                  ; preds = %bb9.i, %bb.i
  %indvar279.i = phi i32 [ %indvar.next280.i, %bb9.i ], [ 0, %bb.i ] ; <i32> [#uses=2]
  %tmp287.i = add i32 %indvar279.i, 73            ; <i32> [#uses=1]
  br label %bb6.preheader.i

bb13.i:                                           ; preds = %bb14.preheader.i, %bb13.i
  %m.184.i = phi i32 [ 0, %bb14.preheader.i ], [ %1, %bb13.i ] ; <i32> [#uses=2]
  %scevgep272.i = getelementptr [13 x [512 x i32]]* @p, i32 0, i32 %3, i32 %m.184.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep272.i, align 4
  %1 = add nsw i32 %m.184.i, 1                    ; <i32> [#uses=2]
  %exitcond271.i = icmp eq i32 %1, 512            ; <i1> [#uses=1]
  br i1 %exitcond271.i, label %bb15.i, label %bb13.i

bb15.i:                                           ; preds = %bb13.i
  %2 = add i32 %3, 1                              ; <i32> [#uses=2]
  %exitcond273.i = icmp eq i32 %2, 13             ; <i1> [#uses=1]
  br i1 %exitcond273.i, label %bb25.loopexit.i, label %bb14.preheader.i

bb14.preheader.i:                                 ; preds = %bb15.i, %bb9.i
  %3 = phi i32 [ %2, %bb15.i ], [ 0, %bb9.i ]     ; <i32> [#uses=2]
  br label %bb13.i

bb25.loopexit.i:                                  ; preds = %bb15.i
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 2), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 10), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 3), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 0, i32 11), align 4
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 0), align 32
  store i32 11, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 128), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 192), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 65), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 129), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 1, i32 193), align 4
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 1), align 4
  store i32 193, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 72), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 16), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 80), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 24), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 2, i32 88), align 32
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 2), align 8
  store i32 88, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 2), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 16), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 24), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 9), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 17), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 3, i32 25), align 4
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 3), align 4
  store i32 25, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 3), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 65), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 2), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 66), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 3), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 4, i32 67), align 4
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 4), align 16
  store i32 67, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 4), align 16
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 128), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 192), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 72), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 136), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 5, i32 200), align 32
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 5), align 4
  store i32 200, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 5), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 6, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 6, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 6, i32 2), align 8
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 6), align 8
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 6), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 7, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 7, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 7, i32 16), align 32
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 7), align 4
  store i32 16, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 7), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 8, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 8, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 8, i32 128), align 32
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 8), align 32
  store i32 128, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 9, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 9, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 9, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 9, i32 9), align 4
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 9), align 4
  store i32 9, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 10, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 10, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 10, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 10, i32 65), align 4
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 10), align 8
  store i32 65, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 10), align 8
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 11, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 11, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 11, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 11, i32 72), align 32
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 11), align 4
  store i32 72, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 64), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 8), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 72), align 32
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 65), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 9), align 4
  store i32 1, i32* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i32 12, i32 73), align 4
  store i32 3, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i32 12), align 16
  store i32 73, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i32 12), align 16
  store i32 13, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i32 0), align 4
  store i32 3, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i32 2), align 4
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i32 3), align 4
  store i32 0, i32* @kount, align 4
  br label %bb4.i.i

bb.i.i:                                           ; preds = %bb4.i.i
  %scevgep1.i.i = getelementptr [13 x [512 x i32]]* @p, i32 0, i32 0, i32 %9 ; <i32*> [#uses=1]
  %4 = load i32* %scevgep1.i.i, align 4           ; <i32> [#uses=1]
  %5 = icmp eq i32 %4, 0                          ; <i1> [#uses=1]
  br i1 %5, label %bb3.i.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i.i
  %6 = load i32* %scevgep.i.i, align 4            ; <i32> [#uses=1]
  %7 = icmp eq i32 %6, 0                          ; <i1> [#uses=1]
  br i1 %7, label %bb3.i.i, label %bb136.i

bb3.i.i:                                          ; preds = %bb1.i.i, %bb.i.i
  %8 = add i32 %9, 1                              ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb3.i.i, %bb25.loopexit.i
  %9 = phi i32 [ 0, %bb25.loopexit.i ], [ %8, %bb3.i.i ] ; <i32> [#uses=4]
  %tmp142.i = add i32 %9, 73                      ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp142.i ; <i32*> [#uses=1]
  %10 = icmp sgt i32 %9, 11                       ; <i1> [#uses=1]
  br i1 %10, label %bb.i1.i, label %bb.i.i

bb.i1.i:                                          ; preds = %bb2.i.i, %bb4.i.i
  %k.01.i.i = phi i32 [ %tmp4.i.i, %bb2.i.i ], [ 0, %bb4.i.i ] ; <i32> [#uses=3]
  %scevgep2.i.i = getelementptr [13 x [512 x i32]]* @p, i32 0, i32 0, i32 %k.01.i.i ; <i32*> [#uses=1]
  %tmp4.i.i = add i32 %k.01.i.i, 1                ; <i32> [#uses=2]
  %11 = load i32* %scevgep2.i.i, align 4          ; <i32> [#uses=1]
  %12 = icmp eq i32 %11, 0                        ; <i1> [#uses=1]
  br i1 %12, label %bb2.i.i, label %bb1.i3.i

bb1.i3.i:                                         ; preds = %bb.i1.i
  %tmp.i = add i32 %k.01.i.i, 73                  ; <i32> [#uses=1]
  %scevgep3.i.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %tmp.i ; <i32*> [#uses=1]
  store i32 1, i32* %scevgep3.i.i, align 4
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i3.i, %bb.i1.i
  %13 = icmp sgt i32 %tmp4.i.i, 11                ; <i1> [#uses=1]
  br i1 %13, label %bb4.i4.i, label %bb.i1.i

bb4.i4.i:                                         ; preds = %bb2.i.i
  store i32 12, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i32 0), align 4
  br label %bb8.i.i

bb5.i.i:                                          ; preds = %bb8.i.i
  %scevgep.i5.i = getelementptr [512 x i32]* @puzzl, i32 0, i32 %k.1.i.i ; <i32*> [#uses=1]
  %14 = load i32* %scevgep.i5.i, align 4          ; <i32> [#uses=1]
  %15 = icmp eq i32 %14, 0                        ; <i1> [#uses=1]
  br i1 %15, label %bb137.i, label %bb7.i.i

bb7.i.i:                                          ; preds = %bb5.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb7.i.i, %bb4.i4.i
  %indvar.i.i = phi i32 [ 0, %bb4.i4.i ], [ %indvar.next.i.i, %bb7.i.i ] ; <i32> [#uses=2]
  %k.1.i.i = add i32 %indvar.i.i, 73              ; <i32> [#uses=4]
  %16 = icmp sgt i32 %k.1.i.i, 511                ; <i1> [#uses=1]
  br i1 %16, label %bb137.i, label %bb5.i.i

bb136.i:                                          ; preds = %bb1.i.i
  %17 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb137.i

bb137.i:                                          ; preds = %bb136.i, %bb8.i.i, %bb5.i.i
  %n.0 = phi i32 [ %n.1, %bb136.i ], [ %k.1.i.i, %bb5.i.i ], [ 0, %bb8.i.i ] ; <i32> [#uses=2]
  %18 = phi i32 [ %n.1, %bb136.i ], [ %k.1.i.i, %bb5.i.i ], [ 0, %bb8.i.i ] ; <i32> [#uses=1]
  %19 = tail call fastcc i32 @Trial(i32 %18) nounwind ; <i32> [#uses=1]
  %20 = icmp eq i32 %19, 0                        ; <i1> [#uses=1]
  br i1 %20, label %bb138.i, label %bb139.i

bb138.i:                                          ; preds = %bb137.i
  %21 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Puzzle.exit

bb139.i:                                          ; preds = %bb137.i
  %22 = load i32* @kount, align 4                 ; <i32> [#uses=1]
  %23 = icmp eq i32 %22, 2005                     ; <i1> [#uses=1]
  br i1 %23, label %Puzzle.exit, label %bb140.i

bb140.i:                                          ; preds = %bb139.i
  %24 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Puzzle.exit

Puzzle.exit:                                      ; preds = %bb140.i, %bb139.i, %bb138.i
  %25 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %n.0) nounwind ; <i32> [#uses=0]
  %26 = load i32* @kount, align 4                 ; <i32> [#uses=1]
  %27 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %26) nounwind ; <i32> [#uses=0]
  %28 = add nsw i32 %i.01, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %28, 100                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Puzzle.exit
  ret i32 0
}
