; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr45070.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.packed_ushort = type <{ i16 }>
%struct.source = type { i32, i32, i32 }

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
  %s = alloca %struct.source, align 4
  %i = alloca i32, align 4
  %rv = alloca %struct.packed_ushort, align 1
  store i32 0, i32* %retval
  %pos = getelementptr inbounds %struct.source* %s, i32 0, i32 0
  store i32 0, i32* %pos, align 4
  %length = getelementptr inbounds %struct.source* %s, i32 0, i32 1
  store i32 0, i32* %length, align 4
  %flag = getelementptr inbounds %struct.source* %s, i32 0, i32 2
  store i32 0, i32* %flag, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i16 @next(%struct.source* %s)
  %coerce.dive = getelementptr %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 %call, i16* %coerce.dive
  %tmp2 = load i32* %i, align 4
  %cmp3 = icmp eq i32 %tmp2, 0
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %ucs = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  %tmp4 = load i16* %ucs, align 1
  %conv = zext i16 %tmp4 to i32
  %cmp5 = icmp ne i32 %conv, 65535
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body
  %tmp7 = load i32* %i, align 4
  %cmp8 = icmp sgt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %lor.lhs.false
  %ucs11 = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  %tmp12 = load i16* %ucs11, align 1
  %conv13 = zext i16 %tmp12 to i32
  %cmp14 = icmp ne i32 %conv13, 0
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true10, %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true10, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp16 = load i32* %i, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal i16 @next(%struct.source* %p) nounwind uwtable noinline {
entry:
  %retval = alloca %struct.packed_ushort, align 1
  %p.addr = alloca %struct.source*, align 8
  %rv = alloca %struct.packed_ushort, align 1
  store %struct.source* %p, %struct.source** %p.addr, align 8
  %tmp = load %struct.source** %p.addr, align 8
  %pos = getelementptr inbounds %struct.source* %tmp, i32 0, i32 0
  %tmp1 = load i32* %pos, align 4
  %tmp2 = load %struct.source** %p.addr, align 8
  %length = getelementptr inbounds %struct.source* %tmp2, i32 0, i32 1
  %tmp3 = load i32* %length, align 4
  %cmp = icmp sge i32 %tmp1, %tmp3
  br i1 %cmp, label %if.then, label %if.end15

if.then:                                          ; preds = %entry
  %tmp4 = load %struct.source** %p.addr, align 8
  %flag = getelementptr inbounds %struct.source* %tmp4, i32 0, i32 2
  %tmp5 = load i32* %flag, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %tmp7 = load %struct.source** %p.addr, align 8
  %flag8 = getelementptr inbounds %struct.source* %tmp7, i32 0, i32 2
  store i32 0, i32* %flag8, align 4
  %tmp9 = load %struct.source** %p.addr, align 8
  call void @fetch(%struct.source* %tmp9)
  %tmp10 = load %struct.source** %p.addr, align 8
  %call = call i16 @next(%struct.source* %tmp10)
  %coerce.dive = getelementptr %struct.packed_ushort* %retval, i32 0, i32 0
  store i16 %call, i16* %coerce.dive
  br label %return

if.end:                                           ; preds = %if.then
  %tmp11 = load %struct.source** %p.addr, align 8
  %flag12 = getelementptr inbounds %struct.source* %tmp11, i32 0, i32 2
  store i32 1, i32* %flag12, align 4
  %ucs = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 -1, i16* %ucs, align 1
  %tmp13 = bitcast %struct.packed_ushort* %retval to i8*
  %tmp14 = bitcast %struct.packed_ushort* %rv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp13, i8* %tmp14, i64 2, i32 1, i1 false)
  br label %return

if.end15:                                         ; preds = %entry
  %ucs16 = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 0, i16* %ucs16, align 1
  %tmp17 = bitcast %struct.packed_ushort* %retval to i8*
  %tmp18 = bitcast %struct.packed_ushort* %rv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp17, i8* %tmp18, i64 2, i32 1, i1 false)
  br label %return

return:                                           ; preds = %if.end15, %if.end, %if.then6
  %coerce.dive19 = getelementptr %struct.packed_ushort* %retval, i32 0, i32 0
  %0 = load i16* %coerce.dive19
  ret i16 %0
}

declare void @abort() noreturn nounwind

define internal void @fetch(%struct.source* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca %struct.source*, align 8
  store %struct.source* %p, %struct.source** %p.addr, align 8
  %tmp = load %struct.source** %p.addr, align 8
  %length = getelementptr inbounds %struct.source* %tmp, i32 0, i32 1
  store i32 128, i32* %length, align 4
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
