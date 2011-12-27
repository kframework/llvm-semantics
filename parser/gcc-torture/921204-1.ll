; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf = type { i8, [2 x i8], i8 }
%union.bu = type { i32 }

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

define i32 @f(i32 %i.coerce) nounwind uwtable {
entry:
  %retval = alloca %union.bu, align 4
  %i = alloca %union.bu, align 4
  %o = alloca %union.bu, align 4
  %coerce.dive = getelementptr %union.bu* %i, i32 0, i32 0
  store i32 %i.coerce, i32* %coerce.dive
  %tmp = bitcast %union.bu* %o to i8*
  %tmp1 = bitcast %union.bu* %i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 4, i32 4, i1 false)
  %b = bitcast %union.bu* %o to %struct.bf*
  %0 = bitcast %struct.bf* %b to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 1
  %tobool = icmp ne i32 %bf.clear, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %b2 = bitcast %union.bu* %o to %struct.bf*
  %2 = bitcast %struct.bf* %b2 to i32*
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -262145
  %5 = or i32 %4, 262144
  store i32 %5, i32* %2, align 4
  %b3 = bitcast %union.bu* %o to %struct.bf*
  %6 = bitcast %struct.bf* %b3 to i32*
  %7 = load i32* %6, align 4
  %8 = and i32 %7, -1048577
  %9 = or i32 %8, 1048576
  store i32 %9, i32* %6, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %b4 = bitcast %union.bu* %o to %struct.bf*
  %10 = bitcast %struct.bf* %b4 to i32*
  %11 = load i32* %10, align 4
  %12 = and i32 %11, -262145
  store i32 %12, i32* %10, align 4
  %b5 = bitcast %union.bu* %o to %struct.bf*
  %13 = bitcast %struct.bf* %b5 to i32*
  %14 = load i32* %13, align 4
  %15 = and i32 %14, -1048577
  store i32 %15, i32* %13, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp6 = bitcast %union.bu* %retval to i8*
  %tmp7 = bitcast %union.bu* %o to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp7, i64 4, i32 4, i1 false)
  %coerce.dive8 = getelementptr %union.bu* %retval, i32 0, i32 0
  %16 = load i32* %coerce.dive8
  ret i32 %16
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %union.bu, align 4
  %r = alloca %union.bu, align 4
  store i32 0, i32* %retval
  %w = bitcast %union.bu* %a to i32*
  store i32 67108864, i32* %w, align 4
  %b = bitcast %union.bu* %a to %struct.bf*
  %0 = bitcast %struct.bf* %b to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -2
  store i32 %2, i32* %0, align 4
  %coerce.dive = getelementptr %union.bu* %a, i32 0, i32 0
  %3 = load i32* %coerce.dive
  %call = call i32 @f(i32 %3)
  %coerce.dive1 = getelementptr %union.bu* %r, i32 0, i32 0
  store i32 %call, i32* %coerce.dive1
  %w2 = bitcast %union.bu* %a to i32*
  %tmp = load i32* %w2, align 4
  %w3 = bitcast %union.bu* %r to i32*
  %tmp4 = load i32* %w3, align 4
  %cmp = icmp ne i32 %tmp, %tmp4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
