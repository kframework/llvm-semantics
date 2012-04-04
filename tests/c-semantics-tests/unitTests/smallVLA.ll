; ModuleID = '/home/david/src/c-semantics/tests/unitTests/smallVLA.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %saved_stack = alloca i8*
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  %2 = zext i32 %inc to i64
  %3 = call i8* @llvm.stacksave()
  store i8* %3, i8** %saved_stack
  %vla = alloca i32, i64 %2, align 16
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4
  %5 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %j, align 4
  %7 = load i32* %j, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds i32* %vla, i64 %idxprom
  store i32 %6, i32* %arrayidx, align 4
  %8 = load i32* %j, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds i32* %vla, i64 %idxprom4
  %9 = load i32* %arrayidx5, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %9)
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %10 = load i32* %j, align 4
  %inc6 = add nsw i32 %10, 1
  store i32 %inc6, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %11 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %11)
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %12 = load i32* %i, align 4
  %inc9 = add nsw i32 %12, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  ret i32 0
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
