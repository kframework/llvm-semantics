; ModuleID = '/home/david/src/c-semantics/tests/integration/quicksort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"SUCCESS\00", align 1

define void @insertion_sort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %num_elements.addr = alloca i64, align 8
  %element_size.addr = alloca i64, align 8
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %num_elements, i64* %num_elements.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64* %num_elements.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %sub = sub nsw i32 %2, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %cmp3 = icmp sge i32 %3, 0
  br i1 %cmp3, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %4 = load i8** %base.addr, align 8
  %5 = load i64* %element_size.addr, align 8
  %6 = load i32* %j, align 4
  %7 = load i32* %j, align 4
  %add = add nsw i32 %7, 1
  %8 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %call = call i32 @compare_elements_helper(i8* %4, i64 %5, i32 %6, i32 %add, i32 (i8*, i8*)* %8)
  %cmp6 = icmp slt i32 %call, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body5
  br label %for.end

if.end:                                           ; preds = %for.body5
  %9 = load i8** %base.addr, align 8
  %10 = load i64* %element_size.addr, align 8
  %11 = load i32* %j, align 4
  %12 = load i32* %j, align 4
  %add8 = add nsw i32 %12, 1
  call void @exchange_elements_helper(i8* %9, i64 %10, i32 %11, i32 %add8)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %if.then, %for.cond2
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %14 = load i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  ret void
}

define internal i32 @compare_elements_helper(i8* %base, i64 %element_size, i32 %idx1, i32 %idx2, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %element_size.addr = alloca i64, align 8
  %idx1.addr = alloca i32, align 4
  %idx2.addr = alloca i32, align 4
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %base_bytes = alloca i8*, align 8
  store i8* %base, i8** %base.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 %idx1, i32* %idx1.addr, align 4
  store i32 %idx2, i32* %idx2.addr, align 4
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  %0 = load i8** %base.addr, align 8
  store i8* %0, i8** %base_bytes, align 8
  %1 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %2 = load i32* %idx1.addr, align 4
  %conv = sext i32 %2 to i64
  %3 = load i64* %element_size.addr, align 8
  %mul = mul i64 %conv, %3
  %4 = load i8** %base_bytes, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 %mul
  %5 = load i32* %idx2.addr, align 4
  %conv1 = sext i32 %5 to i64
  %6 = load i64* %element_size.addr, align 8
  %mul2 = mul i64 %conv1, %6
  %7 = load i8** %base_bytes, align 8
  %arrayidx3 = getelementptr inbounds i8* %7, i64 %mul2
  %call = call i32 %1(i8* %arrayidx, i8* %arrayidx3)
  ret i32 %call
}

