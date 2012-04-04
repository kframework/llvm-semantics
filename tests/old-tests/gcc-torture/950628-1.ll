; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8, i8, i8, i16 }

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

define i48 @g() nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 2
  %now = alloca %struct.T, align 2
  %tmp2 = alloca i48
  %hours = getelementptr inbounds %struct.T* %now, i32 0, i32 0
  store i8 1, i8* %hours, align 1
  %day = getelementptr inbounds %struct.T* %now, i32 0, i32 1
  store i8 2, i8* %day, align 1
  %month = getelementptr inbounds %struct.T* %now, i32 0, i32 2
  store i8 3, i8* %month, align 1
  %year = getelementptr inbounds %struct.T* %now, i32 0, i32 3
  store i16 4, i16* %year, align 2
  %tmp = bitcast %struct.T* %retval to i8*
  %tmp1 = bitcast %struct.T* %now to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 6, i32 2, i1 false)
  %0 = bitcast i48* %tmp2 to %struct.T*
  %1 = load %struct.T* %retval
  store %struct.T %1, %struct.T* %0, align 1
  %2 = load i48* %tmp2
  ret i48 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i48 @f() nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 2
  %virk = alloca %struct.T, align 2
  %tmp = alloca i48
  %tmp3 = alloca i48
  %call = call i48 @g()
  store i48 %call, i48* %tmp
  %0 = bitcast i48* %tmp to %struct.T*
  %1 = load %struct.T* %0, align 1
  store %struct.T %1, %struct.T* %virk
  %tmp1 = bitcast %struct.T* %retval to i8*
  %tmp2 = bitcast %struct.T* %virk to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 6, i32 2, i1 false)
  %2 = bitcast i48* %tmp3 to %struct.T*
  %3 = load %struct.T* %retval
  store %struct.T %3, %struct.T* %2, align 1
  %4 = load i48* %tmp3
  ret i48 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %coerce = alloca %struct.T, align 2
  %tmp = alloca i48
  %coerce4 = alloca %struct.T, align 2
  %tmp5 = alloca i48
  %coerce12 = alloca %struct.T, align 2
  %tmp13 = alloca i48
  %coerce20 = alloca %struct.T, align 2
  %tmp21 = alloca i48
  store i32 0, i32* %retval
  %call = call i48 @f()
  store i48 %call, i48* %tmp
  %0 = bitcast i48* %tmp to %struct.T*
  %1 = load %struct.T* %0, align 1
  store %struct.T %1, %struct.T* %coerce
  %hours = getelementptr inbounds %struct.T* %coerce, i32 0, i32 0
  %tmp1 = load i8* %hours, align 1
  %conv = sext i8 %tmp1 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %call3 = call i48 @f()
  store i48 %call3, i48* %tmp5
  %2 = bitcast i48* %tmp5 to %struct.T*
  %3 = load %struct.T* %2, align 1
  store %struct.T %3, %struct.T* %coerce4
  %day = getelementptr inbounds %struct.T* %coerce4, i32 0, i32 1
  %tmp6 = load i8* %day, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp ne i32 %conv7, 2
  br i1 %cmp8, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %call11 = call i48 @f()
  store i48 %call11, i48* %tmp13
  %4 = bitcast i48* %tmp13 to %struct.T*
  %5 = load %struct.T* %4, align 1
  store %struct.T %5, %struct.T* %coerce12
  %month = getelementptr inbounds %struct.T* %coerce12, i32 0, i32 2
  %tmp14 = load i8* %month, align 1
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp ne i32 %conv15, 3
  br i1 %cmp16, label %if.then, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false10
  %call19 = call i48 @f()
  store i48 %call19, i48* %tmp21
  %6 = bitcast i48* %tmp21 to %struct.T*
  %7 = load %struct.T* %6, align 1
  store %struct.T %7, %struct.T* %coerce20
  %year = getelementptr inbounds %struct.T* %coerce20, i32 0, i32 3
  %tmp22 = load i16* %year, align 2
  %conv23 = sext i16 %tmp22 to i32
  %cmp24 = icmp ne i32 %conv23, 4
  br i1 %cmp24, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false18, %lor.lhs.false10, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false18
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
