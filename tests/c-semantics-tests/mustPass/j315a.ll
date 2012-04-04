; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j315a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32* %p1, i32* %p2) nounwind uwtable {
entry:
  %p1.addr = alloca i32*, align 8
  %p2.addr = alloca i32*, align 8
  store i32* %p1, i32** %p1.addr, align 8
  store i32* %p2, i32** %p2.addr, align 8
  %0 = load i32** %p1.addr, align 8
  %1 = load i32* %0, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %0, align 4
  %2 = load i32** %p2.addr, align 8
  %3 = load i32* %2, align 4
  %inc1 = add nsw i32 %3, 1
  store i32 %inc1, i32* %2, align 4
  %add = add nsw i32 %1, %3
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %a, align 4
  store i32 0, i32* %b, align 4
  %call = call i32 @foo(i32* %a, i32* %b)
  ret i32 0
}
