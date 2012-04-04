; ModuleID = '/home/david/src/c-semantics/tests/integration/bubblesort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = private unnamed_addr constant [7 x i32] [i32 -1, i32 2, i32 1, i32 3, i32 5, i32 -10, i32 -11], align 16
@.str = private unnamed_addr constant [23 x i8] c"array before sorting: \00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"array after bubblesort: \00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

define void @bubble_sort(i8* %base, i64 %nmemb, i64 %size, i32 (i8*, i8*)* %compar) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %nmemb.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %compar.addr = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pc = alloca i8*, align 8
  %pc_at_i = alloca i8*, align 8
  %pc_at_j = alloca i8*, align 8
  store i8* %base, i8** %base.addr, align 8
  store i64 %nmemb, i64* %nmemb.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i32 (i8*, i8*)* %compar, i32 (i8*, i8*)** %compar.addr, align 8
  %0 = load i8** %base.addr, align 8
  store i8* %0, i8** %pc, align 8
  %1 = load i64* %nmemb.addr, align 8
  %sub = sub i64 %1, 1
  %conv = trunc i64 %sub to i32
  store i32 %conv, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %4 = load i32* %i, align 4
  %cmp3 = icmp slt i32 %3, %4
  br i1 %cmp3, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %5 = load i8** %pc, align 8
  %6 = load i32* %i, align 4
  %conv6 = sext i32 %6 to i64
  %7 = load i64* %size.addr, align 8
  %mul = mul i64 %conv6, %7
  %add.ptr = getelementptr inbounds i8* %5, i64 %mul
  store i8* %add.ptr, i8** %pc_at_i, align 8
  %8 = load i8** %pc, align 8
  %9 = load i32* %j, align 4
  %conv7 = sext i32 %9 to i64
  %10 = load i64* %size.addr, align 8
  %mul8 = mul i64 %conv7, %10
  %add.ptr9 = getelementptr inbounds i8* %8, i64 %mul8
  store i8* %add.ptr9, i8** %pc_at_j, align 8
  %11 = load i32 (i8*, i8*)** %compar.addr, align 8
  %12 = load i8** %pc_at_i, align 8
  %13 = load i8** %pc_at_j, align 8
  %call = call i32 %11(i8* %12, i8* %13)
  %cmp10 = icmp slt i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body5
  %14 = load i8** %base.addr, align 8
  %15 = load i64* %size.addr, align 8
  %16 = load i32* %i, align 4
  %17 = load i32* %j, align 4
  call void @swap_fun(i8* %14, i64 %15, i32 %16, i32 %17)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body5
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %18 = load i32* %j, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %19 = load i32* %i, align 4
  %dec = add nsw i32 %19, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  ret void
}

