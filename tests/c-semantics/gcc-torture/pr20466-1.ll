; ModuleID = './pr20466-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @f(i32** %ipp, i32* %i1p, i32* %i2p, i32** %i3, i32** %i4) #0 {
  %1 = alloca i32**, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32**, align 8
  store i32** %ipp, i32*** %1, align 8
  store i32* %i1p, i32** %2, align 8
  store i32* %i2p, i32** %3, align 8
  store i32** %i3, i32*** %4, align 8
  store i32** %i4, i32*** %5, align 8
  %6 = load i32** %2, align 8
  %7 = load i32* %6, align 4
  %8 = load i32*** %1, align 8
  %9 = load i32** %8, align 8
  store i32 %7, i32* %9, align 4
  %10 = load i32** %3, align 8
  %11 = load i32*** %1, align 8
  store i32* %10, i32** %11, align 8
  %12 = load i32*** %5, align 8
  %13 = load i32** %12, align 8
  %14 = load i32*** %4, align 8
  store i32* %13, i32** %14, align 8
  %15 = load i32*** %1, align 8
  %16 = load i32** %15, align 8
  store i32 99, i32* %16, align 4
  ret i32 3
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %ip = alloca i32*, align 8
  %i3p = alloca i32*, align 8
  %i4p = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 42, i32* %i, align 4
  store i32 66, i32* %i1, align 4
  store i32 1, i32* %i2, align 4
  store i32 -1, i32* %i3, align 4
  store i32 55, i32* %i4, align 4
  store i32* %i, i32** %ip, align 8
  store i32* %i3, i32** %i3p, align 8
  store i32* %i4, i32** %i4p, align 8
  %2 = call i32 @f(i32** %ip, i32* %i1, i32* %i2, i32** %i3p, i32** %i4p)
  %3 = load i32* %i, align 4
  %4 = icmp ne i32 %3, 66
  br i1 %4, label %21, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32** %ip, align 8
  %7 = icmp ne i32* %6, %i2
  br i1 %7, label %21, label %8

; <label>:8                                       ; preds = %5
  %9 = load i32* %i2, align 4
  %10 = icmp ne i32 %9, 99
  br i1 %10, label %21, label %11

; <label>:11                                      ; preds = %8
  %12 = load i32* %i3, align 4
  %13 = icmp ne i32 %12, -1
  br i1 %13, label %21, label %14

; <label>:14                                      ; preds = %11
  %15 = load i32** %i3p, align 8
  %16 = load i32** %i4p, align 8
  %17 = icmp ne i32* %15, %16
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %14
  %19 = load i32* %i4, align 4
  %20 = icmp ne i32 %19, 55
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18, %14, %11, %8, %5, %0
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %18
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %24 = load i32* %1
  ret i32 %24
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
