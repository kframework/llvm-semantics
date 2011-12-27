; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/wcharStrings.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"a\00\00\00b\00\00\00c\00\00\00d\00\00\00\00\00\00\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %cmp = icmp ult i64 %conv, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [5 x i32]* bitcast ([20 x i8]* @.str1 to [5 x i32]*), i32 0, i64 %idxprom
  %tmp3 = load i32* %arrayidx
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %tmp3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  %inc = add nsw i32 %tmp4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
