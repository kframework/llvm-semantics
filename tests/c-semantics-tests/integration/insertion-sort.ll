; ModuleID = '/home/david/src/c-semantics/tests/integration/insertion-sort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [5 x i32] [i32 5, i32 1, i32 9, i32 3, i32 2], align 16

define void @insertion_sort(i32* %a, i32 %length) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 1, i32* %i, align 4
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
  %cmp2 = icmp sgt i32 %6, 0
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

define i32 @checkThatArrayIsSorted(i32* %array, i32 %length) nounwind uwtable {
entry:
  %array.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %sorted = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 0, i32* %sorted, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %length.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %sub = sub nsw i32 %2, 1
  %idxprom = sext i32 %sub to i64
  %3 = load i32** %array.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %6 = load i32** %array.addr, align 8
  %arrayidx2 = getelementptr inbounds i32* %6, i64 %idxprom1
  %7 = load i32* %arrayidx2, align 4
  %cmp3 = icmp sle i32 %4, %7
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32* %sorted, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %sorted, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32* %i, align 4
  %add = add nsw i32 %9, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32* %sorted, align 4
  ret i32 %10
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %0 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  call void @insertion_sort(i32* %arraydecay, i32 5)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %conv = zext i32 %1 to i64
  %cmp = icmp ult i64 %conv, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call = call i32 @checkThatArrayIsSorted(i32* %arraydecay2, i32 5)
  ret i32 %call
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
