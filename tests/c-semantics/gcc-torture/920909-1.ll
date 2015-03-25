; ModuleID = './920909-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  %3 = load i32* %2, align 4
  switch i32 %3, label %18 [
    i32 1026, label %4
    i32 1027, label %7
    i32 1028, label %10
    i32 1029, label %13
    i32 1030, label %16
    i32 1031, label %17
  ]

; <label>:4                                       ; preds = %0
  %5 = load i32* %2, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %1
  br label %19

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = add nsw i32 %8, 2
  store i32 %9, i32* %1
  br label %19

; <label>:10                                      ; preds = %0
  %11 = load i32* %2, align 4
  %12 = add nsw i32 %11, 3
  store i32 %12, i32* %1
  br label %19

; <label>:13                                      ; preds = %0
  %14 = load i32* %2, align 4
  %15 = add nsw i32 %14, 4
  store i32 %15, i32* %1
  br label %19

; <label>:16                                      ; preds = %0
  store i32 1, i32* %1
  br label %19

; <label>:17                                      ; preds = %0
  store i32 4, i32* %1
  br label %19

; <label>:18                                      ; preds = %0
  store i32 0, i32* %1
  br label %19

; <label>:19                                      ; preds = %18, %17, %16, %13, %10, %7, %4
  %20 = load i32* %1
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
