; ModuleID = './div.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"uDivTest1(42,3) = %u\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"uDivTest2(42,3) = %u\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"uDivTest3(42,3) = %u\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"uDivTest4(42,3) = %u\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"uDivTest5(42,3) = %u\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"uDivTest6(42,3) = %u\0A\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"uDivTest7(42,3) = %u\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"uDivTest8(42,3) = %u\0A\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"uDivTest9(42,3) = %u\0A\00", align 1
@.str.9 = private unnamed_addr constant [23 x i8] c"uDivTest10(42,3) = %u\0A\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"uDivTest11(42,3) = %u\0A\00", align 1
@.str.11 = private unnamed_addr constant [23 x i8] c"uDivTest12(42,3) = %u\0A\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"uDivTest13(42,3) = %u\0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"uDivTest14(42,3) = %u\0A\00", align 1
@.str.14 = private unnamed_addr constant [23 x i8] c"uDivTest15(42,3) = %u\0A\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"uDivTest16(42,3) = %u\0A\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"uDivTest17(42,3) = %u\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @uDivTest1(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 0, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest2(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 %3, 1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest3(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 %3, -1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest4(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %2, align 4
  br label %9

; <label>:9                                       ; preds = %7, %6
  %10 = phi i32 [ 0, %6 ], [ %8, %7 ]
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest5(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %2, align 4
  br label %9

; <label>:9                                       ; preds = %7, %6
  %10 = phi i32 [ 0, %6 ], [ %8, %7 ]
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest6(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %2, align 4
  br label %9

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = phi i32 [ %7, %6 ], [ 0, %8 ]
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest7(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %2, align 4
  br label %9

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = phi i32 [ %7, %6 ], [ 0, %8 ]
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest8(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 %3, 2
  %5 = udiv i32 %4, 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest9(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 %3, 2
  %5 = udiv i32 %4, 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest10(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 %3, 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest11(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = udiv i32 %3, 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest12(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = shl i32 4, %4
  %6 = udiv i32 %3, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest13(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = shl i32 4, %4
  %6 = udiv i32 %3, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest14(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp eq i32 %4, %5
  %7 = zext i1 %6 to i32
  %8 = udiv i32 %3, 4
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest15(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp eq i32 %4, %5
  %7 = zext i1 %6 to i32
  %8 = udiv i32 %3, 4
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest16(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sub i32 0, %3
  %5 = udiv i32 %4, 2
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @uDivTest17(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sub i32 0, %3
  %5 = udiv i32 %4, 2
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @uDivTest1(i32 42, i32 3)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = call i32 @uDivTest2(i32 42, i32 3)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %6)
  %8 = call i32 @uDivTest3(i32 42, i32 3)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i32 0, i32 0), i32 %8)
  %10 = call i32 @uDivTest4(i32 42, i32 3)
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0), i32 %10)
  %12 = call i32 @uDivTest5(i32 42, i32 3)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i32 %12)
  %14 = call i32 @uDivTest6(i32 42, i32 3)
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0), i32 %14)
  %16 = call i32 @uDivTest7(i32 42, i32 3)
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i32 0, i32 0), i32 %16)
  %18 = call i32 @uDivTest8(i32 42, i32 3)
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0), i32 %18)
  %20 = call i32 @uDivTest9(i32 42, i32 3)
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0), i32 %20)
  %22 = call i32 @uDivTest10(i32 42, i32 3)
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i32 0, i32 0), i32 %22)
  %24 = call i32 @uDivTest11(i32 42, i32 3)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.10, i32 0, i32 0), i32 %24)
  %26 = call i32 @uDivTest12(i32 42, i32 3)
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i32 %26)
  %28 = call i32 @uDivTest13(i32 42, i32 3)
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0), i32 %28)
  %30 = call i32 @uDivTest14(i32 42, i32 3)
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i32 0, i32 0), i32 %30)
  %32 = call i32 @uDivTest15(i32 42, i32 3)
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.14, i32 0, i32 0), i32 %32)
  %34 = call i32 @uDivTest16(i32 42, i32 3)
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i32 0, i32 0), i32 %34)
  %36 = call i32 @uDivTest17(i32 42, i32 3)
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i32 0, i32 0), i32 %36)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
