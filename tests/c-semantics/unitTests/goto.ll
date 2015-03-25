; ModuleID = './goto.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"local=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"Done!\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"sneaky\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"The count is %d.  \0AThis is \00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"none.\0A\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"only one.\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"a pair.\0A\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"three.\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"inside switch, going to break\0A\00", align 1
@.str11 = private unnamed_addr constant [43 x i8] c"inside switch, going to goto another case\0A\00", align 1
@.str12 = private unnamed_addr constant [7 x i8] c"many.\0A\00", align 1
@.str13 = private unnamed_addr constant [7 x i8] c"Broke\0A\00", align 1
@.str14 = private unnamed_addr constant [19 x i8] c"jumping into case\0A\00", align 1
@.str15 = private unnamed_addr constant [27 x i8] c"jumping into weird case 1\0A\00", align 1
@.str16 = private unnamed_addr constant [27 x i8] c"jumping into weird case 2\0A\00", align 1
@.str17 = private unnamed_addr constant [24 x i8] c"The test number is %d.\0A\00", align 1
@.str18 = private unnamed_addr constant [22 x i8] c"%d is an odd number.\0A\00", align 1
@.str19 = private unnamed_addr constant [15 x i8] c"gotowhile: %d\0A\00", align 1
@.str20 = private unnamed_addr constant [14 x i8] c"gotoloop: %d\0A\00", align 1
@.str21 = private unnamed_addr constant [12 x i8] c"sneaky: %d\0A\00", align 1
@.str22 = private unnamed_addr constant [14 x i8] c"myswitch: %d\0A\00", align 1
@.str23 = private unnamed_addr constant [13 x i8] c"another: %d\0A\00", align 1
@.str24 = private unnamed_addr constant [10 x i8] c"last: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @gotowhile() #0 {
  %flag = alloca i32, align 4
  %local = alloca i32, align 4
  store i32 1, i32* %flag, align 4
  %1 = load i32* %flag, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %9

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %9, %4
  br i1 false, label %6, label %12

; <label>:6                                       ; preds = %5
  store i32 1, i32* %local, align 4
  %7 = load i32* %local, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %7)
  br label %9

; <label>:9                                       ; preds = %6, %3
  store i32 0, i32* %local, align 4
  %10 = load i32* %local, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %10)
  br label %5

; <label>:12                                      ; preds = %5
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @gotoloop() #0 {
  %n = alloca i32, align 4
  store i32 10, i32* %n, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %n, align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %2)
  %4 = load i32* %n, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %n, align 4
  %6 = load i32* %n, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %1
  br label %1

; <label>:9                                       ; preds = %1
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0))
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @sneaky() #0 {
  %loopGuard = alloca i32, align 4
  store i32 0, i32* %loopGuard, align 4
  br label %1

; <label>:1                                       ; preds = %12, %0
  %2 = load i32* %loopGuard, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %13

; <label>:4                                       ; preds = %1
  br label %9
                                                  ; No predecessors!
  %6 = load i32* %loopGuard, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  br label %9

; <label>:9                                       ; preds = %8, %4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  store i32 1, i32* %loopGuard, align 4
  br label %12

; <label>:11                                      ; preds = %5
  store i32 0, i32* %loopGuard, align 4
  br label %12

; <label>:12                                      ; preds = %11, %9
  br label %1

; <label>:13                                      ; preds = %1
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @last() #0 {
  %last = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %last, align 4
  store i32 5, i32* %x, align 4
  br label %1

; <label>:1                                       ; preds = %11, %0
  br label %2

; <label>:2                                       ; preds = %1
  %3 = load i32* %last, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %2
  %6 = load i32* %last, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %last, align 4
  %8 = load i32* %last, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %8)
  br label %11

; <label>:10                                      ; preds = %2
  br label %12

; <label>:11                                      ; preds = %5
  br label %1

; <label>:12                                      ; preds = %10
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @another() #0 {
  %another = alloca i32, align 4
  store i32 5, i32* %another, align 4
  br label %6
                                                  ; No predecessors!
  br label %2

; <label>:2                                       ; preds = %6, %1
  %3 = load i32* %another, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %2
  br label %6

; <label>:6                                       ; preds = %5, %0
  %7 = load i32* %another, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %another, align 4
  %10 = add nsw i32 %9, -1
  store i32 %10, i32* %another, align 4
  br label %2

; <label>:11                                      ; preds = %2
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %11
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @myswitch() #0 {
  %count = alloca i32, align 4
  %thrice = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %thrice, align 4
  store i32 2, i32* %count, align 4
  %1 = load i32* %count, align 4
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %1)
  %3 = load i32* %count, align 4
  switch i32 %3, label %19 [
    i32 0, label %4
    i32 1, label %6
    i32 2, label %8
    i32 3, label %11
    i32 4, label %13
    i32 5, label %16
  ]

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0))
  br label %23

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0))
  br label %23

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %26, %17, %8
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %23

; <label>:11                                      ; preds = %0
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0))
  br label %23

; <label>:13                                      ; preds = %0
  br label %14

; <label>:14                                      ; preds = %31, %13
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0))
  br label %21

; <label>:16                                      ; preds = %0
  br label %17

; <label>:17                                      ; preds = %36, %16
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str11, i32 0, i32 0))
  br label %9

; <label>:19                                      ; preds = %0
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0))
  br label %23

; <label>:21                                      ; preds = %14
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str13, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %21, %19, %11, %9, %6, %4
  %24 = load i32* %thrice, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %23
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i32 0, i32 0))
  store i32 1, i32* %thrice, align 4
  br label %9

; <label>:28                                      ; preds = %23
  %29 = load i32* %thrice, align 4
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %28
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str15, i32 0, i32 0))
  store i32 2, i32* %thrice, align 4
  br label %14

; <label>:33                                      ; preds = %28
  %34 = load i32* %thrice, align 4
  %35 = icmp eq i32 %34, 2
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %33
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str16, i32 0, i32 0))
  store i32 3, i32* %thrice, align 4
  br label %17

; <label>:38                                      ; preds = %33
  br label %39

; <label>:39                                      ; preds = %38
  br label %40

; <label>:40                                      ; preds = %39
  store i32 4, i32* %x, align 4
  %41 = load i32* %x, align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str17, i32 0, i32 0), i32 %41)
  br label %43

; <label>:43                                      ; preds = %53, %40
  %44 = load i32* %x, align 4
  %45 = icmp ult i32 %44, 10
  br i1 %45, label %46, label %56

; <label>:46                                      ; preds = %43
  %47 = load i32* %x, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %x, align 4
  %49 = load i32* %x, align 4
  %50 = urem i32 %49, 2
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %46
  br label %57

; <label>:53                                      ; preds = %46
  %54 = load i32* %x, align 4
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str18, i32 0, i32 0), i32 %54)
  br label %43

; <label>:56                                      ; preds = %43
  br label %57

; <label>:57                                      ; preds = %56, %52
  br label %58

; <label>:58                                      ; preds = %57
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @gotowhile()
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %2)
  %4 = call i32 @gotoloop()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str20, i32 0, i32 0), i32 %4)
  %6 = call i32 @sneaky()
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str21, i32 0, i32 0), i32 %6)
  %8 = call i32 @myswitch()
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str22, i32 0, i32 0), i32 %8)
  %10 = call i32 @another()
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str23, i32 0, i32 0), i32 %10)
  %12 = call i32 @last()
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str24, i32 0, i32 0), i32 %12)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
