; ModuleID = './test14.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = common global [20 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %b = alloca i32*, align 8
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32* getelementptr inbounds ([20 x i32]* @a, i32 0, i32 0), i32** %b, align 8
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 20
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = mul nsw i32 %5, 2
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load i32** %b, align 8
  %10 = getelementptr inbounds i32* %9, i64 %8
  store i32 %6, i32* %10, align 4
  br label %11

; <label>:11                                      ; preds = %4
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %1

; <label>:14                                      ; preds = %1
  store i32 5, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %25, %14
  %16 = load i32* %i, align 4
  %17 = icmp slt i32 %16, 15
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %15
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [20 x i32]* @a, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = load i32* %sum, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, i32* %sum, align 4
  br label %25

; <label>:25                                      ; preds = %18
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %15

; <label>:28                                      ; preds = %15
  %29 = load i32* %sum, align 4
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %zz = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @f()
  store i32 %4, i32* %zz, align 4
  %5 = load i32* %zz, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
