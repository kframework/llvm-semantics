; ModuleID = './quicksort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"SUCCESS\00", align 1

; Function Attrs: nounwind uwtable
define void @insertion_sort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %base, i8** %1, align 8
  store i64 %num_elements, i64* %2, align 8
  store i64 %element_size, i64* %3, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %4, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %36, %0
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load i64* %2, align 8
  %9 = icmp ult i64 %7, %8
  br i1 %9, label %10, label %39

; <label>:10                                      ; preds = %5
  %11 = load i32* %i, align 4
  %12 = sub nsw i32 %11, 1
  store i32 %12, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %32, %10
  %14 = load i32* %j, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %35

; <label>:16                                      ; preds = %13
  %17 = load i8** %1, align 8
  %18 = load i64* %3, align 8
  %19 = load i32* %j, align 4
  %20 = load i32* %j, align 4
  %21 = add nsw i32 %20, 1
  %22 = load i32 (i8*, i8*)** %4, align 8
  %23 = call i32 @compare_elements_helper(i8* %17, i64 %18, i32 %19, i32 %21, i32 (i8*, i8*)* %22)
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %16
  br label %35

; <label>:26                                      ; preds = %16
  %27 = load i8** %1, align 8
  %28 = load i64* %3, align 8
  %29 = load i32* %j, align 4
  %30 = load i32* %j, align 4
  %31 = add nsw i32 %30, 1
  call void @exchange_elements_helper(i8* %27, i64 %28, i32 %29, i32 %31)
  br label %32

; <label>:32                                      ; preds = %26
  %33 = load i32* %j, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, i32* %j, align 4
  br label %13

; <label>:35                                      ; preds = %25, %13
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %5

; <label>:39                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @compare_elements_helper(i8* %base, i64 %element_size, i32 %idx1, i32 %idx2, i32 (i8*, i8*)* %comparer) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32 (i8*, i8*)*, align 8
  %base_bytes = alloca i8*, align 8
  store i8* %base, i8** %1, align 8
  store i64 %element_size, i64* %2, align 8
  store i32 %idx1, i32* %3, align 4
  store i32 %idx2, i32* %4, align 4
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %5, align 8
  %6 = load i8** %1, align 8
  store i8* %6, i8** %base_bytes, align 8
  %7 = load i32 (i8*, i8*)** %5, align 8
  %8 = load i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = load i64* %2, align 8
  %11 = mul i64 %9, %10
  %12 = load i8** %base_bytes, align 8
  %13 = getelementptr inbounds i8* %12, i64 %11
  %14 = load i32* %4, align 4
  %15 = sext i32 %14 to i64
  %16 = load i64* %2, align 8
  %17 = mul i64 %15, %16
  %18 = load i8** %base_bytes, align 8
  %19 = getelementptr inbounds i8* %18, i64 %17
  %20 = call i32 %7(i8* %13, i8* %19)
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define internal void @exchange_elements_helper(i8* %base, i64 %element_size, i32 %idx1, i32 %idx2) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %base_bytes = alloca i8*, align 8
  %i = alloca i32, align 4
  %temp = alloca i8, align 1
  store i8* %base, i8** %1, align 8
  store i64 %element_size, i64* %2, align 8
  store i32 %idx1, i32* %3, align 4
  store i32 %idx2, i32* %4, align 4
  %5 = load i8** %1, align 8
  store i8* %5, i8** %base_bytes, align 8
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
  %19 = load i8** %base_bytes, align 8
  %20 = getelementptr inbounds i8* %19, i64 %18
  %21 = load i8* %20, align 1
  store i8 %21, i8* %temp, align 1
  %22 = load i32* %4, align 4
  %23 = sext i32 %22 to i64
  %24 = load i64* %2, align 8
  %25 = mul i64 %23, %24
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = add i64 %25, %27
  %29 = load i8** %base_bytes, align 8
  %30 = getelementptr inbounds i8* %29, i64 %28
  %31 = load i8* %30, align 1
  %32 = load i32* %3, align 4
  %33 = sext i32 %32 to i64
  %34 = load i64* %2, align 8
  %35 = mul i64 %33, %34
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = add i64 %35, %37
  %39 = load i8** %base_bytes, align 8
  %40 = getelementptr inbounds i8* %39, i64 %38
  store i8 %31, i8* %40, align 1
  %41 = load i8* %temp, align 1
  %42 = load i32* %4, align 4
  %43 = sext i32 %42 to i64
  %44 = load i64* %2, align 8
  %45 = mul i64 %43, %44
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = add i64 %45, %47
  %49 = load i8** %base_bytes, align 8
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
define i32 @partition(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer, i32 %pivotIndex) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32 (i8*, i8*)*, align 8
  %5 = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  store i8* %base, i8** %1, align 8
  store i64 %num_elements, i64* %2, align 8
  store i64 %element_size, i64* %3, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %4, align 8
  store i32 %pivotIndex, i32* %5, align 4
  store i32 0, i32* %low, align 4
  %6 = load i64* %2, align 8
  %7 = sub i64 %6, 1
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %high, align 4
  %9 = load i8** %1, align 8
  %10 = load i64* %3, align 8
  %11 = load i64* %2, align 8
  %12 = sub i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = load i32* %5, align 4
  call void @exchange_elements_helper(i8* %9, i64 %10, i32 %13, i32 %14)
  br label %15

