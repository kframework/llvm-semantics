; ModuleID = '/home/david/src/c-semantics/tests/unitTests/percentX.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%x\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%X\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.010 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %i.010) nounwind
  %inc = add nsw i32 %i.010, 1
  %exitcond11 = icmp eq i32 %inc, 258
  br i1 %exitcond11, label %for.body4, label %for.body

for.body4:                                        ; preds = %for.body, %for.body4
  %i1.09 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.body ]
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %i1.09) nounwind
  %inc7 = add nsw i32 %i1.09, 1
  %exitcond = icmp eq i32 %inc7, 258
  br i1 %exitcond, label %for.end8, label %for.body4

for.end8:                                         ; preds = %for.body4
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
