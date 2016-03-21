; ModuleID = './c1x-6-7-8.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [3 x i32], i32 }
%struct.anon.0 = type { [3 x i32], i32 }
%struct.div_t = type { i32, i32 }
%struct.anon.1 = type { [3 x i32], i32 }
%union.anon = type { [2 x i32] }
%struct.anon.2 = type { [3 x i32], i32 }
%union.anon.3 = type { [2 x i32] }
%union.anon.4 = type { [2 x i32] }

@sec26.y1 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@sec26.y2 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [15 x i8] c"y1[%d][%d]=%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"z1[%d][%d]=%d\0A\00", align 1
@sec28.w1 = private unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@sec28.w2 = private unnamed_addr constant [2 x %struct.anon.0] [%struct.anon.0 { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon.0 { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str.2 = private unnamed_addr constant [17 x i8] c"w1[%d].a[%d]=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"q1[%d][%d][%d]=%d\0A\00", align 1
@sec31.a1 = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b1 = private unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@sec31.a2 = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b2 = private unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@.str.4 = private unnamed_addr constant [11 x i8] c"a1[%d]=%d\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"b1[%d]=%d\0A\00", align 1
@sec32.s1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@sec32.t1 = private unnamed_addr constant [3 x i8] c"abc", align 1
@sec32.s2 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@sec32.t2 = private unnamed_addr constant [3 x i8] c"abc", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"s1[%d]=%d\0A\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"t1[%d]=%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"member one\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"member two\00", align 1
@sec33.nm = private unnamed_addr constant [2 x i8*] [i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0)], align 16
@.str.11 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@sec34.x1 = private unnamed_addr constant %struct.div_t { i32 2, i32 -1 }, align 4
@sec34.x2 = private unnamed_addr constant %struct.div_t { i32 2, i32 -1 }, align 4
@sec35.w1 = private unnamed_addr constant [2 x %struct.anon.1] [%struct.anon.1 { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon.1 { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str.12 = private unnamed_addr constant [15 x i8] c"w1[%d][%d]=%d\0A\00", align 1
@sec36.a1 = private unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16
@sec36.a2 = private unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16
@sec38.u1 = private unnamed_addr constant %union.anon { [2 x i32] [i32 1, i32 2] }, align 4
@sec38.u2 = private unnamed_addr constant { i32, [4 x i8] } { i32 3, [4 x i8] undef }, align 4
@sec38.u3 = private unnamed_addr constant { float, [4 x i8] } { float 4.500000e+00, [4 x i8] undef }, align 4

; Function Attrs: nounwind uwtable
define i32 @sec26() #0 {
  %1 = alloca i32, align 4
  %y1 = alloca [4 x [3 x i32]], align 16
  %y2 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x [3 x i32]]* @sec26.y1 to i8*), i64 48, i32 16, i1 false)
  %3 = bitcast [4 x [3 x i32]]* %y2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([4 x [3 x i32]]* @sec26.y2 to i8*), i64 48, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %43, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %7, label %46

; <label>:7                                       ; preds = %4
  store i32 0, i32* %j, align 4
  br label %8

; <label>:8                                       ; preds = %39, %7
  %9 = load i32, i32* %j, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %42

; <label>:11                                      ; preds = %8
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %j, align 4
  %14 = load i32, i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %17
  %19 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i32 0, i64 %15
  %20 = load i32, i32* %19, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %12, i32 %13, i32 %20)
  %22 = load i32, i32* %j, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %25
  %27 = getelementptr inbounds [3 x i32], [3 x i32]* %26, i32 0, i64 %23
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %j, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y2, i32 0, i64 %32
  %34 = getelementptr inbounds [3 x i32], [3 x i32]* %33, i32 0, i64 %30
  %35 = load i32, i32* %34, align 4
  %36 = icmp ne i32 %28, %35
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %11
  store i32 1, i32* %1
  br label %47

; <label>:38                                      ; preds = %11
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32, i32* %j, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %j, align 4
  br label %8

; <label>:42                                      ; preds = %8
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i32, i32* %i, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %i, align 4
  br label %4

; <label>:46                                      ; preds = %4
  store i32 0, i32* %1
  br label %47

; <label>:47                                      ; preds = %46, %37
  %48 = load i32, i32* %1
  ret i32 %48
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @sec27() #0 {
  %1 = alloca i32, align 4
  %z1 = alloca [4 x [3 x i32]], align 16
  %z2 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast [4 x [3 x i32]]* %z1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 48, i32 16, i1 false)
  %3 = bitcast i8* %2 to [4 x [3 x i32]]*
  %4 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %3, i32 0, i32 0
  %5 = getelementptr [3 x i32], [3 x i32]* %4, i32 0, i32 0
  store i32 1, i32* %5
  %6 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %3, i32 0, i32 1
  %7 = getelementptr [3 x i32], [3 x i32]* %6, i32 0, i32 0
  store i32 2, i32* %7
  %8 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %3, i32 0, i32 2
  %9 = getelementptr [3 x i32], [3 x i32]* %8, i32 0, i32 0
  store i32 3, i32* %9
  %10 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %3, i32 0, i32 3
  %11 = getelementptr [3 x i32], [3 x i32]* %10, i32 0, i32 0
  store i32 4, i32* %11
  %12 = bitcast [4 x [3 x i32]]* %z2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 48, i32 16, i1 false)
  %13 = bitcast i8* %12 to [4 x [3 x i32]]*
  %14 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %13, i32 0, i32 0
  %15 = getelementptr [3 x i32], [3 x i32]* %14, i32 0, i32 0
  store i32 1, i32* %15
  %16 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %13, i32 0, i32 1
  %17 = getelementptr [3 x i32], [3 x i32]* %16, i32 0, i32 0
  store i32 2, i32* %17
  %18 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %13, i32 0, i32 2
  %19 = getelementptr [3 x i32], [3 x i32]* %18, i32 0, i32 0
  store i32 3, i32* %19
  %20 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %13, i32 0, i32 3
  %21 = getelementptr [3 x i32], [3 x i32]* %20, i32 0, i32 0
  store i32 4, i32* %21
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %61, %0
  %23 = load i32, i32* %i, align 4
  %24 = icmp slt i32 %23, 4
  br i1 %24, label %25, label %64

