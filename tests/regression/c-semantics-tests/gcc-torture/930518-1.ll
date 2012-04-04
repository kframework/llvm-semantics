; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930518-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bar = global i32 0, align 4

define void @f(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %foo = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 2, i32* %foo, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %foo, align 4
  %1 = load i32* @bar, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* @bar, align 4
  %3 = load i32* %foo, align 4
  %sub = sub nsw i32 %3, %2
  store i32 %sub, i32* %foo, align 4
  %4 = load i32* %foo, align 4
  %5 = load i32** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %5, i32 1
  store i32* %incdec.ptr, i32** %p.addr, align 8
  store i32 %4, i32* %5, align 4
  store i32 1, i32* @bar, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tab = alloca [2 x i32], align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 1
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 0
  store i32 0, i32* %arrayidx1, align 4
  %arraydecay = getelementptr inbounds [2 x i32]* %tab, i32 0, i32 0
  call void (...)* bitcast (void (i32*)* @f to void (...)*)(i32* %arraydecay)
  %arrayidx2 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 0
  %0 = load i32* %arrayidx2, align 4
  %cmp = icmp ne i32 %0, 2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx3 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 1
  %1 = load i32* %arrayidx3, align 4
  %cmp4 = icmp ne i32 %1, 1
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
