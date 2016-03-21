; ModuleID = './2008-04-18-LoopBug.c'
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

; <label>:3                                       ; preds = %18, %0
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp ugt i32 %4, %5
  br i1 %6, label %7, label %21

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* %j, align 4
  %9 = sub i32 %8, 1
  %10 = zext i32 %9 to i64
  %11 = load i32*, i32** %2, align 8
  %12 = getelementptr inbounds i32, i32* %11, i64 %10
  %13 = load i32, i32* %12, align 4
  %14 = load i32, i32* %j, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32*, i32** %2, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 %15
  store i32 %13, i32* %17, align 4
  br label %18

; <label>:18                                      ; preds = %7
  %19 = load i32, i32* %j, align 4
  %20 = add i32 %19, -1
  store i32 %20, i32* %j, align 4
  br label %3

; <label>:21                                      ; preds = %3
  %22 = load i32, i32* %1, align 4
  %23 = load i32*, i32** %2, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 0
  %25 = load i32, i32* %24, align 4
  %26 = load i32*, i32** %2, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 1
  %28 = load i32, i32* %27, align 4
  %29 = load i32*, i32** %2, align 8
  %30 = getelementptr inbounds i32, i32* %29, i64 2
  %31 = load i32, i32* %30, align 4
  %32 = load i32*, i32** %2, align 8
  %33 = getelementptr inbounds i32, i32* %32, i64 3
  %34 = load i32, i32* %33, align 4
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %22, i32 %25, i32 %28, i32 %31, i32 %34)
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
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 0
  store i32 5, i32* %6, align 4
  %7 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 1
  store i32 6, i32* %7, align 4
  %8 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 2
  store i32 7, i32* %8, align 4
  %9 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 3
  store i32 8, i32* %9, align 4
  %10 = load i32, i32* %i, align 4
  %11 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i32 0
  call void @foo(i32 %10, i32* %11)
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 0
  store i32 5, i32* %16, align 4
  %17 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 1
  store i32 6, i32* %17, align 4
  %18 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 2
  store i32 7, i32* %18, align 4
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i64 3
  store i32 8, i32* %19, align 4
  %20 = getelementptr inbounds [4 x i32], [4 x i32]* %array, i32 0, i32 0
  call void @foo(i32 -1, i32* %20)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