; <label>:25                                      ; preds = %22
  store i32 0, i32* %j, align 4
  br label %26

; <label>:26                                      ; preds = %57, %25
  %27 = load i32, i32* %j, align 4
  %28 = icmp slt i32 %27, 3
  br i1 %28, label %29, label %60

; <label>:29                                      ; preds = %26
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* %j, align 4
  %32 = load i32, i32* %j, align 4
  %33 = sext i32 %32 to i64
  %34 = load i32, i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %z1, i32 0, i64 %35
  %37 = getelementptr inbounds [3 x i32], [3 x i32]* %36, i32 0, i64 %33
  %38 = load i32, i32* %37, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 %30, i32 %31, i32 %38)
  %40 = load i32, i32* %j, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32, i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %z1, i32 0, i64 %43
  %45 = getelementptr inbounds [3 x i32], [3 x i32]* %44, i32 0, i64 %41
  %46 = load i32, i32* %45, align 4
  %47 = load i32, i32* %j, align 4
  %48 = sext i32 %47 to i64
  %49 = load i32, i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %z2, i32 0, i64 %50
  %52 = getelementptr inbounds [3 x i32], [3 x i32]* %51, i32 0, i64 %48
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %46, %53
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %29
  store i32 1, i32* %1
  br label %65

; <label>:56                                      ; preds = %29
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32, i32* %j, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %j, align 4
  br label %26

; <label>:60                                      ; preds = %26
  br label %61

; <label>:61                                      ; preds = %60
  %62 = load i32, i32* %i, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %i, align 4
  br label %22

; <label>:64                                      ; preds = %22
  store i32 0, i32* %1
  br label %65

; <label>:65                                      ; preds = %64, %55
  %66 = load i32, i32* %1
  ret i32 %66
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @sec28() #0 {
  %1 = alloca i32, align 4
  %w1 = alloca [2 x %struct.anon], align 16
  %w2 = alloca [2 x %struct.anon.0], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast [2 x %struct.anon]* %w1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x %struct.anon]* @sec28.w1 to i8*), i64 32, i32 16, i1 false)
  %3 = bitcast [2 x %struct.anon.0]* %w2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([2 x %struct.anon.0]* @sec28.w2 to i8*), i64 32, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %59, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 2
  br i1 %6, label %7, label %62

