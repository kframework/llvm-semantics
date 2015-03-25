; ModuleID = './test11.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@y = common global i8 0, align 1
@x = common global i32 0, align 4
@z = common global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [23 x i8] c"hello world - x is %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i8 7, i8* @y, align 1
  %4 = load i8* @y, align 1
  %5 = sext i8 %4 to i32
  %6 = sub nsw i32 0, %5
  store i32 %6, i32* @x, align 4
  %7 = load double* @z, align 8
  %8 = fcmp une double %7, 0.000000e+00
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %0
  %10 = load i32* @x, align 4
  %11 = sub nsw i32 0, %10
  store i32 %11, i32* @x, align 4
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load i32* @x, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %13)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
