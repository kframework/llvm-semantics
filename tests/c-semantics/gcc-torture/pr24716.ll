; ModuleID = './pr24716.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@Link = global [1 x i32] [i32 -1], align 4
@W = global [1 x i32] [i32 2], align 4

; Function Attrs: nounwind uwtable
define i32 @f(i32 %k, i32 %p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %pdest = alloca i32, align 4
  %j = alloca i32, align 4
  %D1361 = alloca i32, align 4
  store i32 %k, i32* %1, align 4
  store i32 %p, i32* %2, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %pdest, align 4
  br label %3

; <label>:3                                       ; preds = %77, %0
  %4 = load i32* %pdest, align 4
  %5 = icmp sgt i32 %4, 2
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  br label %7

; <label>:7                                       ; preds = %12, %6
  %8 = load i32* %j, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, i32* %j, align 4
  %10 = load i32* %pdest, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %pdest, align 4
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i32* %j, align 4
  %14 = icmp sgt i32 %13, 2
  br i1 %14, label %7, label %15

; <label>:15                                      ; preds = %12
  br label %16

; <label>:16                                      ; preds = %15, %3
  %17 = load i32* %j, align 4
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  br label %78

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %32, %20
  %22 = load i32* %pdest, align 4
  %23 = load i32* %2, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %33

; <label>:25                                      ; preds = %21
  %26 = load i32* %j, align 4
  %27 = load i32* %2, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %25
  %30 = load i32* %pdest, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %pdest, align 4
  br label %32

; <label>:32                                      ; preds = %29, %25
  br label %21

; <label>:33                                      ; preds = %21
  br label %34

; <label>:34                                      ; preds = %51, %33
  %35 = load i32* %1, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1 x i32]* @W, i32 0, i64 %36
  %38 = load i32* %37, align 4
  store i32 %38, i32* %D1361, align 4
  br label %39

; <label>:39                                      ; preds = %47, %34
  %40 = load i32* %D1361, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %46

; <label>:42                                      ; preds = %39
  store i32 1, i32* %pdest, align 4
  store i32 0, i32* %D1361, align 4
  %43 = load i32* %1, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1 x i32]* @W, i32 0, i64 %44
  store i32 0, i32* %45, align 4
  br label %46

; <label>:46                                      ; preds = %42, %39
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32* %2, align 4
  %49 = icmp slt i32 %48, 1
  br i1 %49, label %39, label %50

; <label>:50                                      ; preds = %47
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %1, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %34, label %54

; <label>:54                                      ; preds = %51
  br label %55

; <label>:55                                      ; preds = %74, %54
  store i32 0, i32* %2, align 4
  %56 = load i32* %1, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1 x i32]* @Link, i32 0, i64 %57
  %59 = load i32* %58, align 4
  store i32 %59, i32* %1, align 4
  br label %60

; <label>:60                                      ; preds = %72, %55
  %61 = load i32* %2, align 4
  %62 = load i32* %j, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %73

; <label>:64                                      ; preds = %60
  %65 = load i32* %1, align 4
  %66 = icmp ne i32 %65, -1
  br i1 %66, label %67, label %72

; <label>:67                                      ; preds = %64
  %68 = load i32* %pdest, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %pdest, align 4
  %70 = load i32* %2, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %2, align 4
  br label %72

; <label>:72                                      ; preds = %67, %64
  br label %60

; <label>:73                                      ; preds = %60
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load i32* %1, align 4
  %76 = icmp ne i32 %75, -1
  br i1 %76, label %55, label %77

; <label>:77                                      ; preds = %74
  store i32 1, i32* %j, align 4
  br label %3

; <label>:78                                      ; preds = %19
  %79 = load i32* %pdest, align 4
  ret i32 %79
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 0, i32 2)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
