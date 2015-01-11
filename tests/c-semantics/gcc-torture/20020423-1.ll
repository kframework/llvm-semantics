; ModuleID = './20020423-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %my_int = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 924, i32* %my_int, align 4
  %2 = load i32* %my_int, align 4
  %3 = mul nsw i32 %2, 2
  %4 = add nsw i32 %3, 4
  %5 = sub i32 %4, 8
  %6 = udiv i32 %5, 2
  store i32 %6, i32* %result, align 4
  %7 = load i32* %result, align 4
  %8 = icmp ne i32 %7, 922
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load i32* %my_int, align 4
  %12 = mul nsw i32 %11, 2
  %13 = sub i32 %12, 4
  %14 = add i32 %13, 2
  %15 = udiv i32 %14, 2
  store i32 %15, i32* %result, align 4
  %16 = load i32* %result, align 4
  %17 = icmp ne i32 %16, 923
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %10
  %20 = load i32* %my_int, align 4
  %21 = add nsw i32 %20, 2
  %22 = mul nsw i32 %21, 2
  %23 = sub i32 %22, 8
  %24 = sub i32 %23, 4
  %25 = udiv i32 %24, 2
  store i32 %25, i32* %result, align 4
  %26 = load i32* %result, align 4
  %27 = icmp ne i32 %26, 920
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %19
  %30 = load i32* %my_int, align 4
  %31 = add nsw i32 %30, 2
  %32 = mul nsw i32 %31, 2
  %33 = sub i32 %32, 12
  %34 = udiv i32 %33, 2
  store i32 %34, i32* %result, align 4
  %35 = load i32* %result, align 4
  %36 = icmp ne i32 %35, 920
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:38                                      ; preds = %29
  %39 = load i32* %my_int, align 4
  %40 = mul nsw i32 %39, 4
  %41 = add i32 %40, 2
  %42 = sub i32 %41, 4
  %43 = udiv i32 %42, 2
  store i32 %43, i32* %result, align 4
  %44 = load i32* %result, align 4
  %45 = icmp ne i32 %44, 1847
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %38
  call void @abort() #2
  unreachable

; <label>:47                                      ; preds = %38
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %49 = load i32* %1
  ret i32 %49
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
