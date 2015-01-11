; ModuleID = './pr19005.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@v = common global i32 0, align 4
@s = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @bar(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %x = alloca i8, align 1
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* @v, align 4
  %4 = trunc i32 %3 to i8
  store i8 %4, i8* %x, align 1
  %5 = load i32* @s, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %22, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i8* %x, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %8, %10
  br i1 %11, label %20, label %12

; <label>:12                                      ; preds = %7
  %13 = load i32* %2, align 4
  %14 = load i8* %x, align 1
  %15 = zext i8 %14 to i32
  %16 = add nsw i32 %15, 1
  %17 = trunc i32 %16 to i8
  %18 = zext i8 %17 to i32
  %19 = icmp ne i32 %13, %18
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %12, %7
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %12
  br label %37

; <label>:22                                      ; preds = %0
  %23 = load i32* %1, align 4
  %24 = load i8* %x, align 1
  %25 = zext i8 %24 to i32
  %26 = add nsw i32 %25, 1
  %27 = trunc i32 %26 to i8
  %28 = zext i8 %27 to i32
  %29 = icmp ne i32 %23, %28
  br i1 %29, label %35, label %30

; <label>:30                                      ; preds = %22
  %31 = load i32* %2, align 4
  %32 = load i8* %x, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp ne i32 %31, %33
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %30, %22
  call void @abort() #2
  unreachable

; <label>:36                                      ; preds = %30
  br label %37

; <label>:37                                      ; preds = %36, %21
  %38 = load i32* @s, align 4
  %39 = xor i32 %38, 1
  store i32 %39, i32* @s, align 4
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = trunc i32 %2 to i8
  store i8 %3, i8* %a, align 1
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, 1
  %6 = trunc i32 %5 to i8
  store i8 %6, i8* %b, align 1
  %7 = load i8* %a, align 1
  %8 = zext i8 %7 to i32
  %9 = load i8* %b, align 1
  %10 = zext i8 %9 to i32
  call void @bar(i32 %8, i32 %10)
  %11 = load i8* %b, align 1
  %12 = zext i8 %11 to i32
  %13 = load i8* %a, align 1
  %14 = zext i8 %13 to i32
  %15 = xor i32 %14, %12
  %16 = trunc i32 %15 to i8
  store i8 %16, i8* %a, align 1
  %17 = load i8* %a, align 1
  %18 = zext i8 %17 to i32
  %19 = load i8* %b, align 1
  %20 = zext i8 %19 to i32
  %21 = xor i32 %20, %18
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* %b, align 1
  %23 = load i8* %b, align 1
  %24 = zext i8 %23 to i32
  %25 = load i8* %a, align 1
  %26 = zext i8 %25 to i32
  %27 = xor i32 %26, %24
  %28 = trunc i32 %27 to i8
  store i8 %28, i8* %a, align 1
  %29 = load i8* %a, align 1
  %30 = zext i8 %29 to i32
  %31 = load i8* %b, align 1
  %32 = zext i8 %31 to i32
  call void @bar(i32 %30, i32 %32)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -10, i32* @v, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load i32* @v, align 4
  %4 = icmp slt i32 %3, 266
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %2
  %6 = load i32* @v, align 4
  %7 = call i32 @foo(i32 %6)
  br label %8

; <label>:8                                       ; preds = %5
  %9 = load i32* @v, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* @v, align 4
  br label %2

; <label>:11                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
