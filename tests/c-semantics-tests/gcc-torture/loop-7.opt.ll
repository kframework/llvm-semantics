; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-7.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %n) nounwind uwtable {
entry:
  %conv = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %j.09 = phi i32 [ -1, %entry ], [ %i.0.j.0, %for.body ]
  %shl = shl i64 1, %indvars.iv
  %cmp2 = icmp eq i64 %shl, %conv
  %0 = trunc i64 %indvars.iv to i32
  %i.0.j.0 = select i1 %cmp2, i32 %0, i32 %j.09
  %indvars.iv.next = add i64 %indvars.iv, 1
  %1 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %1, 10
  %cmp1 = icmp slt i32 %i.0.j.0, 0
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  br i1 %cmp1, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %for.end
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  %j.09.i = phi i32 [ -1, %entry ], [ %i.0.j.0.i, %for.body.i ]
  %shl.i = shl i64 1, %indvars.iv.i
  %cmp2.i = icmp eq i64 %shl.i, 64
  %0 = trunc i64 %indvars.iv.i to i32
  %i.0.j.0.i = select i1 %cmp2.i, i32 %0, i32 %j.09.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %1 = trunc i64 %indvars.iv.next.i to i32
  %cmp.i = icmp slt i32 %1, 10
  %cmp1.i = icmp slt i32 %i.0.j.0.i, 0
  %or.cond.i = and i1 %cmp.i, %cmp1.i
  br i1 %or.cond.i, label %for.body.i, label %for.end.i

for.end.i:                                        ; preds = %for.body.i
  br i1 %cmp1.i, label %if.then6.i, label %foo.exit

if.then6.i:                                       ; preds = %for.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %for.end.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
