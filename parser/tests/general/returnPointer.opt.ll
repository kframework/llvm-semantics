; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/returnPointer.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  ret i32 7
}

define i32* @f(i32* %x) nounwind uwtable {
entry:
  %tmp1 = load i32* %x, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %x, align 4
  ret i32* %x
}

define i32** @g(i32** %x) nounwind uwtable {
entry:
  %tmp1 = load i32** %x, align 8
  %tmp2 = load i32* %tmp1, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %tmp1, align 4
  ret i32** %x
}
