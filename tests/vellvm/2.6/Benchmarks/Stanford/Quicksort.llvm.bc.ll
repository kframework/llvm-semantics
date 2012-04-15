; ModuleID = 'Quicksort.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@sortlist = internal global [5001 x i32] zeroinitializer, align 32 ; <[5001 x i32]*> [#uses=18]
@.str = private constant [17 x i8] c" Error in Quick.\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal fastcc void @Quicksort(i32 %l, i32 %r) nounwind {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb9.i, %entry
  %l.tr = phi i32 [ %l, %entry ], [ %i.1.i, %bb9.i ] ; <i32> [#uses=4]
  %0 = add nsw i32 %l.tr, %r                      ; <i32> [#uses=1]
  %1 = sdiv i32 %0, 2                             ; <i32> [#uses=1]
  %2 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %1 ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=4]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb6, %tailrecurse
  %j.1.ph = phi i32 [ %r, %tailrecurse ], [ %j.2, %bb6 ] ; <i32> [#uses=3]
  %i.0.ph = phi i32 [ %l.tr, %tailrecurse ], [ %i.1, %bb6 ] ; <i32> [#uses=3]
  %4 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %i.0.ph ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4                      ; <i32> [#uses=1]
  %6 = icmp slt i32 %5, %3                        ; <i1> [#uses=1]
  br i1 %6, label %bb.nph4, label %bb3.preheader

bb.nph4:                                          ; preds = %bb1.outer
  %tmp17 = add i32 %i.0.ph, 1                     ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb, %bb.nph4
  %indvar15 = phi i32 [ 0, %bb.nph4 ], [ %indvar.next16, %bb ] ; <i32> [#uses=2]
  %tmp18 = add i32 %indvar15, %tmp17              ; <i32> [#uses=2]
  %scevgep19 = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp18 ; <i32*> [#uses=1]
  %7 = load i32* %scevgep19, align 4              ; <i32> [#uses=1]
  %8 = icmp slt i32 %7, %3                        ; <i1> [#uses=1]
  %indvar.next16 = add i32 %indvar15, 1           ; <i32> [#uses=1]
  br i1 %8, label %bb, label %bb3.preheader

bb3.preheader:                                    ; preds = %bb, %bb1.outer
  %i.0.lcssa = phi i32 [ %i.0.ph, %bb1.outer ], [ %tmp18, %bb ] ; <i32> [#uses=4]
  %9 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %j.1.ph ; <i32*> [#uses=1]
  %10 = load i32* %9, align 4                     ; <i32> [#uses=1]
  %11 = icmp sgt i32 %10, %3                      ; <i1> [#uses=1]
  br i1 %11, label %bb.nph, label %bb4

bb.nph:                                           ; preds = %bb3.preheader
  %tmp12 = add i32 %j.1.ph, -1                    ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb2, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb2 ] ; <i32> [#uses=2]
  %tmp13 = sub i32 %tmp12, %indvar                ; <i32> [#uses=2]
  %scevgep = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp13 ; <i32*> [#uses=1]
  %12 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  %13 = icmp sgt i32 %12, %3                      ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %13, label %bb2, label %bb4

bb4:                                              ; preds = %bb2, %bb3.preheader
  %j.0.lcssa = phi i32 [ %j.1.ph, %bb3.preheader ], [ %tmp13, %bb2 ] ; <i32> [#uses=4]
  %14 = icmp sgt i32 %i.0.lcssa, %j.0.lcssa       ; <i1> [#uses=1]
  br i1 %14, label %bb6, label %bb5

bb5:                                              ; preds = %bb4
  %15 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %i.0.lcssa ; <i32*> [#uses=2]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %j.0.lcssa ; <i32*> [#uses=2]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  store i32 %18, i32* %15, align 4
  store i32 %16, i32* %17, align 4
  %19 = add nsw i32 %i.0.lcssa, 1                 ; <i32> [#uses=1]
  %20 = add i32 %j.0.lcssa, -1                    ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb5, %bb4
  %j.2 = phi i32 [ %20, %bb5 ], [ %j.0.lcssa, %bb4 ] ; <i32> [#uses=4]
  %i.1 = phi i32 [ %19, %bb5 ], [ %i.0.lcssa, %bb4 ] ; <i32> [#uses=7]
  %21 = icmp sgt i32 %i.1, %j.2                   ; <i1> [#uses=1]
  br i1 %21, label %bb7, label %bb1.outer

bb7:                                              ; preds = %bb6
  %22 = icmp sgt i32 %j.2, %l.tr                  ; <i1> [#uses=1]
  br i1 %22, label %bb8, label %bb9

bb8:                                              ; preds = %bb7
  tail call fastcc void @Quicksort(i32 %l.tr, i32 %j.2) nounwind
  br label %bb9

bb9:                                              ; preds = %bb8, %bb7
  %23 = icmp slt i32 %i.1, %r                     ; <i1> [#uses=1]
  br i1 %23, label %bb10, label %return

bb10:                                             ; preds = %bb9
  %24 = add nsw i32 %i.1, %r                      ; <i32> [#uses=1]
  %25 = sdiv i32 %24, 2                           ; <i32> [#uses=1]
  %26 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %25 ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=4]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb6.i, %bb10
  %j.1.i.ph = phi i32 [ %r, %bb10 ], [ %j.2.i, %bb6.i ] ; <i32> [#uses=3]
  %i.0.i.ph = phi i32 [ %i.1, %bb10 ], [ %i.1.i, %bb6.i ] ; <i32> [#uses=3]
  %28 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %i.0.i.ph ; <i32*> [#uses=1]
  %29 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %30 = icmp slt i32 %29, %27                     ; <i1> [#uses=1]
  br i1 %30, label %bb.nph10, label %bb3.i.preheader

bb.nph10:                                         ; preds = %bb1.i.outer
  %tmp30 = add i32 %i.0.i.ph, 1                   ; <i32> [#uses=1]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb.nph10
  %indvar28 = phi i32 [ 0, %bb.nph10 ], [ %indvar.next29, %bb.i ] ; <i32> [#uses=2]
  %tmp31 = add i32 %indvar28, %tmp30              ; <i32> [#uses=2]
  %scevgep32 = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp31 ; <i32*> [#uses=1]
  %31 = load i32* %scevgep32, align 4             ; <i32> [#uses=1]
  %32 = icmp slt i32 %31, %27                     ; <i1> [#uses=1]
  %indvar.next29 = add i32 %indvar28, 1           ; <i32> [#uses=1]
  br i1 %32, label %bb.i, label %bb3.i.preheader

bb3.i.preheader:                                  ; preds = %bb.i, %bb1.i.outer
  %i.0.i.lcssa = phi i32 [ %i.0.i.ph, %bb1.i.outer ], [ %tmp31, %bb.i ] ; <i32> [#uses=4]
  %33 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %j.1.i.ph ; <i32*> [#uses=1]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  %35 = icmp sgt i32 %34, %27                     ; <i1> [#uses=1]
  br i1 %35, label %bb.nph7, label %bb4.i

bb.nph7:                                          ; preds = %bb3.i.preheader
  %tmp24 = add i32 %j.1.i.ph, -1                  ; <i32> [#uses=1]
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %bb.nph7
  %indvar21 = phi i32 [ 0, %bb.nph7 ], [ %indvar.next22, %bb2.i ] ; <i32> [#uses=2]
  %tmp25 = sub i32 %tmp24, %indvar21              ; <i32> [#uses=2]
  %scevgep26 = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp25 ; <i32*> [#uses=1]
  %36 = load i32* %scevgep26, align 4             ; <i32> [#uses=1]
  %37 = icmp sgt i32 %36, %27                     ; <i1> [#uses=1]
  %indvar.next22 = add i32 %indvar21, 1           ; <i32> [#uses=1]
  br i1 %37, label %bb2.i, label %bb4.i

bb4.i:                                            ; preds = %bb2.i, %bb3.i.preheader
  %j.0.i.lcssa = phi i32 [ %j.1.i.ph, %bb3.i.preheader ], [ %tmp25, %bb2.i ] ; <i32> [#uses=4]
  %38 = icmp sgt i32 %i.0.i.lcssa, %j.0.i.lcssa   ; <i1> [#uses=1]
  br i1 %38, label %bb6.i, label %bb5.i

bb5.i:                                            ; preds = %bb4.i
  %39 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %i.0.i.lcssa ; <i32*> [#uses=2]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %j.0.i.lcssa ; <i32*> [#uses=2]
  %42 = load i32* %41, align 4                    ; <i32> [#uses=1]
  store i32 %42, i32* %39, align 4
  store i32 %40, i32* %41, align 4
  %43 = add nsw i32 %i.0.i.lcssa, 1               ; <i32> [#uses=1]
  %44 = add i32 %j.0.i.lcssa, -1                  ; <i32> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %bb5.i, %bb4.i
  %j.2.i = phi i32 [ %44, %bb5.i ], [ %j.0.i.lcssa, %bb4.i ] ; <i32> [#uses=4]
  %i.1.i = phi i32 [ %43, %bb5.i ], [ %i.0.i.lcssa, %bb4.i ] ; <i32> [#uses=4]
  %45 = icmp sgt i32 %i.1.i, %j.2.i               ; <i1> [#uses=1]
  br i1 %45, label %bb7.i, label %bb1.i.outer

bb7.i:                                            ; preds = %bb6.i
  %46 = icmp sgt i32 %j.2.i, %i.1                 ; <i1> [#uses=1]
  br i1 %46, label %bb8.i, label %bb9.i

bb8.i:                                            ; preds = %bb7.i
  tail call fastcc void @Quicksort(i32 %i.1, i32 %j.2.i) nounwind
  br label %bb9.i

bb9.i:                                            ; preds = %bb8.i, %bb7.i
  %47 = icmp slt i32 %i.1.i, %r                   ; <i1> [#uses=1]
  br i1 %47, label %tailrecurse, label %Quicksort.exit

Quicksort.exit:                                   ; preds = %bb9.i
  ret void

return:                                           ; preds = %bb9
  ret void
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Quick.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %13, %Quick.exit ] ; <i32> [#uses=1]
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
  %exitcond.i = icmp eq i32 %tmp.i, 5000          ; <i1> [#uses=1]
  br i1 %exitcond.i, label %Initarr.exit.i, label %bb.i.i

Initarr.exit.i:                                   ; preds = %bb4.i.i
  tail call fastcc void @Quicksort(i32 1, i32 5000) nounwind
  %8 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i32 1), align 4 ; <i32> [#uses=1]
  %9 = icmp eq i32 %8, %littlest.tmp.0.i.i        ; <i1> [#uses=1]
  br i1 %9, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %Initarr.exit.i
  %10 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i32 5000), align 32 ; <i32> [#uses=1]
  %11 = icmp eq i32 %10, %biggest.tmp.0.i.i       ; <i1> [#uses=1]
  br i1 %11, label %Quick.exit, label %bb1.i

bb1.i:                                            ; preds = %bb.i, %Initarr.exit.i
  %12 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Quick.exit

Quick.exit:                                       ; preds = %bb1.i, %bb.i
  %13 = add nsw i32 %0, 1                         ; <i32> [#uses=3]
  %14 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %13 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %15) nounwind ; <i32> [#uses=0]
  %exitcond = icmp eq i32 %13, 100                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Quick.exit
  ret i32 0
}
