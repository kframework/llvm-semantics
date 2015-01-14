; ModuleID = './arithConversions.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"BUG in 1\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"Good in 1\00", align 1
@.str3 = private unnamed_addr constant [18 x i8] c"Good answer in 2\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"BUG: No promotions in 2\0A\00", align 1
@.str5 = private unnamed_addr constant [43 x i8] c"BUG: Something really weird happened in 2\0A\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Good in 3_a\0A\00", align 1
@.str8 = private unnamed_addr constant [12 x i8] c"BUG in 3_a\0A\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"BUG in 3_b\0A\00", align 1
@.str10 = private unnamed_addr constant [13 x i8] c"Good in 3_b\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @test1() #0 {
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  store i16 -12, i16* %a, align 2
  store i16 -12, i16* %b, align 2
  %1 = load i16* %a, align 2
  %2 = zext i16 %1 to i32
  %3 = load i16* %b, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %2, %4
  %6 = select i1 %5, i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* %6)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @test2() #0 {
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i32, align 4
  store i8 5, i8* %a, align 1
  store i8 -56, i8* %b, align 1
  %1 = load i8* %a, align 1
  %2 = zext i8 %1 to i32
  %3 = load i8* %b, align 1
  %4 = zext i8 %3 to i32
  %5 = mul nsw i32 %2, %4
  store i32 %5, i32* %c, align 4
  %6 = load i32* %c, align 4
  %7 = icmp eq i32 %6, 1000
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0))
  br label %18

; <label>:10                                      ; preds = %0
  %11 = load i32* %c, align 4
  %12 = icmp eq i32 %11, 232
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %10
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0))
  br label %17

; <label>:15                                      ; preds = %10
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str5, i32 0, i32 0))
  br label %17

; <label>:17                                      ; preds = %15, %13
  br label %18

; <label>:18                                      ; preds = %17, %8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @test3() #0 {
  %foo = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i8, align 1
  store i32 -1, i32* %foo, align 4
  store i32 -1, i32* %a, align 4
  %1 = load i32* %a, align 4
  %2 = load i32* %foo, align 4
  %3 = icmp eq i32 %1, %2
  %4 = select i1 %3, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i8* %4)
  store i8 -1, i8* %b, align 1
  %6 = load i8* %b, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32* %foo, align 4
  %9 = icmp eq i32 %7, %8
  %10 = select i1 %9, i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str10, i32 0, i32 0)
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i8* %10)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test1()
  %3 = call i32 @test2()
  %4 = call i32 @test3()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
