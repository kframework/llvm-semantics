; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050713-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, i32 }

@main.a = private unnamed_addr constant %struct.S { i32 3, i32 4, i32 5 }, align 4
@main.b = private unnamed_addr constant %struct.S { i32 6, i32 7, i32 8 }, align 4
@main.c = private unnamed_addr constant %struct.S { i32 9, i32 10, i32 11 }, align 4

define i32 @foo2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %coerce = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %coerce1 = alloca { i64, i32 }, align 8
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %x.coerce1, i32* %1
  %2 = bitcast %struct.S* %x to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  %4 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %y to i8*
  %7 = bitcast { i64, i32 }* %coerce1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  %a = getelementptr inbounds %struct.S* %x, i32 0, i32 0
  %8 = load i32* %a, align 4
  %cmp = icmp ne i32 %8, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %x, i32 0, i32 1
  %9 = load i32* %b, align 4
  %cmp2 = icmp ne i32 %9, 4
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.S* %x, i32 0, i32 2
  %10 = load i32* %c, align 4
  %cmp4 = icmp ne i32 %10, 5
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  %a5 = getelementptr inbounds %struct.S* %y, i32 0, i32 0
  %11 = load i32* %a5, align 4
  %cmp6 = icmp ne i32 %11, 6
  br i1 %cmp6, label %if.then13, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %if.end
  %b8 = getelementptr inbounds %struct.S* %y, i32 0, i32 1
  %12 = load i32* %b8, align 4
  %cmp9 = icmp ne i32 %12, 7
  br i1 %cmp9, label %if.then13, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false7
  %c11 = getelementptr inbounds %struct.S* %y, i32 0, i32 2
  %13 = load i32* %c11, align 4
  %cmp12 = icmp ne i32 %13, 8
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false10, %lor.lhs.false7, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %lor.lhs.false10
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define i32 @foo3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %coerce = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %coerce1 = alloca { i64, i32 }, align 8
  %z = alloca %struct.S, align 8
  %coerce2 = alloca { i64, i32 }, align 8
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %x.coerce1, i32* %1
  %2 = bitcast %struct.S* %x to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  %4 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %y to i8*
  %7 = bitcast { i64, i32 }* %coerce1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  %8 = getelementptr { i64, i32 }* %coerce2, i32 0, i32 0
  store i64 %z.coerce0, i64* %8
  %9 = getelementptr { i64, i32 }* %coerce2, i32 0, i32 1
  store i32 %z.coerce1, i32* %9
  %10 = bitcast %struct.S* %z to i8*
  %11 = bitcast { i64, i32 }* %coerce2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 8, i1 false)
  %12 = bitcast %struct.S* %x to { i64, i32 }*
  %13 = getelementptr { i64, i32 }* %12, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr { i64, i32 }* %12, i32 0, i32 1
  %16 = load i32* %15, align 1
  %17 = bitcast %struct.S* %y to { i64, i32 }*
  %18 = getelementptr { i64, i32 }* %17, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr { i64, i32 }* %17, i32 0, i32 1
  %21 = load i32* %20, align 1
  %call = call i32 @foo2(i64 %14, i32 %16, i64 %19, i32 %21)
  %a = getelementptr inbounds %struct.S* %z, i32 0, i32 0
  %22 = load i32* %a, align 4
  %cmp = icmp ne i32 %22, 9
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %z, i32 0, i32 1
  %23 = load i32* %b, align 4
  %cmp3 = icmp ne i32 %23, 10
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.S* %z, i32 0, i32 2
  %24 = load i32* %c, align 4
  %cmp5 = icmp ne i32 %24, 11
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  ret i32 0
}

define i32 @bar2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %coerce = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %coerce1 = alloca { i64, i32 }, align 8
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %x.coerce1, i32* %1
  %2 = bitcast %struct.S* %x to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  %4 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %y to i8*
  %7 = bitcast { i64, i32 }* %coerce1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  %8 = bitcast %struct.S* %y to { i64, i32 }*
  %9 = getelementptr { i64, i32 }* %8, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr { i64, i32 }* %8, i32 0, i32 1
  %12 = load i32* %11, align 1
  %13 = bitcast %struct.S* %x to { i64, i32 }*
  %14 = getelementptr { i64, i32 }* %13, i32 0, i32 0
  %15 = load i64* %14, align 1
  %16 = getelementptr { i64, i32 }* %13, i32 0, i32 1
  %17 = load i32* %16, align 1
  %call = call i32 @foo2(i64 %10, i32 %12, i64 %15, i32 %17)
  ret i32 %call
}

define i32 @bar3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %coerce = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %coerce1 = alloca { i64, i32 }, align 8
  %z = alloca %struct.S, align 8
  %coerce2 = alloca { i64, i32 }, align 8
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %x.coerce1, i32* %1
  %2 = bitcast %struct.S* %x to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  %4 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %y to i8*
  %7 = bitcast { i64, i32 }* %coerce1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  %8 = getelementptr { i64, i32 }* %coerce2, i32 0, i32 0
  store i64 %z.coerce0, i64* %8
  %9 = getelementptr { i64, i32 }* %coerce2, i32 0, i32 1
  store i32 %z.coerce1, i32* %9
  %10 = bitcast %struct.S* %z to i8*
  %11 = bitcast { i64, i32 }* %coerce2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 8, i1 false)
  %12 = bitcast %struct.S* %y to { i64, i32 }*
  %13 = getelementptr { i64, i32 }* %12, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr { i64, i32 }* %12, i32 0, i32 1
  %16 = load i32* %15, align 1
  %17 = bitcast %struct.S* %x to { i64, i32 }*
  %18 = getelementptr { i64, i32 }* %17, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr { i64, i32 }* %17, i32 0, i32 1
  %21 = load i32* %20, align 1
  %22 = bitcast %struct.S* %z to { i64, i32 }*
  %23 = getelementptr { i64, i32 }* %22, i32 0, i32 0
  %24 = load i64* %23, align 1
  %25 = getelementptr { i64, i32 }* %22, i32 0, i32 1
  %26 = load i32* %25, align 1
  %call = call i32 @foo3(i64 %14, i32 %16, i64 %19, i32 %21, i64 %24, i32 %26)
  ret i32 %call
}

