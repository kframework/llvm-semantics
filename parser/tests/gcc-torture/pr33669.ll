; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr33669.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo_t = type { i32, i32 }

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

define i64 @foo(%struct.foo_t* %pxp, i64 %offset, i32 %extent) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %pxp.addr = alloca %struct.foo_t*, align 8
  %offset.addr = alloca i64, align 8
  %extent.addr = alloca i32, align 4
  %blkoffset = alloca i64, align 8
  %diff = alloca i32, align 4
  %blkextent = alloca i32, align 4
  store %struct.foo_t* %pxp, %struct.foo_t** %pxp.addr, align 8
  store i64 %offset, i64* %offset.addr, align 8
  store i32 %extent, i32* %extent.addr, align 4
  %tmp = load i64* %offset.addr, align 8
  %tmp1 = load i64* %offset.addr, align 8
  %tmp2 = load %struct.foo_t** %pxp.addr, align 8
  %blksz = getelementptr inbounds %struct.foo_t* %tmp2, i32 0, i32 0
  %tmp3 = load i32* %blksz, align 4
  %conv = zext i32 %tmp3 to i64
  %rem = srem i64 %tmp1, %conv
  %sub = sub nsw i64 %tmp, %rem
  store i64 %sub, i64* %blkoffset, align 8
  %tmp5 = load i64* %offset.addr, align 8
  %tmp6 = load i64* %blkoffset, align 8
  %sub7 = sub nsw i64 %tmp5, %tmp6
  %conv8 = trunc i64 %sub7 to i32
  store i32 %conv8, i32* %diff, align 4
  %tmp10 = load i32* %diff, align 4
  %tmp11 = load i32* %extent.addr, align 4
  %add = add i32 %tmp10, %tmp11
  %tmp12 = load %struct.foo_t** %pxp.addr, align 8
  %blksz13 = getelementptr inbounds %struct.foo_t* %tmp12, i32 0, i32 0
  %tmp14 = load i32* %blksz13, align 4
  %add15 = add i32 %add, %tmp14
  %sub16 = sub i32 %add15, 1
  %tmp17 = load %struct.foo_t** %pxp.addr, align 8
  %blksz18 = getelementptr inbounds %struct.foo_t* %tmp17, i32 0, i32 0
  %tmp19 = load i32* %blksz18, align 4
  %div = udiv i32 %sub16, %tmp19
  %tmp20 = load %struct.foo_t** %pxp.addr, align 8
  %blksz21 = getelementptr inbounds %struct.foo_t* %tmp20, i32 0, i32 0
  %tmp22 = load i32* %blksz21, align 4
  %mul = mul i32 %div, %tmp22
  store i32 %mul, i32* %blkextent, align 4
  %tmp23 = load %struct.foo_t** %pxp.addr, align 8
  %blksz24 = getelementptr inbounds %struct.foo_t* %tmp23, i32 0, i32 0
  %tmp25 = load i32* %blksz24, align 4
  %tmp26 = load i32* %blkextent, align 4
  %cmp = icmp ult i32 %tmp25, %tmp26
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 -1, i64* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp28 = load %struct.foo_t** %pxp.addr, align 8
  %bf_cnt = getelementptr inbounds %struct.foo_t* %tmp28, i32 0, i32 1
  %tmp29 = load i32* %bf_cnt, align 4
  %tmp30 = load %struct.foo_t** %pxp.addr, align 8
  %blksz31 = getelementptr inbounds %struct.foo_t* %tmp30, i32 0, i32 0
  %tmp32 = load i32* %blksz31, align 4
  %cmp33 = icmp ugt i32 %tmp29, %tmp32
  br i1 %cmp33, label %if.then35, label %if.end41

if.then35:                                        ; preds = %if.end
  %tmp36 = load %struct.foo_t** %pxp.addr, align 8
  %blksz37 = getelementptr inbounds %struct.foo_t* %tmp36, i32 0, i32 0
  %tmp38 = load i32* %blksz37, align 4
  %tmp39 = load %struct.foo_t** %pxp.addr, align 8
  %bf_cnt40 = getelementptr inbounds %struct.foo_t* %tmp39, i32 0, i32 1
  store i32 %tmp38, i32* %bf_cnt40, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.then35, %if.end
  %tmp42 = load i64* %blkoffset, align 8
  store i64 %tmp42, i64* %retval
  br label %return

return:                                           ; preds = %if.end41, %if.then
  %0 = load i64* %retval
  ret i64 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.foo_t, align 4
  %xx = alloca i64, align 8
  store i32 0, i32* %retval
  %blksz = getelementptr inbounds %struct.foo_t* %x, i32 0, i32 0
  store i32 8192, i32* %blksz, align 4
  %bf_cnt = getelementptr inbounds %struct.foo_t* %x, i32 0, i32 1
  store i32 0, i32* %bf_cnt, align 4
  %call = call i64 @foo(%struct.foo_t* %x, i64 0, i32 4096)
  store i64 %call, i64* %xx, align 8
  %tmp = load i64* %xx, align 8
  %cmp = icmp ne i64 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
