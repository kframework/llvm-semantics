; ModuleID = '/home/david/src/c-semantics/tests/unitTests/higherOrder.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [5 x i32], align 16
  %res = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [5 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @main.arr to i8*), i64 20, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [5 x i32]* %arr, i32 0, i32 0
  %call = call i32 @fold(i32* %arraydecay, i32 5, i32 0, i32 (i32, i32)* @sum)
  store i32 %call, i32* %res, align 4
  %1 = load i32* %res, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %1)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @fold(i32* %arr, i32 %length, i32 %start, i32 (i32, i32)* %f) nounwind uwtable {
entry:
  %arr.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %f.addr = alloca i32 (i32, i32)*, align 8
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 (i32, i32)* %f, i32 (i32, i32)** %f.addr, align 8
  %0 = load i32* %start.addr, align 4
  store i32 %0, i32* %res, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %2 = load i32* %length.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32 (i32, i32)** %f.addr, align 8
  %4 = load i32* %res, align 4
  %5 = load i32** %arr.addr, align 8
  %6 = load i32* %i, align 4
  %idx.ext = sext i32 %6 to i64
  %add.ptr = getelementptr inbounds i32* %5, i64 %idx.ext
  %7 = load i32* %add.ptr, align 4
  %call = call i32 %3(i32 %4, i32 %7)
  store i32 %call, i32* %res, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32* %res, align 4
  ret i32 %9
}

define i32 @sum(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %add = add nsw i32 %0, %1
  ret i32 %add
}

declare i32 @printf(i8*, ...)
