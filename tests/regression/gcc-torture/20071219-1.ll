; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [25 x i8] }

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

define void @foo(%struct.S* %x, i32 %set) nounwind uwtable noinline {
entry:
  %x.addr = alloca %struct.S*, align 8
  %set.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.S* %x, %struct.S** %x.addr, align 8
  store i32 %set, i32* %set.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %cmp = icmp ult i64 %conv, 25
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %tmp3 = load %struct.S** %x.addr, align 8
  %s = getelementptr inbounds %struct.S* %tmp3, i32 0, i32 0
  %arrayidx = getelementptr inbounds [25 x i8]* %s, i32 0, i64 %idxprom
  %tmp4 = load i8* %arrayidx, align 1
  %conv5 = sext i8 %tmp4 to i32
  %cmp6 = icmp ne i32 %conv5, 0
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %for.body
  %tmp8 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp8, 0
  br i1 %tobool, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.else
  %tmp10 = load i32* %set.addr, align 4
  %conv11 = trunc i32 %tmp10 to i8
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %tmp14 = load %struct.S** %x.addr, align 8
  %s15 = getelementptr inbounds %struct.S* %tmp14, i32 0, i32 0
  %arrayidx16 = getelementptr inbounds [25 x i8]* %s15, i32 0, i64 %idxprom13
  store i8 %conv11, i8* %arrayidx16, align 1
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %tmp18 = load i32* %i, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp19 = load %struct.S** %x.addr, align 8
  store %struct.S* %tmp19, %struct.S** @p, align 8
  ret void
}

declare void @abort() noreturn nounwind

define void @test1() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %s = getelementptr inbounds %struct.S* %a, i32 0, i32 0
  %0 = bitcast [25 x i8]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %tmp = bitcast %struct.S* %b to i8*
  %tmp1 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %tmp2 = bitcast %struct.S* %b to i8*
  %tmp3 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* %tmp3, i64 25, i32 1, i1 false)
  %tmp4 = bitcast %struct.S* %b to i8*
  %tmp5 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @test2() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %s = getelementptr inbounds %struct.S* %a, i32 0, i32 0
  %0 = bitcast [25 x i8]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %tmp = bitcast %struct.S* %b to i8*
  %tmp1 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %tmp2 = bitcast %struct.S* %b to i8*
  %tmp3 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* %tmp3, i64 25, i32 1, i1 false)
  %tmp4 = load %struct.S** @p, align 8
  %tmp5 = bitcast %struct.S* %b to i8*
  %tmp6 = bitcast %struct.S* %tmp4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

define void @test3() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %s = getelementptr inbounds %struct.S* %a, i32 0, i32 0
  %0 = bitcast [25 x i8]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %tmp = bitcast %struct.S* %b to i8*
  %tmp1 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %tmp2 = load %struct.S** @p, align 8
  %tmp3 = bitcast %struct.S* %tmp2 to i8*
  %tmp4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %tmp4, i64 25, i32 1, i1 false)
  %tmp5 = load %struct.S** @p, align 8
  %tmp6 = bitcast %struct.S* %tmp5 to i8*
  %tmp7 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp7, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1()
  call void @test2()
  call void @test3()
  ret i32 0
}
