; ModuleID = './factorial.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %fact = alloca i32, align 4
  %factorial = alloca i32, align 4
  store i32 0, i32* %1
  store i32 10, i32* %n, align 4
  %2 = load i32, i32* %n, align 4
  %3 = call i32 @factorial(i32 %2)
  store i32 %3, i32* %fact, align 4
  %4 = load i32, i32* %fact, align 4
  store i32 %4, i32* %factorial, align 4
  %5 = load i32, i32* %factorial, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @factorial(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %2, align 4
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  store i32 1, i32* %1
  br label %15

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %2, align 4
  %11 = load i32, i32* %2, align 4
  %12 = sub nsw i32 %11, 1
  %13 = call i32 @factorial(i32 %12)
  %14 = mul nsw i32 %10, %13
  store i32 %14, i32* %1
  br label %15

; <label>:15                                      ; preds = %9, %8
  %16 = load i32, i32* %1
  ret i32 %16
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
