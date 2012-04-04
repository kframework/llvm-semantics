; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr30185.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i64 }

define { i8, i64 } @foo(i8 %x.coerce0, i64 %x.coerce1, i8 %y.coerce0, i64 %y.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.S, align 8
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %z = alloca %struct.S, align 8
  %0 = bitcast %struct.S* %x to { i8, i64 }*
  %1 = getelementptr { i8, i64 }* %0, i32 0, i32 0
  store i8 %x.coerce0, i8* %1
  %2 = getelementptr { i8, i64 }* %0, i32 0, i32 1
  store i64 %x.coerce1, i64* %2
  %3 = bitcast %struct.S* %y to { i8, i64 }*
  %4 = getelementptr { i8, i64 }* %3, i32 0, i32 0
  store i8 %y.coerce0, i8* %4
  %5 = getelementptr { i8, i64 }* %3, i32 0, i32 1
  store i64 %y.coerce1, i64* %5
  %b = getelementptr inbounds %struct.S* %x, i32 0, i32 1
  %6 = load i64* %b, align 8
  %b1 = getelementptr inbounds %struct.S* %y, i32 0, i32 1
  %7 = load i64* %b1, align 8
  %div = sdiv i64 %6, %7
  %b2 = getelementptr inbounds %struct.S* %z, i32 0, i32 1
  store i64 %div, i64* %b2, align 8
  %8 = bitcast %struct.S* %retval to i8*
  %9 = bitcast %struct.S* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 16, i32 8, i1 false)
  %10 = bitcast %struct.S* %retval to { i8, i64 }*
  %11 = load { i8, i64 }* %10, align 1
  ret { i8, i64 } %11
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.S, align 8
  %b = alloca %struct.S, align 8
  %coerce = alloca %struct.S, align 8
  %coerce7 = alloca %struct.S, align 8
  store i32 0, i32* %retval
  %b1 = getelementptr inbounds %struct.S* %a, i32 0, i32 1
  store i64 32, i64* %b1, align 8
  %b2 = getelementptr inbounds %struct.S* %b, i32 0, i32 1
  store i64 4, i64* %b2, align 8
  %0 = bitcast %struct.S* %a to { i8, i64 }*
  %1 = getelementptr { i8, i64 }* %0, i32 0, i32 0
  %2 = load i8* %1, align 1
  %3 = getelementptr { i8, i64 }* %0, i32 0, i32 1
  %4 = load i64* %3, align 1
  %5 = bitcast %struct.S* %b to { i8, i64 }*
  %6 = getelementptr { i8, i64 }* %5, i32 0, i32 0
  %7 = load i8* %6, align 1
  %8 = getelementptr { i8, i64 }* %5, i32 0, i32 1
  %9 = load i64* %8, align 1
  %call = call { i8, i64 } @foo(i8 %2, i64 %4, i8 %7, i64 %9)
  %10 = bitcast %struct.S* %coerce to { i8, i64 }*
  %11 = getelementptr { i8, i64 }* %10, i32 0, i32 0
  %12 = extractvalue { i8, i64 } %call, 0
  store i8 %12, i8* %11, align 1
  %13 = getelementptr { i8, i64 }* %10, i32 0, i32 1
  %14 = extractvalue { i8, i64 } %call, 1
  store i64 %14, i64* %13, align 1
  %b3 = getelementptr inbounds %struct.S* %coerce, i32 0, i32 1
  %15 = load i64* %b3, align 8
  %cmp = icmp ne i64 %15, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %b4 = getelementptr inbounds %struct.S* %a, i32 0, i32 1
  store i64 -8, i64* %b4, align 8
  %b5 = getelementptr inbounds %struct.S* %b, i32 0, i32 1
  store i64 -2, i64* %b5, align 8
  %16 = bitcast %struct.S* %a to { i8, i64 }*
  %17 = getelementptr { i8, i64 }* %16, i32 0, i32 0
  %18 = load i8* %17, align 1
  %19 = getelementptr { i8, i64 }* %16, i32 0, i32 1
  %20 = load i64* %19, align 1
  %21 = bitcast %struct.S* %b to { i8, i64 }*
  %22 = getelementptr { i8, i64 }* %21, i32 0, i32 0
  %23 = load i8* %22, align 1
  %24 = getelementptr { i8, i64 }* %21, i32 0, i32 1
  %25 = load i64* %24, align 1
  %call6 = call { i8, i64 } @foo(i8 %18, i64 %20, i8 %23, i64 %25)
  %26 = bitcast %struct.S* %coerce7 to { i8, i64 }*
  %27 = getelementptr { i8, i64 }* %26, i32 0, i32 0
  %28 = extractvalue { i8, i64 } %call6, 0
  store i8 %28, i8* %27, align 1
  %29 = getelementptr { i8, i64 }* %26, i32 0, i32 1
  %30 = extractvalue { i8, i64 } %call6, 1
  store i64 %30, i64* %29, align 1
  %b8 = getelementptr inbounds %struct.S* %coerce7, i32 0, i32 1
  %31 = load i64* %b8, align 8
  %cmp9 = icmp ne i64 %31, 4
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
