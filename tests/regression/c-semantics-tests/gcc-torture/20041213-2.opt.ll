; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041213-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.end.thread, %for.end, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %j.0, %for.end ], [ %next_n.0, %for.end.thread ]
  %next_n.0 = phi i32 [ 1, %entry ], [ %next_n.0, %for.end ], [ %1, %for.end.thread ]
  %i.addr.0 = phi i32 [ %i, %entry ], [ %dec, %for.end ], [ %dec13, %for.end.thread ]
  %cmp = icmp eq i32 %i.addr.0, 0
  br i1 %cmp, label %for.end7, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond
  %cmp28 = icmp slt i32 %j.0, %next_n.0
  br i1 %cmp28, label %for.end.thread, label %for.end

for.end.thread:                                   ; preds = %for.cond1.preheader
  %0 = shl i32 %next_n.0, 1
  %1 = sub i32 %0, %j.0
  %dec13 = add nsw i32 %i.addr.0, -1
  br label %for.cond

for.end:                                          ; preds = %for.cond1.preheader
  %cmp5 = icmp eq i32 %j.0, %next_n.0
  %dec = add nsw i32 %i.addr.0, -1
  br i1 %cmp5, label %for.cond, label %if.then

if.then:                                          ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

for.end7:                                         ; preds = %for.cond
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
