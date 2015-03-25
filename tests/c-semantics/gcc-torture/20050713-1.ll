; ModuleID = './20050713-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, i32, i32 }

@main.a = private unnamed_addr constant %struct.S { i32 3, i32 4, i32 5 }, align 4
@main.b = private unnamed_addr constant %struct.S { i32 6, i32 7, i32 8 }, align 4
@main.c = private unnamed_addr constant %struct.S { i32 9, i32 10, i32 11 }, align 4

; Function Attrs: nounwind uwtable
define i32 @foo2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) #0 {
  %x = alloca %struct.S, align 8
  %1 = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %2 = alloca { i64, i32 }, align 8
  %3 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %x.coerce0, i64* %3
  %4 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %x.coerce1, i32* %4
  %5 = bitcast %struct.S* %x to i8*
  %6 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 8, i1 false)
  %7 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  store i64 %y.coerce0, i64* %7
  %8 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  store i32 %y.coerce1, i32* %8
  %9 = bitcast %struct.S* %y to i8*
  %10 = bitcast { i64, i32 }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 8, i1 false)
  %11 = getelementptr inbounds %struct.S* %x, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %22, label %14

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.S* %x, i32 0, i32 1
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, 4
  br i1 %17, label %22, label %18

; <label>:18                                      ; preds = %14
  %19 = getelementptr inbounds %struct.S* %x, i32 0, i32 2
  %20 = load i32* %19, align 4
  %21 = icmp ne i32 %20, 5
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %18, %14, %0
  call void @abort() #3
  unreachable

; <label>:23                                      ; preds = %18
  %24 = getelementptr inbounds %struct.S* %y, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 6
  br i1 %26, label %35, label %27

; <label>:27                                      ; preds = %23
  %28 = getelementptr inbounds %struct.S* %y, i32 0, i32 1
  %29 = load i32* %28, align 4
  %30 = icmp ne i32 %29, 7
  br i1 %30, label %35, label %31

; <label>:31                                      ; preds = %27
  %32 = getelementptr inbounds %struct.S* %y, i32 0, i32 2
  %33 = load i32* %32, align 4
  %34 = icmp ne i32 %33, 8
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %31, %27, %23
  call void @abort() #3
  unreachable

; <label>:36                                      ; preds = %31
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @foo3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) #0 {
  %x = alloca %struct.S, align 8
  %1 = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %2 = alloca { i64, i32 }, align 8
  %z = alloca %struct.S, align 8
  %3 = alloca { i64, i32 }, align 8
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %6 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %x.coerce0, i64* %6
  %7 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %x.coerce1, i32* %7
  %8 = bitcast %struct.S* %x to i8*
  %9 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 8, i1 false)
  %10 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  store i64 %y.coerce0, i64* %10
  %11 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  store i32 %y.coerce1, i32* %11
  %12 = bitcast %struct.S* %y to i8*
  %13 = bitcast { i64, i32 }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 12, i32 8, i1 false)
  %14 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  store i64 %z.coerce0, i64* %14
  %15 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  store i32 %z.coerce1, i32* %15
  %16 = bitcast %struct.S* %z to i8*
  %17 = bitcast { i64, i32 }* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 12, i32 8, i1 false)
  %18 = bitcast { i64, i32 }* %4 to i8*
  %19 = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 12, i32 0, i1 false)
  %20 = getelementptr { i64, i32 }* %4, i32 0, i32 0
  %21 = load i64* %20, align 1
  %22 = getelementptr { i64, i32 }* %4, i32 0, i32 1
  %23 = load i32* %22, align 1
  %24 = bitcast { i64, i32 }* %5 to i8*
  %25 = bitcast %struct.S* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 12, i32 0, i1 false)
  %26 = getelementptr { i64, i32 }* %5, i32 0, i32 0
  %27 = load i64* %26, align 1
  %28 = getelementptr { i64, i32 }* %5, i32 0, i32 1
  %29 = load i32* %28, align 1
  %30 = call i32 @foo2(i64 %21, i32 %23, i64 %27, i32 %29)
  %31 = getelementptr inbounds %struct.S* %z, i32 0, i32 0
  %32 = load i32* %31, align 4
  %33 = icmp ne i32 %32, 9
  br i1 %33, label %42, label %34

; <label>:34                                      ; preds = %0
  %35 = getelementptr inbounds %struct.S* %z, i32 0, i32 1
  %36 = load i32* %35, align 4
  %37 = icmp ne i32 %36, 10
  br i1 %37, label %42, label %38

; <label>:38                                      ; preds = %34
  %39 = getelementptr inbounds %struct.S* %z, i32 0, i32 2
  %40 = load i32* %39, align 4
  %41 = icmp ne i32 %40, 11
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %38, %34, %0
  call void @abort() #3
  unreachable

