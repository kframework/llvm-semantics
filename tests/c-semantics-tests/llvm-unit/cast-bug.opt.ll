; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/cast-bug.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  %add = add nsw i32 %argc, 2
  %cmp4 = icmp slt i32 %argc, 0
  br i1 %cmp4, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %result.06 = phi i32 [ %add2.result.0, %for.body ], [ 1, %entry ]
  %i.05 = phi i32 [ %inc, %for.body ], [ 2, %entry ]
  %and = and i32 %i.05, 1
  %cmp1 = icmp eq i32 %and, 0
  %add2 = add nsw i32 %result.06, 17
  %add2.result.0 = select i1 %cmp1, i32 %add2, i32 %result.06
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp sgt i32 %inc, %add
  br i1 %cmp, label %for.cond.for.end_crit_edge, label %for.body

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %phitmp = icmp ne i32 %add2.result.0, 35
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %result.0.lcssa = phi i1 [ %phitmp, %for.cond.for.end_crit_edge ], [ true, %entry ]
  %conv = zext i1 %result.0.lcssa to i32
  ret i32 %conv
}
