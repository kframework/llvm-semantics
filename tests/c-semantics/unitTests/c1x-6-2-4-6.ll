; ModuleID = './c1x-6-2-4-6.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"1i = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"2i = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"3i = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f1() #0 {
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* null, i32** %p, align 8
  br label %1

; <label>:1                                       ; preds = %12, %0
  %2 = load i32** %p, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %1
  %5 = load i32** %p, align 8
  %6 = load i32* %5, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %6)
  br label %13

; <label>:8                                       ; preds = %1
  %9 = load i32** %p, align 8
  %10 = icmp ne i32* %9, null
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %8
  store i32 16, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %11, %8
  store i32* %i, i32** %p, align 8
  br label %1

; <label>:13                                      ; preds = %4
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @f2() #0 {
  %count = alloca i32, align 4
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  store i32* null, i32** %p, align 8
  br label %1

; <label>:1                                       ; preds = %20, %0
  %2 = load i32** %p, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %1
  %5 = load i32** %p, align 8
  %6 = load i32* %5, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %6)
  br label %8

; <label>:8                                       ; preds = %4, %1
  %9 = load i32* %count, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %8
  %12 = load i32* %count, align 4
  store i32 %12, i32* %i, align 4
  %13 = load i32* %count, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %count, align 4
  br label %16

; <label>:15                                      ; preds = %8
  br label %21

; <label>:16                                      ; preds = %11
  %17 = load i32** %p, align 8
  %18 = icmp eq i32* %17, null
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  store i32* %i, i32** %p, align 8
  br label %20

; <label>:20                                      ; preds = %19, %16
  br label %1

; <label>:21                                      ; preds = %15
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @f3() #0 {
  %count = alloca i32, align 4
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  store i32* null, i32** %p, align 8
  br label %1

; <label>:1                                       ; preds = %17, %0
  %2 = load i32** %p, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %1
  %5 = load i32** %p, align 8
  %6 = load i32* %5, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %6)
  br label %8

; <label>:8                                       ; preds = %4, %1
  store i32 5, i32* %i, align 4
  %9 = load i32* %count, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %8
  %12 = load i32* %count, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %count, align 4
  %14 = load i32** %p, align 8
  %15 = icmp eq i32* %14, null
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11
  store i32* %i, i32** %p, align 8
  br label %17

; <label>:17                                      ; preds = %16, %11
  br label %1

; <label>:18                                      ; preds = %8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @f4() #0 {
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  br label %1

; <label>:1                                       ; preds = %4, %0
  %2 = load i32* %count, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %1
  %5 = load i32* %count, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %count, align 4
  br label %1

; <label>:7                                       ; preds = %1
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f1()
  %3 = call i32 @f2()
  %4 = call i32 @f3()
  %5 = call i32 @f4()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
