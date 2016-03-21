; ModuleID = './twofile-link2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f.r = internal global i32 0, align 4
@.str = private unnamed_addr constant [11 x i8] c"  2z = %d\0A\00", align 1
@z = external global i32, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"  2w = %d\0A\00", align 1
@w = internal global i32 13, align 4
@.str.2 = private unnamed_addr constant [11 x i8] c"  2r = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"  2c = %d\0A\00", align 1
@c = external global i32, align 4
@.str.4 = private unnamed_addr constant [14 x i8] c"  2g(5) = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"  2v = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %v = alloca double, align 8
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* @f.r, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* @f.r, align 4
  store double 1.800000e+00, double* %v, align 8
  %5 = load i32, i32* @z, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32, i32* @w, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* @f.r, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 %9)
  %11 = load i32, i32* @c, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i32 %11)
  %13 = call i32 @g(i32 5)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i32 %13)
  %15 = load double, double* %v, align 8
  %16 = fmul double %15, 1.000000e+03
  %17 = fptosi double %16 to i32
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %1, align 4
  %20 = mul nsw i32 %19, 2
  %21 = load i32, i32* %2, align 4
  %22 = add nsw i32 %20, %21
  ret i32 %22
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = mul nsw i32 %2, %3
  ret i32 %4
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