; <label>:7                                       ; preds = %4
  store i32 0, i32* %j, align 4
  br label %8

; <label>:8                                       ; preds = %55, %7
  %9 = load i32, i32* %j, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %58

; <label>:11                                      ; preds = %8
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %j, align 4
  %14 = load i32, i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %w1, i32 0, i64 %17
  %19 = getelementptr inbounds %struct.anon, %struct.anon* %18, i32 0, i32 0
  %20 = getelementptr inbounds [3 x i32], [3 x i32]* %19, i32 0, i64 %15
  %21 = load i32, i32* %20, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i32 %12, i32 %13, i32 %21)
  %23 = load i32, i32* %j, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32, i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %w1, i32 0, i64 %26
  %28 = getelementptr inbounds %struct.anon, %struct.anon* %27, i32 0, i32 0
  %29 = getelementptr inbounds [3 x i32], [3 x i32]* %28, i32 0, i64 %24
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %j, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32, i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %w2, i32 0, i64 %34
  %36 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %35, i32 0, i32 0
  %37 = getelementptr inbounds [3 x i32], [3 x i32]* %36, i32 0, i64 %32
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %30, %38
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %11
  store i32 1, i32* %1
  br label %63

; <label>:41                                      ; preds = %11
  %42 = load i32, i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %w1, i32 0, i64 %43
  %45 = getelementptr inbounds %struct.anon, %struct.anon* %44, i32 0, i32 1
  %46 = load i32, i32* %45, align 4
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %w2, i32 0, i64 %48
  %50 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %49, i32 0, i32 1
  %51 = load i32, i32* %50, align 4
  %52 = icmp ne i32 %46, %51
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %41
  store i32 1, i32* %1
  br label %63

; <label>:54                                      ; preds = %41
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32, i32* %j, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %j, align 4
  br label %8

; <label>:58                                      ; preds = %8
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32, i32* %i, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %i, align 4
  br label %4

; <label>:62                                      ; preds = %4
  store i32 0, i32* %1
  br label %63

; <label>:63                                      ; preds = %62, %53, %40
  %64 = load i32, i32* %1
  ret i32 %64
}

