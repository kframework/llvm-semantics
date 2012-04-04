; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/testtrace.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DummyStruct = type { %struct.DummyStruct*, i32 }

@.str = private unnamed_addr constant [28 x i8] c"&S1 = %p\09&S2 = %p\09&S3 = %p\0A\00", align 1
@testAllocaOrder.count = internal unnamed_addr global i32 0, align 4
@.str1 = private unnamed_addr constant [10 x i8] c"sum = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"-d\00", align 1

define i32 @AddCounts(%struct.DummyStruct* %S1, %struct.DummyStruct* %S2, %struct.DummyStruct* %S3, i32 %noPrint) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %noPrint, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), %struct.DummyStruct* %S1, %struct.DummyStruct* %S2, %struct.DummyStruct* %S3) nounwind
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %seqnum = getelementptr inbounds %struct.DummyStruct* %S1, i64 0, i32 1
  %0 = load i32* %seqnum, align 4, !tbaa !0
  %seqnum1 = getelementptr inbounds %struct.DummyStruct* %S2, i64 0, i32 1
  %1 = load i32* %seqnum1, align 4, !tbaa !0
  %seqnum2 = getelementptr inbounds %struct.DummyStruct* %S3, i64 0, i32 1
  %2 = load i32* %seqnum2, align 4, !tbaa !0
  %add = add i32 %1, %0
  %add3 = add i32 %add, %2
  ret i32 %add3
}

declare i32 @printf(i8* nocapture, ...) nounwind

define void @testAllocaOrder(i32 %noPrint) nounwind uwtable {
entry:
  %S1 = alloca %struct.DummyStruct, align 8
  %S2 = alloca %struct.DummyStruct, align 8
  %S3 = alloca %struct.DummyStruct, align 8
  %0 = load i32* @testAllocaOrder.count, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  %seqnum = getelementptr inbounds %struct.DummyStruct* %S1, i64 0, i32 1
  store i32 %inc, i32* %seqnum, align 8, !tbaa !0
  %inc1 = add nsw i32 %0, 2
  %seqnum2 = getelementptr inbounds %struct.DummyStruct* %S2, i64 0, i32 1
  store i32 %inc1, i32* %seqnum2, align 8, !tbaa !0
  %inc3 = add nsw i32 %0, 3
  store i32 %inc3, i32* @testAllocaOrder.count, align 4, !tbaa !0
  %seqnum4 = getelementptr inbounds %struct.DummyStruct* %S3, i64 0, i32 1
  store i32 %inc3, i32* %seqnum4, align 8, !tbaa !0
  %tobool.i = icmp eq i32 %noPrint, 0
  br i1 %tobool.i, label %if.then.i, label %AddCounts.exit

if.then.i:                                        ; preds = %entry
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), %struct.DummyStruct* %S1, %struct.DummyStruct* %S2, %struct.DummyStruct* %S3) nounwind
  %.pre = load i32* %seqnum, align 8, !tbaa !0
  %.pre6 = load i32* %seqnum2, align 8, !tbaa !0
  %.pre7 = load i32* %seqnum4, align 8, !tbaa !0
  br label %AddCounts.exit

AddCounts.exit:                                   ; preds = %entry, %if.then.i
  %1 = phi i32 [ %inc3, %entry ], [ %.pre7, %if.then.i ]
  %2 = phi i32 [ %inc1, %entry ], [ %.pre6, %if.then.i ]
  %3 = phi i32 [ %inc, %entry ], [ %.pre, %if.then.i ]
  %add.i = add i32 %2, %3
  %add3.i = add i32 %add.i, %1
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i64 0, i64 0), i32 %add3.i) nounwind
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %S1.i = alloca %struct.DummyStruct, align 8
  %S2.i = alloca %struct.DummyStruct, align 8
  %S3.i = alloca %struct.DummyStruct, align 8
  %cmp = icmp sgt i32 %argc, 1
  br i1 %cmp, label %if.end, label %if.end.thread

if.end.thread:                                    ; preds = %entry
  %0 = bitcast %struct.DummyStruct* %S1.i to i8*
  %1 = bitcast %struct.DummyStruct* %S2.i to i8*
  %2 = bitcast %struct.DummyStruct* %S3.i to i8*
  %seqnum.i4 = getelementptr inbounds %struct.DummyStruct* %S1.i, i64 0, i32 1
  %seqnum2.i5 = getelementptr inbounds %struct.DummyStruct* %S2.i, i64 0, i32 1
  %seqnum4.i6 = getelementptr inbounds %struct.DummyStruct* %S3.i, i64 0, i32 1
  br label %if.end.if.end.split_crit_edge

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %3 = load i8** %arrayidx, align 8, !tbaa !3
  %call = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0)) nounwind
  %phitmp = icmp eq i32 %call, 0
  %4 = bitcast %struct.DummyStruct* %S1.i to i8*
  %5 = bitcast %struct.DummyStruct* %S2.i to i8*
  %6 = bitcast %struct.DummyStruct* %S3.i to i8*
  %seqnum.i = getelementptr inbounds %struct.DummyStruct* %S1.i, i64 0, i32 1
  %seqnum2.i = getelementptr inbounds %struct.DummyStruct* %S2.i, i64 0, i32 1
  %seqnum4.i = getelementptr inbounds %struct.DummyStruct* %S3.i, i64 0, i32 1
  br i1 %phitmp, label %testAllocaOrder.exit.us, label %if.end.if.end.split_crit_edge

