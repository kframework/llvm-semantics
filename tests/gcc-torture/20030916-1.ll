; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030916-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @f(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  %i = alloca i8, align 1
  %j = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i8 16, i8* %i, align 1
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %j, align 4
  %cmp = icmp slt i32 %tmp, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8* %i, align 1
  %conv = zext i8 %tmp1 to i32
  %add = add nsw i32 %conv, 232
  %conv2 = trunc i32 %add to i8
  store i8 %conv2, i8* %i, align 1
  %tmp3 = load i8* %i, align 1
  %idxprom = zext i8 %tmp3 to i64
  %tmp4 = load i32** %x.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp4, i64 %idxprom
  store i32 0, i32* %arrayidx
  %tmp5 = load i8* %i, align 1
  %conv6 = zext i8 %tmp5 to i32
  %sub = sub nsw i32 %conv6, 231
  %conv7 = trunc i32 %sub to i8
  store i8 %conv7, i8* %i, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %j, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [256 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [256 x i32]* %x, i32 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [256 x i32]* %x, i32 0, i32 0
  call void @f(i32* %arraydecay)
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc16, %for.end
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 256
  br i1 %cmp5, label %for.body6, label %for.end19

for.body6:                                        ; preds = %for.cond3
  %tmp7 = load i32* %i, align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %arrayidx9 = getelementptr inbounds [256 x i32]* %x, i32 0, i64 %idxprom8
  %tmp10 = load i32* %arrayidx9, align 4
  %tmp11 = load i32* %i, align 4
  %cmp12 = icmp sge i32 %tmp11, 8
  br i1 %cmp12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body6
  %tmp13 = load i32* %i, align 4
  %cmp14 = icmp slt i32 %tmp13, 248
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body6
  %0 = phi i1 [ false, %for.body6 ], [ %cmp14, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %cmp15 = icmp ne i32 %tmp10, %land.ext
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  br label %for.inc16

for.inc16:                                        ; preds = %if.end
  %tmp17 = load i32* %i, align 4
  %inc18 = add nsw i32 %tmp17, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond3

for.end19:                                        ; preds = %for.cond3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
