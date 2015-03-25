; ModuleID = './991016-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @doit(i32 %sel, i32 %n, i8* %p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %p0 = alloca i32*, align 8
  %p1 = alloca i64*, align 8
  %p2 = alloca i64*, align 8
  store i32 %sel, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  store i8* %p, i8** %4, align 8
  %5 = load i8** %4, align 8
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %p0, align 8
  %7 = load i8** %4, align 8
  %8 = bitcast i8* %7 to i64*
  store i64* %8, i64** %p1, align 8
  %9 = load i8** %4, align 8
  %10 = bitcast i8* %9 to i64*
  store i64* %10, i64** %p2, align 8
  %11 = load i32* %2, align 4
  switch i32 %11, label %60 [
    i32 0, label %12
    i32 1, label %28
    i32 2, label %44
  ]

; <label>:12                                      ; preds = %0
  br label %13

; <label>:13                                      ; preds = %19, %12
  %14 = load i32** %p0, align 8
  %15 = load i32* %14, align 4
  %16 = load i32** %p0, align 8
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %17, %15
  store i32 %18, i32* %16, align 4
  br label %19

; <label>:19                                      ; preds = %13
  %20 = load i32* %3, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, i32* %3, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %13, label %23

; <label>:23                                      ; preds = %19
  %24 = load i32** %p0, align 8
  %25 = load i32* %24, align 4
  %26 = icmp eq i32 %25, 0
  %27 = zext i1 %26 to i32
  store i32 %27, i32* %1
  br label %61

; <label>:28                                      ; preds = %0
  br label %29

; <label>:29                                      ; preds = %35, %28
  %30 = load i64** %p1, align 8
  %31 = load i64* %30, align 8
  %32 = load i64** %p1, align 8
  %33 = load i64* %32, align 8
  %34 = add nsw i64 %33, %31
  store i64 %34, i64* %32, align 8
  br label %35

; <label>:35                                      ; preds = %29
  %36 = load i32* %3, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, i32* %3, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %29, label %39

; <label>:39                                      ; preds = %35
  %40 = load i64** %p1, align 8
  %41 = load i64* %40, align 8
  %42 = icmp eq i64 %41, 0
  %43 = zext i1 %42 to i32
  store i32 %43, i32* %1
  br label %61

; <label>:44                                      ; preds = %0
  br label %45

; <label>:45                                      ; preds = %51, %44
  %46 = load i64** %p2, align 8
  %47 = load i64* %46, align 8
  %48 = load i64** %p2, align 8
  %49 = load i64* %48, align 8
  %50 = add nsw i64 %49, %47
  store i64 %50, i64* %48, align 8
  br label %51

; <label>:51                                      ; preds = %45
  %52 = load i32* %3, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, i32* %3, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %45, label %55

; <label>:55                                      ; preds = %51
  %56 = load i64** %p2, align 8
  %57 = load i64* %56, align 8
  %58 = icmp eq i64 %57, 0
  %59 = zext i1 %58 to i32
  store i32 %59, i32* %1
  br label %61

; <label>:60                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:61                                      ; preds = %55, %39, %23
  %62 = load i32* %1
  ret i32 %62
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %v0 = alloca i32, align 4
  %v1 = alloca i64, align 8
  %v2 = alloca i64, align 8
  store i32 0, i32* %1
  store i32 1, i32* %v0, align 4
  %2 = bitcast i32* %v0 to i8*
  %3 = call i32 @doit(i32 0, i32 5, i8* %2)
  store i64 1, i64* %v1, align 8
  %4 = bitcast i64* %v1 to i8*
  %5 = call i32 @doit(i32 1, i32 5, i8* %4)
  store i64 1, i64* %v2, align 8
  %6 = bitcast i64* %v2 to i8*
  %7 = call i32 @doit(i32 2, i32 5, i8* %6)
  %8 = load i32* %v0, align 4
  %9 = icmp ne i32 %8, 32
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  %12 = load i64* %v1, align 8
  %13 = icmp ne i64 %12, 32
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  %16 = load i64* %v2, align 8
  %17 = icmp ne i64 %16, 32
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %21 = load i32* %1
  ret i32 %21
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
