; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/forAndIf.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"one\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"two\0A\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"three\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"sneaky four\0A\00", align 1

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
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %cmp2 = icmp ne i32 %tmp1, 4
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  br label %while.cond

while.cond:                                       ; preds = %if.then
  %tmp3 = load i32* %i, align 4
  %cmp4 = icmp eq i32 %tmp3, 1
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  br label %while.end

while.end:                                        ; preds = %while.body, %while.cond
  br label %while.cond5

while.cond5:                                      ; preds = %while.end
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp eq i32 %tmp6, 2
  br i1 %cmp7, label %while.body8, label %while.end10

while.body8:                                      ; preds = %while.cond5
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %while.end10

while.end10:                                      ; preds = %while.body8, %while.cond5
  br label %while.cond11

while.cond11:                                     ; preds = %while.end10
  %tmp12 = load i32* %i, align 4
  %cmp13 = icmp eq i32 %tmp12, 3
  br i1 %cmp13, label %while.body14, label %while.end16

while.body14:                                     ; preds = %while.cond11
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0))
  br label %while.end16

while.end16:                                      ; preds = %while.body14, %while.cond11
  br label %if.end

if.else:                                          ; preds = %for.body
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %while.end16
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp18 = load i32* %i, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @printf(i8*, ...)
