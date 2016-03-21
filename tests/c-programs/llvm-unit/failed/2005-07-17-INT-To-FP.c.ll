; ModuleID = './2005-07-17-INT-To-FP.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@tests = global [11 x i32] [i32 -2147483648, i32 -123456792, i32 -10, i32 -2, i32 -1, i32 0, i32 1, i32 2, i32 10, i32 123456792, i32 2147483520], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d %f, %f, %f, %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %40, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp ult i32 %3, 64
  br i1 %4, label %5, label %43

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %i, align 4
  %8 = shl i32 %7, 2
  %9 = trunc i32 %8 to i8
  %10 = sitofp i8 %9 to double
  %11 = load i32, i32* %i, align 4
  %12 = shl i32 %11, 10
  %13 = trunc i32 %12 to i16
  %14 = sitofp i16 %13 to double
  %15 = load i32, i32* %i, align 4
  %16 = shl i32 %15, 26
  %17 = sitofp i32 %16 to double
  %18 = load i32, i32* %i, align 4
  %19 = zext i32 %18 to i64
  %20 = shl i64 %19, 58
  %21 = sitofp i64 %20 to double
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %6, double %10, double %14, double %17, double %21)
  %23 = load i32, i32* %i, align 4
  %24 = load i32, i32* %i, align 4
  %25 = shl i32 %24, 2
  %26 = trunc i32 %25 to i8
  %27 = uitofp i8 %26 to double
  %28 = load i32, i32* %i, align 4
  %29 = shl i32 %28, 10
  %30 = trunc i32 %29 to i16
  %31 = uitofp i16 %30 to double
  %32 = load i32, i32* %i, align 4
  %33 = shl i32 %32, 26
  %34 = uitofp i32 %33 to double
  %35 = load i32, i32* %i, align 4
  %36 = zext i32 %35 to i64
  %37 = shl i64 %36, 58
  %38 = uitofp i64 %37 to double
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %23, double %27, double %31, double %34, double %38)
  br label %40

; <label>:40                                      ; preds = %5
  %41 = load i32, i32* %i, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %2

; <label>:43                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %73, %43
  %45 = load i32, i32* %i, align 4
  %46 = zext i32 %45 to i64
  %47 = icmp ult i64 %46, 11
  br i1 %47, label %48, label %76

; <label>:48                                      ; preds = %44
  %49 = load i32, i32* %i, align 4
  %50 = load i32, i32* %i, align 4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds [11 x i32], [11 x i32]* @tests, i32 0, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = uitofp i32 %53 to double
  %55 = load i32, i32* %i, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds [11 x i32], [11 x i32]* @tests, i32 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = sitofp i32 %58 to double
  %60 = load i32, i32* %i, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [11 x i32], [11 x i32]* @tests, i32 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = sitofp i32 %63 to float
  %65 = fpext float %64 to double
  %66 = load i32, i32* %i, align 4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [11 x i32], [11 x i32]* @tests, i32 0, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = sitofp i32 %69 to float
  %71 = fpext float %70 to double
  %72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %49, double %54, double %59, double %65, double %71)
  br label %73

; <label>:73                                      ; preds = %48
  %74 = load i32, i32* %i, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %i, align 4
  br label %44

; <label>:76                                      ; preds = %44
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
