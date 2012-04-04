; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080506-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32** noalias %p, i32** noalias %q) nounwind uwtable noinline {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32**, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32** %q, i32*** %q.addr, align 8
  %0 = load i32*** %p.addr, align 8
  %arrayidx = getelementptr inbounds i32** %0, i64 0
  %1 = load i32** %arrayidx, align 8
  store i32 1, i32* %1, align 4
  %2 = load i32*** %q.addr, align 8
  %arrayidx1 = getelementptr inbounds i32** %2, i64 0
  %3 = load i32** %arrayidx1, align 8
  store i32 2, i32* %3, align 4
  %4 = load i32*** %p.addr, align 8
  %arrayidx2 = getelementptr inbounds i32** %4, i64 0
  %5 = load i32** %arrayidx2, align 8
  %6 = load i32* %5, align 4
  %cmp = icmp ne i32 %6, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %p1 = alloca i32*, align 8
  %p2 = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32* %a, i32** %p1, align 8
  store i32* %a, i32** %p2, align 8
  call void @foo(i32** %p1, i32** %p2)
  ret i32 0
}