; Function Attrs: nounwind uwtable
define i32 @sec29() #0 {
  %1 = alloca i32, align 4
  %q1 = alloca [4 x [3 x [2 x i16]]], align 16
  %q2 = alloca [4 x [3 x [2 x i16]]], align 16
  %q3 = alloca [4 x [3 x [2 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %2 = bitcast [4 x [3 x [2 x i16]]]* %q1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 48, i32 16, i1 false)
  %3 = bitcast i8* %2 to [4 x [3 x [2 x i16]]]*
  %4 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %3, i32 0, i32 0
  %5 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %4, i32 0, i32 0
  %6 = getelementptr [2 x i16], [2 x i16]* %5, i32 0, i32 0
  store i16 1, i16* %6
  %7 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %3, i32 0, i32 1
  %8 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %7, i32 0, i32 0
  %9 = getelementptr [2 x i16], [2 x i16]* %8, i32 0, i32 0
  store i16 2, i16* %9
  %10 = getelementptr [2 x i16], [2 x i16]* %8, i32 0, i32 1
  store i16 3, i16* %10
  %11 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %3, i32 0, i32 2
  %12 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %11, i32 0, i32 0
  %13 = getelementptr [2 x i16], [2 x i16]* %12, i32 0, i32 0
  store i16 4, i16* %13
  %14 = getelementptr [2 x i16], [2 x i16]* %12, i32 0, i32 1
  store i16 5, i16* %14
  %15 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %11, i32 0, i32 1
  %16 = getelementptr [2 x i16], [2 x i16]* %15, i32 0, i32 0
  store i16 6, i16* %16
  %17 = bitcast [4 x [3 x [2 x i16]]]* %q2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 48, i32 16, i1 false)
  %18 = bitcast i8* %17 to [4 x [3 x [2 x i16]]]*
  %19 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %18, i32 0, i32 0
  %20 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %19, i32 0, i32 0
  %21 = getelementptr [2 x i16], [2 x i16]* %20, i32 0, i32 0
  store i16 1, i16* %21
  %22 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %18, i32 0, i32 1
  %23 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %22, i32 0, i32 0
  %24 = getelementptr [2 x i16], [2 x i16]* %23, i32 0, i32 0
  store i16 2, i16* %24
  %25 = getelementptr [2 x i16], [2 x i16]* %23, i32 0, i32 1
  store i16 3, i16* %25
  %26 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %18, i32 0, i32 2
  %27 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %26, i32 0, i32 0
  %28 = getelementptr [2 x i16], [2 x i16]* %27, i32 0, i32 0
  store i16 4, i16* %28
  %29 = getelementptr [2 x i16], [2 x i16]* %27, i32 0, i32 1
  store i16 5, i16* %29
  %30 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %26, i32 0, i32 1
  %31 = getelementptr [2 x i16], [2 x i16]* %30, i32 0, i32 0
  store i16 6, i16* %31
  %32 = bitcast [4 x [3 x [2 x i16]]]* %q3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 48, i32 16, i1 false)
  %33 = bitcast i8* %32 to [4 x [3 x [2 x i16]]]*
  %34 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %33, i32 0, i32 0
  %35 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %34, i32 0, i32 0
  %36 = getelementptr [2 x i16], [2 x i16]* %35, i32 0, i32 0
  store i16 1, i16* %36
  %37 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %33, i32 0, i32 1
  %38 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %37, i32 0, i32 0
  %39 = getelementptr [2 x i16], [2 x i16]* %38, i32 0, i32 0
  store i16 2, i16* %39
  %40 = getelementptr [2 x i16], [2 x i16]* %38, i32 0, i32 1
  store i16 3, i16* %40
  %41 = getelementptr [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %33, i32 0, i32 2
  %42 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %41, i32 0, i32 0
  %43 = getelementptr [2 x i16], [2 x i16]* %42, i32 0, i32 0
  store i16 4, i16* %43
  %44 = getelementptr [2 x i16], [2 x i16]* %42, i32 0, i32 1
  store i16 5, i16* %44
  %45 = getelementptr [3 x [2 x i16]], [3 x [2 x i16]]* %41, i32 0, i32 1
  %46 = getelementptr [2 x i16], [2 x i16]* %45, i32 0, i32 0
  store i16 6, i16* %46
  store i32 0, i32* %i, align 4
  br label %47

; <label>:47                                      ; preds = %132, %0
  %48 = load i32, i32* %i, align 4
  %49 = icmp slt i32 %48, 4
  br i1 %49, label %50, label %135

; <label>:50                                      ; preds = %47
  store i32 0, i32* %j, align 4
  br label %51

; <label>:51                                      ; preds = %128, %50
  %52 = load i32, i32* %j, align 4
  %53 = icmp slt i32 %52, 3
  br i1 %53, label %54, label %131

; <label>:54                                      ; preds = %51
  store i32 0, i32* %k, align 4
  br label %55

; <label>:55                                      ; preds = %124, %54
  %56 = load i32, i32* %k, align 4
  %57 = icmp slt i32 %56, 2
  br i1 %57, label %58, label %127

; <label>:58                                      ; preds = %55
  %59 = load i32, i32* %i, align 4
  %60 = load i32, i32* %j, align 4
  %61 = load i32, i32* %k, align 4
  %62 = load i32, i32* %k, align 4
  %63 = sext i32 %62 to i64
  %64 = load i32, i32* %j, align 4
  %65 = sext i32 %64 to i64
  %66 = load i32, i32* %i, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %q1, i32 0, i64 %67
  %69 = getelementptr inbounds [3 x [2 x i16]], [3 x [2 x i16]]* %68, i32 0, i64 %65
  %70 = getelementptr inbounds [2 x i16], [2 x i16]* %69, i32 0, i64 %63
  %71 = load i16, i16* %70, align 2
  %72 = sext i16 %71 to i32
  %73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i32 %59, i32 %60, i32 %61, i32 %72)
  %74 = load i32, i32* %k, align 4
  %75 = sext i32 %74 to i64
  %76 = load i32, i32* %j, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32, i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %q1, i32 0, i64 %79
  %81 = getelementptr inbounds [3 x [2 x i16]], [3 x [2 x i16]]* %80, i32 0, i64 %77
  %82 = getelementptr inbounds [2 x i16], [2 x i16]* %81, i32 0, i64 %75
  %83 = load i16, i16* %82, align 2
  %84 = sext i16 %83 to i32
  %85 = load i32, i32* %k, align 4
  %86 = sext i32 %85 to i64
  %87 = load i32, i32* %j, align 4
  %88 = sext i32 %87 to i64
  %89 = load i32, i32* %i, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %q2, i32 0, i64 %90
  %92 = getelementptr inbounds [3 x [2 x i16]], [3 x [2 x i16]]* %91, i32 0, i64 %88
  %93 = getelementptr inbounds [2 x i16], [2 x i16]* %92, i32 0, i64 %86
  %94 = load i16, i16* %93, align 2
  %95 = sext i16 %94 to i32
  %96 = icmp ne i32 %84, %95
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %58
  store i32 1, i32* %1
  br label %136

