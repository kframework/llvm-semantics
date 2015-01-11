; ModuleID = './duffsDevice.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: src=%d, dest=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %count = alloca i32, align 4
  %src = alloca i32*, align 8
  %dest = alloca i32*, align 8
  %origSrc = alloca i32*, align 8
  %origDest = alloca i32*, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 101, i32* %count, align 4
  %2 = load i32* %count, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 4
  %5 = call noalias i8* @malloc(i64 %4) #3
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %src, align 8
  %7 = load i32* %count, align 4
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 4
  %10 = call noalias i8* @malloc(i64 %9) #3
  %11 = bitcast i8* %10 to i32*
  store i32* %11, i32** %dest, align 8
  %12 = load i32** %src, align 8
  store i32* %12, i32** %origSrc, align 8
  %13 = load i32** %dest, align 8
  store i32* %13, i32** %origDest, align 8
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %30, %0
  %15 = load i32* %i, align 4
  %16 = load i32* %count, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %33

; <label>:18                                      ; preds = %14
  %19 = load i32* %i, align 4
  %20 = mul nsw i32 %19, 2
  %21 = add nsw i32 %20, 1
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32** %src, align 8
  %25 = getelementptr inbounds i32* %24, i64 %23
  store i32 %21, i32* %25, align 4
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32** %dest, align 8
  %29 = getelementptr inbounds i32* %28, i64 %27
  store i32 0, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %18
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %14

; <label>:33                                      ; preds = %14
  %34 = load i32* %count, align 4
  %35 = add nsw i32 %34, 7
  %36 = sdiv i32 %35, 8
  store i32 %36, i32* %n, align 4
  %37 = load i32* %count, align 4
  %38 = srem i32 %37, 8
  switch i32 %38, label %93 [
    i32 0, label %39
    i32 7, label %46
    i32 6, label %52
    i32 5, label %58
    i32 4, label %64
    i32 3, label %70
    i32 2, label %76
    i32 1, label %82
  ]

; <label>:39                                      ; preds = %33
  br label %40

; <label>:40                                      ; preds = %88, %39
  %41 = load i32** %src, align 8
  %42 = getelementptr inbounds i32* %41, i32 1
  store i32* %42, i32** %src, align 8
  %43 = load i32* %41, align 4
  %44 = load i32** %dest, align 8
  %45 = getelementptr inbounds i32* %44, i32 1
  store i32* %45, i32** %dest, align 8
  store i32 %43, i32* %44, align 4
  br label %46

; <label>:46                                      ; preds = %33, %40
  %47 = load i32** %src, align 8
  %48 = getelementptr inbounds i32* %47, i32 1
  store i32* %48, i32** %src, align 8
  %49 = load i32* %47, align 4
  %50 = load i32** %dest, align 8
  %51 = getelementptr inbounds i32* %50, i32 1
  store i32* %51, i32** %dest, align 8
  store i32 %49, i32* %50, align 4
  br label %52

; <label>:52                                      ; preds = %33, %46
  %53 = load i32** %src, align 8
  %54 = getelementptr inbounds i32* %53, i32 1
  store i32* %54, i32** %src, align 8
  %55 = load i32* %53, align 4
  %56 = load i32** %dest, align 8
  %57 = getelementptr inbounds i32* %56, i32 1
  store i32* %57, i32** %dest, align 8
  store i32 %55, i32* %56, align 4
  br label %58

; <label>:58                                      ; preds = %33, %52
  %59 = load i32** %src, align 8
  %60 = getelementptr inbounds i32* %59, i32 1
  store i32* %60, i32** %src, align 8
  %61 = load i32* %59, align 4
  %62 = load i32** %dest, align 8
  %63 = getelementptr inbounds i32* %62, i32 1
  store i32* %63, i32** %dest, align 8
  store i32 %61, i32* %62, align 4
  br label %64

; <label>:64                                      ; preds = %33, %58
  %65 = load i32** %src, align 8
  %66 = getelementptr inbounds i32* %65, i32 1
  store i32* %66, i32** %src, align 8
  %67 = load i32* %65, align 4
  %68 = load i32** %dest, align 8
  %69 = getelementptr inbounds i32* %68, i32 1
  store i32* %69, i32** %dest, align 8
  store i32 %67, i32* %68, align 4
  br label %70

; <label>:70                                      ; preds = %33, %64
  %71 = load i32** %src, align 8
  %72 = getelementptr inbounds i32* %71, i32 1
  store i32* %72, i32** %src, align 8
  %73 = load i32* %71, align 4
  %74 = load i32** %dest, align 8
  %75 = getelementptr inbounds i32* %74, i32 1
  store i32* %75, i32** %dest, align 8
  store i32 %73, i32* %74, align 4
  br label %76

; <label>:76                                      ; preds = %33, %70
  %77 = load i32** %src, align 8
  %78 = getelementptr inbounds i32* %77, i32 1
  store i32* %78, i32** %src, align 8
  %79 = load i32* %77, align 4
  %80 = load i32** %dest, align 8
  %81 = getelementptr inbounds i32* %80, i32 1
  store i32* %81, i32** %dest, align 8
  store i32 %79, i32* %80, align 4
  br label %82

; <label>:82                                      ; preds = %33, %76
  %83 = load i32** %src, align 8
  %84 = getelementptr inbounds i32* %83, i32 1
  store i32* %84, i32** %src, align 8
  %85 = load i32* %83, align 4
  %86 = load i32** %dest, align 8
  %87 = getelementptr inbounds i32* %86, i32 1
  store i32* %87, i32** %dest, align 8
  store i32 %85, i32* %86, align 4
  br label %88

; <label>:88                                      ; preds = %82
  %89 = load i32* %n, align 4
  %90 = add nsw i32 %89, -1
  store i32 %90, i32* %n, align 4
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %40, label %92

; <label>:92                                      ; preds = %88
  br label %93

; <label>:93                                      ; preds = %92, %33
  store i32 0, i32* %i1, align 4
  br label %94

; <label>:94                                      ; preds = %111, %93
  %95 = load i32* %i1, align 4
  %96 = load i32* %count, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %114

; <label>:98                                      ; preds = %94
  %99 = load i32* %i1, align 4
  %100 = load i32* %i1, align 4
  %101 = sext i32 %100 to i64
  %102 = load i32** %origSrc, align 8
  %103 = getelementptr inbounds i32* %102, i64 %101
  %104 = load i32* %103, align 4
  %105 = load i32* %i1, align 4
  %106 = sext i32 %105 to i64
  %107 = load i32** %origDest, align 8
  %108 = getelementptr inbounds i32* %107, i64 %106
  %109 = load i32* %108, align 4
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %99, i32 %104, i32 %109)
  br label %111

; <label>:111                                     ; preds = %98
  %112 = load i32* %i1, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %i1, align 4
  br label %94

; <label>:114                                     ; preds = %94
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
