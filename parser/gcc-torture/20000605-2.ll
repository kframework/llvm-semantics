; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000605-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.F = type { i32 }

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

define void @f1(%struct.F* %x, %struct.F* %y) nounwind uwtable {
entry:
  %x.addr = alloca %struct.F*, align 8
  %y.addr = alloca %struct.F*, align 8
  %timeout = alloca i32, align 4
  store %struct.F* %x, %struct.F** %x.addr, align 8
  store %struct.F* %y, %struct.F** %y.addr, align 8
  store i32 0, i32* %timeout, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load %struct.F** %x.addr, align 8
  %i = getelementptr inbounds %struct.F* %tmp, i32 0, i32 0
  %tmp1 = load i32* %i, align 4
  %tmp2 = load %struct.F** %y.addr, align 8
  %i3 = getelementptr inbounds %struct.F* %tmp2, i32 0, i32 0
  %tmp4 = load i32* %i3, align 4
  %cmp = icmp slt i32 %tmp1, %tmp4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i32* %timeout, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %timeout, align 4
  %cmp6 = icmp sgt i32 %inc, 5
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp7 = load %struct.F** %x.addr, align 8
  %i8 = getelementptr inbounds %struct.F* %tmp7, i32 0, i32 0
  %tmp9 = load i32* %i8, align 4
  %inc10 = add nsw i32 %tmp9, 1
  store i32 %inc10, i32* %i8, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.F, align 4
  %y = alloca %struct.F, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.F* %x, i32 0, i32 0
  store i32 0, i32* %i, align 4
  %i1 = getelementptr inbounds %struct.F* %y, i32 0, i32 0
  store i32 1, i32* %i1, align 4
  call void @f1(%struct.F* %x, %struct.F* %y)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
