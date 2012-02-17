; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr45070.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.source = type { i32, i32, i32 }

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

define i32 @main() nounwind uwtable {
entry:
  %s = alloca %struct.source, align 4
  %pos = getelementptr inbounds %struct.source* %s, i64 0, i32 0
  store i32 0, i32* %pos, align 4
  %length = getelementptr inbounds %struct.source* %s, i64 0, i32 1
  store i32 0, i32* %length, align 4
  %flag = getelementptr inbounds %struct.source* %s, i64 0, i32 2
  store i32 0, i32* %flag, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call fastcc i16 @next(%struct.source* %s)
  %cmp3 = icmp eq i32 %0, 0
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %cmp5 = icmp eq i16 %call, -1
  br i1 %cmp5, label %for.inc, label %if.then

lor.lhs.false:                                    ; preds = %for.body
  %cmp8 = icmp slt i32 %0, 1
  %cmp14 = icmp eq i16 %call, 0
  %or.cond = or i1 %cmp8, %cmp14
  br i1 %or.cond, label %for.inc, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %inc = add nsw i32 %0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal fastcc i16 @next(%struct.source* %p) nounwind uwtable noinline {
entry:
  %pos = getelementptr inbounds %struct.source* %p, i64 0, i32 0
  %length = getelementptr inbounds %struct.source* %p, i64 0, i32 1
  %flag = getelementptr inbounds %struct.source* %p, i64 0, i32 2
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.then6, %entry
  %tmp1 = load i32* %pos, align 4
  %tmp3 = load i32* %length, align 4
  %cmp = icmp slt i32 %tmp1, %tmp3
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %tailrecurse
  %tmp5 = load i32* %flag, align 4
  %tobool = icmp eq i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  store i32 0, i32* %flag, align 4
  tail call fastcc void @fetch(%struct.source* %p)
  br label %tailrecurse

if.end:                                           ; preds = %if.then
  store i32 1, i32* %flag, align 4
  br label %return

return:                                           ; preds = %tailrecurse, %if.end
  %call1 = phi i16 [ -1, %if.end ], [ 0, %tailrecurse ]
  ret i16 %call1
}

declare void @abort() noreturn nounwind

define internal fastcc void @fetch(%struct.source* nocapture %p) nounwind uwtable noinline {
entry:
  %length = getelementptr inbounds %struct.source* %p, i64 0, i32 1
  store i32 128, i32* %length, align 4
  ret void
}
