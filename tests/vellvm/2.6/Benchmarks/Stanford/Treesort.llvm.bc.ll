; ModuleID = 'Treesort.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@sortlist = internal global [5001 x i32] zeroinitializer, align 32 ; <[5001 x i32]*> [#uses=4]
@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str1 = private constant [16 x i8] c" Error in Tree.\00", align 1 ; <[16 x i8]*> [#uses=1]

define internal fastcc i32 @Checktree(%struct.node* nocapture %p) nounwind readonly {
entry:
  %0 = getelementptr inbounds %struct.node* %p, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  %1 = load %struct.node** %0, align 4            ; <%struct.node*> [#uses=3]
  %2 = icmp eq %struct.node* %1, null             ; <i1> [#uses=1]
  br i1 %2, label %bb7, label %bb

bb:                                               ; preds = %entry
  %3 = getelementptr inbounds %struct.node* %1, i32 0, i32 2 ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = getelementptr inbounds %struct.node* %p, i32 0, i32 2 ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = icmp sgt i32 %4, %6                        ; <i1> [#uses=1]
  br i1 %7, label %bb2, label %bb7

bb2:                                              ; preds = %bb
  %8 = tail call fastcc i32 @Checktree(%struct.node* %1) nounwind ; <i32> [#uses=1]
  %not. = icmp ne i32 %8, 0                       ; <i1> [#uses=1]
  %iftmp.25.0 = zext i1 %not. to i32              ; <i32> [#uses=1]
  br label %bb7

bb7:                                              ; preds = %bb2, %bb, %entry
  %result.0 = phi i32 [ %iftmp.25.0, %bb2 ], [ 1, %entry ], [ 0, %bb ] ; <i32> [#uses=2]
  %9 = getelementptr inbounds %struct.node* %p, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  %10 = load %struct.node** %9, align 4           ; <%struct.node*> [#uses=4]
  %11 = icmp eq %struct.node* %10, null           ; <i1> [#uses=1]
  br i1 %11, label %bb15, label %bb8

bb8:                                              ; preds = %bb7
  %12 = getelementptr inbounds %struct.node* %10, i32 0, i32 2 ; <i32*> [#uses=1]
  %13 = load i32* %12, align 4                    ; <i32> [#uses=3]
  %14 = getelementptr inbounds %struct.node* %p, i32 0, i32 2 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = icmp slt i32 %13, %15                     ; <i1> [#uses=1]
  br i1 %16, label %bb10, label %bb15

bb10:                                             ; preds = %bb8
  %17 = getelementptr inbounds %struct.node* %10, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  %18 = load %struct.node** %17, align 4          ; <%struct.node*> [#uses=3]
  %19 = icmp eq %struct.node* %18, null           ; <i1> [#uses=1]
  br i1 %19, label %bb7.i, label %bb.i

bb.i:                                             ; preds = %bb10
  %20 = getelementptr inbounds %struct.node* %18, i32 0, i32 2 ; <i32*> [#uses=1]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=1]
  %22 = icmp sgt i32 %21, %13                     ; <i1> [#uses=1]
  br i1 %22, label %bb2.i, label %bb7.i

bb2.i:                                            ; preds = %bb.i
  %23 = tail call fastcc i32 @Checktree(%struct.node* %18) nounwind ; <i32> [#uses=1]
  %not.1 = icmp ne i32 %23, 0                     ; <i1> [#uses=1]
  %iftmp.25.0.i = zext i1 %not.1 to i32           ; <i32> [#uses=1]
  br label %bb7.i

bb7.i:                                            ; preds = %bb2.i, %bb.i, %bb10
  %result.0.i = phi i32 [ %iftmp.25.0.i, %bb2.i ], [ 1, %bb10 ], [ 0, %bb.i ] ; <i32> [#uses=2]
  %24 = getelementptr inbounds %struct.node* %10, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  %25 = load %struct.node** %24, align 4          ; <%struct.node*> [#uses=3]
  %26 = icmp eq %struct.node* %25, null           ; <i1> [#uses=1]
  br i1 %26, label %Checktree.exit, label %bb8.i

bb8.i:                                            ; preds = %bb7.i
  %27 = getelementptr inbounds %struct.node* %25, i32 0, i32 2 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=1]
  %29 = icmp slt i32 %28, %13                     ; <i1> [#uses=1]
  br i1 %29, label %bb10.i, label %Checktree.exit

bb10.i:                                           ; preds = %bb8.i
  %30 = tail call fastcc i32 @Checktree(%struct.node* %25) nounwind ; <i32> [#uses=1]
  %31 = icmp eq i32 %30, 0                        ; <i1> [#uses=1]
  %32 = zext i1 %31 to i32                        ; <i32> [#uses=1]
  %tmp = xor i32 %result.0.i, 1                   ; <i32> [#uses=1]
  %or.cond.i2 = or i32 %32, %tmp                  ; <i32> [#uses=1]
  %iftmp.26.0.i = xor i32 %or.cond.i2, 1          ; <i32> [#uses=1]
  br label %Checktree.exit

Checktree.exit:                                   ; preds = %bb10.i, %bb8.i, %bb7.i
  %33 = phi i32 [ %iftmp.26.0.i, %bb10.i ], [ %result.0.i, %bb7.i ], [ 0, %bb8.i ] ; <i32> [#uses=1]
  %34 = icmp eq i32 %33, 0                        ; <i1> [#uses=1]
  %35 = zext i1 %34 to i32                        ; <i32> [#uses=1]
  %tmp4 = xor i32 %result.0, 1                    ; <i32> [#uses=1]
  %or.cond3 = or i32 %35, %tmp4                   ; <i32> [#uses=1]
  %iftmp.26.0 = xor i32 %or.cond3, 1              ; <i32> [#uses=1]
  ret i32 %iftmp.26.0

bb15:                                             ; preds = %bb8, %bb7
  %result.1 = phi i32 [ %result.0, %bb7 ], [ 0, %bb8 ] ; <i32> [#uses=1]
  ret i32 %result.1
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Trees.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %57, %Trees.exit ] ; <i32> [#uses=2]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb4.i.i, %bb
  %indvar.i.i = phi i32 [ 0, %bb ], [ %tmp3.i, %bb4.i.i ] ; <i32> [#uses=1]
  %littlest.tmp.1.i.i = phi i32 [ 0, %bb ], [ %littlest.tmp.0.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %biggest.tmp.1.i.i = phi i32 [ 0, %bb ], [ %biggest.tmp.0.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %seed.tmp.0.i.i = phi i32 [ 74755, %bb ], [ %3, %bb4.i.i ] ; <i32> [#uses=1]
  %tmp3.i = add i32 %indvar.i.i, 1                ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp3.i ; <i32*> [#uses=1]
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
  %littlest.tmp.0.i.i = phi i32 [ %5, %bb3.i.i ], [ %littlest.tmp.1.i.i, %bb.i.i ], [ %littlest.tmp.1.i.i, %bb2.i.i ] ; <i32> [#uses=1]
  %biggest.tmp.0.i.i = phi i32 [ %biggest.tmp.1.i.i, %bb3.i.i ], [ %5, %bb.i.i ], [ %biggest.tmp.1.i.i, %bb2.i.i ] ; <i32> [#uses=1]
  %exitcond2.i = icmp eq i32 %tmp3.i, 5000        ; <i1> [#uses=1]
  br i1 %exitcond2.i, label %tInitarr.exit.i, label %bb.i.i

tInitarr.exit.i:                                  ; preds = %bb4.i.i
  %8 = malloc %struct.node                        ; <%struct.node*> [#uses=5]
  %9 = getelementptr inbounds %struct.node* %8, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %9, align 4
  %10 = getelementptr inbounds %struct.node* %8, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %10, align 4
  %11 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i32 1), align 4 ; <i32> [#uses=1]
  %12 = getelementptr inbounds %struct.node* %8, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %11, i32* %12, align 4
  br label %bb.i

bb.i:                                             ; preds = %Insert.exit.i, %tInitarr.exit.i
  %indvar.i = phi i32 [ 0, %tInitarr.exit.i ], [ %indvar.next.i, %Insert.exit.i ] ; <i32> [#uses=2]
  %tmp.i = add i32 %indvar.i, 2                   ; <i32> [#uses=1]
  %scevgep.i = getelementptr [5001 x i32]* @sortlist, i32 0, i32 %tmp.i ; <i32*> [#uses=1]
  %13 = load i32* %scevgep.i, align 4             ; <i32> [#uses=8]
  br label %tailrecurse.i.i

tailrecurse.i.i:                                  ; preds = %bb4.i4.i, %bb4.i.i.i, %bb.i.i.i, %bb.i
  %t.tr.i.i = phi %struct.node* [ %8, %bb.i ], [ %28, %bb.i.i.i ], [ %36, %bb4.i.i.i ], [ %44, %bb4.i4.i ] ; <%struct.node*> [#uses=3]
  %14 = getelementptr inbounds %struct.node* %t.tr.i.i, i32 0, i32 2 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=2]
  %16 = icmp slt i32 %15, %13                     ; <i1> [#uses=1]
  br i1 %16, label %bb.i1.i, label %bb3.i3.i

bb.i1.i:                                          ; preds = %tailrecurse.i.i
  %17 = getelementptr inbounds %struct.node* %t.tr.i.i, i32 0, i32 0 ; <%struct.node**> [#uses=2]
  %18 = load %struct.node** %17, align 4          ; <%struct.node*> [#uses=4]
  %19 = icmp eq %struct.node* %18, null           ; <i1> [#uses=1]
  br i1 %19, label %bb1.i.i, label %bb2.i2.i

bb1.i.i:                                          ; preds = %bb.i1.i
  %20 = malloc %struct.node                       ; <%struct.node*> [#uses=4]
  store %struct.node* %20, %struct.node** %17, align 4
  %21 = getelementptr inbounds %struct.node* %20, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %21, align 4
  %22 = getelementptr inbounds %struct.node* %20, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %22, align 4
  %23 = getelementptr inbounds %struct.node* %20, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %13, i32* %23, align 4
  br label %Insert.exit.i

bb2.i2.i:                                         ; preds = %bb.i1.i
  %24 = getelementptr inbounds %struct.node* %18, i32 0, i32 2 ; <i32*> [#uses=1]
  %25 = load i32* %24, align 4                    ; <i32> [#uses=2]
  %26 = icmp slt i32 %25, %13                     ; <i1> [#uses=1]
  br i1 %26, label %bb.i.i.i, label %bb3.i.i.i

bb.i.i.i:                                         ; preds = %bb2.i2.i
  %27 = getelementptr inbounds %struct.node* %18, i32 0, i32 0 ; <%struct.node**> [#uses=2]
  %28 = load %struct.node** %27, align 4          ; <%struct.node*> [#uses=2]
  %29 = icmp eq %struct.node* %28, null           ; <i1> [#uses=1]
  br i1 %29, label %bb1.i.i.i, label %tailrecurse.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i
  %30 = malloc %struct.node                       ; <%struct.node*> [#uses=4]
  store %struct.node* %30, %struct.node** %27, align 4
  %31 = getelementptr inbounds %struct.node* %30, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %31, align 4
  %32 = getelementptr inbounds %struct.node* %30, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %32, align 4
  %33 = getelementptr inbounds %struct.node* %30, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %13, i32* %33, align 4
  br label %Insert.exit.i

bb3.i.i.i:                                        ; preds = %bb2.i2.i
  %34 = icmp sgt i32 %25, %13                     ; <i1> [#uses=1]
  br i1 %34, label %bb4.i.i.i, label %Insert.exit.i

bb4.i.i.i:                                        ; preds = %bb3.i.i.i
  %35 = getelementptr inbounds %struct.node* %18, i32 0, i32 1 ; <%struct.node**> [#uses=2]
  %36 = load %struct.node** %35, align 4          ; <%struct.node*> [#uses=2]
  %37 = icmp eq %struct.node* %36, null           ; <i1> [#uses=1]
  br i1 %37, label %bb5.i.i.i, label %tailrecurse.i.i

bb5.i.i.i:                                        ; preds = %bb4.i.i.i
  %38 = malloc %struct.node                       ; <%struct.node*> [#uses=4]
  store %struct.node* %38, %struct.node** %35, align 4
  %39 = getelementptr inbounds %struct.node* %38, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %39, align 4
  %40 = getelementptr inbounds %struct.node* %38, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %40, align 4
  %41 = getelementptr inbounds %struct.node* %38, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %13, i32* %41, align 4
  br label %Insert.exit.i

bb3.i3.i:                                         ; preds = %tailrecurse.i.i
  %42 = icmp sgt i32 %15, %13                     ; <i1> [#uses=1]
  br i1 %42, label %bb4.i4.i, label %Insert.exit.i

bb4.i4.i:                                         ; preds = %bb3.i3.i
  %43 = getelementptr inbounds %struct.node* %t.tr.i.i, i32 0, i32 1 ; <%struct.node**> [#uses=2]
  %44 = load %struct.node** %43, align 4          ; <%struct.node*> [#uses=2]
  %45 = icmp eq %struct.node* %44, null           ; <i1> [#uses=1]
  br i1 %45, label %bb5.i.i, label %tailrecurse.i.i

bb5.i.i:                                          ; preds = %bb4.i4.i
  %46 = malloc %struct.node                       ; <%struct.node*> [#uses=4]
  store %struct.node* %46, %struct.node** %43, align 4
  %47 = getelementptr inbounds %struct.node* %46, i32 0, i32 0 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %47, align 4
  %48 = getelementptr inbounds %struct.node* %46, i32 0, i32 1 ; <%struct.node**> [#uses=1]
  store %struct.node* null, %struct.node** %48, align 4
  %49 = getelementptr inbounds %struct.node* %46, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %13, i32* %49, align 4
  br label %Insert.exit.i

Insert.exit.i:                                    ; preds = %bb5.i.i, %bb3.i3.i, %bb5.i.i.i, %bb3.i.i.i, %bb1.i.i.i, %bb1.i.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i, 4999  ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb2.i, label %bb.i

bb2.i:                                            ; preds = %Insert.exit.i
  %50 = add nsw i32 %0, 2                         ; <i32> [#uses=1]
  %51 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i32 %50 ; <i32*> [#uses=1]
  %52 = load i32* %51, align 4                    ; <i32> [#uses=1]
  %53 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %52) nounwind ; <i32> [#uses=0]
  %54 = tail call fastcc i32 @Checktree(%struct.node* %8) nounwind ; <i32> [#uses=1]
  %55 = icmp eq i32 %54, 0                        ; <i1> [#uses=1]
  br i1 %55, label %bb3.i, label %Trees.exit

bb3.i:                                            ; preds = %bb2.i
  %56 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Trees.exit

Trees.exit:                                       ; preds = %bb3.i, %bb2.i
  %57 = add nsw i32 %0, 1                         ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %57, 100                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Trees.exit
  ret i32 0
}
