; ModuleID = '/home/david/src/c-semantics/tests/unitTests/multWithBreak.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.arr1 = private unnamed_addr constant [6 x i32] [i32 1, i32 2, i32 3, i32 0, i32 4, i32 5], align 16
@main.arr2 = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %product1 = alloca i32, align 4
  %product2 = alloca i32, align 4
  %arr1 = alloca [6 x i32], align 16
  %arr2 = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %product1, align 4
  store i32 1, i32* %product2, align 4
  %0 = bitcast [6 x i32]* %arr1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([6 x i32]* @main.arr1 to i8*), i64 24, i32 16, i1 false)
  %1 = bitcast [5 x i32]* %arr2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([5 x i32]* @main.arr2 to i8*), i64 20, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [6 x i32]* %arr1, i32 0, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %product1, align 4
  %mul = mul nsw i32 %5, %4
  store i32 %mul, i32* %product1, align 4
  %6 = load i32* %product1, align 4
  %cmp1 = icmp eq i32 %6, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  store i32 0, i32* %i2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc9, %for.end
  %8 = load i32* %i2, align 4
  %cmp4 = icmp slt i32 %8, 5
  br i1 %cmp4, label %for.body5, label %for.end11

for.body5:                                        ; preds = %for.cond3
  %9 = load i32* %i2, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [5 x i32]* %arr2, i32 0, i64 %idxprom6
  %10 = load i32* %arrayidx7, align 4
  %11 = load i32* %product2, align 4
  %mul8 = mul nsw i32 %11, %10
  store i32 %mul8, i32* %product2, align 4
  br label %for.inc9

for.inc9:                                         ; preds = %for.body5
  %12 = load i32* %i2, align 4
  %inc10 = add nsw i32 %12, 1
  store i32 %inc10, i32* %i2, align 4
  br label %for.cond3

for.end11:                                        ; preds = %for.cond3
  %13 = load i32* %product1, align 4
  %14 = load i32* %product2, align 4
  %add = add nsw i32 %13, %14
  ret i32 %add
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
