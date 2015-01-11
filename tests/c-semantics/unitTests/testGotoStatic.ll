; ModuleID = './testGotoStatic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f.staticInt = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x) #0 {
  %1 = alloca i32, align 4
  %retval = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 0, i32* %retval, align 4
  %2 = load i32* %1, align 4
  %3 = srem i32 %2, 2
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %7

; <label>:6                                       ; preds = %0
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* @f.staticInt, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @f.staticInt, align 4
  store i32 %9, i32* %retval, align 4
  %10 = load i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = call i32 @f(i32 %6)
  store i32 %7, i32* %retval, align 4
  br label %8

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %2

; <label>:11                                      ; preds = %2
  %12 = load i32* %retval, align 4
  ret i32 %12
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
