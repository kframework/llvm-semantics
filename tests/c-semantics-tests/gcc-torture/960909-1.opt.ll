; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960909-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @ffs(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %x, 0
  br i1 %cmp, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %and1 = and i32 %x, 1
  %lnot2 = icmp eq i32 %and1, 0
  br i1 %lnot2, label %for.inc, label %return

for.inc:                                          ; preds = %for.cond.preheader, %for.inc
  %mask.04 = phi i32 [ %shl, %for.inc ], [ 1, %for.cond.preheader ]
  %bit.03 = phi i32 [ %inc, %for.inc ], [ 1, %for.cond.preheader ]
  %inc = add nsw i32 %bit.03, 1
  %shl = shl i32 %mask.04, 1
  %and = and i32 %shl, %x
  %lnot = icmp eq i32 %and, 0
  br i1 %lnot, label %for.inc, label %return

return:                                           ; preds = %for.cond.preheader, %for.inc, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %for.cond.preheader ], [ %inc, %for.inc ]
  ret i32 %retval.0
}

define void @f(i32 %x) nounwind uwtable {
entry:
  %cmp.i = icmp eq i32 %x, 0
  br i1 %cmp.i, label %if.then, label %for.cond.preheader.i

for.cond.preheader.i:                             ; preds = %entry
  %and1.i = and i32 %x, 1
  %lnot2.i = icmp eq i32 %and1.i, 0
  br i1 %lnot2.i, label %for.inc.i, label %if.end

for.inc.i:                                        ; preds = %for.cond.preheader.i, %for.inc.i
  %mask.04.i = phi i32 [ %shl.i, %for.inc.i ], [ 1, %for.cond.preheader.i ]
  %bit.03.i = phi i32 [ %inc.i, %for.inc.i ], [ 1, %for.cond.preheader.i ]
  %inc.i = add nsw i32 %bit.03.i, 1
  %shl.i = shl i32 %mask.04.i, 1
  %and.i = and i32 %shl.i, %x
  %lnot.i = icmp eq i32 %and.i, 0
  br i1 %lnot.i, label %for.inc.i, label %ffs.exit

ffs.exit:                                         ; preds = %for.inc.i
  %cmp = icmp slt i32 %bit.03.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry, %ffs.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.cond.preheader.i, %ffs.exit
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
