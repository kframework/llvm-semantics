; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/percentX.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%x\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%X\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 258
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i4, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc11, %for.end
  %tmp6 = load i32* %i4, align 4
  %cmp7 = icmp slt i32 %tmp6, 258
  br i1 %cmp7, label %for.body8, label %for.end14

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %i4, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp9)
  br label %for.inc11

for.inc11:                                        ; preds = %for.body8
  %tmp12 = load i32* %i4, align 4
  %inc13 = add nsw i32 %tmp12, 1
  store i32 %inc13, i32* %i4, align 4
  br label %for.cond5

for.end14:                                        ; preds = %for.cond5
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
