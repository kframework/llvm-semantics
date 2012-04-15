; ModuleID = 'Perm.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@permarray = internal global [11 x i32] zeroinitializer, align 32 ; <[11 x i32]*> [#uses=21]
@pctr = internal global i32 0                     ; <i32*> [#uses=14]
@.str = private constant [16 x i8] c" Error in Perm.\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal fastcc void @Permute(i32 %n) nounwind {
entry:
  %0 = load i32* @pctr, align 4                   ; <i32> [#uses=2]
  %1 = add i32 %0, 1                              ; <i32> [#uses=1]
  store i32 %1, i32* @pctr, align 4
  %2 = icmp eq i32 %n, 1                          ; <i1> [#uses=1]
  br i1 %2, label %return, label %bb

bb:                                               ; preds = %entry
  %3 = add i32 %n, -1                             ; <i32> [#uses=6]
  %4 = add i32 %0, 2                              ; <i32> [#uses=1]
  store i32 %4, i32* @pctr, align 4
  %5 = icmp eq i32 %3, 1                          ; <i1> [#uses=1]
  br i1 %5, label %bb2.preheader, label %bb.i

bb.i:                                             ; preds = %bb
  %6 = add i32 %n, -2                             ; <i32> [#uses=5]
  tail call fastcc void @Permute(i32 %6) nounwind
  %7 = icmp sgt i32 %6, 0                         ; <i1> [#uses=1]
  br i1 %7, label %bb.nph, label %bb2.preheader

bb.nph:                                           ; preds = %bb.i
  %8 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i32 %3 ; <i32*> [#uses=4]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb1.i ] ; <i32> [#uses=2]
  %tmp8 = sub i32 %6, %indvar                     ; <i32> [#uses=1]
  %scevgep = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp8 ; <i32*> [#uses=4]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  %10 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  store i32 %10, i32* %8, align 4
  store i32 %9, i32* %scevgep, align 4
  tail call fastcc void @Permute(i32 %6) nounwind
  %11 = load i32* %8, align 4                     ; <i32> [#uses=1]
  %12 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  store i32 %12, i32* %8, align 4
  store i32 %11, i32* %scevgep, align 4
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %6        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2.preheader, label %bb1.i

bb2.preheader:                                    ; preds = %bb1.i, %bb.i, %bb
  %13 = icmp sgt i32 %3, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb.nph7, label %return

bb.nph7:                                          ; preds = %bb2.preheader
  %14 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i32 %n ; <i32*> [#uses=4]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb.nph7
  %indvar9 = phi i32 [ 0, %bb.nph7 ], [ %indvar.next10, %bb1 ] ; <i32> [#uses=2]
  %tmp13 = sub i32 %3, %indvar9                   ; <i32> [#uses=1]
  %scevgep14 = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp13 ; <i32*> [#uses=4]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = load i32* %scevgep14, align 4             ; <i32> [#uses=1]
  store i32 %16, i32* %14, align 4
  store i32 %15, i32* %scevgep14, align 4
  tail call fastcc void @Permute(i32 %3) nounwind
  %17 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %18 = load i32* %scevgep14, align 4             ; <i32> [#uses=1]
  store i32 %18, i32* %14, align 4
  store i32 %17, i32* %scevgep14, align 4
  %indvar.next10 = add i32 %indvar9, 1            ; <i32> [#uses=2]
  %exitcond11 = icmp eq i32 %indvar.next10, %3    ; <i1> [#uses=1]
  br i1 %exitcond11, label %return, label %bb1

return:                                           ; preds = %bb1, %bb2.preheader, %entry
  ret void
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %Perm.exit, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %51, %Perm.exit ] ; <i32> [#uses=1]
  store i32 0, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 2), align 8
  store i32 2, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 3), align 4
  store i32 3, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 4), align 16
  store i32 4, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 5), align 4
  store i32 5, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 6, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 2, i32* @pctr, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb1.i.i.i, %bb
  %indvar.i.i = phi i32 [ 0, %bb ], [ %indvar.next.i.i, %bb1.i.i.i ] ; <i32> [#uses=2]
  %tmp8.i.i = sub i32 5, %indvar.i.i              ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp8.i.i ; <i32*> [#uses=4]
  %0 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %1 = load i32* %scevgep.i.i, align 4            ; <i32> [#uses=1]
  store i32 %1, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %0, i32* %scevgep.i.i, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  %2 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %3 = load i32* %scevgep.i.i, align 4            ; <i32> [#uses=1]
  store i32 %3, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %2, i32* %scevgep.i.i, align 4
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=2]
  %exitcond.i.i = icmp eq i32 %indvar.next.i.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %bb1.i.i, label %bb1.i.i.i

bb1.i.i:                                          ; preds = %bb1.i.i, %bb1.i.i.i
  %indvar9.i.i = phi i32 [ %indvar.next10.i.i, %bb1.i.i ], [ 0, %bb1.i.i.i ] ; <i32> [#uses=2]
  %tmp13.i.i = sub i32 6, %indvar9.i.i            ; <i32> [#uses=1]
  %scevgep14.i.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp13.i.i ; <i32*> [#uses=4]
  %4 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %5 = load i32* %scevgep14.i.i, align 4          ; <i32> [#uses=1]
  store i32 %5, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %4, i32* %scevgep14.i.i, align 4
  tail call fastcc void @Permute(i32 6) nounwind
  %6 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %7 = load i32* %scevgep14.i.i, align 4          ; <i32> [#uses=1]
  store i32 %7, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %6, i32* %scevgep14.i.i, align 4
  %indvar.next10.i.i = add i32 %indvar9.i.i, 1    ; <i32> [#uses=2]
  %exitcond11.i.i = icmp eq i32 %indvar.next10.i.i, 6 ; <i1> [#uses=1]
  br i1 %exitcond11.i.i, label %Permute.exit.i, label %bb1.i.i

Permute.exit.i:                                   ; preds = %bb1.i.i
  store i32 0, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 2), align 8
  store i32 2, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 3), align 4
  store i32 3, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 4), align 16
  store i32 4, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 5), align 4
  store i32 5, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 6, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  %8 = load i32* @pctr, align 4                   ; <i32> [#uses=1]
  %9 = add i32 %8, 2                              ; <i32> [#uses=1]
  store i32 %9, i32* @pctr, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  br label %bb1.i.i48.i

bb1.i.i48.i:                                      ; preds = %bb1.i.i48.i, %Permute.exit.i
  %indvar.i43.i = phi i32 [ 0, %Permute.exit.i ], [ %indvar.next.i46.i, %bb1.i.i48.i ] ; <i32> [#uses=2]
  %tmp8.i44.i = sub i32 5, %indvar.i43.i          ; <i32> [#uses=1]
  %scevgep.i45.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp8.i44.i ; <i32*> [#uses=4]
  %10 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %11 = load i32* %scevgep.i45.i, align 4         ; <i32> [#uses=1]
  store i32 %11, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %10, i32* %scevgep.i45.i, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  %12 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %13 = load i32* %scevgep.i45.i, align 4         ; <i32> [#uses=1]
  store i32 %13, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %12, i32* %scevgep.i45.i, align 4
  %indvar.next.i46.i = add i32 %indvar.i43.i, 1   ; <i32> [#uses=2]
  %exitcond.i47.i = icmp eq i32 %indvar.next.i46.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond.i47.i, label %bb1.i55.i, label %bb1.i.i48.i

bb1.i55.i:                                        ; preds = %bb1.i55.i, %bb1.i.i48.i
  %indvar9.i50.i = phi i32 [ %indvar.next10.i53.i, %bb1.i55.i ], [ 0, %bb1.i.i48.i ] ; <i32> [#uses=2]
  %tmp13.i51.i = sub i32 6, %indvar9.i50.i        ; <i32> [#uses=1]
  %scevgep14.i52.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp13.i51.i ; <i32*> [#uses=4]
  %14 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %15 = load i32* %scevgep14.i52.i, align 4       ; <i32> [#uses=1]
  store i32 %15, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %14, i32* %scevgep14.i52.i, align 4
  tail call fastcc void @Permute(i32 6) nounwind
  %16 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %17 = load i32* %scevgep14.i52.i, align 4       ; <i32> [#uses=1]
  store i32 %17, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %16, i32* %scevgep14.i52.i, align 4
  %indvar.next10.i53.i = add i32 %indvar9.i50.i, 1 ; <i32> [#uses=2]
  %exitcond11.i54.i = icmp eq i32 %indvar.next10.i53.i, 6 ; <i1> [#uses=1]
  br i1 %exitcond11.i54.i, label %Permute.exit56.i, label %bb1.i55.i

Permute.exit56.i:                                 ; preds = %bb1.i55.i
  store i32 0, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 2), align 8
  store i32 2, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 3), align 4
  store i32 3, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 4), align 16
  store i32 4, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 5), align 4
  store i32 5, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 6, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  %18 = load i32* @pctr, align 4                  ; <i32> [#uses=1]
  %19 = add i32 %18, 2                            ; <i32> [#uses=1]
  store i32 %19, i32* @pctr, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  br label %bb1.i.i34.i

bb1.i.i34.i:                                      ; preds = %bb1.i.i34.i, %Permute.exit56.i
  %indvar.i29.i = phi i32 [ 0, %Permute.exit56.i ], [ %indvar.next.i32.i, %bb1.i.i34.i ] ; <i32> [#uses=2]
  %tmp8.i30.i = sub i32 5, %indvar.i29.i          ; <i32> [#uses=1]
  %scevgep.i31.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp8.i30.i ; <i32*> [#uses=4]
  %20 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %21 = load i32* %scevgep.i31.i, align 4         ; <i32> [#uses=1]
  store i32 %21, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %20, i32* %scevgep.i31.i, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  %22 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %23 = load i32* %scevgep.i31.i, align 4         ; <i32> [#uses=1]
  store i32 %23, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %22, i32* %scevgep.i31.i, align 4
  %indvar.next.i32.i = add i32 %indvar.i29.i, 1   ; <i32> [#uses=2]
  %exitcond.i33.i = icmp eq i32 %indvar.next.i32.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond.i33.i, label %bb1.i41.i, label %bb1.i.i34.i

bb1.i41.i:                                        ; preds = %bb1.i41.i, %bb1.i.i34.i
  %indvar9.i36.i = phi i32 [ %indvar.next10.i39.i, %bb1.i41.i ], [ 0, %bb1.i.i34.i ] ; <i32> [#uses=2]
  %tmp13.i37.i = sub i32 6, %indvar9.i36.i        ; <i32> [#uses=1]
  %scevgep14.i38.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp13.i37.i ; <i32*> [#uses=4]
  %24 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %25 = load i32* %scevgep14.i38.i, align 4       ; <i32> [#uses=1]
  store i32 %25, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %24, i32* %scevgep14.i38.i, align 4
  tail call fastcc void @Permute(i32 6) nounwind
  %26 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %27 = load i32* %scevgep14.i38.i, align 4       ; <i32> [#uses=1]
  store i32 %27, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %26, i32* %scevgep14.i38.i, align 4
  %indvar.next10.i39.i = add i32 %indvar9.i36.i, 1 ; <i32> [#uses=2]
  %exitcond11.i40.i = icmp eq i32 %indvar.next10.i39.i, 6 ; <i1> [#uses=1]
  br i1 %exitcond11.i40.i, label %Permute.exit42.i, label %bb1.i41.i

Permute.exit42.i:                                 ; preds = %bb1.i41.i
  store i32 0, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 2), align 8
  store i32 2, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 3), align 4
  store i32 3, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 4), align 16
  store i32 4, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 5), align 4
  store i32 5, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 6, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  %28 = load i32* @pctr, align 4                  ; <i32> [#uses=1]
  %29 = add i32 %28, 2                            ; <i32> [#uses=1]
  store i32 %29, i32* @pctr, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  br label %bb1.i.i20.i

bb1.i.i20.i:                                      ; preds = %bb1.i.i20.i, %Permute.exit42.i
  %indvar.i15.i = phi i32 [ 0, %Permute.exit42.i ], [ %indvar.next.i18.i, %bb1.i.i20.i ] ; <i32> [#uses=2]
  %tmp8.i16.i = sub i32 5, %indvar.i15.i          ; <i32> [#uses=1]
  %scevgep.i17.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp8.i16.i ; <i32*> [#uses=4]
  %30 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %31 = load i32* %scevgep.i17.i, align 4         ; <i32> [#uses=1]
  store i32 %31, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %30, i32* %scevgep.i17.i, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  %32 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %33 = load i32* %scevgep.i17.i, align 4         ; <i32> [#uses=1]
  store i32 %33, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %32, i32* %scevgep.i17.i, align 4
  %indvar.next.i18.i = add i32 %indvar.i15.i, 1   ; <i32> [#uses=2]
  %exitcond.i19.i = icmp eq i32 %indvar.next.i18.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond.i19.i, label %bb1.i27.i, label %bb1.i.i20.i

bb1.i27.i:                                        ; preds = %bb1.i27.i, %bb1.i.i20.i
  %indvar9.i22.i = phi i32 [ %indvar.next10.i25.i, %bb1.i27.i ], [ 0, %bb1.i.i20.i ] ; <i32> [#uses=2]
  %tmp13.i23.i = sub i32 6, %indvar9.i22.i        ; <i32> [#uses=1]
  %scevgep14.i24.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp13.i23.i ; <i32*> [#uses=4]
  %34 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %35 = load i32* %scevgep14.i24.i, align 4       ; <i32> [#uses=1]
  store i32 %35, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %34, i32* %scevgep14.i24.i, align 4
  tail call fastcc void @Permute(i32 6) nounwind
  %36 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %37 = load i32* %scevgep14.i24.i, align 4       ; <i32> [#uses=1]
  store i32 %37, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %36, i32* %scevgep14.i24.i, align 4
  %indvar.next10.i25.i = add i32 %indvar9.i22.i, 1 ; <i32> [#uses=2]
  %exitcond11.i26.i = icmp eq i32 %indvar.next10.i25.i, 6 ; <i1> [#uses=1]
  br i1 %exitcond11.i26.i, label %Permute.exit28.i, label %bb1.i27.i

Permute.exit28.i:                                 ; preds = %bb1.i27.i
  store i32 0, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 2), align 8
  store i32 2, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 3), align 4
  store i32 3, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 4), align 16
  store i32 4, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 5), align 4
  store i32 5, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 6, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  %38 = load i32* @pctr, align 4                  ; <i32> [#uses=1]
  %39 = add i32 %38, 2                            ; <i32> [#uses=1]
  store i32 %39, i32* @pctr, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  br label %bb1.i.i6.i

bb1.i.i6.i:                                       ; preds = %bb1.i.i6.i, %Permute.exit28.i
  %indvar.i1.i = phi i32 [ 0, %Permute.exit28.i ], [ %indvar.next.i4.i, %bb1.i.i6.i ] ; <i32> [#uses=2]
  %tmp8.i2.i = sub i32 5, %indvar.i1.i            ; <i32> [#uses=1]
  %scevgep.i3.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp8.i2.i ; <i32*> [#uses=4]
  %40 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %41 = load i32* %scevgep.i3.i, align 4          ; <i32> [#uses=1]
  store i32 %41, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %40, i32* %scevgep.i3.i, align 4
  tail call fastcc void @Permute(i32 5) nounwind
  %42 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8 ; <i32> [#uses=1]
  %43 = load i32* %scevgep.i3.i, align 4          ; <i32> [#uses=1]
  store i32 %43, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 6), align 8
  store i32 %42, i32* %scevgep.i3.i, align 4
  %indvar.next.i4.i = add i32 %indvar.i1.i, 1     ; <i32> [#uses=2]
  %exitcond.i5.i = icmp eq i32 %indvar.next.i4.i, 5 ; <i1> [#uses=1]
  br i1 %exitcond.i5.i, label %bb1.i13.i, label %bb1.i.i6.i

bb1.i13.i:                                        ; preds = %bb1.i13.i, %bb1.i.i6.i
  %indvar9.i8.i = phi i32 [ %indvar.next10.i11.i, %bb1.i13.i ], [ 0, %bb1.i.i6.i ] ; <i32> [#uses=2]
  %tmp13.i9.i = sub i32 6, %indvar9.i8.i          ; <i32> [#uses=1]
  %scevgep14.i10.i = getelementptr [11 x i32]* @permarray, i32 0, i32 %tmp13.i9.i ; <i32*> [#uses=4]
  %44 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %45 = load i32* %scevgep14.i10.i, align 4       ; <i32> [#uses=1]
  store i32 %45, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %44, i32* %scevgep14.i10.i, align 4
  tail call fastcc void @Permute(i32 6) nounwind
  %46 = load i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4 ; <i32> [#uses=1]
  %47 = load i32* %scevgep14.i10.i, align 4       ; <i32> [#uses=1]
  store i32 %47, i32* getelementptr inbounds ([11 x i32]* @permarray, i32 0, i32 7), align 4
  store i32 %46, i32* %scevgep14.i10.i, align 4
  %indvar.next10.i11.i = add i32 %indvar9.i8.i, 1 ; <i32> [#uses=2]
  %exitcond11.i12.i = icmp eq i32 %indvar.next10.i11.i, 6 ; <i1> [#uses=1]
  br i1 %exitcond11.i12.i, label %Permute.exit14.i, label %bb1.i13.i

Permute.exit14.i:                                 ; preds = %bb1.i13.i
  %.pre.i = load i32* @pctr, align 4              ; <i32> [#uses=2]
  %phitmp.i = icmp eq i32 %.pre.i, 43300          ; <i1> [#uses=1]
  br i1 %phitmp.i, label %Perm.exit, label %bb3.i

bb3.i:                                            ; preds = %Permute.exit14.i
  %48 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %.pre = load i32* @pctr, align 4                ; <i32> [#uses=1]
  br label %Perm.exit

Perm.exit:                                        ; preds = %bb3.i, %Permute.exit14.i
  %49 = phi i32 [ %.pre.i, %Permute.exit14.i ], [ %.pre, %bb3.i ] ; <i32> [#uses=1]
  %50 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %49) nounwind ; <i32> [#uses=0]
  %51 = add nsw i32 %i.01, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %51, 100                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %Perm.exit
  ret i32 0
}