; <label>:98                                      ; preds = %58
  %99 = load i32, i32* %k, align 4
  %100 = sext i32 %99 to i64
  %101 = load i32, i32* %j, align 4
  %102 = sext i32 %101 to i64
  %103 = load i32, i32* %i, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %q2, i32 0, i64 %104
  %106 = getelementptr inbounds [3 x [2 x i16]], [3 x [2 x i16]]* %105, i32 0, i64 %102
  %107 = getelementptr inbounds [2 x i16], [2 x i16]* %106, i32 0, i64 %100
  %108 = load i16, i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = load i32, i32* %k, align 4
  %111 = sext i32 %110 to i64
  %112 = load i32, i32* %j, align 4
  %113 = sext i32 %112 to i64
  %114 = load i32, i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [4 x [3 x [2 x i16]]], [4 x [3 x [2 x i16]]]* %q3, i32 0, i64 %115
  %117 = getelementptr inbounds [3 x [2 x i16]], [3 x [2 x i16]]* %116, i32 0, i64 %113
  %118 = getelementptr inbounds [2 x i16], [2 x i16]* %117, i32 0, i64 %111
  %119 = load i16, i16* %118, align 2
  %120 = sext i16 %119 to i32
  %121 = icmp ne i32 %109, %120
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %98
  store i32 1, i32* %1
  br label %136

; <label>:123                                     ; preds = %98
  br label %124

; <label>:124                                     ; preds = %123
  %125 = load i32, i32* %k, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %k, align 4
  br label %55

; <label>:127                                     ; preds = %55
  br label %128

; <label>:128                                     ; preds = %127
  %129 = load i32, i32* %j, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %j, align 4
  br label %51

; <label>:131                                     ; preds = %51
  br label %132

; <label>:132                                     ; preds = %131
  %133 = load i32, i32* %i, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %i, align 4
  br label %47

; <label>:135                                     ; preds = %47
  store i32 0, i32* %1
  br label %136

; <label>:136                                     ; preds = %135, %122, %97
  %137 = load i32, i32* %1
  ret i32 %137
}

; Function Attrs: nounwind uwtable
define i32 @sec31() #0 {
  %1 = alloca i32, align 4
  %a1 = alloca [2 x i32], align 4
  %b1 = alloca [3 x i32], align 4
  %a2 = alloca [2 x i32], align 4
  %b2 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %2 = bitcast [2 x i32]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x i32]* @sec31.a1 to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast [3 x i32]* %b1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([3 x i32]* @sec31.b1 to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast [2 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ([2 x i32]* @sec31.a2 to i8*), i64 8, i32 4, i1 false)
  %5 = bitcast [3 x i32]* %b2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* bitcast ([3 x i32]* @sec31.b2 to i8*), i64 12, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %27, %0
  %7 = load i32, i32* %i, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %30

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x i32], [2 x i32]* %a1, i32 0, i64 %12
  %14 = load i32, i32* %13, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i32 %10, i32 %14)
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x i32], [2 x i32]* %a1, i32 0, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = load i32, i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [2 x i32], [2 x i32]* %a2, i32 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = icmp ne i32 %19, %23
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %9
  store i32 1, i32* %1
  br label %56

; <label>:26                                      ; preds = %9
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32, i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %6

; <label>:30                                      ; preds = %6
  store i32 0, i32* %i1, align 4
  br label %31

; <label>:31                                      ; preds = %52, %30
  %32 = load i32, i32* %i1, align 4
  %33 = icmp slt i32 %32, 3
  br i1 %33, label %34, label %55

