; ModuleID = './2005-05-12-Int64ToFP.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"%llu = %f  %lld = %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %NX = alloca i64, align 8
  %X = alloca i64, align 8
  store i32 0, i32* %1
  store i64 124, i64* %NX, align 8
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load i64, i64* %NX, align 8
  store i64 %3, i64* %X, align 8
  %4 = load i64, i64* %X, align 8
  %5 = load i64, i64* %X, align 8
  %6 = uitofp i64 %5 to double
  %7 = load i64, i64* %X, align 8
  %8 = load i64, i64* %X, align 8
  %9 = sitofp i64 %8 to double
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i64 %4, double %6, i64 %7, double %9)
  %11 = load i64, i64* %NX, align 8
  %12 = add i64 %11, 1152921504606846976
  store i64 %12, i64* %NX, align 8
  br label %13

; <label>:13                                      ; preds = %2
  %14 = load i64, i64* %X, align 8
  %15 = load i64, i64* %NX, align 8
  %16 = icmp ult i64 %14, %15
  br i1 %16, label %2, label %17

; <label>:17                                      ; preds = %13
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