define internal void @exchange_elements_helper(i8* %base, i64 %element_size, i32 %idx1, i32 %idx2) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %element_size.addr = alloca i64, align 8
  %idx1.addr = alloca i32, align 4
  %idx2.addr = alloca i32, align 4
  %base_bytes = alloca i8*, align 8
  %i = alloca i32, align 4
  %temp = alloca i8, align 1
  store i8* %base, i8** %base.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 %idx1, i32* %idx1.addr, align 4
  store i32 %idx2, i32* %idx2.addr, align 4
  %0 = load i8** %base.addr, align 8
  store i8* %0, i8** %base_bytes, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %conv = sext i32 %1 to i64
  %2 = load i64* %element_size.addr, align 8
  %cmp = icmp ult i64 %conv, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %idx1.addr, align 4
  %conv2 = sext i32 %3 to i64
  %4 = load i64* %element_size.addr, align 8
  %mul = mul i64 %conv2, %4
  %5 = load i32* %i, align 4
  %conv3 = sext i32 %5 to i64
  %add = add i64 %mul, %conv3
  %6 = load i8** %base_bytes, align 8
  %arrayidx = getelementptr inbounds i8* %6, i64 %add
  %7 = load i8* %arrayidx, align 1
  store i8 %7, i8* %temp, align 1
  %8 = load i32* %idx2.addr, align 4
  %conv4 = sext i32 %8 to i64
  %9 = load i64* %element_size.addr, align 8
  %mul5 = mul i64 %conv4, %9
  %10 = load i32* %i, align 4
  %conv6 = sext i32 %10 to i64
  %add7 = add i64 %mul5, %conv6
  %11 = load i8** %base_bytes, align 8
  %arrayidx8 = getelementptr inbounds i8* %11, i64 %add7
  %12 = load i8* %arrayidx8, align 1
  %13 = load i32* %idx1.addr, align 4
  %conv9 = sext i32 %13 to i64
  %14 = load i64* %element_size.addr, align 8
  %mul10 = mul i64 %conv9, %14
  %15 = load i32* %i, align 4
  %conv11 = sext i32 %15 to i64
  %add12 = add i64 %mul10, %conv11
  %16 = load i8** %base_bytes, align 8
  %arrayidx13 = getelementptr inbounds i8* %16, i64 %add12
  store i8 %12, i8* %arrayidx13, align 1
  %17 = load i8* %temp, align 1
  %18 = load i32* %idx2.addr, align 4
  %conv14 = sext i32 %18 to i64
  %19 = load i64* %element_size.addr, align 8
  %mul15 = mul i64 %conv14, %19
  %20 = load i32* %i, align 4
  %conv16 = sext i32 %20 to i64
  %add17 = add i64 %mul15, %conv16
  %21 = load i8** %base_bytes, align 8
  %arrayidx18 = getelementptr inbounds i8* %21, i64 %add17
  store i8 %17, i8* %arrayidx18, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %22 = load i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @partition(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer, i32 %pivotIndex) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %num_elements.addr = alloca i64, align 8
  %element_size.addr = alloca i64, align 8
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %pivotIndex.addr = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %num_elements, i64* %num_elements.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  store i32 %pivotIndex, i32* %pivotIndex.addr, align 4
  store i32 0, i32* %low, align 4
  %0 = load i64* %num_elements.addr, align 8
  %sub = sub i64 %0, 1
  %conv = trunc i64 %sub to i32
  store i32 %conv, i32* %high, align 4
  %1 = load i8** %base.addr, align 8
  %2 = load i64* %element_size.addr, align 8
  %3 = load i64* %num_elements.addr, align 8
  %sub1 = sub i64 %3, 1
  %conv2 = trunc i64 %sub1 to i32
  %4 = load i32* %pivotIndex.addr, align 4
  call void @exchange_elements_helper(i8* %1, i64 %2, i32 %conv2, i32 %4)
  br label %while.body

while.body:                                       ; preds = %entry, %if.end
  br label %while.cond3

while.cond3:                                      ; preds = %while.body11, %while.body
  %5 = load i8** %base.addr, align 8
  %6 = load i64* %element_size.addr, align 8
  %7 = load i32* %low, align 4
  %8 = load i64* %num_elements.addr, align 8
  %sub4 = sub i64 %8, 1
  %conv5 = trunc i64 %sub4 to i32
  %9 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %call = call i32 @compare_elements_helper(i8* %5, i64 %6, i32 %7, i32 %conv5, i32 (i8*, i8*)* %9)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond3
  %10 = load i32* %low, align 4
  %conv7 = sext i32 %10 to i64
  %11 = load i64* %num_elements.addr, align 8
  %sub8 = sub i64 %11, 1
  %cmp9 = icmp ult i64 %conv7, %sub8
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %12 = phi i1 [ false, %while.cond3 ], [ %cmp9, %land.rhs ]
  br i1 %12, label %while.body11, label %while.end

while.body11:                                     ; preds = %land.end
  %13 = load i32* %low, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %low, align 4
  br label %while.cond3

while.end:                                        ; preds = %land.end
  br label %while.cond12

