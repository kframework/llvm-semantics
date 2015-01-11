; ModuleID = './pr42006.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @func_4(i32 0)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @func_4(i32 %p_6) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %count = alloca i32, align 4
  store i32 %p_6, i32* %2, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %2, align 4
  br label %3

; <label>:3                                       ; preds = %18, %0
  %4 = load i32* %2, align 4
  %5 = icmp ult i32 %4, 3
  br i1 %5, label %6, label %21

; <label>:6                                       ; preds = %3
  %7 = load i32* %count, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %count, align 4
  %9 = icmp sgt i32 %7, 1
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %6
  %12 = load i32* %2, align 4
  %13 = load i32* %2, align 4
  %14 = call i32 @my_shift(i32 %12, i32 %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11
  store i32 0, i32* %1
  br label %22

; <label>:17                                      ; preds = %11
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32* %2, align 4
  %20 = call i32 @my_add(i32 %19, i32 1)
  store i32 %20, i32* %2, align 4
  br label %3

; <label>:21                                      ; preds = %3
  store i32 0, i32* %1
  br label %22

; <label>:22                                      ; preds = %21, %16
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal i32 @my_shift(i32 %left, i32 %right) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %left, i32* %1, align 4
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp ugt i32 %3, 100
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = lshr i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define internal i32 @my_add(i32 %si1, i32 %si2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 50, %4
  %6 = icmp ugt i32 %3, %5
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  br label %13

; <label>:9                                       ; preds = %0
  %10 = load i32* %1, align 4
  %11 = load i32* %2, align 4
  %12 = add i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %9, %7
  %14 = phi i32 [ %8, %7 ], [ %12, %9 ]
  ret i32 %14
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
