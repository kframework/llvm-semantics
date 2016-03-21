; ModuleID = './binarySearch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Couldn't find %d in array:\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"a[%d] = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"present_val == a[found_at]\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"looking for %d, \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"found %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"BUG present_val == a[found_at]\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @binary_search(i32* %a, i32 %low, i32 %high, i32 %target) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %origLow = alloca i32, align 4
  %origHigh = alloca i32, align 4
  %middle = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %2, align 8
  store i32 %low, i32* %3, align 4
  store i32 %high, i32* %4, align 4
  store i32 %target, i32* %5, align 4
  %6 = load i32, i32* %3, align 4
  store i32 %6, i32* %origLow, align 4
  %7 = load i32, i32* %4, align 4
  store i32 %7, i32* %origHigh, align 4
  br label %8

; <label>:8                                       ; preds = %43, %0
  %9 = load i32, i32* %3, align 4
  %10 = load i32, i32* %4, align 4
  %11 = icmp sle i32 %9, %10
  br i1 %11, label %12, label %44

; <label>:12                                      ; preds = %8
  %13 = load i32, i32* %3, align 4
  %14 = load i32, i32* %4, align 4
  %15 = load i32, i32* %3, align 4
  %16 = sub nsw i32 %14, %15
  %17 = sdiv i32 %16, 2
  %18 = add nsw i32 %13, %17
  store i32 %18, i32* %middle, align 4
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %middle, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32*, i32** %2, align 8
  %23 = getelementptr inbounds i32, i32* %22, i64 %21
  %24 = load i32, i32* %23, align 4
  %25 = icmp slt i32 %19, %24
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %12
  %27 = load i32, i32* %middle, align 4
  %28 = sub nsw i32 %27, 1
  store i32 %28, i32* %4, align 4
  br label %43

; <label>:29                                      ; preds = %12
  %30 = load i32, i32* %5, align 4
  %31 = load i32, i32* %middle, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32*, i32** %2, align 8
  %34 = getelementptr inbounds i32, i32* %33, i64 %32
  %35 = load i32, i32* %34, align 4
  %36 = icmp sgt i32 %30, %35
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %29
  %38 = load i32, i32* %middle, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %3, align 4
  br label %42

; <label>:40                                      ; preds = %29
  %41 = load i32, i32* %middle, align 4
  store i32 %41, i32* %1
  br label %64

; <label>:42                                      ; preds = %37
  br label %43

; <label>:43                                      ; preds = %42, %26
  br label %8

; <label>:44                                      ; preds = %8
  %45 = load i32, i32* %5, align 4
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i32 %45)
  %47 = load i32, i32* %origLow, align 4
  store i32 %47, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %60, %44
  %49 = load i32, i32* %i, align 4
  %50 = load i32, i32* %origHigh, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %63

; <label>:52                                      ; preds = %48
  %53 = load i32, i32* %i, align 4
  %54 = load i32, i32* %i, align 4
  %55 = sext i32 %54 to i64
  %56 = load i32*, i32** %2, align 8
  %57 = getelementptr inbounds i32, i32* %56, i64 %55
  %58 = load i32, i32* %57, align 4
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 %53, i32 %58)
  br label %60

; <label>:60                                      ; preds = %52
  %61 = load i32, i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %48

; <label>:63                                      ; preds = %48
  store i32 -1, i32* %1
  br label %64

; <label>:64                                      ; preds = %63, %40
  %65 = load i32, i32* %1
  ret i32 %65
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @insertion_sort(i32* %a, i32 %length) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %a, i32** %1, align 8
  store i32 %length, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %48, %0
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %51

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load i32*, i32** %1, align 8
  %11 = getelementptr inbounds i32, i32* %10, i64 %9
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %v, align 4
  %13 = load i32, i32* %i, align 4
  %14 = sub nsw i32 %13, 1
  store i32 %14, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %38, %7
  %16 = load i32, i32* %j, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %41

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %j, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32*, i32** %1, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 %20
  %23 = load i32, i32* %22, align 4
  %24 = load i32, i32* %v, align 4
  %25 = icmp sle i32 %23, %24
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %18
  br label %41

