; ModuleID = 'IntMM.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@ima = internal global [41 x [41 x i32]] zeroinitializer, align 32 ; <[41 x [41 x i32]]*> [#uses=2]
@imb = internal global [41 x [41 x i32]] zeroinitializer, align 32 ; <[41 x [41 x i32]]*> [#uses=2]
@imr = internal global [41 x [41 x i32]] zeroinitializer, align 32 ; <[41 x [41 x i32]]*> [#uses=2]
@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Intmm.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %16, %Intmm.exit ] ; <i32> [#uses=1]
  br label %bb2.preheader.i14.i

bb1.i9.i:                                         ; preds = %bb2.preheader.i14.i, %bb1.i9.i
  %seed.tmp.022.i = phi i32 [ %seed.tmp.025.i, %bb2.preheader.i14.i ], [ %3, %bb1.i9.i ] ; <i32> [#uses=1]
  %indvar.i5.i = phi i32 [ 0, %bb2.preheader.i14.i ], [ %tmp46.i, %bb1.i9.i ] ; <i32> [#uses=1]
  %tmp46.i = add i32 %indvar.i5.i, 1              ; <i32> [#uses=3]
  %scevgep.i7.i = getelementptr [41 x [41 x i32]]* @ima, i32 0, i32 %tmp45.i, i32 %tmp46.i ; <i32*> [#uses=1]
  %1 = mul i32 %seed.tmp.022.i, 1309              ; <i32> [#uses=1]
  %2 = add nsw i32 %1, 13849                      ; <i32> [#uses=1]
  %3 = and i32 %2, 65535                          ; <i32> [#uses=4]
  %4 = urem i32 %3, 120                           ; <i32> [#uses=1]
  %5 = add i32 %4, -60                            ; <i32> [#uses=1]
  store i32 %5, i32* %scevgep.i7.i, align 4
  %exitcond44.i = icmp eq i32 %tmp46.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond44.i, label %bb3.i11.i, label %bb1.i9.i

bb3.i11.i:                                        ; preds = %bb1.i9.i
  %exitcond48.i = icmp eq i32 %tmp45.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond48.i, label %bb2.preheader.i.i, label %bb2.preheader.i14.i

bb2.preheader.i14.i:                              ; preds = %bb3.i11.i, %bb
  %seed.tmp.025.i = phi i32 [ 74755, %bb ], [ %3, %bb3.i11.i ] ; <i32> [#uses=1]
  %indvar5.i12.i = phi i32 [ 0, %bb ], [ %tmp45.i, %bb3.i11.i ] ; <i32> [#uses=1]
  %tmp45.i = add i32 %indvar5.i12.i, 1            ; <i32> [#uses=3]
  br label %bb1.i9.i

bb1.i.i:                                          ; preds = %bb2.preheader.i.i, %bb1.i.i
  %seed.tmp.0.i = phi i32 [ %seed.tmp.021.i, %bb2.preheader.i.i ], [ %8, %bb1.i.i ] ; <i32> [#uses=1]
  %indvar.i1.i = phi i32 [ 0, %bb2.preheader.i.i ], [ %tmp39.i, %bb1.i.i ] ; <i32> [#uses=1]
  %tmp39.i = add i32 %indvar.i1.i, 1              ; <i32> [#uses=3]
  %scevgep.i2.i = getelementptr [41 x [41 x i32]]* @imb, i32 0, i32 %tmp38.i, i32 %tmp39.i ; <i32*> [#uses=1]
  %6 = mul i32 %seed.tmp.0.i, 1309                ; <i32> [#uses=1]
  %7 = add nsw i32 %6, 13849                      ; <i32> [#uses=1]
  %8 = and i32 %7, 65535                          ; <i32> [#uses=3]
  %9 = urem i32 %8, 120                           ; <i32> [#uses=1]
  %10 = add i32 %9, -60                           ; <i32> [#uses=1]
  store i32 %10, i32* %scevgep.i2.i, align 4
  %exitcond37.i = icmp eq i32 %tmp39.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond37.i, label %bb3.i.i, label %bb1.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %exitcond41.i = icmp eq i32 %tmp38.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond41.i, label %bb2.preheader.i, label %bb2.preheader.i.i

bb2.preheader.i.i:                                ; preds = %bb3.i.i, %bb3.i11.i
  %seed.tmp.021.i = phi i32 [ %8, %bb3.i.i ], [ %3, %bb3.i11.i ] ; <i32> [#uses=1]
  %indvar5.i.i = phi i32 [ %tmp38.i, %bb3.i.i ], [ 0, %bb3.i11.i ] ; <i32> [#uses=1]
  %tmp38.i = add i32 %indvar5.i.i, 1              ; <i32> [#uses=3]
  br label %bb1.i.i

bb1.i:                                            ; preds = %bb2.preheader.i, %Innerproduct.exit.i
  %indvar28.i = phi i32 [ 0, %bb2.preheader.i ], [ %tmp30.i, %Innerproduct.exit.i ] ; <i32> [#uses=1]
  %tmp30.i = add i32 %indvar28.i, 1               ; <i32> [#uses=4]
  %scevgep.i = getelementptr [41 x [41 x i32]]* @imr, i32 0, i32 %tmp.i, i32 %tmp30.i ; <i32*> [#uses=2]
  store i32 0, i32* %scevgep.i, align 4
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb1.i
  %11 = phi i32 [ 0, %bb1.i ], [ %15, %bb.i.i ]   ; <i32> [#uses=1]
  %indvar.i.i = phi i32 [ 0, %bb1.i ], [ %tmp27.i, %bb.i.i ] ; <i32> [#uses=1]
  %tmp27.i = add i32 %indvar.i.i, 1               ; <i32> [#uses=4]
  %scevgep.i.i = getelementptr [41 x [41 x i32]]* @ima, i32 0, i32 %tmp.i, i32 %tmp27.i ; <i32*> [#uses=1]
  %scevgep2.i.i = getelementptr [41 x [41 x i32]]* @imb, i32 0, i32 %tmp27.i, i32 %tmp30.i ; <i32*> [#uses=1]
  %12 = load i32* %scevgep.i.i, align 4           ; <i32> [#uses=1]
  %13 = load i32* %scevgep2.i.i, align 4          ; <i32> [#uses=1]
  %14 = mul i32 %13, %12                          ; <i32> [#uses=1]
  %15 = add nsw i32 %14, %11                      ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %tmp27.i, 40          ; <i1> [#uses=1]
  br i1 %exitcond.i, label %Innerproduct.exit.i, label %bb.i.i

Innerproduct.exit.i:                              ; preds = %bb.i.i
  store i32 %15, i32* %scevgep.i
  %exitcond31.i = icmp eq i32 %tmp30.i, 40        ; <i1> [#uses=1]
  br i1 %exitcond31.i, label %bb3.i, label %bb1.i

bb3.i:                                            ; preds = %Innerproduct.exit.i
  %exitcond34.i = icmp eq i32 %tmp.i, 40          ; <i1> [#uses=1]
  br i1 %exitcond34.i, label %Intmm.exit, label %bb2.preheader.i

bb2.preheader.i:                                  ; preds = %bb3.i, %bb3.i.i
  %indvar.i = phi i32 [ %tmp.i, %bb3.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=4]
  br label %bb1.i

Intmm.exit:                                       ; preds = %bb3.i
  %16 = add nsw i32 %0, 1                         ; <i32> [#uses=4]
  %17 = getelementptr inbounds [41 x [41 x i32]]* @imr, i32 0, i32 %16, i32 %16 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %18) nounwind ; <i32> [#uses=0]
  %exitcond = icmp eq i32 %16, 10                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Intmm.exit
  ret i32 0
}
