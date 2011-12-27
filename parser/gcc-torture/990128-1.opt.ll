; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990128-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { %struct.s* }

@count = global i32 0, align 4
@ss = common global %struct.s zeroinitializer, align 8
@p = common global %struct.s* null, align 8
@sss = common global [10 x %struct.s] zeroinitializer, align 16

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

define i32 @main() noreturn nounwind uwtable {
entry:
  store %struct.s* @ss, %struct.s** @p, align 8
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 0), %struct.s** getelementptr inbounds (%struct.s* @ss, i64 0, i32 0), align 8
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 1), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 0, i32 0), align 16
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 2), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 1, i32 0), align 8
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 3), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 2, i32 0), align 16
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 4), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 3, i32 0), align 8
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 5), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 4, i32 0), align 16
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 6), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 5, i32 0), align 8
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 7), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 6, i32 0), align 16
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 8), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 7, i32 0), align 8
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 9), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 8, i32 0), align 16
  store %struct.s* null, %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 9, i32 0), align 8
  %count.promoted.i = load i32* @count, align 4
  %tmp.i = add i32 %count.promoted.i, 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %if.then.i, %entry
  %tmp51.i = phi %struct.s* [ %tmp51.i.pre, %if.then.i ], [ @ss, %entry ]
  %indvar.i = phi i32 [ %indvar.next.i, %if.then.i ], [ 0, %entry ]
  %inc.i.i = add i32 %tmp.i, %indvar.i
  %inc.i4.i = add i32 %count.promoted.i, %indvar.i
  %tobool2.i.i = icmp eq %struct.s* %tmp51.i, null
  br i1 %tobool2.i.i, label %look.exit.thread.i, label %for.inc.i.i

look.exit.thread.i:                               ; preds = %for.cond.i
  store i32 %inc.i4.i, i32* @count, align 4
  %inc.i3.i = add nsw i32 %inc.i4.i, 1
  br label %sub.exit

for.inc.i.i:                                      ; preds = %for.inc.i.i, %for.cond.i
  %tmp313.i.i = phi %struct.s* [ %tmp51.i, %for.cond.i ], [ %tmp2.i.i, %for.inc.i.i ]
  %n.i.i = getelementptr inbounds %struct.s* %tmp313.i.i, i64 0, i32 0
  %tmp2.i.i = load %struct.s** %n.i.i, align 8
  %tobool.i.i = icmp eq %struct.s* %tmp2.i.i, null
  br i1 %tobool.i.i, label %look.exit.i, label %for.inc.i.i

look.exit.i:                                      ; preds = %for.inc.i.i
  br i1 %tobool2.i.i, label %sub.exit, label %if.then.i

if.then.i:                                        ; preds = %look.exit.i
  %n.i = getelementptr inbounds %struct.s* %tmp51.i, i64 0, i32 0
  %indvar.next.i = add i32 %indvar.i, 1
  %tmp51.i.pre = load %struct.s** %n.i, align 8
  br label %for.cond.i

sub.exit:                                         ; preds = %look.exit.i, %look.exit.thread.i
  %storemerge.i = phi i32 [ %inc.i3.i, %look.exit.thread.i ], [ %inc.i.i, %look.exit.i ]
  store i32 %storemerge.i, i32* @count, align 4
  %cmp12 = icmp eq i32 %storemerge.i, 12
  br i1 %cmp12, label %if.end, label %if.then

if.then:                                          ; preds = %sub.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %sub.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define void @sub(%struct.s* %p, %struct.s** %pp) nounwind uwtable {
entry:
  %count.promoted = load i32* @count, align 4
  %tmp = add i32 %count.promoted, 1
  br label %for.cond

for.cond:                                         ; preds = %if.then, %entry
  %indvar = phi i32 [ %indvar.next, %if.then ], [ 0, %entry ]
  %tmp51 = phi %struct.s* [ %tmp5, %if.then ], [ %p, %entry ]
  %inc.i4 = add i32 %count.promoted, %indvar
  %inc.i = add i32 %tmp, %indvar
  %tobool2.i = icmp eq %struct.s* %tmp51, null
  br i1 %tobool2.i, label %look.exit.thread, label %for.inc.i

look.exit.thread:                                 ; preds = %for.cond
  store i32 %inc.i4, i32* @count, align 4
  store %struct.s* null, %struct.s** %pp, align 8
  %inc.i3 = add nsw i32 %inc.i4, 1
  br label %for.end

for.inc.i:                                        ; preds = %for.cond, %for.inc.i
  %tmp313.i = phi %struct.s* [ %tmp2.i, %for.inc.i ], [ %tmp51, %for.cond ]
  %n.i = getelementptr inbounds %struct.s* %tmp313.i, i64 0, i32 0
  %tmp2.i = load %struct.s** %n.i, align 8
  %tobool.i = icmp eq %struct.s* %tmp2.i, null
  br i1 %tobool.i, label %look.exit, label %for.inc.i

look.exit:                                        ; preds = %for.inc.i
  store %struct.s* null, %struct.s** %pp, align 8
  br i1 %tobool2.i, label %for.end, label %if.then

if.then:                                          ; preds = %look.exit
  %n = getelementptr inbounds %struct.s* %tmp51, i64 0, i32 0
  %tmp5 = load %struct.s** %n, align 8
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %look.exit, %look.exit.thread
  %storemerge = phi i32 [ %inc.i3, %look.exit.thread ], [ %inc.i, %look.exit ]
  store i32 %storemerge, i32* @count, align 4
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @look(%struct.s* %p, %struct.s** %pp) nounwind uwtable {
entry:
  %tobool2 = icmp eq %struct.s* %p, null
  br i1 %tobool2, label %for.end, label %for.inc

for.inc:                                          ; preds = %entry, %for.inc
  %tmp313 = phi %struct.s* [ %tmp2, %for.inc ], [ %p, %entry ]
  %n = getelementptr inbounds %struct.s* %tmp313, i64 0, i32 0
  %tmp2 = load %struct.s** %n, align 8
  %tobool = icmp eq %struct.s* %tmp2, null
  br i1 %tobool, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc, %entry
  store %struct.s* null, %struct.s** %pp, align 8
  %tmp5 = load i32* @count, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* @count, align 4
  ret i32 1
}
