; ModuleID = 'richards_benchmark.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.packet = type { %struct.packet*, i32, i32, i32, [4 x i8] }
%struct.task = type { %struct.task*, i32, i32, %struct.packet*, i32, %struct.task* (%struct.packet*)*, i32, i32 }

@alphabet = internal constant [28 x i8] c"0ABCDEFGHIJKLMNOPQRSTUVWXYZ\00" ; <[28 x i8]*> [#uses=4]
@tcb = internal global %struct.task* null         ; <%struct.task**> [#uses=22]
@holdcount = internal global i32 0                ; <i32*> [#uses=7]
@tasktab = internal global [11 x %struct.task*] zeroinitializer, align 32 ; <[11 x %struct.task*]*> [#uses=7]
@.str = private constant [17 x i8] c"\0ABad task id %d\0A\00", align 1 ; <[17 x i8]*> [#uses=1]
@qpktcount = internal global i32 0                ; <i32*> [#uses=5]
@taskid = internal global i32 0                   ; <i32*> [#uses=2]
@v1 = internal global i32 0                       ; <i32*> [#uses=13]
@v2 = internal global i32 0                       ; <i32*> [#uses=15]
@layout = internal global i32 0                   ; <i32*> [#uses=7]
@tracing.b = internal global i1 false             ; <i1*> [#uses=3]
@.str1 = private constant [20 x i8] c"Bench mark starting\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str2 = private constant [9 x i8] c"Starting\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str3 = private constant [9 x i8] c"finished\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str4 = private constant [33 x i8] c"qpkt count = %d  holdcount = %d\0A\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str5 = private constant [19 x i8] c"These results are \00", align 1 ; <[19 x i8]*> [#uses=1]
@.str6 = private constant [8 x i8] c"correct\00", align 1 ; <[8 x i8]*> [#uses=1]
@.str7 = private constant [10 x i8] c"incorrect\00", align 1 ; <[10 x i8]*> [#uses=1]
@.str8 = private constant [12 x i8] c"\0Aend of run\00", align 1 ; <[12 x i8]*> [#uses=1]

declare i32 @printf(i8* nocapture, ...) nounwind

define internal fastcc %struct.task* @qpkt(%struct.packet* %pkt) nounwind {
entry:
  %0 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 1 ; <i32*> [#uses=2]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=3]
  %2 = add i32 %1, -1                             ; <i32> [#uses=1]
  %3 = icmp ugt i32 %2, 9                         ; <i1> [#uses=1]
  br i1 %3, label %bb2.i, label %bb1.i

bb1.i:                                            ; preds = %entry
  %4 = getelementptr inbounds [11 x %struct.task*]* @tasktab, i32 0, i32 %1 ; <%struct.task**> [#uses=1]
  %5 = load %struct.task** %4, align 4            ; <%struct.task*> [#uses=3]
  %6 = icmp eq %struct.task* %5, null             ; <i1> [#uses=1]
  br i1 %6, label %bb2.i, label %findtcb.exit

bb2.i:                                            ; preds = %bb1.i, %entry
  %t.0.reg2mem.0.i = phi %struct.task* [ null, %entry ], [ %5, %bb1.i ] ; <%struct.task*> [#uses=1]
  %7 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %1) nounwind ; <i32> [#uses=0]
  br label %findtcb.exit

findtcb.exit:                                     ; preds = %bb2.i, %bb1.i
  %8 = phi %struct.task* [ %t.0.reg2mem.0.i, %bb2.i ], [ %5, %bb1.i ] ; <%struct.task*> [#uses=6]
  %9 = icmp eq %struct.task* %8, null             ; <i1> [#uses=1]
  br i1 %9, label %bb6, label %bb1

bb1:                                              ; preds = %findtcb.exit
  %10 = load i32* @qpktcount, align 4             ; <i32> [#uses=1]
  %11 = add nsw i32 %10, 1                        ; <i32> [#uses=1]
  store i32 %11, i32* @qpktcount, align 4
  %12 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 0 ; <%struct.packet**> [#uses=2]
  store %struct.packet* null, %struct.packet** %12, align 4
  %13 = load i32* @taskid, align 4                ; <i32> [#uses=1]
  store i32 %13, i32* %0, align 4
  %14 = getelementptr inbounds %struct.task* %8, i32 0, i32 3 ; <%struct.packet**> [#uses=4]
  %15 = load %struct.packet** %14, align 4        ; <%struct.packet*> [#uses=1]
  %16 = icmp eq %struct.packet* %15, null         ; <i1> [#uses=1]
  br i1 %16, label %bb2, label %bb4

bb2:                                              ; preds = %bb1
  store %struct.packet* %pkt, %struct.packet** %14, align 4
  %17 = getelementptr inbounds %struct.task* %8, i32 0, i32 4 ; <i32*> [#uses=2]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = or i32 %18, 1                             ; <i32> [#uses=1]
  store i32 %19, i32* %17, align 4
  %20 = getelementptr inbounds %struct.task* %8, i32 0, i32 2 ; <i32*> [#uses=1]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=1]
  %22 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=2]
  %23 = getelementptr inbounds %struct.task* %22, i32 0, i32 2 ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = icmp sgt i32 %21, %24                     ; <i1> [#uses=1]
  %retval = select i1 %25, %struct.task* %8, %struct.task* %22 ; <%struct.task*> [#uses=1]
  ret %struct.task* %retval

bb4:                                              ; preds = %bb1
  store %struct.packet* null, %struct.packet** %12, align 4
  %26 = load %struct.packet** %14                 ; <%struct.packet*> [#uses=2]
  %27 = icmp eq %struct.packet* %26, null         ; <i1> [#uses=1]
  br i1 %27, label %append.exit, label %bb.i

bb.i:                                             ; preds = %bb.i, %bb4
  %28 = phi %struct.packet* [ %30, %bb.i ], [ %26, %bb4 ] ; <%struct.packet*> [#uses=1]
  %29 = getelementptr inbounds %struct.packet* %28, i32 0, i32 0 ; <%struct.packet**> [#uses=2]
  %30 = load %struct.packet** %29, align 4        ; <%struct.packet*> [#uses=2]
  %31 = icmp eq %struct.packet* %30, null         ; <i1> [#uses=1]
  br i1 %31, label %append.exit, label %bb.i

append.exit:                                      ; preds = %bb.i, %bb4
  %.lcssa.i = phi %struct.packet** [ %14, %bb4 ], [ %29, %bb.i ] ; <%struct.packet**> [#uses=1]
  store %struct.packet* %pkt, %struct.packet** %.lcssa.i, align 4
  %.pre = load %struct.task** @tcb, align 4       ; <%struct.task*> [#uses=1]
  ret %struct.task* %.pre

bb6:                                              ; preds = %findtcb.exit
  ret %struct.task* %8
}

define internal %struct.task* @handlerfn(%struct.packet* %pkt) nounwind {
entry:
  %0 = icmp eq %struct.packet* %pkt, null         ; <i1> [#uses=1]
  br i1 %0, label %bb4, label %bb

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 2 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4                      ; <i32> [#uses=1]
  %3 = icmp eq i32 %2, 1001                       ; <i1> [#uses=1]
  %iftmp.62.0 = select i1 %3, %struct.packet* bitcast (i32* @v1 to %struct.packet*), %struct.packet* bitcast (i32* @v2 to %struct.packet*) ; <%struct.packet*> [#uses=1]
  %4 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %4, align 4
  %5 = getelementptr inbounds %struct.packet* %iftmp.62.0, i32 0, i32 0 ; <%struct.packet**> [#uses=2]
  %6 = load %struct.packet** %5, align 4          ; <%struct.packet*> [#uses=2]
  %7 = icmp eq %struct.packet* %6, null           ; <i1> [#uses=1]
  br i1 %7, label %append.exit, label %bb.i

bb.i:                                             ; preds = %bb.i, %bb
  %8 = phi %struct.packet* [ %10, %bb.i ], [ %6, %bb ] ; <%struct.packet*> [#uses=1]
  %9 = getelementptr inbounds %struct.packet* %8, i32 0, i32 0 ; <%struct.packet**> [#uses=2]
  %10 = load %struct.packet** %9, align 4         ; <%struct.packet*> [#uses=2]
  %11 = icmp eq %struct.packet* %10, null         ; <i1> [#uses=1]
  br i1 %11, label %append.exit, label %bb.i

append.exit:                                      ; preds = %bb.i, %bb
  %.lcssa.i = phi %struct.packet** [ %5, %bb ], [ %9, %bb.i ] ; <%struct.packet**> [#uses=1]
  store %struct.packet* %pkt, %struct.packet** %.lcssa.i, align 4
  br label %bb4

bb4:                                              ; preds = %append.exit, %entry
  %12 = load i32* @v1, align 4                    ; <i32> [#uses=2]
  %13 = icmp eq i32 %12, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb9, label %bb5

bb5:                                              ; preds = %bb4
  %14 = inttoptr i32 %12 to %struct.packet*       ; <%struct.packet*> [#uses=4]
  %15 = getelementptr inbounds %struct.packet* %14, i32 0, i32 3 ; <i32*> [#uses=2]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=3]
  %17 = icmp sgt i32 %16, 3                       ; <i1> [#uses=1]
  br i1 %17, label %bb6, label %bb7

bb6:                                              ; preds = %bb5
  %18 = getelementptr inbounds %struct.packet* %14, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  %19 = load %struct.packet** %18, align 4        ; <%struct.packet*> [#uses=1]
  %20 = ptrtoint %struct.packet* %19 to i32       ; <i32> [#uses=1]
  store i32 %20, i32* @v1, align 4
  %21 = tail call fastcc %struct.task* @qpkt(%struct.packet* %14) nounwind ; <%struct.task*> [#uses=1]
  ret %struct.task* %21

bb7:                                              ; preds = %bb5
  %22 = load i32* @v2, align 4                    ; <i32> [#uses=2]
  %23 = icmp eq i32 %22, 0                        ; <i1> [#uses=1]
  br i1 %23, label %bb9, label %bb8

bb8:                                              ; preds = %bb7
  %24 = inttoptr i32 %22 to %struct.packet*       ; <%struct.packet*> [#uses=3]
  %25 = getelementptr inbounds %struct.packet* %24, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  %26 = load %struct.packet** %25, align 4        ; <%struct.packet*> [#uses=1]
  %27 = ptrtoint %struct.packet* %26 to i32       ; <i32> [#uses=1]
  store i32 %27, i32* @v2, align 4
  %28 = getelementptr inbounds %struct.packet* %14, i32 0, i32 4, i32 %16 ; <i8*> [#uses=1]
  %29 = load i8* %28, align 1                     ; <i8> [#uses=1]
  %30 = sext i8 %29 to i32                        ; <i32> [#uses=1]
  %31 = getelementptr inbounds %struct.packet* %24, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 %30, i32* %31, align 4
  %32 = add nsw i32 %16, 1                        ; <i32> [#uses=1]
  store i32 %32, i32* %15, align 4
  %33 = tail call fastcc %struct.task* @qpkt(%struct.packet* %24) nounwind ; <%struct.task*> [#uses=1]
  ret %struct.task* %33

bb9:                                              ; preds = %bb7, %bb4
  %34 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=1]
  %35 = getelementptr inbounds %struct.task* %34, i32 0, i32 4 ; <i32*> [#uses=2]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=1]
  %37 = or i32 %36, 2                             ; <i32> [#uses=1]
  store i32 %37, i32* %35, align 4
  %38 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=1]
  ret %struct.task* %38
}

define internal %struct.task* @workfn(%struct.packet* %pkt) nounwind {
entry:
  %0 = icmp eq %struct.packet* %pkt, null         ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %entry
  %1 = load %struct.task** @tcb, align 4          ; <%struct.task*> [#uses=1]
  %2 = getelementptr inbounds %struct.task* %1, i32 0, i32 4 ; <i32*> [#uses=2]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=1]
  %4 = or i32 %3, 2                               ; <i32> [#uses=1]
  store i32 %4, i32* %2, align 4
  %5 = load %struct.task** @tcb, align 4          ; <%struct.task*> [#uses=1]
  ret %struct.task* %5

bb1:                                              ; preds = %entry
  %6 = load i32* @v1, align 4                     ; <i32> [#uses=1]
  %7 = sub i32 7, %6                              ; <i32> [#uses=2]
  store i32 %7, i32* @v1, align 4
  %8 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %7, i32* %8, align 4
  %9 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %9, align 4
  %scevgep = getelementptr %struct.packet* %pkt, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %10 = load i32* @v2, align 4                    ; <i32> [#uses=1]
  %11 = add nsw i32 %10, 1                        ; <i32> [#uses=2]
  %12 = icmp sgt i32 %11, 26                      ; <i1> [#uses=1]
  %storemerge = select i1 %12, i32 1, i32 %11     ; <i32> [#uses=2]
  store i32 %storemerge, i32* @v2
  %13 = getelementptr inbounds [28 x i8]* @alphabet, i32 0, i32 %storemerge ; <i8*> [#uses=1]
  %14 = load i8* %13, align 1                     ; <i8> [#uses=1]
  store i8 %14, i8* %scevgep, align 1
  %scevgep.1 = getelementptr %struct.packet* %pkt, i32 0, i32 4, i32 1 ; <i8*> [#uses=1]
  %15 = load i32* @v2, align 4                    ; <i32> [#uses=1]
  %16 = add nsw i32 %15, 1                        ; <i32> [#uses=2]
  %17 = icmp sgt i32 %16, 26                      ; <i1> [#uses=1]
  %storemerge.1 = select i1 %17, i32 1, i32 %16   ; <i32> [#uses=2]
  store i32 %storemerge.1, i32* @v2
  %18 = getelementptr inbounds [28 x i8]* @alphabet, i32 0, i32 %storemerge.1 ; <i8*> [#uses=1]
  %19 = load i8* %18, align 1                     ; <i8> [#uses=1]
  store i8 %19, i8* %scevgep.1, align 1
  %scevgep.2 = getelementptr %struct.packet* %pkt, i32 0, i32 4, i32 2 ; <i8*> [#uses=1]
  %20 = load i32* @v2, align 4                    ; <i32> [#uses=1]
  %21 = add nsw i32 %20, 1                        ; <i32> [#uses=2]
  %22 = icmp sgt i32 %21, 26                      ; <i1> [#uses=1]
  %storemerge.2 = select i1 %22, i32 1, i32 %21   ; <i32> [#uses=2]
  store i32 %storemerge.2, i32* @v2
  %23 = getelementptr inbounds [28 x i8]* @alphabet, i32 0, i32 %storemerge.2 ; <i8*> [#uses=1]
  %24 = load i8* %23, align 1                     ; <i8> [#uses=1]
  store i8 %24, i8* %scevgep.2, align 1
  %scevgep.3 = getelementptr %struct.packet* %pkt, i32 0, i32 4, i32 3 ; <i8*> [#uses=1]
  %25 = load i32* @v2, align 4                    ; <i32> [#uses=1]
  %26 = add nsw i32 %25, 1                        ; <i32> [#uses=2]
  %27 = icmp sgt i32 %26, 26                      ; <i1> [#uses=1]
  %storemerge.3 = select i1 %27, i32 1, i32 %26   ; <i32> [#uses=2]
  store i32 %storemerge.3, i32* @v2
  %28 = getelementptr inbounds [28 x i8]* @alphabet, i32 0, i32 %storemerge.3 ; <i8*> [#uses=1]
  %29 = load i8* %28, align 1                     ; <i8> [#uses=1]
  store i8 %29, i8* %scevgep.3, align 1
  %30 = tail call fastcc %struct.task* @qpkt(%struct.packet* %pkt) nounwind ; <%struct.task*> [#uses=1]
  ret %struct.task* %30
}

define internal %struct.task* @idlefn(%struct.packet* nocapture %pkt) nounwind {
entry:
  %0 = load i32* @v2, align 4                     ; <i32> [#uses=2]
  %1 = add i32 %0, -1                             ; <i32> [#uses=1]
  store i32 %1, i32* @v2, align 4
  %2 = icmp eq i32 %0, 1                          ; <i1> [#uses=1]
  br i1 %2, label %bb, label %bb1

bb:                                               ; preds = %entry
  %3 = load i32* @holdcount, align 4              ; <i32> [#uses=1]
  %4 = add nsw i32 %3, 1                          ; <i32> [#uses=1]
  store i32 %4, i32* @holdcount, align 4
  %5 = load %struct.task** @tcb, align 4          ; <%struct.task*> [#uses=1]
  %6 = getelementptr inbounds %struct.task* %5, i32 0, i32 4 ; <i32*> [#uses=2]
  %7 = load i32* %6, align 4                      ; <i32> [#uses=1]
  %8 = or i32 %7, 4                               ; <i32> [#uses=1]
  store i32 %8, i32* %6, align 4
  %9 = load %struct.task** @tcb, align 4          ; <%struct.task*> [#uses=1]
  %10 = getelementptr inbounds %struct.task* %9, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  %11 = load %struct.task** %10, align 4          ; <%struct.task*> [#uses=1]
  ret %struct.task* %11

bb1:                                              ; preds = %entry
  %12 = load i32* @v1, align 4                    ; <i32> [#uses=2]
  %13 = and i32 %12, 1                            ; <i32> [#uses=1]
  %14 = icmp eq i32 %13, 0                        ; <i1> [#uses=1]
  %15 = lshr i32 %12, 1                           ; <i32> [#uses=1]
  %16 = and i32 %15, 32767                        ; <i32> [#uses=2]
  br i1 %14, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  store i32 %16, i32* @v1, align 4
  %17 = load %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 5), align 4 ; <%struct.task*> [#uses=4]
  %18 = icmp eq %struct.task* %17, null           ; <i1> [#uses=1]
  br i1 %18, label %bb4.i6, label %bb1.i5

bb1.i5:                                           ; preds = %bb2
  %19 = getelementptr inbounds %struct.task* %17, i32 0, i32 4 ; <i32*> [#uses=2]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  %21 = and i32 %20, 65531                        ; <i32> [#uses=1]
  store i32 %21, i32* %19, align 4
  %22 = getelementptr inbounds %struct.task* %17, i32 0, i32 2 ; <i32*> [#uses=1]
  %23 = load i32* %22, align 4                    ; <i32> [#uses=1]
  %24 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=2]
  %25 = getelementptr inbounds %struct.task* %24, i32 0, i32 2 ; <i32*> [#uses=1]
  %26 = load i32* %25, align 4                    ; <i32> [#uses=1]
  %27 = icmp sgt i32 %23, %26                     ; <i1> [#uses=1]
  %retval.i4 = select i1 %27, %struct.task* %17, %struct.task* %24 ; <%struct.task*> [#uses=1]
  ret %struct.task* %retval.i4

bb4.i6:                                           ; preds = %bb2
  %28 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 5) nounwind ; <i32> [#uses=0]
  ret %struct.task* null

bb3:                                              ; preds = %bb1
  %29 = xor i32 %16, 53256                        ; <i32> [#uses=1]
  store i32 %29, i32* @v1, align 4
  %30 = load %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 6), align 8 ; <%struct.task*> [#uses=4]
  %31 = icmp eq %struct.task* %30, null           ; <i1> [#uses=1]
  br i1 %31, label %bb4.i, label %bb1.i

bb1.i:                                            ; preds = %bb3
  %32 = getelementptr inbounds %struct.task* %30, i32 0, i32 4 ; <i32*> [#uses=2]
  %33 = load i32* %32, align 4                    ; <i32> [#uses=1]
  %34 = and i32 %33, 65531                        ; <i32> [#uses=1]
  store i32 %34, i32* %32, align 4
  %35 = getelementptr inbounds %struct.task* %30, i32 0, i32 2 ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=1]
  %37 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=2]
  %38 = getelementptr inbounds %struct.task* %37, i32 0, i32 2 ; <i32*> [#uses=1]
  %39 = load i32* %38, align 4                    ; <i32> [#uses=1]
  %40 = icmp sgt i32 %36, %39                     ; <i1> [#uses=1]
  %retval.i = select i1 %40, %struct.task* %30, %struct.task* %37 ; <%struct.task*> [#uses=1]
  ret %struct.task* %retval.i

bb4.i:                                            ; preds = %bb3
  %41 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 6) nounwind ; <i32> [#uses=0]
  ret %struct.task* null
}

declare i32 @putchar(i32) nounwind

define internal %struct.task* @devfn(%struct.packet* %pkt) nounwind {
entry:
  %0 = icmp eq %struct.packet* %pkt, null         ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb3

bb:                                               ; preds = %entry
  %1 = load i32* @v1, align 4                     ; <i32> [#uses=2]
  %2 = icmp eq i32 %1, 0                          ; <i1> [#uses=1]
  br i1 %2, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %3 = load %struct.task** @tcb, align 4          ; <%struct.task*> [#uses=1]
  %4 = getelementptr inbounds %struct.task* %3, i32 0, i32 4 ; <i32*> [#uses=2]
  %5 = load i32* %4, align 4                      ; <i32> [#uses=1]
  %6 = or i32 %5, 2                               ; <i32> [#uses=1]
  store i32 %6, i32* %4, align 4
  %7 = load %struct.task** @tcb, align 4          ; <%struct.task*> [#uses=1]
  ret %struct.task* %7

bb2:                                              ; preds = %bb
  %8 = inttoptr i32 %1 to %struct.packet*         ; <%struct.packet*> [#uses=1]
  store i32 0, i32* @v1, align 4
  %9 = tail call fastcc %struct.task* @qpkt(%struct.packet* %8) nounwind ; <%struct.task*> [#uses=1]
  ret %struct.task* %9

bb3:                                              ; preds = %entry
  %10 = ptrtoint %struct.packet* %pkt to i32      ; <i32> [#uses=1]
  store i32 %10, i32* @v1, align 4
  %.b = load i1* @tracing.b                       ; <i1> [#uses=1]
  br i1 %.b, label %bb5, label %bb4

bb4:                                              ; preds = %bb3
  %11 = getelementptr inbounds %struct.packet* %pkt, i32 0, i32 3 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %13 = trunc i32 %12 to i8                       ; <i8> [#uses=1]
  %14 = load i32* @layout, align 4                ; <i32> [#uses=1]
  %15 = add i32 %14, -1                           ; <i32> [#uses=2]
  store i32 %15, i32* @layout, align 4
  %16 = icmp sgt i32 %15, 0                       ; <i1> [#uses=1]
  br i1 %16, label %trace.exit, label %bb.i

bb.i:                                             ; preds = %bb4
  %17 = tail call i32 @putchar(i32 10) nounwind   ; <i32> [#uses=0]
  store i32 50, i32* @layout, align 4
  br label %trace.exit

trace.exit:                                       ; preds = %bb.i, %bb4
  %18 = sext i8 %13 to i32                        ; <i32> [#uses=1]
  %19 = tail call i32 @putchar(i32 %18) nounwind  ; <i32> [#uses=0]
  br label %bb5

bb5:                                              ; preds = %trace.exit, %bb3
  %20 = load i32* @holdcount, align 4             ; <i32> [#uses=1]
  %21 = add nsw i32 %20, 1                        ; <i32> [#uses=1]
  store i32 %21, i32* @holdcount, align 4
  %22 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=1]
  %23 = getelementptr inbounds %struct.task* %22, i32 0, i32 4 ; <i32*> [#uses=2]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = or i32 %24, 4                             ; <i32> [#uses=1]
  store i32 %25, i32* %23, align 4
  %26 = load %struct.task** @tcb, align 4         ; <%struct.task*> [#uses=1]
  %27 = getelementptr inbounds %struct.task* %26, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  %28 = load %struct.task** %27, align 4          ; <%struct.task*> [#uses=1]
  ret %struct.task* %28
}

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %1 = malloc %struct.task                        ; <%struct.task*> [#uses=10]
  store %struct.task* %1, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 1), align 4
  %2 = getelementptr inbounds %struct.task* %1, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  store %struct.task* null, %struct.task** %2, align 4
  %3 = getelementptr inbounds %struct.task* %1, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 1, i32* %3
  %4 = getelementptr inbounds %struct.task* %1, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %4
  %5 = getelementptr inbounds %struct.task* %1, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %5
  %6 = getelementptr inbounds %struct.task* %1, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %6
  %7 = getelementptr inbounds %struct.task* %1, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  store %struct.task* (%struct.packet*)* @idlefn, %struct.task* (%struct.packet*)** %7
  %8 = getelementptr inbounds %struct.task* %1, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 1, i32* %8
  %9 = getelementptr inbounds %struct.task* %1, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 10000000, i32* %9
  %10 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i = getelementptr %struct.packet* %10, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i = bitcast i8* %scevgep.i to i32*    ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i, align 4
  %11 = getelementptr inbounds %struct.packet* %10, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %11, align 4
  %12 = getelementptr inbounds %struct.packet* %10, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %12
  %13 = getelementptr inbounds %struct.packet* %10, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1001, i32* %13
  %14 = getelementptr inbounds %struct.packet* %10, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %14
  %15 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i13 = getelementptr %struct.packet* %15, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i14 = bitcast i8* %scevgep.i13 to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i14, align 4
  %16 = getelementptr inbounds %struct.packet* %15, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %10, %struct.packet** %16, align 4
  %17 = getelementptr inbounds %struct.packet* %15, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %17
  %18 = getelementptr inbounds %struct.packet* %15, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1001, i32* %18
  %19 = getelementptr inbounds %struct.packet* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %19
  %20 = malloc %struct.task                       ; <%struct.task*> [#uses=10]
  store %struct.task* %20, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 2), align 8
  %21 = getelementptr inbounds %struct.task* %20, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  store %struct.task* %1, %struct.task** %21, align 4
  %22 = getelementptr inbounds %struct.task* %20, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 2, i32* %22
  %23 = getelementptr inbounds %struct.task* %20, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %23
  %24 = getelementptr inbounds %struct.task* %20, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %15, %struct.packet** %24
  %25 = getelementptr inbounds %struct.task* %20, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 3, i32* %25
  %26 = getelementptr inbounds %struct.task* %20, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  store %struct.task* (%struct.packet*)* @workfn, %struct.task* (%struct.packet*)** %26
  %27 = getelementptr inbounds %struct.task* %20, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 3, i32* %27
  %28 = getelementptr inbounds %struct.task* %20, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 0, i32* %28
  %29 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i11 = getelementptr %struct.packet* %29, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i12 = bitcast i8* %scevgep.i11 to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i12, align 4
  %30 = getelementptr inbounds %struct.packet* %29, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %30, align 4
  %31 = getelementptr inbounds %struct.packet* %29, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 5, i32* %31
  %32 = getelementptr inbounds %struct.packet* %29, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %32
  %33 = getelementptr inbounds %struct.packet* %29, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %33
  %34 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i9 = getelementptr %struct.packet* %34, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i10 = bitcast i8* %scevgep.i9 to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i10, align 4
  %35 = getelementptr inbounds %struct.packet* %34, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %29, %struct.packet** %35, align 4
  %36 = getelementptr inbounds %struct.packet* %34, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 5, i32* %36
  %37 = getelementptr inbounds %struct.packet* %34, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %37
  %38 = getelementptr inbounds %struct.packet* %34, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %38
  %39 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i7 = getelementptr %struct.packet* %39, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i8 = bitcast i8* %scevgep.i7 to i32*  ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i8, align 4
  %40 = getelementptr inbounds %struct.packet* %39, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %34, %struct.packet** %40, align 4
  %41 = getelementptr inbounds %struct.packet* %39, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 5, i32* %41
  %42 = getelementptr inbounds %struct.packet* %39, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %42
  %43 = getelementptr inbounds %struct.packet* %39, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %43
  %44 = malloc %struct.task                       ; <%struct.task*> [#uses=10]
  store %struct.task* %44, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 3), align 4
  %45 = getelementptr inbounds %struct.task* %44, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  store %struct.task* %20, %struct.task** %45, align 4
  %46 = getelementptr inbounds %struct.task* %44, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 3, i32* %46
  %47 = getelementptr inbounds %struct.task* %44, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 2000, i32* %47
  %48 = getelementptr inbounds %struct.task* %44, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %39, %struct.packet** %48
  %49 = getelementptr inbounds %struct.task* %44, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 3, i32* %49
  %50 = getelementptr inbounds %struct.task* %44, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %50
  %51 = getelementptr inbounds %struct.task* %44, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 0, i32* %51
  %52 = getelementptr inbounds %struct.task* %44, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 0, i32* %52
  %53 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i5 = getelementptr %struct.packet* %53, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i6 = bitcast i8* %scevgep.i5 to i32*  ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i6, align 4
  %54 = getelementptr inbounds %struct.packet* %53, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %54, align 4
  %55 = getelementptr inbounds %struct.packet* %53, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 6, i32* %55
  %56 = getelementptr inbounds %struct.packet* %53, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %56
  %57 = getelementptr inbounds %struct.packet* %53, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %57
  %58 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i3 = getelementptr %struct.packet* %58, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i4 = bitcast i8* %scevgep.i3 to i32*  ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i4, align 4
  %59 = getelementptr inbounds %struct.packet* %58, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %53, %struct.packet** %59, align 4
  %60 = getelementptr inbounds %struct.packet* %58, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 6, i32* %60
  %61 = getelementptr inbounds %struct.packet* %58, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %61
  %62 = getelementptr inbounds %struct.packet* %58, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %62
  %63 = malloc %struct.packet                     ; <%struct.packet*> [#uses=6]
  %scevgep.i1 = getelementptr %struct.packet* %63, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep2.i2 = bitcast i8* %scevgep.i1 to i32*  ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep2.i2, align 4
  %64 = getelementptr inbounds %struct.packet* %63, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %58, %struct.packet** %64, align 4
  %65 = getelementptr inbounds %struct.packet* %63, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 6, i32* %65
  %66 = getelementptr inbounds %struct.packet* %63, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 1000, i32* %66
  %67 = getelementptr inbounds %struct.packet* %63, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %67
  %68 = malloc %struct.task                       ; <%struct.task*> [#uses=10]
  store %struct.task* %68, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 4), align 16
  %69 = getelementptr inbounds %struct.task* %68, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  store %struct.task* %44, %struct.task** %69, align 4
  %70 = getelementptr inbounds %struct.task* %68, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 4, i32* %70
  %71 = getelementptr inbounds %struct.task* %68, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 3000, i32* %71
  %72 = getelementptr inbounds %struct.task* %68, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  store %struct.packet* %63, %struct.packet** %72
  %73 = getelementptr inbounds %struct.task* %68, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 3, i32* %73
  %74 = getelementptr inbounds %struct.task* %68, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  store %struct.task* (%struct.packet*)* @handlerfn, %struct.task* (%struct.packet*)** %74
  %75 = getelementptr inbounds %struct.task* %68, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 0, i32* %75
  %76 = getelementptr inbounds %struct.task* %68, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 0, i32* %76
  %77 = malloc %struct.task                       ; <%struct.task*> [#uses=10]
  store %struct.task* %77, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 5), align 4
  %78 = getelementptr inbounds %struct.task* %77, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  store %struct.task* %68, %struct.task** %78, align 4
  %79 = getelementptr inbounds %struct.task* %77, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 5, i32* %79
  %80 = getelementptr inbounds %struct.task* %77, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 4000, i32* %80
  %81 = getelementptr inbounds %struct.task* %77, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %81
  %82 = getelementptr inbounds %struct.task* %77, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 2, i32* %82
  %83 = getelementptr inbounds %struct.task* %77, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %83
  %84 = getelementptr inbounds %struct.task* %77, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 0, i32* %84
  %85 = getelementptr inbounds %struct.task* %77, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 0, i32* %85
  %86 = malloc %struct.task                       ; <%struct.task*> [#uses=10]
  store %struct.task* %86, %struct.task** getelementptr inbounds ([11 x %struct.task*]* @tasktab, i32 0, i32 6), align 8
  %87 = getelementptr inbounds %struct.task* %86, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  store %struct.task* %77, %struct.task** %87, align 4
  %88 = getelementptr inbounds %struct.task* %86, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 6, i32* %88
  %89 = getelementptr inbounds %struct.task* %86, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 5000, i32* %89
  %90 = getelementptr inbounds %struct.task* %86, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  store %struct.packet* null, %struct.packet** %90
  %91 = getelementptr inbounds %struct.task* %86, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 2, i32* %91
  %92 = getelementptr inbounds %struct.task* %86, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  store %struct.task* (%struct.packet*)* @devfn, %struct.task* (%struct.packet*)** %92
  %93 = getelementptr inbounds %struct.task* %86, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 0, i32* %93
  %94 = getelementptr inbounds %struct.task* %86, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 0, i32* %94
  store %struct.task* %86, %struct.task** @tcb, align 4
  store i32 0, i32* @holdcount, align 4
  store i32 0, i32* @qpktcount, align 4
  %95 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  store i1 true, i1* @tracing.b
  store i32 0, i32* @layout, align 4
  %.pr.i = load %struct.task** @tcb               ; <%struct.task*> [#uses=3]
  br label %bb6.i

bb.i:                                             ; preds = %bb6.i
  %96 = getelementptr inbounds %struct.task* %135, i32 0, i32 4 ; <i32*> [#uses=1]
  %97 = load i32* %96, align 4                    ; <i32> [#uses=1]
  switch i32 %97, label %schedule.exit [
    i32 0, label %bb2.i
    i32 1, label %bb2.i
    i32 2, label %bb5.i
    i32 3, label %bb1.i
    i32 4, label %bb5.i
    i32 5, label %bb5.i
    i32 6, label %bb5.i
    i32 7, label %bb5.i
  ]

bb1.i:                                            ; preds = %bb.i
  %98 = getelementptr inbounds %struct.task* %135, i32 0, i32 3 ; <%struct.packet**> [#uses=2]
  %99 = load %struct.packet** %98, align 4        ; <%struct.packet*> [#uses=2]
  %100 = getelementptr inbounds %struct.packet* %99, i32 0, i32 0 ; <%struct.packet**> [#uses=1]
  %101 = load %struct.packet** %100, align 4      ; <%struct.packet*> [#uses=1]
  store %struct.packet* %101, %struct.packet** %98, align 4
  %102 = load %struct.task** @tcb, align 4        ; <%struct.task*> [#uses=2]
  %103 = getelementptr inbounds %struct.task* %102, i32 0, i32 3 ; <%struct.packet**> [#uses=1]
  %104 = load %struct.packet** %103, align 4      ; <%struct.packet*> [#uses=1]
  %105 = icmp ne %struct.packet* %104, null       ; <i1> [#uses=1]
  %106 = zext i1 %105 to i32                      ; <i32> [#uses=1]
  %107 = getelementptr inbounds %struct.task* %102, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 %106, i32* %107, align 4
  %.pre.i = load %struct.task** @tcb, align 4     ; <%struct.task*> [#uses=2]
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i, %bb.i, %bb.i
  %.rle1 = phi %struct.task* [ %.pre.i, %bb1.i ], [ %.rle2, %bb.i ], [ %.rle2, %bb.i ] ; <%struct.task*> [#uses=1]
  %108 = phi %struct.task* [ %.pre.i, %bb1.i ], [ %135, %bb.i ], [ %135, %bb.i ] ; <%struct.task*> [#uses=3]
  %pkt.0.i = phi %struct.packet* [ %99, %bb1.i ], [ null, %bb.i ], [ null, %bb.i ] ; <%struct.packet*> [#uses=1]
  %109 = getelementptr inbounds %struct.task* %108, i32 0, i32 1 ; <i32*> [#uses=1]
  %110 = load i32* %109, align 4                  ; <i32> [#uses=2]
  store i32 %110, i32* @taskid, align 4
  %111 = getelementptr inbounds %struct.task* %108, i32 0, i32 6 ; <i32*> [#uses=1]
  %112 = load i32* %111, align 4                  ; <i32> [#uses=1]
  store i32 %112, i32* @v1, align 4
  %113 = getelementptr inbounds %struct.task* %108, i32 0, i32 7 ; <i32*> [#uses=1]
  %114 = load i32* %113, align 4                  ; <i32> [#uses=1]
  store i32 %114, i32* @v2, align 4
  %.b.i = load i1* @tracing.b                     ; <i1> [#uses=1]
  br i1 %.b.i, label %bb4.i, label %bb3.i

bb3.i:                                            ; preds = %bb2.i
  %115 = trunc i32 %110 to i8                     ; <i8> [#uses=1]
  %116 = add i8 %115, 48                          ; <i8> [#uses=1]
  %117 = load i32* @layout, align 4               ; <i32> [#uses=1]
  %118 = add i32 %117, -1                         ; <i32> [#uses=2]
  store i32 %118, i32* @layout, align 4
  %119 = icmp sgt i32 %118, 0                     ; <i1> [#uses=1]
  br i1 %119, label %trace.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb3.i
  %120 = tail call i32 @putchar(i32 10) nounwind  ; <i32> [#uses=0]
  store i32 50, i32* @layout, align 4
  br label %trace.exit.i

trace.exit.i:                                     ; preds = %bb.i.i, %bb3.i
  %121 = sext i8 %116 to i32                      ; <i32> [#uses=1]
  %122 = tail call i32 @putchar(i32 %121) nounwind ; <i32> [#uses=0]
  %.pre = load %struct.task** @tcb, align 4       ; <%struct.task*> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %trace.exit.i, %bb2.i
  %123 = phi %struct.task* [ %.pre, %trace.exit.i ], [ %.rle1, %bb2.i ] ; <%struct.task*> [#uses=1]
  %124 = getelementptr inbounds %struct.task* %123, i32 0, i32 5 ; <%struct.task* (%struct.packet*)**> [#uses=1]
  %125 = load %struct.task* (%struct.packet*)** %124, align 4 ; <%struct.task* (%struct.packet*)*> [#uses=1]
  %126 = tail call %struct.task* %125(%struct.packet* %pkt.0.i) nounwind ; <%struct.task*> [#uses=2]
  %127 = load %struct.task** @tcb, align 4        ; <%struct.task*> [#uses=1]
  %128 = load i32* @v1, align 4                   ; <i32> [#uses=1]
  %129 = getelementptr inbounds %struct.task* %127, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 %128, i32* %129, align 4
  %130 = load %struct.task** @tcb, align 4        ; <%struct.task*> [#uses=1]
  %131 = load i32* @v2, align 4                   ; <i32> [#uses=1]
  %132 = getelementptr inbounds %struct.task* %130, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 %131, i32* %132, align 4
  br label %bb6.backedge.i

bb6.backedge.i:                                   ; preds = %bb5.i, %bb4.i
  %storemerge.i = phi %struct.task* [ %126, %bb4.i ], [ %134, %bb5.i ] ; <%struct.task*> [#uses=3]
  %.be.i = phi %struct.task* [ %134, %bb5.i ], [ %126, %bb4.i ] ; <%struct.task*> [#uses=1]
  store %struct.task* %storemerge.i, %struct.task** @tcb
  br label %bb6.i

bb5.i:                                            ; preds = %bb.i, %bb.i, %bb.i, %bb.i, %bb.i
  %133 = getelementptr inbounds %struct.task* %135, i32 0, i32 0 ; <%struct.task**> [#uses=1]
  %134 = load %struct.task** %133, align 4        ; <%struct.task*> [#uses=2]
  br label %bb6.backedge.i

bb6.i:                                            ; preds = %bb6.backedge.i, %entry
  %.rle2 = phi %struct.task* [ %storemerge.i, %bb6.backedge.i ], [ %.pr.i, %entry ] ; <%struct.task*> [#uses=2]
  %135 = phi %struct.task* [ %storemerge.i, %bb6.backedge.i ], [ %.pr.i, %entry ] ; <%struct.task*> [#uses=5]
  %136 = phi %struct.task* [ %.pr.i, %entry ], [ %.be.i, %bb6.backedge.i ] ; <%struct.task*> [#uses=1]
  %137 = icmp eq %struct.task* %136, null         ; <i1> [#uses=1]
  br i1 %137, label %schedule.exit, label %bb.i

schedule.exit:                                    ; preds = %bb6.i, %bb.i
  %138 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %139 = load i32* @holdcount, align 4            ; <i32> [#uses=1]
  %140 = load i32* @qpktcount, align 4            ; <i32> [#uses=1]
  %141 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([33 x i8]* @.str4, i32 0, i32 0), i32 %140, i32 %139) nounwind ; <i32> [#uses=0]
  %142 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([19 x i8]* @.str5, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %143 = load i32* @qpktcount, align 4            ; <i32> [#uses=1]
  %144 = icmp eq i32 %143, 23263894               ; <i1> [#uses=1]
  br i1 %144, label %bb, label %bb3

bb:                                               ; preds = %schedule.exit
  %145 = load i32* @holdcount, align 4            ; <i32> [#uses=1]
  %146 = icmp eq i32 %145, 9305557                ; <i1> [#uses=1]
  br i1 %146, label %bb2, label %bb3

bb2:                                              ; preds = %bb
  %147 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb4

bb3:                                              ; preds = %bb, %schedule.exit
  %148 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([10 x i8]* @.str7, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb4

bb4:                                              ; preds = %bb3, %bb2
  %retval1.0 = phi i32 [ 1, %bb3 ], [ 0, %bb2 ]   ; <i32> [#uses=1]
  %149 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 %retval1.0
}

declare i32 @puts(i8* nocapture) nounwind
