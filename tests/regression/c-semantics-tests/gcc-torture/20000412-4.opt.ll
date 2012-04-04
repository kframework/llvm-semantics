; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %i, i32 %j, i32 %radius, i32 %width, i32 %N) nounwind uwtable {
entry:
  %sub = sub nsw i32 %i, %radius
  %cmp = icmp sgt i32 %sub, 0
  %cond = select i1 %cmp, i32 %sub, i32 0
  %sub2 = sub i32 %radius, %i
  %sub3 = sub i32 %radius, %j
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %k.0 = phi i32 [ %cond, %entry ], [ %inc, %for.body ]
  %cmp1 = icmp slt i32 %k.0, 3
  br i1 %cmp1, label %for.body, label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.cond
  ret void

for.body:                                         ; preds = %for.cond
  %add = add i32 %sub2, %k.0
  %mul = mul nsw i32 %add, %width
  %add4 = add i32 %sub3, %mul
  %cmp5 = icmp slt i32 %add4, 0
  %inc = add nsw i32 %k.0, 1
  br i1 %cmp5, label %if.then, label %for.cond

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %f.exit, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %f.exit ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sub.i = add nsw i32 %i.0, -2
  %cmp.i = icmp sgt i32 %sub.i, 0
  %cond.i = select i1 %cmp.i, i32 %sub.i, i32 0
  %sub2.i = sub i32 2, %i.0
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %for.body
  %k.0.i = phi i32 [ %cond.i, %for.body ], [ %inc.i, %for.body.i ]
  %cmp1.i = icmp slt i32 %k.0.i, 3
  br i1 %cmp1.i, label %for.body.i, label %f.exit

for.body.i:                                       ; preds = %for.cond.i
  %add.i = add i32 %sub2.i, %k.0.i
  %mul.i = mul nsw i32 %add.i, 5
  %add4.i = add i32 %mul.i, 1
  %cmp5.i = icmp slt i32 %add4.i, 0
  %inc.i = add nsw i32 %k.0.i, 1
  br i1 %cmp5.i, label %if.then.i, label %for.cond.i

if.then.i:                                        ; preds = %for.body.i
  tail call void @abort() noreturn nounwind
  unreachable

f.exit:                                           ; preds = %for.cond.i
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
