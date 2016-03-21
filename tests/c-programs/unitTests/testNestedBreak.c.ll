; ModuleID = './testNestedBreak.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %retval = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %w = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  store i32 %2, i32* %retval, align 4
  br label %3

; <label>:3                                       ; preds = %0
  store i32 6, i32* %y, align 4
  br label %4

; <label>:4                                       ; preds = %12, %3
  %5 = load i32, i32* %retval, align 4
  %6 = icmp eq i32 %5, 5
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %4
  store i32 7, i32* %z, align 4
  br label %8

; <label>:8                                       ; preds = %7
  store i32 9, i32* %w, align 4
  %9 = load i32, i32* %w, align 4
  %10 = load i32, i32* %retval, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, i32* %retval, align 4
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32, i32* %z, align 4
  %14 = load i32, i32* %retval, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, i32* %retval, align 4
  %16 = load i32, i32* %retval, align 4
  %17 = add nsw i32 %16, 2
  store i32 %17, i32* %retval, align 4
  br label %4

; <label>:18                                      ; preds = %4
  %19 = load i32, i32* %y, align 4
  %20 = load i32, i32* %retval, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %retval, align 4
  br label %22

; <label>:22                                      ; preds = %18
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
