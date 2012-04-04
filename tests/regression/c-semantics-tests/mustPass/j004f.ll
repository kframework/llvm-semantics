; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j004f.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(i32 %x, i8** %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8**, align 8
  store i32 %x, i32* %x.addr, align 4
  store i8** %y, i8*** %y.addr, align 8
  ret i32 0
}
