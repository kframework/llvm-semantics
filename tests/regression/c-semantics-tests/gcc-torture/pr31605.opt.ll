; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31605.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @put_field(i32 %start, i32 %len) nounwind uwtable {
entry:
  %add = add i32 %len, %start
  %sub1 = or i32 %add, -8
  %cmp = icmp eq i32 %sub1, -8
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @exit(i32) noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}
