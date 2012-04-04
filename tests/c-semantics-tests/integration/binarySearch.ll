; ModuleID = '/home/david/src/c-semantics/tests/integration/binarySearch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Couldn't find %d in array:\0A\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"a[%d] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"present_val == a[found_at]\0A\00", align 1
@.str3 = private unnamed_addr constant [17 x i8] c"looking for %d, \00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"found %d\0A\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"BUG present_val == a[found_at]\0A\00", align 1

define i32 @binary_search(i32* %a, i32 %low, i32 %high, i32 %target) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %low.addr = alloca i32, align 4
  %high.addr = alloca i32, align 4
  %target.addr = alloca i32, align 4
  %origLow = alloca i32, align 4
  %origHigh = alloca i32, align 4
  %middle = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %low, i32* %low.addr, align 4
  store i32 %high, i32* %high.addr, align 4
  store i32 %target, i32* %target.addr, align 4
  %0 = load i32* %low.addr, align 4
  store i32 %0, i32* %origLow, align 4
  %1 = load i32* %high.addr, align 4
  store i32 %1, i32* %origHigh, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end9, %entry
  %2 = load i32* %low.addr, align 4
  %3 = load i32* %high.addr, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32* %low.addr, align 4
  %5 = load i32* %high.addr, align 4
  %6 = load i32* %low.addr, align 4
  %sub = sub nsw i32 %5, %6
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %4, %div
  store i32 %add, i32* %middle, align 4
  %7 = load i32* %target.addr, align 4
  %8 = load i32* %middle, align 4
  %idxprom = sext i32 %8 to i64
  %9 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %9, i64 %idxprom
  %10 = load i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %7, %10
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %11 = load i32* %middle, align 4
  %sub2 = sub nsw i32 %11, 1
  store i32 %sub2, i32* %high.addr, align 4
  br label %if.end9

if.else:                                          ; preds = %while.body
  %12 = load i32* %target.addr, align 4
  %13 = load i32* %middle, align 4
  %idxprom3 = sext i32 %13 to i64
  %14 = load i32** %a.addr, align 8
  %arrayidx4 = getelementptr inbounds i32* %14, i64 %idxprom3
  %15 = load i32* %arrayidx4, align 4
  %cmp5 = icmp sgt i32 %12, %15
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else
  %16 = load i32* %middle, align 4
  %add7 = add nsw i32 %16, 1
  store i32 %add7, i32* %low.addr, align 4
  br label %if.end

if.else8:                                         ; preds = %if.else
  %17 = load i32* %middle, align 4
  store i32 %17, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load i32* %target.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i32 %18)
  %19 = load i32* %origLow, align 4
  store i32 %19, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %20 = load i32* %i, align 4
  %21 = load i32* %origHigh, align 4
  %cmp10 = icmp slt i32 %20, %21
  br i1 %cmp10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load i32* %i, align 4
  %23 = load i32* %i, align 4
  %idxprom11 = sext i32 %23 to i64
  %24 = load i32** %a.addr, align 8
  %arrayidx12 = getelementptr inbounds i32* %24, i64 %idxprom11
  %25 = load i32* %arrayidx12, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %22, i32 %25)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.else8
  %27 = load i32* %retval
  ret i32 %27
}

declare i32 @printf(i8*, ...)

define void @insertion_sort(i32* %a, i32 %length) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %length.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  store i32 %4, i32* %v, align 4
  %5 = load i32* %i, align 4
  %sub = sub nsw i32 %5, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32* %j, align 4
  %cmp2 = icmp sge i32 %6, 0
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load i32* %j, align 4
  %idxprom4 = sext i32 %7 to i64
  %8 = load i32** %a.addr, align 8
  %arrayidx5 = getelementptr inbounds i32* %8, i64 %idxprom4
  %9 = load i32* %arrayidx5, align 4
  %10 = load i32* %v, align 4
  %cmp6 = icmp sle i32 %9, %10
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  br label %for.end