; <label>:15                                      ; preds = %0, %61
  br label %16

; <label>:16                                      ; preds = %34, %15
  %17 = load i8** %1, align 8
  %18 = load i64* %3, align 8
  %19 = load i32* %low, align 4
  %20 = load i64* %2, align 8
  %21 = sub i64 %20, 1
  %22 = trunc i64 %21 to i32
  %23 = load i32 (i8*, i8*)** %4, align 8
  %24 = call i32 @compare_elements_helper(i8* %17, i64 %18, i32 %19, i32 %22, i32 (i8*, i8*)* %23)
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %16
  %27 = load i32* %low, align 4
  %28 = sext i32 %27 to i64
  %29 = load i64* %2, align 8
  %30 = sub i64 %29, 1
  %31 = icmp ult i64 %28, %30
  br label %32

; <label>:32                                      ; preds = %26, %16
  %33 = phi i1 [ false, %16 ], [ %31, %26 ]
  br i1 %33, label %34, label %37

; <label>:34                                      ; preds = %32
  %35 = load i32* %low, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %low, align 4
  br label %16

; <label>:37                                      ; preds = %32
  br label %38

; <label>:38                                      ; preds = %53, %37
  %39 = load i8** %1, align 8
  %40 = load i64* %3, align 8
  %41 = load i32* %high, align 4
  %42 = load i64* %2, align 8
  %43 = sub i64 %42, 1
  %44 = trunc i64 %43 to i32
  %45 = load i32 (i8*, i8*)** %4, align 8
  %46 = call i32 @compare_elements_helper(i8* %39, i64 %40, i32 %41, i32 %44, i32 (i8*, i8*)* %45)
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %51, label %48

; <label>:48                                      ; preds = %38
  %49 = load i32* %high, align 4
  %50 = icmp sgt i32 %49, 0
  br label %51

; <label>:51                                      ; preds = %48, %38
  %52 = phi i1 [ false, %38 ], [ %50, %48 ]
  br i1 %52, label %53, label %56

; <label>:53                                      ; preds = %51
  %54 = load i32* %high, align 4
  %55 = add nsw i32 %54, -1
  store i32 %55, i32* %high, align 4
  br label %38

; <label>:56                                      ; preds = %51
  %57 = load i32* %low, align 4
  %58 = load i32* %high, align 4
  %59 = icmp sge i32 %57, %58
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %56
  br label %66

; <label>:61                                      ; preds = %56
  %62 = load i8** %1, align 8
  %63 = load i64* %3, align 8
  %64 = load i32* %low, align 4
  %65 = load i32* %high, align 4
  call void @exchange_elements_helper(i8* %62, i64 %63, i32 %64, i32 %65)
  br label %15

; <label>:66                                      ; preds = %60
  %67 = load i8** %1, align 8
  %68 = load i64* %3, align 8
  %69 = load i32* %low, align 4
  %70 = load i64* %2, align 8
  %71 = sub i64 %70, 1
  %72 = trunc i64 %71 to i32
  call void @exchange_elements_helper(i8* %67, i64 %68, i32 %69, i32 %72)
  %73 = load i32* %low, align 4
  ret i32 %73
}

