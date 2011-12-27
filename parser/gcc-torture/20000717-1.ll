; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000717-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i32 }
%struct.trio = type { i32, i32, i32 }

@main.t = internal unnamed_addr constant %struct.trio { i32 1, i32 2, i32 3 }, align 4

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

define i32 @bar(i32 %i, i64 %t.coerce0, i32 %t.coerce1) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %t = alloca %struct.trio, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = bitcast %struct.trio* %t to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %t.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %t.coerce1, i32* %2
  %a = getelementptr inbounds %struct.trio* %t, i32 0, i32 0
  %tmp = load i32* %a, align 4
  %b = getelementptr inbounds %struct.trio* %t, i32 0, i32 1
  %tmp1 = load i32* %b, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %a2 = getelementptr inbounds %struct.trio* %t, i32 0, i32 0
  %tmp3 = load i32* %a2, align 4
  %c = getelementptr inbounds %struct.trio* %t, i32 0, i32 2
  %tmp4 = load i32* %c, align 4
  %cmp5 = icmp eq i32 %tmp3, %tmp4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i) nounwind uwtable {
entry:
  %t = alloca %struct.trio, align 8
  %i.addr = alloca i32, align 4
  %0 = bitcast %struct.trio* %t to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %t.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %t.coerce1, i32* %2
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %3 = bitcast %struct.trio* %t to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr %0* %3, i32 0, i32 1
  %7 = load i32* %6, align 1
  %call = call i32 @bar(i32 %tmp, i64 %5, i32 %7)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.trio, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.trio* @main.t to i8*), i64 12, i32 4, i1 false)
  %0 = bitcast %struct.trio* %t to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr %0* %0, i32 0, i32 1
  %4 = load i32* %3, align 1
  %call = call i32 @foo(i64 %2, i32 %4, i32 4)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind
