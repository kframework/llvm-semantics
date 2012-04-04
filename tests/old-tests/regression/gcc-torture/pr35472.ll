; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr35472.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [16 x i32] }

@p = common global %struct.S* null, align 8

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

define void @foo(%struct.S* %a, %struct.S* %b) nounwind uwtable noinline {
entry:
  %a.addr = alloca %struct.S*, align 8
  %b.addr = alloca %struct.S*, align 8
  store %struct.S* %a, %struct.S** %a.addr, align 8
  store %struct.S* %b, %struct.S** %b.addr, align 8
  %tmp = load %struct.S** %a.addr, align 8
  %i = getelementptr inbounds %struct.S* %tmp, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i32]* %i, i32 0, i64 0
  store i32 -1, i32* %arrayidx, align 4
  %tmp1 = load %struct.S** %b.addr, align 8
  store %struct.S* %tmp1, %struct.S** @p, align 8
  ret void
}

define void @test() nounwind uwtable {
entry:
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %i = getelementptr inbounds %struct.S* %a, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i32]* %i, i32 0, i64 0
  %0 = bitcast i32* %arrayidx to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 64, i32 1, i1 false)
  %i1 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [16 x i32]* %i1, i32 0, i64 0
  %1 = bitcast i32* %arrayidx2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 1, i1 false)
  call void @foo(%struct.S* %a, %struct.S* %b)
  %tmp = load %struct.S** @p, align 8
  %tmp3 = bitcast %struct.S* %tmp to i8*
  %tmp4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %tmp4, i64 64, i32 4, i1 false)
  %tmp5 = load %struct.S** @p, align 8
  %tmp6 = bitcast %struct.S* %tmp5 to i8*
  %tmp7 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp7, i64 64, i32 4, i1 false)
  %i8 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %arrayidx9 = getelementptr inbounds [16 x i32]* %i8, i32 0, i64 0
  %tmp10 = load i32* %arrayidx9, align 4
  %cmp = icmp ne i32 %tmp10, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test()
  ret i32 0
}
