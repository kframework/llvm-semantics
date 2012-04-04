; ModuleID = '/home/david/src/c-semantics/tests/unitTests/percentX.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%x\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%X\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 258
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i1, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc6, %for.end
  %3 = load i32* %i1, align 4
  %cmp3 = icmp slt i32 %3, 258
  br i1 %cmp3, label %for.body4, label %for.end8

for.body4:                                        ; preds = %for.cond2
  %4 = load i32* %i1, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %4)
  br label %for.inc6

for.inc6:                                         ; preds = %for.body4
  %5 = load i32* %i1, align 4
  %inc7 = add nsw i32 %5, 1
  store i32 %inc7, i32* %i1, align 4
  br label %for.cond2

for.end8:                                         ; preds = %for.cond2
  %6 = load i32* %retval
  ret i32 %6
}

declare i32 @printf(i8*, ...)