while.cond12:                                     ; preds = %while.body22, %while.end
  %14 = load i8** %base.addr, align 8
  %15 = load i64* %element_size.addr, align 8
  %16 = load i32* %high, align 4
  %17 = load i64* %num_elements.addr, align 8
  %sub13 = sub i64 %17, 1
  %conv14 = trunc i64 %sub13 to i32
  %18 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %call15 = call i32 @compare_elements_helper(i8* %14, i64 %15, i32 %16, i32 %conv14, i32 (i8*, i8*)* %18)
  %cmp16 = icmp slt i32 %call15, 0
  br i1 %cmp16, label %land.end21, label %land.rhs18

land.rhs18:                                       ; preds = %while.cond12
  %19 = load i32* %high, align 4
  %cmp19 = icmp sgt i32 %19, 0
  br label %land.end21

land.end21:                                       ; preds = %land.rhs18, %while.cond12
  %20 = phi i1 [ false, %while.cond12 ], [ %cmp19, %land.rhs18 ]
  br i1 %20, label %while.body22, label %while.end23

while.body22:                                     ; preds = %land.end21
  %21 = load i32* %high, align 4
  %dec = add nsw i32 %21, -1
  store i32 %dec, i32* %high, align 4
  br label %while.cond12

while.end23:                                      ; preds = %land.end21
  %22 = load i32* %low, align 4
  %23 = load i32* %high, align 4
  %cmp24 = icmp sge i32 %22, %23
  br i1 %cmp24, label %if.then, label %if.end

if.then:                                          ; preds = %while.end23
  br label %while.end26

if.end:                                           ; preds = %while.end23
  %24 = load i8** %base.addr, align 8
  %25 = load i64* %element_size.addr, align 8
  %26 = load i32* %low, align 4
  %27 = load i32* %high, align 4
  call void @exchange_elements_helper(i8* %24, i64 %25, i32 %26, i32 %27)
  br label %while.body

while.end26:                                      ; preds = %if.then
  %28 = load i8** %base.addr, align 8
  %29 = load i64* %element_size.addr, align 8
  %30 = load i32* %low, align 4
  %31 = load i64* %num_elements.addr, align 8
  %sub27 = sub i64 %31, 1
  %conv28 = trunc i64 %sub27 to i32
  call void @exchange_elements_helper(i8* %28, i64 %29, i32 %30, i32 %conv28)
  %32 = load i32* %low, align 4
  ret i32 %32
}

define void @quicksort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %num_elements.addr = alloca i64, align 8
  %element_size.addr = alloca i64, align 8
  %comparer.addr = alloca i32 (i8*, i8*)*, align 8
  %pivotIndex = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %num_elements, i64* %num_elements.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %comparer.addr, align 8
  %0 = load i64* %num_elements.addr, align 8
  %cmp = icmp ult i64 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8** %base.addr, align 8
  %2 = load i64* %num_elements.addr, align 8
  %3 = load i64* %element_size.addr, align 8
  %4 = load i32 (i8*, i8*)** %comparer.addr, align 8
  call void @insertion_sort(i8* %1, i64 %2, i64 %3, i32 (i8*, i8*)* %4)
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @rand() nounwind
  %conv = sext i32 %call to i64
  %5 = load i64* %num_elements.addr, align 8
  %rem = urem i64 %conv, %5
  %conv1 = trunc i64 %rem to i32
  store i32 %conv1, i32* %pivotIndex, align 4
  %6 = load i8** %base.addr, align 8
  %7 = load i64* %num_elements.addr, align 8
  %8 = load i64* %element_size.addr, align 8
  %9 = load i32 (i8*, i8*)** %comparer.addr, align 8
  %10 = load i32* %pivotIndex, align 4
  %call2 = call i32 @partition(i8* %6, i64 %7, i64 %8, i32 (i8*, i8*)* %9, i32 %10)
  store i32 %call2, i32* %pivotIndex, align 4
  %11 = load i8** %base.addr, align 8
  %12 = load i32* %pivotIndex, align 4
  %conv3 = sext i32 %12 to i64
  %13 = load i64* %element_size.addr, align 8
  %14 = load i32 (i8*, i8*)** %comparer.addr, align 8
  call void @quicksort(i8* %11, i64 %conv3, i64 %13, i32 (i8*, i8*)* %14)
  %15 = load i8** %base.addr, align 8
  %16 = load i64* %element_size.addr, align 8
  %17 = load i32* %pivotIndex, align 4
  %add = add nsw i32 %17, 1
  %conv4 = sext i32 %add to i64
  %mul = mul i64 %16, %conv4
  %add.ptr = getelementptr inbounds i8* %15, i64 %mul
  %18 = load i64* %num_elements.addr, align 8
  %19 = load i32* %pivotIndex, align 4
  %add5 = add nsw i32 %19, 1
  %conv6 = sext i32 %add5 to i64
  %sub = sub i64 %18, %conv6
  %20 = load i64* %element_size.addr, align 8
  %21 = load i32 (i8*, i8*)** %comparer.addr, align 8
  call void @quicksort(i8* %add.ptr, i64 %sub, i64 %20, i32 (i8*, i8*)* %21)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare i32 @rand() nounwind

