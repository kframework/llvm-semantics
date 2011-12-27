; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20090623-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32* null, align 8

define i32 @foo(i32 %y) nounwind uwtable {
entry:
  %tmp1 = load i32** @x, align 8
  store i32 %y, i32* %tmp1, align 4
  %tmp2 = load i32** @x, align 8
  %tmp3 = load i32* %tmp2, align 4
  ret i32 %tmp3
}

define i32 @main() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32* %i, i32** @x, align 8
  ret i32 0
}
