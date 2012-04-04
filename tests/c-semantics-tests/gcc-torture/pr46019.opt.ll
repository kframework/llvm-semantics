; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr46019.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = add i64 %indvars.iv, 33
  %div = lshr i64 4398046511104, %1
  %shr = lshr i32 512, %0
  %conv = sext i32 %shr to i64
  %cmp1 = icmp eq i64 %div, %conv
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
