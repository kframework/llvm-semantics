; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [4 x i32] }

@main.s = private unnamed_addr constant %struct.s { [4 x i32] [i32 1, i32 2, i32 3, i32 4] }, align 4

define i32 @foo(i64 %s.coerce0, i64 %s.coerce1, i32 %x1, i32 %x2, i32 %x3, i32 %x4, i32 %x5, i32 %x6, i32 %x7) nounwind uwtable {
entry:
  %s = alloca %struct.s, align 8
  %x1.addr = alloca i32, align 4
  %x2.addr = alloca i32, align 4
  %x3.addr = alloca i32, align 4
  %x4.addr = alloca i32, align 4
  %x5.addr = alloca i32, align 4
  %x6.addr = alloca i32, align 4
  %x7.addr = alloca i32, align 4
  %0 = bitcast %struct.s* %s to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %s.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %s.coerce1, i64* %2
  store i32 %x1, i32* %x1.addr, align 4
  store i32 %x2, i32* %x2.addr, align 4
  store i32 %x3, i32* %x3.addr, align 4
  store i32 %x4, i32* %x4.addr, align 4
  store i32 %x5, i32* %x5.addr, align 4
  store i32 %x6, i32* %x6.addr, align 4
  store i32 %x7, i32* %x7.addr, align 4
  %f = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %f, i32 0, i64 3
  %3 = load i32* %arrayidx, align 4
  %4 = load i32* %x7.addr, align 4
  %add = add nsw i32 %3, %4
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.s, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.s* @main.s to i8*), i64 16, i32 4, i1 false)
  %1 = bitcast %struct.s* %s to { i64, i64 }*
  %2 = getelementptr { i64, i64 }* %1, i32 0, i32 0
  %3 = load i64* %2, align 1
  %4 = getelementptr { i64, i64 }* %1, i32 0, i32 1
  %5 = load i64* %4, align 1
  %call = call i32 @foo(i64 %3, i64 %5, i32 100, i32 200, i32 300, i32 400, i32 500, i32 600, i32 700)
  %cmp = icmp ne i32 %call, 704
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
