; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20061101-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @tar(i64 %i) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %i, 36863
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 -1
}

declare void @abort() noreturn nounwind

define void @bug(i32 %q, i64 %bcount) nounwind uwtable {
entry:
  %sub = add nsw i32 %q, -1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %j.0 = phi i1 [ true, %entry ], [ false, %while.body ]
  %outgo.0 = phi i32 [ 0, %entry ], [ %sub.inc, %while.body ]
  br i1 %j.0, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %inc = add nsw i32 %outgo.0, 1
  %cmp1 = icmp sgt i32 %inc, %sub
  %sub.inc = select i1 %cmp1, i32 %sub, i32 %inc
  %conv = sext i32 %sub.inc to i64
  %mul = mul nsw i64 %conv, %bcount
  %cmp.i = icmp eq i64 %mul, 36863
  br i1 %cmp.i, label %while.cond, label %if.then.i

if.then.i:                                        ; preds = %while.body
  tail call void @abort() noreturn nounwind
  unreachable

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
bug.exit:
  ret i32 0
}
