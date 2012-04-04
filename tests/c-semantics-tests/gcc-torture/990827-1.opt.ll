; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990827-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test(i32 %one, i32 %bit) nounwind uwtable readnone {
entry:
  %and = and i32 %bit, 1
  %shr = lshr i32 %one, 1
  %inc = add i32 %and, 1
  %shr1 = lshr i32 %inc, 1
  %add = add i32 %shr1, %shr
  ret i32 %add
}

define i32 @main() noreturn nounwind uwtable {
if.end8:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
