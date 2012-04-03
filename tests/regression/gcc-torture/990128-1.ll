; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990128-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { %struct.s* }

@count = global i32 0, align 4
@ss = common global %struct.s zeroinitializer, align 8
@p = common global %struct.s* null, align 8
@sss = common global [10 x %struct.s] zeroinitializer, align 16

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %pp = alloca %struct.s*, align 8
  %next = alloca %struct.s*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store %struct.s* @ss, %struct.s** @p, align 8
  %tmp = load %struct.s** @p, align 8
  store %struct.s* %tmp, %struct.s** %next, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [10 x %struct.s]* @sss, i32 0, i64 %idxprom
  %tmp3 = load %struct.s** %next, align 8
  %n = getelementptr inbounds %struct.s* %tmp3, i32 0, i32 0
  store %struct.s* %arrayidx, %struct.s** %n, align 8
  %tmp4 = load %struct.s** %next, align 8
  %n5 = getelementptr inbounds %struct.s* %tmp4, i32 0, i32 0
  %tmp6 = load %struct.s** %n5, align 8
  store %struct.s* %tmp6, %struct.s** %next, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp8 = load %struct.s** %next, align 8
  %n9 = getelementptr inbounds %struct.s* %tmp8, i32 0, i32 0
  store %struct.s* null, %struct.s** %n9, align 8
  %tmp10 = load %struct.s** @p, align 8
  call void @sub(%struct.s* %tmp10, %struct.s** %pp)
  %tmp11 = load i32* @count, align 4
  %cmp12 = icmp ne i32 %tmp11, 12
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define void @sub(%struct.s* %p, %struct.s** %pp) nounwind uwtable {
entry:
  %p.addr = alloca %struct.s*, align 8
  %pp.addr = alloca %struct.s**, align 8
  store %struct.s* %p, %struct.s** %p.addr, align 8
  store %struct.s** %pp, %struct.s*** %pp.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %tmp = load %struct.s** %p.addr, align 8
  %tmp1 = load %struct.s*** %pp.addr, align 8
  %call = call i32 @look(%struct.s* %tmp, %struct.s** %tmp1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load %struct.s** %p.addr, align 8
  %tobool3 = icmp ne %struct.s* %tmp2, null
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %tmp4 = load %struct.s** %p.addr, align 8
  %n = getelementptr inbounds %struct.s* %tmp4, i32 0, i32 0
  %tmp5 = load %struct.s** %n, align 8
  store %struct.s* %tmp5, %struct.s** %p.addr, align 8
  br label %if.end

if.else:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.cond

for.end:                                          ; preds = %if.else, %for.cond
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @look(%struct.s* %p, %struct.s** %pp) nounwind uwtable {
entry:
  %p.addr = alloca %struct.s*, align 8
  %pp.addr = alloca %struct.s**, align 8
  store %struct.s* %p, %struct.s** %p.addr, align 8
  store %struct.s** %pp, %struct.s*** %pp.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load %struct.s** %p.addr, align 8
  %tobool = icmp ne %struct.s* %tmp, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp1 = load %struct.s** %p.addr, align 8
  %n = getelementptr inbounds %struct.s* %tmp1, i32 0, i32 0
  %tmp2 = load %struct.s** %n, align 8
  store %struct.s* %tmp2, %struct.s** %p.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load %struct.s** %p.addr, align 8
  %tmp4 = load %struct.s*** %pp.addr, align 8
  store %struct.s* %tmp3, %struct.s** %tmp4
  %tmp5 = load i32* @count, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* @count, align 4
  ret i32 1
}
