; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-7.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @foo(i32 %n) nounwind uwtable {
entry:
  %conv = zext i32 %n to i64
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %sh_prom = phi i64 [ %indvar.next, %for.body ], [ 0, %entry ]
  %tmp92 = phi i32 [ %tmp91, %for.body ], [ -1, %entry ]
  %storemerge = trunc i64 %sh_prom to i32
  %cmp = icmp slt i32 %storemerge, 10
  %cmp2 = icmp slt i32 %tmp92, 0
  br i1 %cmp, label %land.rhs, label %for.end

land.rhs:                                         ; preds = %for.cond
  br i1 %cmp2, label %for.body, label %if.end13

for.body:                                         ; preds = %land.rhs
  %shl = shl i64 1, %sh_prom
  %cmp5 = icmp eq i64 %shl, %conv
  %tmp91 = select i1 %cmp5, i32 %storemerge, i32 %tmp92
  %indvar.next = add i64 %sh_prom, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br i1 %cmp2, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %land.rhs, %for.end
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %0 = phi i64 [ %indvar.next.i, %for.body.i ], [ 0, %entry ]
  %tmp92.i = phi i32 [ %tmp91.i, %for.body.i ], [ -1, %entry ]
  %storemerge.i = trunc i64 %0 to i32
  %cmp.i = icmp slt i32 %storemerge.i, 10
  %cmp2.i = icmp slt i32 %tmp92.i, 0
  br i1 %cmp.i, label %land.rhs.i, label %for.end.i

land.rhs.i:                                       ; preds = %for.cond.i
  br i1 %cmp2.i, label %for.body.i, label %foo.exit

for.body.i:                                       ; preds = %land.rhs.i
  %shl.i = shl i64 1, %0
  %cmp5.i = icmp eq i64 %shl.i, 64
  %tmp91.i = select i1 %cmp5.i, i32 %storemerge.i, i32 %tmp92.i
  %indvar.next.i = add i64 %0, 1
  br label %for.cond.i

for.end.i:                                        ; preds = %for.cond.i
  br i1 %cmp2.i, label %if.then12.i, label %foo.exit

if.then12.i:                                      ; preds = %for.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %land.rhs.i, %for.end.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
