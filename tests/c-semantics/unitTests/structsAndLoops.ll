; ModuleID = './structsAndLoops.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.gfc_array_i4 = type { i32*, i32, [7 x %struct.descriptor_dimension] }
%struct.descriptor_dimension = type { i32, i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.rdata = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@main.adata = private unnamed_addr constant [9 x i32] [i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13], align 16

; Function Attrs: nounwind uwtable
define void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %pdim) #0 {
  %1 = alloca %struct.gfc_array_i4*, align 8
  %2 = alloca %struct.gfc_array_i4*, align 8
  %3 = alloca i32*, align 8
  %count = alloca [7 x i32], align 16
  %extent = alloca [7 x i32], align 16
  %dest = alloca i32*, align 8
  %base = alloca i32*, align 8
  %dim = alloca i32, align 4
  %n = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i32, align 4
  store %struct.gfc_array_i4* %retarray, %struct.gfc_array_i4** %1, align 8
  store %struct.gfc_array_i4* %array, %struct.gfc_array_i4** %2, align 8
  store i32* %pdim, i32** %3, align 8
  %4 = load i32** %3, align 8
  %5 = load i32* %4, align 4
  %6 = sub nsw i32 %5, 1
  store i32 %6, i32* %dim, align 4
  %7 = load i32* %dim, align 4
  %8 = sext i32 %7 to i64
  %9 = load %struct.gfc_array_i4** %2, align 8
  %10 = getelementptr inbounds %struct.gfc_array_i4* %9, i32 0, i32 2
  %11 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %10, i32 0, i64 %8
  %12 = getelementptr inbounds %struct.descriptor_dimension* %11, i32 0, i32 2
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %13, 1
  %15 = load i32* %dim, align 4
  %16 = sext i32 %15 to i64
  %17 = load %struct.gfc_array_i4** %2, align 8
  %18 = getelementptr inbounds %struct.gfc_array_i4* %17, i32 0, i32 2
  %19 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %18, i32 0, i64 %16
  %20 = getelementptr inbounds %struct.descriptor_dimension* %19, i32 0, i32 1
  %21 = load i32* %20, align 4
  %22 = sub nsw i32 %14, %21
  store i32 %22, i32* %len, align 4
  store i32 0, i32* %n, align 4
  br label %23

; <label>:23                                      ; preds = %50, %0
  %24 = load i32* %n, align 4
  %25 = load i32* %dim, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %53

; <label>:27                                      ; preds = %23
  %28 = load i32* %n, align 4
  %29 = sext i32 %28 to i64
  %30 = load %struct.gfc_array_i4** %2, align 8
  %31 = getelementptr inbounds %struct.gfc_array_i4* %30, i32 0, i32 2
  %32 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %31, i32 0, i64 %29
  %33 = getelementptr inbounds %struct.descriptor_dimension* %32, i32 0, i32 2
  %34 = load i32* %33, align 4
  %35 = add nsw i32 %34, 1
  %36 = load i32* %n, align 4
  %37 = sext i32 %36 to i64
  %38 = load %struct.gfc_array_i4** %2, align 8
  %39 = getelementptr inbounds %struct.gfc_array_i4* %38, i32 0, i32 2
  %40 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %39, i32 0, i64 %37
  %41 = getelementptr inbounds %struct.descriptor_dimension* %40, i32 0, i32 1
  %42 = load i32* %41, align 4
  %43 = sub nsw i32 %35, %42
  %44 = load i32* %n, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [7 x i32]* %extent, i32 0, i64 %45
  store i32 %43, i32* %46, align 4
  %47 = load i32* %n, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 %48
  store i32 0, i32* %49, align 4
  br label %50

; <label>:50                                      ; preds = %27
  %51 = load i32* %n, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %n, align 4
  br label %23

; <label>:53                                      ; preds = %23
  %54 = load %struct.gfc_array_i4** %1, align 8
  %55 = getelementptr inbounds %struct.gfc_array_i4* %54, i32 0, i32 0
  %56 = load i32** %55, align 8
  store i32* %56, i32** %dest, align 8
  %57 = load %struct.gfc_array_i4** %2, align 8
  %58 = getelementptr inbounds %struct.gfc_array_i4* %57, i32 0, i32 0
  %59 = load i32** %58, align 8
  store i32* %59, i32** %base, align 8
  %60 = load i32** %dest, align 8
  %61 = load i32* %60, align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %61)
  br label %63

; <label>:63                                      ; preds = %86, %53
  store i32 0, i32* %result, align 4
  store i32 0, i32* %n, align 4
  br label %64

; <label>:64                                      ; preds = %73, %63
  %65 = load i32* %n, align 4
  %66 = load i32* %len, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %78

; <label>:68                                      ; preds = %64
  %69 = load i32** %base, align 8
  %70 = load i32* %69, align 4
  %71 = load i32* %result, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, i32* %result, align 4
  br label %73

