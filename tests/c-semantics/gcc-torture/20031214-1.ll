; ModuleID = './20031214-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { double, [2 x i32] }

@g = global %struct.anon { double 0.000000e+00, [2 x i32] [i32 1, i32 2] }, align 8
@k = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @b(i32* %j) #0 {
  %1 = alloca i32*, align 8
  store i32* %j, i32** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %21, %0
  %3 = load i32* %j, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %2
  %6 = load i32* @k, align 4
  %7 = load i32* %j, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32]* getelementptr inbounds (%struct.anon* @g, i32 0, i32 1), i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = icmp sgt i32 %6, %10
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %5
  %13 = load i32* @k, align 4
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x i32]* getelementptr inbounds (%struct.anon* @g, i32 0, i32 1), i32 0, i64 %16
  %18 = load i32* %17, align 4
  br label %19

; <label>:19                                      ; preds = %14, %12
  %20 = phi i32 [ %13, %12 ], [ %18, %14 ]
  store i32 %20, i32* @k, align 4
  br label %21

; <label>:21                                      ; preds = %19
  %22 = load i32* %j, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %j, align 4
  br label %2

; <label>:24                                      ; preds = %2
  %25 = load i32* @k, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* @k, align 4
  call void @b(i32* %j)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
