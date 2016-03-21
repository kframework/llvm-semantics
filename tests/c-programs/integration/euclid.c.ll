; ModuleID = './euclid.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @euclidean_gcd(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %t = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp sgt i32 %3, %4
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  store i32 %7, i32* %t, align 4
  %8 = load i32, i32* %2, align 4
  store i32 %8, i32* %1, align 4
  %9 = load i32, i32* %t, align 4
  store i32 %9, i32* %2, align 4
  br label %10

; <label>:10                                      ; preds = %6, %0
  br label %11

; <label>:11                                      ; preds = %14, %10
  %12 = load i32, i32* %2, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %11
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %16 = load i32, i32* %1, align 4
  %17 = load i32, i32* %2, align 4
  %18 = srem i32 %16, %17
  store i32 %18, i32* %m, align 4
  %19 = load i32, i32* %2, align 4
  store i32 %19, i32* %1, align 4
  %20 = load i32, i32* %m, align 4
  store i32 %20, i32* %2, align 4
  br label %11

; <label>:21                                      ; preds = %11
  %22 = load i32, i32* %1, align 4
  ret i32 %22
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @euclidean_gcd(i32 105537739, i32 78401179)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %2)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
