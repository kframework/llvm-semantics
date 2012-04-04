; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27073.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %p, i32 %d1, i32 %d2, i32 %d3, i16 signext %count, i32 %s1, i32 %s2, i32 %s3, i32 %s4, i32 %s5) nounwind uwtable noinline {
entry:
  %p.addr = alloca i32*, align 8
  %d1.addr = alloca i32, align 4
  %d2.addr = alloca i32, align 4
  %d3.addr = alloca i32, align 4
  %count.addr = alloca i16, align 2
  %s1.addr = alloca i32, align 4
  %s2.addr = alloca i32, align 4
  %s3.addr = alloca i32, align 4
  %s4.addr = alloca i32, align 4
  %s5.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %d1, i32* %d1.addr, align 4
  store i32 %d2, i32* %d2.addr, align 4
  store i32 %d3, i32* %d3.addr, align 4
  store i16 %count, i16* %count.addr, align 2
  store i32 %s1, i32* %s1.addr, align 4
  store i32 %s2, i32* %s2.addr, align 4
  store i32 %s3, i32* %s3.addr, align 4
  store i32 %s4, i32* %s4.addr, align 4
  store i32 %s5, i32* %s5.addr, align 4
  %0 = load i16* %count.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32* %n, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %n, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %s1.addr, align 4
  %3 = load i32** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %3, i32 1
  store i32* %incdec.ptr, i32** %p.addr, align 8
  store i32 %2, i32* %3, align 4
  %4 = load i32* %s2.addr, align 4
  %5 = load i32** %p.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32* %5, i32 1
  store i32* %incdec.ptr1, i32** %p.addr, align 8
  store i32 %4, i32* %5, align 4
  %6 = load i32* %s3.addr, align 4
  %7 = load i32** %p.addr, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %7, i32 1
  store i32* %incdec.ptr2, i32** %p.addr, align 8
  store i32 %6, i32* %7, align 4
  %8 = load i32* %s4.addr, align 4
  %9 = load i32** %p.addr, align 8
  %incdec.ptr3 = getelementptr inbounds i32* %9, i32 1
  store i32* %incdec.ptr3, i32** %p.addr, align 8
  store i32 %8, i32* %9, align 4
  %10 = load i32* %s5.addr, align 4
  %11 = load i32** %p.addr, align 8
  %incdec.ptr4 = getelementptr inbounds i32* %11, i32 1
  store i32* %incdec.ptr4, i32** %p.addr, align 8
  store i32 %10, i32* %11, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [10 x i32]* %x, i32 0, i32 0
  call void @foo(i32* %arraydecay, i32 0, i32 0, i32 0, i16 signext 2, i32 100, i32 200, i32 300, i32 400, i32 500)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i32 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4
  %3 = load i32* %i, align 4
  %rem = srem i32 %3, 5
  %add = add nsw i32 %rem, 1
  %mul = mul nsw i32 %add, 100
  %cmp1 = icmp ne i32 %2, %mul
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
