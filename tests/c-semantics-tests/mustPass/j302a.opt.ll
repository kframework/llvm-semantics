; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j302a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_39 = global { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [2 x i8], i8, i8, i8, i8, i8, [3 x i8] } { i8 0, i8 0, i8 0, i8 undef, i8 2, i8 0, i8 0, i8 undef, i8 3, i8 0, [2 x i8] undef, i8 4, i8 0, i8 0, i8 0, i8 5, [3 x i8] undef }, align 4

define i32 @main() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast ({ i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [2 x i8], i8, i8, i8, i8, i8, [3 x i8] }* @g_39 to i32*), align 4
  %bf.clear = and i32 %0, 4194303
  ret i32 %bf.clear
}
