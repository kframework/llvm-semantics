; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @do_exit() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

define void @do_abort() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn

define void @foo(i32 %x, i32 %a) nounwind uwtable {
entry:
  %cmp = icmp slt i32 %x, %a
  br i1 %cmp, label %doit, label %if.end

if.end:                                           ; preds = %entry
  tail call void @do_exit()
  unreachable

doit:                                             ; preds = %entry
  tail call void @do_abort()
  unreachable
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @do_exit() nounwind
  unreachable
}
