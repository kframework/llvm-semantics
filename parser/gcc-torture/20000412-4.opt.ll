; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000412-4.ll'
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

define void @f(i32 %i, i32 %j, i32 %radius, i32 %width, i32 %N) nounwind uwtable {
entry:
  %sub = sub nsw i32 %i, %radius
  %cmp = icmp sgt i32 %sub, 0
  %cond = select i1 %cmp, i32 %sub, i32 0
  %tmp11 = add i32 %cond, %radius
  %tmp12 = sub i32 %tmp11, %i
  %tmp13 = mul i32 %tmp12, %width
  %tmp14 = add i32 %tmp13, %radius
  %tmp15 = sub i32 %tmp14, %j
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = add i32 %cond, %indvar
  %cmp8 = icmp slt i32 %storemerge, 3
  br i1 %cmp8, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  %tmp8 = mul i32 %indvar, %width
  %add18 = add i32 %tmp15, %tmp8
  %cmp20 = icmp slt i32 %add18, 0
  br i1 %cmp20, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond.i, %entry
  %indvar = phi i32 [ 0, %entry ], [ %storemerge, %for.cond.i ]
  %tmp4 = add i32 %indvar, -1
  %tmp13 = icmp sgt i32 %tmp4, 0
  %smax14 = select i1 %tmp13, i32 %tmp4, i32 0
  %tmp16 = sub i32 1, %indvar
  %tmp8 = add i32 %smax14, %tmp16
  %storemerge = add i32 %indvar, 1
  %tmp9 = mul i32 %tmp8, 5
  %tmp10 = add i32 %tmp9, 1
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.cond.i, label %for.end

for.cond.i:                                       ; preds = %for.cond, %for.inc.i
  %indvar.i = phi i32 [ %indvar.next.i, %for.inc.i ], [ 0, %for.cond ]
  %storemerge.i = add i32 %smax14, %indvar.i
  %cmp8.i = icmp slt i32 %storemerge.i, 3
  br i1 %cmp8.i, label %for.body.i, label %for.cond

for.body.i:                                       ; preds = %for.cond.i
  %tmp3 = mul i32 %indvar.i, 5
  %add18.i = add i32 %tmp10, %tmp3
  %cmp20.i = icmp slt i32 %add18.i, 0
  br i1 %cmp20.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i
  tail call void @abort() noreturn nounwind
  unreachable

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i32 %indvar.i, 1
  br label %for.cond.i

for.end:                                          ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
