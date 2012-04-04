; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950612-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1(i32 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %diff, 0
  %sub = sub nsw i32 0, %diff
  %cond = select i1 %cmp, i32 %sub, i32 %diff
  ret i32 %cond
}

define i32 @f2(i32 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %diff, 0
  %sub = sub i32 0, %diff
  %cond = select i1 %cmp, i32 %sub, i32 %diff
  ret i32 %cond
}

define i64 @f3(i64 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %diff, 0
  %sub = sub nsw i64 0, %diff
  %cond = select i1 %cmp, i64 %sub, i64 %diff
  ret i64 %cond
}

define i64 @f4(i64 %diff) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %diff, 0
  %sub = sub i64 0, %diff
  %cond = select i1 %cmp, i64 %sub, i64 %diff
  ret i64 %cond
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end35, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end35 ], [ 0, %entry ]
  %i.0 = phi i32 [ %inc, %if.end35 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 11
  br i1 %cmp, label %if.end, label %for.end

if.end:                                           ; preds = %for.cond
  %sub.i = sub nsw i32 0, %i.0
  %cmp.i61 = icmp sgt i32 %0, 0
  %cond.i62 = select i1 %cmp.i61, i32 %0, i32 %sub.i
  %cmp3 = icmp eq i32 %cond.i62, %0
  br i1 %cmp3, label %if.end20, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end
  %1 = sub nsw i64 0, %indvars.iv
  %cond.i52 = select i1 %cmp.i61, i64 %indvars.iv, i64 %1
  %cmp25 = icmp eq i64 %cond.i52, %indvars.iv
  br i1 %cmp25, label %if.end35, label %if.then27

if.then27:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end20
  %indvars.iv.next = add i64 %indvars.iv, 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
