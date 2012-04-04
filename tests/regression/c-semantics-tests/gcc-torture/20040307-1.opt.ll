; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040307-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %sdata.0 = phi i32 [ 1, %entry ], [ %0, %while.body ]
  %b.0 = phi i32 [ 0, %entry ], [ %inc, %while.body ]
  %bf.clear = and i32 %sdata.0, 1
  %cmp = icmp eq i32 %bf.clear, 0
  br i1 %cmp, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %0 = xor i32 %sdata.0, 1
  %inc = add nsw i32 %b.0, 1
  %cmp1 = icmp sgt i32 %inc, 100
  br i1 %cmp1, label %if.then3, label %while.cond

while.end:                                        ; preds = %while.cond
  %cmp2 = icmp eq i32 %b.0, 1
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %while.body, %while.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %while.end
  ret i32 0
}

declare void @abort() noreturn nounwind
