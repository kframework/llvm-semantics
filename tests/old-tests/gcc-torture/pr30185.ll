; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr30185.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i64 }

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

define %struct.S @foo(i8 %x.coerce0, i64 %x.coerce1, i8 %y.coerce0, i64 %y.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.S, align 8
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %z = alloca %struct.S, align 8
  %0 = getelementptr %struct.S* %x, i32 0, i32 0
  store i8 %x.coerce0, i8* %0
  %1 = getelementptr %struct.S* %x, i32 0, i32 1
  store i64 %x.coerce1, i64* %1
  %2 = getelementptr %struct.S* %y, i32 0, i32 0
  store i8 %y.coerce0, i8* %2
  %3 = getelementptr %struct.S* %y, i32 0, i32 1
  store i64 %y.coerce1, i64* %3
  %b = getelementptr inbounds %struct.S* %x, i32 0, i32 1
  %tmp = load i64* %b, align 8
  %b1 = getelementptr inbounds %struct.S* %y, i32 0, i32 1
  %tmp2 = load i64* %b1, align 8
  %div = sdiv i64 %tmp, %tmp2
  %b3 = getelementptr inbounds %struct.S* %z, i32 0, i32 1
  store i64 %div, i64* %b3, align 8
  %tmp4 = bitcast %struct.S* %retval to i8*
  %tmp5 = bitcast %struct.S* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 16, i32 8, i1 false)
  %4 = load %struct.S* %retval
  ret %struct.S %4
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.S, align 8
  %b = alloca %struct.S, align 8
  %agg.tmp = alloca %struct.S, align 8
  %agg.tmp7 = alloca %struct.S, align 8
  store i32 0, i32* %retval
  %b1 = getelementptr inbounds %struct.S* %a, i32 0, i32 1
  store i64 32, i64* %b1, align 8
  %b2 = getelementptr inbounds %struct.S* %b, i32 0, i32 1
  store i64 4, i64* %b2, align 8
  %0 = getelementptr %struct.S* %a, i32 0, i32 0
  %1 = load i8* %0, align 1
  %2 = getelementptr %struct.S* %a, i32 0, i32 1
  %3 = load i64* %2, align 1
  %4 = getelementptr %struct.S* %b, i32 0, i32 0
  %5 = load i8* %4, align 1
  %6 = getelementptr %struct.S* %b, i32 0, i32 1
  %7 = load i64* %6, align 1
  %call = call %struct.S @foo(i8 %1, i64 %3, i8 %5, i64 %7)
  %8 = getelementptr %struct.S* %agg.tmp, i32 0, i32 0
  %9 = extractvalue %struct.S %call, 0
  store i8 %9, i8* %8
  %10 = getelementptr %struct.S* %agg.tmp, i32 0, i32 1
  %11 = extractvalue %struct.S %call, 1
  store i64 %11, i64* %10
  %b3 = getelementptr inbounds %struct.S* %agg.tmp, i32 0, i32 1
  %tmp = load i64* %b3, align 8
  %cmp = icmp ne i64 %tmp, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %b4 = getelementptr inbounds %struct.S* %a, i32 0, i32 1
  store i64 -8, i64* %b4, align 8
  %b5 = getelementptr inbounds %struct.S* %b, i32 0, i32 1
  store i64 -2, i64* %b5, align 8
  %12 = getelementptr %struct.S* %a, i32 0, i32 0
  %13 = load i8* %12, align 1
  %14 = getelementptr %struct.S* %a, i32 0, i32 1
  %15 = load i64* %14, align 1
  %16 = getelementptr %struct.S* %b, i32 0, i32 0
  %17 = load i8* %16, align 1
  %18 = getelementptr %struct.S* %b, i32 0, i32 1
  %19 = load i64* %18, align 1
  %call6 = call %struct.S @foo(i8 %13, i64 %15, i8 %17, i64 %19)
  %20 = getelementptr %struct.S* %agg.tmp7, i32 0, i32 0
  %21 = extractvalue %struct.S %call6, 0
  store i8 %21, i8* %20
  %22 = getelementptr %struct.S* %agg.tmp7, i32 0, i32 1
  %23 = extractvalue %struct.S %call6, 1
  store i64 %23, i64* %22
  %b8 = getelementptr inbounds %struct.S* %agg.tmp7, i32 0, i32 1
  %tmp9 = load i64* %b8, align 8
  %cmp10 = icmp ne i64 %tmp9, 4
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
