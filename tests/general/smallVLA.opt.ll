; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/smallVLA.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @main() nounwind uwtable {
for.body9.lr.ph.1:
  %0 = tail call i8* @llvm.stacksave()
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %putchar = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %0)
  %1 = tail call i8* @llvm.stacksave()
  br label %for.body9.1

for.body9.1:                                      ; preds = %for.body9.1, %for.body9.lr.ph.1
  %2 = phi i32 [ 0, %for.body9.lr.ph.1 ], [ %3, %for.body9.1 ]
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %2) nounwind
  %3 = add nsw i32 %2, 1
  %exitcond.1 = icmp eq i32 %3, 3
  br i1 %exitcond.1, label %for.body9.lr.ph.2, label %for.body9.1

for.body9.2:                                      ; preds = %for.body9.2, %for.body9.lr.ph.2
  %4 = phi i32 [ 0, %for.body9.lr.ph.2 ], [ %5, %for.body9.2 ]
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %4) nounwind
  %5 = add nsw i32 %4, 1
  %exitcond.2 = icmp eq i32 %5, 5
  br i1 %exitcond.2, label %for.body9.lr.ph.3, label %for.body9.2

for.body9.lr.ph.2:                                ; preds = %for.body9.1
  %putchar.1 = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %1)
  %6 = tail call i8* @llvm.stacksave()
  br label %for.body9.2

for.body9.3:                                      ; preds = %for.body9.3, %for.body9.lr.ph.3
  %7 = phi i32 [ 0, %for.body9.lr.ph.3 ], [ %8, %for.body9.3 ]
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %7) nounwind
  %8 = add nsw i32 %7, 1
  %exitcond.3 = icmp eq i32 %8, 7
  br i1 %exitcond.3, label %for.body9.lr.ph.4, label %for.body9.3

for.body9.lr.ph.3:                                ; preds = %for.body9.2
  %putchar.2 = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %6)
  %9 = tail call i8* @llvm.stacksave()
  br label %for.body9.3

for.end.4:                                        ; preds = %for.body9.4
  %putchar.4 = tail call i32 @putchar(i32 10) nounwind
  ret i32 0

for.body9.4:                                      ; preds = %for.body9.4, %for.body9.lr.ph.4
  %10 = phi i32 [ 0, %for.body9.lr.ph.4 ], [ %11, %for.body9.4 ]
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 %10) nounwind
  %11 = add nsw i32 %10, 1
  %exitcond.4 = icmp eq i32 %11, 9
  br i1 %exitcond.4, label %for.end.4, label %for.body9.4

for.body9.lr.ph.4:                                ; preds = %for.body9.3
  %putchar.3 = tail call i32 @putchar(i32 10) nounwind
  tail call void @llvm.stackrestore(i8* %9)
  br label %for.body9.4
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.stackrestore(i8*) nounwind

declare i32 @putchar(i32)