define internal void @swap_fun(i8* %base, i64 %element_size, i32 %index1, i32 %index2) nounwind uwtable {
entry:
  %base.addr = alloca i8*, align 8
  %element_size.addr = alloca i64, align 8
  %index1.addr = alloca i32, align 4
  %index2.addr = alloca i32, align 4
  %pc = alloca i8*, align 8
  %tmp = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 8
  store i64 %element_size, i64* %element_size.addr, align 8
  store i32 %index1, i32* %index1.addr, align 4
  store i32 %index2, i32* %index2.addr, align 4
  %0 = load i8** %base.addr, align 8
  store i8* %0, i8** %pc, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %conv = sext i32 %1 to i64
  %2 = load i64* %element_size.addr, align 8
  %cmp = icmp ult i64 %conv, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %index1.addr, align 4
  %conv3 = sext i32 %3 to i64
  %4 = load i64* %element_size.addr, align 8
  %mul = mul i64 %conv3, %4
  %5 = load i32* %i, align 4
  %conv4 = sext i32 %5 to i64
  %add = add i64 %mul, %conv4
  %6 = load i8** %pc, align 8
  %arrayidx = getelementptr inbounds i8* %6, i64 %add
  %7 = load i8* %arrayidx, align 1
  store i8 %7, i8* %tmp, align 1
  %8 = load i32* %index2.addr, align 4
  %conv5 = sext i32 %8 to i64
  %9 = load i64* %element_size.addr, align 8
  %mul6 = mul i64 %conv5, %9
  %10 = load i32* %i, align 4
  %conv7 = sext i32 %10 to i64
  %add8 = add i64 %mul6, %conv7
  %11 = load i8** %pc, align 8
  %arrayidx9 = getelementptr inbounds i8* %11, i64 %add8
  %12 = load i8* %arrayidx9, align 1
  %13 = load i32* %index1.addr, align 4
  %conv10 = sext i32 %13 to i64
  %14 = load i64* %element_size.addr, align 8
  %mul11 = mul i64 %conv10, %14
  %15 = load i32* %i, align 4
  %conv12 = sext i32 %15 to i64
  %add13 = add i64 %mul11, %conv12
  %16 = load i8** %pc, align 8
  %arrayidx14 = getelementptr inbounds i8* %16, i64 %add13
  store i8 %12, i8* %arrayidx14, align 1
  %17 = load i8* %tmp, align 1
  %18 = load i32* %index2.addr, align 4
  %conv15 = sext i32 %18 to i64
  %19 = load i64* %element_size.addr, align 8
  %mul16 = mul i64 %conv15, %19
  %20 = load i32* %i, align 4
  %conv17 = sext i32 %20 to i64
  %add18 = add i64 %mul16, %conv17
  %21 = load i8** %pc, align 8
  %arrayidx19 = getelementptr inbounds i8* %21, i64 %add18
  store i8 %17, i8* %arrayidx19, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %22 = load i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @int_cmp_fun(i8* %v1, i8* %v2) nounwind uwtable {
entry:
  %v1.addr = alloca i8*, align 8
  %v2.addr = alloca i8*, align 8
  %i1 = alloca i32*, align 8
  %i2 = alloca i32*, align 8
  %result = alloca i32, align 4
  store i8* %v1, i8** %v1.addr, align 8
  store i8* %v2, i8** %v2.addr, align 8
  %0 = load i8** %v1.addr, align 8
  %1 = bitcast i8* %0 to i32*
  store i32* %1, i32** %i1, align 8
  %2 = load i8** %v2.addr, align 8
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %i2, align 8
  %4 = load i32** %i1, align 8
  %5 = load i32* %4, align 4
  %6 = load i32** %i2, align 8
  %7 = load i32* %6, align 4
  %cmp = icmp eq i32 %5, %7
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %result, align 4
  br label %if.end4

if.else:                                          ; preds = %entry
  %8 = load i32** %i1, align 8
  %9 = load i32* %8, align 4
  %10 = load i32** %i2, align 8
  %11 = load i32* %10, align 4
  %cmp1 = icmp slt i32 %9, %11
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 -1, i32* %result, align 4
  br label %if.end

if.else3:                                         ; preds = %if.else
  store i32 1, i32* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %12 = load i32* %result, align 4
  ret i32 %12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [7 x i32], align 16
  store i32 0, i32* %retval
  %0 = bitcast [7 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([7 x i32]* @main.arr to i8*), i64 28, i32 16, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  call void @print_int_arr(i32* %arraydecay, i64 7)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0))
  %arraydecay2 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  %1 = bitcast i32* %arraydecay2 to i8*
  call void @bubble_sort(i8* %1, i64 7, i64 4, i32 (i8*, i8*)* @int_cmp_fun)
  %arraydecay3 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  call void @print_int_arr(i32* %arraydecay3, i64 7)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

define internal void @print_int_arr(i32* %arr, i64 %size_of_arr) nounwind uwtable {
entry:
  %arr.addr = alloca i32*, align 8
  %size_of_arr.addr = alloca i64, align 8
  %i = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  store i64 %size_of_arr, i64* %size_of_arr.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64* %size_of_arr.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call2 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @putchar(i32)
