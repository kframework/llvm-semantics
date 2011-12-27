; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/960909-1.ll'
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

define i32 @ffs(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %x, 0
  br i1 %cmp, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %and3 = and i32 %x, 1
  %lnot4 = icmp eq i32 %and3, 0
  br i1 %lnot4, label %for.inc, label %return

for.inc:                                          ; preds = %for.cond.preheader, %for.inc
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %for.cond.preheader ]
  %storemerge6 = phi i32 [ %shl, %for.inc ], [ 1, %for.cond.preheader ]
  %shl = shl i32 %storemerge6, 1
  %and = and i32 %shl, %x
  %lnot = icmp eq i32 %and, 0
  %indvar.next = add i32 %indvar, 1
  br i1 %lnot, label %for.inc, label %for.cond.return.loopexit_crit_edge

for.cond.return.loopexit_crit_edge:               ; preds = %for.inc
  %inc = add i32 %indvar, 2
  br label %return

return:                                           ; preds = %for.cond.preheader, %for.cond.return.loopexit_crit_edge, %entry
  %storemerge1 = phi i32 [ 0, %entry ], [ %inc, %for.cond.return.loopexit_crit_edge ], [ 1, %for.cond.preheader ]
  ret i32 %storemerge1
}

define void @f(i32 %x) nounwind uwtable {
entry:
  %cmp.i = icmp eq i32 %x, 0
  br i1 %cmp.i, label %if.then, label %for.cond.preheader.i

for.cond.preheader.i:                             ; preds = %entry
  %and3.i = and i32 %x, 1
  %lnot4.i = icmp eq i32 %and3.i, 0
  br i1 %lnot4.i, label %for.inc.i, label %if.end

for.inc.i:                                        ; preds = %for.cond.preheader.i, %for.inc.i
  %0 = phi i32 [ %indvar.next.i, %for.inc.i ], [ 0, %for.cond.preheader.i ]
  %storemerge6.i = phi i32 [ %shl.i, %for.inc.i ], [ 1, %for.cond.preheader.i ]
  %shl.i = shl i32 %storemerge6.i, 1
  %and.i = and i32 %shl.i, %x
  %lnot.i = icmp eq i32 %and.i, 0
  %indvar.next.i = add i32 %0, 1
  br i1 %lnot.i, label %for.inc.i, label %ffs.exit

ffs.exit:                                         ; preds = %for.inc.i
  %cmp = icmp slt i32 %indvar.next.i, 0
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