define i32 @compare_int(i8* %left, i8* %right) nounwind uwtable {
entry:
  %left.addr = alloca i8*, align 8
  %right.addr = alloca i8*, align 8
  store i8* %left, i8** %left.addr, align 8
  store i8* %right, i8** %right.addr, align 8
  %0 = load i8** %left.addr, align 8
  %1 = bitcast i8* %0 to i32*
  %2 = load i32* %1, align 4
  %3 = load i8** %right.addr, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32* %4, align 4
  %sub = sub nsw i32 %2, %5
  ret i32 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %size = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 8, i32* %size, align 4
  %0 = load i32* %size, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 4, %conv
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %a, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %size, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call2 = call i32 @rand() nounwind
  %4 = load i32* %size, align 4
  %rem = srem i32 %call2, %4
  %5 = load i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32** %a, align 8
  %arrayidx = getelementptr inbounds i32* %6, i64 %idxprom
  store i32 %rem, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32** %a, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load i32* %size, align 4
  %conv3 = sext i32 %10 to i64
  call void @quicksort(i8* %9, i64 %conv3, i64 4, i32 (i8*, i8*)* @compare_int)
  store i32 1, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc15, %for.end
  %11 = load i32* %i, align 4
  %12 = load i32* %size, align 4
  %cmp5 = icmp slt i32 %11, %12
  br i1 %cmp5, label %for.body7, label %for.end17

for.body7:                                        ; preds = %for.cond4
  %13 = load i32* %i, align 4
  %sub = sub nsw i32 %13, 1
  %idxprom8 = sext i32 %sub to i64
  %14 = load i32** %a, align 8
  %arrayidx9 = getelementptr inbounds i32* %14, i64 %idxprom8
  %15 = load i32* %arrayidx9, align 4
  %16 = load i32* %i, align 4
  %idxprom10 = sext i32 %16 to i64
  %17 = load i32** %a, align 8
  %arrayidx11 = getelementptr inbounds i32* %17, i64 %idxprom10
  %18 = load i32* %arrayidx11, align 4
  %cmp12 = icmp sle i32 %15, %18
  br i1 %cmp12, label %if.end, label %if.then

if.then:                                          ; preds = %for.body7
  %call14 = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body7
  br label %for.inc15

for.inc15:                                        ; preds = %if.end
  %19 = load i32* %i, align 4
  %inc16 = add nsw i32 %19, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond4

for.end17:                                        ; preds = %for.cond4
  %call18 = call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end17, %if.then
  %20 = load i32* %retval
  ret i32 %20
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @puts(i8*)
