; ModuleID = './2003-07-08-BitOpsTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"%d %d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @test(i32 %A, i32 %B, i32 %C, i32 %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %bxor = alloca i32, align 4
  %bor = alloca i32, align 4
  %band = alloca i32, align 4
  %bandnot = alloca i32, align 4
  %bornot = alloca i32, align 4
  store i32 %A, i32* %1, align 4
  store i32 %B, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  store i32 %D, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = load i32* %2, align 4
  %7 = xor i32 %5, %6
  %8 = load i32* %3, align 4
  %9 = xor i32 %7, %8
  %10 = load i32* %4, align 4
  %11 = xor i32 %9, %10
  store i32 %11, i32* %bxor, align 4
  %12 = load i32* %1, align 4
  %13 = load i32* %2, align 4
  %14 = or i32 %12, %13
  %15 = load i32* %3, align 4
  %16 = or i32 %14, %15
  %17 = load i32* %4, align 4
  %18 = or i32 %16, %17
  store i32 %18, i32* %bor, align 4
  %19 = load i32* %1, align 4
  %20 = load i32* %2, align 4
  %21 = and i32 %19, %20
  %22 = load i32* %3, align 4
  %23 = and i32 %21, %22
  %24 = load i32* %4, align 4
  %25 = and i32 %23, %24
  store i32 %25, i32* %band, align 4
  %26 = load i32* %1, align 4
  %27 = load i32* %2, align 4
  %28 = xor i32 %27, -1
  %29 = and i32 %26, %28
  %30 = load i32* %3, align 4
  %31 = load i32* %4, align 4
  %32 = xor i32 %31, -1
  %33 = and i32 %30, %32
  %34 = xor i32 %29, %33
  store i32 %34, i32* %bandnot, align 4
  %35 = load i32* %1, align 4
  %36 = load i32* %2, align 4
  %37 = xor i32 %36, -1
  %38 = or i32 %35, %37
  %39 = load i32* %3, align 4
  %40 = load i32* %4, align 4
  %41 = xor i32 %40, -1
  %42 = or i32 %39, %41
  %43 = xor i32 %38, %42
  store i32 %43, i32* %bornot, align 4
  %44 = load i32* %bxor, align 4
  %45 = load i32* %bor, align 4
  %46 = load i32* %band, align 4
  %47 = load i32* %bandnot, align 4
  %48 = load i32* %bornot, align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %44, i32 %45, i32 %46, i32 %47, i32 %48)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test(i32 7, i32 8, i32 -5, i32 5)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
