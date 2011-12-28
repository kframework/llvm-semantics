; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030613-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.CS = type { i64, i64 }

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
  %x = alloca %struct.CS, align 8
  store i32 0, i32* %retval
  %x1 = getelementptr inbounds %struct.CS* %x, i32 0, i32 0
  store i64 -7, i64* %x1, align 8
  %y = getelementptr inbounds %struct.CS* %x, i32 0, i32 1
  store i64 -7, i64* %y, align 8
  %0 = getelementptr %struct.CS* %x, i32 0, i32 0
  %1 = load i64* %0, align 1
  %2 = getelementptr %struct.CS* %x, i32 0, i32 1
  %3 = load i64* %2, align 1
  %call = call i32 @c5p(i64 %1, i64 %3)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal i32 @c5p(i64 %x.coerce0, i64 %x.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.CS, align 8
  %a = alloca %struct.CS, align 8
  %b = alloca %struct.CS, align 8
  %agg.tmp = alloca %struct.CS, align 8
  %0 = getelementptr %struct.CS* %x, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr %struct.CS* %x, i32 0, i32 1
  store i64 %x.coerce1, i64* %1
  %2 = getelementptr %struct.CS* %x, i32 0, i32 0
  %3 = load i64* %2, align 1
  %4 = getelementptr %struct.CS* %x, i32 0, i32 1
  %5 = load i64* %4, align 1
  %call = call %struct.CS @CPOW(i64 %3, i64 %5, i32 2)
  %6 = getelementptr %struct.CS* %a, i32 0, i32 0
  %7 = extractvalue %struct.CS %call, 0
  store i64 %7, i64* %6
  %8 = getelementptr %struct.CS* %a, i32 0, i32 1
  %9 = extractvalue %struct.CS %call, 1
  store i64 %9, i64* %8
  %10 = getelementptr %struct.CS* %a, i32 0, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CS* %a, i32 0, i32 1
  %13 = load i64* %12, align 1
  %call1 = call %struct.CS @CPOW(i64 %11, i64 %13, i32 2)
  %14 = getelementptr %struct.CS* %agg.tmp, i32 0, i32 0
  %15 = extractvalue %struct.CS %call1, 0
  store i64 %15, i64* %14
  %16 = getelementptr %struct.CS* %agg.tmp, i32 0, i32 1
  %17 = extractvalue %struct.CS %call1, 1
  store i64 %17, i64* %16
  %18 = getelementptr %struct.CS* %agg.tmp, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr %struct.CS* %agg.tmp, i32 0, i32 1
  %21 = load i64* %20, align 1
  %call2 = call %struct.CS @CCID(i64 %19, i64 %21)
  %22 = getelementptr %struct.CS* %b, i32 0, i32 0
  %23 = extractvalue %struct.CS %call2, 0
  store i64 %23, i64* %22
  %24 = getelementptr %struct.CS* %b, i32 0, i32 1
  %25 = extractvalue %struct.CS %call2, 1
  store i64 %25, i64* %24
  %x3 = getelementptr inbounds %struct.CS* %b, i32 0, i32 0
  %tmp = load i64* %x3, align 8
  %y = getelementptr inbounds %struct.CS* %b, i32 0, i32 1
  %tmp4 = load i64* %y, align 8
  %cmp = icmp eq i64 %tmp, %tmp4
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @abort() noreturn nounwind

define internal %struct.CS @CPOW(i64 %x.coerce0, i64 %x.coerce1, i32 %y) nounwind uwtable {
entry:
  %retval = alloca %struct.CS, align 8
  %x = alloca %struct.CS, align 8
  %y.addr = alloca i32, align 4
  %a = alloca %struct.CS, align 8
  %0 = getelementptr %struct.CS* %x, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr %struct.CS* %x, i32 0, i32 1
  store i64 %x.coerce1, i64* %1
  store i32 %y, i32* %y.addr, align 4
  %tmp = bitcast %struct.CS* %a to i8*
  %tmp1 = bitcast %struct.CS* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 16, i32 8, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp2 = load i32* %y.addr, align 4
  %dec = add nsw i32 %tmp2, -1
  store i32 %dec, i32* %y.addr, align 4
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = getelementptr %struct.CS* %a, i32 0, i32 0
  %3 = load i64* %2, align 1
  %4 = getelementptr %struct.CS* %a, i32 0, i32 1
  %5 = load i64* %4, align 1
  %call = call %struct.CS @CCID(i64 %3, i64 %5)
  %6 = getelementptr %struct.CS* %a, i32 0, i32 0
  %7 = extractvalue %struct.CS %call, 0
  store i64 %7, i64* %6
  %8 = getelementptr %struct.CS* %a, i32 0, i32 1
  %9 = extractvalue %struct.CS %call, 1
  store i64 %9, i64* %8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp3 = bitcast %struct.CS* %retval to i8*
  %tmp4 = bitcast %struct.CS* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %tmp4, i64 16, i32 8, i1 false)
  %10 = load %struct.CS* %retval
  ret %struct.CS %10
}

define internal %struct.CS @CCID(i64 %x.coerce0, i64 %x.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.CS, align 8
  %x = alloca %struct.CS, align 8
  %a = alloca %struct.CS, align 8
  %0 = getelementptr %struct.CS* %x, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr %struct.CS* %x, i32 0, i32 1
  store i64 %x.coerce1, i64* %1
  %x1 = getelementptr inbounds %struct.CS* %x, i32 0, i32 0
  %tmp = load i64* %x1, align 8
  %x2 = getelementptr inbounds %struct.CS* %a, i32 0, i32 0
  store i64 %tmp, i64* %x2, align 8
  %y = getelementptr inbounds %struct.CS* %x, i32 0, i32 1
  %tmp3 = load i64* %y, align 8
  %y4 = getelementptr inbounds %struct.CS* %a, i32 0, i32 1
  store i64 %tmp3, i64* %y4, align 8
  %tmp5 = bitcast %struct.CS* %retval to i8*
  %tmp6 = bitcast %struct.CS* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 16, i32 8, i1 false)
  %2 = load %struct.CS* %retval
  ret %struct.CS %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