; <label>:43                                      ; preds = %38
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @bar2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) #0 {
  %x = alloca %struct.S, align 8
  %1 = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %2 = alloca { i64, i32 }, align 8
  %3 = alloca { i64, i32 }
  %4 = alloca { i64, i32 }
  %5 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %x.coerce0, i64* %5
  %6 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %x.coerce1, i32* %6
  %7 = bitcast %struct.S* %x to i8*
  %8 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 12, i32 8, i1 false)
  %9 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  store i64 %y.coerce0, i64* %9
  %10 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  store i32 %y.coerce1, i32* %10
  %11 = bitcast %struct.S* %y to i8*
  %12 = bitcast { i64, i32 }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 12, i32 8, i1 false)
  %13 = bitcast { i64, i32 }* %3 to i8*
  %14 = bitcast %struct.S* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 12, i32 0, i1 false)
  %15 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  %18 = load i32* %17, align 1
  %19 = bitcast { i64, i32 }* %4 to i8*
  %20 = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 12, i32 0, i1 false)
  %21 = getelementptr { i64, i32 }* %4, i32 0, i32 0
  %22 = load i64* %21, align 1
  %23 = getelementptr { i64, i32 }* %4, i32 0, i32 1
  %24 = load i32* %23, align 1
  %25 = call i32 @foo2(i64 %16, i32 %18, i64 %22, i32 %24)
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define i32 @bar3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) #0 {
  %x = alloca %struct.S, align 8
  %1 = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %2 = alloca { i64, i32 }, align 8
  %z = alloca %struct.S, align 8
  %3 = alloca { i64, i32 }, align 8
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %6 = alloca { i64, i32 }
  %7 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %x.coerce0, i64* %7
  %8 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %x.coerce1, i32* %8
  %9 = bitcast %struct.S* %x to i8*
  %10 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 8, i1 false)
  %11 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  store i64 %y.coerce0, i64* %11
  %12 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  store i32 %y.coerce1, i32* %12
  %13 = bitcast %struct.S* %y to i8*
  %14 = bitcast { i64, i32 }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 12, i32 8, i1 false)
  %15 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  store i64 %z.coerce0, i64* %15
  %16 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  store i32 %z.coerce1, i32* %16
  %17 = bitcast %struct.S* %z to i8*
  %18 = bitcast { i64, i32 }* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 12, i32 8, i1 false)
  %19 = bitcast { i64, i32 }* %4 to i8*
  %20 = bitcast %struct.S* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 12, i32 0, i1 false)
  %21 = getelementptr { i64, i32 }* %4, i32 0, i32 0
  %22 = load i64* %21, align 1
  %23 = getelementptr { i64, i32 }* %4, i32 0, i32 1
  %24 = load i32* %23, align 1
  %25 = bitcast { i64, i32 }* %5 to i8*
  %26 = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 12, i32 0, i1 false)
  %27 = getelementptr { i64, i32 }* %5, i32 0, i32 0
  %28 = load i64* %27, align 1
  %29 = getelementptr { i64, i32 }* %5, i32 0, i32 1
  %30 = load i32* %29, align 1
  %31 = bitcast { i64, i32 }* %6 to i8*
  %32 = bitcast %struct.S* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 12, i32 0, i1 false)
  %33 = getelementptr { i64, i32 }* %6, i32 0, i32 0
  %34 = load i64* %33, align 1
  %35 = getelementptr { i64, i32 }* %6, i32 0, i32 1
  %36 = load i32* %35, align 1
  %37 = call i32 @foo3(i64 %22, i32 %24, i64 %28, i32 %30, i64 %34, i32 %36)
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define i32 @baz3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) #0 {
  %x = alloca %struct.S, align 8
  %1 = alloca { i64, i32 }, align 8
  %y = alloca %struct.S, align 8
  %2 = alloca { i64, i32 }, align 8
  %z = alloca %struct.S, align 8
  %3 = alloca { i64, i32 }, align 8
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %6 = alloca { i64, i32 }
  %7 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %x.coerce0, i64* %7
  %8 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %x.coerce1, i32* %8
  %9 = bitcast %struct.S* %x to i8*
  %10 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 8, i1 false)
  %11 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  store i64 %y.coerce0, i64* %11
  %12 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  store i32 %y.coerce1, i32* %12
  %13 = bitcast %struct.S* %y to i8*
  %14 = bitcast { i64, i32 }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 12, i32 8, i1 false)
  %15 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  store i64 %z.coerce0, i64* %15
  %16 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  store i32 %z.coerce1, i32* %16
  %17 = bitcast %struct.S* %z to i8*
  %18 = bitcast { i64, i32 }* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 12, i32 8, i1 false)
  %19 = bitcast { i64, i32 }* %4 to i8*
  %20 = bitcast %struct.S* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 12, i32 0, i1 false)
  %21 = getelementptr { i64, i32 }* %4, i32 0, i32 0
  %22 = load i64* %21, align 1
  %23 = getelementptr { i64, i32 }* %4, i32 0, i32 1
  %24 = load i32* %23, align 1
  %25 = bitcast { i64, i32 }* %5 to i8*
  %26 = bitcast %struct.S* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 12, i32 0, i1 false)
  %27 = getelementptr { i64, i32 }* %5, i32 0, i32 0
  %28 = load i64* %27, align 1
  %29 = getelementptr { i64, i32 }* %5, i32 0, i32 1
  %30 = load i32* %29, align 1
  %31 = bitcast { i64, i32 }* %6 to i8*
  %32 = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 12, i32 0, i1 false)
  %33 = getelementptr { i64, i32 }* %6, i32 0, i32 0
  %34 = load i64* %33, align 1
  %35 = getelementptr { i64, i32 }* %6, i32 0, i32 1
  %36 = load i32* %35, align 1
  %37 = call i32 @foo3(i64 %22, i32 %24, i64 %28, i32 %30, i64 %34, i32 %36)
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %c = alloca %struct.S, align 4
  %2 = alloca { i64, i32 }
  %3 = alloca { i64, i32 }
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %6 = alloca { i64, i32 }
  %7 = alloca { i64, i32 }
  %8 = alloca { i64, i32 }
  %9 = alloca { i64, i32 }
  store i32 0, i32* %1
  %10 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast (%struct.S* @main.a to i8*), i64 12, i32 4, i1 false)
  %11 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* bitcast (%struct.S* @main.b to i8*), i64 12, i32 4, i1 false)
  %12 = bitcast %struct.S* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* bitcast (%struct.S* @main.c to i8*), i64 12, i32 4, i1 false)
  %13 = bitcast { i64, i32 }* %2 to i8*
  %14 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 12, i32 0, i1 false)
  %15 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  %18 = load i32* %17, align 1
  %19 = bitcast { i64, i32 }* %3 to i8*
  %20 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 12, i32 0, i1 false)
  %21 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  %22 = load i64* %21, align 1
  %23 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  %24 = load i32* %23, align 1
  %25 = call i32 @bar2(i64 %16, i32 %18, i64 %22, i32 %24)
  %26 = bitcast { i64, i32 }* %4 to i8*
  %27 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 12, i32 0, i1 false)
  %28 = getelementptr { i64, i32 }* %4, i32 0, i32 0
  %29 = load i64* %28, align 1
  %30 = getelementptr { i64, i32 }* %4, i32 0, i32 1
  %31 = load i32* %30, align 1
  %32 = bitcast { i64, i32 }* %5 to i8*
  %33 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 12, i32 0, i1 false)
  %34 = getelementptr { i64, i32 }* %5, i32 0, i32 0
  %35 = load i64* %34, align 1
  %36 = getelementptr { i64, i32 }* %5, i32 0, i32 1
  %37 = load i32* %36, align 1
  %38 = bitcast { i64, i32 }* %6 to i8*
  %39 = bitcast %struct.S* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %39, i64 12, i32 0, i1 false)
  %40 = getelementptr { i64, i32 }* %6, i32 0, i32 0
  %41 = load i64* %40, align 1
  %42 = getelementptr { i64, i32 }* %6, i32 0, i32 1
  %43 = load i32* %42, align 1
  %44 = call i32 @bar3(i64 %29, i32 %31, i64 %35, i32 %37, i64 %41, i32 %43)
  %45 = bitcast { i64, i32 }* %7 to i8*
  %46 = bitcast %struct.S* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 12, i32 0, i1 false)
  %47 = getelementptr { i64, i32 }* %7, i32 0, i32 0
  %48 = load i64* %47, align 1
  %49 = getelementptr { i64, i32 }* %7, i32 0, i32 1
  %50 = load i32* %49, align 1
  %51 = bitcast { i64, i32 }* %8 to i8*
  %52 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %52, i64 12, i32 0, i1 false)
  %53 = getelementptr { i64, i32 }* %8, i32 0, i32 0
  %54 = load i64* %53, align 1
  %55 = getelementptr { i64, i32 }* %8, i32 0, i32 1
  %56 = load i32* %55, align 1
  %57 = bitcast { i64, i32 }* %9 to i8*
  %58 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %57, i8* %58, i64 12, i32 0, i1 false)
  %59 = getelementptr { i64, i32 }* %9, i32 0, i32 0
  %60 = load i64* %59, align 1
  %61 = getelementptr { i64, i32 }* %9, i32 0, i32 1
  %62 = load i32* %61, align 1
  %63 = call i32 @baz3(i64 %48, i32 %50, i64 %54, i32 %56, i64 %60, i32 %62)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
