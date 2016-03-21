; ModuleID = './hanoi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@step = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t1 = alloca i8, align 1
  %t2 = alloca i8, align 1
  %t3 = alloca i8, align 1
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i8 65, i8* %t1, align 1
  store i8 66, i8* %t2, align 1
  store i8 67, i8* %t3, align 1
  store i32 4, i32* %n, align 4
  %2 = load i8, i8* %t1, align 1
  %3 = load i8, i8* %t2, align 1
  %4 = load i8, i8* %t3, align 1
  %5 = load i32, i32* %n, align 4
  call void @hanoi(i8 signext %2, i8 signext %3, i8 signext %4, i32 %5)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @hanoi(i8 signext %t1, i8 signext %t2, i8 signext %t3, i32 %n) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  store i8 %t1, i8* %1, align 1
  store i8 %t2, i8* %2, align 1
  store i8 %t3, i8* %3, align 1
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
  %11 = load i8, i8* %1, align 1
  %12 = load i8, i8* %3, align 1
  %13 = load i8, i8* %2, align 1
  %14 = load i32, i32* %4, align 4
  %15 = sub nsw i32 %14, 1
  call void @hanoi(i8 signext %11, i8 signext %12, i8 signext %13, i32 %15)
  %16 = load i8, i8* %3, align 1
  %17 = load i8, i8* %2, align 1
  %18 = load i8, i8* %1, align 1
  %19 = load i32, i32* %4, align 4
  %20 = sub nsw i32 %19, 1
  call void @hanoi(i8 signext %16, i8 signext %17, i8 signext %18, i32 %20)
  br label %21

; <label>:21                                      ; preds = %10, %9
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
