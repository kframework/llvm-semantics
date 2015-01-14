; ModuleID = './fib.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %x, align 4
  %2 = call i32 @fib(i32 10)
  %3 = load i32* %x, align 4
  %4 = add i32 %3, %2
  store i32 %4, i32* %x, align 4
  %5 = call i32 @fastfib(i32 10)
  %6 = load i32* %x, align 4
  %7 = add i32 %6, %5
  store i32 %7, i32* %x, align 4
  %8 = call i32 @fastfib_v2(i32 10)
  %9 = load i32* %x, align 4
  %10 = add i32 %9, %8
  store i32 %10, i32* %x, align 4
  %11 = load i32* %x, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ult i32 %2, 2
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  br label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = sub i32 %7, 1
  %9 = call i32 @fib(i32 %8)
  %10 = load i32* %1, align 4
  %11 = sub i32 %10, 2
  %12 = call i32 @fib(i32 %11)
  %13 = add i32 %9, %12
  br label %14

; <label>:14                                      ; preds = %6, %4
  %15 = phi i32 [ %5, %4 ], [ %13, %6 ]
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @fastfib(i32 %n) #0 {
  %1 = alloca i32, align 4
  %a = alloca [3 x i32], align 4
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  store i32* %2, i32** %p, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %58, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %1, align 4
  %6 = icmp ule i32 %4, %5
  br i1 %6, label %7, label %61

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = icmp ult i32 %8, 2
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = load i32** %p, align 8
  store i32 %11, i32* %12, align 4
  br label %49

; <label>:13                                      ; preds = %7
  %14 = load i32** %p, align 8
  %15 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %16 = icmp eq i32* %14, %15
  br i1 %16, label %17, label %26

; <label>:17                                      ; preds = %13
  %18 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %19 = getelementptr inbounds i32* %18, i64 1
  %20 = load i32* %19, align 4
  %21 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %22 = getelementptr inbounds i32* %21, i64 2
  %23 = load i32* %22, align 4
  %24 = add i32 %20, %23
  %25 = load i32** %p, align 8
  store i32 %24, i32* %25, align 4
  br label %48

; <label>:26                                      ; preds = %13
  %27 = load i32** %p, align 8
  %28 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %29 = getelementptr inbounds i32* %28, i64 1
  %30 = icmp eq i32* %27, %29
  br i1 %30, label %31, label %39

; <label>:31                                      ; preds = %26
  %32 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %33 = load i32* %32, align 4
  %34 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %35 = getelementptr inbounds i32* %34, i64 2
  %36 = load i32* %35, align 4
  %37 = add i32 %33, %36
  %38 = load i32** %p, align 8
  store i32 %37, i32* %38, align 4
  br label %47

; <label>:39                                      ; preds = %26
  %40 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %41 = load i32* %40, align 4
  %42 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %43 = getelementptr inbounds i32* %42, i64 1
  %44 = load i32* %43, align 4
  %45 = add i32 %41, %44
  %46 = load i32** %p, align 8
  store i32 %45, i32* %46, align 4
  br label %47

; <label>:47                                      ; preds = %39, %31
  br label %48

; <label>:48                                      ; preds = %47, %17
  br label %49

; <label>:49                                      ; preds = %48, %10
  %50 = load i32** %p, align 8
  %51 = getelementptr inbounds i32* %50, i32 1
  store i32* %51, i32** %p, align 8
  %52 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %53 = getelementptr inbounds i32* %52, i64 2
  %54 = icmp ugt i32* %51, %53
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %49
  %56 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  store i32* %56, i32** %p, align 8
  br label %57

; <label>:57                                      ; preds = %55, %49
  br label %58

; <label>:58                                      ; preds = %57
  %59 = load i32* %i, align 4
  %60 = add i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %3

; <label>:61                                      ; preds = %3
  %62 = load i32** %p, align 8
  %63 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %64 = icmp eq i32* %62, %63
  br i1 %64, label %65, label %69

; <label>:65                                      ; preds = %61
  %66 = load i32** %p, align 8
  %67 = getelementptr inbounds i32* %66, i64 2
  %68 = load i32* %67, align 4
  br label %73

; <label>:69                                      ; preds = %61
  %70 = load i32** %p, align 8
  %71 = getelementptr inbounds i32* %70, i64 -1
  %72 = load i32* %71, align 4
  br label %73

; <label>:73                                      ; preds = %69, %65
  %74 = phi i32 [ %68, %65 ], [ %72, %69 ]
  ret i32 %74
}

; Function Attrs: nounwind uwtable
define i32 @fastfib_v2(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %n0 = alloca i32, align 4
  %n1 = alloca i32, align 4
  %naux = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  store i32 0, i32* %n0, align 4
  store i32 1, i32* %n1, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %23

; <label>:6                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %18, %6
  %8 = load i32* %i, align 4
  %9 = load i32* %2, align 4
  %10 = sub i32 %9, 1
  %11 = icmp ult i32 %8, %10
  br i1 %11, label %12, label %21

; <label>:12                                      ; preds = %7
  %13 = load i32* %n1, align 4
  store i32 %13, i32* %naux, align 4
  %14 = load i32* %n0, align 4
  %15 = load i32* %n1, align 4
  %16 = add i32 %14, %15
  store i32 %16, i32* %n1, align 4
  %17 = load i32* %naux, align 4
  store i32 %17, i32* %n0, align 4
  br label %18

; <label>:18                                      ; preds = %12
  %19 = load i32* %i, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %7

; <label>:21                                      ; preds = %7
  %22 = load i32* %n1, align 4
  store i32 %22, i32* %1
  br label %23

; <label>:23                                      ; preds = %21, %5
  %24 = load i32* %1
  ret i32 %24
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
