; ModuleID = './higherOrder.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arr = alloca [5 x i32], align 16
  %res = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [5 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([5 x i32]* @main.arr to i8*), i64 20, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x i32]* %arr, i32 0, i32 0
  %4 = call i32 @fold(i32* %3, i32 5, i32 0, i32 (i32, i32)* @sum)
  store i32 %4, i32* %res, align 4
  %5 = load i32* %res, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @fold(i32* %arr, i32 %length, i32 %start, i32 (i32, i32)* %f) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32 (i32, i32)*, align 8
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %arr, i32** %1, align 8
  store i32 %length, i32* %2, align 4
  store i32 %start, i32* %3, align 4
  store i32 (i32, i32)* %f, i32 (i32, i32)** %4, align 8
  %5 = load i32* %3, align 4
  store i32 %5, i32* %res, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %19, %0
  %7 = load i32* %i, align 4
  %8 = load i32* %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %22

; <label>:10                                      ; preds = %6
  %11 = load i32 (i32, i32)** %4, align 8
  %12 = load i32* %res, align 4
  %13 = load i32** %1, align 8
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32* %13, i64 %15
  %17 = load i32* %16, align 4
  %18 = call i32 %11(i32 %12, i32 %17)
  store i32 %18, i32* %res, align 4
  br label %19

; <label>:19                                      ; preds = %10
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %6

; <label>:22                                      ; preds = %6
  %23 = load i32* %res, align 4
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @sum(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add nsw i32 %3, %4
  ret i32 %5
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
