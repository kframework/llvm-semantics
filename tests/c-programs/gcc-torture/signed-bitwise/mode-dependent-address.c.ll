; ModuleID = './mode-dependent-address.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.correct = private unnamed_addr constant [96 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11, i32 8, i32 9, i32 10, i32 11, i32 16, i32 17, i32 18, i32 19, i32 16, i32 17, i32 18, i32 19, i32 24, i32 25, i32 26, i32 27, i32 24, i32 25, i32 26, i32 27, i32 32, i32 33, i32 34, i32 35, i32 32, i32 33, i32 34, i32 35, i32 40, i32 41, i32 42, i32 43, i32 40, i32 41, i32 42, i32 43, i32 48, i32 49, i32 50, i32 51, i32 48, i32 49, i32 50, i32 51, i32 56, i32 57, i32 58, i32 59, i32 56, i32 57, i32 58, i32 59, i32 64, i32 65, i32 66, i32 67, i32 64, i32 65, i32 66, i32 67, i32 72, i32 73, i32 74, i32 75, i32 72, i32 73, i32 74, i32 75, i32 80, i32 81, i32 82, i32 83, i32 80, i32 81, i32 82, i32 83, i32 88, i32 89, i32 90, i32 91, i32 88, i32 89, i32 90, i32 91], align 16
@arg4 = common global [96 x i8] zeroinitializer, align 16
@arg1 = common global [96 x i16] zeroinitializer, align 16
@arg2 = common global [96 x i32] zeroinitializer, align 16
@arg3 = common global [96 x i64] zeroinitializer, align 16
@result = common global [96 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @f883b(i8* %result, i16* noalias %arg1, i32* noalias %arg2, i64* noalias %arg3, i8* noalias %arg4) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i8*, align 8
  %idx = alloca i32, align 4
  store i8* %result, i8** %1, align 8
  store i16* %arg1, i16** %2, align 8
  store i32* %arg2, i32** %3, align 8
  store i64* %arg3, i64** %4, align 8
  store i8* %arg4, i8** %5, align 8
  store i32 0, i32* %idx, align 4
  br label %6

; <label>:6                                       ; preds = %50, %0
  %7 = load i32, i32* %idx, align 4
  %8 = icmp slt i32 %7, 96
  br i1 %8, label %9, label %53

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %idx, align 4
  %11 = sext i32 %10 to i64
  %12 = load i16*, i16** %2, align 8
  %13 = getelementptr inbounds i16, i16* %12, i64 %11
  %14 = load i16, i16* %13, align 2
  %15 = sext i16 %14 to i32
  %16 = icmp slt i32 1, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %9
  br label %25

; <label>:18                                      ; preds = %9
  %19 = load i32, i32* %idx, align 4
  %20 = sext i32 %19 to i64
  %21 = load i16*, i16** %2, align 8
  %22 = getelementptr inbounds i16, i16* %21, i64 %20
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  br label %25

; <label>:25                                      ; preds = %18, %17
  %26 = phi i32 [ 1, %17 ], [ %24, %18 ]
  %27 = load i32, i32* %idx, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32*, i32** %3, align 8
  %30 = getelementptr inbounds i32, i32* %29, i64 %28
  %31 = load i32, i32* %30, align 4
  %32 = and i32 %31, 31
  %33 = ashr i32 %26, %32
  %34 = xor i32 %33, 1
  %35 = sub nsw i32 %34, -32
  %36 = ashr i32 %35, 7
  %37 = or i32 %36, -5
  %38 = sext i32 %37 to i64
  %39 = load i32, i32* %idx, align 4
  %40 = sext i32 %39 to i64
  %41 = load i64*, i64** %4, align 8
  %42 = getelementptr inbounds i64, i64* %41, i64 %40
  %43 = load i64, i64* %42, align 8
  %44 = and i64 %38, %43
  %45 = trunc i64 %44 to i8
  %46 = load i32, i32* %idx, align 4
  %47 = sext i32 %46 to i64
  %48 = load i8*, i8** %1, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 %47
  store i8 %45, i8* %49, align 1
  br label %50

; <label>:50                                      ; preds = %25
  %51 = load i32, i32* %idx, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %idx, align 4
  br label %6

; <label>:53                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %correct = alloca [96 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [96 x i32]* %correct to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([96 x i32]* @main.correct to i8*), i64 384, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %24, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 96
  br i1 %5, label %6, label %27

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %i, align 4
  %8 = trunc i32 %7 to i8
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [96 x i8], [96 x i8]* @arg4, i32 0, i64 %10
  store i8 %8, i8* %11, align 1
  %12 = zext i8 %8 to i16
  %13 = load i32, i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [96 x i16], [96 x i16]* @arg1, i32 0, i64 %14
  store i16 %12, i16* %15, align 2
  %16 = sext i16 %12 to i32
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [96 x i32], [96 x i32]* @arg2, i32 0, i64 %18
  store i32 %16, i32* %19, align 4
  %20 = zext i32 %16 to i64
  %21 = load i32, i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [96 x i64], [96 x i64]* @arg3, i32 0, i64 %22
  store i64 %20, i64* %23, align 8
  br label %24

; <label>:24                                      ; preds = %6
  %25 = load i32, i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %3

; <label>:27                                      ; preds = %3
  call void @f883b(i8* getelementptr inbounds ([96 x i8], [96 x i8]* @result, i32 0, i32 0), i16* getelementptr inbounds ([96 x i16], [96 x i16]* @arg1, i32 0, i32 0), i32* getelementptr inbounds ([96 x i32], [96 x i32]* @arg2, i32 0, i32 0), i64* getelementptr inbounds ([96 x i64], [96 x i64]* @arg3, i32 0, i32 0), i8* getelementptr inbounds ([96 x i8], [96 x i8]* @arg4, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %28

; <label>:28                                      ; preds = %44, %27
  %29 = load i32, i32* %i, align 4
  %30 = icmp slt i32 %29, 96
  br i1 %30, label %31, label %47

; <label>:31                                      ; preds = %28
  %32 = load i32, i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [96 x i8], [96 x i8]* @result, i32 0, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [96 x i32], [96 x i32]* %correct, i32 0, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = icmp ne i32 %36, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %31
  call void @abort() #3
  unreachable

; <label>:43                                      ; preds = %31
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32, i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %28

; <label>:47                                      ; preds = %28
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
