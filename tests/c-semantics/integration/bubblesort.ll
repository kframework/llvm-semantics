; ModuleID = './bubblesort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.arr = private unnamed_addr constant [7 x i32] [i32 -1, i32 2, i32 1, i32 3, i32 5, i32 -10, i32 -11], align 16
@.str = private unnamed_addr constant [23 x i8] c"array before sorting: \00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"array after bubblesort: \00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: nounwind uwtable
define void @bubble_sort(i8* %base, i64 %nmemb, i64 %size, i32 (i8*, i8*)* %compar) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pc = alloca i8*, align 8
  %pc_at_i = alloca i8*, align 8
  %pc_at_j = alloca i8*, align 8
  store i8* %base, i8** %1, align 8
  store i64 %nmemb, i64* %2, align 8
  store i64 %size, i64* %3, align 8
  store i32 (i8*, i8*)* %compar, i32 (i8*, i8*)** %4, align 8
  %5 = load i8** %1, align 8
  store i8* %5, i8** %pc, align 8
  %6 = load i64* %2, align 8
  %7 = sub i64 %6, 1
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %45, %0
  %10 = load i32* %i, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %48

; <label>:12                                      ; preds = %9
  store i32 0, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %41, %12
  %14 = load i32* %j, align 4
  %15 = load i32* %i, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %44

; <label>:17                                      ; preds = %13
  %18 = load i8** %pc, align 8
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load i64* %3, align 8
  %22 = mul i64 %20, %21
  %23 = getelementptr inbounds i8* %18, i64 %22
  store i8* %23, i8** %pc_at_i, align 8
  %24 = load i8** %pc, align 8
  %25 = load i32* %j, align 4
  %26 = sext i32 %25 to i64
  %27 = load i64* %3, align 8
  %28 = mul i64 %26, %27
  %29 = getelementptr inbounds i8* %24, i64 %28
  store i8* %29, i8** %pc_at_j, align 8
  %30 = load i32 (i8*, i8*)** %4, align 8
  %31 = load i8** %pc_at_i, align 8
  %32 = load i8** %pc_at_j, align 8
  %33 = call i32 %30(i8* %31, i8* %32)
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %40

; <label>:35                                      ; preds = %17
  %36 = load i8** %1, align 8
  %37 = load i64* %3, align 8
  %38 = load i32* %i, align 4
  %39 = load i32* %j, align 4
  call void @swap_fun(i8* %36, i64 %37, i32 %38, i32 %39)
  br label %40

; <label>:40                                      ; preds = %35, %17
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %j, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %j, align 4
  br label %13

; <label>:44                                      ; preds = %13
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %i, align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, i32* %i, align 4
  br label %9

; <label>:48                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @swap_fun(i8* %base, i64 %element_size, i32 %index1, i32 %index2) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %pc = alloca i8*, align 8
  %tmp = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %base, i8** %1, align 8
  store i64 %element_size, i64* %2, align 8
  store i32 %index1, i32* %3, align 4
  store i32 %index2, i32* %4, align 4
  %5 = load i8** %1, align 8
  store i8* %5, i8** %pc, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %51, %0
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load i64* %2, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %54

; <label>:11                                      ; preds = %6
  %12 = load i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = load i64* %2, align 8
  %15 = mul i64 %13, %14
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = add i64 %15, %17
  %19 = load i8** %pc, align 8
  %20 = getelementptr inbounds i8* %19, i64 %18
  %21 = load i8* %20, align 1
  store i8 %21, i8* %tmp, align 1
  %22 = load i32* %4, align 4
  %23 = sext i32 %22 to i64
  %24 = load i64* %2, align 8
  %25 = mul i64 %23, %24
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = add i64 %25, %27
  %29 = load i8** %pc, align 8
  %30 = getelementptr inbounds i8* %29, i64 %28
  %31 = load i8* %30, align 1
  %32 = load i32* %3, align 4
  %33 = sext i32 %32 to i64
  %34 = load i64* %2, align 8
  %35 = mul i64 %33, %34
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = add i64 %35, %37
  %39 = load i8** %pc, align 8
  %40 = getelementptr inbounds i8* %39, i64 %38
  store i8 %31, i8* %40, align 1
  %41 = load i8* %tmp, align 1
  %42 = load i32* %4, align 4
  %43 = sext i32 %42 to i64
  %44 = load i64* %2, align 8
  %45 = mul i64 %43, %44
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = add i64 %45, %47
  %49 = load i8** %pc, align 8
  %50 = getelementptr inbounds i8* %49, i64 %48
  store i8 %41, i8* %50, align 1
  br label %51

; <label>:51                                      ; preds = %11
  %52 = load i32* %i, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %i, align 4
  br label %6

; <label>:54                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @int_cmp_fun(i8* %v1, i8* %v2) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %i1 = alloca i32*, align 8
  %i2 = alloca i32*, align 8
  %result = alloca i32, align 4
  store i8* %v1, i8** %1, align 8
  store i8* %v2, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to i32*
  store i32* %4, i32** %i1, align 8
  %5 = load i8** %2, align 8
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %i2, align 8
  %7 = load i32** %i1, align 8
  %8 = load i32* %7, align 4
  %9 = load i32** %i2, align 8
  %10 = load i32* %9, align 4
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 0, i32* %result, align 4
  br label %22

; <label>:13                                      ; preds = %0
  %14 = load i32** %i1, align 8
  %15 = load i32* %14, align 4
  %16 = load i32** %i2, align 8
  %17 = load i32* %16, align 4
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %13
  store i32 -1, i32* %result, align 4
  br label %21

; <label>:20                                      ; preds = %13
  store i32 1, i32* %result, align 4
  br label %21

; <label>:21                                      ; preds = %20, %19
  br label %22

; <label>:22                                      ; preds = %21, %12
  %23 = load i32* %result, align 4
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arr = alloca [7 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [7 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([7 x i32]* @main.arr to i8*), i64 28, i32 16, i1 false)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %4 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  call void @print_int_arr(i32* %4, i64 7)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0))
  %6 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  %7 = bitcast i32* %6 to i8*
  call void @bubble_sort(i8* %7, i64 7, i64 4, i32 (i8*, i8*)* @int_cmp_fun)
  %8 = getelementptr inbounds [7 x i32]* %arr, i32 0, i32 0
  call void @print_int_arr(i32* %8, i64 7)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal void @print_int_arr(i32* %arr, i64 %size_of_arr) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i32* %arr, i32** %1, align 8
  store i64 %size_of_arr, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = load i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = load i64* %2, align 8
  %7 = icmp ult i64 %5, %6
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %3
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32** %1, align 8
  %12 = getelementptr inbounds i32* %11, i64 %10
  %13 = load i32* %12, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %13)
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %3

; <label>:18                                      ; preds = %3
  %19 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @putchar(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
