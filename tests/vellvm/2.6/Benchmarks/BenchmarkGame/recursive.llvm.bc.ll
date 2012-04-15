; ModuleID = 'recursive.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str1 = private constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str2 = private constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1 ; <[19 x i8]*> [#uses=1]
@.str3 = private constant [12 x i8] c"Fib(3): %d\0A\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str4 = private constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]

define internal fastcc i32 @ack(i32 %x, i32 %y) nounwind readnone {
entry:
  %tmp9 = add i32 %x, -1                          ; <i32> [#uses=1]
  %tmp11 = add i32 %x, -2                         ; <i32> [#uses=1]
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb4.i, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb4.i ] ; <i32> [#uses=2]
  %y.tr = phi i32 [ %y, %entry ], [ %iftmp.17.0.i, %bb4.i ] ; <i32> [#uses=3]
  %tmp = mul i32 %indvar, -2                      ; <i32> [#uses=3]
  %tmp10 = add i32 %tmp, %tmp9                    ; <i32> [#uses=4]
  %tmp12 = add i32 %tmp, %tmp11                   ; <i32> [#uses=1]
  %x.tr = add i32 %tmp, %x                        ; <i32> [#uses=2]
  %0 = icmp eq i32 %x.tr, 0                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %tailrecurse
  %1 = add nsw i32 %y.tr, 1                       ; <i32> [#uses=1]
  ret i32 %1

bb1:                                              ; preds = %tailrecurse
  switch i32 %y.tr, label %bb2.i3 [
    i32 0, label %bb4
    i32 1, label %bb4.i5
  ]

bb2.i3:                                           ; preds = %bb1
  %2 = add i32 %y.tr, -2                          ; <i32> [#uses=1]
  %3 = tail call fastcc i32 @ack(i32 %x.tr, i32 %2) nounwind ; <i32> [#uses=1]
  br label %bb4.i5

bb4.i5:                                           ; preds = %bb2.i3, %bb1
  %iftmp.17.0.i4 = phi i32 [ %3, %bb2.i3 ], [ 1, %bb1 ] ; <i32> [#uses=3]
  %4 = icmp eq i32 %tmp10, 0                      ; <i1> [#uses=1]
  br i1 %4, label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %bb4.i5
  %5 = add nsw i32 %iftmp.17.0.i4, 1              ; <i32> [#uses=1]
  br label %bb4

bb1.i.i:                                          ; preds = %bb4.i5
  %6 = icmp eq i32 %iftmp.17.0.i4, 0              ; <i1> [#uses=1]
  br i1 %6, label %bb4.i.i, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i.i
  %7 = add i32 %iftmp.17.0.i4, -1                 ; <i32> [#uses=1]
  %8 = tail call fastcc i32 @ack(i32 %tmp10, i32 %7) nounwind ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb2.i.i, %bb1.i.i
  %iftmp.17.0.i.i = phi i32 [ %8, %bb2.i.i ], [ 1, %bb1.i.i ] ; <i32> [#uses=1]
  %9 = tail call fastcc i32 @ack(i32 %tmp12, i32 %iftmp.17.0.i.i) nounwind ; <i32> [#uses=1]
  br label %bb4

bb4:                                              ; preds = %bb4.i.i, %bb.i.i, %bb1
  %iftmp.17.0 = phi i32 [ %9, %bb4.i.i ], [ %5, %bb.i.i ], [ 1, %bb1 ] ; <i32> [#uses=3]
  %10 = icmp eq i32 %tmp10, 0                     ; <i1> [#uses=1]
  br i1 %10, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %bb4
  %11 = add nsw i32 %iftmp.17.0, 1                ; <i32> [#uses=1]
  ret i32 %11

bb1.i:                                            ; preds = %bb4
  %12 = icmp eq i32 %iftmp.17.0, 0                ; <i1> [#uses=1]
  br i1 %12, label %bb4.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %13 = add i32 %iftmp.17.0, -1                   ; <i32> [#uses=1]
  %14 = tail call fastcc i32 @ack(i32 %tmp10, i32 %13) nounwind ; <i32> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %bb2.i, %bb1.i
  %iftmp.17.0.i = phi i32 [ %14, %bb2.i ], [ 1, %bb1.i ] ; <i32> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %tailrecurse
}

define internal fastcc double @fibFP(double %n) nounwind readnone {
entry:
  %0 = fcmp olt double %n, 2.000000e+00           ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb1

bb1:                                              ; preds = %entry
  %1 = fadd double %n, -2.000000e+00              ; <double> [#uses=3]
  %2 = fcmp olt double %1, 2.000000e+00           ; <i1> [#uses=1]
  br i1 %2, label %fibFP.exit3, label %bb1.i1

bb1.i1:                                           ; preds = %bb1
  %3 = fadd double %1, -2.000000e+00              ; <double> [#uses=1]
  %4 = tail call fastcc double @fibFP(double %3) nounwind ; <double> [#uses=1]
  %5 = fadd double %1, -1.000000e+00              ; <double> [#uses=3]
  %6 = fcmp olt double %5, 2.000000e+00           ; <i1> [#uses=1]
  br i1 %6, label %fibFP.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb1.i1
  %7 = fadd double %5, -2.000000e+00              ; <double> [#uses=1]
  %8 = tail call fastcc double @fibFP(double %7) nounwind ; <double> [#uses=1]
  %9 = fadd double %5, -1.000000e+00              ; <double> [#uses=1]
  %10 = tail call fastcc double @fibFP(double %9) nounwind ; <double> [#uses=1]
  %11 = fadd double %8, %10                       ; <double> [#uses=1]
  br label %fibFP.exit.i

fibFP.exit.i:                                     ; preds = %bb1.i.i, %bb1.i1
  %12 = phi double [ %11, %bb1.i.i ], [ 1.000000e+00, %bb1.i1 ] ; <double> [#uses=1]
  %13 = fadd double %4, %12                       ; <double> [#uses=1]
  br label %fibFP.exit3

fibFP.exit3:                                      ; preds = %fibFP.exit.i, %bb1
  %14 = phi double [ %13, %fibFP.exit.i ], [ 1.000000e+00, %bb1 ] ; <double> [#uses=1]
  %15 = fadd double %n, -1.000000e+00             ; <double> [#uses=3]
  %16 = fcmp olt double %15, 2.000000e+00         ; <i1> [#uses=1]
  br i1 %16, label %fibFP.exit, label %bb1.i

bb1.i:                                            ; preds = %fibFP.exit3
  %17 = fadd double %15, -2.000000e+00            ; <double> [#uses=1]
  %18 = tail call fastcc double @fibFP(double %17) nounwind ; <double> [#uses=1]
  %19 = fadd double %15, -1.000000e+00            ; <double> [#uses=1]
  %20 = tail call fastcc double @fibFP(double %19) nounwind ; <double> [#uses=1]
  %21 = fadd double %18, %20                      ; <double> [#uses=1]
  br label %fibFP.exit

fibFP.exit:                                       ; preds = %bb1.i, %fibFP.exit3
  %22 = phi double [ %21, %bb1.i ], [ 1.000000e+00, %fibFP.exit3 ] ; <double> [#uses=1]
  %23 = fadd double %14, %22                      ; <double> [#uses=1]
  ret double %23

bb2:                                              ; preds = %entry
  ret double 1.000000e+00
}

define internal fastcc i32 @tak(i32 %x, i32 %y, i32 %z) nounwind readnone {
entry:
  %0 = icmp slt i32 %y, %x                        ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %tak.exit, %entry
  %z.tr3 = phi i32 [ %2, %tak.exit ], [ %z, %entry ] ; <i32> [#uses=6]
  %y.tr2 = phi i32 [ %25, %tak.exit ], [ %y, %entry ] ; <i32> [#uses=4]
  %x.tr1 = phi i32 [ %27, %tak.exit ], [ %x, %entry ] ; <i32> [#uses=6]
  %1 = add i32 %z.tr3, -1                         ; <i32> [#uses=2]
  %2 = tail call fastcc i32 @tak(i32 %1, i32 %x.tr1, i32 %y.tr2) nounwind ; <i32> [#uses=2]
  %3 = add i32 %y.tr2, -1                         ; <i32> [#uses=4]
  %4 = icmp sgt i32 %3, %z.tr3                    ; <i1> [#uses=1]
  br i1 %4, label %bb.i, label %tak.exit

bb.i:                                             ; preds = %bb
  %5 = add i32 %x.tr1, -1                         ; <i32> [#uses=2]
  %6 = icmp slt i32 %3, %5                        ; <i1> [#uses=1]
  br i1 %6, label %bb.i1, label %tak.exit2

bb.i1:                                            ; preds = %tak.exit.i, %bb.i
  %z.tr3.i = phi i32 [ %8, %tak.exit.i ], [ %z.tr3, %bb.i ] ; <i32> [#uses=5]
  %y.tr2.i = phi i32 [ %17, %tak.exit.i ], [ %3, %bb.i ] ; <i32> [#uses=4]
  %x.tr1.i = phi i32 [ %19, %tak.exit.i ], [ %5, %bb.i ] ; <i32> [#uses=6]
  %7 = add i32 %z.tr3.i, -1                       ; <i32> [#uses=2]
  %8 = tail call fastcc i32 @tak(i32 %7, i32 %x.tr1.i, i32 %y.tr2.i) nounwind ; <i32> [#uses=2]
  %9 = add i32 %y.tr2.i, -1                       ; <i32> [#uses=3]
  %10 = icmp sgt i32 %9, %z.tr3.i                 ; <i1> [#uses=1]
  br i1 %10, label %bb.i.i, label %tak.exit.i

bb.i.i:                                           ; preds = %bb.i1
  %11 = add i32 %x.tr1.i, -1                      ; <i32> [#uses=1]
  %12 = tail call fastcc i32 @tak(i32 %11, i32 %9, i32 %z.tr3.i) nounwind ; <i32> [#uses=1]
  %13 = tail call fastcc i32 @tak(i32 %7, i32 %x.tr1.i, i32 %9) nounwind ; <i32> [#uses=1]
  %14 = add i32 %y.tr2.i, -2                      ; <i32> [#uses=1]
  %15 = tail call fastcc i32 @tak(i32 %14, i32 %z.tr3.i, i32 %x.tr1.i) nounwind ; <i32> [#uses=1]
  %16 = tail call fastcc i32 @tak(i32 %15, i32 %13, i32 %12) nounwind ; <i32> [#uses=1]
  br label %tak.exit.i

tak.exit.i:                                       ; preds = %bb.i.i, %bb.i1
  %17 = phi i32 [ %16, %bb.i.i ], [ %x.tr1.i, %bb.i1 ] ; <i32> [#uses=2]
  %18 = add i32 %x.tr1.i, -1                      ; <i32> [#uses=1]
  %19 = tail call fastcc i32 @tak(i32 %18, i32 %y.tr2.i, i32 %z.tr3.i) nounwind ; <i32> [#uses=2]
  %20 = icmp slt i32 %17, %19                     ; <i1> [#uses=1]
  br i1 %20, label %bb.i1, label %tak.exit2

tak.exit2:                                        ; preds = %tak.exit.i, %bb.i
  %z.tr.lcssa.i = phi i32 [ %z.tr3, %bb.i ], [ %8, %tak.exit.i ] ; <i32> [#uses=1]
  %21 = tail call fastcc i32 @tak(i32 %1, i32 %x.tr1, i32 %3) nounwind ; <i32> [#uses=1]
  %22 = add i32 %y.tr2, -2                        ; <i32> [#uses=1]
  %23 = tail call fastcc i32 @tak(i32 %22, i32 %z.tr3, i32 %x.tr1) nounwind ; <i32> [#uses=1]
  %24 = tail call fastcc i32 @tak(i32 %23, i32 %21, i32 %z.tr.lcssa.i) nounwind ; <i32> [#uses=1]
  br label %tak.exit

tak.exit:                                         ; preds = %tak.exit2, %bb
  %25 = phi i32 [ %24, %tak.exit2 ], [ %x.tr1, %bb ] ; <i32> [#uses=2]
  %26 = add i32 %x.tr1, -1                        ; <i32> [#uses=1]
  %27 = tail call fastcc i32 @tak(i32 %26, i32 %y.tr2, i32 %z.tr3) nounwind ; <i32> [#uses=2]
  %28 = icmp slt i32 %25, %27                     ; <i1> [#uses=1]
  br i1 %28, label %bb, label %bb2

bb2:                                              ; preds = %tak.exit, %entry
  %z.tr.lcssa = phi i32 [ %z, %entry ], [ %2, %tak.exit ] ; <i32> [#uses=1]
  ret i32 %z.tr.lcssa
}

define internal fastcc double @takFP(double %x, double %y, double %z) nounwind readnone {
entry:
  %0 = fcmp olt double %y, %x                     ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %takFP.exit, %entry
  %z.tr3 = phi double [ %2, %takFP.exit ], [ %z, %entry ] ; <double> [#uses=6]
  %y.tr2 = phi double [ %25, %takFP.exit ], [ %y, %entry ] ; <double> [#uses=3]
  %x.tr1 = phi double [ %27, %takFP.exit ], [ %x, %entry ] ; <double> [#uses=6]
  %1 = fadd double %z.tr3, -1.000000e+00          ; <double> [#uses=2]
  %2 = tail call fastcc double @takFP(double %1, double %x.tr1, double %y.tr2) nounwind ; <double> [#uses=2]
  %3 = fadd double %y.tr2, -1.000000e+00          ; <double> [#uses=5]
  %4 = fcmp ogt double %3, %z.tr3                 ; <i1> [#uses=1]
  br i1 %4, label %bb.i, label %takFP.exit

bb.i:                                             ; preds = %bb
  %5 = fadd double %x.tr1, -1.000000e+00          ; <double> [#uses=2]
  %6 = fcmp olt double %3, %5                     ; <i1> [#uses=1]
  br i1 %6, label %bb.i1, label %takFP.exit2

bb.i1:                                            ; preds = %takFP.exit.i, %bb.i
  %z.tr3.i = phi double [ %8, %takFP.exit.i ], [ %z.tr3, %bb.i ] ; <double> [#uses=5]
  %y.tr2.i = phi double [ %17, %takFP.exit.i ], [ %3, %bb.i ] ; <double> [#uses=3]
  %x.tr1.i = phi double [ %19, %takFP.exit.i ], [ %5, %bb.i ] ; <double> [#uses=6]
  %7 = fadd double %z.tr3.i, -1.000000e+00        ; <double> [#uses=2]
  %8 = tail call fastcc double @takFP(double %7, double %x.tr1.i, double %y.tr2.i) nounwind ; <double> [#uses=2]
  %9 = fadd double %y.tr2.i, -1.000000e+00        ; <double> [#uses=4]
  %10 = fcmp ogt double %9, %z.tr3.i              ; <i1> [#uses=1]
  br i1 %10, label %bb.i.i, label %takFP.exit.i

bb.i.i:                                           ; preds = %bb.i1
  %11 = fadd double %x.tr1.i, -1.000000e+00       ; <double> [#uses=1]
  %12 = tail call fastcc double @takFP(double %11, double %9, double %z.tr3.i) nounwind ; <double> [#uses=1]
  %13 = tail call fastcc double @takFP(double %7, double %x.tr1.i, double %9) nounwind ; <double> [#uses=1]
  %14 = fadd double %9, -1.000000e+00             ; <double> [#uses=1]
  %15 = tail call fastcc double @takFP(double %14, double %z.tr3.i, double %x.tr1.i) nounwind ; <double> [#uses=1]
  %16 = tail call fastcc double @takFP(double %15, double %13, double %12) nounwind ; <double> [#uses=1]
  br label %takFP.exit.i

takFP.exit.i:                                     ; preds = %bb.i.i, %bb.i1
  %17 = phi double [ %16, %bb.i.i ], [ %x.tr1.i, %bb.i1 ] ; <double> [#uses=2]
  %18 = fadd double %x.tr1.i, -1.000000e+00       ; <double> [#uses=1]
  %19 = tail call fastcc double @takFP(double %18, double %y.tr2.i, double %z.tr3.i) nounwind ; <double> [#uses=2]
  %20 = fcmp olt double %17, %19                  ; <i1> [#uses=1]
  br i1 %20, label %bb.i1, label %takFP.exit2

takFP.exit2:                                      ; preds = %takFP.exit.i, %bb.i
  %z.tr.lcssa.i = phi double [ %z.tr3, %bb.i ], [ %8, %takFP.exit.i ] ; <double> [#uses=1]
  %21 = tail call fastcc double @takFP(double %1, double %x.tr1, double %3) nounwind ; <double> [#uses=1]
  %22 = fadd double %3, -1.000000e+00             ; <double> [#uses=1]
  %23 = tail call fastcc double @takFP(double %22, double %z.tr3, double %x.tr1) nounwind ; <double> [#uses=1]
  %24 = tail call fastcc double @takFP(double %23, double %21, double %z.tr.lcssa.i) nounwind ; <double> [#uses=1]
  br label %takFP.exit

takFP.exit:                                       ; preds = %takFP.exit2, %bb
  %25 = phi double [ %24, %takFP.exit2 ], [ %x.tr1, %bb ] ; <double> [#uses=2]
  %26 = fadd double %x.tr1, -1.000000e+00         ; <double> [#uses=1]
  %27 = tail call fastcc double @takFP(double %26, double %y.tr2, double %z.tr3) nounwind ; <double> [#uses=2]
  %28 = fcmp olt double %25, %27                  ; <i1> [#uses=1]
  br i1 %28, label %bb, label %bb2

bb2:                                              ; preds = %takFP.exit, %entry
  %z.tr.lcssa = phi double [ %z, %entry ], [ %2, %takFP.exit ] ; <double> [#uses=1]
  ret double %z.tr.lcssa
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  br label %bb1.i

bb1.i:                                            ; preds = %bb4.i.i, %entry
  %indvar.i = phi i32 [ 0, %entry ], [ %indvar.next.i, %bb4.i.i ] ; <i32> [#uses=2]
  %y.tr.i = phi i32 [ 11, %entry ], [ %iftmp.17.0.i.i, %bb4.i.i ] ; <i32> [#uses=2]
  %tmp = mul i32 %indvar.i, -2                    ; <i32> [#uses=3]
  %tmp12.i1420 = or i32 %tmp, 1                   ; <i32> [#uses=1]
  %tmp10.i = add i32 %tmp, 2                      ; <i32> [#uses=4]
  switch i32 %y.tr.i, label %bb2.i3.i [
    i32 0, label %bb4.i
    i32 1, label %bb4.i5.i
  ]

bb2.i3.i:                                         ; preds = %bb1.i
  %x.tr.i = add i32 %tmp, 3                       ; <i32> [#uses=1]
  %0 = add i32 %y.tr.i, -2                        ; <i32> [#uses=1]
  %1 = tail call fastcc i32 @ack(i32 %x.tr.i, i32 %0) nounwind ; <i32> [#uses=1]
  br label %bb4.i5.i

bb4.i5.i:                                         ; preds = %bb2.i3.i, %bb1.i
  %iftmp.17.0.i4.i = phi i32 [ %1, %bb2.i3.i ], [ 1, %bb1.i ] ; <i32> [#uses=3]
  %2 = icmp eq i32 %tmp10.i, 0                    ; <i1> [#uses=1]
  br i1 %2, label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb4.i5.i
  %3 = add nsw i32 %iftmp.17.0.i4.i, 1            ; <i32> [#uses=1]
  br label %bb4.i

bb1.i.i.i:                                        ; preds = %bb4.i5.i
  %4 = icmp eq i32 %iftmp.17.0.i4.i, 0            ; <i1> [#uses=1]
  br i1 %4, label %bb4.i.i.i, label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb1.i.i.i
  %5 = add i32 %iftmp.17.0.i4.i, -1               ; <i32> [#uses=1]
  %6 = tail call fastcc i32 @ack(i32 %tmp10.i, i32 %5) nounwind ; <i32> [#uses=1]
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb2.i.i.i, %bb1.i.i.i
  %iftmp.17.0.i.i.i = phi i32 [ %6, %bb2.i.i.i ], [ 1, %bb1.i.i.i ] ; <i32> [#uses=1]
  %7 = tail call fastcc i32 @ack(i32 %tmp12.i1420, i32 %iftmp.17.0.i.i.i) nounwind ; <i32> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %bb4.i.i.i, %bb.i.i.i, %bb1.i
  %iftmp.17.0.i = phi i32 [ %7, %bb4.i.i.i ], [ %3, %bb.i.i.i ], [ 1, %bb1.i ] ; <i32> [#uses=3]
  %8 = icmp eq i32 %tmp10.i, 0                    ; <i1> [#uses=1]
  br i1 %8, label %fibFP.exit22, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb4.i
  %9 = icmp eq i32 %iftmp.17.0.i, 0               ; <i1> [#uses=1]
  br i1 %9, label %bb4.i.i, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i.i
  %10 = add i32 %iftmp.17.0.i, -1                 ; <i32> [#uses=1]
  %11 = tail call fastcc i32 @ack(i32 %tmp10.i, i32 %10) nounwind ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb2.i.i, %bb1.i.i
  %iftmp.17.0.i.i = phi i32 [ %11, %bb2.i.i ], [ 1, %bb1.i.i ] ; <i32> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb1.i

fibFP.exit22:                                     ; preds = %bb4.i
  %12 = add i32 %iftmp.17.0.i, 1                  ; <i32> [#uses=1]
  %13 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 11, i32 %12) nounwind ; <i32> [#uses=0]
  %14 = tail call fastcc double @fibFP(double 3.000000e+01) nounwind ; <double> [#uses=3]
  %15 = tail call fastcc double @fibFP(double 2.900000e+01) nounwind ; <double> [#uses=3]
  %16 = fadd double %15, %14                      ; <double> [#uses=1]
  %17 = fadd double %14, %16                      ; <double> [#uses=1]
  %18 = tail call fastcc double @fibFP(double 3.100000e+01) nounwind ; <double> [#uses=3]
  %19 = tail call fastcc double @fibFP(double 3.200000e+01) nounwind ; <double> [#uses=3]
  %20 = fadd double %18, %19                      ; <double> [#uses=2]
  %21 = fadd double %17, %20                      ; <double> [#uses=2]
  %22 = tail call fastcc double @fibFP(double 2.800000e+01) nounwind ; <double> [#uses=1]
  %23 = fadd double %22, %15                      ; <double> [#uses=1]
  %24 = fadd double %15, %23                      ; <double> [#uses=1]
  %25 = fadd double %14, %18                      ; <double> [#uses=2]
  %26 = fadd double %24, %25                      ; <double> [#uses=1]
  %27 = fadd double %26, %21                      ; <double> [#uses=1]
  %28 = fadd double %21, %27                      ; <double> [#uses=1]
  %29 = fadd double %18, %25                      ; <double> [#uses=1]
  %30 = tail call fastcc double @fibFP(double 3.300000e+01) nounwind ; <double> [#uses=2]
  %31 = fadd double %19, %30                      ; <double> [#uses=1]
  %32 = fadd double %29, %31                      ; <double> [#uses=1]
  %33 = fadd double %19, %20                      ; <double> [#uses=1]
  %34 = tail call fastcc double @fibFP(double 3.400000e+01) nounwind ; <double> [#uses=1]
  %35 = fadd double %30, %34                      ; <double> [#uses=1]
  %36 = fadd double %33, %35                      ; <double> [#uses=1]
  %37 = fadd double %32, %36                      ; <double> [#uses=1]
  %38 = fadd double %28, %37                      ; <double> [#uses=1]
  %39 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0), double 3.800000e+01, double %38) nounwind ; <i32> [#uses=0]
  br label %bb.i8

bb.i8:                                            ; preds = %tak.exit.i, %fibFP.exit22
  %z.tr3.i5 = phi i32 [ 10, %fibFP.exit22 ], [ %41, %tak.exit.i ] ; <i32> [#uses=5]
  %y.tr2.i6 = phi i32 [ 20, %fibFP.exit22 ], [ %50, %tak.exit.i ] ; <i32> [#uses=4]
  %x.tr1.i7 = phi i32 [ 30, %fibFP.exit22 ], [ %52, %tak.exit.i ] ; <i32> [#uses=6]
  %40 = add i32 %z.tr3.i5, -1                     ; <i32> [#uses=2]
  %41 = tail call fastcc i32 @tak(i32 %40, i32 %x.tr1.i7, i32 %y.tr2.i6) nounwind ; <i32> [#uses=2]
  %42 = add i32 %y.tr2.i6, -1                     ; <i32> [#uses=3]
  %43 = icmp sgt i32 %42, %z.tr3.i5               ; <i1> [#uses=1]
  br i1 %43, label %bb.i.i9, label %tak.exit.i

bb.i.i9:                                          ; preds = %bb.i8
  %44 = add i32 %x.tr1.i7, -1                     ; <i32> [#uses=1]
  %45 = tail call fastcc i32 @tak(i32 %44, i32 %42, i32 %z.tr3.i5) nounwind ; <i32> [#uses=1]
  %46 = tail call fastcc i32 @tak(i32 %40, i32 %x.tr1.i7, i32 %42) nounwind ; <i32> [#uses=1]
  %47 = add i32 %y.tr2.i6, -2                     ; <i32> [#uses=1]
  %48 = tail call fastcc i32 @tak(i32 %47, i32 %z.tr3.i5, i32 %x.tr1.i7) nounwind ; <i32> [#uses=1]
  %49 = tail call fastcc i32 @tak(i32 %48, i32 %46, i32 %45) nounwind ; <i32> [#uses=1]
  br label %tak.exit.i

tak.exit.i:                                       ; preds = %bb.i.i9, %bb.i8
  %50 = phi i32 [ %49, %bb.i.i9 ], [ %x.tr1.i7, %bb.i8 ] ; <i32> [#uses=2]
  %51 = add i32 %x.tr1.i7, -1                     ; <i32> [#uses=1]
  %52 = tail call fastcc i32 @tak(i32 %51, i32 %y.tr2.i6, i32 %z.tr3.i5) nounwind ; <i32> [#uses=2]
  %53 = icmp slt i32 %50, %52                     ; <i1> [#uses=1]
  br i1 %53, label %bb.i8, label %fib.exit

fib.exit:                                         ; preds = %tak.exit.i
  %54 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 30, i32 20, i32 10, i32 %41) nounwind ; <i32> [#uses=0]
  %55 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0), i32 3) nounwind ; <i32> [#uses=0]
  br label %bb.i1

bb.i1:                                            ; preds = %takFP.exit.i, %fib.exit
  %z.tr3.i = phi double [ 1.000000e+00, %fib.exit ], [ %57, %takFP.exit.i ] ; <double> [#uses=5]
  %y.tr2.i = phi double [ 2.000000e+00, %fib.exit ], [ %66, %takFP.exit.i ] ; <double> [#uses=3]
  %x.tr1.i = phi double [ 3.000000e+00, %fib.exit ], [ %68, %takFP.exit.i ] ; <double> [#uses=6]
  %56 = fadd double %z.tr3.i, -1.000000e+00       ; <double> [#uses=2]
  %57 = tail call fastcc double @takFP(double %56, double %x.tr1.i, double %y.tr2.i) nounwind ; <double> [#uses=2]
  %58 = fadd double %y.tr2.i, -1.000000e+00       ; <double> [#uses=4]
  %59 = fcmp ogt double %58, %z.tr3.i             ; <i1> [#uses=1]
  br i1 %59, label %bb.i.i2, label %takFP.exit.i

bb.i.i2:                                          ; preds = %bb.i1
  %60 = fadd double %x.tr1.i, -1.000000e+00       ; <double> [#uses=1]
  %61 = tail call fastcc double @takFP(double %60, double %58, double %z.tr3.i) nounwind ; <double> [#uses=1]
  %62 = tail call fastcc double @takFP(double %56, double %x.tr1.i, double %58) nounwind ; <double> [#uses=1]
  %63 = fadd double %58, -1.000000e+00            ; <double> [#uses=1]
  %64 = tail call fastcc double @takFP(double %63, double %z.tr3.i, double %x.tr1.i) nounwind ; <double> [#uses=1]
  %65 = tail call fastcc double @takFP(double %64, double %62, double %61) nounwind ; <double> [#uses=1]
  br label %takFP.exit.i

takFP.exit.i:                                     ; preds = %bb.i.i2, %bb.i1
  %66 = phi double [ %65, %bb.i.i2 ], [ %x.tr1.i, %bb.i1 ] ; <double> [#uses=2]
  %67 = fadd double %x.tr1.i, -1.000000e+00       ; <double> [#uses=1]
  %68 = tail call fastcc double @takFP(double %67, double %y.tr2.i, double %z.tr3.i) nounwind ; <double> [#uses=2]
  %69 = fcmp olt double %66, %68                  ; <i1> [#uses=1]
  br i1 %69, label %bb.i1, label %takFP.exit

takFP.exit:                                       ; preds = %takFP.exit.i
  %70 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str4, i32 0, i32 0), double %57) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
