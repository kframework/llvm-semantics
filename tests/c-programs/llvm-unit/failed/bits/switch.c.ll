; ModuleID = './switch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@zero = constant i32 256, align 4
@seven = internal global i32 15, align 4
@.str = private unnamed_addr constant [7 x i8] c"error\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"error: i=%hhd, c=%hhd\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @test(i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %c, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %28 [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %10
    i32 3, label %14
    i32 4, label %17
    i32 5, label %20
    i32 6, label %23
    i32 7, label %26
  ]

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* @seven, align 4
  %6 = lshr i32 %5, 3
  store i32 %6, i32* %1
  br label %30

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* @seven, align 4
  %9 = lshr i32 %8, 2
  store i32 %9, i32* %1
  br label %30

; <label>:10                                      ; preds = %0
  %11 = load i32, i32* @seven, align 4
  %12 = lshr i32 %11, 1
  %13 = and i32 %12, 2
  store i32 %13, i32* %1
  br label %30

; <label>:14                                      ; preds = %0
  %15 = load i32, i32* @seven, align 4
  %16 = lshr i32 %15, 1
  store i32 %16, i32* %1
  br label %30

; <label>:17                                      ; preds = %0
  %18 = load i32, i32* @seven, align 4
  %19 = and i32 %18, 4
  store i32 %19, i32* %1
  br label %30

; <label>:20                                      ; preds = %0
  %21 = load i32, i32* @seven, align 4
  %22 = and i32 %21, 5
  store i32 %22, i32* %1
  br label %30

; <label>:23                                      ; preds = %0
  %24 = load i32, i32* @seven, align 4
  %25 = and i32 %24, 6
  store i32 %25, i32* %1
  br label %30

; <label>:26                                      ; preds = %0
  %27 = load i32, i32* @seven, align 4
  store i32 %27, i32* %1
  br label %30

; <label>:28                                      ; preds = %0
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %1
  br label %30

; <label>:30                                      ; preds = %28, %26, %23, %20, %17, %14, %10, %7, %4
  %31 = load i32, i32* %1
  ret i32 %31
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i8, align 1
  %i = alloca i8, align 1
  store i32 0, i32* %1
  store i8 0, i8* %i, align 1
  br label %2

; <label>:2                                       ; preds = %23, %0
  %3 = load i8, i8* %i, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %26

; <label>:6                                       ; preds = %2
  %7 = load i8, i8* %i, align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 @test(i32 %8)
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %c, align 1
  %11 = load i8, i8* %c, align 1
  %12 = zext i8 %11 to i32
  %13 = load i8, i8* %i, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %12, %14
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %6
  %17 = load i8, i8* %i, align 1
  %18 = zext i8 %17 to i32
  %19 = load i8, i8* %c, align 1
  %20 = zext i8 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 %18, i32 %20)
  br label %22

; <label>:22                                      ; preds = %16, %6
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i8, i8* %i, align 1
  %25 = add i8 %24, 1
  store i8 %25, i8* %i, align 1
  br label %2

; <label>:26                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
