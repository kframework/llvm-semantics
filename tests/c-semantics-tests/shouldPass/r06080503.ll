; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/r06080503.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"b=%d, j=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [18 x i8] c"b=%d, i=%d, j=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"test1:\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"test2:\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"test3:\0A\00", align 1

define i32 @f1() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %0 = load i32* %j, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 1, i32 %0)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %2 = load i32* %j, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %4 = load i32* %j, align 4
  %add = add nsw i32 %4, 0
  store i32 %add, i32* %j, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 0, i32 %3, i32 %add)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %conv = sext i32 %5 to i64
  %add2 = add i64 %conv, 4
  %conv3 = trunc i64 %add2 to i32
  store i32 %conv3, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @printf(i8*, ...)

define i32 @f2() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %0 = load i32* %j, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 1, i32 %0)
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32* %i, align 4
  %2 = load i32* %j, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32* %i, align 4
  %4 = load i32* %j, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, i32* %j, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 1, i32 %3, i32 %add)
  %5 = load i32* %i, align 4
  %conv = sext i32 %5 to i64
  %add2 = add i64 %conv, 4
  %conv3 = trunc i64 %add2 to i32
  store i32 %conv3, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

define i32 @f3() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %3 = load i32* %j, align 4
  %add = add nsw i32 %3, 0
  store i32 %add, i32* %j, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 0, i32 %2, i32 %add)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %conv = sext i32 %4 to i64
  %add1 = add i64 %conv, 4
  %conv2 = trunc i64 %add1 to i32
  store i32 %conv2, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0))
  %call1 = call i32 @f1()
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  %call3 = call i32 @f2()
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  %call5 = call i32 @f3()
  ret i32 0
}
