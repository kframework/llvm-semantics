; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020810-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.A = type { i64 }
%struct.R = type { %struct.A, %struct.A }

@R = global %struct.R { %struct.A { i64 100 }, %struct.A { i64 200 } }, align 8

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

define void @f(i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable {
entry:
  %r = alloca %struct.R, align 8
  %0 = bitcast %struct.R* %r to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %r.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %r.coerce1, i64* %2
  %a = getelementptr inbounds %struct.R* %r, i32 0, i32 0
  %x = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %tmp = load i64* %x, align 8
  %tmp1 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 0, i32 0), align 8
  %cmp = icmp ne i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.R* %r, i32 0, i32 1
  %x2 = getelementptr inbounds %struct.A* %b, i32 0, i32 0
  %tmp3 = load i64* %x2, align 8
  %tmp4 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 1, i32 0), align 8
  %cmp5 = icmp ne i64 %tmp3, %tmp4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define %0 @g() nounwind uwtable {
entry:
  %retval = alloca %struct.R, align 8
  %tmp = bitcast %struct.R* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.R* @R to i8*), i64 16, i32 8, i1 false)
  %0 = bitcast %struct.R* %retval to %0*
  %1 = load %0* %0, align 1
  ret %0 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca %struct.R, align 8
  store i32 0, i32* %retval
  %0 = load i64* getelementptr (%0* bitcast (%struct.R* @R to %0*), i32 0, i32 0), align 1
  %1 = load i64* getelementptr (%0* bitcast (%struct.R* @R to %0*), i32 0, i32 1), align 1
  call void @f(i64 %0, i64 %1)
  %call = call %0 @g()
  %2 = bitcast %struct.R* %r to %0*
  %3 = getelementptr %0* %2, i32 0, i32 0
  %4 = extractvalue %0 %call, 0
  store i64 %4, i64* %3, align 1
  %5 = getelementptr %0* %2, i32 0, i32 1
  %6 = extractvalue %0 %call, 1
  store i64 %6, i64* %5, align 1
  %a = getelementptr inbounds %struct.R* %r, i32 0, i32 0
  %x = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %tmp = load i64* %x, align 8
  %tmp1 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 0, i32 0), align 8
  %cmp = icmp ne i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.R* %r, i32 0, i32 1
  %x2 = getelementptr inbounds %struct.A* %b, i32 0, i32 0
  %tmp3 = load i64* %x2, align 8
  %tmp4 = load i64* getelementptr inbounds (%struct.R* @R, i32 0, i32 1, i32 0), align 8
  %cmp5 = icmp ne i64 %tmp3, %tmp4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}
