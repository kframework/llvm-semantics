; ModuleID = 'queens.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@printing.b = internal global i1 false            ; <i1*> [#uses=4]
@stdout = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=6]
@findall.b = internal global i1 false             ; <i1*> [#uses=4]
@solutions = internal global i32 0                ; <i32*> [#uses=5]
@.str = private constant [17 x i8] c"\0ASolution #%lu:\0A\00", align 1 ; <[17 x i8]*> [#uses=1]
@queen = internal global [100 x i32] zeroinitializer, align 32 ; <[100 x i32]*> [#uses=2]
@files = internal global i32 0                    ; <i32*> [#uses=5]
@ranks = internal global i32 0                    ; <i32*> [#uses=3]
@queens = internal global i32 0                   ; <i32*> [#uses=4]
@file = internal global [100 x i32] zeroinitializer, align 32 ; <[100 x i32]*> [#uses=2]
@fordiag = internal global [199 x i32] zeroinitializer, align 32 ; <[199 x i32]*> [#uses=2]
@bakdiag = internal global [199 x i32] zeroinitializer, align 32 ; <[199 x i32]*> [#uses=2]
@.str1 = private constant [168 x i8] c"Usage:  %s [-ac] n\0A\09n\09Number of queens (rows and columns). An integer from 1 to 100.\0A\09-a\09Find and print all solutions.\0A\09-c\09Count all solutions, but do not print them.\0A\00", align 1 ; <[168 x i8]*> [#uses=1]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=7]
@.str2 = private constant [25 x i8] c"%s: Illegal option '%s'\0A\00", align 1 ; <[25 x i8]*> [#uses=1]
@.str3 = private constant [3 x i8] c"%d\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str4 = private constant [31 x i8] c"%s: Non-integer argument '%s'\0A\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str5 = private constant [32 x i8] c"%s: n must be positive integer\0A\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str6 = private constant [36 x i8] c"%s: Can't have more than %d queens\0A\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str7 = private constant [24 x i8] c"%s: Missing n argument\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str8 = private constant [2 x i8] c"s\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str9 = private constant [1 x i8] zeroinitializer, align 1 ; <[1 x i8]*> [#uses=1]
@.str10 = private constant [32 x i8] c"%d queen%s on a %dx%d board...\0A\00", align 1 ; <[32 x i8]*> [#uses=1]
@.str11 = private constant [23 x i8] c"...there is 1 solution\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str12 = private constant [28 x i8] c"...there are %ld solutions\0A\00", align 1 ; <[28 x i8]*> [#uses=1]

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @fflush(%struct._IO_FILE* nocapture) nounwind

define internal fastcc void @find(i32 %level) nounwind {
entry:
  %0 = load i32* @queens, align 4                 ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, %level                     ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb4

bb:                                               ; preds = %entry
  %2 = load i32* @solutions, align 4              ; <i32> [#uses=1]
  %3 = add i32 %2, 1                              ; <i32> [#uses=2]
  store i32 %3, i32* @solutions, align 4
  %.b = load i1* @printing.b                      ; <i1> [#uses=1]
  br i1 %.b, label %bb2, label %bb1

bb1:                                              ; preds = %bb
  %.b.i = load i1* @findall.b                     ; <i1> [#uses=1]
  br i1 %.b.i, label %bb.i, label %bb9.preheader.i

bb.i:                                             ; preds = %bb1
  %4 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %3) nounwind ; <i32> [#uses=0]
  br label %bb9.preheader.i

bb9.preheader.i:                                  ; preds = %bb.i, %bb1
  %5 = load i32* @ranks, align 4                  ; <i32> [#uses=1]
  %6 = icmp sgt i32 %5, 0                         ; <i1> [#uses=1]
  br i1 %6, label %bb7.preheader.i, label %pboard.exit

bb3.i:                                            ; preds = %bb7.preheader.i, %bb6.i
  %7 = phi %struct._IO_FILE* [ %17, %bb6.i ], [ %23, %bb7.preheader.i ] ; <%struct._IO_FILE*> [#uses=1]
  %8 = phi i32 [ %tmp.i, %bb6.i ], [ 0, %bb7.preheader.i ] ; <i32> [#uses=2]
  %tmp.i = add i32 %8, 1                          ; <i32> [#uses=2]
  %9 = tail call i32 @_IO_putc(i32 32, %struct._IO_FILE* %7) nounwind ; <i32> [#uses=0]
  %10 = load i32* %scevgep.i, align 4             ; <i32> [#uses=1]
  %11 = icmp eq i32 %10, %8                       ; <i1> [#uses=1]
  %12 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=2]
  br i1 %11, label %bb4.i, label %bb5.i

bb4.i:                                            ; preds = %bb3.i
  %13 = tail call i32 @_IO_putc(i32 81, %struct._IO_FILE* %12) nounwind ; <i32> [#uses=0]
  br label %bb6.i

bb5.i:                                            ; preds = %bb3.i
  %14 = tail call i32 @_IO_putc(i32 45, %struct._IO_FILE* %12) nounwind ; <i32> [#uses=0]
  br label %bb6.i

bb6.i:                                            ; preds = %bb5.i, %bb4.i
  %15 = load i32* @files, align 4                 ; <i32> [#uses=1]
  %16 = icmp slt i32 %tmp.i, %15                  ; <i1> [#uses=1]
  %17 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=2]
  br i1 %16, label %bb3.i, label %bb8.i

bb8.i:                                            ; preds = %bb7.preheader.i, %bb6.i
  %.lcssa.i = phi %struct._IO_FILE* [ %23, %bb7.preheader.i ], [ %17, %bb6.i ] ; <%struct._IO_FILE*> [#uses=1]
  %18 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %.lcssa.i) nounwind ; <i32> [#uses=0]
  %19 = load i32* @ranks, align 4                 ; <i32> [#uses=1]
  %20 = icmp slt i32 %tmp6.i, %19                 ; <i1> [#uses=1]
  br i1 %20, label %bb7.preheader.i, label %pboard.exit

bb7.preheader.i:                                  ; preds = %bb8.i, %bb9.preheader.i
  %i.03.i = phi i32 [ %tmp6.i, %bb8.i ], [ 0, %bb9.preheader.i ] ; <i32> [#uses=2]
  %scevgep.i = getelementptr [100 x i32]* @queen, i32 0, i32 %i.03.i ; <i32*> [#uses=1]
  %tmp6.i = add i32 %i.03.i, 1                    ; <i32> [#uses=2]
  %21 = load i32* @files, align 4                 ; <i32> [#uses=1]
  %22 = icmp sgt i32 %21, 0                       ; <i1> [#uses=1]
  %23 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=2]
  br i1 %22, label %bb3.i, label %bb8.i

pboard.exit:                                      ; preds = %bb8.i, %bb9.preheader.i
  %24 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %25 = tail call i32 @fflush(%struct._IO_FILE* %24) nounwind ; <i32> [#uses=0]
  br label %bb2

bb2:                                              ; preds = %pboard.exit, %bb
  %.b1 = load i1* @findall.b                      ; <i1> [#uses=1]
  br i1 %.b1, label %return, label %bb3

bb3:                                              ; preds = %bb2
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

bb4:                                              ; preds = %entry
  %26 = load i32* @files, align 4                 ; <i32> [#uses=2]
  %27 = icmp sgt i32 %26, 0                       ; <i1> [#uses=1]
  br i1 %27, label %bb.nph, label %return

bb.nph:                                           ; preds = %bb4
  %28 = getelementptr inbounds [100 x i32]* @queen, i32 0, i32 %level ; <i32*> [#uses=1]
  %29 = add nsw i32 %level, 1                     ; <i32> [#uses=1]
  %tmp6 = add i32 %26, %level                     ; <i32> [#uses=1]
  %tmp7 = add i32 %tmp6, -1                       ; <i32> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb9, %bb.nph
  %30 = phi i32 [ 0, %bb.nph ], [ %tmp, %bb9 ]    ; <i32> [#uses=5]
  %tmp = add i32 %30, 1                           ; <i32> [#uses=2]
  %tmp8 = sub i32 %tmp7, %30                      ; <i32> [#uses=1]
  %bdp.03 = getelementptr [199 x i32]* @bakdiag, i32 0, i32 %tmp8 ; <i32*> [#uses=3]
  %tmp9 = add i32 %30, %level                     ; <i32> [#uses=1]
  %fdp.02 = getelementptr [199 x i32]* @fordiag, i32 0, i32 %tmp9 ; <i32*> [#uses=3]
  %fp.01 = getelementptr [100 x i32]* @file, i32 0, i32 %30 ; <i32*> [#uses=3]
  %31 = load i32* %fp.01, align 4                 ; <i32> [#uses=1]
  %32 = icmp slt i32 %31, %level                  ; <i1> [#uses=1]
  br i1 %32, label %bb9, label %bb6

bb6:                                              ; preds = %bb5
  %33 = load i32* %fdp.02, align 4                ; <i32> [#uses=1]
  %34 = icmp slt i32 %33, %level                  ; <i1> [#uses=1]
  br i1 %34, label %bb9, label %bb7

bb7:                                              ; preds = %bb6
  %35 = load i32* %bdp.03, align 4                ; <i32> [#uses=1]
  %36 = icmp slt i32 %35, %level                  ; <i1> [#uses=1]
  br i1 %36, label %bb9, label %bb8

bb8:                                              ; preds = %bb7
  store i32 %30, i32* %28, align 4
  store i32 %level, i32* %bdp.03, align 4
  store i32 %level, i32* %fdp.02, align 4
  store i32 %level, i32* %fp.01, align 4
  tail call fastcc void @find(i32 %29) nounwind
  store i32 101, i32* %bdp.03, align 4
  store i32 101, i32* %fdp.02, align 4
  store i32 101, i32* %fp.01, align 4
  br label %bb9

bb9:                                              ; preds = %bb8, %bb7, %bb6, %bb5
  %37 = load i32* @files, align 4                 ; <i32> [#uses=1]
  %38 = icmp slt i32 %tmp, %37                    ; <i1> [#uses=1]
  br i1 %38, label %bb5, label %return

return:                                           ; preds = %bb9, %bb4, %bb2
  ret void
}

declare void @exit(i32) noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind {
entry:
  %0 = load i8** %argv, align 4                   ; <i8*> [#uses=7]
  store i1 true, i1* @printing.b
  store i32 14, i32* @queens, align 4
  store i1 true, i1* @findall.b
  br label %bb13

bb:                                               ; preds = %bb13
  %scevgep26 = getelementptr i8** %argv, i32 %indvar23 ; <i8**> [#uses=1]
  %1 = load i8** %scevgep26, align 4              ; <i8*> [#uses=5]
  %2 = load i8* %1, align 1                       ; <i8> [#uses=1]
  %3 = icmp eq i8 %2, 45                          ; <i1> [#uses=1]
  br i1 %3, label %bb5, label %bb6

bb1:                                              ; preds = %bb5
  %4 = sext i8 %9 to i32                          ; <i32> [#uses=1]
  switch i32 %4, label %bb4 [
    i32 97, label %bb3
    i32 99, label %bb2
  ]

bb2:                                              ; preds = %bb1
  store i1 true, i1* @printing.b
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  store i1 true, i1* @findall.b
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb5

bb4:                                              ; preds = %bb1
  %5 = load %struct._IO_FILE** @stderr, align 4   ; <%struct._IO_FILE*> [#uses=1]
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %5, i8* noalias getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i8* %0, i8* %1) nounwind ; <i32> [#uses=0]
  %7 = load %struct._IO_FILE** @stderr, align 4   ; <%struct._IO_FILE*> [#uses=1]
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %7, i8* noalias getelementptr inbounds ([168 x i8]* @.str1, i32 0, i32 0), i8* %0) nounwind ; <i32> [#uses=0]
  ret i32 -1

bb5:                                              ; preds = %bb3, %bb
  %indvar = phi i32 [ %phitmp, %bb3 ], [ 1, %bb ] ; <i32> [#uses=2]
  %scevgep15 = getelementptr i8* %1, i32 %indvar  ; <i8*> [#uses=1]
  %9 = load i8* %scevgep15, align 1               ; <i8> [#uses=2]
  %10 = icmp eq i8 %9, 0                          ; <i1> [#uses=1]
  br i1 %10, label %bb12, label %bb1

bb6:                                              ; preds = %bb
  %11 = tail call i32 (i8*, i8*, ...)* @sscanf(i8* noalias %1, i8* noalias getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* @queens) nounwind ; <i32> [#uses=1]
  %12 = icmp eq i32 %11, 1                        ; <i1> [#uses=1]
  br i1 %12, label %bb8, label %bb7

bb7:                                              ; preds = %bb6
  %13 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %13, i8* noalias getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i8* %0, i8* %1) nounwind ; <i32> [#uses=0]
  ret i32 -1

bb8:                                              ; preds = %bb6
  %15 = load i32* @queens, align 4                ; <i32> [#uses=3]
  %16 = icmp sgt i32 %15, 0                       ; <i1> [#uses=1]
  br i1 %16, label %bb10, label %bb9

bb9:                                              ; preds = %bb8
  %17 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %17, i8* noalias getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), i8* %0) nounwind ; <i32> [#uses=0]
  ret i32 -1

bb10:                                             ; preds = %bb8
  %19 = icmp sgt i32 %15, 100                     ; <i1> [#uses=1]
  br i1 %19, label %bb11, label %bb12

bb11:                                             ; preds = %bb10
  %20 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %20, i8* noalias getelementptr inbounds ([36 x i8]* @.str6, i32 0, i32 0), i8* %0, i32 100) nounwind ; <i32> [#uses=0]
  ret i32 -1

bb12:                                             ; preds = %bb10, %bb5
  %.rle27 = phi i32 [ %15, %bb10 ], [ %22, %bb5 ] ; <i32> [#uses=1]
  %phitmp30 = add i32 %indvar23, 1                ; <i32> [#uses=1]
  br label %bb13

bb13:                                             ; preds = %bb12, %entry
  %22 = phi i32 [ %.rle27, %bb12 ], [ 14, %entry ] ; <i32> [#uses=8]
  %indvar23 = phi i32 [ 1, %entry ], [ %phitmp30, %bb12 ] ; <i32> [#uses=3]
  %23 = icmp slt i32 %indvar23, %argc             ; <i1> [#uses=1]
  br i1 %23, label %bb, label %bb14

bb14:                                             ; preds = %bb13
  %24 = icmp eq i32 %22, 0                        ; <i1> [#uses=1]
  br i1 %24, label %bb15, label %bb16

bb15:                                             ; preds = %bb14
  %25 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %25, i8* noalias getelementptr inbounds ([24 x i8]* @.str7, i32 0, i32 0), i8* %0) nounwind ; <i32> [#uses=0]
  %27 = load %struct._IO_FILE** @stderr, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %27, i8* noalias getelementptr inbounds ([168 x i8]* @.str1, i32 0, i32 0), i8* %0) nounwind ; <i32> [#uses=0]
  ret i32 -1

bb16:                                             ; preds = %bb14
  store i32 %22, i32* @files, align 4
  store i32 %22, i32* @ranks, align 4
  %29 = icmp sgt i32 %22, 1                       ; <i1> [#uses=1]
  %iftmp.45.0 = select i1 %29, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str9, i32 0, i32 0) ; <i8*> [#uses=1]
  %30 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.str10, i32 0, i32 0), i32 %22, i8* %iftmp.45.0, i32 %22, i32 %22) nounwind ; <i32> [#uses=0]
  %31 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %32 = tail call i32 @fflush(%struct._IO_FILE* %31) nounwind ; <i32> [#uses=0]
  store i32 0, i32* @solutions, align 4
  br label %bb20

bb20:                                             ; preds = %bb20, %bb16
  %i.12 = phi i32 [ 0, %bb16 ], [ %33, %bb20 ]    ; <i32> [#uses=2]
  %scevgep14 = getelementptr [100 x i32]* @file, i32 0, i32 %i.12 ; <i32*> [#uses=1]
  store i32 101, i32* %scevgep14, align 4
  %33 = add nsw i32 %i.12, 1                      ; <i32> [#uses=2]
  %exitcond13 = icmp eq i32 %33, 100              ; <i1> [#uses=1]
  br i1 %exitcond13, label %bb23, label %bb20

bb23:                                             ; preds = %bb23, %bb20
  %i.21 = phi i32 [ %34, %bb23 ], [ 0, %bb20 ]    ; <i32> [#uses=3]
  %scevgep = getelementptr [199 x i32]* @fordiag, i32 0, i32 %i.21 ; <i32*> [#uses=1]
  %scevgep12 = getelementptr [199 x i32]* @bakdiag, i32 0, i32 %i.21 ; <i32*> [#uses=1]
  store i32 101, i32* %scevgep12, align 4
  store i32 101, i32* %scevgep, align 4
  %34 = add nsw i32 %i.21, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %34, 199                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb25, label %bb23

bb25:                                             ; preds = %bb23
  tail call fastcc void @find(i32 0) nounwind
  %.b = load i1* @printing.b                      ; <i1> [#uses=1]
  br i1 %.b, label %bb28thread-split, label %bb26

bb26:                                             ; preds = %bb25
  %35 = load i32* @solutions, align 4             ; <i32> [#uses=3]
  %36 = icmp eq i32 %35, 0                        ; <i1> [#uses=1]
  br i1 %36, label %bb28, label %bb27

bb27:                                             ; preds = %bb26
  %37 = load %struct._IO_FILE** @stdout, align 4  ; <%struct._IO_FILE*> [#uses=1]
  %38 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %37) nounwind ; <i32> [#uses=0]
  br label %bb28thread-split

bb28thread-split:                                 ; preds = %bb27, %bb25
  %.pr = load i32* @solutions                     ; <i32> [#uses=2]
  br label %bb28

bb28:                                             ; preds = %bb28thread-split, %bb26
  %39 = phi i32 [ %.pr, %bb28thread-split ], [ %35, %bb26 ] ; <i32> [#uses=1]
  %40 = phi i32 [ %.pr, %bb28thread-split ], [ %35, %bb26 ] ; <i32> [#uses=1]
  %41 = icmp eq i32 %40, 1                        ; <i1> [#uses=1]
  br i1 %41, label %bb29, label %bb30

bb29:                                             ; preds = %bb28
  %42 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @.str11, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0

bb30:                                             ; preds = %bb28
  %43 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %39) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE* noalias nocapture, i8* noalias nocapture, ...) nounwind

declare i32 @sscanf(i8* nocapture, i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind
