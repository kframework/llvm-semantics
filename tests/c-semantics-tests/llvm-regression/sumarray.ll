; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/sumarray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"Produced: %d\0A\00", align 1

define i32 @SumArray(i32* %Array, i32 %Num) nounwind uwtable {
entry:
  %Array.addr = alloca i32*, align 8
  %Num.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %Result = alloca i32, align 4
  store i32* %Array, i32** %Array.addr, align 8
  store i32 %Num, i32* %Num.addr, align 4
  store i32 0, i32* %Result, align 4
  %0 = load i32** %Array.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 34
  store i32 1234, i32* %arrayidx, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %2 = load i32* %Num.addr, align 4
  %cmp = icmp ult i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = zext i32 %3 to i64
  %4 = load i32** %Array.addr, align 8
  %arrayidx1 = getelementptr inbounds i32* %4, i64 %idxprom
  %5 = load i32* %arrayidx1, align 4
  %6 = load i32* %Result, align 4
  %add = add i32 %6, %5
  store i32 %add, i32* %Result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32* %Result, align 4
  ret i32 %8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %Array = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 400) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %Array, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %mul = mul nsw i32 %2, 4
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load i32** %Array, align 8
  %arrayidx = getelementptr inbounds i32* %4, i64 %idxprom
  store i32 %mul, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %add = add nsw i32 %5, 2
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc7, %for.end
  %6 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %6, 100
  br i1 %cmp2, label %for.body3, label %for.end9

for.body3:                                        ; preds = %for.cond1
  %7 = load i32* %i, align 4
  %mul4 = mul nsw i32 %7, 2
  %8 = load i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %9 = load i32** %Array, align 8
  %arrayidx6 = getelementptr inbounds i32* %9, i64 %idxprom5
  store i32 %mul4, i32* %arrayidx6, align 4
  br label %for.inc7

for.inc7:                                         ; preds = %for.body3
  %10 = load i32* %i, align 4
  %add8 = add nsw i32 %10, 2
  store i32 %add8, i32* %i, align 4
  br label %for.cond1

for.end9:                                         ; preds = %for.cond1
  %11 = load i32** %Array, align 8
  %call10 = call i32 @SumArray(i32* %11, i32 100)
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i32 %call10)
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8*, ...)
