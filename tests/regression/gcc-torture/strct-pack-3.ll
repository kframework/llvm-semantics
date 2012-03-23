; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/strct-pack-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type <{ i16, [2 x i32] }>

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

define i32 @f(%struct.A* %ap) nounwind uwtable {
entry:
  %ap.addr = alloca %struct.A*, align 8
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  store %struct.A* %ap, %struct.A** %ap.addr, align 8
  store i16 1, i16* %j, align 2
  %tmp = load %struct.A** %ap.addr, align 8
  %f = getelementptr inbounds %struct.A* %tmp, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x i32]* %f, i32 0, i64 1
  %tmp1 = load i32* %arrayidx, align 2
  %conv = trunc i32 %tmp1 to i16
  store i16 %conv, i16* %i, align 2
  %tmp2 = load i16* %j, align 2
  %idxprom = sext i16 %tmp2 to i64
  %tmp3 = load %struct.A** %ap.addr, align 8
  %f4 = getelementptr inbounds %struct.A* %tmp3, i32 0, i32 1
  %arrayidx5 = getelementptr inbounds [2 x i32]* %f4, i32 0, i64 %idxprom
  %tmp6 = load i32* %arrayidx5, align 2
  %tmp7 = load i16* %i, align 2
  %conv8 = sext i16 %tmp7 to i32
  %add = add nsw i32 %conv8, %tmp6
  %conv9 = trunc i32 %add to i16
  store i16 %conv9, i16* %i, align 2
  store i16 0, i16* %j, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp10 = load i16* %j, align 2
  %conv11 = sext i16 %tmp10 to i32
  %cmp = icmp slt i32 %conv11, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp13 = load i16* %j, align 2
  %idxprom14 = sext i16 %tmp13 to i64
  %tmp15 = load %struct.A** %ap.addr, align 8
  %f16 = getelementptr inbounds %struct.A* %tmp15, i32 0, i32 1
  %arrayidx17 = getelementptr inbounds [2 x i32]* %f16, i32 0, i64 %idxprom14
  %tmp18 = load i32* %arrayidx17, align 2
  %tmp19 = load i16* %i, align 2
  %conv20 = sext i16 %tmp19 to i32
  %add21 = add nsw i32 %conv20, %tmp18
  %conv22 = trunc i32 %add21 to i16
  store i16 %conv22, i16* %i, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp23 = load i16* %j, align 2
  %inc = add i16 %tmp23, 1
  store i16 %inc, i16* %j, align 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp24 = load i16* %i, align 2
  %conv25 = sext i16 %tmp24 to i32
  ret i32 %conv25
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 2
  store i32 0, i32* %retval
  %f = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x i32]* %f, i32 0, i64 0
  store i32 100, i32* %arrayidx, align 2
  %f1 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [2 x i32]* %f1, i32 0, i64 1
  store i32 13, i32* %arrayidx2, align 2
  %call = call i32 (...)* bitcast (i32 (%struct.A*)* @f to i32 (...)*)(%struct.A* %a)
  %cmp = icmp ne i32 %call, 139
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
