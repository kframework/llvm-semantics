; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920731-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %x) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %x.addr.0 = phi i32 [ %x, %entry ], [ %shr, %for.inc ]
  %cmp = icmp slt i32 %i.0, 8
  br i1 %cmp, label %land.rhs, label %for.end

land.rhs:                                         ; preds = %for.cond
  %and = and i32 %x.addr.0, 1
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %for.inc, label %for.end

for.inc:                                          ; preds = %land.rhs
  %shr = ashr i32 %x.addr.0, 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond, %land.rhs
  ret i32 %i.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %i.0.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ]
  %x.addr.0.i = phi i32 [ 4, %entry ], [ %shr.i, %for.inc.i ]
  %cmp.i = icmp slt i32 %i.0.i, 8
  br i1 %cmp.i, label %land.rhs.i, label %if.then

land.rhs.i:                                       ; preds = %for.cond.i
  %and.i = and i32 %x.addr.0.i, 1
  %cmp1.i = icmp eq i32 %and.i, 0
  br i1 %cmp1.i, label %for.inc.i, label %f.exit

for.inc.i:                                        ; preds = %land.rhs.i
  %shr.i = ashr i32 %x.addr.0.i, 1
  %inc.i = add nsw i32 %i.0.i, 1
  br label %for.cond.i

f.exit:                                           ; preds = %land.rhs.i
  %cmp = icmp eq i32 %i.0.i, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %for.cond.i, %f.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %f.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
