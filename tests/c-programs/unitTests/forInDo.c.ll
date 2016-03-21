; ModuleID = './forInDo.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %n = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  br label %2

; <label>:2                                       ; preds = %18, %0
  store i32 0, i32* %result, align 4
  store i32 0, i32* %n, align 4
  br label %3

; <label>:3                                       ; preds = %10, %2
  %4 = load i32, i32* %n, align 4
  %5 = load i32, i32* %x, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* %result, align 4
  %9 = add nsw i32 %8, 5
  store i32 %9, i32* %result, align 4
  br label %10

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %n, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %n, align 4
  %13 = load i32, i32* %y, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %y, align 4
  br label %3

; <label>:15                                      ; preds = %3
  %16 = load i32, i32* %x, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %x, align 4
  br label %18

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %x, align 4
  %20 = icmp slt i32 %19, 5
  br i1 %20, label %2, label %21

; <label>:21                                      ; preds = %18
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
