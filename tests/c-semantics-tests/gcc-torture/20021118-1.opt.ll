; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i64 %s.coerce0, i64 %s.coerce1, i32 %x1, i32 %x2, i32 %x3, i32 %x4, i32 %x5, i32 %x6, i32 %x7) nounwind uwtable readnone {
entry:
  %0 = lshr i64 %s.coerce1, 32
  %1 = trunc i64 %0 to i32
  %add = add nsw i32 %1, %x7
  ret i32 %add
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
