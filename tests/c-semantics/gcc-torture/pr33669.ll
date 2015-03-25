; ModuleID = './pr33669.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo_t = type { i32, i32 }

; Function Attrs: nounwind uwtable
define i64 @foo(%struct.foo_t* %pxp, i64 %offset, i32 %extent) #0 {
  %1 = alloca i64, align 8
  %2 = alloca %struct.foo_t*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %blkoffset = alloca i64, align 8
  %diff = alloca i32, align 4
  %blkextent = alloca i32, align 4
  store %struct.foo_t* %pxp, %struct.foo_t** %2, align 8
  store i64 %offset, i64* %3, align 8
  store i32 %extent, i32* %4, align 4
  %5 = load i64* %3, align 8
  %6 = load i64* %3, align 8
  %7 = load %struct.foo_t** %2, align 8
  %8 = getelementptr inbounds %struct.foo_t* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = zext i32 %9 to i64
  %11 = srem i64 %6, %10
  %12 = sub nsw i64 %5, %11
  store i64 %12, i64* %blkoffset, align 8
  %13 = load i64* %3, align 8
  %14 = load i64* %blkoffset, align 8
  %15 = sub nsw i64 %13, %14
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %diff, align 4
  %17 = load i32* %diff, align 4
  %18 = load i32* %4, align 4
  %19 = add i32 %17, %18
  %20 = load %struct.foo_t** %2, align 8
  %21 = getelementptr inbounds %struct.foo_t* %20, i32 0, i32 0
  %22 = load i32* %21, align 4
  %23 = add i32 %19, %22
  %24 = sub i32 %23, 1
  %25 = load %struct.foo_t** %2, align 8
  %26 = getelementptr inbounds %struct.foo_t* %25, i32 0, i32 0
  %27 = load i32* %26, align 4
  %28 = udiv i32 %24, %27
  %29 = load %struct.foo_t** %2, align 8
  %30 = getelementptr inbounds %struct.foo_t* %29, i32 0, i32 0
  %31 = load i32* %30, align 4
  %32 = mul i32 %28, %31
  store i32 %32, i32* %blkextent, align 4
  %33 = load %struct.foo_t** %2, align 8
  %34 = getelementptr inbounds %struct.foo_t* %33, i32 0, i32 0
  %35 = load i32* %34, align 4
  %36 = load i32* %blkextent, align 4
  %37 = icmp ult i32 %35, %36
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %0
  store i64 -1, i64* %1
  br label %55

; <label>:39                                      ; preds = %0
  %40 = load %struct.foo_t** %2, align 8
  %41 = getelementptr inbounds %struct.foo_t* %40, i32 0, i32 1
  %42 = load i32* %41, align 4
  %43 = load %struct.foo_t** %2, align 8
  %44 = getelementptr inbounds %struct.foo_t* %43, i32 0, i32 0
  %45 = load i32* %44, align 4
  %46 = icmp ugt i32 %42, %45
  br i1 %46, label %47, label %53

; <label>:47                                      ; preds = %39
  %48 = load %struct.foo_t** %2, align 8
  %49 = getelementptr inbounds %struct.foo_t* %48, i32 0, i32 0
  %50 = load i32* %49, align 4
  %51 = load %struct.foo_t** %2, align 8
  %52 = getelementptr inbounds %struct.foo_t* %51, i32 0, i32 1
  store i32 %50, i32* %52, align 4
  br label %53

; <label>:53                                      ; preds = %47, %39
  %54 = load i64* %blkoffset, align 8
  store i64 %54, i64* %1
  br label %55

; <label>:55                                      ; preds = %53, %38
  %56 = load i64* %1
  ret i64 %56
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.foo_t, align 4
  %xx = alloca i64, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.foo_t* %x, i32 0, i32 0
  store i32 8192, i32* %2, align 4
  %3 = getelementptr inbounds %struct.foo_t* %x, i32 0, i32 1
  store i32 0, i32* %3, align 4
  %4 = call i64 @foo(%struct.foo_t* %x, i64 0, i32 4096)
  store i64 %4, i64* %xx, align 8
  %5 = load i64* %xx, align 8
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
