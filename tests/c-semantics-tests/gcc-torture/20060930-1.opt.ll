; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060930-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar(i32 %a, i32 %b) nounwind uwtable noinline {
entry:
  %cmp = icmp eq i32 %b, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo(i32 %e, i32 %n) nounwind uwtable noinline {
entry:
  %cmp = icmp sgt i32 %e, 0
  %sub = sub nsw i32 0, %e
  %sub.e = select i1 %cmp, i32 %sub, i32 %e
  %cmp16 = icmp sgt i32 %n, 0
  br i1 %cmp16, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %cmp2 = icmp sgt i32 %sub.e, -1
  %sub4 = sub nsw i32 0, %sub.e
  %bb2.0 = select i1 %cmp2, i32 0, i32 %sub4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.07 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %call = tail call i32 @bar(i32 undef, i32 %bb2.0)
  %inc = add nsw i32 %i.07, 1
  %exitcond = icmp eq i32 %inc, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @foo(i32 1, i32 1)
  ret i32 0
}
