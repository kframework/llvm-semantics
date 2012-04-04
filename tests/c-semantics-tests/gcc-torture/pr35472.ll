; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr35472.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [16 x i32] }

@p = common global %struct.S* null, align 8

define void @foo(%struct.S* %a, %struct.S* %b) nounwind uwtable noinline {
entry:
  %a.addr = alloca %struct.S*, align 8
  %b.addr = alloca %struct.S*, align 8
  store %struct.S* %a, %struct.S** %a.addr, align 8
  store %struct.S* %b, %struct.S** %b.addr, align 8
  %0 = load %struct.S** %a.addr, align 8
  %i = getelementptr inbounds %struct.S* %0, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i32]* %i, i32 0, i64 0
  store i32 -1, i32* %arrayidx, align 4
  %1 = load %struct.S** %b.addr, align 8
  store %struct.S* %1, %struct.S** @p, align 8
  ret void
}

define void @test() nounwind uwtable {
entry:
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %i = getelementptr inbounds %struct.S* %a, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i32]* %i, i32 0, i64 0
  %0 = bitcast i32* %arrayidx to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 64, i32 4, i1 false)
  %i1 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [16 x i32]* %i1, i32 0, i64 0
  %1 = bitcast i32* %arrayidx2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 4, i1 false)
  call void @foo(%struct.S* %a, %struct.S* %b)
  %2 = load %struct.S** @p, align 8
  %3 = bitcast %struct.S* %2 to i8*
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 64, i32 4, i1 false)
  %5 = load %struct.S** @p, align 8
  %6 = bitcast %struct.S* %5 to i8*
  %7 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 64, i32 4, i1 false)
  %i3 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds [16 x i32]* %i3, i32 0, i64 0
  %8 = load i32* %arrayidx4, align 4
  %cmp = icmp ne i32 %8, -1
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
