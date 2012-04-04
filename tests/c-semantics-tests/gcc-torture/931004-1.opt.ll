; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %x.coerce, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %cmp4 = icmp eq i32 %y.coerce, 11
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %cmp8 = icmp eq i32 %z.coerce, 12
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %cmp11 = icmp eq i64 %l, 123
  br i1 %cmp11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end10
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end10
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
