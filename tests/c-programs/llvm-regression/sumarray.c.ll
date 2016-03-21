; ModuleID = './sumarray.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"Produced: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @SumArray(i32* %Array, i32 %Num) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %Result = alloca i32, align 4
  store i32* %Array, i32** %1, align 8
  store i32 %Num, i32* %2, align 4
  store i32 0, i32* %Result, align 4
  %3 = load i32*, i32** %1, align 8
  %4 = getelementptr inbounds i32, i32* %3, i64 34
  store i32 1234, i32* %4, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %17, %0
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp ult i32 %6, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %i, align 4
  %11 = zext i32 %10 to i64
  %12 = load i32*, i32** %1, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 %11
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %Result, align 4
  %16 = add i32 %15, %14
  store i32 %16, i32* %Result, align 4
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i32, i32* %i, align 4
  %19 = add i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %5

; <label>:20                                      ; preds = %5
  %21 = load i32, i32* %Result, align 4
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %Array = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 400) #3
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %Array, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %14, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %17

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = mul nsw i32 %8, 4
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32*, i32** %Array, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 %11
  store i32 %9, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %7
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 2
  store i32 %16, i32* %i, align 4
  br label %4

; <label>:17                                      ; preds = %4
  store i32 1, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %28, %17
  %19 = load i32, i32* %i, align 4
  %20 = icmp slt i32 %19, 100
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %18
  %22 = load i32, i32* %i, align 4
  %23 = mul nsw i32 %22, 2
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32*, i32** %Array, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 %25
  store i32 %23, i32* %27, align 4
  br label %28

; <label>:28                                      ; preds = %21
  %29 = load i32, i32* %i, align 4
  %30 = add nsw i32 %29, 2
  store i32 %30, i32* %i, align 4
  br label %18

; <label>:31                                      ; preds = %18
  %32 = load i32*, i32** %Array, align 8
  %33 = call i32 @SumArray(i32* %32, i32 100)
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 %33)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
