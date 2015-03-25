; ModuleID = './2003-07-10-SignConversions.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [39 x i8] c"%d %d --> unsigned: us = %d, us2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [39 x i8] c"%d %d -->   signed:  s = %d,  s2 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [39 x i8] c"%d %d --> unsigned: uc = %d, uc2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [39 x i8] c"%d %d -->   signed:  c = %d,  c2 = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define zeroext i8 @getUC() #0 {
  ret i8 -128
}

; Function Attrs: nounwind uwtable
define signext i8 @getC() #0 {
  ret i8 -128
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %C80 = alloca i8, align 1
  %UC80 = alloca i8, align 1
  %us = alloca i16, align 2
  %us2 = alloca i16, align 2
  %s = alloca i16, align 2
  %s2 = alloca i16, align 2
  %uc = alloca i8, align 1
  %uc2 = alloca i8, align 1
  %c = alloca i8, align 1
  %c2 = alloca i8, align 1
  store i32 0, i32* %1
  %2 = call signext i8 @getC()
  store i8 %2, i8* %C80, align 1
  %3 = call zeroext i8 @getUC()
  store i8 %3, i8* %UC80, align 1
  %4 = load i8* %C80, align 1
  %5 = sext i8 %4 to i16
  store i16 %5, i16* %us, align 2
  %6 = load i8* %UC80, align 1
  %7 = zext i8 %6 to i16
  store i16 %7, i16* %us2, align 2
  %8 = load i8* %C80, align 1
  %9 = sext i8 %8 to i16
  store i16 %9, i16* %s, align 2
  %10 = load i8* %UC80, align 1
  %11 = zext i8 %10 to i16
  store i16 %11, i16* %s2, align 2
  %12 = load i8* %C80, align 1
  %13 = sext i8 %12 to i32
  %14 = load i8* %UC80, align 1
  %15 = zext i8 %14 to i32
  %16 = load i16* %us, align 2
  %17 = zext i16 %16 to i32
  %18 = load i16* %us2, align 2
  %19 = zext i16 %18 to i32
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0), i32 %13, i32 %15, i32 %17, i32 %19)
  %21 = load i8* %C80, align 1
  %22 = sext i8 %21 to i32
  %23 = load i8* %UC80, align 1
  %24 = zext i8 %23 to i32
  %25 = load i16* %s, align 2
  %26 = sext i16 %25 to i32
  %27 = load i16* %s2, align 2
  %28 = sext i16 %27 to i32
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str1, i32 0, i32 0), i32 %22, i32 %24, i32 %26, i32 %28)
  %30 = load i8* %C80, align 1
  store i8 %30, i8* %uc, align 1
  %31 = load i8* %UC80, align 1
  store i8 %31, i8* %uc2, align 1
  %32 = load i8* %C80, align 1
  store i8 %32, i8* %c, align 1
  %33 = load i8* %UC80, align 1
  store i8 %33, i8* %c2, align 1
  %34 = load i8* %C80, align 1
  %35 = sext i8 %34 to i32
  %36 = load i8* %UC80, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8* %uc, align 1
  %39 = zext i8 %38 to i32
  %40 = load i8* %uc2, align 1
  %41 = zext i8 %40 to i32
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %35, i32 %37, i32 %39, i32 %41)
  %43 = load i8* %C80, align 1
  %44 = sext i8 %43 to i32
  %45 = load i8* %UC80, align 1
  %46 = zext i8 %45 to i32
  %47 = load i8* %c, align 1
  %48 = sext i8 %47 to i32
  %49 = load i8* %c2, align 1
  %50 = sext i8 %49 to i32
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i32 %44, i32 %46, i32 %48, i32 %50)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
