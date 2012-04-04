; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %n, i16 %x.coerce, i16 %y.coerce, i16 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %cmp = icmp eq i16 %x.coerce, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %cmp6 = icmp eq i16 %y.coerce, 11
  br i1 %cmp6, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  %cmp12 = icmp eq i16 %z.coerce, 12
  br i1 %cmp12, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end9
  tail call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end9
  %cmp16 = icmp eq i64 %l, 123
  br i1 %cmp16, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end15
  tail call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end15
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
