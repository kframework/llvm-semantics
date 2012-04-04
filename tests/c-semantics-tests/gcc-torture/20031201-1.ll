; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.io = type { %struct.s1, %struct.s2 }
%struct.s1 = type { [2 x i8], [2 x i8] }
%struct.s2 = type { [2 x i8], [2 x i8] }

@i = internal global %struct.io* null, align 8
@test_t1 = internal global i64 0, align 8
@m = internal global i32 1, align 4
@test_length = internal global i32 2, align 4
@test_t0 = internal global i64 0, align 8
@d = internal global i32 1, align 4
@f0.washere = internal global i32 0, align 4

define i32 @f1(i8* %port) nounwind uwtable noinline {
entry:
  %port.addr = alloca i8*, align 8
  %fail_count = alloca i32, align 4
  %tlen = alloca i64, align 8
  %x0 = alloca %struct.s1, align 4
  %x1 = alloca %struct.s2, align 4
  %e = alloca i64, align 8
  %e10 = alloca i64, align 8
  store i8* %port, i8** %port.addr, align 8
  store i32 0, i32* %fail_count, align 4
  %0 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 4, i32 4, i1 false)
  %1 = bitcast %struct.s2* %x1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 4, i32 4, i1 false)
  %2 = load i8** %port.addr, align 8
  %3 = bitcast i8* %2 to %struct.io*
  store %struct.io* %3, %struct.io** @i, align 8
  %4 = bitcast %struct.s2* %x1 to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -65536
  %7 = or i32 %6, 32
  store i32 %7, i32* %4, align 4
  %8 = bitcast %struct.s1* %x0 to i32*
  %9 = load i32* %8, align 4
  %10 = and i32 %9, -65536
  %11 = or i32 %10, 32
  store i32 %11, i32* %8, align 4
  %12 = load %struct.io** @i, align 8
  %i12 = getelementptr inbounds %struct.io* %12, i32 0, i32 0
  %13 = bitcast %struct.s1* %i12 to i8*
  %14 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 4, i32 4, i1 false)
  %15 = load %struct.io** @i, align 8
  %i16 = getelementptr inbounds %struct.io* %15, i32 0, i32 1
  %16 = bitcast %struct.s2* %i16 to i8*
  %17 = bitcast %struct.s2* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 4, i32 4, i1 false)
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  call void @f0()
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %18 = load i64* @test_t1, align 8
  %tobool = icmp ne i64 %18, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %19 = bitcast %struct.s2* %x1 to i32*
  %20 = load i32* %19, align 4
  %21 = and i32 %20, -65536
  %22 = or i32 %21, 8
  store i32 %22, i32* %19, align 4
  %23 = bitcast %struct.s1* %x0 to i32*
  %24 = load i32* %23, align 4
  %25 = and i32 %24, -65536
  %26 = or i32 %25, 8
  store i32 %26, i32* %23, align 4
  %27 = load %struct.io** @i, align 8
  %i121 = getelementptr inbounds %struct.io* %27, i32 0, i32 0
  %28 = bitcast %struct.s1* %i121 to i8*
  %29 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 4, i32 4, i1 false)
  %30 = load %struct.io** @i, align 8
  %i162 = getelementptr inbounds %struct.io* %30, i32 0, i32 1
  %31 = bitcast %struct.s2* %i162 to i8*
  %32 = bitcast %struct.s2* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 4, i32 4, i1 false)
  call void @test()
  %33 = load i32* @m, align 4
  %tobool3 = icmp ne i32 %33, 0
  br i1 %tobool3, label %if.then, label %if.end7

if.then:                                          ; preds = %do.end
  %34 = load i32* @test_length, align 4
  %mul = mul nsw i32 2170, %34
  %conv = sext i32 %mul to i64
  store i64 %conv, i64* %e, align 8
  %35 = load i64* @test_t1, align 8
  %36 = load i64* @test_t0, align 8
  %sub = sub i64 %35, %36
  store i64 %sub, i64* %tlen, align 8
  %37 = load i64* %tlen, align 8
  %38 = load i64* %e, align 8
  %sub4 = sub i64 %37, %38
  %and = and i64 %sub4, 2147483647
  %cmp = icmp ugt i64 %and, 1000
  br i1 %cmp, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  call void @f0()
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %do.end
  %39 = load i32* @d, align 4
  %tobool8 = icmp ne i32 %39, 0
  br i1 %tobool8, label %if.then9, label %if.end20

if.then9:                                         ; preds = %if.end7
  %40 = load i32* @test_length, align 4
  %mul11 = mul nsw i32 2170, %40
  %conv12 = sext i32 %mul11 to i64
  store i64 %conv12, i64* %e10, align 8
  %41 = load i64* @test_t1, align 8
  %42 = load i64* @test_t0, align 8
  %sub13 = sub i64 %41, %42
  store i64 %sub13, i64* %tlen, align 8
  %43 = load i64* %tlen, align 8
  %44 = load i64* %e10, align 8
  %sub14 = sub i64 %43, %44
  %and15 = and i64 %sub14, 2147483647
  %cmp16 = icmp ugt i64 %and15, 1000
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.then9
  call void @f0()
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.then9
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.end7
  %45 = load i32* %fail_count, align 4
  %cmp21 = icmp ne i32 %45, 0
  %cond = select i1 %cmp21, i32 1, i32 0
  ret i32 %cond
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @f0() nounwind uwtable noinline {
entry:
  %iop = alloca %struct.io*, align 8
  %0 = load %struct.io** @i, align 8
  store %struct.io* %0, %struct.io** %iop, align 8
  %1 = load i32* @f0.washere, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @f0.washere, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.io** %iop, align 8
  %i12 = getelementptr inbounds %struct.io* %2, i32 0, i32 0
  %3 = bitcast %struct.s1* %i12 to i32*
  %4 = load i32* %3, align 4
  %bf.clear = and i32 %4, 65535
  %cmp = icmp ne i32 %bf.clear, 32
  br i1 %cmp, label %if.then, label %lor.lhs.false1

lor.lhs.false1:                                   ; preds = %lor.lhs.false
  %5 = load %struct.io** %iop, align 8
  %i16 = getelementptr inbounds %struct.io* %5, i32 0, i32 1
  %6 = bitcast %struct.s2* %i16 to i32*
  %7 = load i32* %6, align 4
  %bf.clear2 = and i32 %7, 65535
  %cmp3 = icmp ne i32 %bf.clear2, 32
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false1, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false1
  ret void
}

define void @test() nounwind uwtable noinline {
entry:
  %iop = alloca %struct.io*, align 8
  %0 = load %struct.io** @i, align 8
  store %struct.io* %0, %struct.io** %iop, align 8
  %1 = load %struct.io** %iop, align 8
  %i12 = getelementptr inbounds %struct.io* %1, i32 0, i32 0
  %2 = bitcast %struct.s1* %i12 to i32*
  %3 = load i32* %2, align 4
  %bf.clear = and i32 %3, 65535
  %cmp = icmp ne i32 %bf.clear, 8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load %struct.io** %iop, align 8
  %i16 = getelementptr inbounds %struct.io* %4, i32 0, i32 1
  %5 = bitcast %struct.s2* %i16 to i32*
  %6 = load i32* %5, align 4
  %bf.clear1 = and i32 %6, 65535
  %cmp2 = icmp ne i32 %bf.clear1, 8
  br i1 %cmp2, label %if.then, label %if.end

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
