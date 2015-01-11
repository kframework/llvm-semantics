; ModuleID = './20051215-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @foo(i32 %x, i32 %y, i32* %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32* %z, i32** %3, align 8
  store i32 0, i32* %b, align 4
  store i32 0, i32* %a, align 4
  store i32 0, i32* %d, align 4
  br label %4

; <label>:4                                       ; preds = %29, %0
  %5 = load i32* %d, align 4
  %6 = load i32* %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %32

; <label>:8                                       ; preds = %4
  %9 = load i32** %3, align 8
  %10 = icmp ne i32* %9, null
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %8
  %12 = load i32* %d, align 4
  %13 = load i32** %3, align 8
  %14 = load i32* %13, align 4
  %15 = mul nsw i32 %12, %14
  store i32 %15, i32* %b, align 4
  br label %16

; <label>:16                                      ; preds = %11, %8
  store i32 0, i32* %c, align 4
  br label %17

; <label>:17                                      ; preds = %25, %16
  %18 = load i32* %c, align 4
  %19 = load i32* %1, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %28

; <label>:21                                      ; preds = %17
  %22 = load i32* %b, align 4
  %23 = load i32* %a, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, i32* %a, align 4
  br label %25

; <label>:25                                      ; preds = %21
  %26 = load i32* %c, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %c, align 4
  br label %17

; <label>:28                                      ; preds = %17
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %d, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %d, align 4
  br label %4

; <label>:32                                      ; preds = %4
  %33 = load i32* %a, align 4
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i32 3, i32 2, i32* null)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