; <label>:34                                      ; preds = %31
  %35 = load i32, i32* %i1, align 4
  %36 = load i32, i32* %i1, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x i32], [3 x i32]* %b1, i32 0, i64 %37
  %39 = load i32, i32* %38, align 4
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 %35, i32 %39)
  %41 = load i32, i32* %i1, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [3 x i32], [3 x i32]* %b1, i32 0, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = load i32, i32* %i1, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [3 x i32], [3 x i32]* %b2, i32 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = icmp ne i32 %44, %48
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %34
  store i32 1, i32* %1
  br label %56

; <label>:51                                      ; preds = %34
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32, i32* %i1, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i1, align 4
  br label %31

; <label>:55                                      ; preds = %31
  store i32 0, i32* %1
  br label %56

; <label>:56                                      ; preds = %55, %50, %25
  %57 = load i32, i32* %1
  ret i32 %57
}

; Function Attrs: nounwind uwtable
define i32 @sec32() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca [4 x i8], align 1
  %t1 = alloca [3 x i8], align 1
  %s2 = alloca [4 x i8], align 1
  %t2 = alloca [3 x i8], align 1
  %s3 = alloca i8*, align 8
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %2 = bitcast [4 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @sec32.s1, i32 0, i32 0), i64 4, i32 1, i1 false)
  %3 = bitcast [3 x i8]* %t1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @sec32.t1, i32 0, i32 0), i64 3, i32 1, i1 false)
  %4 = bitcast [4 x i8]* %s2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @sec32.s2, i32 0, i32 0), i64 4, i32 1, i1 false)
  %5 = bitcast [3 x i8]* %t2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @sec32.t2, i32 0, i32 0), i64 3, i32 1, i1 false)
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8** %s3, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %44, %0
  %7 = load i32, i32* %i, align 4
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %9, label %47

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i32 0, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 %10, i32 %15)
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i32 0, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = load i32, i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i8], [4 x i8]* %s2, i32 0, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %21, %26
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %9
  store i32 1, i32* %1
  br label %76

; <label>:29                                      ; preds = %9
  %30 = load i32, i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i8], [4 x i8]* %s2, i32 0, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = load i32, i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load i8*, i8** %s3, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 %36
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp ne i32 %34, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %29
  store i32 1, i32* %1
  br label %76

; <label>:43                                      ; preds = %29
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32, i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %6

; <label>:47                                      ; preds = %6
  store i32 0, i32* %i1, align 4
  br label %48

; <label>:48                                      ; preds = %72, %47
  %49 = load i32, i32* %i1, align 4
  %50 = icmp slt i32 %49, 3
  br i1 %50, label %51, label %75

; <label>:51                                      ; preds = %48
  %52 = load i32, i32* %i1, align 4
  %53 = load i32, i32* %i1, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [3 x i8], [3 x i8]* %t1, i32 0, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i32 %52, i32 %57)
  %59 = load i32, i32* %i1, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [3 x i8], [3 x i8]* %t1, i32 0, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = sext i8 %62 to i32
  %64 = load i32, i32* %i1, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [3 x i8], [3 x i8]* %t2, i32 0, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = icmp ne i32 %63, %68
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %51
  store i32 1, i32* %1
  br label %76

; <label>:71                                      ; preds = %51
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load i32, i32* %i1, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %i1, align 4
  br label %48

; <label>:75                                      ; preds = %48
  store i32 0, i32* %1
  br label %76

; <label>:76                                      ; preds = %75, %70, %42, %28
  %77 = load i32, i32* %1
  ret i32 %77
}

