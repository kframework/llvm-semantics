; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/globals.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 5, align 4
@b = global i32* @a, align 8
@c = common global i32 0, align 4
@d = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  store i32 5, i32* @c, align 4
  store i32 5, i32* @d, align 4
  %tmp1 = load i32* @a, align 4
  %tmp2 = load i32** @b, align 8
  %tmp3 = load i32* %tmp2, align 4
  %add = add i32 %tmp1, 10
  %add7 = add i32 %add, %tmp3
  ret i32 %add7
}
