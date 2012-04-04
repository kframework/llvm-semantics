; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/mode-dependent-address.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.correct = private unnamed_addr constant [96 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11, i32 8, i32 9, i32 10, i32 11, i32 16, i32 17, i32 18, i32 19, i32 16, i32 17, i32 18, i32 19, i32 24, i32 25, i32 26, i32 27, i32 24, i32 25, i32 26, i32 27, i32 32, i32 33, i32 34, i32 35, i32 32, i32 33, i32 34, i32 35, i32 40, i32 41, i32 42, i32 43, i32 40, i32 41, i32 42, i32 43, i32 48, i32 49, i32 50, i32 51, i32 48, i32 49, i32 50, i32 51, i32 56, i32 57, i32 58, i32 59, i32 56, i32 57, i32 58, i32 59, i32 64, i32 65, i32 66, i32 67, i32 64, i32 65, i32 66, i32 67, i32 72, i32 73, i32 74, i32 75, i32 72, i32 73, i32 74, i32 75, i32 80, i32 81, i32 82, i32 83, i32 80, i32 81, i32 82, i32 83, i32 88, i32 89, i32 90, i32 91, i32 88, i32 89, i32 90, i32 91], align 16
@arg4 = common global [96 x i8] zeroinitializer, align 16
@arg1 = common global [96 x i16] zeroinitializer, align 16
@arg2 = common global [96 x i32] zeroinitializer, align 16
@arg3 = common global [96 x i64] zeroinitializer, align 16
@result = common global [96 x i8] zeroinitializer, align 16

define void @f883b(i8* %result, i16* noalias %arg1, i32* noalias %arg2, i64* noalias %arg3, i8* noalias %arg4) nounwind uwtable {
entry:
  %result.addr = alloca i8*, align 8
  %arg1.addr = alloca i16*, align 8
  %arg2.addr = alloca i32*, align 8
  %arg3.addr = alloca i64*, align 8
  %arg4.addr = alloca i8*, align 8
  %idx = alloca i32, align 4
  store i8* %result, i8** %result.addr, align 8
  store i16* %arg1, i16** %arg1.addr, align 8
  store i32* %arg2, i32** %arg2.addr, align 8
  store i64* %arg3, i64** %arg3.addr, align 8
  store i8* %arg4, i8** %arg4.addr, align 8
  store i32 0, i32* %idx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %idx, align 4
  %cmp = icmp slt i32 %0, 96
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %idx, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load i16** %arg1.addr, align 8
  %arrayidx = getelementptr inbounds i16* %2, i64 %idxprom
  %3 = load i16* %arrayidx, align 2
  %conv = sext i16 %3 to i32
  %cmp1 = icmp slt i32 1, %conv
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %4 = load i32* %idx, align 4
  %idxprom3 = sext i32 %4 to i64
  %5 = load i16** %arg1.addr, align 8
  %arrayidx4 = getelementptr inbounds i16* %5, i64 %idxprom3
  %6 = load i16* %arrayidx4, align 2
  %conv5 = sext i16 %6 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %conv5, %cond.false ]
  %7 = load i32* %idx, align 4
  %idxprom6 = sext i32 %7 to i64
  %8 = load i32** %arg2.addr, align 8
  %arrayidx7 = getelementptr inbounds i32* %8, i64 %idxprom6
  %9 = load i32* %arrayidx7, align 4
  %and = and i32 %9, 31
  %shr = ashr i32 %cond, %and
  %xor = xor i32 %shr, 1
  %sub = sub nsw i32 %xor, -32
  %shr8 = ashr i32 %sub, 7
  %or = or i32 %shr8, -5
  %conv9 = sext i32 %or to i64
  %10 = load i32* %idx, align 4
  %idxprom10 = sext i32 %10 to i64
  %11 = load i64** %arg3.addr, align 8
  %arrayidx11 = getelementptr inbounds i64* %11, i64 %idxprom10
  %12 = load i64* %arrayidx11, align 8
  %and12 = and i64 %conv9, %12
  %conv13 = trunc i64 %and12 to i8
  %13 = load i32* %idx, align 4
  %idxprom14 = sext i32 %13 to i64
  %14 = load i8** %result.addr, align 8
  %arrayidx15 = getelementptr inbounds i8* %14, i64 %idxprom14
  store i8 %conv13, i8* %arrayidx15, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %15 = load i32* %idx, align 4
  %add = add nsw i32 %15, 1
  store i32 %add, i32* %idx, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %correct = alloca [96 x i32], align 16
  store i32 0, i32* %retval
  %0 = bitcast [96 x i32]* %correct to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([96 x i32]* @main.correct to i8*), i64 384, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 96
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [96 x i8]* @arg4, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  %conv1 = zext i8 %conv to i16
  %4 = load i32* %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [96 x i16]* @arg1, i32 0, i64 %idxprom2
  store i16 %conv1, i16* %arrayidx3, align 2
  %conv4 = sext i16 %conv1 to i32
  %5 = load i32* %i, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [96 x i32]* @arg2, i32 0, i64 %idxprom5
  store i32 %conv4, i32* %arrayidx6, align 4
  %conv7 = zext i32 %conv4 to i64
  %6 = load i32* %i, align 4
  %idxprom8 = sext i32 %6 to i64
  %arrayidx9 = getelementptr inbounds [96 x i64]* @arg3, i32 0, i64 %idxprom8
  store i64 %conv7, i64* %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @f883b(i8* getelementptr inbounds ([96 x i8]* @result, i32 0, i32 0), i16* getelementptr inbounds ([96 x i16]* @arg1, i32 0, i32 0), i32* getelementptr inbounds ([96 x i32]* @arg2, i32 0, i32 0), i64* getelementptr inbounds ([96 x i64]* @arg3, i32 0, i32 0), i8* getelementptr inbounds ([96 x i8]* @arg4, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc21, %for.end
  %8 = load i32* %i, align 4
  %cmp11 = icmp slt i32 %8, 96
  br i1 %cmp11, label %for.body13, label %for.end23

for.body13:                                       ; preds = %for.cond10
  %9 = load i32* %i, align 4
  %idxprom14 = sext i32 %9 to i64
  %arrayidx15 = getelementptr inbounds [96 x i8]* @result, i32 0, i64 %idxprom14
  %10 = load i8* %arrayidx15, align 1
  %conv16 = sext i8 %10 to i32
  %11 = load i32* %i, align 4
  %idxprom17 = sext i32 %11 to i64
  %arrayidx18 = getelementptr inbounds [96 x i32]* %correct, i32 0, i64 %idxprom17
  %12 = load i32* %arrayidx18, align 4
  %cmp19 = icmp ne i32 %conv16, %12
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %for.body13
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body13
  br label %for.inc21

for.inc21:                                        ; preds = %if.end
  %13 = load i32* %i, align 4
  %inc22 = add nsw i32 %13, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond10

for.end23:                                        ; preds = %for.cond10
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
