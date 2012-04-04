; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j311a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32* noalias %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %call = call i32 (...)* bitcast (i32 (i32*)* @g to i32 (...)*)(i32* %0)
  %1 = load i32** %p.addr, align 8
  %2 = load i32* %1, align 4
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  %call = call i32 @f(i32* %x)
  %cmp = icmp eq i32 %call, 5
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @g(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  store i32 10, i32* %0, align 4
  ret i32 0
}
