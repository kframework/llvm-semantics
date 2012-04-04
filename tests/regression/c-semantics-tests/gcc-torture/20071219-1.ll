; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [25 x i8] }

@p = common global %struct.S* null, align 8

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
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %cmp = icmp ult i64 %conv, 25
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.S** %x.addr, align 8
  %s = getelementptr inbounds %struct.S* %2, i32 0, i32 0
  %arrayidx = getelementptr inbounds [25 x i8]* %s, i32 0, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp ne i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %for.body
  %4 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.else
  %5 = load i32* %set.addr, align 4
  %conv6 = trunc i32 %5 to i8
  %6 = load i32* %i, align 4
  %idxprom7 = sext i32 %6 to i64
  %7 = load %struct.S** %x.addr, align 8
  %s8 = getelementptr inbounds %struct.S* %7, i32 0, i32 0
  %arrayidx9 = getelementptr inbounds [25 x i8]* %s8, i32 0, i64 %idxprom7
  store i8 %conv6, i8* %arrayidx9, align 1
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct.S** %x.addr, align 8
  store %struct.S* %9, %struct.S** @p, align 8
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
  %1 = bitcast %struct.S* %b to i8*
  %2 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %3 = bitcast %struct.S* %b to i8*
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 25, i32 1, i1 false)
  %5 = bitcast %struct.S* %b to i8*
  %6 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 25, i32 1, i1 false)
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
  %1 = bitcast %struct.S* %b to i8*
  %2 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %3 = bitcast %struct.S* %b to i8*
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 25, i32 1, i1 false)
  %5 = load %struct.S** @p, align 8
  %6 = bitcast %struct.S* %b to i8*
  %7 = bitcast %struct.S* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 25, i32 1, i1 false)
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
  %1 = bitcast %struct.S* %b to i8*
  %2 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %3 = load %struct.S** @p, align 8
  %4 = bitcast %struct.S* %3 to i8*
  %5 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 25, i32 1, i1 false)
  %6 = load %struct.S** @p, align 8
  %7 = bitcast %struct.S* %6 to i8*
  %8 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 25, i32 1, i1 false)
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
