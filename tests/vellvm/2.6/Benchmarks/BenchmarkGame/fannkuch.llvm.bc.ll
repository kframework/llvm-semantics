; ModuleID = 'fannkuch.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [3 x i8] c"%d\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str1 = private constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1 ; <[23 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = tail call noalias i8* @calloc(i32 11, i32 4) nounwind ; <i8*> [#uses=13]
  %1 = bitcast i8* %0 to i32*                     ; <i32*> [#uses=1]
  %2 = tail call noalias i8* @calloc(i32 11, i32 4) nounwind ; <i8*> [#uses=15]
  %3 = bitcast i8* %2 to i32*                     ; <i32*> [#uses=3]
  %4 = tail call noalias i8* @calloc(i32 11, i32 4) nounwind ; <i8*> [#uses=2]
  store i32 0, i32* %3, align 4
  %scevgep78.1.i = getelementptr i8* %2, i32 4    ; <i8*> [#uses=1]
  %scevgep7879.1.i = bitcast i8* %scevgep78.1.i to i32* ; <i32*> [#uses=2]
  store i32 1, i32* %scevgep7879.1.i, align 4
  %scevgep78.2.i = getelementptr i8* %2, i32 8    ; <i8*> [#uses=1]
  %scevgep7879.2.i = bitcast i8* %scevgep78.2.i to i32* ; <i32*> [#uses=2]
  store i32 2, i32* %scevgep7879.2.i, align 4
  %scevgep78.3.i = getelementptr i8* %2, i32 12   ; <i8*> [#uses=1]
  %scevgep7879.3.i = bitcast i8* %scevgep78.3.i to i32* ; <i32*> [#uses=2]
  store i32 3, i32* %scevgep7879.3.i, align 4
  %scevgep78.4.i = getelementptr i8* %2, i32 16   ; <i8*> [#uses=1]
  %scevgep7879.4.i = bitcast i8* %scevgep78.4.i to i32* ; <i32*> [#uses=2]
  store i32 4, i32* %scevgep7879.4.i, align 4
  %scevgep78.5.i = getelementptr i8* %2, i32 20   ; <i8*> [#uses=1]
  %scevgep7879.5.i = bitcast i8* %scevgep78.5.i to i32* ; <i32*> [#uses=2]
  store i32 5, i32* %scevgep7879.5.i, align 4
  %scevgep78.6.i = getelementptr i8* %2, i32 24   ; <i8*> [#uses=1]
  %scevgep7879.6.i = bitcast i8* %scevgep78.6.i to i32* ; <i32*> [#uses=2]
  store i32 6, i32* %scevgep7879.6.i, align 4
  %scevgep78.7.i = getelementptr i8* %2, i32 28   ; <i8*> [#uses=1]
  %scevgep7879.7.i = bitcast i8* %scevgep78.7.i to i32* ; <i32*> [#uses=2]
  store i32 7, i32* %scevgep7879.7.i, align 4
  %scevgep78.8.i = getelementptr i8* %2, i32 32   ; <i8*> [#uses=1]
  %scevgep7879.8.i = bitcast i8* %scevgep78.8.i to i32* ; <i32*> [#uses=2]
  store i32 8, i32* %scevgep7879.8.i, align 4
  %scevgep78.9.i = getelementptr i8* %2, i32 36   ; <i8*> [#uses=1]
  %scevgep7879.9.i = bitcast i8* %scevgep78.9.i to i32* ; <i32*> [#uses=2]
  store i32 9, i32* %scevgep7879.9.i, align 4
  %scevgep78.10.i = getelementptr i8* %2, i32 40  ; <i8*> [#uses=1]
  %scevgep7879.10.i = bitcast i8* %scevgep78.10.i to i32* ; <i32*> [#uses=2]
  store i32 10, i32* %scevgep7879.10.i, align 4
  %scevgep38.i = getelementptr i8* %0, i32 4      ; <i8*> [#uses=1]
  %scevgep3839.i = bitcast i8* %scevgep38.i to i32* ; <i32*> [#uses=1]
  %scevgep38.1.i = getelementptr i8* %0, i32 8    ; <i8*> [#uses=1]
  %scevgep3839.1.i = bitcast i8* %scevgep38.1.i to i32* ; <i32*> [#uses=1]
  %scevgep38.2.i = getelementptr i8* %0, i32 12   ; <i8*> [#uses=1]
  %scevgep3839.2.i = bitcast i8* %scevgep38.2.i to i32* ; <i32*> [#uses=1]
  %scevgep38.3.i = getelementptr i8* %0, i32 16   ; <i8*> [#uses=1]
  %scevgep3839.3.i = bitcast i8* %scevgep38.3.i to i32* ; <i32*> [#uses=1]
  %scevgep38.4.i = getelementptr i8* %0, i32 20   ; <i8*> [#uses=1]
  %scevgep3839.4.i = bitcast i8* %scevgep38.4.i to i32* ; <i32*> [#uses=1]
  %scevgep38.5.i = getelementptr i8* %0, i32 24   ; <i8*> [#uses=1]
  %scevgep3839.5.i = bitcast i8* %scevgep38.5.i to i32* ; <i32*> [#uses=1]
  %scevgep38.6.i = getelementptr i8* %0, i32 28   ; <i8*> [#uses=1]
  %scevgep3839.6.i = bitcast i8* %scevgep38.6.i to i32* ; <i32*> [#uses=1]
  %scevgep38.7.i = getelementptr i8* %0, i32 32   ; <i8*> [#uses=1]
  %scevgep3839.7.i = bitcast i8* %scevgep38.7.i to i32* ; <i32*> [#uses=1]
  %scevgep38.8.i = getelementptr i8* %0, i32 36   ; <i8*> [#uses=1]
  %scevgep3839.8.i = bitcast i8* %scevgep38.8.i to i32* ; <i32*> [#uses=1]
  %scevgep38.9.i = getelementptr i8* %0, i32 40   ; <i8*> [#uses=1]
  %scevgep3839.9.i = bitcast i8* %scevgep38.9.i to i32* ; <i32*> [#uses=1]
  br label %bb5.i

bb5.i:                                            ; preds = %bb29.i, %entry
  %didpr.1.i = phi i32 [ 0, %entry ], [ %didpr.0.ph.i, %bb29.i ] ; <i32> [#uses=3]
  %r.1.i = phi i32 [ 11, %entry ], [ %r.2.i, %bb29.i ] ; <i32> [#uses=5]
  %flipsMax.1.i = phi i32 [ 0, %entry ], [ %flipsMax.0.ph.i, %bb29.i ] ; <i32> [#uses=4]
  %5 = icmp sgt i32 %didpr.1.i, 29                ; <i1> [#uses=1]
  br i1 %5, label %bb11.preheader.i, label %bb7.i

bb7.i:                                            ; preds = %bb7.i, %bb5.i
  %i.12.i = phi i32 [ %9, %bb7.i ], [ 0, %bb5.i ] ; <i32> [#uses=2]
  %tmp9 = shl i32 %i.12.i, 2                      ; <i32> [#uses=1]
  %scevgep10 = getelementptr i8* %2, i32 %tmp9    ; <i8*> [#uses=1]
  %scevgep20.i = bitcast i8* %scevgep10 to i32*   ; <i32*> [#uses=1]
  %6 = load i32* %scevgep20.i, align 4            ; <i32> [#uses=1]
  %7 = add nsw i32 %6, 1                          ; <i32> [#uses=1]
  %8 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %7) nounwind ; <i32> [#uses=0]
  %9 = add nsw i32 %i.12.i, 1                     ; <i32> [#uses=2]
  %exitcond8 = icmp eq i32 %9, 11                 ; <i1> [#uses=1]
  br i1 %exitcond8, label %bb9.i, label %bb7.i

bb9.i:                                            ; preds = %bb7.i
  %10 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  %11 = add nsw i32 %didpr.1.i, 1                 ; <i32> [#uses=1]
  br label %bb11.preheader.i

bb11.preheader.i:                                 ; preds = %bb9.i, %bb5.i
  %didpr.0.ph.i = phi i32 [ %11, %bb9.i ], [ %didpr.1.i, %bb5.i ] ; <i32> [#uses=1]
  %12 = icmp eq i32 %r.1.i, 1                     ; <i1> [#uses=1]
  br i1 %12, label %bb12.i, label %bb.nph4.i

bb.nph4.i:                                        ; preds = %bb11.preheader.i
  %tmp21.i = add i32 %r.1.i, -1                   ; <i32> [#uses=1]
  %tmp2 = shl i32 %r.1.i, 2                       ; <i32> [#uses=1]
  %tmp3 = add i32 %tmp2, -4                       ; <i32> [#uses=1]
  br label %bb10.i

bb10.i:                                           ; preds = %bb10.i, %bb.nph4.i
  %indvar.i = phi i32 [ 0, %bb.nph4.i ], [ %indvar.next.i, %bb10.i ] ; <i32> [#uses=3]
  %tmp = mul i32 %indvar.i, -4                    ; <i32> [#uses=1]
  %tmp4 = add i32 %tmp, %tmp3                     ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %4, i32 %tmp4      ; <i8*> [#uses=1]
  %scevgep2930.i = bitcast i8* %scevgep to i32*   ; <i32*> [#uses=1]
  %r.03.i = sub i32 %r.1.i, %indvar.i             ; <i32> [#uses=1]
  store i32 %r.03.i, i32* %scevgep2930.i, align 4
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i, %tmp21.i ; <i1> [#uses=1]
  br i1 %exitcond, label %bb12.i, label %bb10.i

bb12.i:                                           ; preds = %bb10.i, %bb11.preheader.i
  %r.0.lcssa.i = phi i32 [ %r.1.i, %bb11.preheader.i ], [ 1, %bb10.i ] ; <i32> [#uses=1]
  %13 = load i32* %3, align 4                     ; <i32> [#uses=2]
  %14 = icmp eq i32 %13, 0                        ; <i1> [#uses=1]
  br i1 %14, label %bb24.preheader.i, label %bb13.i

bb13.i:                                           ; preds = %bb12.i
  %15 = load i32* %scevgep7879.10.i, align 4      ; <i32> [#uses=2]
  %16 = icmp eq i32 %15, 10                       ; <i1> [#uses=1]
  br i1 %16, label %bb24.preheader.i, label %bb16.preheader.i

bb16.preheader.i:                                 ; preds = %bb13.i
  %17 = load i32* %scevgep7879.1.i, align 4       ; <i32> [#uses=1]
  store i32 %17, i32* %scevgep3839.i, align 4
  %18 = load i32* %scevgep7879.2.i, align 4       ; <i32> [#uses=1]
  store i32 %18, i32* %scevgep3839.1.i, align 4
  %19 = load i32* %scevgep7879.3.i, align 4       ; <i32> [#uses=1]
  store i32 %19, i32* %scevgep3839.2.i, align 4
  %20 = load i32* %scevgep7879.4.i, align 4       ; <i32> [#uses=1]
  store i32 %20, i32* %scevgep3839.3.i, align 4
  %21 = load i32* %scevgep7879.5.i, align 4       ; <i32> [#uses=1]
  store i32 %21, i32* %scevgep3839.4.i, align 4
  %22 = load i32* %scevgep7879.6.i, align 4       ; <i32> [#uses=1]
  store i32 %22, i32* %scevgep3839.5.i, align 4
  %23 = load i32* %scevgep7879.7.i, align 4       ; <i32> [#uses=1]
  store i32 %23, i32* %scevgep3839.6.i, align 4
  %24 = load i32* %scevgep7879.8.i, align 4       ; <i32> [#uses=1]
  store i32 %24, i32* %scevgep3839.7.i, align 4
  %25 = load i32* %scevgep7879.9.i, align 4       ; <i32> [#uses=1]
  store i32 %25, i32* %scevgep3839.8.i, align 4
  store i32 %15, i32* %scevgep3839.9.i, align 4
  br label %bb18.i

bb18.i:                                           ; preds = %bb21.i, %bb16.preheader.i
  %k.0.i = phi i32 [ %13, %bb16.preheader.i ], [ %31, %bb21.i ] ; <i32> [#uses=5]
  %flips.0.i = phi i32 [ 0, %bb16.preheader.i ], [ %tmp56.i, %bb21.i ] ; <i32> [#uses=1]
  %tmp56.i = add i32 %flips.0.i, 1                ; <i32> [#uses=3]
  %j.010.i = add i32 %k.0.i, -1                   ; <i32> [#uses=1]
  %26 = icmp sgt i32 %j.010.i, 1                  ; <i1> [#uses=1]
  br i1 %26, label %bb.nph12.i, label %bb21.i

bb.nph12.i:                                       ; preds = %bb18.i
  %tmp43.i = add i32 %k.0.i, -2                   ; <i32> [#uses=1]
  %tmp20 = shl i32 %k.0.i, 2                      ; <i32> [#uses=1]
  %tmp21 = add i32 %tmp20, -4                     ; <i32> [#uses=1]
  br label %bb19.i

bb19.i:                                           ; preds = %bb19.i, %bb.nph12.i
  %indvar40.i = phi i32 [ 0, %bb.nph12.i ], [ %indvar.next41.i, %bb19.i ] ; <i32> [#uses=5]
  %tmp12 = shl i32 %indvar40.i, 2                 ; <i32> [#uses=1]
  %tmp13 = add i32 %tmp12, 4                      ; <i32> [#uses=1]
  %scevgep14 = getelementptr i8* %0, i32 %tmp13   ; <i8*> [#uses=1]
  %scevgep5354.i = bitcast i8* %scevgep14 to i32* ; <i32*> [#uses=2]
  %j.0.i = sub i32 %tmp43.i, %indvar40.i          ; <i32> [#uses=1]
  %tmp55.i = add i32 %indvar40.i, 2               ; <i32> [#uses=1]
  %tmp19 = mul i32 %indvar40.i, -4                ; <i32> [#uses=1]
  %tmp22 = add i32 %tmp19, %tmp21                 ; <i32> [#uses=1]
  %scevgep23 = getelementptr i8* %0, i32 %tmp22   ; <i8*> [#uses=1]
  %scevgep4950.i = bitcast i8* %scevgep23 to i32* ; <i32*> [#uses=2]
  %27 = load i32* %scevgep5354.i, align 4         ; <i32> [#uses=1]
  %28 = load i32* %scevgep4950.i, align 4         ; <i32> [#uses=1]
  store i32 %28, i32* %scevgep5354.i, align 4
  store i32 %27, i32* %scevgep4950.i, align 4
  %29 = icmp slt i32 %tmp55.i, %j.0.i             ; <i1> [#uses=1]
  %indvar.next41.i = add i32 %indvar40.i, 1       ; <i32> [#uses=1]
  br i1 %29, label %bb19.i, label %bb21.i

bb21.i:                                           ; preds = %bb19.i, %bb18.i
  %30 = getelementptr inbounds i32* %1, i32 %k.0.i ; <i32*> [#uses=2]
  %31 = load i32* %30, align 4                    ; <i32> [#uses=2]
  store i32 %k.0.i, i32* %30, align 4
  %32 = icmp eq i32 %31, 0                        ; <i1> [#uses=1]
  br i1 %32, label %bb22.i, label %bb18.i

bb22.i:                                           ; preds = %bb21.i
  %33 = icmp slt i32 %flipsMax.1.i, %tmp56.i      ; <i1> [#uses=1]
  br i1 %33, label %bb23.i, label %bb24.preheader.i

bb23.i:                                           ; preds = %bb22.i
  br label %bb24.preheader.i

bb24.preheader.i:                                 ; preds = %bb23.i, %bb22.i, %bb13.i, %bb12.i
  %flipsMax.0.ph.i = phi i32 [ %tmp56.i, %bb23.i ], [ %flipsMax.1.i, %bb12.i ], [ %flipsMax.1.i, %bb13.i ], [ %flipsMax.1.i, %bb22.i ] ; <i32> [#uses=2]
  br label %bb24.i

bb24.i:                                           ; preds = %bb30.i, %bb24.preheader.i
  %indvar57.i = phi i32 [ 0, %bb24.preheader.i ], [ %indvar.next58.i, %bb30.i ] ; <i32> [#uses=2]
  %r.2.i = add i32 %indvar57.i, %r.0.lcssa.i      ; <i32> [#uses=5]
  %tmp38 = shl i32 %r.2.i, 2                      ; <i32> [#uses=2]
  %scevgep39 = getelementptr i8* %2, i32 %tmp38   ; <i8*> [#uses=1]
  %scevgep7475.i = bitcast i8* %scevgep39 to i32* ; <i32*> [#uses=1]
  %scevgep41 = getelementptr i8* %4, i32 %tmp38   ; <i8*> [#uses=1]
  %scevgep7273.i = bitcast i8* %scevgep41 to i32* ; <i32*> [#uses=2]
  %34 = icmp eq i32 %r.2.i, 11                    ; <i1> [#uses=1]
  br i1 %34, label %fannkuch.exit, label %bb26.i

bb26.i:                                           ; preds = %bb24.i
  %35 = load i32* %3, align 4                     ; <i32> [#uses=1]
  %36 = icmp sgt i32 %r.2.i, 0                    ; <i1> [#uses=1]
  br i1 %36, label %bb27.i, label %bb29.i

bb27.i:                                           ; preds = %bb27.i, %bb26.i
  %i.413.i = phi i32 [ %37, %bb27.i ], [ 0, %bb26.i ] ; <i32> [#uses=2]
  %tmp28 = shl i32 %i.413.i, 2                    ; <i32> [#uses=2]
  %tmp29 = add i32 %tmp28, 4                      ; <i32> [#uses=1]
  %scevgep30 = getelementptr i8* %2, i32 %tmp29   ; <i8*> [#uses=1]
  %scevgep6566.i = bitcast i8* %scevgep30 to i32* ; <i32*> [#uses=1]
  %scevgep32 = getelementptr i8* %2, i32 %tmp28   ; <i8*> [#uses=1]
  %scevgep6263.i = bitcast i8* %scevgep32 to i32* ; <i32*> [#uses=1]
  %37 = add nsw i32 %i.413.i, 1                   ; <i32> [#uses=2]
  %38 = load i32* %scevgep6566.i, align 4         ; <i32> [#uses=1]
  store i32 %38, i32* %scevgep6263.i, align 4
  %exitcond27 = icmp eq i32 %37, %r.2.i           ; <i1> [#uses=1]
  br i1 %exitcond27, label %bb29.i, label %bb27.i

bb29.i:                                           ; preds = %bb27.i, %bb26.i
  store i32 %35, i32* %scevgep7475.i, align 4
  %39 = load i32* %scevgep7273.i, align 4         ; <i32> [#uses=1]
  %40 = add i32 %39, -1                           ; <i32> [#uses=2]
  store i32 %40, i32* %scevgep7273.i, align 4
  %41 = icmp sgt i32 %40, 0                       ; <i1> [#uses=1]
  br i1 %41, label %bb5.i, label %bb30.i

bb30.i:                                           ; preds = %bb29.i
  %indvar.next58.i = add i32 %indvar57.i, 1       ; <i32> [#uses=1]
  br label %bb24.i

fannkuch.exit:                                    ; preds = %bb24.i
  %42 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 11, i32 %flipsMax.0.ph.i) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare noalias i8* @calloc(i32, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32) nounwind
