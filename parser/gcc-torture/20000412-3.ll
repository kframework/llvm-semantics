; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000412-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i8, [32 x i8] }

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

define i32 @z() nounwind uwtable {
entry:
  %xxx = alloca %struct.X, align 1
  %x = getelementptr inbounds %struct.X* %xxx, i32 0, i32 1
  %arrayidx = getelementptr inbounds [32 x i8]* %x, i32 0, i64 31
  store i8 48, i8* %arrayidx, align 1
  %x1 = getelementptr inbounds %struct.X* %xxx, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [32 x i8]* %x1, i32 0, i64 0
  store i8 48, i8* %arrayidx2, align 1
  %y = getelementptr inbounds %struct.X* %xxx, i32 0, i32 0
  store i8 15, i8* %y, align 1
  %call = call i32 (...)* bitcast (i32 (%struct.X*, %struct.X*)* @f to i32 (...)*)(%struct.X* byval align 8 %xxx, %struct.X* byval align 8 %xxx)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @z()
  store i32 %call, i32* %val, align 4
  %tmp = load i32* %val, align 4
  %cmp = icmp ne i32 %tmp, 96
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @f(%struct.X* byval align 8 %x, %struct.X* byval align 8 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y1 = getelementptr inbounds %struct.X* %x, i32 0, i32 0
  %tmp = load i8* %y1, align 1
  %conv = sext i8 %tmp to i32
  %y2 = getelementptr inbounds %struct.X* %y, i32 0, i32 0
  %tmp3 = load i8* %y2, align 1
  %conv4 = sext i8 %tmp3 to i32
  %cmp = icmp ne i32 %conv, %conv4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 70, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %x6 = getelementptr inbounds %struct.X* %x, i32 0, i32 1
  %arrayidx = getelementptr inbounds [32 x i8]* %x6, i32 0, i64 0
  %tmp7 = load i8* %arrayidx, align 1
  %conv8 = sext i8 %tmp7 to i32
  %x9 = getelementptr inbounds %struct.X* %y, i32 0, i32 1
  %arrayidx10 = getelementptr inbounds [32 x i8]* %x9, i32 0, i64 0
  %tmp11 = load i8* %arrayidx10, align 1
  %conv12 = sext i8 %tmp11 to i32
  %add = add nsw i32 %conv8, %conv12
  store i32 %add, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
