; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/percentX.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%x\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%X\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %0 = phi i32 [ 0, %entry ], [ %1, %for.body ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %1 = add nsw i32 %0, 1
  %exitcond4 = icmp eq i32 %1, 258
  br i1 %exitcond4, label %for.body8, label %for.body

for.body8:                                        ; preds = %for.body, %for.body8
  %2 = phi i32 [ %3, %for.body8 ], [ 0, %for.body ]
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %2) nounwind
  %3 = add nsw i32 %2, 1
  %exitcond = icmp eq i32 %3, 258
  br i1 %exitcond, label %for.end14, label %for.body8

for.end14:                                        ; preds = %for.body8
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
