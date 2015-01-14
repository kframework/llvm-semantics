; ModuleID = './nestedSwitch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"one\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"two\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"default\0A\00", align 1
@.str3 = private unnamed_addr constant [7 x i8] c"three\0A\00", align 1
@.str4 = private unnamed_addr constant [13 x i8] c"sneaky four\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %inMain = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 2, i32* %inMain, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %22, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %25

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = icmp ne i32 %6, 4
  br i1 %7, label %8, label %19

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  switch i32 %9, label %14 [
    i32 1, label %10
    i32 2, label %12
    i32 3, label %16
  ]

; <label>:10                                      ; preds = %8
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  br label %18

; <label>:12                                      ; preds = %8
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %18

; <label>:14                                      ; preds = %8
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %18

; <label>:16                                      ; preds = %8
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0))
  br label %18

; <label>:18                                      ; preds = %16, %14, %12, %10
  br label %21

; <label>:19                                      ; preds = %5
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0))
  br label %21

; <label>:21                                      ; preds = %19, %18
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %2

; <label>:25                                      ; preds = %2
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
