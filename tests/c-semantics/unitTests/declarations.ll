; ModuleID = './declarations.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s1 = type { [2 x %struct.point], [2 x %struct.s3] }
%struct.point = type { i32, i32 }
%struct.s3 = type { [3 x %struct.s4] }
%struct.s4 = type { i32, i32 }
%struct.s2 = type { %struct.s1, %struct.s1 }
%struct.that = type { %struct.str }
%struct.str = type { [2 x i32 ()*], [2 x [2 x i32 ()*]] }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %retval = alloca i32, align 4
  %w = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32**, align 8
  %z = alloca i32, align 4
  %d1 = alloca [2 x i32], align 4
  %d2 = alloca [2 x [2 x i32]], align 16
  %d3 = alloca [2 x [2 x [2 x i32]]], align 16
  %funcpt = alloca i32 ()*, align 8
  %funcArr = alloca [2 x i32 ()*], align 16
  %funcArr2D = alloca [2 x [2 x i32 ()*]], align 16
  %funArrofArr = alloca [2 x i32* (i32*)*], align 16
  %mys1 = alloca %struct.s1, align 4
  %mys2 = alloca %struct.s2, align 4
  %t = alloca %struct.that, align 8
  store i32 0, i32* %1
  store i32 0, i32* %retval, align 4
  store i32* %w, i32** %x, align 8
  %2 = load i32** %x, align 8
  store i32 5, i32* %2, align 4
  store i32** %x, i32*** %y, align 8
  %3 = load i32*** %y, align 8
  %4 = load i32** %3, align 8
  %5 = load i32* %4, align 4
  store i32 %5, i32* %z, align 4
  store i32 ()* @main, i32 ()** %funcpt, align 8
  %6 = getelementptr inbounds [2 x i32]* %d1, i32 0, i64 0
  store i32 5, i32* %6, align 4
  %7 = getelementptr inbounds [2 x [2 x i32]]* %d2, i32 0, i64 0
  %8 = getelementptr inbounds [2 x i32]* %7, i32 0, i64 0
  store i32 5, i32* %8, align 4
  %9 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %d3, i32 0, i64 0
  %10 = getelementptr inbounds [2 x [2 x i32]]* %9, i32 0, i64 0
  %11 = getelementptr inbounds [2 x i32]* %10, i32 0, i64 0
  store i32 5, i32* %11, align 4
  %12 = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  store i32 ()* @main, i32 ()** %12, align 8
  %13 = getelementptr inbounds [2 x [2 x i32 ()*]]* %funcArr2D, i32 0, i64 0
  %14 = getelementptr inbounds [2 x i32 ()*]* %13, i32 0, i64 0
  store i32 ()* @main, i32 ()** %14, align 8
  %15 = getelementptr inbounds [2 x i32* (i32*)*]* %funArrofArr, i32 0, i64 0
  store i32* (i32*)* @f, i32* (i32*)** %15, align 8
  %16 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %17 = getelementptr inbounds [2 x %struct.point]* %16, i32 0, i64 0
  %18 = getelementptr inbounds %struct.point* %17, i32 0, i32 0
  store i32 5, i32* %18, align 4
  %19 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %20 = getelementptr inbounds [2 x %struct.point]* %19, i32 0, i64 0
  %21 = getelementptr inbounds %struct.point* %20, i32 0, i32 1
  store i32 -5, i32* %21, align 4
  %22 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %23 = getelementptr inbounds [2 x %struct.point]* %22, i32 0, i64 1
  %24 = getelementptr inbounds %struct.point* %23, i32 0, i32 0
  store i32 10, i32* %24, align 4
  %25 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %26 = getelementptr inbounds [2 x %struct.point]* %25, i32 0, i64 1
  %27 = getelementptr inbounds %struct.point* %26, i32 0, i32 1
  store i32 -10, i32* %27, align 4
  %28 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %29 = bitcast %struct.s1* %28 to i8*
  %30 = bitcast %struct.s1* %mys1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 64, i32 4, i1 false)
  %31 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 1
  %32 = bitcast %struct.s1* %31 to i8*
  %33 = bitcast %struct.s1* %mys1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 64, i32 4, i1 false)
  %34 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %35 = getelementptr inbounds [2 x %struct.point]* %34, i32 0, i64 0
  %36 = getelementptr inbounds %struct.point* %35, i32 0, i32 0
  store i32 30, i32* %36, align 4
  %37 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %38 = getelementptr inbounds [2 x %struct.point]* %37, i32 0, i64 1
  %39 = getelementptr inbounds %struct.point* %38, i32 0, i32 1
  store i32 30, i32* %39, align 4
  %40 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %41 = getelementptr inbounds %struct.s1* %40, i32 0, i32 0
  %42 = getelementptr inbounds [2 x %struct.point]* %41, i32 0, i64 0
  %43 = getelementptr inbounds %struct.point* %42, i32 0, i32 0
  %44 = load i32* %43, align 4
  %45 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %46 = getelementptr inbounds %struct.s1* %45, i32 0, i32 0
  %47 = getelementptr inbounds [2 x %struct.point]* %46, i32 0, i64 1
  %48 = getelementptr inbounds %struct.point* %47, i32 0, i32 1
  %49 = load i32* %48, align 4
  %50 = add nsw i32 %44, %49
  %51 = load i32* %retval, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, i32* %retval, align 4
  %53 = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  %54 = load i32 ()** %53, align 8
  %55 = getelementptr inbounds %struct.that* %t, i32 0, i32 0
  %56 = getelementptr inbounds %struct.str* %55, i32 0, i32 0
  %57 = getelementptr inbounds [2 x i32 ()*]* %56, i32 0, i64 0
  store i32 ()* %54, i32 ()** %57, align 8
  %58 = load i32* %retval, align 4
  ret i32 %58
}

; Function Attrs: nounwind uwtable
define i32* @f(i32* %x) #0 {
  %1 = alloca i32*, align 8
  store i32* %x, i32** %1, align 8
  ret i32* null
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
