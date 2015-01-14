; ModuleID = './cast-bug.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 1, i32* %result, align 4
  store i32 2, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %17, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %2, align 4
  %7 = add nsw i32 %6, 2
  %8 = icmp sle i32 %5, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %4
  %10 = load i32* %i, align 4
  %11 = and i32 %10, 1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

; <label>:13                                      ; preds = %9
  %14 = load i32* %result, align 4
  %15 = add nsw i32 %14, 17
  store i32 %15, i32* %result, align 4
  br label %16

; <label>:16                                      ; preds = %13, %9
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %4

; <label>:20                                      ; preds = %4
  %21 = load i32* %result, align 4
  %22 = icmp ne i32 %21, 35
  %23 = zext i1 %22 to i32
  ret i32 %23
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
