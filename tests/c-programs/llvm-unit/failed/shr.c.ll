; ModuleID = './shr.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"ShrTest1(-1, 11, 0xFF000000) = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"ShrTest2(-73, 11, 1) = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"ShrTest3(-73) = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"ShrTest4(-73) = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"ShrTest5(7773, 11) = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"ShrTest6(-73, 11) = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"ShrTest7(-737) = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"ShrTest8(73) = %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"ShrTest9(13, 7773, 11) = %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"ShrTest10(13, 7773, 11) = %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c"ShrTest11(13, 7773, 11) = %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [37 x i8] c"ShrTest12(7773, -73, 11, 3773) = %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [37 x i8] c"ShrTest13(7773, -73, 11, 3773) = %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [37 x i8] c"ShrTest14(7773, -73, 11, 3773) = %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"ShrTest15(7773, 13, 11) = %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [29 x i8] c"ShrTest16(-73, 11, 13) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @ShrTest1(i32 %X, i32 %C1, i32 %C2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %C1, i32* %2, align 4
  store i32 %C2, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = lshr i32 %4, %5
  %7 = load i32, i32* %3, align 4
  %8 = and i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest2(i32 %X, i32 %C1, i32 %C2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %C1, i32* %2, align 4
  store i32 %C2, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = ashr i32 %4, %5
  %7 = load i32, i32* %3, align 4
  %8 = and i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest3(i32 %X) #0 {
  %1 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 31
  %4 = sub i32 0, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest4(i32 %X) #0 {
  %1 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 31
  %4 = sub nsw i32 0, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest5(i32 %X, i32 %C) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %AndRHS = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %C, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = lshr i32 -1, %3
  store i32 %4, i32* %AndRHS, align 4
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  %7 = lshr i32 %5, %6
  %8 = load i32, i32* %AndRHS, align 4
  %9 = and i32 %7, %8
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest6(i32 %X, i32 %C) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %AndRHS = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %C, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = lshr i32 -1, %3
  store i32 %4, i32* %AndRHS, align 4
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  %7 = ashr i32 %5, %6
  %8 = load i32, i32* %AndRHS, align 4
  %9 = and i32 %7, %8
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest7(i32 %X) #0 {
  %1 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 0
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest8(i32 %C) #0 {
  %1 = alloca i32, align 4
  store i32 %C, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 -1, %2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest9(i32 %Y, i32 %X, i32 %C) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %Y, i32* %1, align 4
  store i32 %X, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = load i32, i32* %3, align 4
  %7 = ashr i32 %5, %6
  %8 = add nsw i32 %4, %7
  %9 = load i32, i32* %3, align 4
  %10 = shl i32 %8, %9
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest10(i32 %Y, i32 %X, i32 %C) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %Y, i32* %1, align 4
  store i32 %X, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = load i32, i32* %3, align 4
  %7 = ashr i32 %5, %6
  %8 = and i32 %4, %7
  %9 = load i32, i32* %3, align 4
  %10 = shl i32 %8, %9
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest11(i32 %Y, i32 %X, i32 %C) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %Y, i32* %1, align 4
  store i32 %X, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = load i32, i32* %3, align 4
  %7 = ashr i32 %5, %6
  %8 = or i32 %4, %7
  %9 = load i32, i32* %3, align 4
  %10 = shl i32 %8, %9
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest12(i32 %Y, i32 %X, i32 %C, i32 %CC) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %Y, i32* %1, align 4
  store i32 %X, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  store i32 %CC, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %3, align 4
  %8 = ashr i32 %6, %7
  %9 = load i32, i32* %4, align 4
  %10 = and i32 %8, %9
  %11 = add nsw i32 %5, %10
  %12 = load i32, i32* %3, align 4
  %13 = shl i32 %11, %12
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest13(i32 %Y, i32 %X, i32 %C, i32 %CC) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %Y, i32* %1, align 4
  store i32 %X, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  store i32 %CC, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %3, align 4
  %8 = ashr i32 %6, %7
  %9 = load i32, i32* %4, align 4
  %10 = and i32 %8, %9
  %11 = and i32 %5, %10
  %12 = load i32, i32* %3, align 4
  %13 = shl i32 %11, %12
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest14(i32 %Y, i32 %X, i32 %C, i32 %CC) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %Y, i32* %1, align 4
  store i32 %X, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  store i32 %CC, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %3, align 4
  %8 = ashr i32 %6, %7
  %9 = load i32, i32* %4, align 4
  %10 = and i32 %8, %9
  %11 = or i32 %5, %10
  %12 = load i32, i32* %3, align 4
  %13 = shl i32 %11, %12
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest15(i32 %A, i32 %C1, i32 %C2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %A, i32* %1, align 4
  store i32 %C1, i32* %2, align 4
  store i32 %C2, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = shl i32 %4, %5
  %7 = load i32, i32* %3, align 4
  %8 = lshr i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @ShrTest16(i32 %X, i32 %C1, i32 %C2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %C1, i32* %2, align 4
  store i32 %C2, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = ashr i32 %4, %5
  %7 = load i32, i32* %3, align 4
  %8 = shl i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @ShrTest1(i32 -1, i32 11, i32 -16777216)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = call i32 @ShrTest2(i32 -73, i32 11, i32 1)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0), i32 %6)
  %8 = call i32 @ShrTest3(i32 -73)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i32 %8)
  %10 = call i32 @ShrTest4(i32 -73)
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0), i32 %10)
  %12 = call i32 @ShrTest5(i32 7773, i32 11)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0), i32 %12)
  %14 = call i32 @ShrTest6(i32 -73, i32 11)
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i32 0, i32 0), i32 %14)
  %16 = call i32 @ShrTest7(i32 -737)
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0), i32 %16)
  %18 = call i32 @ShrTest8(i32 73)
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i32 0, i32 0), i32 %18)
  %20 = call i32 @ShrTest9(i32 13, i32 7773, i32 11)
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i32 0, i32 0), i32 %20)
  %22 = call i32 @ShrTest10(i32 13, i32 7773, i32 11)
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.9, i32 0, i32 0), i32 %22)
  %24 = call i32 @ShrTest11(i32 13, i32 7773, i32 11)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i32 0, i32 0), i32 %24)
  %26 = call i32 @ShrTest12(i32 7773, i32 -73, i32 11, i32 3773)
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i32 0, i32 0), i32 %26)
  %28 = call i32 @ShrTest13(i32 7773, i32 -73, i32 11, i32 3773)
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.12, i32 0, i32 0), i32 %28)
  %30 = call i32 @ShrTest14(i32 7773, i32 -73, i32 11, i32 3773)
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.13, i32 0, i32 0), i32 %30)
  %32 = call i32 @ShrTest15(i32 7773, i32 13, i32 11)
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.14, i32 0, i32 0), i32 %32)
  %34 = call i32 @ShrTest16(i32 -73, i32 11, i32 13)
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.15, i32 0, i32 0), i32 %34)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
