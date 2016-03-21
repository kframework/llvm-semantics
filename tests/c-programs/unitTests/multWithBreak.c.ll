; ModuleID = './multWithBreak.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.arr1 = private unnamed_addr constant [6 x i32] [i32 1, i32 2, i32 3, i32 0, i32 4, i32 5], align 16
@main.arr2 = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %product1 = alloca i32, align 4
  %product2 = alloca i32, align 4
  %arr1 = alloca [6 x i32], align 16
  %arr2 = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %product1, align 4
  store i32 1, i32* %product2, align 4
  %2 = bitcast [6 x i32]* %arr1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([6 x i32]* @main.arr1 to i8*), i64 24, i32 16, i1 false)
  %3 = bitcast [5 x i32]* %arr2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([5 x i32]* @main.arr2 to i8*), i64 20, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %18, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 6
  br i1 %6, label %7, label %21

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [6 x i32], [6 x i32]* %arr1, i32 0, i64 %9
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %product1, align 4
  %13 = mul nsw i32 %12, %11
  store i32 %13, i32* %product1, align 4
  %14 = load i32, i32* %product1, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %7
  br label %21

; <label>:17                                      ; preds = %7
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32, i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %4

; <label>:21                                      ; preds = %16, %4
  store i32 0, i32* %i1, align 4
  br label %22

; <label>:22                                      ; preds = %32, %21
  %23 = load i32, i32* %i1, align 4
  %24 = icmp slt i32 %23, 5
  br i1 %24, label %25, label %35

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* %i1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [5 x i32], [5 x i32]* %arr2, i32 0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = load i32, i32* %product2, align 4
  %31 = mul nsw i32 %30, %29
  store i32 %31, i32* %product2, align 4
  br label %32

; <label>:32                                      ; preds = %25
  %33 = load i32, i32* %i1, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i1, align 4
  br label %22

; <label>:35                                      ; preds = %22
  %36 = load i32, i32* %product1, align 4
  %37 = load i32, i32* %product2, align 4
  %38 = add nsw i32 %36, %37
  ret i32 %38
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
