; ModuleID = 'Queens.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }

@.str = private constant [18 x i8] c" Error in Queens.\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str1 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal fastcc void @Try(i32 %i, i32* %q, i32* %a, i32* %b, i32* %c, i32* %x) nounwind {
entry:
  store i32 0, i32* %q, align 4
  %0 = getelementptr inbounds i32* %x, i32 %i     ; <i32*> [#uses=1]
  %1 = icmp sgt i32 %i, 7                         ; <i1> [#uses=1]
  %2 = add nsw i32 %i, 1                          ; <i32> [#uses=3]
  %3 = getelementptr inbounds i32* %x, i32 %2     ; <i32*> [#uses=2]
  %4 = icmp sgt i32 %2, 7                         ; <i1> [#uses=1]
  %5 = add nsw i32 %i, 2                          ; <i32> [#uses=3]
  %6 = add i32 %i, 7                              ; <i32> [#uses=2]
  %tmp24 = add i32 %i, 6                          ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb7.backedge, %entry
  %j.07 = phi i32 [ 0, %entry ], [ %tmp27, %bb7.backedge ] ; <i32> [#uses=3]
  %tmp25 = sub i32 %tmp24, %j.07                  ; <i32> [#uses=1]
  %scevgep26 = getelementptr i32* %c, i32 %tmp25  ; <i32*> [#uses=3]
  %tmp27 = add i32 %j.07, 1                       ; <i32> [#uses=4]
  %tmp28 = add i32 %j.07, %2                      ; <i32> [#uses=1]
  %scevgep29 = getelementptr i32* %a, i32 %tmp28  ; <i32*> [#uses=3]
  %scevgep30 = getelementptr i32* %b, i32 %tmp27  ; <i32*> [#uses=3]
  store i32 0, i32* %q, align 4
  %7 = load i32* %scevgep30, align 4              ; <i32> [#uses=1]
  %8 = icmp eq i32 %7, 0                          ; <i1> [#uses=1]
  br i1 %8, label %bb7.backedge, label %bb1

bb1:                                              ; preds = %bb
  %9 = load i32* %scevgep29, align 4              ; <i32> [#uses=1]
  %10 = icmp eq i32 %9, 0                         ; <i1> [#uses=1]
  br i1 %10, label %bb7.backedge, label %bb2

bb2:                                              ; preds = %bb1
  %11 = load i32* %scevgep26, align 4             ; <i32> [#uses=1]
  %12 = icmp eq i32 %11, 0                        ; <i1> [#uses=1]
  br i1 %12, label %bb7.backedge, label %bb3

bb3:                                              ; preds = %bb2
  store i32 %tmp27, i32* %0, align 4
  store i32 0, i32* %scevgep30, align 4
  store i32 0, i32* %scevgep29, align 4
  store i32 0, i32* %scevgep26, align 4
  br i1 %1, label %bb6, label %bb4

bb4:                                              ; preds = %bb3
  store i32 0, i32* %q, align 4
  br i1 %4, label %bb.i.us, label %bb.i

bb.i.us:                                          ; preds = %bb7.i.backedge.us, %bb4
  %j.0.i6.us = phi i32 [ %tmp12, %bb7.i.backedge.us ], [ 0, %bb4 ] ; <i32> [#uses=3]
  %tmp11 = sub i32 %6, %j.0.i6.us                 ; <i32> [#uses=1]
  %scevgep = getelementptr i32* %c, i32 %tmp11    ; <i32*> [#uses=2]
  %tmp12 = add i32 %j.0.i6.us, 1                  ; <i32> [#uses=4]
  %tmp13 = add i32 %j.0.i6.us, %5                 ; <i32> [#uses=1]
  %scevgep14 = getelementptr i32* %a, i32 %tmp13  ; <i32*> [#uses=2]
  %scevgep15 = getelementptr i32* %b, i32 %tmp12  ; <i32*> [#uses=2]
  store i32 0, i32* %q, align 4
  %13 = load i32* %scevgep15, align 4             ; <i32> [#uses=1]
  %14 = icmp eq i32 %13, 0                        ; <i1> [#uses=1]
  br i1 %14, label %bb7.i.backedge.us, label %bb1.i.us

bb3.i.us:                                         ; preds = %bb2.i.us
  store i32 %tmp12, i32* %3, align 4
  store i32 0, i32* %scevgep15, align 4
  store i32 0, i32* %scevgep14, align 4
  store i32 0, i32* %scevgep, align 4
  store i32 1, i32* %q, align 4
  br label %bb7.i.backedge.us

bb2.i.us:                                         ; preds = %bb1.i.us
  %15 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  %16 = icmp eq i32 %15, 0                        ; <i1> [#uses=1]
  br i1 %16, label %bb7.i.backedge.us, label %bb3.i.us

bb1.i.us:                                         ; preds = %bb.i.us
  %17 = load i32* %scevgep14, align 4             ; <i32> [#uses=1]
  %18 = icmp eq i32 %17, 0                        ; <i1> [#uses=1]
  br i1 %18, label %bb7.i.backedge.us, label %bb2.i.us

bb7.i.backedge.us:                                ; preds = %bb1.i.us, %bb2.i.us, %bb3.i.us, %bb.i.us
  %19 = phi i32 [ 0, %bb1.i.us ], [ 0, %bb2.i.us ], [ 1, %bb3.i.us ], [ 0, %bb.i.us ] ; <i32> [#uses=2]
  %phitmp = icmp ne i32 %tmp12, 8                 ; <i1> [#uses=1]
  %20 = icmp eq i32 %19, 0                        ; <i1> [#uses=1]
  %21 = and i1 %20, %phitmp                       ; <i1> [#uses=1]
  br i1 %21, label %bb.i.us, label %Try.exit

bb.i:                                             ; preds = %bb7.i.backedge, %bb4
  %j.0.i6 = phi i32 [ %tmp19, %bb7.i.backedge ], [ 0, %bb4 ] ; <i32> [#uses=3]
  %tmp17 = sub i32 %6, %j.0.i6                    ; <i32> [#uses=1]
  %scevgep18 = getelementptr i32* %c, i32 %tmp17  ; <i32*> [#uses=3]
  %tmp19 = add i32 %j.0.i6, 1                     ; <i32> [#uses=4]
  %tmp20 = add i32 %j.0.i6, %5                    ; <i32> [#uses=1]
  %scevgep21 = getelementptr i32* %a, i32 %tmp20  ; <i32*> [#uses=3]
  %scevgep22 = getelementptr i32* %b, i32 %tmp19  ; <i32*> [#uses=3]
  store i32 0, i32* %q, align 4
  %22 = load i32* %scevgep22, align 4             ; <i32> [#uses=1]
  %23 = icmp eq i32 %22, 0                        ; <i1> [#uses=1]
  br i1 %23, label %bb7.i.backedge, label %bb1.i

bb1.i:                                            ; preds = %bb.i
  %24 = load i32* %scevgep21, align 4             ; <i32> [#uses=1]
  %25 = icmp eq i32 %24, 0                        ; <i1> [#uses=1]
  br i1 %25, label %bb7.i.backedge, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %26 = load i32* %scevgep18, align 4             ; <i32> [#uses=1]
  %27 = icmp eq i32 %26, 0                        ; <i1> [#uses=1]
  br i1 %27, label %bb7.i.backedge, label %bb3.i

bb3.i:                                            ; preds = %bb2.i
  store i32 %tmp19, i32* %3, align 4
  store i32 0, i32* %scevgep22, align 4
  store i32 0, i32* %scevgep21, align 4
  store i32 0, i32* %scevgep18, align 4
  tail call fastcc void @Try(i32 %5, i32* %q, i32* %a, i32* %b, i32* %c, i32* %x) nounwind
  %28 = load i32* %q, align 4                     ; <i32> [#uses=2]
  %29 = icmp eq i32 %28, 0                        ; <i1> [#uses=1]
  br i1 %29, label %bb5.i, label %bb7.i.backedge

bb5.i:                                            ; preds = %bb3.i
  store i32 1, i32* %scevgep22, align 4
  store i32 1, i32* %scevgep21, align 4
  store i32 1, i32* %scevgep18, align 4
  %.pre2 = load i32* %q, align 4                  ; <i32> [#uses=1]
  br label %bb7.i.backedge

bb7.i.backedge:                                   ; preds = %bb5.i, %bb3.i, %bb2.i, %bb1.i, %bb.i
  %30 = phi i32 [ %.pre2, %bb5.i ], [ %28, %bb3.i ], [ 0, %bb2.i ], [ 0, %bb1.i ], [ 0, %bb.i ] ; <i32> [#uses=2]
  %phitmp9 = icmp ne i32 %tmp19, 8                ; <i1> [#uses=1]
  %31 = icmp eq i32 %30, 0                        ; <i1> [#uses=1]
  %32 = and i1 %31, %phitmp9                      ; <i1> [#uses=1]
  br i1 %32, label %bb.i, label %Try.exit

Try.exit:                                         ; preds = %bb7.i.backedge, %bb7.i.backedge.us
  %.rle31 = phi i32 [ %19, %bb7.i.backedge.us ], [ %30, %bb7.i.backedge ] ; <i32> [#uses=2]
  %33 = icmp eq i32 %.rle31, 0                    ; <i1> [#uses=1]
  br i1 %33, label %bb5, label %bb7.backedge

bb5:                                              ; preds = %Try.exit
  store i32 1, i32* %scevgep30, align 4
  store i32 1, i32* %scevgep29, align 4
  store i32 1, i32* %scevgep26, align 4
  %.pre = load i32* %q, align 4                   ; <i32> [#uses=1]
  br label %bb7.backedge

bb7.backedge:                                     ; preds = %bb6, %bb5, %Try.exit, %bb2, %bb1, %bb
  %34 = phi i32 [ %.pre, %bb5 ], [ 1, %bb6 ], [ 0, %bb ], [ 0, %bb1 ], [ 0, %bb2 ], [ %.rle31, %Try.exit ] ; <i32> [#uses=1]
  %phitmp10 = icmp ne i32 %tmp27, 8               ; <i1> [#uses=1]
  %35 = icmp eq i32 %34, 0                        ; <i1> [#uses=1]
  %36 = and i1 %35, %phitmp10                     ; <i1> [#uses=1]
  br i1 %36, label %bb, label %return

bb6:                                              ; preds = %bb3
  store i32 1, i32* %q, align 4
  br label %bb7.backedge

return:                                           ; preds = %bb7.backedge
  ret void
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  %x1.i = alloca [9 x i32], align 4               ; <[9 x i32]*> [#uses=1]
  %c.i = alloca [15 x i32], align 4               ; <[15 x i32]*> [#uses=2]
  %b.i = alloca [17 x i32], align 4               ; <[17 x i32]*> [#uses=2]
  %a.i = alloca [9 x i32], align 4                ; <[9 x i32]*> [#uses=2]
  %q.i = alloca i32, align 4                      ; <i32*> [#uses=2]
  %x1.sub.i = getelementptr inbounds [9 x i32]* %x1.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %b9.i = getelementptr inbounds [17 x i32]* %b.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %a10.i = getelementptr inbounds [9 x i32]* %a.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %c11.i = getelementptr inbounds [15 x i32]* %c.i, i32 0, i32 0 ; <i32*> [#uses=1]
  br label %bb.i.preheader

bb.i:                                             ; preds = %bb.i.preheader, %Doit.exit
  %indvar.i = phi i32 [ 0, %bb.i.preheader ], [ %indvar.next.i, %Doit.exit ] ; <i32> [#uses=1]
  br label %bb.i2

bb.i2:                                            ; preds = %bb6.i, %bb.i
  %indvar.i1 = phi i32 [ 0, %bb.i ], [ %indvar.next.i3, %bb6.i ] ; <i32> [#uses=4]
  %i.02.i = add i32 %indvar.i1, -7                ; <i32> [#uses=4]
  %scevgep3.i = getelementptr [17 x i32]* %b.i, i32 0, i32 %i.02.i ; <i32*> [#uses=1]
  %scevgep4.i = getelementptr [15 x i32]* %c.i, i32 0, i32 %indvar.i1 ; <i32*> [#uses=1]
  %tmp.i = add i32 %indvar.i1, -8                 ; <i32> [#uses=1]
  %0 = icmp ugt i32 %tmp.i, 7                     ; <i1> [#uses=1]
  br i1 %0, label %bb2.i, label %bb1.i

bb1.i:                                            ; preds = %bb.i2
  %scevgep.i = getelementptr [9 x i32]* %a.i, i32 0, i32 %i.02.i ; <i32*> [#uses=1]
  store i32 1, i32* %scevgep.i, align 4
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i, %bb.i2
  %1 = icmp sgt i32 %i.02.i, 1                    ; <i1> [#uses=1]
  br i1 %1, label %bb3.i, label %bb4.i

bb3.i:                                            ; preds = %bb2.i
  store i32 1, i32* %scevgep3.i, align 4
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %bb2.i
  %2 = icmp sgt i32 %i.02.i, 7                    ; <i1> [#uses=1]
  br i1 %2, label %bb6.i, label %bb5.i

bb5.i:                                            ; preds = %bb4.i
  store i32 1, i32* %scevgep4.i, align 4
  br label %bb6.i

bb6.i:                                            ; preds = %bb5.i, %bb4.i
  %indvar.next.i3 = add i32 %indvar.i1, 1         ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i3, 24   ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb8.i, label %bb.i2

bb8.i:                                            ; preds = %bb6.i
  call fastcc void @Try(i32 1, i32* %q.i, i32* %b9.i, i32* %a10.i, i32* %c11.i, i32* %x1.sub.i) nounwind
  %3 = load i32* %q.i, align 4                    ; <i32> [#uses=1]
  %4 = icmp eq i32 %3, 0                          ; <i1> [#uses=1]
  br i1 %4, label %bb13.i, label %Doit.exit

bb13.i:                                           ; preds = %bb8.i
  %5 = call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %Doit.exit

Doit.exit:                                        ; preds = %bb13.i, %bb8.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i, 50      ; <i1> [#uses=1]
  br i1 %exitcond, label %Queens.exit, label %bb.i

Queens.exit:                                      ; preds = %Doit.exit
  %6 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp) nounwind ; <i32> [#uses=0]
  %exitcond2 = icmp eq i32 %tmp, 100              ; <i1> [#uses=1]
  br i1 %exitcond2, label %bb2, label %bb.i.preheader

bb.i.preheader:                                   ; preds = %Queens.exit, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %tmp, %Queens.exit ] ; <i32> [#uses=1]
  %tmp = add i32 %i.01, 1                         ; <i32> [#uses=3]
  br label %bb.i

bb2:                                              ; preds = %Queens.exit
  ret i32 0
}
