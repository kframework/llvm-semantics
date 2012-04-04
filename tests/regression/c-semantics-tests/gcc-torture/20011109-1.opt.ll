; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011109-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @fail1() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define void @fail2() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define void @fail3() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define void @fail4() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define void @foo(i64 %x) nounwind uwtable {
entry:
  switch i64 %x, label %sw.default [
    i64 -6, label %sw.bb
    i64 0, label %sw.bb1
    i64 5, label %sw.bb3
    i64 4, label %sw.bb3
    i64 3, label %sw.bb3
    i64 1, label %sw.epilog9
    i64 2, label %sw.bb7
  ]

sw.bb:                                            ; preds = %entry
  tail call void @fail1()
  unreachable

sw.bb1:                                           ; preds = %entry
  tail call void @fail2()
  unreachable

sw.bb3:                                           ; preds = %entry, %entry, %entry
  tail call void @fail3()
  unreachable

sw.default:                                       ; preds = %entry
  tail call void @fail4()
  unreachable

sw.bb7:                                           ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

sw.epilog9:                                       ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
