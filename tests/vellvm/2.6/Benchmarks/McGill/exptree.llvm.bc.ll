; ModuleID = 'exptree.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.Comb = type { i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external global %struct._IO_FILE*        ; <%struct._IO_FILE**> [#uses=3]
@.str1 = private constant [3 x i8] c"%d\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str2 = private constant [6 x i8] c" d%d \00", align 1 ; <[6 x i8]*> [#uses=1]
@.str3 = private constant [6 x i8] c"%d=%d\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str4 = private constant [3 x i8] c"; \00", align 1 ; <[3 x i8]*> [#uses=1]
@.str5 = private constant [2 x i8] c".\00", align 1 ; <[2 x i8]*> [#uses=1]
@stopSearch.b = internal global i1 false          ; <i1*> [#uses=4]
@nbNodes = internal global i32 0                  ; <i32*> [#uses=3]
@dmax = internal global i32 0                     ; <i32*> [#uses=3]
@workList = internal global i32* null             ; <i32**> [#uses=6]
@listLength = internal global i32 0               ; <i32*> [#uses=13]
@goal = internal global i32 0                     ; <i32*> [#uses=5]
@best = internal global i32 0                     ; <i32*> [#uses=6]
@bestDepth = internal global i32 0                ; <i32*> [#uses=2]
@combList = internal global %struct.Comb* null    ; <%struct.Comb**> [#uses=8]
@solution = internal global %struct.Comb* null    ; <%struct.Comb**> [#uses=4]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=3]
@.str6 = private constant [36 x i8] c"Out of memory for combination list\0A\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str7 = private constant [29 x i8] c"Out of memory for work list\0A\00", align 1 ; <[29 x i8]*> [#uses=1]

declare i32 @_IO_getc(%struct._IO_FILE* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32) nounwind

define internal fastcc void @printSolution(%struct.Comb* nocapture %combList, i32 %length) nounwind {
entry:
  %0 = icmp sgt i32 %length, 0                    ; <i1> [#uses=1]
  br i1 %0, label %bb.nph, label %bb12

bb.nph:                                           ; preds = %entry
  %1 = add i32 %length, -1                        ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb10, %bb.nph
  %2 = phi i32 [ 0, %bb.nph ], [ %31, %bb10 ]     ; <i32> [#uses=5]
  %scevgep = getelementptr %struct.Comb* %combList, i32 %2, i32 2 ; <i32*> [#uses=2]
  %scevgep2 = getelementptr %struct.Comb* %combList, i32 %2, i32 1 ; <i32*> [#uses=5]
  %scevgep34 = getelementptr inbounds %struct.Comb* %combList, i32 %2, i32 0 ; <i32*> [#uses=5]
  %3 = load i32* %scevgep34, align 4              ; <i32> [#uses=1]
  %4 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %3) nounwind ; <i32> [#uses=0]
  %5 = load i32* %scevgep, align 4                ; <i32> [#uses=2]
  switch i32 %5, label %bb6 [
    i32 0, label %bb1
    i32 1, label %bb2
    i32 2, label %bb3
    i32 3, label %bb4
    i32 4, label %bb5
  ]

bb1:                                              ; preds = %bb
  %6 = tail call i32 @putchar(i32 32) nounwind    ; <i32> [#uses=0]
  br label %bb7

bb2:                                              ; preds = %bb
  %7 = tail call i32 @putchar(i32 43) nounwind    ; <i32> [#uses=0]
  br label %bb7

bb3:                                              ; preds = %bb
  %8 = tail call i32 @putchar(i32 45) nounwind    ; <i32> [#uses=0]
  br label %bb7

bb4:                                              ; preds = %bb
  %9 = tail call i32 @putchar(i32 42) nounwind    ; <i32> [#uses=0]
  br label %bb7

bb5:                                              ; preds = %bb
  %10 = tail call i32 @putchar(i32 58) nounwind   ; <i32> [#uses=0]
  br label %bb7

bb6:                                              ; preds = %bb
  %11 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i32 %5) nounwind ; <i32> [#uses=0]
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5, %bb4, %bb3, %bb2, %bb1
  %12 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  switch i32 %12, label %calculate.exit [
    i32 1, label %bb.i
    i32 2, label %bb1.i
    i32 3, label %bb2.i
    i32 4, label %bb3.i
  ]

bb.i:                                             ; preds = %bb7
  %13 = load i32* %scevgep34, align 4             ; <i32> [#uses=1]
  %14 = load i32* %scevgep2, align 4              ; <i32> [#uses=1]
  %15 = add nsw i32 %14, %13                      ; <i32> [#uses=1]
  br label %calculate.exit

bb1.i:                                            ; preds = %bb7
  %16 = load i32* %scevgep34, align 4             ; <i32> [#uses=1]
  %17 = load i32* %scevgep2, align 4              ; <i32> [#uses=1]
  %18 = sub i32 %16, %17                          ; <i32> [#uses=1]
  br label %calculate.exit

bb2.i:                                            ; preds = %bb7
  %19 = load i32* %scevgep34, align 4             ; <i32> [#uses=1]
  %20 = load i32* %scevgep2, align 4              ; <i32> [#uses=1]
  %21 = mul i32 %20, %19                          ; <i32> [#uses=1]
  br label %calculate.exit

bb3.i:                                            ; preds = %bb7
  %22 = load i32* %scevgep34, align 4             ; <i32> [#uses=1]
  %23 = load i32* %scevgep2, align 4              ; <i32> [#uses=1]
  %24 = sdiv i32 %22, %23                         ; <i32> [#uses=1]
  br label %calculate.exit

calculate.exit:                                   ; preds = %bb3.i, %bb2.i, %bb1.i, %bb.i, %bb7
  %25 = phi i32 [ %24, %bb3.i ], [ %21, %bb2.i ], [ %18, %bb1.i ], [ %15, %bb.i ], [ 0, %bb7 ] ; <i32> [#uses=1]
  %26 = load i32* %scevgep2, align 4              ; <i32> [#uses=1]
  %27 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 %26, i32 %25) nounwind ; <i32> [#uses=0]
  %28 = icmp sgt i32 %1, %2                       ; <i1> [#uses=1]
  br i1 %28, label %bb8, label %bb9

bb8:                                              ; preds = %calculate.exit
  %29 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb10

bb9:                                              ; preds = %calculate.exit
  %30 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb10

bb10:                                             ; preds = %bb9, %bb8
  %31 = add nsw i32 %2, 1                         ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %31, %length            ; <i1> [#uses=1]
  br i1 %exitcond, label %bb12, label %bb

bb12:                                             ; preds = %bb10, %entry
  %32 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  ret void
}

declare i32 @puts(i8* nocapture) nounwind

define internal fastcc void @recSearch(i32 %searchDepth, i32 %usedMask) nounwind {
entry:
  %.b = load i1* @stopSearch.b                    ; <i1> [#uses=1]
  br i1 %.b, label %return, label %bb

bb:                                               ; preds = %entry
  %0 = load i32* @nbNodes, align 4                ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1                          ; <i32> [#uses=1]
  store i32 %1, i32* @nbNodes, align 4
  %2 = load i32* @dmax, align 4                   ; <i32> [#uses=1]
  %3 = icmp eq i32 %2, %searchDepth               ; <i1> [#uses=1]
  br i1 %3, label %bb1, label %bb38.preheader

bb38.preheader:                                   ; preds = %bb
  %4 = add nsw i32 %searchDepth, 1                ; <i32> [#uses=1]
  br label %bb36.preheader

bb1:                                              ; preds = %bb
  %5 = load i32** @workList, align 4              ; <i32*> [#uses=1]
  %6 = load i32* @listLength, align 4             ; <i32> [#uses=1]
  %7 = add nsw i32 %searchDepth, -1               ; <i32> [#uses=1]
  %8 = add i32 %7, %6                             ; <i32> [#uses=1]
  %9 = getelementptr inbounds i32* %5, i32 %8     ; <i32*> [#uses=1]
  %10 = load i32* %9, align 4                     ; <i32> [#uses=2]
  %11 = load i32* @goal, align 4                  ; <i32> [#uses=2]
  %12 = sub i32 %10, %11                          ; <i32> [#uses=3]
  %neg = sub i32 0, %12                           ; <i32> [#uses=1]
  %abscond = icmp sgt i32 %12, -1                 ; <i1> [#uses=1]
  %abs = select i1 %abscond, i32 %12, i32 %neg    ; <i32> [#uses=1]
  %13 = load i32* @best, align 4                  ; <i32> [#uses=1]
  %14 = sub i32 %13, %11                          ; <i32> [#uses=3]
  %neg3 = sub i32 0, %14                          ; <i32> [#uses=1]
  %abscond4 = icmp sgt i32 %14, -1                ; <i1> [#uses=1]
  %abs5 = select i1 %abscond4, i32 %14, i32 %neg3 ; <i32> [#uses=1]
  %15 = icmp slt i32 %abs, %abs5                  ; <i1> [#uses=1]
  br i1 %15, label %bb7, label %return

bb7:                                              ; preds = %bb1
  store i32 %10, i32* @best, align 4
  store i32 %searchDepth, i32* @bestDepth, align 4
  %16 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=3]
  %17 = load %struct.Comb** @solution, align 4    ; <%struct.Comb*> [#uses=4]
  %18 = icmp sgt i32 %searchDepth, 0              ; <i1> [#uses=1]
  br i1 %18, label %bb.i, label %saveSolution.exit

bb.i:                                             ; preds = %bb.i, %bb7
  %i.01.i = phi i32 [ %23, %bb.i ], [ 0, %bb7 ]   ; <i32> [#uses=7]
  %scevgep78.i = getelementptr inbounds %struct.Comb* %16, i32 %i.01.i, i32 0 ; <i32*> [#uses=1]
  %scevgep4.i = getelementptr %struct.Comb* %16, i32 %i.01.i, i32 1 ; <i32*> [#uses=1]
  %scevgep3.i = getelementptr %struct.Comb* %17, i32 %i.01.i, i32 1 ; <i32*> [#uses=1]
  %scevgep2.i = getelementptr %struct.Comb* %16, i32 %i.01.i, i32 2 ; <i32*> [#uses=1]
  %scevgep.i = getelementptr %struct.Comb* %17, i32 %i.01.i, i32 2 ; <i32*> [#uses=1]
  %19 = load i32* %scevgep78.i, align 4           ; <i32> [#uses=1]
  %20 = getelementptr inbounds %struct.Comb* %17, i32 %i.01.i, i32 0 ; <i32*> [#uses=1]
  store i32 %19, i32* %20
  %21 = load i32* %scevgep4.i, align 4            ; <i32> [#uses=1]
  store i32 %21, i32* %scevgep3.i, align 4
  %22 = load i32* %scevgep2.i, align 4            ; <i32> [#uses=1]
  store i32 %22, i32* %scevgep.i, align 4
  %23 = add nsw i32 %i.01.i, 1                    ; <i32> [#uses=2]
  %exitcond13 = icmp eq i32 %23, %searchDepth     ; <i1> [#uses=1]
  br i1 %exitcond13, label %saveSolution.exit, label %bb.i

saveSolution.exit:                                ; preds = %bb.i, %bb7
  %24 = getelementptr inbounds %struct.Comb* %17, i32 %searchDepth, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %24, align 4
  %25 = load i32* @best, align 4                  ; <i32> [#uses=1]
  %26 = load i32* @goal, align 4                  ; <i32> [#uses=1]
  %27 = icmp eq i32 %25, %26                      ; <i1> [#uses=1]
  br i1 %27, label %bb8, label %return

bb8:                                              ; preds = %saveSolution.exit
  %28 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=1]
  tail call fastcc void @printSolution(%struct.Comb* %28, i32 %searchDepth) nounwind
  store i1 true, i1* @stopSearch.b
  ret void

bb.nph5:                                          ; preds = %bb36.preheader
  %tmp12 = add i32 %indvar, -2                    ; <i32> [#uses=1]
  %29 = icmp ugt i32 %tmp12, 1                    ; <i1> [#uses=1]
  %30 = icmp eq i32 %currOp.06, 4                 ; <i1> [#uses=2]
  %31 = icmp eq i32 %currOp.06, 2                 ; <i1> [#uses=1]
  %32 = or i1 %30, %31                            ; <i1> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb35, %bb.nph5
  %33 = phi i32 [ 0, %bb.nph5 ], [ %tmp8, %bb35 ] ; <i32> [#uses=5]
  %tmp8 = add i32 %33, 1                          ; <i32> [#uses=2]
  %tmp1 = shl i32 1, %33                          ; <i32> [#uses=2]
  %34 = and i32 %tmp1, %usedMask                  ; <i32> [#uses=1]
  %toBool = icmp eq i32 %34, 0                    ; <i1> [#uses=1]
  %35 = icmp sgt i32 %33, 0                       ; <i1> [#uses=1]
  %or.cond22 = and i1 %toBool, %35                ; <i1> [#uses=1]
  br i1 %or.cond22, label %bb.nph, label %bb35

bb.nph:                                           ; preds = %bb11
  %36 = or i32 %tmp1, %usedMask                   ; <i32> [#uses=1]
  br label %bb13

bb13:                                             ; preds = %bb33, %bb.nph
  %37 = phi i32 [ 0, %bb.nph ], [ %86, %bb33 ]    ; <i32> [#uses=3]
  %tmp = shl i32 1, %37                           ; <i32> [#uses=2]
  %38 = and i32 %tmp, %usedMask                   ; <i32> [#uses=1]
  %toBool14 = icmp eq i32 %38, 0                  ; <i1> [#uses=1]
  br i1 %toBool14, label %bb15, label %bb33

bb15:                                             ; preds = %bb13
  %39 = load i32** @workList, align 4             ; <i32*> [#uses=2]
  %scevgep9 = getelementptr i32* %39, i32 %33     ; <i32*> [#uses=1]
  %40 = load i32* %scevgep9, align 4              ; <i32> [#uses=6]
  %scevgep = getelementptr i32* %39, i32 %37      ; <i32*> [#uses=1]
  %41 = load i32* %scevgep, align 4               ; <i32> [#uses=6]
  br i1 %29, label %bb20, label %bb16

bb16:                                             ; preds = %bb15
  %42 = icmp eq i32 %40, 1                        ; <i1> [#uses=1]
  %43 = icmp eq i32 %41, 1                        ; <i1> [#uses=1]
  %44 = or i1 %43, %42                            ; <i1> [#uses=1]
  br i1 %44, label %bb33, label %bb20

bb20:                                             ; preds = %bb16, %bb15
  %45 = icmp eq i32 %40, 0                        ; <i1> [#uses=1]
  %46 = icmp eq i32 %41, 0                        ; <i1> [#uses=1]
  %47 = or i1 %46, %45                            ; <i1> [#uses=1]
  br i1 %47, label %bb33, label %bb24

bb24:                                             ; preds = %bb20
  br i1 %30, label %bb25, label %bb26

bb25:                                             ; preds = %bb24
  %48 = srem i32 %40, %41                         ; <i32> [#uses=1]
  %49 = icmp eq i32 %48, 0                        ; <i1> [#uses=1]
  br i1 %49, label %bb26, label %bb33

bb26:                                             ; preds = %bb25, %bb24
  %50 = icmp slt i32 %40, %41                     ; <i1> [#uses=1]
  %or.cond = and i1 %50, %32                      ; <i1> [#uses=2]
  %working1.0 = select i1 %or.cond, i32 %41, i32 %40 ; <i32> [#uses=1]
  %working2.0 = select i1 %or.cond, i32 %40, i32 %41 ; <i32> [#uses=1]
  %51 = or i32 %36, %tmp                          ; <i32> [#uses=1]
  %52 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=1]
  %53 = getelementptr inbounds %struct.Comb* %52, i32 %searchDepth, i32 0 ; <i32*> [#uses=1]
  store i32 %working1.0, i32* %53, align 4
  %54 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=1]
  %55 = getelementptr inbounds %struct.Comb* %54, i32 %searchDepth, i32 1 ; <i32*> [#uses=1]
  store i32 %working2.0, i32* %55, align 4
  %56 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=1]
  %57 = getelementptr inbounds %struct.Comb* %56, i32 %searchDepth, i32 2 ; <i32*> [#uses=1]
  store i32 %currOp.06, i32* %57, align 4
  %58 = load i32** @workList, align 4             ; <i32*> [#uses=1]
  %59 = load i32* @listLength, align 4            ; <i32> [#uses=1]
  %60 = add nsw i32 %59, %searchDepth             ; <i32> [#uses=1]
  %61 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=9]
  %62 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 2 ; <i32*> [#uses=1]
  %63 = load i32* %62, align 4                    ; <i32> [#uses=1]
  switch i32 %63, label %calculate.exit [
    i32 1, label %bb.i2
    i32 2, label %bb1.i
    i32 3, label %bb2.i
    i32 4, label %bb3.i
  ]

bb.i2:                                            ; preds = %bb26
  %64 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 0 ; <i32*> [#uses=1]
  %65 = load i32* %64, align 4                    ; <i32> [#uses=1]
  %66 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 1 ; <i32*> [#uses=1]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=1]
  %68 = add nsw i32 %67, %65                      ; <i32> [#uses=1]
  br label %calculate.exit

bb1.i:                                            ; preds = %bb26
  %69 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 0 ; <i32*> [#uses=1]
  %70 = load i32* %69, align 4                    ; <i32> [#uses=1]
  %71 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 1 ; <i32*> [#uses=1]
  %72 = load i32* %71, align 4                    ; <i32> [#uses=1]
  %73 = sub i32 %70, %72                          ; <i32> [#uses=1]
  br label %calculate.exit

bb2.i:                                            ; preds = %bb26
  %74 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 0 ; <i32*> [#uses=1]
  %75 = load i32* %74, align 4                    ; <i32> [#uses=1]
  %76 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 1 ; <i32*> [#uses=1]
  %77 = load i32* %76, align 4                    ; <i32> [#uses=1]
  %78 = mul i32 %77, %75                          ; <i32> [#uses=1]
  br label %calculate.exit

bb3.i:                                            ; preds = %bb26
  %79 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 0 ; <i32*> [#uses=1]
  %80 = load i32* %79, align 4                    ; <i32> [#uses=1]
  %81 = getelementptr inbounds %struct.Comb* %61, i32 %searchDepth, i32 1 ; <i32*> [#uses=1]
  %82 = load i32* %81, align 4                    ; <i32> [#uses=1]
  %83 = sdiv i32 %80, %82                         ; <i32> [#uses=1]
  br label %calculate.exit

calculate.exit:                                   ; preds = %bb3.i, %bb2.i, %bb1.i, %bb.i2, %bb26
  %84 = phi i32 [ %83, %bb3.i ], [ %78, %bb2.i ], [ %73, %bb1.i ], [ %68, %bb.i2 ], [ 0, %bb26 ] ; <i32> [#uses=1]
  %85 = getelementptr inbounds i32* %58, i32 %60  ; <i32*> [#uses=1]
  store i32 %84, i32* %85, align 4
  tail call fastcc void @recSearch(i32 %4, i32 %51) nounwind
  br label %bb33

bb33:                                             ; preds = %calculate.exit, %bb25, %bb20, %bb16, %bb13
  %86 = add nsw i32 %37, 1                        ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %86, %33                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb35, label %bb13

bb35:                                             ; preds = %bb33, %bb11
  %87 = load i32* @listLength, align 4            ; <i32> [#uses=1]
  %88 = add nsw i32 %87, %searchDepth             ; <i32> [#uses=1]
  %89 = icmp sgt i32 %88, %tmp8                   ; <i1> [#uses=1]
  br i1 %89, label %bb11, label %bb37

bb37:                                             ; preds = %bb36.preheader, %bb35
  %exitcond10 = icmp eq i32 %currOp.06, 4         ; <i1> [#uses=1]
  br i1 %exitcond10, label %return, label %bb36.preheader

bb36.preheader:                                   ; preds = %bb37, %bb38.preheader
  %indvar = phi i32 [ 0, %bb38.preheader ], [ %currOp.06, %bb37 ] ; <i32> [#uses=2]
  %currOp.06 = add i32 %indvar, 1                 ; <i32> [#uses=5]
  %90 = load i32* @listLength, align 4            ; <i32> [#uses=1]
  %91 = add nsw i32 %90, %searchDepth             ; <i32> [#uses=1]
  %92 = icmp sgt i32 %91, 0                       ; <i1> [#uses=1]
  br i1 %92, label %bb.nph5, label %bb37

return:                                           ; preds = %bb37, %saveSolution.exit, %bb1, %entry
  ret void
}

declare noalias i8* @calloc(i32, i32) nounwind

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

declare void @exit(i32) noreturn nounwind

declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) nounwind

declare i32 @fscanf(%struct._IO_FILE* noalias nocapture, i8* noalias nocapture, ...) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %nums.i = alloca [16 x i32], align 4            ; <[16 x i32]*> [#uses=7]
  %0 = getelementptr inbounds [16 x i32]* %nums.i, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4
  %1 = getelementptr inbounds [16 x i32]* %nums.i, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 32, i32* %1, align 4
  %2 = getelementptr inbounds [16 x i32]* %nums.i, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 14, i32* %2, align 4
  %3 = getelementptr inbounds [16 x i32]* %nums.i, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 1412, i32* %3, align 4
  br label %bb1.i

bb.i:                                             ; preds = %bb1.i
  %scevgep.i = getelementptr [16 x i32]* %nums.i, i32 0, i32 %9 ; <i32*> [#uses=1]
  %4 = load %struct._IO_FILE** @stdin, align 4    ; <%struct._IO_FILE*> [#uses=1]
  %5 = call i32 @ungetc(i32 %11, %struct._IO_FILE* %4) nounwind ; <i32> [#uses=0]
  %6 = load %struct._IO_FILE** @stdin, align 4    ; <%struct._IO_FILE*> [#uses=1]
  %7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* noalias %6, i8* noalias getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32* %scevgep.i) nounwind ; <i32> [#uses=0]
  %8 = add i32 %9, 1                              ; <i32> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb.i, %entry
  %9 = phi i32 [ 0, %entry ], [ %8, %bb.i ]       ; <i32> [#uses=4]
  %10 = load %struct._IO_FILE** @stdin, align 4   ; <%struct._IO_FILE*> [#uses=1]
  %11 = call i32 @_IO_getc(%struct._IO_FILE* %10) nounwind ; <i32> [#uses=2]
  switch i32 %11, label %bb.i [
    i32 10, label %bb3.i
    i32 -1, label %bb3.i
  ]

bb3.i:                                            ; preds = %bb1.i, %bb1.i
  %12 = icmp eq i32 %9, 0                         ; <i1> [#uses=1]
  %i.0.op.i = add i32 %9, -1                      ; <i32> [#uses=1]
  %13 = select i1 %12, i32 3, i32 %i.0.op.i       ; <i32> [#uses=3]
  store i32 %13, i32* @listLength, align 4
  %14 = getelementptr inbounds [16 x i32]* %nums.i, i32 0, i32 %13 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  store i32 %15, i32* @goal, align 4
  %16 = shl i32 %13, 1                            ; <i32> [#uses=1]
  %17 = call noalias i8* @calloc(i32 %16, i32 4) nounwind ; <i8*> [#uses=2]
  %18 = icmp eq i8* %17, null                     ; <i1> [#uses=1]
  br i1 %18, label %bb1.i15.i, label %newWorkList.exit.i

bb1.i15.i:                                        ; preds = %bb3.i
  %19 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %20 = bitcast %struct._IO_FILE* %19 to i8*      ; <i8*> [#uses=1]
  %21 = call i32 @fwrite(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 1, i32 28, i8* %20) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

newWorkList.exit.i:                               ; preds = %bb3.i
  %22 = bitcast i8* %17 to i32*                   ; <i32*> [#uses=1]
  store i32* %22, i32** @workList, align 4
  %23 = load i32* @listLength, align 4            ; <i32> [#uses=1]
  %24 = call noalias i8* @calloc(i32 %23, i32 12) nounwind ; <i8*> [#uses=2]
  %25 = icmp eq i8* %24, null                     ; <i1> [#uses=1]
  br i1 %25, label %bb1.i12.i, label %newCombList.exit13.i

bb1.i12.i:                                        ; preds = %newWorkList.exit.i
  %26 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %27 = bitcast %struct._IO_FILE* %26 to i8*      ; <i8*> [#uses=1]
  %28 = call i32 @fwrite(i8* getelementptr inbounds ([36 x i8]* @.str6, i32 0, i32 0), i32 1, i32 35, i8* %27) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

newCombList.exit13.i:                             ; preds = %newWorkList.exit.i
  %29 = bitcast i8* %24 to %struct.Comb*          ; <%struct.Comb*> [#uses=1]
  store %struct.Comb* %29, %struct.Comb** @combList, align 4
  %30 = load i32* @listLength, align 4            ; <i32> [#uses=1]
  %31 = call noalias i8* @calloc(i32 %30, i32 12) nounwind ; <i8*> [#uses=2]
  %32 = icmp eq i8* %31, null                     ; <i1> [#uses=1]
  br i1 %32, label %bb1.i.i, label %newCombList.exit.i

bb1.i.i:                                          ; preds = %newCombList.exit13.i
  %33 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %34 = bitcast %struct._IO_FILE* %33 to i8*      ; <i8*> [#uses=1]
  %35 = call i32 @fwrite(i8* getelementptr inbounds ([36 x i8]* @.str6, i32 0, i32 0), i32 1, i32 35, i8* %34) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

newCombList.exit.i:                               ; preds = %newCombList.exit13.i
  %36 = bitcast i8* %31 to %struct.Comb*          ; <%struct.Comb*> [#uses=1]
  store %struct.Comb* %36, %struct.Comb** @solution, align 4
  %37 = load i32* @listLength, align 4            ; <i32> [#uses=5]
  %38 = load i32** @workList, align 4             ; <i32*> [#uses=1]
  %39 = icmp sgt i32 %37, 0                       ; <i1> [#uses=1]
  br i1 %39, label %bb.i9.i, label %initWorkList.exit.i

bb.i9.i:                                          ; preds = %bb.i9.i, %newCombList.exit.i
  %i.01.i6.i = phi i32 [ %41, %bb.i9.i ], [ 0, %newCombList.exit.i ] ; <i32> [#uses=3]
  %scevgep.i7.i = getelementptr [16 x i32]* %nums.i, i32 0, i32 %i.01.i6.i ; <i32*> [#uses=1]
  %scevgep2.i.i = getelementptr i32* %38, i32 %i.01.i6.i ; <i32*> [#uses=1]
  %40 = load i32* %scevgep.i7.i, align 4          ; <i32> [#uses=1]
  store i32 %40, i32* %scevgep2.i.i, align 4
  %41 = add nsw i32 %i.01.i6.i, 1                 ; <i32> [#uses=2]
  %exitcond18.i = icmp eq i32 %41, %37            ; <i1> [#uses=1]
  br i1 %exitcond18.i, label %initWorkList.exitthread-split.i, label %bb.i9.i

initWorkList.exitthread-split.i:                  ; preds = %bb.i9.i
  %.pr.i = load i32* @listLength                  ; <i32> [#uses=3]
  br label %initWorkList.exit.i

initWorkList.exit.i:                              ; preds = %initWorkList.exitthread-split.i, %newCombList.exit.i
  %.rle5 = phi i32 [ %.pr.i, %initWorkList.exitthread-split.i ], [ %37, %newCombList.exit.i ] ; <i32> [#uses=1]
  %.rle19.i = phi i32 [ %.pr.i, %initWorkList.exitthread-split.i ], [ %37, %newCombList.exit.i ] ; <i32> [#uses=1]
  %42 = phi i32 [ %.pr.i, %initWorkList.exitthread-split.i ], [ %37, %newCombList.exit.i ] ; <i32> [#uses=2]
  %43 = load %struct.Comb** @combList, align 4    ; <%struct.Comb*> [#uses=1]
  %44 = icmp sgt i32 %42, 0                       ; <i1> [#uses=1]
  br i1 %44, label %bb.i4.i, label %initCombList.exit5.i

bb.i4.i:                                          ; preds = %bb.i4.i, %initWorkList.exit.i
  %i.01.i1.i = phi i32 [ %45, %bb.i4.i ], [ 0, %initWorkList.exit.i ] ; <i32> [#uses=2]
  %scevgep.i2.i = getelementptr %struct.Comb* %43, i32 %i.01.i1.i, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep.i2.i, align 4
  %45 = add nsw i32 %i.01.i1.i, 1                 ; <i32> [#uses=2]
  %exitcond17.i = icmp eq i32 %45, %42            ; <i1> [#uses=1]
  br i1 %exitcond17.i, label %initCombList.exit5.loopexit.i, label %bb.i4.i

initCombList.exit5.loopexit.i:                    ; preds = %bb.i4.i
  %.pre.i = load i32* @listLength, align 4        ; <i32> [#uses=2]
  br label %initCombList.exit5.i

initCombList.exit5.i:                             ; preds = %initCombList.exit5.loopexit.i, %initWorkList.exit.i
  %.rle4 = phi i32 [ %.pre.i, %initCombList.exit5.loopexit.i ], [ %.rle5, %initWorkList.exit.i ] ; <i32> [#uses=1]
  %46 = phi i32 [ %.pre.i, %initCombList.exit5.loopexit.i ], [ %.rle19.i, %initWorkList.exit.i ] ; <i32> [#uses=2]
  %47 = load %struct.Comb** @solution, align 4    ; <%struct.Comb*> [#uses=1]
  %48 = icmp sgt i32 %46, 0                       ; <i1> [#uses=1]
  br i1 %48, label %bb.i.i, label %getInput.exit

bb.i.i:                                           ; preds = %bb.i.i, %initCombList.exit5.i
  %i.01.i.i = phi i32 [ %49, %bb.i.i ], [ 0, %initCombList.exit5.i ] ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr %struct.Comb* %47, i32 %i.01.i.i, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep.i.i, align 4
  %49 = add nsw i32 %i.01.i.i, 1                  ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %49, %46              ; <i1> [#uses=1]
  br i1 %exitcond.i, label %getInput.exit.loopexit, label %bb.i.i

getInput.exit.loopexit:                           ; preds = %bb.i.i
  %.pre = load i32* @listLength, align 4          ; <i32> [#uses=1]
  br label %getInput.exit

getInput.exit:                                    ; preds = %getInput.exit.loopexit, %initCombList.exit5.i
  %50 = phi i32 [ %.pre, %getInput.exit.loopexit ], [ %.rle4, %initCombList.exit5.i ] ; <i32> [#uses=1]
  %51 = icmp eq i32 %50, 0                        ; <i1> [#uses=1]
  br i1 %51, label %bb1, label %bb

bb:                                               ; preds = %getInput.exit
  store i1 false, i1* @stopSearch.b
  store i32 0, i32* @nbNodes, align 4
  %52 = load i32* @listLength, align 4            ; <i32> [#uses=3]
  %53 = icmp sgt i32 %52, 0                       ; <i1> [#uses=1]
  br i1 %53, label %bb.i2.preheader, label %bb9.i

bb.i2.preheader:                                  ; preds = %bb
  %54 = load i32** @workList, align 4             ; <i32*> [#uses=1]
  %55 = load i32* @goal, align 4                  ; <i32> [#uses=2]
  %best.promoted = load i32* @best                ; <i32> [#uses=1]
  br label %bb.i2

bb.i2:                                            ; preds = %bb.i2, %bb.i2.preheader
  %best.tmp.1 = phi i32 [ %best.promoted, %bb.i2.preheader ], [ %best.tmp.0, %bb.i2 ] ; <i32> [#uses=2]
  %i.02.i = phi i32 [ %tmp.i, %bb.i2 ], [ 0, %bb.i2.preheader ] ; <i32> [#uses=2]
  %tmp.i = add i32 %i.02.i, 1                     ; <i32> [#uses=2]
  %scevgep.i1 = getelementptr i32* %54, i32 %i.02.i ; <i32*> [#uses=1]
  %56 = load i32* %scevgep.i1, align 4            ; <i32> [#uses=2]
  %57 = sub i32 %56, %55                          ; <i32> [#uses=3]
  %neg.i = sub i32 0, %57                         ; <i32> [#uses=1]
  %abscond.i = icmp sgt i32 %57, -1               ; <i1> [#uses=1]
  %abs.i = select i1 %abscond.i, i32 %57, i32 %neg.i ; <i32> [#uses=1]
  %58 = sub i32 %best.tmp.1, %55                  ; <i32> [#uses=3]
  %neg2.i = sub i32 0, %58                        ; <i32> [#uses=1]
  %abscond3.i = icmp sgt i32 %58, -1              ; <i1> [#uses=1]
  %abs4.i = select i1 %abscond3.i, i32 %58, i32 %neg2.i ; <i32> [#uses=1]
  %59 = icmp slt i32 %abs.i, %abs4.i              ; <i1> [#uses=1]
  %best.tmp.0 = select i1 %59, i32 %56, i32 %best.tmp.1 ; <i32> [#uses=2]
  %60 = icmp slt i32 %tmp.i, %52                  ; <i1> [#uses=1]
  br i1 %60, label %bb.i2, label %bb9.i.loopexit

bb9.i.loopexit:                                   ; preds = %bb.i2
  store i32 %best.tmp.0, i32* @best
  br label %bb9.i

bb9.i:                                            ; preds = %bb9.i.loopexit, %bb
  %61 = load i32* @best, align 4                  ; <i32> [#uses=1]
  %62 = load i32* @goal, align 4                  ; <i32> [#uses=1]
  %63 = icmp eq i32 %61, %62                      ; <i1> [#uses=1]
  br i1 %63, label %bb10.i, label %bb14.i

bb10.i:                                           ; preds = %bb9.i
  %64 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0

bb12.i:                                           ; preds = %bb14.i
  tail call fastcc void @recSearch(i32 0, i32 0) nounwind
  %.b1.i = load i1* @stopSearch.b                 ; <i1> [#uses=2]
  br i1 %.b1.i, label %doSearch.exit, label %bb13.i

bb13.i:                                           ; preds = %bb12.i
  %65 = load i32* @dmax, align 4                  ; <i32> [#uses=1]
  %66 = add nsw i32 %65, 1                        ; <i32> [#uses=1]
  %.pre.i3 = load i32* @listLength, align 4       ; <i32> [#uses=1]
  br label %bb14.i

bb14.i:                                           ; preds = %bb13.i, %bb9.i
  %.b.pr.i = phi i1 [ %.b1.i, %bb13.i ], [ false, %bb9.i ] ; <i1> [#uses=1]
  %67 = phi i32 [ %.pre.i3, %bb13.i ], [ %52, %bb9.i ] ; <i32> [#uses=1]
  %storemerge.i = phi i32 [ %66, %bb13.i ], [ 1, %bb9.i ] ; <i32> [#uses=2]
  store i32 %storemerge.i, i32* @dmax
  %68 = icmp slt i32 %storemerge.i, %67           ; <i1> [#uses=1]
  br i1 %68, label %bb12.i, label %bb15thread-split.i

bb15thread-split.i:                               ; preds = %bb14.i
  br i1 %.b.pr.i, label %doSearch.exit, label %bb16.i

bb16.i:                                           ; preds = %bb15thread-split.i
  %69 = load i32* @bestDepth, align 4             ; <i32> [#uses=1]
  %70 = load %struct.Comb** @solution, align 4    ; <%struct.Comb*> [#uses=1]
  tail call fastcc void @printSolution(%struct.Comb* %70, i32 %69) nounwind
  ret i32 0

doSearch.exit:                                    ; preds = %bb15thread-split.i, %bb12.i
  ret i32 0

bb1:                                              ; preds = %getInput.exit
  ret i32 0
}
