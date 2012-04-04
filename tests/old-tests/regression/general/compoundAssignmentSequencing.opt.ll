; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/compoundAssignmentSequencing.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@r = common global i32 0, align 4

define i32 @f() nounwind uwtable {
entry:
  %tmp = load i32* @r, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @r, align 4
  ret i32 %tmp
}

define i32 @main() nounwind uwtable {
entry:
  %tmp.i = load i32* @r, align 4
  %add = add i32 %tmp.i, 2
  store i32 %add, i32* @r, align 4
  %add1 = add nsw i32 %add, %tmp.i
  ret i32 %add1
}
