; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
if.end4:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @foo(i32 %x, i32 %y, i32 %z) nounwind uwtable readnone {
entry:
  %add = add i32 %y, %x
  %add1 = add i32 %add, %z
  %div = sdiv i32 %add1, 3
  ret i32 %div
}

define i32 @bar(i32 %x, i32 %y, i32 %z) nounwind uwtable readnone {
entry:
  %mul = mul nsw i32 %x, %x
  %mul1 = mul nsw i32 %y, %y
  %mul2 = mul nsw i32 %z, %z
  %add.i = add i32 %mul1, %mul
  %add1.i = add i32 %add.i, %mul2
  %div.i = sdiv i32 %add1.i, 3
  ret i32 %div.i
}

declare void @exit(i32) noreturn nounwind