; Function Attrs: nounwind uwtable
define void @quicksort(i8* %base, i64 %num_elements, i64 %element_size, i32 (i8*, i8*)* %comparer) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32 (i8*, i8*)*, align 8
  %pivotIndex = alloca i32, align 4
  store i8* %base, i8** %1, align 8
  store i64 %num_elements, i64* %2, align 8
  store i64 %element_size, i64* %3, align 8
  store i32 (i8*, i8*)* %comparer, i32 (i8*, i8*)** %4, align 8
  %5 = load i64* %2, align 8
  %6 = icmp ult i64 %5, 2
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load i8** %1, align 8
  %9 = load i64* %2, align 8
  %10 = load i64* %3, align 8
  %11 = load i32 (i8*, i8*)** %4, align 8
  call void @insertion_sort(i8* %8, i64 %9, i64 %10, i32 (i8*, i8*)* %11)
  br label %43

; <label>:12                                      ; preds = %0
  %13 = call i32 @rand() #3
  %14 = sext i32 %13 to i64
  %15 = load i64* %2, align 8
  %16 = urem i64 %14, %15
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %pivotIndex, align 4
  %18 = load i8** %1, align 8
  %19 = load i64* %2, align 8
  %20 = load i64* %3, align 8
  %21 = load i32 (i8*, i8*)** %4, align 8
  %22 = load i32* %pivotIndex, align 4
  %23 = call i32 @partition(i8* %18, i64 %19, i64 %20, i32 (i8*, i8*)* %21, i32 %22)
  store i32 %23, i32* %pivotIndex, align 4
  %24 = load i8** %1, align 8
  %25 = load i32* %pivotIndex, align 4
  %26 = sext i32 %25 to i64
  %27 = load i64* %3, align 8
  %28 = load i32 (i8*, i8*)** %4, align 8
  call void @quicksort(i8* %24, i64 %26, i64 %27, i32 (i8*, i8*)* %28)
  %29 = load i8** %1, align 8
  %30 = load i64* %3, align 8
  %31 = load i32* %pivotIndex, align 4
  %32 = add nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = mul i64 %30, %33
  %35 = getelementptr inbounds i8* %29, i64 %34
  %36 = load i64* %2, align 8
  %37 = load i32* %pivotIndex, align 4
  %38 = add nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = sub i64 %36, %39
  %41 = load i64* %3, align 8
  %42 = load i32 (i8*, i8*)** %4, align 8
  call void @quicksort(i8* %35, i64 %40, i64 %41, i32 (i8*, i8*)* %42)
  br label %43

; <label>:43                                      ; preds = %12, %7
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define i32 @compare_int(i8* %left, i8* %right) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %left, i8** %1, align 8
  store i8* %right, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = load i8** %2, align 8
  %7 = bitcast i8* %6 to i32*
  %8 = load i32* %7, align 4
  %9 = sub nsw i32 %5, %8
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %size = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 8, i32* %size, align 4
  %2 = load i32* %size, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 4, %3
  %5 = call noalias i8* @malloc(i64 %4) #3
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %a, align 8
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %19, %0
  %8 = load i32* %i, align 4
  %9 = load i32* %size, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %7
  %12 = call i32 @rand() #3
  %13 = load i32* %size, align 4
  %14 = srem i32 %12, %13
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32** %a, align 8
  %18 = getelementptr inbounds i32* %17, i64 %16
  store i32 %14, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %11
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %7

; <label>:22                                      ; preds = %7
  %23 = load i32** %a, align 8
  %24 = bitcast i32* %23 to i8*
  %25 = load i32* %size, align 4
  %26 = sext i32 %25 to i64
  call void @quicksort(i8* %24, i64 %26, i64 4, i32 (i8*, i8*)* @compare_int)
  store i32 1, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %47, %22
  %28 = load i32* %i, align 4
  %29 = load i32* %size, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %50

; <label>:31                                      ; preds = %27
  %32 = load i32* %i, align 4
  %33 = sub nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = load i32** %a, align 8
  %36 = getelementptr inbounds i32* %35, i64 %34
  %37 = load i32* %36, align 4
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32** %a, align 8
  %41 = getelementptr inbounds i32* %40, i64 %39
  %42 = load i32* %41, align 4
  %43 = icmp sle i32 %37, %42
  br i1 %43, label %46, label %44

; <label>:44                                      ; preds = %31
  %45 = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %1
  br label %52

; <label>:46                                      ; preds = %31
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %27

; <label>:50                                      ; preds = %27
  %51 = call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  store i32 0, i32* %1
  br label %52

; <label>:52                                      ; preds = %50, %44
  %53 = load i32* %1
  ret i32 %53
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @puts(i8*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
