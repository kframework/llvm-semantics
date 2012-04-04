; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990525-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.Test1 = type { [4 x i32] }

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

define i32 @func1() nounwind uwtable {
entry:
  %test = alloca %struct.Test1, align 4
  %call = call %0 @func2()
  %coerce.dive = getelementptr %struct.Test1* %test, i32 0, i32 0
  %0 = bitcast [4 x i32]* %coerce.dive to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  %2 = extractvalue %0 %call, 0
  store i64 %2, i64* %1, align 1
  %3 = getelementptr %0* %0, i32 0, i32 1
  %4 = extractvalue %0 %call, 1
  store i64 %4, i64* %3, align 1
  %v = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %v, i32 0, i64 0
  %tmp = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %tmp, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %v1 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [4 x i32]* %v1, i32 0, i64 1
  %tmp3 = load i32* %arrayidx2, align 4
  %cmp4 = icmp ne i32 %tmp3, 20
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %v7 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx8 = getelementptr inbounds [4 x i32]* %v7, i32 0, i64 2
  %tmp9 = load i32* %arrayidx8, align 4
  %cmp10 = icmp ne i32 %tmp9, 30
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end6
  %v13 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx14 = getelementptr inbounds [4 x i32]* %v13, i32 0, i64 3
  %tmp15 = load i32* %arrayidx14, align 4
  %cmp16 = icmp ne i32 %tmp15, 40
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end12
  ret i32 0
}

declare void @abort() noreturn nounwind

define %0 @func2() nounwind uwtable {
entry:
  %retval = alloca %struct.Test1, align 4
  %tmp = alloca %struct.Test1, align 4
  %v = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %v, i32 0, i64 0
  store i32 10, i32* %arrayidx, align 4
  %v1 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [4 x i32]* %v1, i32 0, i64 1
  store i32 20, i32* %arrayidx2, align 4
  %v3 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds [4 x i32]* %v3, i32 0, i64 2
  store i32 30, i32* %arrayidx4, align 4
  %v5 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx6 = getelementptr inbounds [4 x i32]* %v5, i32 0, i64 3
  store i32 40, i32* %arrayidx6, align 4
  %tmp7 = bitcast %struct.Test1* %retval to i8*
  %tmp8 = bitcast %struct.Test1* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp7, i8* %tmp8, i64 16, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.Test1* %retval, i32 0, i32 0
  %0 = bitcast [4 x i32]* %coerce.dive to %0*
  %1 = load %0* %0, align 1
  ret %0 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @func1()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
