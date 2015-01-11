; ModuleID = './castNonIntegerToBool.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"Bad b1\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"Good b1\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"Bad b2\0A\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"Good b2\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"Bad b3\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"Good b3\0A\00", align 1
@.str6 = private unnamed_addr constant [8 x i8] c"Bad b4\0A\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"Good b4\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %b1 = alloca i8, align 1
  %b2 = alloca i8, align 1
  %b3 = alloca i8, align 1
  %b4 = alloca i8, align 1
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  %2 = load i32** %p, align 8
  %3 = icmp ne i32* %2, null
  %4 = zext i1 %3 to i8
  store i8 %4, i8* %b1, align 1
  store i8 0, i8* %b2, align 1
  store i8 0, i8* %b3, align 1
  store i8 1, i8* %b4, align 1
  %5 = load i8* %b1, align 1
  %6 = trunc i8 %5 to i1
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  br label %13

; <label>:11                                      ; preds = %0
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %11, %9
  %14 = load i8* %b2, align 1
  %15 = trunc i8 %14 to i1
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %13
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0))
  br label %22

; <label>:20                                      ; preds = %13
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %20, %18
  %23 = load i8* %b3, align 1
  %24 = trunc i8 %23 to i1
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %22
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %31

; <label>:29                                      ; preds = %22
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0))
  br label %31

; <label>:31                                      ; preds = %29, %27
  %32 = load i8* %b4, align 1
  %33 = trunc i8 %32 to i1
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 1
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %31
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0))
  br label %40

; <label>:38                                      ; preds = %31
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %40

; <label>:40                                      ; preds = %38, %36
  %41 = load i32* %1
  ret i32 %41
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
