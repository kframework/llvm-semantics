; ModuleID = 'dry.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.RecordType = type { %struct.RecordType*, i32, i32, i32, [31 x i8] }

@.str = private constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str1 = private constant [31 x i8] c"DHRYSTONE PROGRAM, 1'ST STRING\00", align 1 ; <[31 x i8]*> [#uses=1]
@Array2Glob = internal global [51 x [51 x i32]] zeroinitializer, align 32 ; <[51 x [51 x i32]]*> [#uses=3]
@.str2 = private constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 1 ; <[31 x i8]*> [#uses=1]

declare i32 @clock(...)

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define i32 @main() nounwind {
entry:
  %0 = call i32 (...)* @clock() nounwind          ; <i32> [#uses=0]
  %1 = call i32 (...)* @clock() nounwind          ; <i32> [#uses=0]
  %2 = malloc %struct.RecordType                  ; <%struct.RecordType*> [#uses=1]
  %3 = malloc %struct.RecordType                  ; <%struct.RecordType*> [#uses=5]
  %4 = getelementptr inbounds %struct.RecordType* %3, i32 0, i32 0 ; <%struct.RecordType**> [#uses=3]
  store %struct.RecordType* %2, %struct.RecordType** %4, align 4
  %5 = getelementptr inbounds %struct.RecordType* %3, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds %struct.RecordType* %3, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 10001, i32* %6, align 4
  %7 = getelementptr inbounds %struct.RecordType* %3, i32 0, i32 3 ; <i32*> [#uses=2]
  store i32 40, i32* %7, align 4
  %8 = getelementptr inbounds %struct.RecordType* %3, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %8, i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 31, i32 1) nounwind
  store i32 10, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i32 8, i32 7), align 4
  %9 = call i32 (...)* @clock() nounwind          ; <i32> [#uses=0]
  br label %bb4.i

bb4.i:                                            ; preds = %bb15.i, %entry
  %i.112.i = phi i32 [ 0, %entry ], [ %25, %bb15.i ] ; <i32> [#uses=1]
  br label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i1.i, %bb4.i
  %IntLoc.01.i.i = phi i32 [ 1, %bb4.i ], [ %.IntLoc.0.i.i, %bb.i1.i ] ; <i32> [#uses=3]
  %10 = add nsw i32 %IntLoc.01.i.i, 1             ; <i32> [#uses=1]
  %11 = getelementptr inbounds [31 x i8]* @.str2, i32 0, i32 %10 ; <i8*> [#uses=1]
  %12 = load i8* %11, align 1                     ; <i8> [#uses=1]
  %13 = getelementptr inbounds [31 x i8]* @.str1, i32 0, i32 %IntLoc.01.i.i ; <i8*> [#uses=1]
  %14 = load i8* %13, align 1                     ; <i8> [#uses=1]
  %15 = icmp ne i8 %14, %12                       ; <i1> [#uses=1]
  %16 = zext i1 %15 to i32                        ; <i32> [#uses=1]
  %.IntLoc.0.i.i = add i32 %16, %IntLoc.01.i.i    ; <i32> [#uses=2]
  %phitmp.i.i = icmp sgt i32 %.IntLoc.0.i.i, 1    ; <i1> [#uses=1]
  br i1 %phitmp.i.i, label %bb.i.i, label %bb.i1.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i1.i
  %indvar.i.i = phi i32 [ %indvar.next.i.i, %bb.i.i ], [ 0, %bb.i1.i ] ; <i32> [#uses=3]
  %tmp4.i.i = add i32 %indvar.i.i, 9              ; <i32> [#uses=1]
  %tmp21.i = add i32 %indvar.i.i, 161             ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr [51 x [51 x i32]]* @Array2Glob, i32 0, i32 5, i32 %tmp21.i ; <i32*> [#uses=1]
  store i32 8, i32* %scevgep.i.i, align 4
  %17 = icmp sgt i32 %tmp4.i.i, 9                 ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %17, label %Proc8.exit.i, label %bb.i.i

Proc8.exit.i:                                     ; preds = %bb.i.i
  %18 = load i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i32 8, i32 7), align 4 ; <i32> [#uses=1]
  %19 = add nsw i32 %18, 1                        ; <i32> [#uses=1]
  store i32 %19, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i32 8, i32 7), align 4
  store i32 7, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i32 0, i32 28, i32 8), align 16
  store i32 5, i32* %7, align 4
  %20 = load %struct.RecordType** %4, align 4     ; <%struct.RecordType*> [#uses=1]
  %21 = getelementptr inbounds %struct.RecordType* %20, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 5, i32* %21, align 4
  %22 = load %struct.RecordType** %4, align 4     ; <%struct.RecordType*> [#uses=2]
  %23 = getelementptr inbounds %struct.RecordType* %22, i32 0, i32 0 ; <%struct.RecordType**> [#uses=1]
  store %struct.RecordType* %22, %struct.RecordType** %23, align 4
  br label %bb11.i

bb11.i:                                           ; preds = %bb11.i, %Proc8.exit.i
  %indvar.i = phi i8 [ 0, %Proc8.exit.i ], [ %indvar.next.i, %bb11.i ] ; <i8> [#uses=2]
  %tmp26.i = add i8 %indvar.i, 66                 ; <i8> [#uses=1]
  %24 = icmp sgt i8 %tmp26.i, 66                  ; <i1> [#uses=1]
  %indvar.next.i = add i8 %indvar.i, 1            ; <i8> [#uses=1]
  br i1 %24, label %bb15.i, label %bb11.i

bb15.i:                                           ; preds = %bb11.i
  %25 = add i32 %i.112.i, 1                       ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %25, 100000000        ; <i1> [#uses=1]
  br i1 %exitcond.i, label %Proc0.exit, label %bb4.i

Proc0.exit:                                       ; preds = %bb15.i
  ret i32 0
}
