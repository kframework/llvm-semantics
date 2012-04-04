; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000819-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [2 x i32] [i32 2, i32 0], align 4

define void @foo(i32* %sp, i32 %cnt) nounwind uwtable {
entry:
  %sp.addr = alloca i32*, align 8
  %cnt.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %top = alloca i32*, align 8
  store i32* %sp, i32** %sp.addr, align 8
  store i32 %cnt, i32* %cnt.addr, align 4
  %0 = load i32** %sp.addr, align 8
  store i32* %0, i32** %top, align 8
  %1 = load i32* %cnt.addr, align 4
  %2 = load i32** %sp.addr, align 8
  %idx.ext = sext i32 %1 to i64
  %idx.neg = sub i64 0, %idx.ext
  %add.ptr = getelementptr inbounds i32* %2, i64 %idx.neg
  store i32* %add.ptr, i32** %sp.addr, align 8
  %3 = load i32** %sp.addr, align 8
  store i32* %3, i32** %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32** %p, align 8
  %5 = load i32** %top, align 8
  %cmp = icmp ule i32* %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32** %p, align 8
  %7 = load i32* %6, align 4
  %cmp1 = icmp slt i32 %7, 2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32* %8, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @exit(i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), i32 1)
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind
