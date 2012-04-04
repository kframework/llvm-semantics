; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.io = type { %struct.s1, %struct.s1 }
%struct.s1 = type { [2 x i8], [2 x i8] }
%struct.s2 = type { [2 x i8], [2 x i8] }

@i = internal global %struct.io* null, align 8
@test_t1 = internal global i64 0, align 8
@m = internal global i32 1, align 4
@test_length = internal global i32 2, align 4
@test_t0 = internal global i64 0, align 8
@d = internal global i32 1, align 4
@f0.washere = internal global i32 0, align 4

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

define i32 @f1(i8* %port) nounwind uwtable noinline {
entry:
  %port.addr = alloca i8*, align 8
  %fail_count = alloca i32, align 4
  %tlen = alloca i64, align 8
  %x0 = alloca %struct.s1, align 4
  %x1 = alloca %struct.s1, align 4
  %e = alloca i64, align 8
  %e35 = alloca i64, align 8
  store i8* %port, i8** %port.addr, align 8
  store i32 0, i32* %fail_count, align 4
  %tmp = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 4, i32 4, i1 false)
  %tmp2 = bitcast %struct.s1* %x1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 4, i32 4, i1 false)
  %tmp3 = load i8** %port.addr, align 8
  %0 = bitcast i8* %tmp3 to %struct.io*
  store %struct.io* %0, %struct.io** @i, align 8
  %1 = bitcast %struct.s1* %x1 to i32*
  %2 = load i32* %1, align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, 32
  store i32 %4, i32* %1, align 4
  %5 = bitcast %struct.s1* %x0 to i32*
  %6 = load i32* %5, align 4
  %7 = and i32 %6, -65536
  %8 = or i32 %7, 32
  store i32 %8, i32* %5, align 4
  %tmp4 = load %struct.io** @i, align 8
  %i12 = getelementptr inbounds %struct.io* %tmp4, i32 0, i32 0
  %tmp5 = bitcast %struct.s1* %i12 to i8*
  %tmp6 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 4, i32 4, i1 false)
  %tmp7 = load %struct.io** @i, align 8
  %i16 = getelementptr inbounds %struct.io* %tmp7, i32 0, i32 1
  %tmp8 = bitcast %struct.s1* %i16 to i8*
  %tmp9 = bitcast %struct.s1* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* %tmp9, i64 4, i32 4, i1 false)
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  call void @f0()
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp10 = load i64* @test_t1, align 8
  %tobool = icmp ne i64 %tmp10, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %9 = bitcast %struct.s1* %x1 to i32*
  %10 = load i32* %9, align 4
  %11 = and i32 %10, -65536
  %12 = or i32 %11, 8
  store i32 %12, i32* %9, align 4
  %13 = bitcast %struct.s1* %x0 to i32*
  %14 = load i32* %13, align 4
  %15 = and i32 %14, -65536
  %16 = or i32 %15, 8
  store i32 %16, i32* %13, align 4
  %tmp11 = load %struct.io** @i, align 8
  %i1212 = getelementptr inbounds %struct.io* %tmp11, i32 0, i32 0
  %tmp13 = bitcast %struct.s1* %i1212 to i8*
  %tmp14 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp13, i8* %tmp14, i64 4, i32 4, i1 false)
  %tmp15 = load %struct.io** @i, align 8
  %i1616 = getelementptr inbounds %struct.io* %tmp15, i32 0, i32 1
  %tmp17 = bitcast %struct.s1* %i1616 to i8*
  %tmp18 = bitcast %struct.s1* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp17, i8* %tmp18, i64 4, i32 4, i1 false)
  call void @test()
  %tmp19 = load i32* @m, align 4
  %tobool20 = icmp ne i32 %tmp19, 0
  br i1 %tobool20, label %if.then, label %if.end30

