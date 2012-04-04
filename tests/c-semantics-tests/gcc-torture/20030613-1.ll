; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030613-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.CS = type { i64, i64 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.CS, align 8
  store i32 0, i32* %retval
  %x1 = getelementptr inbounds %struct.CS* %x, i32 0, i32 0
  store i64 -7, i64* %x1, align 8
  %y = getelementptr inbounds %struct.CS* %x, i32 0, i32 1
  store i64 -7, i64* %y, align 8
  %0 = bitcast %struct.CS* %x to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  %4 = load i64* %3, align 1
  %call = call i32 @c5p(i64 %2, i64 %4)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal i32 @c5p(i64 %x.coerce0, i64 %x.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.CS, align 8
  %a = alloca %struct.CS, align 8
  %b = alloca %struct.CS, align 8
  %coerce = alloca %struct.CS, align 8
  %agg.tmp = alloca %struct.CS, align 8
  %coerce3 = alloca %struct.CS, align 8
  %0 = bitcast %struct.CS* %x to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %x.coerce1, i64* %2
  %3 = bitcast %struct.CS* %x to { i64, i64 }*
  %4 = getelementptr { i64, i64 }* %3, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr { i64, i64 }* %3, i32 0, i32 1
  %7 = load i64* %6, align 1
  %call = call { i64, i64 } @CPOW(i64 %5, i64 %7, i32 2)
  %8 = bitcast %struct.CS* %coerce to { i64, i64 }*
  %9 = getelementptr { i64, i64 }* %8, i32 0, i32 0
  %10 = extractvalue { i64, i64 } %call, 0
  store i64 %10, i64* %9, align 1
  %11 = getelementptr { i64, i64 }* %8, i32 0, i32 1
  %12 = extractvalue { i64, i64 } %call, 1
  store i64 %12, i64* %11, align 1
  %13 = bitcast %struct.CS* %a to i8*
  %14 = bitcast %struct.CS* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 16, i32 8, i1 false)
  %15 = bitcast %struct.CS* %a to { i64, i64 }*
  %16 = getelementptr { i64, i64 }* %15, i32 0, i32 0
  %17 = load i64* %16, align 1
  %18 = getelementptr { i64, i64 }* %15, i32 0, i32 1
  %19 = load i64* %18, align 1
  %call1 = call { i64, i64 } @CPOW(i64 %17, i64 %19, i32 2)
  %20 = bitcast %struct.CS* %agg.tmp to { i64, i64 }*
  %21 = getelementptr { i64, i64 }* %20, i32 0, i32 0
  %22 = extractvalue { i64, i64 } %call1, 0
  store i64 %22, i64* %21, align 1
  %23 = getelementptr { i64, i64 }* %20, i32 0, i32 1
  %24 = extractvalue { i64, i64 } %call1, 1
  store i64 %24, i64* %23, align 1
  %25 = bitcast %struct.CS* %agg.tmp to { i64, i64 }*
  %26 = getelementptr { i64, i64 }* %25, i32 0, i32 0
  %27 = load i64* %26, align 1
  %28 = getelementptr { i64, i64 }* %25, i32 0, i32 1
  %29 = load i64* %28, align 1
  %call2 = call { i64, i64 } @CCID(i64 %27, i64 %29)
  %30 = bitcast %struct.CS* %coerce3 to { i64, i64 }*
  %31 = getelementptr { i64, i64 }* %30, i32 0, i32 0
  %32 = extractvalue { i64, i64 } %call2, 0
  store i64 %32, i64* %31, align 1
  %33 = getelementptr { i64, i64 }* %30, i32 0, i32 1
  %34 = extractvalue { i64, i64 } %call2, 1
  store i64 %34, i64* %33, align 1
  %35 = bitcast %struct.CS* %b to i8*
  %36 = bitcast %struct.CS* %coerce3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* %36, i64 16, i32 8, i1 false)
  %x4 = getelementptr inbounds %struct.CS* %b, i32 0, i32 0
  %37 = load i64* %x4, align 8
  %y = getelementptr inbounds %struct.CS* %b, i32 0, i32 1
  %38 = load i64* %y, align 8
  %cmp = icmp eq i64 %37, %38
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @abort() noreturn nounwind

define internal { i64, i64 } @CPOW(i64 %x.coerce0, i64 %x.coerce1, i32 %y) nounwind uwtable {
entry:
  %retval = alloca %struct.CS, align 8
  %x = alloca %struct.CS, align 8
  %y.addr = alloca i32, align 4
  %a = alloca %struct.CS, align 8
  %coerce = alloca %struct.CS, align 8
  %0 = bitcast %struct.CS* %x to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %x.coerce1, i64* %2
  store i32 %y, i32* %y.addr, align 4
  %3 = bitcast %struct.CS* %a to i8*
  %4 = bitcast %struct.CS* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 16, i32 8, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %5 = load i32* %y.addr, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %y.addr, align 4
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = bitcast %struct.CS* %a to { i64, i64 }*
  %7 = getelementptr { i64, i64 }* %6, i32 0, i32 0
  %8 = load i64* %7, align 1
  %9 = getelementptr { i64, i64 }* %6, i32 0, i32 1
  %10 = load i64* %9, align 1
  %call = call { i64, i64 } @CCID(i64 %8, i64 %10)
  %11 = bitcast %struct.CS* %coerce to { i64, i64 }*
  %12 = getelementptr { i64, i64 }* %11, i32 0, i32 0
  %13 = extractvalue { i64, i64 } %call, 0
  store i64 %13, i64* %12, align 1
  %14 = getelementptr { i64, i64 }* %11, i32 0, i32 1
  %15 = extractvalue { i64, i64 } %call, 1
  store i64 %15, i64* %14, align 1
  %16 = bitcast %struct.CS* %a to i8*
  %17 = bitcast %struct.CS* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 16, i32 8, i1 false)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = bitcast %struct.CS* %retval to i8*
  %19 = bitcast %struct.CS* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 16, i32 8, i1 false)
  %20 = bitcast %struct.CS* %retval to { i64, i64 }*
  %21 = load { i64, i64 }* %20, align 1
  ret { i64, i64 } %21
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal { i64, i64 } @CCID(i64 %x.coerce0, i64 %x.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.CS, align 8
  %x = alloca %struct.CS, align 8
  %a = alloca %struct.CS, align 8
  %0 = bitcast %struct.CS* %x to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %x.coerce1, i64* %2
  %x1 = getelementptr inbounds %struct.CS* %x, i32 0, i32 0
  %3 = load i64* %x1, align 8
  %x2 = getelementptr inbounds %struct.CS* %a, i32 0, i32 0
  store i64 %3, i64* %x2, align 8
  %y = getelementptr inbounds %struct.CS* %x, i32 0, i32 1
  %4 = load i64* %y, align 8
  %y3 = getelementptr inbounds %struct.CS* %a, i32 0, i32 1
  store i64 %4, i64* %y3, align 8
  %5 = bitcast %struct.CS* %retval to i8*
  %6 = bitcast %struct.CS* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 16, i32 8, i1 false)
  %7 = bitcast %struct.CS* %retval to { i64, i64 }*
  %8 = load { i64, i64 }* %7, align 1
  ret { i64, i64 } %8
}
