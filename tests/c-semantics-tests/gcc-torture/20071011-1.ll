; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071011-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %1 = load i32* %0, align 4
  store i32 %1, i32* %x, align 4
  %2 = load i32** %p.addr, align 8
  store i32 0, i32* %2, align 4
  %3 = load i32** %p.addr, align 8
  %4 = load i32* %3, align 4
  store i32 %4, i32* %y, align 4
  %5 = load i32* %x, align 4
  %6 = load i32* %y, align 4
  %cmp = icmp ne i32 %5, %6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  ret void

if.end:                                           ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %a, align 4
  call void @foo(i32* %a)
  ret i32 0
}
