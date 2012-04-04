; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal global [4 x i32] zeroinitializer, align 16
@testit.ir = private unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 2, i32 3], align 16
@t = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @testit()
  %0 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 0), align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 1), align 4
  %cmp1 = icmp ne i32 %1, 3
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %2 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 2), align 4
  %cmp4 = icmp ne i32 %2, 2
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  %3 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 3), align 4
  %cmp7 = icmp ne i32 %3, 1
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

define internal void @testit() nounwind uwtable {
entry:
  %ir = alloca [4 x i32], align 16
  %ix = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %0 = bitcast [4 x i32]* %ir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x i32]* @testit.ir to i8*), i64 16, i32 16, i1 false)
  store i32 1, i32* %n, align 4
  store i32 3, i32* %m, align 4
  store i32 1, i32* %ix, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %ix, align 4
  %cmp = icmp sle i32 %1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %n, align 4
  %cmp1 = icmp eq i32 %2, 1
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 4, i32* %m, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %3 = load i32* %n, align 4
  %sub = sub nsw i32 %3, 1
  store i32 %sub, i32* %m, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32* %n, align 4
  %sub2 = sub nsw i32 %4, 1
  %idxprom = sext i32 %sub2 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %ir, i32 0, i64 %idxprom
  %5 = load i32* %arrayidx, align 4
  %call = call i32 @ap(i32 %5)
  %6 = load i32* %m, align 4
  store i32 %6, i32* %n, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %ix, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %ix, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @ap(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* @t, align 4
  %cmp = icmp sgt i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %2 = load i32* @t, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @t, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* @a, i32 0, i64 %idxprom
  store i32 %1, i32* %arrayidx, align 4
  ret i32 1
}
