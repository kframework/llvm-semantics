; ModuleID = './2008-04-20-LoopBug2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"%d %d %d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %i, i32* %array) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %j = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32* %array, i32** %2, align 8
  store i32 3, i32* %j, align 4
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i32* %j, align 4
  %5 = sub i32 %4, 1
  %6 = zext i32 %5 to i64
  %7 = load i32** %2, align 8
  %8 = getelementptr inbounds i32* %7, i64 %6
  %9 = load i32* %8, align 4
  %10 = load i32* %j, align 4
  %11 = zext i32 %10 to i64
  %12 = load i32** %2, align 8
  %13 = getelementptr inbounds i32* %12, i64 %11
  store i32 %9, i32* %13, align 4
  %14 = load i32* %j, align 4
  %15 = add i32 %14, -1
  store i32 %15, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %3
  %17 = load i32* %j, align 4
  %18 = load i32* %1, align 4
  %19 = icmp ugt i32 %17, %18
  br i1 %19, label %3, label %20

; <label>:20                                      ; preds = %16
  %21 = load i32* %1, align 4
  %22 = load i32** %2, align 8
  %23 = getelementptr inbounds i32* %22, i64 0
  %24 = load i32* %23, align 4
  %25 = load i32** %2, align 8
  %26 = getelementptr inbounds i32* %25, i64 1
  %27 = load i32* %26, align 4
  %28 = load i32** %2, align 8
  %29 = getelementptr inbounds i32* %28, i64 2
  %30 = load i32* %29, align 4
  %31 = load i32** %2, align 8
  %32 = getelementptr inbounds i32* %31, i64 3
  %33 = load i32* %32, align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %21, i32 %24, i32 %27, i32 %30, i32 %33)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %array = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 0
  store i32 5, i32* %6, align 4
  %7 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 1
  store i32 6, i32* %7, align 4
  %8 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 2
  store i32 7, i32* %8, align 4
  %9 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 3
  store i32 8, i32* %9, align 4
  %10 = load i32* %i, align 4
  %11 = getelementptr inbounds [4 x i32]* %array, i32 0, i32 0
  call void @foo(i32 %10, i32* %11)
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  %16 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 0
  store i32 5, i32* %16, align 4
  %17 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 1
  store i32 6, i32* %17, align 4
  %18 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 2
  store i32 7, i32* %18, align 4
  %19 = getelementptr inbounds [4 x i32]* %array, i32 0, i64 3
  store i32 8, i32* %19, align 4
  %20 = getelementptr inbounds [4 x i32]* %array, i32 0, i32 0
  call void @foo(i32 -1, i32* %20)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
