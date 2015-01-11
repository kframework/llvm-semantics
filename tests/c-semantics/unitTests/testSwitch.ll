; ModuleID = './testSwitch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: You typed zero.\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"%d: is a perfect square.\0A\00", align 1
@.str2 = private unnamed_addr constant [24 x i8] c"%d: is an even number.\0A\00", align 1
@.str3 = private unnamed_addr constant [24 x i8] c"%d: is a prime number.\0A\00", align 1
@.str4 = private unnamed_addr constant [44 x i8] c"%d: Only single-digit numbers are allowed.\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"The count is %d.  \0AThis is \00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"none.\0A\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"only one.\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"a pair.\0A\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"three.\0A\00", align 1
@.str10 = private unnamed_addr constant [7 x i8] c"four.\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"inside switch, going to break\0A\00", align 1
@.str12 = private unnamed_addr constant [7 x i8] c"many.\0A\00", align 1
@.str13 = private unnamed_addr constant [7 x i8] c"Broke\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @doSwitch(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  switch i32 %2, label %21 [
    i32 0, label %3
    i32 1, label %6
    i32 9, label %6
    i32 2, label %9
    i32 3, label %12
    i32 5, label %12
    i32 7, label %12
    i32 4, label %15
    i32 6, label %18
    i32 8, label %18
  ]

; <label>:3                                       ; preds = %0
  %4 = load i32* %1, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %4)
  br label %24

; <label>:6                                       ; preds = %0, %0
  %7 = load i32* %1, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %7)
  br label %24

; <label>:9                                       ; preds = %0
  %10 = load i32* %1, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str2, i32 0, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %0, %0, %0, %9
  %13 = load i32* %1, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), i32 %13)
  br label %24

; <label>:15                                      ; preds = %0
  %16 = load i32* %1, align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %16)
  br label %18

; <label>:18                                      ; preds = %0, %0, %15
  %19 = load i32* %1, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str2, i32 0, i32 0), i32 %19)
  br label %24

; <label>:21                                      ; preds = %0
  %22 = load i32* %1, align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str4, i32 0, i32 0), i32 %22)
  br label %24

; <label>:24                                      ; preds = %21, %18, %12, %6, %3
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @myswitch(i32 %count) #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %count, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %2)
  %4 = load i32* %1, align 4
  switch i32 %4, label %18 [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %9
    i32 3, label %12
    i32 4, label %14
  ]

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0))
  br label %20

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0))
  br label %20

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %9
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %20

; <label>:12                                      ; preds = %0
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0))
  br label %20

; <label>:14                                      ; preds = %0
  br label %15

; <label>:15                                      ; preds = %14
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0))
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0))
  br label %20

; <label>:18                                      ; preds = %0
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0))
  br label %20

; <label>:20                                      ; preds = %18, %15, %12, %10, %7, %5
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str13, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %20
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 11
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  call void @doSwitch(i32 %6)
  br label %7

; <label>:7                                       ; preds = %5
  %8 = load i32* %i, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %i, align 4
  br label %2

; <label>:10                                      ; preds = %2
  store i32 0, i32* %i1, align 4
  br label %11

; <label>:11                                      ; preds = %17, %10
  %12 = load i32* %i1, align 4
  %13 = icmp slt i32 %12, 6
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %11
  %15 = load i32* %i1, align 4
  %16 = call i32 @myswitch(i32 %15)
  br label %17

; <label>:17                                      ; preds = %14
  %18 = load i32* %i1, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i1, align 4
  br label %11

; <label>:20                                      ; preds = %11
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
