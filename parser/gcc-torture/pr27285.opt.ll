; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr27285.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i8, i8, [16 x i8] }

@main.x = internal unnamed_addr constant %struct.S { i8 0, i8 25, i8 0, [16 x i8] c"\AA\BB\CC\DD\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1

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

define void @foo(%struct.S* %x, %struct.S* %y) nounwind uwtable noinline {
entry:
  %b1 = getelementptr inbounds %struct.S* %x, i64 0, i32 1
  %tmp2 = load i8* %b1, align 1
  %tobool5 = icmp eq i8 %tmp2, 0
  br i1 %tobool5, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %conv = zext i8 %tmp2 to i32
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %if.end
  %indvar = phi i64 [ 0, %while.body.lr.ph ], [ %indvar.next, %if.end ]
  %storemerge136 = phi i32 [ %conv, %while.body.lr.ph ], [ %sub, %if.end ]
  %arrayidx25 = getelementptr %struct.S* %y, i64 0, i32 3, i64 %indvar
  %arrayidx = getelementptr %struct.S* %x, i64 0, i32 3, i64 %indvar
  %cmp = icmp sgt i32 %storemerge136, 7
  br i1 %cmp, label %if.end, label %if.end.thread

if.end.thread:                                    ; preds = %while.body
  %sub13 = sub nsw i32 8, %storemerge136
  %shl = shl i32 255, %sub13
  %conv14 = trunc i32 %shl to i8
  %tmp178 = load i8* %arrayidx, align 1
  %and29 = and i8 %tmp178, %conv14
  store i8 %and29, i8* %arrayidx25, align 1
  br label %while.end

if.end:                                           ; preds = %while.body
  %sub = add nsw i32 %storemerge136, -8
  %tmp17 = load i8* %arrayidx, align 1
  store i8 %tmp17, i8* %arrayidx25, align 1
  %tobool = icmp eq i32 %sub, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %if.end, %if.end.thread, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %x = alloca %struct.S, align 1
  %y = alloca %struct.S, align 1
  %tmp = getelementptr inbounds %struct.S* %x, i64 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds (%struct.S* @main.x, i64 0, i32 0), i64 19, i32 1, i1 false)
  %tmp2 = getelementptr inbounds %struct.S* %y, i64 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 19, i32 1, i1 false)
  call void @foo(%struct.S* %x, %struct.S* %y)
  %arrayidx = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 0
  %tmp3 = load i8* %arrayidx, align 1
  %arrayidx5 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 0
  %tmp6 = load i8* %arrayidx5, align 1
  %cmp = icmp eq i8 %tmp3, %tmp6
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx10 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 1
  %tmp11 = load i8* %arrayidx10, align 1
  %arrayidx14 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 1
  %tmp15 = load i8* %arrayidx14, align 1
  %cmp17 = icmp eq i8 %tmp11, %tmp15
  br i1 %cmp17, label %lor.lhs.false19, label %if.then

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %arrayidx21 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 2
  %tmp22 = load i8* %arrayidx21, align 1
  %arrayidx25 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 2
  %tmp26 = load i8* %arrayidx25, align 1
  %cmp28 = icmp eq i8 %tmp22, %tmp26
  br i1 %cmp28, label %lor.lhs.false30, label %if.then

lor.lhs.false30:                                  ; preds = %lor.lhs.false19
  %arrayidx32 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 3
  %tmp33 = load i8* %arrayidx32, align 1
  %conv34 = zext i8 %tmp33 to i32
  %and = and i32 %conv34, 128
  %arrayidx36 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 3
  %tmp37 = load i8* %arrayidx36, align 1
  %conv38 = zext i8 %tmp37 to i32
  %cmp39 = icmp eq i32 %and, %conv38
  br i1 %cmp39, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false30, %lor.lhs.false19, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false30
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
