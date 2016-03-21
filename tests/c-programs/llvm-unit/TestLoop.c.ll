; ModuleID = './TestLoop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 %j, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %2, align 4
  ret i32 %5
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %level = alloca i32, align 4
  %i = alloca i32, align 4
  %fval = alloca [4 x i32], align 16
  store i32 0, i32* %1
  store i32 5, i32* %level, align 4
  store i32 3, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %level, align 4
  %7 = sub nsw i32 %6, 1
  %8 = load i32, i32* %level, align 4
  %9 = mul nsw i32 %8, 4
  %10 = load i32, i32* %i, align 4
  %11 = add nsw i32 %9, %10
  %12 = add nsw i32 %11, 1
  %13 = call i32 @foo(i32 %7, i32 %12)
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %fval, i32 0, i64 %15
  store i32 %13, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %5
  %18 = load i32, i32* %i, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, i32* %i, align 4
  br label %2

; <label>:20                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %30, %20
  %22 = load i32, i32* %i, align 4
  %23 = icmp slt i32 %22, 4
  br i1 %23, label %24, label %33

; <label>:24                                      ; preds = %21
  %25 = load i32, i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [4 x i32], [4 x i32]* %fval, i32 0, i64 %26
  %28 = load i32, i32* %27, align 4
  %29 = call i32 @foo(i32 0, i32 %28)
  br label %30

; <label>:30                                      ; preds = %24
  %31 = load i32, i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %21

; <label>:33                                      ; preds = %21
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