; <label>:73                                      ; preds = %68
  %74 = load i32* %n, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %n, align 4
  %76 = load i32** %base, align 8
  %77 = getelementptr inbounds i32* %76, i32 1
  store i32* %77, i32** %base, align 8
  br label %64

; <label>:78                                      ; preds = %64
  %79 = load i32* %result, align 4
  %80 = load i32** %dest, align 8
  store i32 %79, i32* %80, align 4
  %81 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 0
  %82 = load i32* %81, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %81, align 4
  %84 = load i32** %dest, align 8
  %85 = getelementptr inbounds i32* %84, i64 1
  store i32* %85, i32** %dest, align 8
  br label %86

; <label>:86                                      ; preds = %78
  %87 = getelementptr inbounds [7 x i32]* %count, i32 0, i64 0
  %88 = load i32* %87, align 4
  %89 = getelementptr inbounds [7 x i32]* %extent, i32 0, i64 0
  %90 = load i32* %89, align 4
  %91 = icmp ne i32 %88, %90
  br i1 %91, label %63, label %92

; <label>:92                                      ; preds = %86
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %rdata = alloca [3 x i32], align 4
  %adata = alloca [9 x i32], align 16
  %retarray = alloca %struct.gfc_array_i4, align 8
  %array = alloca %struct.gfc_array_i4, align 8
  %dim = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [3 x i32]* %rdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([3 x i32]* @main.rdata to i8*), i64 12, i32 4, i1 false)
  %3 = bitcast [9 x i32]* %adata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([9 x i32]* @main.adata to i8*), i64 36, i32 16, i1 false)
  %4 = bitcast %struct.gfc_array_i4* %retarray to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 96, i32 8, i1 false)
  %5 = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 0
  %6 = getelementptr inbounds [3 x i32]* %rdata, i32 0, i32 0
  store i32* %6, i32** %5, align 8
  %7 = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 1
  store i32 265, i32* %7, align 4
  %8 = getelementptr inbounds %struct.gfc_array_i4* %retarray, i32 0, i32 2
  %9 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %8, i64 0, i64 0
  %10 = getelementptr inbounds %struct.descriptor_dimension* %9, i32 0, i32 0
  store i32 1, i32* %10, align 4
  %11 = getelementptr inbounds %struct.descriptor_dimension* %9, i32 0, i32 1
  store i32 1, i32* %11, align 4
  %12 = getelementptr inbounds %struct.descriptor_dimension* %9, i32 0, i32 2
  store i32 3, i32* %12, align 4
  %13 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 0
  %14 = getelementptr inbounds [9 x i32]* %adata, i32 0, i32 0
  store i32* %14, i32** %13, align 8
  %15 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 1
  store i32 266, i32* %15, align 4
  %16 = getelementptr inbounds %struct.gfc_array_i4* %array, i32 0, i32 2
  %17 = getelementptr inbounds [7 x %struct.descriptor_dimension]* %16, i64 0, i64 0
  %18 = getelementptr inbounds %struct.descriptor_dimension* %17, i32 0, i32 0
  store i32 1, i32* %18, align 4
  %19 = getelementptr inbounds %struct.descriptor_dimension* %17, i32 0, i32 1
  store i32 1, i32* %19, align 4
  %20 = getelementptr inbounds %struct.descriptor_dimension* %17, i32 0, i32 2
  store i32 3, i32* %20, align 4
  %21 = getelementptr inbounds %struct.descriptor_dimension* %17, i64 1
  %22 = getelementptr inbounds %struct.descriptor_dimension* %21, i32 0, i32 0
  store i32 3, i32* %22, align 4
  %23 = getelementptr inbounds %struct.descriptor_dimension* %21, i32 0, i32 1
  store i32 1, i32* %23, align 4
  %24 = getelementptr inbounds %struct.descriptor_dimension* %21, i32 0, i32 2
  store i32 3, i32* %24, align 4
  %25 = getelementptr inbounds %struct.descriptor_dimension* %21, i64 1
  %26 = getelementptr inbounds %struct.descriptor_dimension* %17, i64 7
  br label %27

; <label>:27                                      ; preds = %27, %0
  %28 = phi %struct.descriptor_dimension* [ %25, %0 ], [ %30, %27 ]
  %29 = bitcast %struct.descriptor_dimension* %28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 12, i32 4, i1 false)
  %30 = getelementptr inbounds %struct.descriptor_dimension* %28, i64 1
  %31 = icmp eq %struct.descriptor_dimension* %30, %26
  br i1 %31, label %32, label %27

; <label>:32                                      ; preds = %27
  store i32 2, i32* %dim, align 4
  call void @msum_i4(%struct.gfc_array_i4* %retarray, %struct.gfc_array_i4* %array, i32* %dim)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
