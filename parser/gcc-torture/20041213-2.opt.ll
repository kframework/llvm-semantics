; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041213-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %indvar = phi i32 [ %indvar.next, %for.inc14 ], [ 0, %entry ]
  %tmp114 = phi i32 [ %tmp115.lcssa18, %for.inc14 ], [ 0, %entry ]
  %inc2 = phi i32 [ %inc3.lcssa17, %for.inc14 ], [ 1, %entry ]
  %cmp = icmp eq i32 %indvar, %i
  br i1 %cmp, label %for.end16, label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond
  %cmp66 = icmp slt i32 %tmp114, %inc2
  br i1 %cmp66, label %for.end.thread, label %for.end

for.end.thread:                                   ; preds = %for.cond3.preheader
  %tmp = shl i32 %inc2, 1
  %tmp10 = sub i32 %tmp, %tmp114
  br label %for.inc14

for.end:                                          ; preds = %for.cond3.preheader
  %cmp13 = icmp eq i32 %tmp114, %inc2
  br i1 %cmp13, label %for.inc14, label %if.then

if.then:                                          ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

for.inc14:                                        ; preds = %for.end.thread, %for.end
  %tmp115.lcssa18 = phi i32 [ %inc2, %for.end.thread ], [ %tmp114, %for.end ]
  %inc3.lcssa17 = phi i32 [ %tmp10, %for.end.thread ], [ %inc2, %for.end ]
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

for.end16:                                        ; preds = %for.cond
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @foo(i32 2)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
