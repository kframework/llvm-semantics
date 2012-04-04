; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42142.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sort.end = private unnamed_addr constant [2 x i32] [i32 10, i32 10], align 4

define i32 @sort(i32 %L) nounwind uwtable noinline {
entry:
  %L.addr = alloca i32, align 4
  %end = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %R = alloca i32, align 4
  store i32 %L, i32* %L.addr, align 4
  %0 = bitcast [2 x i32]* %end to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x i32]* @sort.end to i8*), i64 8, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* %end, i32 0, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  store i32 %3, i32* %R, align 4
  %4 = load i32* %L.addr, align 4
  %5 = load i32* %R, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %6 = load i32* %i, align 4
  %add = add nsw i32 %6, 1
  %idxprom2 = sext i32 %add to i64
  %arrayidx3 = getelementptr inbounds [2 x i32]* %end, i32 0, i64 %idxprom2
  store i32 1, i32* %arrayidx3, align 4
  %7 = load i32* %i, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [2 x i32]* %end, i32 0, i64 %idxprom4
  store i32 10, i32* %arrayidx5, align 4
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %if.then
  br label %while.cond

while.end:                                        ; preds = %if.else, %while.cond
  %9 = load i32* %i, align 4
  ret i32 %9
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @sort(i32 5)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
