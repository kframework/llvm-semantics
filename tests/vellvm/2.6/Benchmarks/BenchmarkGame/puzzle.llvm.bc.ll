; ModuleID = 'puzzle.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [21 x i8] c"Found duplicate: %d\0A\00", align 1 ; <[21 x i8]*> [#uses=1]

declare i32 @rand() nounwind

define i32 @main() nounwind {
entry:
  tail call void @srand(i32 1) nounwind
  br label %bb

bb:                                               ; preds = %bb3, %entry
  %i.09 = phi i32 [ 0, %entry ], [ %26, %bb3 ]    ; <i32> [#uses=1]
  %0 = malloc [500001 x i32]                      ; <[500001 x i32]*> [#uses=6]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb
  %1 = phi i32 [ 0, %bb ], [ %2, %bb.i ]          ; <i32> [#uses=3]
  %scevgep.i = getelementptr [500001 x i32]* %0, i32 0, i32 %1 ; <i32*> [#uses=1]
  store i32 %1, i32* %scevgep.i, align 4
  %2 = add nsw i32 %1, 1                          ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %2, 500001              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2.i, label %bb.i

bb2.i:                                            ; preds = %bb.i
  %.sub = getelementptr inbounds [500001 x i32]* %0, i32 0, i32 0 ; <i32*> [#uses=1]
  %3 = tail call i32 @rand() nounwind             ; <i32> [#uses=1]
  %4 = sitofp i32 %3 to double                    ; <double> [#uses=1]
  %5 = fmul double %4, 0x3E00000000000000         ; <double> [#uses=1]
  %6 = fmul double %5, 5.000000e+05               ; <double> [#uses=1]
  %7 = fptosi double %6 to i32                    ; <i32> [#uses=2]
  %not..i = icmp ne i32 %7, 500000                ; <i1> [#uses=1]
  %8 = zext i1 %not..i to i32                     ; <i32> [#uses=1]
  %iftmp.17.0.i.i = add i32 %8, %7                ; <i32> [#uses=1]
  store i32 %iftmp.17.0.i.i, i32* %.sub, align 4
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb2.i
  %indvar.i.i = phi i32 [ 0, %bb2.i ], [ %indvar.next.i.i, %bb.i.i ] ; <i32> [#uses=3]
  %i.0.in1.i.i = sub i32 500001, %indvar.i.i      ; <i32> [#uses=2]
  %tmp14 = sub i32 500000, %indvar.i.i            ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr [500001 x i32]* %0, i32 0, i32 %tmp14 ; <i32*> [#uses=2]
  %9 = uitofp i32 %i.0.in1.i.i to double          ; <double> [#uses=1]
  %10 = tail call i32 @rand() nounwind            ; <i32> [#uses=1]
  %11 = sitofp i32 %10 to double                  ; <double> [#uses=1]
  %12 = fmul double %11, 0x3E00000000000000       ; <double> [#uses=1]
  %13 = fmul double %9, %12                       ; <double> [#uses=1]
  %14 = fptosi double %13 to i32                  ; <i32> [#uses=3]
  %15 = icmp eq i32 %14, %i.0.in1.i.i             ; <i1> [#uses=1]
  %16 = add i32 %14, -1                           ; <i32> [#uses=1]
  %iftmp.18.0.i.i = select i1 %15, i32 %16, i32 %14 ; <i32> [#uses=1]
  %17 = load i32* %scevgep.i.i, align 4           ; <i32> [#uses=1]
  %18 = getelementptr inbounds [500001 x i32]* %0, i32 0, i32 %iftmp.18.0.i.i ; <i32*> [#uses=2]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  store i32 %19, i32* %scevgep.i.i, align 4
  store i32 %17, i32* %18, align 4
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=2]
  %exitcond12 = icmp eq i32 %indvar.next.i.i, 500000 ; <i1> [#uses=1]
  br i1 %exitcond12, label %bb.i3.preheader, label %bb.i.i

bb.i3:                                            ; preds = %bb.i3.preheader, %bb.i3
  %i.02.i = phi i32 [ 0, %bb.i3.preheader ], [ %tmp.i, %bb.i3 ] ; <i32> [#uses=2]
  %result.01.i = phi i32 [ 0, %bb.i3.preheader ], [ %22, %bb.i3 ] ; <i32> [#uses=1]
  %tmp.i = add i32 %i.02.i, 1                     ; <i32> [#uses=3]
  %scevgep.i1 = getelementptr [500001 x i32]* %0, i32 0, i32 %i.02.i ; <i32*> [#uses=1]
  %20 = load i32* %scevgep.i1, align 4            ; <i32> [#uses=1]
  %21 = xor i32 %tmp.i, %result.01.i              ; <i32> [#uses=1]
  %22 = xor i32 %21, %20                          ; <i32> [#uses=2]
  %exitcond15 = icmp eq i32 %tmp.i, 500001        ; <i1> [#uses=1]
  br i1 %exitcond15, label %findDuplicate.exit, label %bb.i3

findDuplicate.exit:                               ; preds = %bb.i3
  %23 = add i32 %j.06, 1                          ; <i32> [#uses=2]
  %exitcond18 = icmp eq i32 %23, 200              ; <i1> [#uses=1]
  br i1 %exitcond18, label %bb3, label %bb.i3.preheader

bb.i3.preheader:                                  ; preds = %findDuplicate.exit, %bb.i.i
  %j.06 = phi i32 [ %23, %findDuplicate.exit ], [ 0, %bb.i.i ] ; <i32> [#uses=1]
  br label %bb.i3

bb3:                                              ; preds = %findDuplicate.exit
  %24 = xor i32 %22, 500001                       ; <i32> [#uses=1]
  free [500001 x i32]* %0
  %25 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %24) nounwind ; <i32> [#uses=0]
  %26 = add nsw i32 %i.09, 1                      ; <i32> [#uses=2]
  %exitcond19 = icmp eq i32 %26, 5                ; <i1> [#uses=1]
  br i1 %exitcond19, label %bb5, label %bb

bb5:                                              ; preds = %bb3
  ret i32 0
}

declare void @srand(i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
