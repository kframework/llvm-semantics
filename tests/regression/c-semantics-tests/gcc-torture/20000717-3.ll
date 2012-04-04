; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000717-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@c = global i32 -1, align 4

define i32 @foo(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %x = alloca i32, align 4
  %a = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 0
  %1 = load i32* %arrayidx, align 4
  store i32 %1, i32* %a, align 4
  %2 = load i32* %a, align 4
  %add = add nsw i32 %2, 5
  store i32 %add, i32* %x, align 4
  %3 = load i32* @c, align 4
  store i32 %3, i32* %a, align 4
  %4 = load i32* %x, align 4
  %sub = sub nsw i32 %4, 15
  %5 = load i32** %p.addr, align 8
  %arrayidx1 = getelementptr inbounds i32* %5, i64 0
  store i32 %sub, i32* %arrayidx1, align 4
  %6 = load i32* %a, align 4
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %b, align 4
  %call = call i32 (...)* bitcast (i32 (i32*)* @foo to i32 (...)*)(i32* %b)
  store i32 %call, i32* %a, align 4
  %0 = load i32* %a, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b, align 4
  %cmp1 = icmp ne i32 %1, -9
  br i1 %cmp1, label %if.then, label %if.end

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