; Function Attrs: nounwind uwtable
define i32 @sec33() #0 {
  %nm = alloca [2 x i8*], align 16
  %1 = bitcast [2 x i8*]* %nm to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([2 x i8*]* @sec33.nm to i8*), i64 16, i32 16, i1 false)
  %2 = getelementptr inbounds [2 x i8*], [2 x i8*]* %nm, i32 0, i64 0
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8* %3)
  %5 = getelementptr inbounds [2 x i8*], [2 x i8*]* %nm, i32 0, i64 1
  %6 = load i8*, i8** %5, align 8
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8* %6)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @sec34() #0 {
  %1 = alloca i32, align 4
  %x1 = alloca %struct.div_t, align 4
  %x2 = alloca %struct.div_t, align 4
  %2 = bitcast %struct.div_t* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.div_t* @sec34.x1 to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast %struct.div_t* %x2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.div_t* @sec34.x2 to i8*), i64 8, i32 4, i1 false)
  %4 = getelementptr inbounds %struct.div_t, %struct.div_t* %x1, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds %struct.div_t, %struct.div_t* %x2, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %5, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store i32 1, i32* %1
  br label %18

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.div_t, %struct.div_t* %x1, i32 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds %struct.div_t, %struct.div_t* %x2, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %12, %14
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %10
  store i32 1, i32* %1
  br label %18

; <label>:17                                      ; preds = %10
  store i32 0, i32* %1
  br label %18

; <label>:18                                      ; preds = %17, %16, %9
  %19 = load i32, i32* %1
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @sec35() #0 {
  %1 = alloca i32, align 4
  %w1 = alloca [2 x %struct.anon.1], align 16
  %w2 = alloca [2 x %struct.anon.2], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast [2 x %struct.anon.1]* %w1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x %struct.anon.1]* @sec35.w1 to i8*), i64 32, i32 16, i1 false)
  %3 = bitcast [2 x %struct.anon.2]* %w2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 32, i32 16, i1 false)
  %4 = getelementptr inbounds [2 x %struct.anon.2], [2 x %struct.anon.2]* %w2, i32 0, i64 0
  %5 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %4, i32 0, i32 0
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %5, i32 0, i64 0
  store i32 1, i32* %6, align 4
  %7 = getelementptr inbounds [2 x %struct.anon.2], [2 x %struct.anon.2]* %w2, i32 0, i64 1
  %8 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %7, i32 0, i32 0
  %9 = getelementptr inbounds [3 x i32], [3 x i32]* %8, i32 0, i64 0
  store i32 2, i32* %9, align 4
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %52, %0
  %11 = load i32, i32* %i, align 4
  %12 = icmp slt i32 %11, 2
  br i1 %12, label %13, label %55

; <label>:13                                      ; preds = %10
  store i32 0, i32* %j, align 4
  br label %14

; <label>:14                                      ; preds = %48, %13
  %15 = load i32, i32* %j, align 4
  %16 = icmp slt i32 %15, 3
  br i1 %16, label %17, label %51

; <label>:17                                      ; preds = %14
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* %j, align 4
  %20 = load i32, i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32, i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x %struct.anon.1], [2 x %struct.anon.1]* %w1, i32 0, i64 %23
  %25 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %24, i32 0, i32 0
  %26 = getelementptr inbounds [3 x i32], [3 x i32]* %25, i32 0, i64 %21
  %27 = load i32, i32* %26, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i32 0, i32 0), i32 %18, i32 %19, i32 %27)
  %29 = load i32, i32* %j, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2 x %struct.anon.1], [2 x %struct.anon.1]* %w1, i32 0, i64 %32
  %34 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %33, i32 0, i32 0
  %35 = getelementptr inbounds [3 x i32], [3 x i32]* %34, i32 0, i64 %30
  %36 = load i32, i32* %35, align 4
  %37 = load i32, i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32, i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [2 x %struct.anon.2], [2 x %struct.anon.2]* %w2, i32 0, i64 %40
  %42 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %41, i32 0, i32 0
  %43 = getelementptr inbounds [3 x i32], [3 x i32]* %42, i32 0, i64 %38
  %44 = load i32, i32* %43, align 4
  %45 = icmp ne i32 %36, %44
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %17
  store i32 1, i32* %1
  br label %56

; <label>:47                                      ; preds = %17
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32, i32* %j, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %j, align 4
  br label %14

; <label>:51                                      ; preds = %14
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32, i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %10

; <label>:55                                      ; preds = %10
  store i32 0, i32* %1
  br label %56

; <label>:56                                      ; preds = %55, %46
  %57 = load i32, i32* %1
  ret i32 %57
}

