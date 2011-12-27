; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/nestedContinue.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"done\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp1 = load i32* %i, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %i, align 4
  %tmp2 = load i32* %i, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  store i32 10, i32* %i4, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
