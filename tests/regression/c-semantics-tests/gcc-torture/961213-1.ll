; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.ar = private unnamed_addr constant [5 x i32] [i32 10, i32 11, i32 12, i32 13, i32 14], align 16

define i32 @g(i64* %v, i32 %n, i32* %a, i32 %b) nounwind uwtable {
entry:
  %v.addr = alloca i64*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i64* %v, i64** %v.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  %0 = load i64** %v.addr, align 8
  store i64 0, i64* %0, align 8
  store i32 0, i32* %cnt, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %cnt, align 4
  %2 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i64** %v.addr, align 8
  %4 = load i64* %3, align 8
  %5 = load i32* %b.addr, align 4
  %conv = sext i32 %5 to i64
  %mul = mul i64 %4, %conv
  %6 = load i32* %cnt, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %7, i64 %idxprom
  %8 = load i32* %arrayidx, align 4
  %conv1 = zext i32 %8 to i64
  %add = add i64 %mul, %conv1
  %9 = load i64** %v.addr, align 8
  store i64 %add, i64* %9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32* %cnt, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %cnt, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32* %n.addr, align 4
  ret i32 %11
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %res = alloca i32, align 4
  %ar = alloca [5 x i32], align 16
  %v = alloca i64, align 8
  store i32 0, i32* %retval
  %0 = bitcast [5 x i32]* %ar to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @main.ar to i8*), i64 20, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [5 x i32]* %ar, i32 0, i32 0
  %call = call i32 @g(i64* %v, i32 5, i32* %arraydecay, i32 16)
  store i32 %call, i32* %res, align 4
  %1 = load i64* %v, align 8
  %cmp = icmp ne i64 %1, 703710
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