if.then:                                          ; preds = %do.end
  %tmp22 = load i32* @test_length, align 4
  %mul = mul nsw i32 2170, %tmp22
  %conv = sext i32 %mul to i64
  store i64 %conv, i64* %e, align 8
  %tmp23 = load i64* @test_t1, align 8
  %tmp24 = load i64* @test_t0, align 8
  %sub = sub i64 %tmp23, %tmp24
  store i64 %sub, i64* %tlen, align 8
  %tmp25 = load i64* %tlen, align 8
  %tmp26 = load i64* %e, align 8
  %sub27 = sub i64 %tmp25, %tmp26
  %and = and i64 %sub27, 2147483647
  %cmp = icmp ugt i64 %and, 1000
  br i1 %cmp, label %if.then29, label %if.end

if.then29:                                        ; preds = %if.then
  call void @f0()
  br label %if.end

if.end:                                           ; preds = %if.then29, %if.then
  br label %if.end30

if.end30:                                         ; preds = %if.end, %do.end
  %tmp31 = load i32* @d, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.then33, label %if.end50

if.then33:                                        ; preds = %if.end30
  %tmp36 = load i32* @test_length, align 4
  %mul37 = mul nsw i32 2170, %tmp36
  %conv38 = sext i32 %mul37 to i64
  store i64 %conv38, i64* %e35, align 8
  %tmp39 = load i64* @test_t1, align 8
  %tmp40 = load i64* @test_t0, align 8
  %sub41 = sub i64 %tmp39, %tmp40
  store i64 %sub41, i64* %tlen, align 8
  %tmp42 = load i64* %tlen, align 8
  %tmp43 = load i64* %e35, align 8
  %sub44 = sub i64 %tmp42, %tmp43
  %and45 = and i64 %sub44, 2147483647
  %cmp46 = icmp ugt i64 %and45, 1000
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.then33
  call void @f0()
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %if.then33
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.end30
  %tmp51 = load i32* %fail_count, align 4
  %cmp52 = icmp ne i32 %tmp51, 0
  %cond = select i1 %cmp52, i32 1, i32 0
  ret i32 %cond
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @f0() nounwind uwtable noinline {
entry:
  %iop = alloca %struct.io*, align 8
  %tmp = load %struct.io** @i, align 8
  store %struct.io* %tmp, %struct.io** %iop, align 8
  %tmp1 = load i32* @f0.washere, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* @f0.washere, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load %struct.io** %iop, align 8
  %i12 = getelementptr inbounds %struct.io* %tmp2, i32 0, i32 0
  %0 = bitcast %struct.s1* %i12 to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 65535
  %cmp = icmp ne i32 %bf.clear, 32
  br i1 %cmp, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load %struct.io** %iop, align 8
  %i16 = getelementptr inbounds %struct.io* %tmp4, i32 0, i32 1
  %2 = bitcast %struct.s1* %i16 to i32*
  %3 = load i32* %2, align 4
  %bf.clear5 = and i32 %3, 65535
  %cmp6 = icmp ne i32 %bf.clear5, 32
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  ret void
}

define void @test() nounwind uwtable noinline {
entry:
  %iop = alloca %struct.io*, align 8
  %tmp = load %struct.io** @i, align 8
  store %struct.io* %tmp, %struct.io** %iop, align 8
  %tmp1 = load %struct.io** %iop, align 8
  %i12 = getelementptr inbounds %struct.io* %tmp1, i32 0, i32 0
  %0 = bitcast %struct.s1* %i12 to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 65535
  %cmp = icmp ne i32 %bf.clear, 8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load %struct.io** %iop, align 8
  %i16 = getelementptr inbounds %struct.io* %tmp2, i32 0, i32 1
  %2 = bitcast %struct.s1* %i16 to i32*
  %3 = load i32* %2, align 4
  %bf.clear3 = and i32 %3, 65535
  %cmp4 = icmp ne i32 %bf.clear3, 8
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %io0 = alloca %struct.io, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.io* %io0 to i8*
  %call = call i32 @f1(i8* %0)
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
