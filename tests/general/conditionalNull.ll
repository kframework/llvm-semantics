; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/conditionalNull.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 5, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  %tmp = load i32** %p, align 8
  %tmp1 = load i32* %tmp
  ret i32 %tmp1
}
