; ModuleID = './badidx.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %y = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8
  %8 = getelementptr inbounds i8** %7, i64 1
  %9 = load i8** %8, align 8
  %10 = call i32 @atoi(i8* %9) #4
  br label %12

; <label>:11                                      ; preds = %0
  br label %12

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 1, %11 ]
  store i32 %13, i32* %n, align 4
  %14 = load i32* %n, align 4
  %15 = sext i32 %14 to i64
  %16 = call noalias i8* @calloc(i64 %15, i64 4) #5
  %17 = bitcast i8* %16 to i32*
  store i32* %17, i32** %y, align 8
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %30, %12
  %19 = load i32* %i, align 4
  %20 = load i32* %n, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %18
  %23 = load i32* %i, align 4
  %24 = load i32* %i, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32** %y, align 8
  %29 = getelementptr inbounds i32* %28, i64 %27
  store i32 %25, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %22
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %18

; <label>:33                                      ; preds = %18
  %34 = load i32* %n, align 4
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = load i32** %y, align 8
  %38 = getelementptr inbounds i32* %37, i64 %36
  %39 = load i32* %38, align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %39)
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
