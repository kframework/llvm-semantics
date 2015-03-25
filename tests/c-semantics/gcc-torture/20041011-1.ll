; ModuleID = './20041011-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@gvol = common global [32 x i32] zeroinitializer, align 16
@gull = common global i64 0, align 8

; Function Attrs: noinline nounwind uwtable
define i64 @t1(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, -2048
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t2(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, -513
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t3(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, -512
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t4(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, -511
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t5(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, -1
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t6(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, 1
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t7(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, 511
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t8(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, 512
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t9(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %70

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* %2, align 8
  %69 = add i64 %68, 513
  store i64 %69, i64* %2, align 8
  br label %3

; <label>:70                                      ; preds = %3
  %71 = load i64* %2, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i64 @t10(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %71

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* @gull, align 8
  %69 = load i64* %2, align 8
  %70 = add i64 %69, %68
  store i64 %70, i64* %2, align 8
  br label %3

; <label>:71                                      ; preds = %3
  %72 = load i64* %2, align 8
  ret i64 %72
}

; Function Attrs: noinline nounwind uwtable
define i64 @t11(i32 %n, i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i64 %x, i64* %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %1, align 4
  %6 = icmp ne i32 %4, 0
  br i1 %6, label %7, label %72

; <label>:7                                       ; preds = %3
  %8 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %8, i32* %x1, align 4
  %9 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %9, i32* %x2, align 4
  %10 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %10, i32* %x3, align 4
  %11 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %11, i32* %x4, align 4
  %12 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %12, i32* %x5, align 4
  %13 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %13, i32* %x6, align 4
  %14 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %14, i32* %x7, align 4
  %15 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %15, i32* %x8, align 4
  %16 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %16, i32* %x9, align 4
  %17 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %17, i32* %x10, align 4
  %18 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %18, i32* %x11, align 4
  %19 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %19, i32* %x12, align 4
  %20 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %20, i32* %x13, align 4
  %21 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %21, i32* %x14, align 4
  %22 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %22, i32* %x15, align 4
  %23 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %23, i32* %x16, align 4
  %24 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %24, i32* %x17, align 4
  %25 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %25, i32* %x18, align 4
  %26 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %26, i32* %x19, align 4
  %27 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %27, i32* %x20, align 4
  %28 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %28, i32* %x21, align 4
  %29 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %29, i32* %x22, align 4
  %30 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %30, i32* %x23, align 4
  %31 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %31, i32* %x24, align 4
  %32 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %32, i32* %x25, align 4
  %33 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %33, i32* %x26, align 4
  %34 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %34, i32* %x27, align 4
  %35 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %35, i32* %x28, align 4
  %36 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %36, i32* %x29, align 4
  %37 = load volatile i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %37, i32* %x30, align 4
  %38 = load i32* %x1, align 4
  store volatile i32 %38, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %39 = load i32* %x2, align 4
  store volatile i32 %39, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %40 = load i32* %x3, align 4
  store volatile i32 %40, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %41 = load i32* %x4, align 4
  store volatile i32 %41, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %42 = load i32* %x5, align 4
  store volatile i32 %42, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %43 = load i32* %x6, align 4
  store volatile i32 %43, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %44 = load i32* %x7, align 4
  store volatile i32 %44, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %45 = load i32* %x8, align 4
  store volatile i32 %45, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %46 = load i32* %x9, align 4
  store volatile i32 %46, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %47 = load i32* %x10, align 4
  store volatile i32 %47, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %48 = load i32* %x11, align 4
  store volatile i32 %48, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %49 = load i32* %x12, align 4
  store volatile i32 %49, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %50 = load i32* %x13, align 4
  store volatile i32 %50, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %51 = load i32* %x14, align 4
  store volatile i32 %51, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %52 = load i32* %x15, align 4
  store volatile i32 %52, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %53 = load i32* %x16, align 4
  store volatile i32 %53, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %54 = load i32* %x17, align 4
  store volatile i32 %54, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %55 = load i32* %x18, align 4
  store volatile i32 %55, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %56 = load i32* %x19, align 4
  store volatile i32 %56, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %57 = load i32* %x20, align 4
  store volatile i32 %57, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %58 = load i32* %x21, align 4
  store volatile i32 %58, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %59 = load i32* %x22, align 4
  store volatile i32 %59, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %60 = load i32* %x23, align 4
  store volatile i32 %60, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %61 = load i32* %x24, align 4
  store volatile i32 %61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %62 = load i32* %x25, align 4
  store volatile i32 %62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %63 = load i32* %x26, align 4
  store volatile i32 %63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %64 = load i32* %x27, align 4
  store volatile i32 %64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %65 = load i32* %x28, align 4
  store volatile i32 %65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %66 = load i32* %x29, align 4
  store volatile i32 %66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %67 = load i32* %x30, align 4
  store volatile i32 %67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %68 = load i64* @gull, align 8
  %69 = sub i64 0, %68
  %70 = load i64* %2, align 8
  %71 = add i64 %70, %69
  store i64 %71, i64* %2, align 8
  br label %3

; <label>:72                                      ; preds = %3
  %73 = load i64* %2, align 8
  ret i64 %73
}

; Function Attrs: nounwind uwtable
define i64 @neg(i64 %x) #1 {
  %1 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = sub i64 0, %2
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i64 100, i64* @gull, align 8
  %2 = call i64 @t1(i32 3, i64 -1)
  %3 = icmp ne i64 %2, -6145
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i64 @t1(i32 3, i64 4294967295)
  %7 = icmp ne i64 %6, 4294961151
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i64 @t2(i32 3, i64 -1)
  %11 = icmp ne i64 %10, -1540
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i64 @t2(i32 3, i64 4294967295)
  %15 = icmp ne i64 %14, 4294965756
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i64 @t3(i32 3, i64 -1)
  %19 = icmp ne i64 %18, -1537
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i64 @t3(i32 3, i64 4294967295)
  %23 = icmp ne i64 %22, 4294965759
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i64 @t4(i32 3, i64 -1)
  %27 = icmp ne i64 %26, -1534
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i64 @t4(i32 3, i64 4294967295)
  %31 = icmp ne i64 %30, 4294965762
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i64 @t5(i32 3, i64 -1)
  %35 = icmp ne i64 %34, -4
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #3
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call i64 @t5(i32 3, i64 4294967295)
  %39 = icmp ne i64 %38, 4294967292
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #3
  unreachable

; <label>:41                                      ; preds = %37
  %42 = call i64 @t6(i32 3, i64 -1)
  %43 = icmp ne i64 %42, 2
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %41
  %46 = call i64 @t6(i32 3, i64 4294967295)
  %47 = icmp ne i64 %46, 4294967298
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  call void @abort() #3
  unreachable

; <label>:49                                      ; preds = %45
  %50 = call i64 @t7(i32 3, i64 -1)
  %51 = icmp ne i64 %50, 1532
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %49
  call void @abort() #3
  unreachable

; <label>:53                                      ; preds = %49
  %54 = call i64 @t7(i32 3, i64 4294967295)
  %55 = icmp ne i64 %54, 4294968828
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  call void @abort() #3
  unreachable

; <label>:57                                      ; preds = %53
  %58 = call i64 @t8(i32 3, i64 -1)
  %59 = icmp ne i64 %58, 1535
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %57
  call void @abort() #3
  unreachable

; <label>:61                                      ; preds = %57
  %62 = call i64 @t8(i32 3, i64 4294967295)
  %63 = icmp ne i64 %62, 4294968831
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  call void @abort() #3
  unreachable

; <label>:65                                      ; preds = %61
  %66 = call i64 @t9(i32 3, i64 -1)
  %67 = icmp ne i64 %66, 1538
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  call void @abort() #3
  unreachable

; <label>:69                                      ; preds = %65
  %70 = call i64 @t9(i32 3, i64 4294967295)
  %71 = icmp ne i64 %70, 4294968834
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %69
  call void @abort() #3
  unreachable

; <label>:73                                      ; preds = %69
  %74 = call i64 @t10(i32 3, i64 -1)
  %75 = load i64* @gull, align 8
  %76 = mul i64 %75, 3
  %77 = sub i64 %76, 1
  %78 = icmp ne i64 %74, %77
  br i1 %78, label %79, label %80

; <label>:79                                      ; preds = %73
  call void @abort() #3
  unreachable

; <label>:80                                      ; preds = %73
  %81 = call i64 @t10(i32 3, i64 4294967295)
  %82 = load i64* @gull, align 8
  %83 = mul i64 %82, 3
  %84 = add i64 %83, 4294967295
  %85 = icmp ne i64 %81, %84
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %80
  call void @abort() #3
  unreachable

; <label>:87                                      ; preds = %80
  %88 = call i64 @t11(i32 3, i64 -1)
  %89 = load i64* @gull, align 8
  %90 = sub i64 0, %89
  %91 = mul i64 %90, 3
  %92 = sub i64 %91, 1
  %93 = icmp ne i64 %88, %92
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %87
  call void @abort() #3
  unreachable

; <label>:95                                      ; preds = %87
  %96 = call i64 @t11(i32 3, i64 4294967295)
  %97 = load i64* @gull, align 8
  %98 = sub i64 0, %97
  %99 = mul i64 %98, 3
  %100 = add i64 %99, 4294967295
  %101 = icmp ne i64 %96, %100
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %95
  call void @abort() #3
  unreachable

; <label>:103                                     ; preds = %95
  %104 = load i64* @gull, align 8
  %105 = call i64 @neg(i64 %104)
  %106 = icmp ne i64 %105, -100
  br i1 %106, label %107, label %108

; <label>:107                                     ; preds = %103
  call void @abort() #3
  unreachable

; <label>:108                                     ; preds = %103
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %110 = load i32* %1
  ret i32 %110
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
