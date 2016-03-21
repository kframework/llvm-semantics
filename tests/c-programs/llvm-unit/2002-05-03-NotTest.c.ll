; ModuleID = './2002-05-03-NotTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"Bitwise Not: %d %d %d %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"Boolean Not: %d %d %d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @testBitWiseNot(i32 %A, i32 %B, i32 %C, i32 %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %A, i32* %1, align 4
  store i32 %B, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  store i32 %D, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  %6 = xor i32 %5, -1
  %7 = load i32, i32* %2, align 4
  %8 = xor i32 %7, -1
  %9 = load i32, i32* %3, align 4
  %10 = xor i32 %9, -1
  %11 = load i32, i32* %4, align 4
  %12 = xor i32 %11, -1
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 %6, i32 %8, i32 %10, i32 %12)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @testBooleanNot(i32 %A, i32 %B, i32 %C, i32 %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %A, i32* %1, align 4
  store i32 %B, i32* %2, align 4
  store i32 %C, i32* %3, align 4
  store i32 %D, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %2, align 4
  %9 = icmp sgt i32 %8, 0
  br label %10

; <label>:10                                      ; preds = %7, %0
  %11 = phi i1 [ false, %0 ], [ %9, %7 ]
  %12 = xor i1 %11, true
  %13 = zext i1 %12 to i32
  %14 = load i32, i32* %1, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %10
  %17 = load i32, i32* %3, align 4
  %18 = icmp sgt i32 %17, 0
  br label %19

; <label>:19                                      ; preds = %16, %10
  %20 = phi i1 [ false, %10 ], [ %18, %16 ]
  %21 = xor i1 %20, true
  %22 = zext i1 %21 to i32
  %23 = load i32, i32* %1, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %19
  %26 = load i32, i32* %4, align 4
  %27 = icmp sgt i32 %26, 0
  br label %28

; <label>:28                                      ; preds = %25, %19
  %29 = phi i1 [ false, %19 ], [ %27, %25 ]
  %30 = xor i1 %29, true
  %31 = zext i1 %30 to i32
  %32 = load i32, i32* %2, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %37

; <label>:34                                      ; preds = %28
  %35 = load i32, i32* %3, align 4
  %36 = icmp sgt i32 %35, 0
  br label %37

; <label>:37                                      ; preds = %34, %28
  %38 = phi i1 [ false, %28 ], [ %36, %34 ]
  %39 = xor i1 %38, true
  %40 = zext i1 %39 to i32
  %41 = load i32, i32* %2, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %37
  %44 = load i32, i32* %4, align 4
  %45 = icmp sgt i32 %44, 0
  br label %46

; <label>:46                                      ; preds = %43, %37
  %47 = phi i1 [ false, %37 ], [ %45, %43 ]
  %48 = xor i1 %47, true
  %49 = zext i1 %48 to i32
  %50 = load i32, i32* %3, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %55

; <label>:52                                      ; preds = %46
  %53 = load i32, i32* %4, align 4
  %54 = icmp sgt i32 %53, 0
  br label %55

; <label>:55                                      ; preds = %52, %46
  %56 = phi i1 [ false, %46 ], [ %54, %52 ]
  %57 = xor i1 %56, true
  %58 = zext i1 %57 to i32
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 %13, i32 %22, i32 %31, i32 %40, i32 %49, i32 %58)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @testBitWiseNot(i32 1, i32 2, i32 -3, i32 5)
  call void @testBooleanNot(i32 1, i32 2, i32 -3, i32 5)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
