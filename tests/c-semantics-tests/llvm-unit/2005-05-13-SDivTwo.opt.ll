; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2005-05-13-SDivTwo.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.02 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %sext = shl i32 %i.02, 24
  %conv1 = ashr exact i32 %sext, 24
  %div = sdiv i32 %conv1, 2
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %div) nounwind
  %inc = add nsw i32 %i.02, 1
  %cmp = icmp eq i32 %inc, 258
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
