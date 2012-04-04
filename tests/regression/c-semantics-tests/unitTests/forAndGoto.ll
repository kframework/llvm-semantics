; ModuleID = '/home/david/src/c-semantics/tests/unitTests/forAndGoto.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"one\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"two\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"sneaky four\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %inMain = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 2, i32* %inMain, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %cmp1 = icmp ne i32 %1, 4
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %cmp2 = icmp eq i32 %2, 1
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  br label %one

one:                                              ; preds = %if.then3
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %one, %if.then
  br label %while.cond

while.cond:                                       ; preds = %if.end
  %3 = load i32* %i, align 4
  %cmp4 = icmp eq i32 %3, 2
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %two

two:                                              ; preds = %while.body
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %while.end

while.end:                                        ; preds = %two, %while.cond
  br label %if.end7

if.else:                                          ; preds = %for.body
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0))
  br label %if.end7

if.end7:                                          ; preds = %if.else, %while.end
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @printf(i8*, ...)
