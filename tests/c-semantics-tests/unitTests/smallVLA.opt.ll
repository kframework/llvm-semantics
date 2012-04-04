; ModuleID = '/home/david/src/c-semantics/tests/unitTests/smallVLA.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @main() nounwind uwtable {
for.body3.lr.ph.1:
  %0 = tail call i8* @llvm.stacksave()
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %putchar = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %0)
  %1 = tail call i8* @llvm.stacksave()
  br label %for.body3.1

for.body3.1:                                      ; preds = %for.body3.1, %for.body3.lr.ph.1
  %j.013.1 = phi i32 [ 0, %for.body3.lr.ph.1 ], [ %inc6.1, %for.body3.1 ]
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %j.013.1) nounwind
  %inc6.1 = add nsw i32 %j.013.1, 1
  %exitcond.1 = icmp eq i32 %inc6.1, 3
  br i1 %exitcond.1, label %for.body3.lr.ph.2, label %for.body3.1

for.body3.lr.ph.2:                                ; preds = %for.body3.1
  %putchar.1 = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %1)
  %2 = tail call i8* @llvm.stacksave()
  br label %for.body3.2

for.body3.2:                                      ; preds = %for.body3.2, %for.body3.lr.ph.2
  %j.013.2 = phi i32 [ 0, %for.body3.lr.ph.2 ], [ %inc6.2, %for.body3.2 ]
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %j.013.2) nounwind
  %inc6.2 = add nsw i32 %j.013.2, 1
  %exitcond.2 = icmp eq i32 %inc6.2, 5
  br i1 %exitcond.2, label %for.body3.lr.ph.3, label %for.body3.2

for.body3.lr.ph.3:                                ; preds = %for.body3.2
  %putchar.2 = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %2)
  %3 = tail call i8* @llvm.stacksave()
  br label %for.body3.3

for.body3.3:                                      ; preds = %for.body3.3, %for.body3.lr.ph.3
  %j.013.3 = phi i32 [ 0, %for.body3.lr.ph.3 ], [ %inc6.3, %for.body3.3 ]
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %j.013.3) nounwind
  %inc6.3 = add nsw i32 %j.013.3, 1
  %exitcond.3 = icmp eq i32 %inc6.3, 7
  br i1 %exitcond.3, label %for.body3.lr.ph.4, label %for.body3.3

for.body3.lr.ph.4:                                ; preds = %for.body3.3
  %putchar.3 = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %3)
  br label %for.body3.4

for.body3.4:                                      ; preds = %for.body3.4, %for.body3.lr.ph.4
  %j.013.4 = phi i32 [ 0, %for.body3.lr.ph.4 ], [ %inc6.4, %for.body3.4 ]
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %j.013.4) nounwind
  %inc6.4 = add nsw i32 %j.013.4, 1
  %exitcond.4 = icmp eq i32 %inc6.4, 9
  br i1 %exitcond.4, label %for.end.4, label %for.body3.4

for.end.4:                                        ; preds = %for.body3.4
  %putchar.4 = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.stackrestore(i8*) nounwind

declare i32 @putchar(i32)