if.end.if.end.split_crit_edge:                    ; preds = %if.end.thread, %if.end
  %seqnum4.i9 = phi i32* [ %seqnum4.i6, %if.end.thread ], [ %seqnum4.i, %if.end ]
  %seqnum2.i8 = phi i32* [ %seqnum2.i5, %if.end.thread ], [ %seqnum2.i, %if.end ]
  %seqnum.i7 = phi i32* [ %seqnum.i4, %if.end.thread ], [ %seqnum.i, %if.end ]
  %7 = phi i8* [ %2, %if.end.thread ], [ %6, %if.end ]
  %8 = phi i8* [ %1, %if.end.thread ], [ %5, %if.end ]
  %9 = phi i8* [ %0, %if.end.thread ], [ %4, %if.end ]
  br label %testAllocaOrder.exit

testAllocaOrder.exit.us:                          ; preds = %testAllocaOrder.exit.us, %if.end
  %i.02.us = phi i32 [ %inc.us, %testAllocaOrder.exit.us ], [ 0, %if.end ]
  call void @llvm.lifetime.start(i64 -1, i8* %4) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %5) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %6) nounwind
  %10 = load i32* @testAllocaOrder.count, align 4, !tbaa !0
  %inc.i.us = add nsw i32 %10, 1
  store i32 %inc.i.us, i32* %seqnum.i, align 8, !tbaa !0
  %inc1.i.us = add nsw i32 %10, 2
  store i32 %inc1.i.us, i32* %seqnum2.i, align 8, !tbaa !0
  %inc3.i.us = add nsw i32 %10, 3
  store i32 %inc3.i.us, i32* @testAllocaOrder.count, align 4, !tbaa !0
  store i32 %inc3.i.us, i32* %seqnum4.i, align 8, !tbaa !0
  %call.i.i.us = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), %struct.DummyStruct* %S1.i, %struct.DummyStruct* %S2.i, %struct.DummyStruct* %S3.i) nounwind
  %.pre.i.us = load i32* %seqnum.i, align 8, !tbaa !0
  %.pre6.i.us = load i32* %seqnum2.i, align 8, !tbaa !0
  %.pre7.i.us = load i32* %seqnum4.i, align 8, !tbaa !0
  %add.i.i.us = add i32 %.pre6.i.us, %.pre7.i.us
  %add3.i.i.us = add i32 %add.i.i.us, %.pre.i.us
  %call5.i.us = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i64 0, i64 0), i32 %add3.i.i.us) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %4) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %5) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %6) nounwind
  %inc.us = add i32 %i.02.us, 1
  %exitcond = icmp eq i32 %inc.us, 10
  br i1 %exitcond, label %for.end, label %testAllocaOrder.exit.us

testAllocaOrder.exit:                             ; preds = %if.end.if.end.split_crit_edge, %testAllocaOrder.exit
  %i.02 = phi i32 [ 0, %if.end.if.end.split_crit_edge ], [ %inc, %testAllocaOrder.exit ]
  call void @llvm.lifetime.start(i64 -1, i8* %9) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %8) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %7) nounwind
  %11 = load i32* @testAllocaOrder.count, align 4, !tbaa !0
  %inc.i = add nsw i32 %11, 1
  store i32 %inc.i, i32* %seqnum.i7, align 8, !tbaa !0
  %inc1.i = add nsw i32 %11, 2
  store i32 %inc1.i, i32* %seqnum2.i8, align 8, !tbaa !0
  %inc3.i = add nsw i32 %11, 3
  store i32 %inc3.i, i32* @testAllocaOrder.count, align 4, !tbaa !0
  store i32 %inc3.i, i32* %seqnum4.i9, align 8, !tbaa !0
  %add.i.i = add i32 %inc1.i, %inc3.i
  %add3.i.i = add i32 %add.i.i, %inc.i
  %call5.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i64 0, i64 0), i32 %add3.i.i) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %9) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %8) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %7) nounwind
  %inc = add i32 %i.02, 1
  %exitcond3 = icmp eq i32 %inc, 10
  br i1 %exitcond3, label %for.end, label %testAllocaOrder.exit

for.end:                                          ; preds = %testAllocaOrder.exit, %testAllocaOrder.exit.us
  ret i32 0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
