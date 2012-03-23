; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-ivopts-2.ll'
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

define void @check(i32* %l) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 288
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr i32* %l, i64 %indvar
  %tmp3 = load i32* %arrayidx, align 4
  %cmp5 = icmp slt i32 %storemerge, 256
  br i1 %cmp5, label %lor.end, label %lor.end.thread

lor.end.thread:                                   ; preds = %for.body
  %cmp7 = icmp sgt i32 %storemerge, 279
  %phitmp = select i1 %cmp7, i32 8, i32 7
  br label %land.rhs

lor.end:                                          ; preds = %for.body
  %cmp9 = icmp sgt i32 %storemerge, 143
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end.thread, %lor.end
  %0 = phi i32 [ %phitmp, %lor.end.thread ], [ 8, %lor.end ]
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %1 = phi i32 [ 8, %lor.end ], [ %0, %land.rhs ]
  %2 = phi i1 [ false, %lor.end ], [ %cmp5, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  %add12 = add nsw i32 %land.ext, %1
  %cmp13 = icmp eq i32 %tmp3, %add12
  br i1 %cmp13, label %for.inc, label %if.then

if.then:                                          ; preds = %land.end
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %land.end
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %l = alloca [288 x i32], align 16
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar35 = phi i64 [ 0, %entry ], [ %indvar.next36, %for.body ]
  %arrayidx = getelementptr [288 x i32]* %l, i64 0, i64 %indvar35
  store i32 8, i32* %arrayidx, align 4
  %indvar.next36 = add i64 %indvar35, 1
  %exitcond42 = icmp eq i64 %indvar.next36, 144
  br i1 %exitcond42, label %for.body6, label %for.body

for.body6:                                        ; preds = %for.body, %for.body6
  %indvar32 = phi i64 [ %indvar.next33, %for.body6 ], [ 0, %for.body ]
  %tmp38 = add i64 %indvar32, 144
  %arrayidx9 = getelementptr [288 x i32]* %l, i64 0, i64 %tmp38
  store i32 9, i32* %arrayidx9, align 4
  %indvar.next33 = add i64 %indvar32, 1
  %exitcond34 = icmp eq i64 %indvar.next33, 112
  br i1 %exitcond34, label %for.body17, label %for.body6

for.body17:                                       ; preds = %for.body6, %for.body17
  %indvar20 = phi i64 [ %indvar.next21, %for.body17 ], [ 0, %for.body6 ]
  %tmp27 = add i64 %indvar20, 256
  %arrayidx20 = getelementptr [288 x i32]* %l, i64 0, i64 %tmp27
  store i32 7, i32* %arrayidx20, align 4
  %indvar.next21 = add i64 %indvar20, 1
  %exitcond25 = icmp eq i64 %indvar.next21, 24
  br i1 %exitcond25, label %for.body28, label %for.body17

for.body28:                                       ; preds = %for.body17, %for.body28
  %indvar = phi i64 [ %indvar.next, %for.body28 ], [ 0, %for.body17 ]
  %tmp15 = add i64 %indvar, 280
  %arrayidx31 = getelementptr [288 x i32]* %l, i64 0, i64 %tmp15
  store i32 8, i32* %arrayidx31, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 8
  br i1 %exitcond, label %for.cond.i, label %for.body28

for.cond.i:                                       ; preds = %for.body28, %for.inc.i
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %for.body28 ]
  %storemerge.i = trunc i64 %indvar.i to i32
  %cmp.i = icmp slt i32 %storemerge.i, 288
  br i1 %cmp.i, label %for.body.i, label %check.exit

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr [288 x i32]* %l, i64 0, i64 %indvar.i
  %tmp3.i = load i32* %arrayidx.i, align 4
  %cmp5.i = icmp slt i32 %storemerge.i, 256
  br i1 %cmp5.i, label %lor.end.i, label %lor.end.thread.i

lor.end.thread.i:                                 ; preds = %for.body.i
  %cmp7.i = icmp sgt i32 %storemerge.i, 279
  %phitmp.i = select i1 %cmp7.i, i32 8, i32 7
  br label %land.rhs.i

lor.end.i:                                        ; preds = %for.body.i
  %cmp9.i = icmp sgt i32 %storemerge.i, 143
  br i1 %cmp9.i, label %land.rhs.i, label %land.end.i

land.rhs.i:                                       ; preds = %lor.end.i, %lor.end.thread.i
  %0 = phi i32 [ %phitmp.i, %lor.end.thread.i ], [ 8, %lor.end.i ]
  br label %land.end.i

land.end.i:                                       ; preds = %land.rhs.i, %lor.end.i
  %1 = phi i32 [ 8, %lor.end.i ], [ %0, %land.rhs.i ]
  %2 = phi i1 [ false, %lor.end.i ], [ %cmp5.i, %land.rhs.i ]
  %land.ext.i = zext i1 %2 to i32
  %add12.i = add nsw i32 %land.ext.i, %1
  %cmp13.i = icmp eq i32 %tmp3.i, %add12.i
  br i1 %cmp13.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %land.end.i
  call void @abort() noreturn nounwind
  unreachable

for.inc.i:                                        ; preds = %land.end.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.cond.i

check.exit:                                       ; preds = %for.cond.i
  ret i32 0
}