define i32 @baz3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %coerce = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %coerce1 = alloca { i64, i32 }, align 8
  %z = alloca %struct.S, align 8
  %coerce2 = alloca { i64, i32 }, align 8
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %x.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %x.coerce1, i32* %1
  %2 = bitcast %struct.S* %x to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  %4 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }* %coerce1, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %y to i8*
  %7 = bitcast { i64, i32 }* %coerce1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  %8 = getelementptr { i64, i32 }* %coerce2, i32 0, i32 0
  store i64 %z.coerce0, i64* %8
  %9 = getelementptr { i64, i32 }* %coerce2, i32 0, i32 1
  store i32 %z.coerce1, i32* %9
  %10 = bitcast %struct.S* %z to i8*
  %11 = bitcast { i64, i32 }* %coerce2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 8, i1 false)
  %12 = bitcast %struct.S* %y to { i64, i32 }*
  %13 = getelementptr { i64, i32 }* %12, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr { i64, i32 }* %12, i32 0, i32 1
  %16 = load i32* %15, align 1
  %17 = bitcast %struct.S* %z to { i64, i32 }*
  %18 = getelementptr { i64, i32 }* %17, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr { i64, i32 }* %17, i32 0, i32 1
  %21 = load i32* %20, align 1
  %22 = bitcast %struct.S* %x to { i64, i32 }*
  %23 = getelementptr { i64, i32 }* %22, i32 0, i32 0
  %24 = load i64* %23, align 1
  %25 = getelementptr { i64, i32 }* %22, i32 0, i32 1
  %26 = load i32* %25, align 1
  %call = call i32 @foo3(i64 %14, i32 %16, i64 %19, i32 %21, i64 %24, i32 %26)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %c = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @main.a to i8*), i64 12, i32 4, i1 false)
  %1 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.S* @main.b to i8*), i64 12, i32 4, i1 false)
  %2 = bitcast %struct.S* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S* @main.c to i8*), i64 12, i32 4, i1 false)
  %3 = bitcast %struct.S* %b to { i64, i32 }*
  %4 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  %7 = load i32* %6, align 1
  %8 = bitcast %struct.S* %a to { i64, i32 }*
  %9 = getelementptr { i64, i32 }* %8, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr { i64, i32 }* %8, i32 0, i32 1
  %12 = load i32* %11, align 1
  %call = call i32 @bar2(i64 %5, i32 %7, i64 %10, i32 %12)
  %13 = bitcast %struct.S* %b to { i64, i32 }*
  %14 = getelementptr { i64, i32 }* %13, i32 0, i32 0
  %15 = load i64* %14, align 1
  %16 = getelementptr { i64, i32 }* %13, i32 0, i32 1
  %17 = load i32* %16, align 1
  %18 = bitcast %struct.S* %a to { i64, i32 }*
  %19 = getelementptr { i64, i32 }* %18, i32 0, i32 0
  %20 = load i64* %19, align 1
  %21 = getelementptr { i64, i32 }* %18, i32 0, i32 1
  %22 = load i32* %21, align 1
  %23 = bitcast %struct.S* %c to { i64, i32 }*
  %24 = getelementptr { i64, i32 }* %23, i32 0, i32 0
  %25 = load i64* %24, align 1
  %26 = getelementptr { i64, i32 }* %23, i32 0, i32 1
  %27 = load i32* %26, align 1
  %call1 = call i32 @bar3(i64 %15, i32 %17, i64 %20, i32 %22, i64 %25, i32 %27)
  %28 = bitcast %struct.S* %c to { i64, i32 }*
  %29 = getelementptr { i64, i32 }* %28, i32 0, i32 0
  %30 = load i64* %29, align 1
  %31 = getelementptr { i64, i32 }* %28, i32 0, i32 1
  %32 = load i32* %31, align 1
  %33 = bitcast %struct.S* %a to { i64, i32 }*
  %34 = getelementptr { i64, i32 }* %33, i32 0, i32 0
  %35 = load i64* %34, align 1
  %36 = getelementptr { i64, i32 }* %33, i32 0, i32 1
  %37 = load i32* %36, align 1
  %38 = bitcast %struct.S* %b to { i64, i32 }*
  %39 = getelementptr { i64, i32 }* %38, i32 0, i32 0
  %40 = load i64* %39, align 1
  %41 = getelementptr { i64, i32 }* %38, i32 0, i32 1
  %42 = load i32* %41, align 1
  %call2 = call i32 @baz3(i64 %30, i32 %32, i64 %35, i32 %37, i64 %40, i32 %42)
  ret i32 0
}