; Function Attrs: nounwind uwtable
define i32 @sec36() #0 {
  %1 = alloca i32, align 4
  %a1 = alloca [20 x i32], align 16
  %a2 = alloca [20 x i32], align 16
  %i = alloca i32, align 4
  %2 = bitcast [20 x i32]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([20 x i32]* @sec36.a1 to i8*), i64 80, i32 16, i1 false)
  %3 = bitcast [20 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([20 x i32]* @sec36.a2 to i8*), i64 80, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %25, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 20
  br i1 %6, label %7, label %28

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [20 x i32], [20 x i32]* %a1, i32 0, i64 %10
  %12 = load i32, i32* %11, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i32 %8, i32 %12)
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20 x i32], [20 x i32]* %a1, i32 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [20 x i32], [20 x i32]* %a2, i32 0, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = icmp ne i32 %17, %21
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %7
  store i32 1, i32* %1
  br label %29

; <label>:24                                      ; preds = %7
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load i32, i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %4

; <label>:28                                      ; preds = %4
  store i32 0, i32* %1
  br label %29

; <label>:29                                      ; preds = %28, %23
  %30 = load i32, i32* %1
  ret i32 %30
}

; Function Attrs: nounwind uwtable
define i32 @sec38() #0 {
  %1 = alloca i32, align 4
  %u1 = alloca %union.anon, align 4
  %u2 = alloca %union.anon.3, align 4
  %u3 = alloca %union.anon.4, align 4
  %2 = bitcast %union.anon* %u1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%union.anon* @sec38.u1 to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast %union.anon.3* %u2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ({ i32, [4 x i8] }* @sec38.u2 to i8*), i64 8, i32 4, i1 false)
  %4 = bitcast %union.anon.4* %u3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ({ float, [4 x i8] }* @sec38.u3 to i8*), i64 8, i32 4, i1 false)
  %5 = bitcast %union.anon* %u1 to [2 x i32]*
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i32 0, i64 0
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store i32 1, i32* %1
  br label %28

; <label>:10                                      ; preds = %0
  %11 = bitcast %union.anon* %u1 to [2 x i32]*
  %12 = getelementptr inbounds [2 x i32], [2 x i32]* %11, i32 0, i64 1
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 2
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  store i32 1, i32* %1
  br label %28

; <label>:16                                      ; preds = %10
  %17 = bitcast %union.anon.3* %u2 to i32*
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  store i32 1, i32* %1
  br label %28

; <label>:21                                      ; preds = %16
  %22 = bitcast %union.anon.4* %u3 to float*
  %23 = load float, float* %22, align 4
  %24 = fpext float %23 to double
  %25 = fcmp une double %24, 4.500000e+00
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  store i32 1, i32* %1
  br label %28

; <label>:27                                      ; preds = %21
  store i32 0, i32* %1
  br label %28

; <label>:28                                      ; preds = %27, %26, %20, %15, %9
  %29 = load i32, i32* %1
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @sec26()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 26, i32* %1
  br label %46

; <label>:5                                       ; preds = %0
  %6 = call i32 @sec27()
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32 27, i32* %1
  br label %46

; <label>:9                                       ; preds = %5
  %10 = call i32 @sec28()
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i32 28, i32* %1
  br label %46

; <label>:13                                      ; preds = %9
  %14 = call i32 @sec29()
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  store i32 29, i32* %1
  br label %46

; <label>:17                                      ; preds = %13
  %18 = call i32 @sec31()
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  store i32 31, i32* %1
  br label %46

; <label>:21                                      ; preds = %17
  %22 = call i32 @sec32()
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  store i32 32, i32* %1
  br label %46

; <label>:25                                      ; preds = %21
  %26 = call i32 @sec33()
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  store i32 33, i32* %1
  br label %46

; <label>:29                                      ; preds = %25
  %30 = call i32 @sec34()
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  store i32 34, i32* %1
  br label %46

; <label>:33                                      ; preds = %29
  %34 = call i32 @sec35()
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  store i32 35, i32* %1
  br label %46

; <label>:37                                      ; preds = %33
  %38 = call i32 @sec36()
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  store i32 36, i32* %1
  br label %46

; <label>:41                                      ; preds = %37
  %42 = call i32 @sec38()
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  store i32 38, i32* %1
  br label %46

; <label>:45                                      ; preds = %41
  store i32 0, i32* %1
  br label %46

; <label>:46                                      ; preds = %45, %44, %40, %36, %32, %28, %24, %20, %16, %12, %8, %4
  %47 = load i32, i32* %1
  ret i32 %47
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
