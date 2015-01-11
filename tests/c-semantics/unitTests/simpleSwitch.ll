; ModuleID = './simpleSwitch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %retval = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  store i32 0, i32* %retval, align 4
  %2 = load i32* %x, align 4
  switch i32 %2, label %10 [
    i32 4, label %3
    i32 5, label %4
    i32 6, label %7
  ]

; <label>:3                                       ; preds = %0
  br label %13

; <label>:4                                       ; preds = %0
  %5 = load i32* %retval, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %retval, align 4
  br label %7

; <label>:7                                       ; preds = %0, %4
  %8 = load i32* %retval, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %retval, align 4
  br label %13

; <label>:10                                      ; preds = %0
  %11 = load i32* %retval, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %retval, align 4
  br label %13

; <label>:13                                      ; preds = %10, %7, %3
  %14 = load i32* %x, align 4
  switch i32 %14, label %18 [
    i32 5, label %15
  ]

; <label>:15                                      ; preds = %13
  %16 = load i32* %retval, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, i32* %retval, align 4
  br label %18

; <label>:18                                      ; preds = %15, %13
  %19 = load i32* %x, align 4
  switch i32 %19, label %23 [
    i32 4, label %20
    i32 6, label %26
  ]

; <label>:20                                      ; preds = %18
  %21 = load i32* %retval, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, i32* %retval, align 4
  br label %29

; <label>:23                                      ; preds = %18
  %24 = load i32* %retval, align 4
  %25 = mul nsw i32 %24, 3
  store i32 %25, i32* %retval, align 4
  br label %26

; <label>:26                                      ; preds = %18, %23
  %27 = load i32* %retval, align 4
  %28 = mul nsw i32 %27, 5
  store i32 %28, i32* %retval, align 4
  br label %29

; <label>:29                                      ; preds = %26, %20
  %30 = load i32* %retval, align 4
  ret i32 %30
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
