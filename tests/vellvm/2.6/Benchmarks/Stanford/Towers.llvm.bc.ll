; ModuleID = 'Towers.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@stack = internal global [4 x i32] zeroinitializer ; <[4 x i32]*> [#uses=5]
@.str = private constant [22 x i8] c" Error in Towers: %s\0A\00", align 1 ; <[22 x i8]*> [#uses=1]
@cellspace = internal global [19 x %struct.element] zeroinitializer, align 32 ; <[19 x %struct.element]*> [#uses=28]
@freelist = internal global i32 0                 ; <i32*> [#uses=7]
@.str1 = private constant [16 x i8] c"nothing to pop \00", align 1 ; <[16 x i8]*> [#uses=1]
@.str2 = private constant [16 x i8] c"out of space   \00", align 1 ; <[16 x i8]*> [#uses=1]
@.str3 = private constant [16 x i8] c"disc size error\00", align 1 ; <[16 x i8]*> [#uses=1]
@movesdone = internal global i32 0                ; <i32*> [#uses=5]
@.str4 = private constant [18 x i8] c" Error in Towers.\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str5 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @printf(i8* nocapture, ...) nounwind

define internal fastcc void @Move(i32 %s1, i32 %s2) nounwind {
entry:
  %0 = getelementptr inbounds [4 x i32]* @stack, i32 0, i32 %s1 ; <i32*> [#uses=2]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=4]
  %2 = icmp sgt i32 %1, 0                         ; <i1> [#uses=1]
  br i1 %2, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %entry
  %3 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %1, i32 0 ; <i32*> [#uses=1]
  %4 = load i32* %3, align 8                      ; <i32> [#uses=1]
  %5 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %1, i32 1 ; <i32*> [#uses=2]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = load i32* @freelist, align 4               ; <i32> [#uses=1]
  store i32 %7, i32* %5, align 4
  store i32 %1, i32* @freelist, align 4
  store i32 %6, i32* %0, align 4
  br label %Pop.exit

bb1.i:                                            ; preds = %entry
  %8 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Pop.exit

Pop.exit:                                         ; preds = %bb1.i, %bb.i
  %9 = phi i32 [ 0, %bb1.i ], [ %4, %bb.i ]       ; <i32> [#uses=2]
  %10 = getelementptr inbounds [4 x i32]* @stack, i32 0, i32 %s2 ; <i32*> [#uses=3]
  %11 = load i32* %10, align 4                    ; <i32> [#uses=3]
  %12 = icmp sgt i32 %11, 0                       ; <i1> [#uses=1]
  br i1 %12, label %bb.i1, label %bb3.i

bb.i1:                                            ; preds = %Pop.exit
  %13 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %11, i32 0 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 8                    ; <i32> [#uses=1]
  %15 = icmp sgt i32 %14, %9                      ; <i1> [#uses=1]
  br i1 %15, label %bb3.i, label %bb1.i2

bb1.i2:                                           ; preds = %bb.i1
  %16 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Push.exit

bb3.i:                                            ; preds = %bb.i1, %Pop.exit
  %17 = load i32* @freelist, align 4              ; <i32> [#uses=3]
  %18 = icmp sgt i32 %17, 0                       ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %bb3.i
  %19 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %17, i32 1 ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  store i32 %20, i32* @freelist, align 4
  br label %Getelement.exit.i

bb1.i.i:                                          ; preds = %bb3.i
  %21 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %.pre.i = load i32* %10, align 4                ; <i32> [#uses=1]
  br label %Getelement.exit.i

Getelement.exit.i:                                ; preds = %bb1.i.i, %bb.i.i
  %22 = phi i32 [ %11, %bb.i.i ], [ %.pre.i, %bb1.i.i ] ; <i32> [#uses=1]
  %23 = phi i32 [ 0, %bb1.i.i ], [ %17, %bb.i.i ] ; <i32> [#uses=3]
  %24 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %23, i32 1 ; <i32*> [#uses=1]
  store i32 %22, i32* %24, align 4
  store i32 %23, i32* %10, align 4
  %25 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %23, i32 0 ; <i32*> [#uses=1]
  store i32 %9, i32* %25, align 8
  br label %Push.exit

Push.exit:                                        ; preds = %Getelement.exit.i, %bb1.i2
  %26 = load i32* @movesdone, align 4             ; <i32> [#uses=1]
  %27 = add nsw i32 %26, 1                        ; <i32> [#uses=1]
  store i32 %27, i32* @movesdone, align 4
  ret void
}

define internal fastcc void @tower(i32 %i, i32 %j, i32 %k) nounwind {
entry:
  %tmp4 = add i32 %k, -2                          ; <i32> [#uses=1]
  %tmp6 = add i32 %k, -1                          ; <i32> [#uses=1]
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb1.i, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb1.i ] ; <i32> [#uses=2]
  %i.tr = phi i32 [ %i, %entry ], [ %5, %bb1.i ]  ; <i32> [#uses=4]
  %tmp = mul i32 %indvar, -2                      ; <i32> [#uses=3]
  %tmp5 = add i32 %tmp, %tmp4                     ; <i32> [#uses=1]
  %k.tr = add i32 %tmp, %k                        ; <i32> [#uses=2]
  %0 = icmp eq i32 %k.tr, 1                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %tailrecurse
  tail call fastcc void @Move(i32 %i.tr, i32 %j) nounwind
  ret void

bb1:                                              ; preds = %tailrecurse
  %tmp7 = add i32 %tmp, %tmp6                     ; <i32> [#uses=1]
  %1 = sub i32 6, %i.tr                           ; <i32> [#uses=1]
  %2 = sub i32 %1, %j                             ; <i32> [#uses=5]
  tail call fastcc void @tower(i32 %i.tr, i32 %2, i32 %tmp7) nounwind
  tail call fastcc void @Move(i32 %i.tr, i32 %j) nounwind
  %3 = icmp eq i32 %k.tr, 2                       ; <i1> [#uses=1]
  br i1 %3, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %bb1
  tail call fastcc void @Move(i32 %2, i32 %j) nounwind
  ret void

bb1.i:                                            ; preds = %bb1
  %4 = sub i32 6, %2                              ; <i32> [#uses=1]
  %5 = sub i32 %4, %j                             ; <i32> [#uses=2]
  tail call fastcc void @tower(i32 %2, i32 %5, i32 %tmp5) nounwind
  tail call fastcc void @Move(i32 %2, i32 %j) nounwind
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %tailrecurse
}

declare i32 @puts(i8* nocapture) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Towers.exit, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %23, %Towers.exit ] ; <i32> [#uses=1]
  store i32 0, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 1, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 2, i32 1), align 4
  store i32 2, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 3, i32 1), align 4
  store i32 3, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 4, i32 1), align 4
  store i32 4, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 5, i32 1), align 4
  store i32 5, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 6, i32 1), align 4
  store i32 6, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 7, i32 1), align 4
  store i32 7, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 8, i32 1), align 4
  store i32 8, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 9, i32 1), align 4
  store i32 9, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 10, i32 1), align 4
  store i32 10, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 11, i32 1), align 4
  store i32 11, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 12, i32 1), align 4
  store i32 12, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 13, i32 1), align 4
  store i32 13, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 14, i32 1), align 4
  store i32 14, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 15, i32 1), align 4
  store i32 15, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 16, i32 1), align 4
  store i32 16, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 17, i32 1), align 4
  store i32 17, i32* getelementptr inbounds ([19 x %struct.element]* @cellspace, i32 0, i32 18, i32 1), align 4
  store i32 18, i32* @freelist, align 4
  store i32 0, i32* getelementptr inbounds ([4 x i32]* @stack, i32 0, i32 1), align 4
  br label %bb.i.i

bb.ithread-split.i:                               ; preds = %Push.exit.i.i
  %.pr.i = load i32* getelementptr inbounds ([4 x i32]* @stack, i32 0, i32 1) ; <i32> [#uses=1]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.ithread-split.i, %bb
  %0 = phi i32 [ %.pr.i, %bb.ithread-split.i ], [ 0, %bb ] ; <i32> [#uses=3]
  %indvar.i.i = phi i32 [ 0, %bb ], [ %15, %bb.ithread-split.i ] ; <i32> [#uses=3]
  %discctr.01.i.i = sub i32 14, %indvar.i.i       ; <i32> [#uses=2]
  %1 = icmp sgt i32 %0, 0                         ; <i1> [#uses=1]
  br i1 %1, label %bb.i.i.i, label %bb3.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  %2 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %0, i32 0 ; <i32*> [#uses=1]
  %3 = load i32* %2, align 8                      ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, %discctr.01.i.i           ; <i1> [#uses=1]
  br i1 %4, label %bb3.i.i.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i
  %5 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Push.exit.i.i

bb3.i.i.i:                                        ; preds = %bb.i.i.i, %bb.i.i
  %6 = load i32* @freelist, align 4               ; <i32> [#uses=3]
  %7 = icmp sgt i32 %6, 0                         ; <i1> [#uses=1]
  br i1 %7, label %bb.i.i.i.i, label %bb1.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb3.i.i.i
  %8 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %6, i32 1 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  store i32 %9, i32* @freelist, align 4
  br label %Getelement.exit.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb3.i.i.i
  %10 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %.pre.i.i.i = load i32* getelementptr inbounds ([4 x i32]* @stack, i32 0, i32 1), align 4 ; <i32> [#uses=1]
  br label %Getelement.exit.i.i.i

Getelement.exit.i.i.i:                            ; preds = %bb1.i.i.i.i, %bb.i.i.i.i
  %11 = phi i32 [ %0, %bb.i.i.i.i ], [ %.pre.i.i.i, %bb1.i.i.i.i ] ; <i32> [#uses=1]
  %12 = phi i32 [ 0, %bb1.i.i.i.i ], [ %6, %bb.i.i.i.i ] ; <i32> [#uses=3]
  %13 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %12, i32 1 ; <i32*> [#uses=1]
  store i32 %11, i32* %13, align 4
  store i32 %12, i32* getelementptr inbounds ([4 x i32]* @stack, i32 0, i32 1), align 4
  %14 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i32 %12, i32 0 ; <i32*> [#uses=1]
  store i32 %discctr.01.i.i, i32* %14, align 8
  br label %Push.exit.i.i

Push.exit.i.i:                                    ; preds = %Getelement.exit.i.i.i, %bb1.i.i.i
  %15 = add i32 %indvar.i.i, 1                    ; <i32> [#uses=1]
  %exitcond.i.i = icmp eq i32 %indvar.i.i, 13     ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %Init.exit.i, label %bb.ithread-split.i

Init.exit.i:                                      ; preds = %Push.exit.i.i
  store i32 0, i32* getelementptr inbounds ([4 x i32]* @stack, i32 0, i32 2), align 4
  store i32 0, i32* getelementptr inbounds ([4 x i32]* @stack, i32 0, i32 3), align 4
  store i32 0, i32* @movesdone, align 4
  br label %tailrecurse.i.i

tailrecurse.i.i:                                  ; preds = %bb1.i.i5.i, %Init.exit.i
  %indvar.i1.i = phi i32 [ 0, %Init.exit.i ], [ %indvar.next.i4.i, %bb1.i.i5.i ] ; <i32> [#uses=2]
  %tmp.i = mul i32 %indvar.i1.i, -2               ; <i32> [#uses=3]
  %k.tr.i.i = add i32 %tmp.i, 14                  ; <i32> [#uses=2]
  %tmp5.i.i = add i32 %tmp.i, 12                  ; <i32> [#uses=1]
  %16 = icmp eq i32 %k.tr.i.i, 1                  ; <i1> [#uses=1]
  br i1 %16, label %bb.i2.i, label %bb1.i.i

bb.i2.i:                                          ; preds = %tailrecurse.i.i
  tail call fastcc void @Move(i32 1, i32 2) nounwind
  br label %tower.exit.i

bb1.i.i:                                          ; preds = %tailrecurse.i.i
  %tmp7.i.i = add i32 %tmp.i, 13                  ; <i32> [#uses=1]
  tail call fastcc void @tower(i32 1, i32 3, i32 %tmp7.i.i) nounwind
  tail call fastcc void @Move(i32 1, i32 2) nounwind
  %17 = icmp eq i32 %k.tr.i.i, 2                  ; <i1> [#uses=1]
  br i1 %17, label %bb.i.i3.i, label %bb1.i.i5.i

bb.i.i3.i:                                        ; preds = %bb1.i.i
  tail call fastcc void @Move(i32 3, i32 2) nounwind
  br label %tower.exit.i

bb1.i.i5.i:                                       ; preds = %bb1.i.i
  tail call fastcc void @tower(i32 3, i32 1, i32 %tmp5.i.i) nounwind
  tail call fastcc void @Move(i32 3, i32 2) nounwind
  %indvar.next.i4.i = add i32 %indvar.i1.i, 1     ; <i32> [#uses=1]
  br label %tailrecurse.i.i

tower.exit.i:                                     ; preds = %bb.i.i3.i, %bb.i2.i
  %18 = load i32* @movesdone, align 4             ; <i32> [#uses=2]
  %19 = icmp eq i32 %18, 16383                    ; <i1> [#uses=1]
  br i1 %19, label %Towers.exit, label %bb3.i

bb3.i:                                            ; preds = %tower.exit.i
  %20 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %.pre.i = load i32* @movesdone, align 4         ; <i32> [#uses=1]
  br label %Towers.exit

Towers.exit:                                      ; preds = %bb3.i, %tower.exit.i
  %21 = phi i32 [ %.pre.i, %bb3.i ], [ %18, %tower.exit.i ] ; <i32> [#uses=1]
  %22 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %21) nounwind ; <i32> [#uses=0]
  %23 = add nsw i32 %i.01, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %23, 100                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Towers.exit
  ret i32 0
}
