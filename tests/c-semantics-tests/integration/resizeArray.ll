; ModuleID = '/home/david/src/c-semantics/tests/integration/resizeArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Error: failed malloc\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"-- array after malloc\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c" a[%d] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"Error: failed realloc\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"\0A-- array after realloc\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %i, align 4
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %a, align 8
  %cmp = icmp eq i32* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0))
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32* %i, align 4
  %cmp3 = icmp slt i32 %2, 5
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32** %a, align 8
  %arrayidx = getelementptr inbounds i32* %5, i64 %idxprom
  store i32 %3, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc13, %for.end
  %7 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %7, 5
  br i1 %cmp7, label %for.body9, label %for.end15

for.body9:                                        ; preds = %for.cond6
  %8 = load i32* %i, align 4
  %9 = load i32* %i, align 4
  %idxprom10 = sext i32 %9 to i64
  %10 = load i32** %a, align 8
  %arrayidx11 = getelementptr inbounds i32* %10, i64 %idxprom10
  %11 = load i32* %arrayidx11, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %8, i32 %11)
  br label %for.inc13

for.inc13:                                        ; preds = %for.body9
  %12 = load i32* %i, align 4
  %inc14 = add nsw i32 %12, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond6

for.end15:                                        ; preds = %for.cond6
  %13 = load i32** %a, align 8
  %14 = bitcast i32* %13 to i8*
  %call16 = call i8* @realloc(i8* %14, i64 40) nounwind
  %15 = bitcast i8* %call16 to i32*
  store i32* %15, i32** %a, align 8
  %cmp17 = icmp eq i32* %15, null
  br i1 %cmp17, label %if.then19, label %if.end21

if.then19:                                        ; preds = %for.end15
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  store i32 1, i32* %retval
  br label %return

if.end21:                                         ; preds = %for.end15
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc28, %if.end21
  %16 = load i32* %i, align 4
  %cmp23 = icmp slt i32 %16, 10
  br i1 %cmp23, label %for.body25, label %for.end30

for.body25:                                       ; preds = %for.cond22
  %17 = load i32* %i, align 4
  %18 = load i32* %i, align 4
  %idxprom26 = sext i32 %18 to i64
  %19 = load i32** %a, align 8
  %arrayidx27 = getelementptr inbounds i32* %19, i64 %idxprom26
  store i32 %17, i32* %arrayidx27, align 4
  br label %for.inc28

for.inc28:                                        ; preds = %for.body25
  %20 = load i32* %i, align 4
  %inc29 = add nsw i32 %20, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond22

for.end30:                                        ; preds = %for.cond22
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc39, %for.end30
  %21 = load i32* %i, align 4
  %cmp33 = icmp slt i32 %21, 10
  br i1 %cmp33, label %for.body35, label %for.end41

for.body35:                                       ; preds = %for.cond32
  %22 = load i32* %i, align 4
  %23 = load i32* %i, align 4
  %idxprom36 = sext i32 %23 to i64
  %24 = load i32** %a, align 8
  %arrayidx37 = getelementptr inbounds i32* %24, i64 %idxprom36
  %25 = load i32* %arrayidx37, align 4
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %22, i32 %25)
  br label %for.inc39

for.inc39:                                        ; preds = %for.body35
  %26 = load i32* %i, align 4
  %inc40 = add nsw i32 %26, 1
  store i32 %inc40, i32* %i, align 4
  br label %for.cond32

for.end41:                                        ; preds = %for.cond32
  %27 = load i32** %a, align 8
  %28 = bitcast i32* %27 to i8*
  call void @free(i8* %28) nounwind
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end41, %if.then19, %if.then
  %29 = load i32* %retval
  ret i32 %29
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8*, ...)

declare i8* @realloc(i8*, i64) nounwind

declare void @free(i8*) nounwind