if.end:                                           ; preds = %for.body3
  %11 = load i32* %j, align 4
  %idxprom7 = sext i32 %11 to i64
  %12 = load i32** %a.addr, align 8
  %arrayidx8 = getelementptr inbounds i32* %12, i64 %idxprom7
  %13 = load i32* %arrayidx8, align 4
  %14 = load i32* %j, align 4
  %add = add nsw i32 %14, 1
  %idxprom9 = sext i32 %add to i64
  %15 = load i32** %a.addr, align 8
  %arrayidx10 = getelementptr inbounds i32* %15, i64 %idxprom9
  store i32 %13, i32* %arrayidx10, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %16 = load i32* %j, align 4
  %dec = add nsw i32 %16, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %if.then, %for.cond1
  %17 = load i32* %v, align 4
  %18 = load i32* %j, align 4
  %add11 = add nsw i32 %18, 1
  %idxprom12 = sext i32 %add11 to i64
  %19 = load i32** %a.addr, align 8
  %arrayidx13 = getelementptr inbounds i32* %19, i64 %idxprom12
  store i32 %17, i32* %arrayidx13, align 4
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %20 = load i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %num_elements = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  %present_val = alloca i32, align 4
  %found_at = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 15, i32* %num_elements, align 4
  %0 = load i32* %num_elements, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %a, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %num_elements, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.body
  %call2 = call i32 @rand() nounwind
  %4 = load i32* %num_elements, align 4
  %rem = srem i32 %call2, %4
  %5 = load i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32** %a, align 8
  %arrayidx = getelementptr inbounds i32* %6, i64 %idxprom
  store i32 %rem, i32* %arrayidx, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %7 = load i32* %i, align 4
  %idxprom3 = sext i32 %7 to i64
  %8 = load i32** %a, align 8
  %arrayidx4 = getelementptr inbounds i32* %8, i64 %idxprom3
  %9 = load i32* %arrayidx4, align 4
  %10 = load i32* %num_elements, align 4
  %div = sdiv i32 %10, 7
  %cmp5 = icmp eq i32 %9, %div
  br i1 %cmp5, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %11 = load i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32** %a, align 8
  %13 = load i32* %num_elements, align 4
  call void @insertion_sort(i32* %12, i32 %13)
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc26, %for.end
  %14 = load i32* %i, align 4
  %cmp8 = icmp slt i32 %14, 10
  br i1 %cmp8, label %for.body10, label %for.end28

for.body10:                                       ; preds = %for.cond7
  %call11 = call i32 @rand() nounwind
  %15 = load i32* %num_elements, align 4
  %rem12 = srem i32 %call11, %15
  %idxprom13 = sext i32 %rem12 to i64
  %16 = load i32** %a, align 8
  %arrayidx14 = getelementptr inbounds i32* %16, i64 %idxprom13
  %17 = load i32* %arrayidx14, align 4
  store i32 %17, i32* %present_val, align 4
  %18 = load i32** %a, align 8
  %19 = load i32* %num_elements, align 4
  %sub = sub nsw i32 %19, 1
  %20 = load i32* %present_val, align 4
  %call15 = call i32 @binary_search(i32* %18, i32 0, i32 %sub, i32 %20)
  store i32 %call15, i32* %found_at, align 4
  %21 = load i32* %present_val, align 4
  %22 = load i32* %found_at, align 4
  %idxprom16 = sext i32 %22 to i64
  %23 = load i32** %a, align 8
  %arrayidx17 = getelementptr inbounds i32* %23, i64 %idxprom16
  %24 = load i32* %arrayidx17, align 4
  %cmp18 = icmp eq i32 %21, %24
  br i1 %cmp18, label %if.then, label %if.else

if.then:                                          ; preds = %for.body10
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %for.body10
  %25 = load i32* %present_val, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0), i32 %25)
  %26 = load i32* %found_at, align 4
  %idxprom22 = sext i32 %26 to i64
  %27 = load i32** %a, align 8
  %arrayidx23 = getelementptr inbounds i32* %27, i64 %idxprom22
  %28 = load i32* %arrayidx23, align 4
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i32 %28)
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc26

for.inc26:                                        ; preds = %if.end
  %29 = load i32* %i, align 4
  %inc27 = add nsw i32 %29, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond7

for.end28:                                        ; preds = %for.cond7
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @rand() nounwind
