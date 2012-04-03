; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/wcharStrings.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %putchar = tail call i32 @putchar(i32 97) nounwind
  %putchar.1 = tail call i32 @putchar(i32 98) nounwind
  %putchar.2 = tail call i32 @putchar(i32 99) nounwind
  %putchar.3 = tail call i32 @putchar(i32 100) nounwind
  %putchar.4 = tail call i32 @putchar(i32 0) nounwind
  %putchar1 = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i32 @putchar(i32)
