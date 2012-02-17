; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.s = type { [4 x i32] }

@main.s = internal unnamed_addr constant %struct.s { [4 x i32] [i32 1, i32 2, i32 3, i32 4] }, align 4

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

define i32 @foo(i64 %s.coerce0, i64 %s.coerce1, i32 %x1, i32 %x2, i32 %x3, i32 %x4, i32 %x5, i32 %x6, i32 %x7) nounwind uwtable {
entry:
  %s = alloca %struct.s, align 8
  %x1.addr = alloca i32, align 4
  %x2.addr = alloca i32, align 4
  %x3.addr = alloca i32, align 4
  %x4.addr = alloca i32, align 4
  %x5.addr = alloca i32, align 4
  %x6.addr = alloca i32, align 4
  %x7.addr = alloca i32, align 4
  %0 = bitcast %struct.s* %s to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %s.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %s.coerce1, i64* %2
  store i32 %x1, i32* %x1.addr, align 4
  store i32 %x2, i32* %x2.addr, align 4
  store i32 %x3, i32* %x3.addr, align 4
  store i32 %x4, i32* %x4.addr, align 4
  store i32 %x5, i32* %x5.addr, align 4
  store i32 %x6, i32* %x6.addr, align 4
  store i32 %x7, i32* %x7.addr, align 4
  %f = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %f, i32 0, i64 3
  %tmp = load i32* %arrayidx, align 4
  %tmp1 = load i32* %x7.addr, align 4
  %add = add nsw i32 %tmp, %tmp1
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.s, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.s* @main.s to i8*), i64 16, i32 4, i1 false)
  %0 = bitcast %struct.s* %s to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr %0* %0, i32 0, i32 1
  %4 = load i64* %3, align 1
  %call = call i32 @foo(i64 %2, i64 %4, i32 100, i32 200, i32 300, i32 400, i32 500, i32 600, i32 700)
  %cmp = icmp ne i32 %call, 704
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
