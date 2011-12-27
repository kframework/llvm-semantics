; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.a = type { i64, i64 }
%struct.b = type { %struct.a, %struct.a }

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

define i32 @bar(i32 %x, %struct.b* noalias %y, %struct.b* noalias %z) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca %struct.b*, align 8
  %z.addr = alloca %struct.b*, align 8
  store i32 %x, i32* %x.addr, align 4
  store %struct.b* %y, %struct.b** %y.addr, align 8
  store %struct.b* %z, %struct.b** %z.addr, align 8
  %tmp = load %struct.b** %y.addr, align 8
  %c = getelementptr inbounds %struct.b* %tmp, i32 0, i32 0
  %v = getelementptr inbounds %struct.a* %c, i32 0, i32 0
  %tmp1 = load i64* %v, align 8
  %tobool = icmp ne i64 %tmp1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load %struct.b** %y.addr, align 8
  %c3 = getelementptr inbounds %struct.b* %tmp2, i32 0, i32 0
  %w = getelementptr inbounds %struct.a* %c3, i32 0, i32 1
  %tmp4 = load i64* %w, align 8
  %cmp = icmp ne i64 %tmp4, 250000
  br i1 %cmp, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load %struct.b** %y.addr, align 8
  %d = getelementptr inbounds %struct.b* %tmp6, i32 0, i32 1
  %v7 = getelementptr inbounds %struct.a* %d, i32 0, i32 0
  %tmp8 = load i64* %v7, align 8
  %tobool9 = icmp ne i64 %tmp8, 0
  br i1 %tobool9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false5
  %tmp11 = load %struct.b** %y.addr, align 8
  %d12 = getelementptr inbounds %struct.b* %tmp11, i32 0, i32 1
  %w13 = getelementptr inbounds %struct.a* %d12, i32 0, i32 1
  %tmp14 = load i64* %w13, align 8
  %cmp15 = icmp ne i64 %tmp14, 250000
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false5, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false10
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
entry:
  %x = alloca %struct.b, align 8
  %c = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %v = getelementptr inbounds %struct.a* %c, i32 0, i32 0
  store i64 0, i64* %v, align 8
  %c1 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %w = getelementptr inbounds %struct.a* %c1, i32 0, i32 1
  store i64 250000, i64* %w, align 8
  %d = getelementptr inbounds %struct.b* %x, i32 0, i32 1
  %c2 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %tmp = bitcast %struct.a* %d to i8*
  %tmp3 = bitcast %struct.a* %c2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp3, i64 16, i32 8, i1 false)
  %call = call i32 @bar(i32 0, %struct.b* %x, %struct.b* null)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
