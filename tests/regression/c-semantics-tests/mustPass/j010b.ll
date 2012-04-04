; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j010b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@y = common global i32 0, align 4

define i32* @f() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  ret i32* @y
}

define i32 @main() nounwind uwtable {
entry:
  %p = alloca i32*, align 8
  %call = call i32* @f()
  store i32* %call, i32** %p, align 8
  ret i32 0
}
