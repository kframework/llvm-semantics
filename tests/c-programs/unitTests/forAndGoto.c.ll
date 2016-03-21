; ModuleID = './forAndGoto.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"one\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"two\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"sneaky four\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %inMain = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 2, i32* %inMain, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %28

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = icmp ne i32 %6, 4
  br i1 %7, label %8, label %22

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %i, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %8
  br label %12

; <label>:12                                      ; preds = %11
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  br label %14

; <label>:14                                      ; preds = %12, %8
  br label %15

; <label>:15                                      ; preds = %14
  %16 = load i32, i32* %i, align 4
  %17 = icmp eq i32 %16, 2
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %15
  br label %19

; <label>:19                                      ; preds = %18
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  br label %21

; <label>:21                                      ; preds = %19, %15
  br label %24

; <label>:22                                      ; preds = %5
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0))
  br label %24

; <label>:24                                      ; preds = %22, %21
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load i32, i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %2

; <label>:28                                      ; preds = %2
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