; <label>:27                                      ; preds = %18
  %28 = load i32, i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32*, i32** %1, align 8
  %31 = getelementptr inbounds i32, i32* %30, i64 %29
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %j, align 4
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load i32*, i32** %1, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 %35
  store i32 %32, i32* %37, align 4
  br label %38

; <label>:38                                      ; preds = %27
  %39 = load i32, i32* %j, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, i32* %j, align 4
  br label %15

; <label>:41                                      ; preds = %26, %15
  %42 = load i32, i32* %v, align 4
  %43 = load i32, i32* %j, align 4
  %44 = add nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = load i32*, i32** %1, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 %45
  store i32 %42, i32* %47, align 4
  br label %48

; <label>:48                                      ; preds = %41
  %49 = load i32, i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %3

; <label>:51                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %num_elements = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  %present_val = alloca i32, align 4
  %found_at = alloca i32, align 4
  store i32 0, i32* %1
  store i32 15, i32* %num_elements, align 4
  %2 = load i32, i32* %num_elements, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 4
  %5 = call noalias i8* @malloc(i64 %4) #3
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %a, align 8
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %30, %0
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %num_elements, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %33

; <label>:11                                      ; preds = %7
  br label %12

; <label>:12                                      ; preds = %20, %11
  %13 = call i32 @rand() #3
  %14 = load i32, i32* %num_elements, align 4
  %15 = srem i32 %13, %14
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32*, i32** %a, align 8
  %19 = getelementptr inbounds i32, i32* %18, i64 %17
  store i32 %15, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %12
  %21 = load i32, i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32*, i32** %a, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 %22
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %num_elements, align 4
  %27 = sdiv i32 %26, 7
  %28 = icmp eq i32 %25, %27
  br i1 %28, label %12, label %29

; <label>:29                                      ; preds = %20
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32, i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %7

; <label>:33                                      ; preds = %7
  %34 = load i32*, i32** %a, align 8
  %35 = load i32, i32* %num_elements, align 4
  call void @insertion_sort(i32* %34, i32 %35)
  store i32 0, i32* %i, align 4
  br label %36

; <label>:36                                      ; preds = %72, %33
  %37 = load i32, i32* %i, align 4
  %38 = icmp slt i32 %37, 10
  br i1 %38, label %39, label %75

; <label>:39                                      ; preds = %36
  %40 = call i32 @rand() #3
  %41 = load i32, i32* %num_elements, align 4
  %42 = srem i32 %40, %41
  %43 = sext i32 %42 to i64
  %44 = load i32*, i32** %a, align 8
  %45 = getelementptr inbounds i32, i32* %44, i64 %43
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %present_val, align 4
  %47 = load i32*, i32** %a, align 8
  %48 = load i32, i32* %num_elements, align 4
  %49 = sub nsw i32 %48, 1
  %50 = load i32, i32* %present_val, align 4
  %51 = call i32 @binary_search(i32* %47, i32 0, i32 %49, i32 %50)
  store i32 %51, i32* %found_at, align 4
  %52 = load i32, i32* %present_val, align 4
  %53 = load i32, i32* %found_at, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32*, i32** %a, align 8
  %56 = getelementptr inbounds i32, i32* %55, i64 %54
  %57 = load i32, i32* %56, align 4
  %58 = icmp eq i32 %52, %57
  br i1 %58, label %59, label %61

; <label>:59                                      ; preds = %39
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i32 0, i32 0))
  br label %71

; <label>:61                                      ; preds = %39
  %62 = load i32, i32* %present_val, align 4
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0), i32 %62)
  %64 = load i32, i32* %found_at, align 4
  %65 = sext i32 %64 to i64
  %66 = load i32*, i32** %a, align 8
  %67 = getelementptr inbounds i32, i32* %66, i64 %65
  %68 = load i32, i32* %67, align 4
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 %68)
  %70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i32 0, i32 0))
  br label %71

; <label>:71                                      ; preds = %61, %59
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load i32, i32* %i, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %i, align 4
  br label %36

; <label>:75                                      ; preds = %36
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i32 @rand() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
