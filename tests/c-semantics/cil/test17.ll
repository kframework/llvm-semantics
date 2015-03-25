; ModuleID = './test17.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"hello world - %d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @silly(i32 %w) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %w, i32* %2, align 4
  store i32 7, i32* %a, align 4
  %3 = load i32* %2, align 4
  switch i32 %3, label %9 [
    i32 11, label %4
    i32 5, label %5
    i32 6, label %6
  ]

; <label>:4                                       ; preds = %0
  store i32 22, i32* %1
  br label %11

; <label>:5                                       ; preds = %0
  store i32 9, i32* %a, align 4
  br label %6

; <label>:6                                       ; preds = %0, %5
  %7 = load i32* %a, align 4
  %8 = mul nsw i32 %7, 7
  store i32 %8, i32* %1
  br label %11

; <label>:9                                       ; preds = %0
  %10 = load i32* %a, align 4
  store i32 %10, i32* %1
  br label %11

; <label>:11                                      ; preds = %9, %6, %4
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @silly(i32 0)
  %5 = call i32 @silly(i32 11)
  %6 = call i32 @silly(i32 5)
  %7 = call i32 @silly(i32 6)
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5, i32 %6, i32 %7)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
