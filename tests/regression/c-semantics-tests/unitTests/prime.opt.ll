; ModuleID = '/home/david/src/c-semantics/tests/unitTests/prime.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable readnone {
prime.exit18:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %prime.exit18
  %flag.07.i = phi i32 [ %.flag.0.i, %for.body.i ], [ 1, %prime.exit18 ]
  %i.06.i = phi i32 [ %i.0.inc.i, %for.body.i ], [ 2, %prime.exit18 ]
  %rem.i = srem i32 31, %i.06.i
  %cmp1.i = icmp eq i32 %rem.i, 0
  %0 = zext i1 %cmp1.i to i32
  %inc.i = xor i32 %0, 1
  %i.0.inc.i = add nsw i32 %inc.i, %i.06.i
  %.flag.0.i = select i1 %cmp1.i, i32 0, i32 %flag.07.i
  %cmp.i = icmp sgt i32 %i.0.inc.i, 14
  %tobool.i = icmp eq i32 %.flag.0.i, 0
  %or.cond.i = or i1 %cmp.i, %tobool.i
  br i1 %or.cond.i, label %prime.exit, label %for.body.i

prime.exit:                                       ; preds = %for.body.i
  %1 = zext i1 %tobool.i to i32
  %add532 = xor i32 %1, 3
  ret i32 %add532
}

define i32 @prime(i32 %n) nounwind uwtable readnone {
entry:
  %div = sdiv i32 %n, 2
  %cmp5 = icmp slt i32 %n, 6
  br i1 %cmp5, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %flag.07 = phi i32 [ %.flag.0, %for.body ], [ 1, %entry ]
  %i.06 = phi i32 [ %i.0.inc, %for.body ], [ 2, %entry ]
  %rem = srem i32 %n, %i.06
  %cmp1 = icmp eq i32 %rem, 0
  %0 = zext i1 %cmp1 to i32
  %inc = xor i32 %0, 1
  %i.0.inc = add nsw i32 %inc, %i.06
  %.flag.0 = select i1 %cmp1, i32 0, i32 %flag.07
  %cmp = icmp sge i32 %i.0.inc, %div
  %tobool = icmp eq i32 %.flag.0, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tobool.lcssa = phi i1 [ false, %entry ], [ %tobool, %for.body ]
  %1 = zext i1 %tobool.lcssa to i32
  %. = xor i32 %1, 1
  ret i32 %.
}
