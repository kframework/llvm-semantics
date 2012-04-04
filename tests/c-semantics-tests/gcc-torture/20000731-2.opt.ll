; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000731-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %while.body

while.body:                                       ; preds = %while.body, %entry
  %j.04 = phi i32 [ 0, %entry ], [ %inc, %while.body ]
  %i.03 = phi i32 [ 1, %entry ], [ %mul, %while.body ]
  %mul = shl nsw i32 %i.03, 1
  %inc = add nsw i32 %j.04, 1
  %cmp = icmp eq i32 %mul, 1024
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body
  %cmp2 = icmp eq i32 %inc, 10
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %while.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
