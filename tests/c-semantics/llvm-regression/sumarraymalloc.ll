; ModuleID = './sumarraymalloc.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum1 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"Sum2 = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %size = alloca i32, align 4
  %MyArray = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %12

; <label>:7                                       ; preds = %0
  %8 = load i8*** %3, align 8
  %9 = getelementptr inbounds i8** %8, i64 1
  %10 = load i8** %9, align 8
  %11 = call i32 @atoi(i8* %10) #4
  br label %12

; <label>:12                                      ; preds = %7, %6
  %13 = phi i32 [ 10, %6 ], [ %11, %7 ]
  store i32 %13, i32* %size, align 4
  %14 = load i32* %size, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 4, %15
  %17 = call noalias i8* @malloc(i64 %16) #5
  %18 = bitcast i8* %17 to i32*
  store i32* %18, i32** %MyArray, align 8
  %19 = load i32** %MyArray, align 8
  %20 = load i32* %size, align 4
  call void @FillArray(i32* %19, i32 %20)
  %21 = load i32** %MyArray, align 8
  %22 = call i32 @SumArray(i32* %21, i32 10)
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %22)
  %24 = load i32** %MyArray, align 8
  %25 = call i32 @SumArray2(i32* %24, i32 10)
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %25)
  %27 = load i32** %MyArray, align 8
  %28 = bitcast i32* %27 to i8*
  call void @free(i8* %28) #5
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define internal void @FillArray(i32* %Array, i32 %Num) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %Array, i32** %1, align 8
  store i32 %Num, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp ult i32 %4, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = load i32* %i, align 4
  %10 = zext i32 %9 to i64
  %11 = load i32** %1, align 8
  %12 = getelementptr inbounds i32* %11, i64 %10
  store i32 %8, i32* %12, align 4
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i32* %i, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  ret void
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define internal i32 @SumArray(i32* %Array, i32 %Num) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %Result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %Array, i32** %1, align 8
  store i32 %Num, i32* %2, align 4
  store i32 0, i32* %Result, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp ult i32 %4, %5
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = zext i32 %8 to i64
  %10 = load i32** %1, align 8
  %11 = getelementptr inbounds i32* %10, i64 %9
  %12 = load i32* %11, align 4
  %13 = load i32* %Result, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, i32* %Result, align 4
  br label %15

; <label>:15                                      ; preds = %7
  %16 = load i32* %i, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %3

; <label>:18                                      ; preds = %3
  %19 = load i32* %Result, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define internal i32 @SumArray2(i32* %Array, i32 %Num) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %Result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %Array, i32** %1, align 8
  store i32 %Num, i32* %2, align 4
  store i32 0, i32* %Result, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp ult i32 %4, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %3
  %8 = load i32** %1, align 8
  %9 = getelementptr inbounds i32* %8, i32 1
  store i32* %9, i32** %1, align 8
  %10 = load i32* %8, align 4
  %11 = load i32* %Result, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, i32* %Result, align 4
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i32* %i, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  %17 = load i32* %Result, align 4
  ret i32 %17
}

; Function Attrs: nounwind
declare void @free(i8*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
