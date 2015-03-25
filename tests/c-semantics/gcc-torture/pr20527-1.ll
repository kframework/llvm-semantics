; ModuleID = './pr20527-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b = global [4 x i64] [i64 1, i64 5, i64 11, i64 23], align 16

; Function Attrs: noinline nounwind uwtable
define void @f(i64* %limit, i64* %base, i64 %minLen, i64 %maxLen) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  %vec = alloca i64, align 8
  store i64* %limit, i64** %1, align 8
  store i64* %base, i64** %2, align 8
  store i64 %minLen, i64* %3, align 8
  store i64 %maxLen, i64* %4, align 8
  store i64 0, i64* %vec, align 8
  %5 = load i64* %3, align 8
  store i64 %5, i64* %i, align 8
  br label %6

; <label>:6                                       ; preds = %28, %0
  %7 = load i64* %i, align 8
  %8 = load i64* %4, align 8
  %9 = icmp sle i64 %7, %8
  br i1 %9, label %10, label %31

; <label>:10                                      ; preds = %6
  %11 = load i64* %i, align 8
  %12 = add nsw i64 %11, 1
  %13 = load i64** %2, align 8
  %14 = getelementptr inbounds i64* %13, i64 %12
  %15 = load i64* %14, align 8
  %16 = load i64* %i, align 8
  %17 = load i64** %2, align 8
  %18 = getelementptr inbounds i64* %17, i64 %16
  %19 = load i64* %18, align 8
  %20 = sub nsw i64 %15, %19
  %21 = load i64* %vec, align 8
  %22 = add nsw i64 %21, %20
  store i64 %22, i64* %vec, align 8
  %23 = load i64* %vec, align 8
  %24 = sub nsw i64 %23, 1
  %25 = load i64* %i, align 8
  %26 = load i64** %1, align 8
  %27 = getelementptr inbounds i64* %26, i64 %25
  store i64 %24, i64* %27, align 8
  br label %28

; <label>:28                                      ; preds = %10
  %29 = load i64* %i, align 8
  %30 = add nsw i64 %29, 1
  store i64 %30, i64* %i, align 8
  br label %6

; <label>:31                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %l = alloca [3 x i64], align 16
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x i64]* %l, i32 0, i32 0
  call void @f(i64* %2, i64* getelementptr inbounds ([4 x i64]* @b, i32 0, i32 0), i64 0, i64 2)
  %3 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 0
  %4 = load i64* %3, align 8
  %5 = icmp ne i64 %4, 3
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 1
  %8 = load i64* %7, align 8
  %9 = icmp ne i64 %8, 9
  br i1 %9, label %14, label %10

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 2
  %12 = load i64* %11, align 8
  %13 = icmp ne i64 %12, 21
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10, %6, %0
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %10
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %17 = load i32* %1
  ret i32 %17
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
