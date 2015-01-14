; ModuleID = './r06080503.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"b=%d, j=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [18 x i8] c"b=%d, i=%d, j=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"test1:\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"test2:\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"test3:\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f1() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %1 = load i32* %j, align 4
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 1, i32 %1)
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %12, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %j, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %17

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = load i32* %j, align 4
  %10 = add nsw i32 %9, 0
  store i32 %10, i32* %j, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 0, i32 %8, i32 %10)
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = add i64 %14, 4
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %i, align 4
  br label %3

; <label>:17                                      ; preds = %3
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @f2() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %1 = load i32* %j, align 4
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 1, i32 %1)
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %j, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = load i32* %j, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %j, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 1, i32 %8, i32 %10)
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = add i64 %13, 4
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @f3() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %10, %0
  %2 = load i32* %i, align 4
  %3 = load i32* %j, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %1
  %6 = load i32* %i, align 4
  %7 = load i32* %j, align 4
  %8 = add nsw i32 %7, 0
  store i32 %8, i32* %j, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 0, i32 %6, i32 %8)
  br label %10

; <label>:10                                      ; preds = %5
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = add i64 %12, 4
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %i, align 4
  br label %1

; <label>:15                                      ; preds = %1
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0))
  %2 = call i32 @f1()
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  %4 = call i32 @f2()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  %6 = call i32 @f3()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
