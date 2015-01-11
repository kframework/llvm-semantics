; ModuleID = './returnPointer.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [39 x i8] c"BUG: different addresses for p and &x\0A\00", align 1
@.str1 = private unnamed_addr constant [39 x i8] c"BUG: different addresses for q and &p\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32**, align 8
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  %2 = call i32* @f(i32* %x)
  store i32* %2, i32** %p, align 8
  %3 = call i32** @g(i32** %p)
  store i32** %3, i32*** %q, align 8
  %4 = load i32** %p, align 8
  %5 = icmp ne i32* %4, %x
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0))
  br label %8

; <label>:8                                       ; preds = %6, %0
  %9 = load i32*** %q, align 8
  %10 = icmp ne i32** %9, %p
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str1, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = load i32* %x, align 4
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32* @f(i32* %x) #0 {
  %1 = alloca i32*, align 8
  store i32* %x, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = load i32* %2, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %2, align 4
  %5 = load i32** %1, align 8
  ret i32* %5
}

; Function Attrs: nounwind uwtable
define i32** @g(i32** %x) #0 {
  %1 = alloca i32**, align 8
  store i32** %x, i32*** %1, align 8
  %2 = load i32*** %1, align 8
  %3 = load i32** %2, align 8
  %4 = load i32* %3, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4
  %6 = load i32*** %1, align 8
  ret i32** %6
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
