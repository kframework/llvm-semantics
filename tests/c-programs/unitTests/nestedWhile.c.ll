; ModuleID = './nestedWhile.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %retval = alloca i32, align 4
  %y = alloca i32, align 4
  %x1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  store i32 0, i32* %retval, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %x, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  store i32 3, i32* %y, align 4
  br label %6

; <label>:6                                       ; preds = %9, %5
  %7 = load i32, i32* %y, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %retval, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %retval, align 4
  %12 = load i32, i32* %y, align 4
  %13 = add nsw i32 %12, -1
  store i32 %13, i32* %y, align 4
  br label %6

; <label>:14                                      ; preds = %6
  %15 = load i32, i32* %x, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %x, align 4
  store i32 0, i32* %x1, align 4
  br label %2

; <label>:17                                      ; preds = %2
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
