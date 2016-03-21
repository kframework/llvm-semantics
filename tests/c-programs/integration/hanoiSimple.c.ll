; ModuleID = './hanoiSimple.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@step = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @hanoi(i32 %t1, i32 %t2, i32 %t3, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %t1, i32* %1, align 4
  store i32 %t2, i32* %2, align 4
  store i32 %t3, i32* %3, align 4
  store i32 %n, i32* %4, align 4
  %5 = load i32, i32* @step, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @step, align 4
  %7 = load i32, i32* %4, align 4
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  br label %21

; <label>:10                                      ; preds = %0
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %3, align 4
  %13 = load i32, i32* %2, align 4
  %14 = load i32, i32* %4, align 4
  %15 = sub nsw i32 %14, 1
  call void @hanoi(i32 %11, i32 %12, i32 %13, i32 %15)
  %16 = load i32, i32* %3, align 4
  %17 = load i32, i32* %2, align 4
  %18 = load i32, i32* %1, align 4
  %19 = load i32, i32* %4, align 4
  %20 = sub nsw i32 %19, 1
  call void @hanoi(i32 %16, i32 %17, i32 %18, i32 %20)
  br label %21

; <label>:21                                      ; preds = %10, %9
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 4, i32* %n, align 4
  %2 = load i32, i32* %n, align 4
  call void @hanoi(i32 1, i32 2, i32 3, i32 %2)
  %3 = load i32, i32* @step, align 4
  ret i32 %3
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
