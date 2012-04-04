; ModuleID = '/home/david/src/c-semantics/tests/unitTests/globals.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 5, align 4
@b = global i32* @a, align 8
@c = common global i32 0, align 4
@d = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* @c, align 4
  %0 = load i32* @c, align 4
  store i32 %0, i32* @d, align 4
  %1 = load i32* @a, align 4
  %2 = load i32** @b, align 8
  %3 = load i32* %2, align 4
  %add = add nsw i32 %1, %3
  %4 = load i32* @c, align 4
  %add1 = add nsw i32 %add, %4
  %5 = load i32* @d, align 4
  %add2 = add nsw i32 %add1, %5
  ret i32 %add2
}
