; ModuleID = './test50.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = common global [10 x [20 x i32]] zeroinitializer, align 16
@b = global [20 x i32]* getelementptr inbounds ([10 x [20 x i32]], [10 x [20 x i32]]* @a, i32 0, i32 0), align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %c = alloca i32*, align 8
  store i32 0, i32* %sum, align 4
  %1 = load [20 x i32]*, [20 x i32]** @b, align 8
  %2 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i64 1
  %3 = getelementptr inbounds [20 x i32], [20 x i32]* %2, i32 0, i32 0
  store i32* %3, i32** %c, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %14, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 20
  br i1 %6, label %7, label %17

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = mul nsw i32 %8, 2
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32*, i32** %c, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 %11
  store i32 %9, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %7
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %4

; <label>:17                                      ; preds = %4
  store i32 5, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %28, %17
  %19 = load i32, i32* %i, align 4
  %20 = icmp slt i32 %19, 15
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %18
  %22 = load i32, i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20 x i32], [20 x i32]* getelementptr inbounds ([10 x [20 x i32]], [10 x [20 x i32]]* @a, i32 0, i64 1), i32 0, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %sum, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %sum, align 4
  br label %28

; <label>:28                                      ; preds = %21
  %29 = load i32, i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %18

; <label>:31                                      ; preds = %18
  %32 = load i32, i32* %sum, align 4
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %zz = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @f()
  store i32 %4, i32* %zz, align 4
  %5 = load i32, i32* %zz, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
