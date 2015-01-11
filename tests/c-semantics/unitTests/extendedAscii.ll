; ModuleID = './extendedAscii.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f = internal constant [2 x i8] c"\FF\00", align 1
@g = internal constant [2 x i8] c"\FF\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i8* getelementptr inbounds ([2 x i8]* @f, i32 0, i64 0), align 1
  %3 = zext i8 %2 to i32
  %4 = load i8* getelementptr inbounds ([2 x i8]* @g, i32 0, i64 0), align 1
  %5 = zext i8 %4 to i32
  %6 = icmp ne i32 %3, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 3, i32* %1
  br label %16

; <label>:8                                       ; preds = %0
  %9 = load i8* getelementptr inbounds ([2 x i8]* @f, i32 0, i64 1), align 1
  %10 = zext i8 %9 to i32
  %11 = load i8* getelementptr inbounds ([2 x i8]* @g, i32 0, i64 1), align 1
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %10, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  store i32 4, i32* %1
  br label %16

; <label>:15                                      ; preds = %8
  store i32 0, i32* %1
  br label %16

; <label>:16                                      ; preds = %15, %14, %7
  %17 = load i32* %1
  ret i32 %17
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
