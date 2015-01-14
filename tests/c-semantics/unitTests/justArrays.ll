; ModuleID = './justArrays.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.y = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], align 16
@main.z = private unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16
@main.w = private unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 0, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [9 x i32], align 16
  %y = alloca [2 x [2 x i32]], align 16
  %z = alloca [2 x [2 x [2 x i32]]], align 16
  %w = alloca [2 x [2 x [2 x i32]]], align 16
  store i32 0, i32* %1
  %2 = bitcast [9 x i32]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 36, i32 16, i1 false)
  %3 = bitcast i8* %2 to [9 x i32]*
  %4 = getelementptr [9 x i32]* %3, i32 0, i32 4
  store i32 10, i32* %4
  %5 = getelementptr [9 x i32]* %3, i32 0, i32 5
  store i32 11, i32* %5
  %6 = getelementptr [9 x i32]* %3, i32 0, i32 6
  store i32 12, i32* %6
  %7 = getelementptr [9 x i32]* %3, i32 0, i32 8
  store i32 14, i32* %7
  %8 = bitcast [2 x [2 x i32]]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast ([2 x [2 x i32]]* @main.y to i8*), i64 16, i32 16, i1 false)
  %9 = bitcast [2 x [2 x [2 x i32]]]* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* bitcast ([2 x [2 x [2 x i32]]]* @main.z to i8*), i64 32, i32 16, i1 false)
  %10 = bitcast [2 x [2 x [2 x i32]]]* %w to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast ([2 x [2 x [2 x i32]]]* @main.w to i8*), i64 32, i32 16, i1 false)
  %11 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 8
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 7
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 0
  %15 = getelementptr inbounds [2 x i32]* %14, i32 0, i64 1
  %16 = load i32* %15, align 4
  %17 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 1
  %18 = getelementptr inbounds [2 x i32]* %17, i32 0, i64 0
  store i32 %16, i32* %18, align 4
  %19 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 1
  %20 = getelementptr inbounds [2 x [2 x i32]]* %19, i32 0, i64 0
  %21 = getelementptr inbounds [2 x i32]* %20, i32 0, i64 1
  %22 = load i32* %21, align 4
  %23 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 0
  %24 = getelementptr inbounds [2 x [2 x i32]]* %23, i32 0, i64 1
  %25 = getelementptr inbounds [2 x i32]* %24, i32 0, i64 0
  store i32 %22, i32* %25, align 4
  %26 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 1
  %27 = getelementptr inbounds [2 x [2 x i32]]* %26, i32 0, i64 0
  %28 = getelementptr inbounds [2 x i32]* %27, i32 0, i64 1
  %29 = load i32* %28, align 4
  %30 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 0
  %31 = getelementptr inbounds [2 x [2 x i32]]* %30, i32 0, i64 1
  %32 = getelementptr inbounds [2 x i32]* %31, i32 0, i64 0
  store i32 %29, i32* %32, align 4
  %33 = getelementptr inbounds [9 x i32]* %x, i32 0, i64 7
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 14
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %0
  store i32 1, i32* %1
  br label %58

; <label>:37                                      ; preds = %0
  %38 = getelementptr inbounds [2 x [2 x i32]]* %y, i32 0, i64 1
  %39 = getelementptr inbounds [2 x i32]* %38, i32 0, i64 0
  %40 = load i32* %39, align 4
  %41 = icmp ne i32 %40, 2
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %37
  store i32 2, i32* %1
  br label %58

; <label>:43                                      ; preds = %37
  %44 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %z, i32 0, i64 0
  %45 = getelementptr inbounds [2 x [2 x i32]]* %44, i32 0, i64 1
  %46 = getelementptr inbounds [2 x i32]* %45, i32 0, i64 0
  %47 = load i32* %46, align 4
  %48 = icmp ne i32 %47, 6
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %43
  store i32 3, i32* %1
  br label %58

; <label>:50                                      ; preds = %43
  %51 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %w, i32 0, i64 0
  %52 = getelementptr inbounds [2 x [2 x i32]]* %51, i32 0, i64 1
  %53 = getelementptr inbounds [2 x i32]* %52, i32 0, i64 0
  %54 = load i32* %53, align 4
  %55 = icmp ne i32 %54, 6
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %50
  store i32 4, i32* %1
  br label %58

; <label>:57                                      ; preds = %50
  store i32 0, i32* %1
  br label %58

; <label>:58                                      ; preds = %57, %56, %49, %42, %36
  %59 = load i32* %1
  ret i32 %59
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
