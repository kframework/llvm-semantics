; ModuleID = './2002-05-02-ManyArguments.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"%d, %d, %d, %d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"%d, %ld, %d, %d, %lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printfn(i32 %a, i16 signext %b, double %C, float %D, i8 signext %E, i8 signext %F, i8* %G, double* %H, i32 %I, i64 %J) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca double, align 8
  %4 = alloca float, align 4
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  store i32 %a, i32* %1, align 4
  store i16 %b, i16* %2, align 2
  store double %C, double* %3, align 8
  store float %D, float* %4, align 4
  store i8 %E, i8* %5, align 1
  store i8 %F, i8* %6, align 1
  store i8* %G, i8** %7, align 8
  store double* %H, double** %8, align 8
  store i32 %I, i32* %9, align 4
  store i64 %J, i64* %10, align 8
  %11 = load i32* %1, align 4
  %12 = load i16* %2, align 2
  %13 = sext i16 %12 to i32
  %14 = load double* %3, align 8
  %15 = fmul double 1.000000e+02, %14
  %16 = fptosi double %15 to i32
  %17 = load float* %4, align 4
  %18 = fmul float 1.000000e+02, %17
  %19 = fptosi float %18 to i32
  %20 = load i8* %5, align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %13, i32 %16, i32 %19, i32 %21)
  %23 = load i8* %6, align 1
  %24 = sext i8 %23 to i32
  %25 = load i8** %7, align 8
  %26 = bitcast i8* %25 to i32*
  %27 = load i32* %26, align 4
  %28 = sext i32 %27 to i64
  %29 = load double** %8, align 8
  %30 = icmp eq double* %29, null
  %31 = zext i1 %30 to i32
  %32 = load i32* %9, align 4
  %33 = load i64* %10, align 8
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %24, i64 %28, i32 %31, i32 %32, i64 %33)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  %2 = bitcast i32* %x to i8*
  call void @printfn(i32 12, i16 signext 2, double 1.232340e+02, float 0x40933C7E20000000, i8 signext -12, i8 signext 23, i8* %2, double* null, i32 1234567, i64 123124124124)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
