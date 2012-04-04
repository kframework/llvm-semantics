; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j501a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %cpp = alloca i8**, align 8
  %p = alloca i8*, align 8
  %c = alloca i8, align 1
  store i32 0, i32* %retval
  store i8 65, i8* %c, align 1
  store i8** %p, i8*** %cpp, align 8
  %0 = load i8*** %cpp, align 8
  store i8* %c, i8** %0, align 8
  ret i32 0
}
