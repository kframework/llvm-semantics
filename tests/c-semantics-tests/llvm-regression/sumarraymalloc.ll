; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/sumarraymalloc.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum1 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"Sum2 = %d\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %size = alloca i32, align 4
  %MyArray = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32* %argc.addr, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %1, i64 1
  %2 = load i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %2) nounwind readonly
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 10, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, i32* %size, align 4
  %3 = load i32* %size, align 4
  %conv = sext i32 %3 to i64
  %mul = mul i64 4, %conv
  %call1 = call noalias i8* @malloc(i64 %mul) nounwind
  %4 = bitcast i8* %call1 to i32*
  store i32* %4, i32** %MyArray, align 8
  %5 = load i32** %MyArray, align 8
  %6 = load i32* %size, align 4
  call void @FillArray(i32* %5, i32 %6)
  %7 = load i32** %MyArray, align 8
  %call2 = call i32 @SumArray(i32* %7, i32 10)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %call2)
  %8 = load i32** %MyArray, align 8
  %call4 = call i32 @SumArray2(i32* %8, i32 10)
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call4)
  %9 = load i32** %MyArray, align 8
  %10 = bitcast i32* %9 to i8*
  call void @free(i8* %10) nounwind
  ret i32 0
}

declare i32 @atoi(i8*) nounwind readonly

declare noalias i8* @malloc(i64) nounwind

define internal void @FillArray(i32* %Array, i32 %Num) nounwind uwtable {
entry:
  %Array.addr = alloca i32*, align 8
  %Num.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %Array, i32** %Array.addr, align 8
  store i32 %Num, i32* %Num.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %Num.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %3 = load i32* %i, align 4
  %idxprom = zext i32 %3 to i64
  %4 = load i32** %Array.addr, align 8
  %arrayidx = getelementptr inbounds i32* %4, i64 %idxprom
  store i32 %2, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @printf(i8*, ...)

define internal i32 @SumArray(i32* %Array, i32 %Num) nounwind uwtable {
entry:
  %Array.addr = alloca i32*, align 8
  %Num.addr = alloca i32, align 4
  %Result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %Array, i32** %Array.addr, align 8
  store i32 %Num, i32* %Num.addr, align 4
  store i32 0, i32* %Result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %Num.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = zext i32 %2 to i64
  %3 = load i32** %Array.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %Result, align 4
  %add = add nsw i32 %5, %4
  store i32 %add, i32* %Result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32* %Result, align 4
  ret i32 %7
}

define internal i32 @SumArray2(i32* %Array, i32 %Num) nounwind uwtable {
entry:
  %Array.addr = alloca i32*, align 8
  %Num.addr = alloca i32, align 4
  %Result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %Array, i32** %Array.addr, align 8
  store i32 %Num, i32* %Num.addr, align 4
  store i32 0, i32* %Result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %Num.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32** %Array.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %2, i32 1
  store i32* %incdec.ptr, i32** %Array.addr, align 8
  %3 = load i32* %2, align 4
  %4 = load i32* %Result, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* %Result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32* %Result, align 4
  ret i32 %6
}

declare void @free(i8*) nounwind
