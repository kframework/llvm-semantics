; ModuleID = './callargs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [36 x i8] c"\0AprintArgsNoRet with 15 arguments:\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"\09Args 1-5  : %d %d %c %d %c\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"\09Args 6-10 : %d %d %c %d %c\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"\09Args 11-14: %d %d %c %d %c\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"j\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"o\00", align 1

; Function Attrs: nounwind uwtable
define void @printArgsNoRet(i32 %a1, float %a2, i8 signext %a3, double %a4, i8* %a5, i32 %a6, float %a7, i8 signext %a8, double %a9, i8* %a10, i32 %a11, float %a12, i8 signext %a13, double %a14, i8* %a15) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i8, align 1
  %4 = alloca double, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  %8 = alloca i8, align 1
  %9 = alloca double, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca i8, align 1
  %14 = alloca double, align 8
  %15 = alloca i8*, align 8
  store i32 %a1, i32* %1, align 4
  store float %a2, float* %2, align 4
  store i8 %a3, i8* %3, align 1
  store double %a4, double* %4, align 8
  store i8* %a5, i8** %5, align 8
  store i32 %a6, i32* %6, align 4
  store float %a7, float* %7, align 4
  store i8 %a8, i8* %8, align 1
  store double %a9, double* %9, align 8
  store i8* %a10, i8** %10, align 8
  store i32 %a11, i32* %11, align 4
  store float %a12, float* %12, align 4
  store i8 %a13, i8* %13, align 1
  store double %a14, double* %14, align 8
  store i8* %a15, i8** %15, align 8
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0))
  %17 = load i32* %1, align 4
  %18 = load float* %2, align 4
  %19 = fptosi float %18 to i32
  %20 = load i8* %3, align 1
  %21 = sext i8 %20 to i32
  %22 = load double* %4, align 8
  %23 = fptosi double %22 to i32
  %24 = load i8** %5, align 8
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i32 %17, i32 %19, i32 %21, i32 %23, i32 %26)
  %28 = load i32* %6, align 4
  %29 = load float* %7, align 4
  %30 = fptosi float %29 to i32
  %31 = load i8* %8, align 1
  %32 = sext i8 %31 to i32
  %33 = load double* %9, align 8
  %34 = fptosi double %33 to i32
  %35 = load i8** %10, align 8
  %36 = load i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %28, i32 %30, i32 %32, i32 %34, i32 %37)
  %39 = load i32* %11, align 4
  %40 = load float* %12, align 4
  %41 = fptosi float %40 to i32
  %42 = load i8* %13, align 1
  %43 = sext i8 %42 to i32
  %44 = load double* %14, align 8
  %45 = fptosi double %44 to i32
  %46 = load i8** %15, align 8
  %47 = load i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %39, i32 %41, i32 %43, i32 %45, i32 %48)
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @printArgsNoRet(i32 1, float 0x4000CCCCC0000000, i8 signext 99, double 4.100000e+00, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i32 6, float 0x401C666660000000, i8 signext 104, double 9.100000e+00, i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i32 11, float 0x4028333340000000, i8 signext 109, double 1.410000e+01, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
