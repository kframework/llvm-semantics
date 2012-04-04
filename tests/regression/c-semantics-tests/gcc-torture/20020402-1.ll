; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020402-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.listElem = private unnamed_addr constant [4 x i32] [i32 30, i32 2, i32 10, i32 5], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %listElem = alloca [4 x i32], align 16
  %listSmall = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %posGreatest = alloca i32, align 4
  %greatest = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [4 x i32]* %listElem to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x i32]* @main.listElem to i8*), i64 16, i32 16, i1 false)
  store i32 -1, i32* %posGreatest, align 4
  store i32 -1, i32* %greatest, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %4 = load i32* %i, align 4
  %idxprom1 = sext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom1
  store i32 %3, i32* %arrayidx2, align 4
  %5 = load i32* %i, align 4
  %idxprom3 = sext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom3
  %6 = load i32* %arrayidx4, align 4
  %7 = load i32* %greatest, align 4
  %cmp5 = icmp sgt i32 %6, %7
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  store i32 %8, i32* %posGreatest, align 4
  %9 = load i32* %i, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom6
  %10 = load i32* %arrayidx7, align 4
  store i32 %10, i32* %greatest, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 2, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc34, %for.end
  %12 = load i32* %i, align 4
  %cmp9 = icmp slt i32 %12, 4
  br i1 %cmp9, label %for.body10, label %for.end36

for.body10:                                       ; preds = %for.cond8
  %13 = load i32* %i, align 4
  %idxprom11 = sext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom11
  %14 = load i32* %arrayidx12, align 4
  %15 = load i32* %greatest, align 4
  %cmp13 = icmp slt i32 %14, %15
  br i1 %cmp13, label %if.then14, label %if.end33

if.then14:                                        ; preds = %for.body10
  %16 = load i32* %i, align 4
  %idxprom15 = sext i32 %16 to i64
  %arrayidx16 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom15
  %17 = load i32* %arrayidx16, align 4
  %18 = load i32* %posGreatest, align 4
  %idxprom17 = sext i32 %18 to i64
  %arrayidx18 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom17
  store i32 %17, i32* %arrayidx18, align 4
  store i32 0, i32* %posGreatest, align 4
  %arrayidx19 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 0
  %19 = load i32* %arrayidx19, align 4
  store i32 %19, i32* %greatest, align 4
  store i32 1, i32* %j, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc30, %if.then14
  %20 = load i32* %j, align 4
  %cmp21 = icmp slt i32 %20, 2
  br i1 %cmp21, label %for.body22, label %for.end32

for.body22:                                       ; preds = %for.cond20
  %21 = load i32* %j, align 4
  %idxprom23 = sext i32 %21 to i64
  %arrayidx24 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom23
  %22 = load i32* %arrayidx24, align 4
  %23 = load i32* %greatest, align 4
  %cmp25 = icmp sgt i32 %22, %23
  br i1 %cmp25, label %if.then26, label %if.end29

if.then26:                                        ; preds = %for.body22
  %24 = load i32* %j, align 4
  store i32 %24, i32* %posGreatest, align 4
  %25 = load i32* %j, align 4
  %idxprom27 = sext i32 %25 to i64
  %arrayidx28 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom27
  %26 = load i32* %arrayidx28, align 4
  store i32 %26, i32* %greatest, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then26, %for.body22
  br label %for.inc30

for.inc30:                                        ; preds = %if.end29
  %27 = load i32* %j, align 4
  %inc31 = add nsw i32 %27, 1
  store i32 %inc31, i32* %j, align 4
  br label %for.cond20

for.end32:                                        ; preds = %for.cond20
  br label %if.end33

if.end33:                                         ; preds = %for.end32, %for.body10
  br label %for.inc34

for.inc34:                                        ; preds = %if.end33
  %28 = load i32* %i, align 4
  %inc35 = add nsw i32 %28, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond8

for.end36:                                        ; preds = %for.cond8
  %arrayidx37 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 0
  %29 = load i32* %arrayidx37, align 4
  %cmp38 = icmp ne i32 %29, 5
  br i1 %cmp38, label %if.then41, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end36
  %arrayidx39 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 1
  %30 = load i32* %arrayidx39, align 4
  %cmp40 = icmp ne i32 %30, 2
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %lor.lhs.false, %for.end36
  call void @abort() noreturn
  unreachable

if.end42:                                         ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %31 = load i32* %retval
  ret i32 %31
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn

declare void @exit(i32) noreturn
