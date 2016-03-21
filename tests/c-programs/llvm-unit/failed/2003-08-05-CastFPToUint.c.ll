; ModuleID = './2003-08-05-CastFPToUint.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c"DC = %lf, DS = %lf, DI = %lf\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"uc = %u, us = %u, ui = %u\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %DC = alloca double, align 8
  %DS = alloca double, align 8
  %DI = alloca double, align 8
  %uc = alloca i8, align 1
  %us = alloca i16, align 2
  %ui = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call double @getDC()
  store double %4, double* %DC, align 8
  %5 = call double @getDS()
  store double %5, double* %DS, align 8
  %6 = call double @getDI()
  store double %6, double* %DI, align 8
  %7 = load double, double* %DC, align 8
  %8 = fptoui double %7 to i8
  store i8 %8, i8* %uc, align 1
  %9 = load double, double* %DS, align 8
  %10 = fptoui double %9 to i16
  store i16 %10, i16* %us, align 2
  %11 = load double, double* %DI, align 8
  %12 = fptoui double %11 to i32
  store i32 %12, i32* %ui, align 4
  %13 = load double, double* %DC, align 8
  %14 = load double, double* %DS, align 8
  %15 = load double, double* %DI, align 8
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i32 0, i32 0), double %13, double %14, double %15)
  %17 = load i8, i8* %uc, align 1
  %18 = zext i8 %17 to i32
  %19 = load i16, i16* %us, align 2
  %20 = zext i16 %19 to i32
  %21 = load i32, i32* %ui, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0), i32 %18, i32 %20, i32 %21)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal double @getDC() #0 {
  ret double 2.400000e+02
}

; Function Attrs: nounwind uwtable
define internal double @getDS() #0 {
  ret double 6.552000e+04
}

; Function Attrs: nounwind uwtable
define internal double @getDI() #0 {
  ret double 0x41EFFFFFFE000000
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
