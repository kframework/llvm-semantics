; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j070a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32* noalias %p, i32* noalias %q) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %q.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  ret i32 5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %p, align 4
  store i32 6, i32* %q, align 4
  %call = call i32 @f(i32* %p, i32* %q)
  ret i32 0
}
