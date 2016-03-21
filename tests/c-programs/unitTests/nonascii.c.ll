; ModuleID = './nonascii.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global [2 x i32] [i32 937, i32 0], align 4
@y = global i32 937, align 4
@.str = private unnamed_addr constant [59 x i8] c"size of 2 element string is %d, and size of element is %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"first element is same\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"first element is different\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"terminator element is same\0A\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"terminator element is different\0A\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"chars are same\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"chars are different\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i32 0, i32 0), i32 8, i32 4)
  %3 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @x, i32 0, i64 0), align 4
  %4 = icmp eq i32 %3, 937
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  br label %9

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i32 0, i32 0))
  br label %9

; <label>:9                                       ; preds = %7, %5
  %10 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @x, i32 0, i64 1), align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %9
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  br label %16

; <label>:14                                      ; preds = %9
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i32 0, i32 0))
  br label %16

; <label>:16                                      ; preds = %14, %12
  %17 = load i32, i32* @y, align 4
  %18 = icmp eq i32 %17, 937
  br i1 %18, label %19, label %21

; <label>:19                                      ; preds = %16
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i32 0, i32 0))
  br label %23

; <label>:21                                      ; preds = %16
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %21, %19
  %24 = load i32, i32* %1
  ret i32 %24
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
