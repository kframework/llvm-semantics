; ModuleID = './DuffsDevice.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum is %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @sum(i16* %to, i16* %from, i32 %count) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i32, align 4
  %n = alloca i32, align 4
  store i16* %to, i16** %1, align 8
  store i16* %from, i16** %2, align 8
  store i32 %count, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = add nsw i32 %4, 7
  %6 = sdiv i32 %5, 8
  store i32 %6, i32* %n, align 4
  %7 = load i32* %3, align 4
  %8 = srem i32 %7, 8
  switch i32 %8, label %95 [
    i32 0, label %9
    i32 7, label %20
    i32 6, label %30
    i32 5, label %40
    i32 4, label %50
    i32 3, label %60
    i32 2, label %70
    i32 1, label %80
  ]

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %90, %9
  %11 = load i16** %2, align 8
  %12 = getelementptr inbounds i16* %11, i32 1
  store i16* %12, i16** %2, align 8
  %13 = load i16* %11, align 2
  %14 = sext i16 %13 to i32
  %15 = load i16** %1, align 8
  %16 = load i16* %15, align 2
  %17 = sext i16 %16 to i32
  %18 = add nsw i32 %17, %14
  %19 = trunc i32 %18 to i16
  store i16 %19, i16* %15, align 2
  br label %20

; <label>:20                                      ; preds = %0, %10
  %21 = load i16** %2, align 8
  %22 = getelementptr inbounds i16* %21, i32 1
  store i16* %22, i16** %2, align 8
  %23 = load i16* %21, align 2
  %24 = sext i16 %23 to i32
  %25 = load i16** %1, align 8
  %26 = load i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = add nsw i32 %27, %24
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %25, align 2
  br label %30

; <label>:30                                      ; preds = %0, %20
  %31 = load i16** %2, align 8
  %32 = getelementptr inbounds i16* %31, i32 1
  store i16* %32, i16** %2, align 8
  %33 = load i16* %31, align 2
  %34 = sext i16 %33 to i32
  %35 = load i16** %1, align 8
  %36 = load i16* %35, align 2
  %37 = sext i16 %36 to i32
  %38 = add nsw i32 %37, %34
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %35, align 2
  br label %40

; <label>:40                                      ; preds = %0, %30
  %41 = load i16** %2, align 8
  %42 = getelementptr inbounds i16* %41, i32 1
  store i16* %42, i16** %2, align 8
  %43 = load i16* %41, align 2
  %44 = sext i16 %43 to i32
  %45 = load i16** %1, align 8
  %46 = load i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = add nsw i32 %47, %44
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* %45, align 2
  br label %50

; <label>:50                                      ; preds = %0, %40
  %51 = load i16** %2, align 8
  %52 = getelementptr inbounds i16* %51, i32 1
  store i16* %52, i16** %2, align 8
  %53 = load i16* %51, align 2
  %54 = sext i16 %53 to i32
  %55 = load i16** %1, align 8
  %56 = load i16* %55, align 2
  %57 = sext i16 %56 to i32
  %58 = add nsw i32 %57, %54
  %59 = trunc i32 %58 to i16
  store i16 %59, i16* %55, align 2
  br label %60

; <label>:60                                      ; preds = %0, %50
  %61 = load i16** %2, align 8
  %62 = getelementptr inbounds i16* %61, i32 1
  store i16* %62, i16** %2, align 8
  %63 = load i16* %61, align 2
  %64 = sext i16 %63 to i32
  %65 = load i16** %1, align 8
  %66 = load i16* %65, align 2
  %67 = sext i16 %66 to i32
  %68 = add nsw i32 %67, %64
  %69 = trunc i32 %68 to i16
  store i16 %69, i16* %65, align 2
  br label %70

; <label>:70                                      ; preds = %0, %60
  %71 = load i16** %2, align 8
  %72 = getelementptr inbounds i16* %71, i32 1
  store i16* %72, i16** %2, align 8
  %73 = load i16* %71, align 2
  %74 = sext i16 %73 to i32
  %75 = load i16** %1, align 8
  %76 = load i16* %75, align 2
  %77 = sext i16 %76 to i32
  %78 = add nsw i32 %77, %74
  %79 = trunc i32 %78 to i16
  store i16 %79, i16* %75, align 2
  br label %80

; <label>:80                                      ; preds = %0, %70
  %81 = load i16** %2, align 8
  %82 = getelementptr inbounds i16* %81, i32 1
  store i16* %82, i16** %2, align 8
  %83 = load i16* %81, align 2
  %84 = sext i16 %83 to i32
  %85 = load i16** %1, align 8
  %86 = load i16* %85, align 2
  %87 = sext i16 %86 to i32
  %88 = add nsw i32 %87, %84
  %89 = trunc i32 %88 to i16
  store i16 %89, i16* %85, align 2
  br label %90

; <label>:90                                      ; preds = %80
  %91 = load i32* %n, align 4
  %92 = add nsw i32 %91, -1
  store i32 %92, i32* %n, align 4
  %93 = icmp sgt i32 %92, 0
  br i1 %93, label %10, label %94

; <label>:94                                      ; preds = %90
  br label %95

; <label>:95                                      ; preds = %94, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %Array = alloca [100 x i16], align 16
  %Sum = alloca i16, align 2
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i16 0, i16* %Sum, align 2
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %i, align 4
  %4 = icmp ne i32 %3, 100
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = trunc i32 %6 to i16
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [100 x i16]* %Array, i32 0, i64 %9
  store i16 %7, i16* %10, align 2
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = getelementptr inbounds [100 x i16]* %Array, i32 0, i32 0
  call void @sum(i16* %Sum, i16* %15, i32 100)
  %16 = load i16* %Sum, align 2
  %17 = sext i16 %16 to i32
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %17)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
