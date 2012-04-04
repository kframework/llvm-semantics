; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000707-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %a, i32 %b, i32 %c) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 4
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @bar(i64 %x.coerce0, i32 %x.coerce1, i32 %b, i32 %c) nounwind uwtable {
entry:
  %.mask = and i64 %x.coerce0, -4294967296
  %cmp.i = icmp eq i64 %.mask, 17179869184
  br i1 %cmp.i, label %foo.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
