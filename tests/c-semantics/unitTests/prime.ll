; ModuleID = './prime.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @prime(i32 2)
  %3 = call i32 @prime(i32 7)
  %4 = add nsw i32 %2, %3
  %5 = call i32 @prime(i32 8)
  %6 = add nsw i32 %4, %5
  %7 = call i32 @prime(i32 31)
  %8 = add nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @prime(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %flag = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  store i32 1, i32* %flag, align 4
  store i32 2, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = sdiv i32 %5, 2
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %3
  %9 = load i32* %flag, align 4
  %10 = icmp ne i32 %9, 0
  br label %11

; <label>:11                                      ; preds = %8, %3
  %12 = phi i1 [ false, %3 ], [ %10, %8 ]
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %11
  %14 = load i32* %2, align 4
  %15 = load i32* %i, align 4
  %16 = srem i32 %14, %15
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %13
  store i32 0, i32* %flag, align 4
  br label %22

; <label>:19                                      ; preds = %13
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %19, %18
  br label %3

; <label>:23                                      ; preds = %11
  %24 = load i32* %flag, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23
  store i32 1, i32* %1
  br label %28

; <label>:27                                      ; preds = %23
  store i32 0, i32* %1
  br label %28

; <label>:28                                      ; preds = %27, %26
  %29 = load i32* %1
  ret i32 %29
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
