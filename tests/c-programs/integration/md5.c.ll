; ModuleID = './md5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MD5_CTX = type { [2 x i32], [4 x i32], [64 x i8], [16 x i8] }

@PADDING = internal global [64 x i8] c"\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [26 x i8] c"MD5 test suite results:\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"message digest\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str.6 = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 1
@.str.7 = private unnamed_addr constant [81 x i8] c"12345678901234567890123456789012345678901234567890123456789012345678901234567890\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c" \22%s\22\0A\0A\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%x\00", align 1

; Function Attrs: nounwind uwtable
define void @MD5Init(%struct.MD5_CTX* %mdContext) #0 {
  %1 = alloca %struct.MD5_CTX*, align 8
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %1, align 8
  %2 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %3 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %2, i32 0, i32 0
  %4 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i32 0, i64 1
  store i32 0, i32* %4, align 4
  %5 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %6 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %5, i32 0, i32 0
  %7 = getelementptr inbounds [2 x i32], [2 x i32]* %6, i32 0, i64 0
  store i32 0, i32* %7, align 4
  %8 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %9 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %8, i32 0, i32 1
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i32 0, i64 0
  store i32 1732584193, i32* %10, align 4
  %11 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %12 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %11, i32 0, i32 1
  %13 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i32 0, i64 1
  store i32 -271733879, i32* %13, align 4
  %14 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %15 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %14, i32 0, i32 1
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %15, i32 0, i64 2
  store i32 -1732584194, i32* %16, align 4
  %17 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %18 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %17, i32 0, i32 1
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i32 0, i64 3
  store i32 271733878, i32* %19, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @MD5Update(%struct.MD5_CTX* %mdContext, i8* %inBuf, i32 %inLen) #0 {
  %1 = alloca %struct.MD5_CTX*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %in = alloca [16 x i32], align 16
  %mdi = alloca i32, align 4
  %i = alloca i32, align 4
  %ii = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %1, align 8
  store i8* %inBuf, i8** %2, align 8
  store i32 %inLen, i32* %3, align 4
  %4 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %5 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i32 0, i64 0
  %7 = load i32, i32* %6, align 4
  %8 = lshr i32 %7, 3
  %9 = and i32 %8, 63
  store i32 %9, i32* %mdi, align 4
  %10 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %11 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %10, i32 0, i32 0
  %12 = getelementptr inbounds [2 x i32], [2 x i32]* %11, i32 0, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = load i32, i32* %3, align 4
  %15 = shl i32 %14, 3
  %16 = add i32 %13, %15
  %17 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %18 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %17, i32 0, i32 0
  %19 = getelementptr inbounds [2 x i32], [2 x i32]* %18, i32 0, i64 0
  %20 = load i32, i32* %19, align 4
  %21 = icmp ult i32 %16, %20
  br i1 %21, label %22, label %28

; <label>:22                                      ; preds = %0
  %23 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %24 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %23, i32 0, i32 0
  %25 = getelementptr inbounds [2 x i32], [2 x i32]* %24, i32 0, i64 1
  %26 = load i32, i32* %25, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* %25, align 4
  br label %28

; <label>:28                                      ; preds = %22, %0
  %29 = load i32, i32* %3, align 4
  %30 = shl i32 %29, 3
  %31 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %32 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %31, i32 0, i32 0
  %33 = getelementptr inbounds [2 x i32], [2 x i32]* %32, i32 0, i64 0
  %34 = load i32, i32* %33, align 4
  %35 = add i32 %34, %30
  store i32 %35, i32* %33, align 4
  %36 = load i32, i32* %3, align 4
  %37 = lshr i32 %36, 29
  %38 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %39 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %38, i32 0, i32 0
  %40 = getelementptr inbounds [2 x i32], [2 x i32]* %39, i32 0, i64 1
  %41 = load i32, i32* %40, align 4
  %42 = add i32 %41, %37
  store i32 %42, i32* %40, align 4
  br label %43

; <label>:43                                      ; preds = %114, %28
  %44 = load i32, i32* %3, align 4
  %45 = add i32 %44, -1
  store i32 %45, i32* %3, align 4
  %46 = icmp ne i32 %44, 0
  br i1 %46, label %47, label %115

; <label>:47                                      ; preds = %43
  %48 = load i8*, i8** %2, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %2, align 8
  %50 = load i8, i8* %48, align 1
  %51 = load i32, i32* %mdi, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %mdi, align 4
  %53 = sext i32 %51 to i64
  %54 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %55 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %54, i32 0, i32 2
  %56 = getelementptr inbounds [64 x i8], [64 x i8]* %55, i32 0, i64 %53
  store i8 %50, i8* %56, align 1
  %57 = load i32, i32* %mdi, align 4
  %58 = icmp eq i32 %57, 64
  br i1 %58, label %59, label %114

; <label>:59                                      ; preds = %47
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %60

; <label>:60                                      ; preds = %104, %59
  %61 = load i32, i32* %i, align 4
  %62 = icmp ult i32 %61, 16
  br i1 %62, label %63, label %109

; <label>:63                                      ; preds = %60
  %64 = load i32, i32* %ii, align 4
  %65 = add i32 %64, 3
  %66 = zext i32 %65 to i64
  %67 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %68 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %67, i32 0, i32 2
  %69 = getelementptr inbounds [64 x i8], [64 x i8]* %68, i32 0, i64 %66
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = shl i32 %71, 24
  %73 = load i32, i32* %ii, align 4
  %74 = add i32 %73, 2
  %75 = zext i32 %74 to i64
  %76 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %77 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %76, i32 0, i32 2
  %78 = getelementptr inbounds [64 x i8], [64 x i8]* %77, i32 0, i64 %75
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = shl i32 %80, 16
  %82 = or i32 %72, %81
  %83 = load i32, i32* %ii, align 4
  %84 = add i32 %83, 1
  %85 = zext i32 %84 to i64
  %86 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %87 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %86, i32 0, i32 2
  %88 = getelementptr inbounds [64 x i8], [64 x i8]* %87, i32 0, i64 %85
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = shl i32 %90, 8
  %92 = or i32 %82, %91
  %93 = load i32, i32* %ii, align 4
  %94 = zext i32 %93 to i64
  %95 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %96 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %95, i32 0, i32 2
  %97 = getelementptr inbounds [64 x i8], [64 x i8]* %96, i32 0, i64 %94
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = or i32 %92, %99
  %101 = load i32, i32* %i, align 4
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds [16 x i32], [16 x i32]* %in, i32 0, i64 %102
  store i32 %100, i32* %103, align 4
  br label %104

; <label>:104                                     ; preds = %63
  %105 = load i32, i32* %i, align 4
  %106 = add i32 %105, 1
  store i32 %106, i32* %i, align 4
  %107 = load i32, i32* %ii, align 4
  %108 = add i32 %107, 4
  store i32 %108, i32* %ii, align 4
  br label %60

; <label>:109                                     ; preds = %60
  %110 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %111 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %110, i32 0, i32 1
  %112 = getelementptr inbounds [4 x i32], [4 x i32]* %111, i32 0, i32 0
  %113 = getelementptr inbounds [16 x i32], [16 x i32]* %in, i32 0, i32 0
  call void @Transform(i32* %112, i32* %113)
  store i32 0, i32* %mdi, align 4
  br label %114

; <label>:114                                     ; preds = %109, %47
  br label %43

; <label>:115                                     ; preds = %43
  ret void
}

; Function Attrs: nounwind uwtable
define void @MD5Final(%struct.MD5_CTX* %mdContext) #0 {
  %1 = alloca %struct.MD5_CTX*, align 8
  %in = alloca [16 x i32], align 16
  %mdi = alloca i32, align 4
  %i = alloca i32, align 4
  %ii = alloca i32, align 4
  %padLen = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %1, align 8
  %2 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %3 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %2, i32 0, i32 0
  %4 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i32 0, i64 0
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds [16 x i32], [16 x i32]* %in, i32 0, i64 14
  store i32 %5, i32* %6, align 4
  %7 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %8 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %7, i32 0, i32 0
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i32 0, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds [16 x i32], [16 x i32]* %in, i32 0, i64 15
  store i32 %10, i32* %11, align 4
  %12 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %13 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %12, i32 0, i32 0
  %14 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i32 0, i64 0
  %15 = load i32, i32* %14, align 4
  %16 = lshr i32 %15, 3
  %17 = and i32 %16, 63
  store i32 %17, i32* %mdi, align 4
  %18 = load i32, i32* %mdi, align 4
  %19 = icmp slt i32 %18, 56
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %0
  %21 = load i32, i32* %mdi, align 4
  %22 = sub nsw i32 56, %21
  br label %26

; <label>:23                                      ; preds = %0
  %24 = load i32, i32* %mdi, align 4
  %25 = sub nsw i32 120, %24
  br label %26

; <label>:26                                      ; preds = %23, %20
  %27 = phi i32 [ %22, %20 ], [ %25, %23 ]
  store i32 %27, i32* %padLen, align 4
  %28 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %29 = load i32, i32* %padLen, align 4
  call void @MD5Update(%struct.MD5_CTX* %28, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @PADDING, i32 0, i32 0), i32 %29)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %30

; <label>:30                                      ; preds = %74, %26
  %31 = load i32, i32* %i, align 4
  %32 = icmp ult i32 %31, 14
  br i1 %32, label %33, label %79

; <label>:33                                      ; preds = %30
  %34 = load i32, i32* %ii, align 4
  %35 = add i32 %34, 3
  %36 = zext i32 %35 to i64
  %37 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %38 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %37, i32 0, i32 2
  %39 = getelementptr inbounds [64 x i8], [64 x i8]* %38, i32 0, i64 %36
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = shl i32 %41, 24
  %43 = load i32, i32* %ii, align 4
  %44 = add i32 %43, 2
  %45 = zext i32 %44 to i64
  %46 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %47 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %46, i32 0, i32 2
  %48 = getelementptr inbounds [64 x i8], [64 x i8]* %47, i32 0, i64 %45
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = shl i32 %50, 16
  %52 = or i32 %42, %51
  %53 = load i32, i32* %ii, align 4
  %54 = add i32 %53, 1
  %55 = zext i32 %54 to i64
  %56 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %57 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %56, i32 0, i32 2
  %58 = getelementptr inbounds [64 x i8], [64 x i8]* %57, i32 0, i64 %55
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = shl i32 %60, 8
  %62 = or i32 %52, %61
  %63 = load i32, i32* %ii, align 4
  %64 = zext i32 %63 to i64
  %65 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %66 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %65, i32 0, i32 2
  %67 = getelementptr inbounds [64 x i8], [64 x i8]* %66, i32 0, i64 %64
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = or i32 %62, %69
  %71 = load i32, i32* %i, align 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds [16 x i32], [16 x i32]* %in, i32 0, i64 %72
  store i32 %70, i32* %73, align 4
  br label %74

; <label>:74                                      ; preds = %33
  %75 = load i32, i32* %i, align 4
  %76 = add i32 %75, 1
  store i32 %76, i32* %i, align 4
  %77 = load i32, i32* %ii, align 4
  %78 = add i32 %77, 4
  store i32 %78, i32* %ii, align 4
  br label %30

; <label>:79                                      ; preds = %30
  %80 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %81 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %80, i32 0, i32 1
  %82 = getelementptr inbounds [4 x i32], [4 x i32]* %81, i32 0, i32 0
  %83 = getelementptr inbounds [16 x i32], [16 x i32]* %in, i32 0, i32 0
  call void @Transform(i32* %82, i32* %83)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %84

; <label>:84                                      ; preds = %146, %79
  %85 = load i32, i32* %i, align 4
  %86 = icmp ult i32 %85, 4
  br i1 %86, label %87, label %151

; <label>:87                                      ; preds = %84
  %88 = load i32, i32* %i, align 4
  %89 = zext i32 %88 to i64
  %90 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %91 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %90, i32 0, i32 1
  %92 = getelementptr inbounds [4 x i32], [4 x i32]* %91, i32 0, i64 %89
  %93 = load i32, i32* %92, align 4
  %94 = and i32 %93, 255
  %95 = trunc i32 %94 to i8
  %96 = load i32, i32* %ii, align 4
  %97 = zext i32 %96 to i64
  %98 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %99 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %98, i32 0, i32 3
  %100 = getelementptr inbounds [16 x i8], [16 x i8]* %99, i32 0, i64 %97
  store i8 %95, i8* %100, align 1
  %101 = load i32, i32* %i, align 4
  %102 = zext i32 %101 to i64
  %103 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %104 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %103, i32 0, i32 1
  %105 = getelementptr inbounds [4 x i32], [4 x i32]* %104, i32 0, i64 %102
  %106 = load i32, i32* %105, align 4
  %107 = lshr i32 %106, 8
  %108 = and i32 %107, 255
  %109 = trunc i32 %108 to i8
  %110 = load i32, i32* %ii, align 4
  %111 = add i32 %110, 1
  %112 = zext i32 %111 to i64
  %113 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %114 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %113, i32 0, i32 3
  %115 = getelementptr inbounds [16 x i8], [16 x i8]* %114, i32 0, i64 %112
  store i8 %109, i8* %115, align 1
  %116 = load i32, i32* %i, align 4
  %117 = zext i32 %116 to i64
  %118 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %119 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %118, i32 0, i32 1
  %120 = getelementptr inbounds [4 x i32], [4 x i32]* %119, i32 0, i64 %117
  %121 = load i32, i32* %120, align 4
  %122 = lshr i32 %121, 16
  %123 = and i32 %122, 255
  %124 = trunc i32 %123 to i8
  %125 = load i32, i32* %ii, align 4
  %126 = add i32 %125, 2
  %127 = zext i32 %126 to i64
  %128 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %129 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %128, i32 0, i32 3
  %130 = getelementptr inbounds [16 x i8], [16 x i8]* %129, i32 0, i64 %127
  store i8 %124, i8* %130, align 1
  %131 = load i32, i32* %i, align 4
  %132 = zext i32 %131 to i64
  %133 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %134 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %133, i32 0, i32 1
  %135 = getelementptr inbounds [4 x i32], [4 x i32]* %134, i32 0, i64 %132
  %136 = load i32, i32* %135, align 4
  %137 = lshr i32 %136, 24
  %138 = and i32 %137, 255
  %139 = trunc i32 %138 to i8
  %140 = load i32, i32* %ii, align 4
  %141 = add i32 %140, 3
  %142 = zext i32 %141 to i64
  %143 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %144 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %143, i32 0, i32 3
  %145 = getelementptr inbounds [16 x i8], [16 x i8]* %144, i32 0, i64 %142
  store i8 %139, i8* %145, align 1
  br label %146

; <label>:146                                     ; preds = %87
  %147 = load i32, i32* %i, align 4
  %148 = add i32 %147, 1
  store i32 %148, i32* %i, align 4
  %149 = load i32, i32* %ii, align 4
  %150 = add i32 %149, 4
  store i32 %150, i32* %ii, align 4
  br label %84

; <label>:151                                     ; preds = %84
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @MDTestSuite()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @Transform(i32* %buf, i32* %in) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32* %buf, i32** %1, align 8
  store i32* %in, i32** %2, align 8
  %3 = load i32*, i32** %1, align 8
  %4 = getelementptr inbounds i32, i32* %3, i64 0
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %a, align 4
  %6 = load i32*, i32** %1, align 8
  %7 = getelementptr inbounds i32, i32* %6, i64 1
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %b, align 4
  %9 = load i32*, i32** %1, align 8
  %10 = getelementptr inbounds i32, i32* %9, i64 2
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %c, align 4
  %12 = load i32*, i32** %1, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 3
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %d, align 4
  %15 = load i32, i32* %b, align 4
  %16 = load i32, i32* %c, align 4
  %17 = and i32 %15, %16
  %18 = load i32, i32* %b, align 4
  %19 = xor i32 %18, -1
  %20 = load i32, i32* %d, align 4
  %21 = and i32 %19, %20
  %22 = or i32 %17, %21
  %23 = load i32*, i32** %2, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 0
  %25 = load i32, i32* %24, align 4
  %26 = add i32 %22, %25
  %27 = add i32 %26, -680876936
  %28 = load i32, i32* %a, align 4
  %29 = add i32 %28, %27
  store i32 %29, i32* %a, align 4
  %30 = load i32, i32* %a, align 4
  %31 = shl i32 %30, 7
  %32 = load i32, i32* %a, align 4
  %33 = lshr i32 %32, 25
  %34 = or i32 %31, %33
  store i32 %34, i32* %a, align 4
  %35 = load i32, i32* %b, align 4
  %36 = load i32, i32* %a, align 4
  %37 = add i32 %36, %35
  store i32 %37, i32* %a, align 4
  %38 = load i32, i32* %a, align 4
  %39 = load i32, i32* %b, align 4
  %40 = and i32 %38, %39
  %41 = load i32, i32* %a, align 4
  %42 = xor i32 %41, -1
  %43 = load i32, i32* %c, align 4
  %44 = and i32 %42, %43
  %45 = or i32 %40, %44
  %46 = load i32*, i32** %2, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 1
  %48 = load i32, i32* %47, align 4
  %49 = add i32 %45, %48
  %50 = add i32 %49, -389564586
  %51 = load i32, i32* %d, align 4
  %52 = add i32 %51, %50
  store i32 %52, i32* %d, align 4
  %53 = load i32, i32* %d, align 4
  %54 = shl i32 %53, 12
  %55 = load i32, i32* %d, align 4
  %56 = lshr i32 %55, 20
  %57 = or i32 %54, %56
  store i32 %57, i32* %d, align 4
  %58 = load i32, i32* %a, align 4
  %59 = load i32, i32* %d, align 4
  %60 = add i32 %59, %58
  store i32 %60, i32* %d, align 4
  %61 = load i32, i32* %d, align 4
  %62 = load i32, i32* %a, align 4
  %63 = and i32 %61, %62
  %64 = load i32, i32* %d, align 4
  %65 = xor i32 %64, -1
  %66 = load i32, i32* %b, align 4
  %67 = and i32 %65, %66
  %68 = or i32 %63, %67
  %69 = load i32*, i32** %2, align 8
  %70 = getelementptr inbounds i32, i32* %69, i64 2
  %71 = load i32, i32* %70, align 4
  %72 = add i32 %68, %71
  %73 = add i32 %72, 606105819
  %74 = load i32, i32* %c, align 4
  %75 = add i32 %74, %73
  store i32 %75, i32* %c, align 4
  %76 = load i32, i32* %c, align 4
  %77 = shl i32 %76, 17
  %78 = load i32, i32* %c, align 4
  %79 = lshr i32 %78, 15
  %80 = or i32 %77, %79
  store i32 %80, i32* %c, align 4
  %81 = load i32, i32* %d, align 4
  %82 = load i32, i32* %c, align 4
  %83 = add i32 %82, %81
  store i32 %83, i32* %c, align 4
  %84 = load i32, i32* %c, align 4
  %85 = load i32, i32* %d, align 4
  %86 = and i32 %84, %85
  %87 = load i32, i32* %c, align 4
  %88 = xor i32 %87, -1
  %89 = load i32, i32* %a, align 4
  %90 = and i32 %88, %89
  %91 = or i32 %86, %90
  %92 = load i32*, i32** %2, align 8
  %93 = getelementptr inbounds i32, i32* %92, i64 3
  %94 = load i32, i32* %93, align 4
  %95 = add i32 %91, %94
  %96 = add i32 %95, -1044525330
  %97 = load i32, i32* %b, align 4
  %98 = add i32 %97, %96
  store i32 %98, i32* %b, align 4
  %99 = load i32, i32* %b, align 4
  %100 = shl i32 %99, 22
  %101 = load i32, i32* %b, align 4
  %102 = lshr i32 %101, 10
  %103 = or i32 %100, %102
  store i32 %103, i32* %b, align 4
  %104 = load i32, i32* %c, align 4
  %105 = load i32, i32* %b, align 4
  %106 = add i32 %105, %104
  store i32 %106, i32* %b, align 4
  %107 = load i32, i32* %b, align 4
  %108 = load i32, i32* %c, align 4
  %109 = and i32 %107, %108
  %110 = load i32, i32* %b, align 4
  %111 = xor i32 %110, -1
  %112 = load i32, i32* %d, align 4
  %113 = and i32 %111, %112
  %114 = or i32 %109, %113
  %115 = load i32*, i32** %2, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 4
  %117 = load i32, i32* %116, align 4
  %118 = add i32 %114, %117
  %119 = add i32 %118, -176418897
  %120 = load i32, i32* %a, align 4
  %121 = add i32 %120, %119
  store i32 %121, i32* %a, align 4
  %122 = load i32, i32* %a, align 4
  %123 = shl i32 %122, 7
  %124 = load i32, i32* %a, align 4
  %125 = lshr i32 %124, 25
  %126 = or i32 %123, %125
  store i32 %126, i32* %a, align 4
  %127 = load i32, i32* %b, align 4
  %128 = load i32, i32* %a, align 4
  %129 = add i32 %128, %127
  store i32 %129, i32* %a, align 4
  %130 = load i32, i32* %a, align 4
  %131 = load i32, i32* %b, align 4
  %132 = and i32 %130, %131
  %133 = load i32, i32* %a, align 4
  %134 = xor i32 %133, -1
  %135 = load i32, i32* %c, align 4
  %136 = and i32 %134, %135
  %137 = or i32 %132, %136
  %138 = load i32*, i32** %2, align 8
  %139 = getelementptr inbounds i32, i32* %138, i64 5
  %140 = load i32, i32* %139, align 4
  %141 = add i32 %137, %140
  %142 = add i32 %141, 1200080426
  %143 = load i32, i32* %d, align 4
  %144 = add i32 %143, %142
  store i32 %144, i32* %d, align 4
  %145 = load i32, i32* %d, align 4
  %146 = shl i32 %145, 12
  %147 = load i32, i32* %d, align 4
  %148 = lshr i32 %147, 20
  %149 = or i32 %146, %148
  store i32 %149, i32* %d, align 4
  %150 = load i32, i32* %a, align 4
  %151 = load i32, i32* %d, align 4
  %152 = add i32 %151, %150
  store i32 %152, i32* %d, align 4
  %153 = load i32, i32* %d, align 4
  %154 = load i32, i32* %a, align 4
  %155 = and i32 %153, %154
  %156 = load i32, i32* %d, align 4
  %157 = xor i32 %156, -1
  %158 = load i32, i32* %b, align 4
  %159 = and i32 %157, %158
  %160 = or i32 %155, %159
  %161 = load i32*, i32** %2, align 8
  %162 = getelementptr inbounds i32, i32* %161, i64 6
  %163 = load i32, i32* %162, align 4
  %164 = add i32 %160, %163
  %165 = add i32 %164, -1473231341
  %166 = load i32, i32* %c, align 4
  %167 = add i32 %166, %165
  store i32 %167, i32* %c, align 4
  %168 = load i32, i32* %c, align 4
  %169 = shl i32 %168, 17
  %170 = load i32, i32* %c, align 4
  %171 = lshr i32 %170, 15
  %172 = or i32 %169, %171
  store i32 %172, i32* %c, align 4
  %173 = load i32, i32* %d, align 4
  %174 = load i32, i32* %c, align 4
  %175 = add i32 %174, %173
  store i32 %175, i32* %c, align 4
  %176 = load i32, i32* %c, align 4
  %177 = load i32, i32* %d, align 4
  %178 = and i32 %176, %177
  %179 = load i32, i32* %c, align 4
  %180 = xor i32 %179, -1
  %181 = load i32, i32* %a, align 4
  %182 = and i32 %180, %181
  %183 = or i32 %178, %182
  %184 = load i32*, i32** %2, align 8
  %185 = getelementptr inbounds i32, i32* %184, i64 7
  %186 = load i32, i32* %185, align 4
  %187 = add i32 %183, %186
  %188 = add i32 %187, -45705983
  %189 = load i32, i32* %b, align 4
  %190 = add i32 %189, %188
  store i32 %190, i32* %b, align 4
  %191 = load i32, i32* %b, align 4
  %192 = shl i32 %191, 22
  %193 = load i32, i32* %b, align 4
  %194 = lshr i32 %193, 10
  %195 = or i32 %192, %194
  store i32 %195, i32* %b, align 4
  %196 = load i32, i32* %c, align 4
  %197 = load i32, i32* %b, align 4
  %198 = add i32 %197, %196
  store i32 %198, i32* %b, align 4
  %199 = load i32, i32* %b, align 4
  %200 = load i32, i32* %c, align 4
  %201 = and i32 %199, %200
  %202 = load i32, i32* %b, align 4
  %203 = xor i32 %202, -1
  %204 = load i32, i32* %d, align 4
  %205 = and i32 %203, %204
  %206 = or i32 %201, %205
  %207 = load i32*, i32** %2, align 8
  %208 = getelementptr inbounds i32, i32* %207, i64 8
  %209 = load i32, i32* %208, align 4
  %210 = add i32 %206, %209
  %211 = add i32 %210, 1770035416
  %212 = load i32, i32* %a, align 4
  %213 = add i32 %212, %211
  store i32 %213, i32* %a, align 4
  %214 = load i32, i32* %a, align 4
  %215 = shl i32 %214, 7
  %216 = load i32, i32* %a, align 4
  %217 = lshr i32 %216, 25
  %218 = or i32 %215, %217
  store i32 %218, i32* %a, align 4
  %219 = load i32, i32* %b, align 4
  %220 = load i32, i32* %a, align 4
  %221 = add i32 %220, %219
  store i32 %221, i32* %a, align 4
  %222 = load i32, i32* %a, align 4
  %223 = load i32, i32* %b, align 4
  %224 = and i32 %222, %223
  %225 = load i32, i32* %a, align 4
  %226 = xor i32 %225, -1
  %227 = load i32, i32* %c, align 4
  %228 = and i32 %226, %227
  %229 = or i32 %224, %228
  %230 = load i32*, i32** %2, align 8
  %231 = getelementptr inbounds i32, i32* %230, i64 9
  %232 = load i32, i32* %231, align 4
  %233 = add i32 %229, %232
  %234 = add i32 %233, -1958414417
  %235 = load i32, i32* %d, align 4
  %236 = add i32 %235, %234
  store i32 %236, i32* %d, align 4
  %237 = load i32, i32* %d, align 4
  %238 = shl i32 %237, 12
  %239 = load i32, i32* %d, align 4
  %240 = lshr i32 %239, 20
  %241 = or i32 %238, %240
  store i32 %241, i32* %d, align 4
  %242 = load i32, i32* %a, align 4
  %243 = load i32, i32* %d, align 4
  %244 = add i32 %243, %242
  store i32 %244, i32* %d, align 4
  %245 = load i32, i32* %d, align 4
  %246 = load i32, i32* %a, align 4
  %247 = and i32 %245, %246
  %248 = load i32, i32* %d, align 4
  %249 = xor i32 %248, -1
  %250 = load i32, i32* %b, align 4
  %251 = and i32 %249, %250
  %252 = or i32 %247, %251
  %253 = load i32*, i32** %2, align 8
  %254 = getelementptr inbounds i32, i32* %253, i64 10
  %255 = load i32, i32* %254, align 4
  %256 = add i32 %252, %255
  %257 = add i32 %256, -42063
  %258 = load i32, i32* %c, align 4
  %259 = add i32 %258, %257
  store i32 %259, i32* %c, align 4
  %260 = load i32, i32* %c, align 4
  %261 = shl i32 %260, 17
  %262 = load i32, i32* %c, align 4
  %263 = lshr i32 %262, 15
  %264 = or i32 %261, %263
  store i32 %264, i32* %c, align 4
  %265 = load i32, i32* %d, align 4
  %266 = load i32, i32* %c, align 4
  %267 = add i32 %266, %265
  store i32 %267, i32* %c, align 4
  %268 = load i32, i32* %c, align 4
  %269 = load i32, i32* %d, align 4
  %270 = and i32 %268, %269
  %271 = load i32, i32* %c, align 4
  %272 = xor i32 %271, -1
  %273 = load i32, i32* %a, align 4
  %274 = and i32 %272, %273
  %275 = or i32 %270, %274
  %276 = load i32*, i32** %2, align 8
  %277 = getelementptr inbounds i32, i32* %276, i64 11
  %278 = load i32, i32* %277, align 4
  %279 = add i32 %275, %278
  %280 = add i32 %279, -1990404162
  %281 = load i32, i32* %b, align 4
  %282 = add i32 %281, %280
  store i32 %282, i32* %b, align 4
  %283 = load i32, i32* %b, align 4
  %284 = shl i32 %283, 22
  %285 = load i32, i32* %b, align 4
  %286 = lshr i32 %285, 10
  %287 = or i32 %284, %286
  store i32 %287, i32* %b, align 4
  %288 = load i32, i32* %c, align 4
  %289 = load i32, i32* %b, align 4
  %290 = add i32 %289, %288
  store i32 %290, i32* %b, align 4
  %291 = load i32, i32* %b, align 4
  %292 = load i32, i32* %c, align 4
  %293 = and i32 %291, %292
  %294 = load i32, i32* %b, align 4
  %295 = xor i32 %294, -1
  %296 = load i32, i32* %d, align 4
  %297 = and i32 %295, %296
  %298 = or i32 %293, %297
  %299 = load i32*, i32** %2, align 8
  %300 = getelementptr inbounds i32, i32* %299, i64 12
  %301 = load i32, i32* %300, align 4
  %302 = add i32 %298, %301
  %303 = add i32 %302, 1804603682
  %304 = load i32, i32* %a, align 4
  %305 = add i32 %304, %303
  store i32 %305, i32* %a, align 4
  %306 = load i32, i32* %a, align 4
  %307 = shl i32 %306, 7
  %308 = load i32, i32* %a, align 4
  %309 = lshr i32 %308, 25
  %310 = or i32 %307, %309
  store i32 %310, i32* %a, align 4
  %311 = load i32, i32* %b, align 4
  %312 = load i32, i32* %a, align 4
  %313 = add i32 %312, %311
  store i32 %313, i32* %a, align 4
  %314 = load i32, i32* %a, align 4
  %315 = load i32, i32* %b, align 4
  %316 = and i32 %314, %315
  %317 = load i32, i32* %a, align 4
  %318 = xor i32 %317, -1
  %319 = load i32, i32* %c, align 4
  %320 = and i32 %318, %319
  %321 = or i32 %316, %320
  %322 = load i32*, i32** %2, align 8
  %323 = getelementptr inbounds i32, i32* %322, i64 13
  %324 = load i32, i32* %323, align 4
  %325 = add i32 %321, %324
  %326 = add i32 %325, -40341101
  %327 = load i32, i32* %d, align 4
  %328 = add i32 %327, %326
  store i32 %328, i32* %d, align 4
  %329 = load i32, i32* %d, align 4
  %330 = shl i32 %329, 12
  %331 = load i32, i32* %d, align 4
  %332 = lshr i32 %331, 20
  %333 = or i32 %330, %332
  store i32 %333, i32* %d, align 4
  %334 = load i32, i32* %a, align 4
  %335 = load i32, i32* %d, align 4
  %336 = add i32 %335, %334
  store i32 %336, i32* %d, align 4
  %337 = load i32, i32* %d, align 4
  %338 = load i32, i32* %a, align 4
  %339 = and i32 %337, %338
  %340 = load i32, i32* %d, align 4
  %341 = xor i32 %340, -1
  %342 = load i32, i32* %b, align 4
  %343 = and i32 %341, %342
  %344 = or i32 %339, %343
  %345 = load i32*, i32** %2, align 8
  %346 = getelementptr inbounds i32, i32* %345, i64 14
  %347 = load i32, i32* %346, align 4
  %348 = add i32 %344, %347
  %349 = add i32 %348, -1502002290
  %350 = load i32, i32* %c, align 4
  %351 = add i32 %350, %349
  store i32 %351, i32* %c, align 4
  %352 = load i32, i32* %c, align 4
  %353 = shl i32 %352, 17
  %354 = load i32, i32* %c, align 4
  %355 = lshr i32 %354, 15
  %356 = or i32 %353, %355
  store i32 %356, i32* %c, align 4
  %357 = load i32, i32* %d, align 4
  %358 = load i32, i32* %c, align 4
  %359 = add i32 %358, %357
  store i32 %359, i32* %c, align 4
  %360 = load i32, i32* %c, align 4
  %361 = load i32, i32* %d, align 4
  %362 = and i32 %360, %361
  %363 = load i32, i32* %c, align 4
  %364 = xor i32 %363, -1
  %365 = load i32, i32* %a, align 4
  %366 = and i32 %364, %365
  %367 = or i32 %362, %366
  %368 = load i32*, i32** %2, align 8
  %369 = getelementptr inbounds i32, i32* %368, i64 15
  %370 = load i32, i32* %369, align 4
  %371 = add i32 %367, %370
  %372 = add i32 %371, 1236535329
  %373 = load i32, i32* %b, align 4
  %374 = add i32 %373, %372
  store i32 %374, i32* %b, align 4
  %375 = load i32, i32* %b, align 4
  %376 = shl i32 %375, 22
  %377 = load i32, i32* %b, align 4
  %378 = lshr i32 %377, 10
  %379 = or i32 %376, %378
  store i32 %379, i32* %b, align 4
  %380 = load i32, i32* %c, align 4
  %381 = load i32, i32* %b, align 4
  %382 = add i32 %381, %380
  store i32 %382, i32* %b, align 4
  %383 = load i32, i32* %b, align 4
  %384 = load i32, i32* %d, align 4
  %385 = and i32 %383, %384
  %386 = load i32, i32* %c, align 4
  %387 = load i32, i32* %d, align 4
  %388 = xor i32 %387, -1
  %389 = and i32 %386, %388
  %390 = or i32 %385, %389
  %391 = load i32*, i32** %2, align 8
  %392 = getelementptr inbounds i32, i32* %391, i64 1
  %393 = load i32, i32* %392, align 4
  %394 = add i32 %390, %393
  %395 = add i32 %394, -165796510
  %396 = load i32, i32* %a, align 4
  %397 = add i32 %396, %395
  store i32 %397, i32* %a, align 4
  %398 = load i32, i32* %a, align 4
  %399 = shl i32 %398, 5
  %400 = load i32, i32* %a, align 4
  %401 = lshr i32 %400, 27
  %402 = or i32 %399, %401
  store i32 %402, i32* %a, align 4
  %403 = load i32, i32* %b, align 4
  %404 = load i32, i32* %a, align 4
  %405 = add i32 %404, %403
  store i32 %405, i32* %a, align 4
  %406 = load i32, i32* %a, align 4
  %407 = load i32, i32* %c, align 4
  %408 = and i32 %406, %407
  %409 = load i32, i32* %b, align 4
  %410 = load i32, i32* %c, align 4
  %411 = xor i32 %410, -1
  %412 = and i32 %409, %411
  %413 = or i32 %408, %412
  %414 = load i32*, i32** %2, align 8
  %415 = getelementptr inbounds i32, i32* %414, i64 6
  %416 = load i32, i32* %415, align 4
  %417 = add i32 %413, %416
  %418 = add i32 %417, -1069501632
  %419 = load i32, i32* %d, align 4
  %420 = add i32 %419, %418
  store i32 %420, i32* %d, align 4
  %421 = load i32, i32* %d, align 4
  %422 = shl i32 %421, 9
  %423 = load i32, i32* %d, align 4
  %424 = lshr i32 %423, 23
  %425 = or i32 %422, %424
  store i32 %425, i32* %d, align 4
  %426 = load i32, i32* %a, align 4
  %427 = load i32, i32* %d, align 4
  %428 = add i32 %427, %426
  store i32 %428, i32* %d, align 4
  %429 = load i32, i32* %d, align 4
  %430 = load i32, i32* %b, align 4
  %431 = and i32 %429, %430
  %432 = load i32, i32* %a, align 4
  %433 = load i32, i32* %b, align 4
  %434 = xor i32 %433, -1
  %435 = and i32 %432, %434
  %436 = or i32 %431, %435
  %437 = load i32*, i32** %2, align 8
  %438 = getelementptr inbounds i32, i32* %437, i64 11
  %439 = load i32, i32* %438, align 4
  %440 = add i32 %436, %439
  %441 = add i32 %440, 643717713
  %442 = load i32, i32* %c, align 4
  %443 = add i32 %442, %441
  store i32 %443, i32* %c, align 4
  %444 = load i32, i32* %c, align 4
  %445 = shl i32 %444, 14
  %446 = load i32, i32* %c, align 4
  %447 = lshr i32 %446, 18
  %448 = or i32 %445, %447
  store i32 %448, i32* %c, align 4
  %449 = load i32, i32* %d, align 4
  %450 = load i32, i32* %c, align 4
  %451 = add i32 %450, %449
  store i32 %451, i32* %c, align 4
  %452 = load i32, i32* %c, align 4
  %453 = load i32, i32* %a, align 4
  %454 = and i32 %452, %453
  %455 = load i32, i32* %d, align 4
  %456 = load i32, i32* %a, align 4
  %457 = xor i32 %456, -1
  %458 = and i32 %455, %457
  %459 = or i32 %454, %458
  %460 = load i32*, i32** %2, align 8
  %461 = getelementptr inbounds i32, i32* %460, i64 0
  %462 = load i32, i32* %461, align 4
  %463 = add i32 %459, %462
  %464 = add i32 %463, -373897302
  %465 = load i32, i32* %b, align 4
  %466 = add i32 %465, %464
  store i32 %466, i32* %b, align 4
  %467 = load i32, i32* %b, align 4
  %468 = shl i32 %467, 20
  %469 = load i32, i32* %b, align 4
  %470 = lshr i32 %469, 12
  %471 = or i32 %468, %470
  store i32 %471, i32* %b, align 4
  %472 = load i32, i32* %c, align 4
  %473 = load i32, i32* %b, align 4
  %474 = add i32 %473, %472
  store i32 %474, i32* %b, align 4
  %475 = load i32, i32* %b, align 4
  %476 = load i32, i32* %d, align 4
  %477 = and i32 %475, %476
  %478 = load i32, i32* %c, align 4
  %479 = load i32, i32* %d, align 4
  %480 = xor i32 %479, -1
  %481 = and i32 %478, %480
  %482 = or i32 %477, %481
  %483 = load i32*, i32** %2, align 8
  %484 = getelementptr inbounds i32, i32* %483, i64 5
  %485 = load i32, i32* %484, align 4
  %486 = add i32 %482, %485
  %487 = add i32 %486, -701558691
  %488 = load i32, i32* %a, align 4
  %489 = add i32 %488, %487
  store i32 %489, i32* %a, align 4
  %490 = load i32, i32* %a, align 4
  %491 = shl i32 %490, 5
  %492 = load i32, i32* %a, align 4
  %493 = lshr i32 %492, 27
  %494 = or i32 %491, %493
  store i32 %494, i32* %a, align 4
  %495 = load i32, i32* %b, align 4
  %496 = load i32, i32* %a, align 4
  %497 = add i32 %496, %495
  store i32 %497, i32* %a, align 4
  %498 = load i32, i32* %a, align 4
  %499 = load i32, i32* %c, align 4
  %500 = and i32 %498, %499
  %501 = load i32, i32* %b, align 4
  %502 = load i32, i32* %c, align 4
  %503 = xor i32 %502, -1
  %504 = and i32 %501, %503
  %505 = or i32 %500, %504
  %506 = load i32*, i32** %2, align 8
  %507 = getelementptr inbounds i32, i32* %506, i64 10
  %508 = load i32, i32* %507, align 4
  %509 = add i32 %505, %508
  %510 = add i32 %509, 38016083
  %511 = load i32, i32* %d, align 4
  %512 = add i32 %511, %510
  store i32 %512, i32* %d, align 4
  %513 = load i32, i32* %d, align 4
  %514 = shl i32 %513, 9
  %515 = load i32, i32* %d, align 4
  %516 = lshr i32 %515, 23
  %517 = or i32 %514, %516
  store i32 %517, i32* %d, align 4
  %518 = load i32, i32* %a, align 4
  %519 = load i32, i32* %d, align 4
  %520 = add i32 %519, %518
  store i32 %520, i32* %d, align 4
  %521 = load i32, i32* %d, align 4
  %522 = load i32, i32* %b, align 4
  %523 = and i32 %521, %522
  %524 = load i32, i32* %a, align 4
  %525 = load i32, i32* %b, align 4
  %526 = xor i32 %525, -1
  %527 = and i32 %524, %526
  %528 = or i32 %523, %527
  %529 = load i32*, i32** %2, align 8
  %530 = getelementptr inbounds i32, i32* %529, i64 15
  %531 = load i32, i32* %530, align 4
  %532 = add i32 %528, %531
  %533 = add i32 %532, -660478335
  %534 = load i32, i32* %c, align 4
  %535 = add i32 %534, %533
  store i32 %535, i32* %c, align 4
  %536 = load i32, i32* %c, align 4
  %537 = shl i32 %536, 14
  %538 = load i32, i32* %c, align 4
  %539 = lshr i32 %538, 18
  %540 = or i32 %537, %539
  store i32 %540, i32* %c, align 4
  %541 = load i32, i32* %d, align 4
  %542 = load i32, i32* %c, align 4
  %543 = add i32 %542, %541
  store i32 %543, i32* %c, align 4
  %544 = load i32, i32* %c, align 4
  %545 = load i32, i32* %a, align 4
  %546 = and i32 %544, %545
  %547 = load i32, i32* %d, align 4
  %548 = load i32, i32* %a, align 4
  %549 = xor i32 %548, -1
  %550 = and i32 %547, %549
  %551 = or i32 %546, %550
  %552 = load i32*, i32** %2, align 8
  %553 = getelementptr inbounds i32, i32* %552, i64 4
  %554 = load i32, i32* %553, align 4
  %555 = add i32 %551, %554
  %556 = add i32 %555, -405537848
  %557 = load i32, i32* %b, align 4
  %558 = add i32 %557, %556
  store i32 %558, i32* %b, align 4
  %559 = load i32, i32* %b, align 4
  %560 = shl i32 %559, 20
  %561 = load i32, i32* %b, align 4
  %562 = lshr i32 %561, 12
  %563 = or i32 %560, %562
  store i32 %563, i32* %b, align 4
  %564 = load i32, i32* %c, align 4
  %565 = load i32, i32* %b, align 4
  %566 = add i32 %565, %564
  store i32 %566, i32* %b, align 4
  %567 = load i32, i32* %b, align 4
  %568 = load i32, i32* %d, align 4
  %569 = and i32 %567, %568
  %570 = load i32, i32* %c, align 4
  %571 = load i32, i32* %d, align 4
  %572 = xor i32 %571, -1
  %573 = and i32 %570, %572
  %574 = or i32 %569, %573
  %575 = load i32*, i32** %2, align 8
  %576 = getelementptr inbounds i32, i32* %575, i64 9
  %577 = load i32, i32* %576, align 4
  %578 = add i32 %574, %577
  %579 = add i32 %578, 568446438
  %580 = load i32, i32* %a, align 4
  %581 = add i32 %580, %579
  store i32 %581, i32* %a, align 4
  %582 = load i32, i32* %a, align 4
  %583 = shl i32 %582, 5
  %584 = load i32, i32* %a, align 4
  %585 = lshr i32 %584, 27
  %586 = or i32 %583, %585
  store i32 %586, i32* %a, align 4
  %587 = load i32, i32* %b, align 4
  %588 = load i32, i32* %a, align 4
  %589 = add i32 %588, %587
  store i32 %589, i32* %a, align 4
  %590 = load i32, i32* %a, align 4
  %591 = load i32, i32* %c, align 4
  %592 = and i32 %590, %591
  %593 = load i32, i32* %b, align 4
  %594 = load i32, i32* %c, align 4
  %595 = xor i32 %594, -1
  %596 = and i32 %593, %595
  %597 = or i32 %592, %596
  %598 = load i32*, i32** %2, align 8
  %599 = getelementptr inbounds i32, i32* %598, i64 14
  %600 = load i32, i32* %599, align 4
  %601 = add i32 %597, %600
  %602 = add i32 %601, -1019803690
  %603 = load i32, i32* %d, align 4
  %604 = add i32 %603, %602
  store i32 %604, i32* %d, align 4
  %605 = load i32, i32* %d, align 4
  %606 = shl i32 %605, 9
  %607 = load i32, i32* %d, align 4
  %608 = lshr i32 %607, 23
  %609 = or i32 %606, %608
  store i32 %609, i32* %d, align 4
  %610 = load i32, i32* %a, align 4
  %611 = load i32, i32* %d, align 4
  %612 = add i32 %611, %610
  store i32 %612, i32* %d, align 4
  %613 = load i32, i32* %d, align 4
  %614 = load i32, i32* %b, align 4
  %615 = and i32 %613, %614
  %616 = load i32, i32* %a, align 4
  %617 = load i32, i32* %b, align 4
  %618 = xor i32 %617, -1
  %619 = and i32 %616, %618
  %620 = or i32 %615, %619
  %621 = load i32*, i32** %2, align 8
  %622 = getelementptr inbounds i32, i32* %621, i64 3
  %623 = load i32, i32* %622, align 4
  %624 = add i32 %620, %623
  %625 = add i32 %624, -187363961
  %626 = load i32, i32* %c, align 4
  %627 = add i32 %626, %625
  store i32 %627, i32* %c, align 4
  %628 = load i32, i32* %c, align 4
  %629 = shl i32 %628, 14
  %630 = load i32, i32* %c, align 4
  %631 = lshr i32 %630, 18
  %632 = or i32 %629, %631
  store i32 %632, i32* %c, align 4
  %633 = load i32, i32* %d, align 4
  %634 = load i32, i32* %c, align 4
  %635 = add i32 %634, %633
  store i32 %635, i32* %c, align 4
  %636 = load i32, i32* %c, align 4
  %637 = load i32, i32* %a, align 4
  %638 = and i32 %636, %637
  %639 = load i32, i32* %d, align 4
  %640 = load i32, i32* %a, align 4
  %641 = xor i32 %640, -1
  %642 = and i32 %639, %641
  %643 = or i32 %638, %642
  %644 = load i32*, i32** %2, align 8
  %645 = getelementptr inbounds i32, i32* %644, i64 8
  %646 = load i32, i32* %645, align 4
  %647 = add i32 %643, %646
  %648 = add i32 %647, 1163531501
  %649 = load i32, i32* %b, align 4
  %650 = add i32 %649, %648
  store i32 %650, i32* %b, align 4
  %651 = load i32, i32* %b, align 4
  %652 = shl i32 %651, 20
  %653 = load i32, i32* %b, align 4
  %654 = lshr i32 %653, 12
  %655 = or i32 %652, %654
  store i32 %655, i32* %b, align 4
  %656 = load i32, i32* %c, align 4
  %657 = load i32, i32* %b, align 4
  %658 = add i32 %657, %656
  store i32 %658, i32* %b, align 4
  %659 = load i32, i32* %b, align 4
  %660 = load i32, i32* %d, align 4
  %661 = and i32 %659, %660
  %662 = load i32, i32* %c, align 4
  %663 = load i32, i32* %d, align 4
  %664 = xor i32 %663, -1
  %665 = and i32 %662, %664
  %666 = or i32 %661, %665
  %667 = load i32*, i32** %2, align 8
  %668 = getelementptr inbounds i32, i32* %667, i64 13
  %669 = load i32, i32* %668, align 4
  %670 = add i32 %666, %669
  %671 = add i32 %670, -1444681467
  %672 = load i32, i32* %a, align 4
  %673 = add i32 %672, %671
  store i32 %673, i32* %a, align 4
  %674 = load i32, i32* %a, align 4
  %675 = shl i32 %674, 5
  %676 = load i32, i32* %a, align 4
  %677 = lshr i32 %676, 27
  %678 = or i32 %675, %677
  store i32 %678, i32* %a, align 4
  %679 = load i32, i32* %b, align 4
  %680 = load i32, i32* %a, align 4
  %681 = add i32 %680, %679
  store i32 %681, i32* %a, align 4
  %682 = load i32, i32* %a, align 4
  %683 = load i32, i32* %c, align 4
  %684 = and i32 %682, %683
  %685 = load i32, i32* %b, align 4
  %686 = load i32, i32* %c, align 4
  %687 = xor i32 %686, -1
  %688 = and i32 %685, %687
  %689 = or i32 %684, %688
  %690 = load i32*, i32** %2, align 8
  %691 = getelementptr inbounds i32, i32* %690, i64 2
  %692 = load i32, i32* %691, align 4
  %693 = add i32 %689, %692
  %694 = add i32 %693, -51403784
  %695 = load i32, i32* %d, align 4
  %696 = add i32 %695, %694
  store i32 %696, i32* %d, align 4
  %697 = load i32, i32* %d, align 4
  %698 = shl i32 %697, 9
  %699 = load i32, i32* %d, align 4
  %700 = lshr i32 %699, 23
  %701 = or i32 %698, %700
  store i32 %701, i32* %d, align 4
  %702 = load i32, i32* %a, align 4
  %703 = load i32, i32* %d, align 4
  %704 = add i32 %703, %702
  store i32 %704, i32* %d, align 4
  %705 = load i32, i32* %d, align 4
  %706 = load i32, i32* %b, align 4
  %707 = and i32 %705, %706
  %708 = load i32, i32* %a, align 4
  %709 = load i32, i32* %b, align 4
  %710 = xor i32 %709, -1
  %711 = and i32 %708, %710
  %712 = or i32 %707, %711
  %713 = load i32*, i32** %2, align 8
  %714 = getelementptr inbounds i32, i32* %713, i64 7
  %715 = load i32, i32* %714, align 4
  %716 = add i32 %712, %715
  %717 = add i32 %716, 1735328473
  %718 = load i32, i32* %c, align 4
  %719 = add i32 %718, %717
  store i32 %719, i32* %c, align 4
  %720 = load i32, i32* %c, align 4
  %721 = shl i32 %720, 14
  %722 = load i32, i32* %c, align 4
  %723 = lshr i32 %722, 18
  %724 = or i32 %721, %723
  store i32 %724, i32* %c, align 4
  %725 = load i32, i32* %d, align 4
  %726 = load i32, i32* %c, align 4
  %727 = add i32 %726, %725
  store i32 %727, i32* %c, align 4
  %728 = load i32, i32* %c, align 4
  %729 = load i32, i32* %a, align 4
  %730 = and i32 %728, %729
  %731 = load i32, i32* %d, align 4
  %732 = load i32, i32* %a, align 4
  %733 = xor i32 %732, -1
  %734 = and i32 %731, %733
  %735 = or i32 %730, %734
  %736 = load i32*, i32** %2, align 8
  %737 = getelementptr inbounds i32, i32* %736, i64 12
  %738 = load i32, i32* %737, align 4
  %739 = add i32 %735, %738
  %740 = add i32 %739, -1926607734
  %741 = load i32, i32* %b, align 4
  %742 = add i32 %741, %740
  store i32 %742, i32* %b, align 4
  %743 = load i32, i32* %b, align 4
  %744 = shl i32 %743, 20
  %745 = load i32, i32* %b, align 4
  %746 = lshr i32 %745, 12
  %747 = or i32 %744, %746
  store i32 %747, i32* %b, align 4
  %748 = load i32, i32* %c, align 4
  %749 = load i32, i32* %b, align 4
  %750 = add i32 %749, %748
  store i32 %750, i32* %b, align 4
  %751 = load i32, i32* %b, align 4
  %752 = load i32, i32* %c, align 4
  %753 = xor i32 %751, %752
  %754 = load i32, i32* %d, align 4
  %755 = xor i32 %753, %754
  %756 = load i32*, i32** %2, align 8
  %757 = getelementptr inbounds i32, i32* %756, i64 5
  %758 = load i32, i32* %757, align 4
  %759 = add i32 %755, %758
  %760 = add i32 %759, -378558
  %761 = load i32, i32* %a, align 4
  %762 = add i32 %761, %760
  store i32 %762, i32* %a, align 4
  %763 = load i32, i32* %a, align 4
  %764 = shl i32 %763, 4
  %765 = load i32, i32* %a, align 4
  %766 = lshr i32 %765, 28
  %767 = or i32 %764, %766
  store i32 %767, i32* %a, align 4
  %768 = load i32, i32* %b, align 4
  %769 = load i32, i32* %a, align 4
  %770 = add i32 %769, %768
  store i32 %770, i32* %a, align 4
  %771 = load i32, i32* %a, align 4
  %772 = load i32, i32* %b, align 4
  %773 = xor i32 %771, %772
  %774 = load i32, i32* %c, align 4
  %775 = xor i32 %773, %774
  %776 = load i32*, i32** %2, align 8
  %777 = getelementptr inbounds i32, i32* %776, i64 8
  %778 = load i32, i32* %777, align 4
  %779 = add i32 %775, %778
  %780 = add i32 %779, -2022574463
  %781 = load i32, i32* %d, align 4
  %782 = add i32 %781, %780
  store i32 %782, i32* %d, align 4
  %783 = load i32, i32* %d, align 4
  %784 = shl i32 %783, 11
  %785 = load i32, i32* %d, align 4
  %786 = lshr i32 %785, 21
  %787 = or i32 %784, %786
  store i32 %787, i32* %d, align 4
  %788 = load i32, i32* %a, align 4
  %789 = load i32, i32* %d, align 4
  %790 = add i32 %789, %788
  store i32 %790, i32* %d, align 4
  %791 = load i32, i32* %d, align 4
  %792 = load i32, i32* %a, align 4
  %793 = xor i32 %791, %792
  %794 = load i32, i32* %b, align 4
  %795 = xor i32 %793, %794
  %796 = load i32*, i32** %2, align 8
  %797 = getelementptr inbounds i32, i32* %796, i64 11
  %798 = load i32, i32* %797, align 4
  %799 = add i32 %795, %798
  %800 = add i32 %799, 1839030562
  %801 = load i32, i32* %c, align 4
  %802 = add i32 %801, %800
  store i32 %802, i32* %c, align 4
  %803 = load i32, i32* %c, align 4
  %804 = shl i32 %803, 16
  %805 = load i32, i32* %c, align 4
  %806 = lshr i32 %805, 16
  %807 = or i32 %804, %806
  store i32 %807, i32* %c, align 4
  %808 = load i32, i32* %d, align 4
  %809 = load i32, i32* %c, align 4
  %810 = add i32 %809, %808
  store i32 %810, i32* %c, align 4
  %811 = load i32, i32* %c, align 4
  %812 = load i32, i32* %d, align 4
  %813 = xor i32 %811, %812
  %814 = load i32, i32* %a, align 4
  %815 = xor i32 %813, %814
  %816 = load i32*, i32** %2, align 8
  %817 = getelementptr inbounds i32, i32* %816, i64 14
  %818 = load i32, i32* %817, align 4
  %819 = add i32 %815, %818
  %820 = add i32 %819, -35309556
  %821 = load i32, i32* %b, align 4
  %822 = add i32 %821, %820
  store i32 %822, i32* %b, align 4
  %823 = load i32, i32* %b, align 4
  %824 = shl i32 %823, 23
  %825 = load i32, i32* %b, align 4
  %826 = lshr i32 %825, 9
  %827 = or i32 %824, %826
  store i32 %827, i32* %b, align 4
  %828 = load i32, i32* %c, align 4
  %829 = load i32, i32* %b, align 4
  %830 = add i32 %829, %828
  store i32 %830, i32* %b, align 4
  %831 = load i32, i32* %b, align 4
  %832 = load i32, i32* %c, align 4
  %833 = xor i32 %831, %832
  %834 = load i32, i32* %d, align 4
  %835 = xor i32 %833, %834
  %836 = load i32*, i32** %2, align 8
  %837 = getelementptr inbounds i32, i32* %836, i64 1
  %838 = load i32, i32* %837, align 4
  %839 = add i32 %835, %838
  %840 = add i32 %839, -1530992060
  %841 = load i32, i32* %a, align 4
  %842 = add i32 %841, %840
  store i32 %842, i32* %a, align 4
  %843 = load i32, i32* %a, align 4
  %844 = shl i32 %843, 4
  %845 = load i32, i32* %a, align 4
  %846 = lshr i32 %845, 28
  %847 = or i32 %844, %846
  store i32 %847, i32* %a, align 4
  %848 = load i32, i32* %b, align 4
  %849 = load i32, i32* %a, align 4
  %850 = add i32 %849, %848
  store i32 %850, i32* %a, align 4
  %851 = load i32, i32* %a, align 4
  %852 = load i32, i32* %b, align 4
  %853 = xor i32 %851, %852
  %854 = load i32, i32* %c, align 4
  %855 = xor i32 %853, %854
  %856 = load i32*, i32** %2, align 8
  %857 = getelementptr inbounds i32, i32* %856, i64 4
  %858 = load i32, i32* %857, align 4
  %859 = add i32 %855, %858
  %860 = add i32 %859, 1272893353
  %861 = load i32, i32* %d, align 4
  %862 = add i32 %861, %860
  store i32 %862, i32* %d, align 4
  %863 = load i32, i32* %d, align 4
  %864 = shl i32 %863, 11
  %865 = load i32, i32* %d, align 4
  %866 = lshr i32 %865, 21
  %867 = or i32 %864, %866
  store i32 %867, i32* %d, align 4
  %868 = load i32, i32* %a, align 4
  %869 = load i32, i32* %d, align 4
  %870 = add i32 %869, %868
  store i32 %870, i32* %d, align 4
  %871 = load i32, i32* %d, align 4
  %872 = load i32, i32* %a, align 4
  %873 = xor i32 %871, %872
  %874 = load i32, i32* %b, align 4
  %875 = xor i32 %873, %874
  %876 = load i32*, i32** %2, align 8
  %877 = getelementptr inbounds i32, i32* %876, i64 7
  %878 = load i32, i32* %877, align 4
  %879 = add i32 %875, %878
  %880 = add i32 %879, -155497632
  %881 = load i32, i32* %c, align 4
  %882 = add i32 %881, %880
  store i32 %882, i32* %c, align 4
  %883 = load i32, i32* %c, align 4
  %884 = shl i32 %883, 16
  %885 = load i32, i32* %c, align 4
  %886 = lshr i32 %885, 16
  %887 = or i32 %884, %886
  store i32 %887, i32* %c, align 4
  %888 = load i32, i32* %d, align 4
  %889 = load i32, i32* %c, align 4
  %890 = add i32 %889, %888
  store i32 %890, i32* %c, align 4
  %891 = load i32, i32* %c, align 4
  %892 = load i32, i32* %d, align 4
  %893 = xor i32 %891, %892
  %894 = load i32, i32* %a, align 4
  %895 = xor i32 %893, %894
  %896 = load i32*, i32** %2, align 8
  %897 = getelementptr inbounds i32, i32* %896, i64 10
  %898 = load i32, i32* %897, align 4
  %899 = add i32 %895, %898
  %900 = add i32 %899, -1094730640
  %901 = load i32, i32* %b, align 4
  %902 = add i32 %901, %900
  store i32 %902, i32* %b, align 4
  %903 = load i32, i32* %b, align 4
  %904 = shl i32 %903, 23
  %905 = load i32, i32* %b, align 4
  %906 = lshr i32 %905, 9
  %907 = or i32 %904, %906
  store i32 %907, i32* %b, align 4
  %908 = load i32, i32* %c, align 4
  %909 = load i32, i32* %b, align 4
  %910 = add i32 %909, %908
  store i32 %910, i32* %b, align 4
  %911 = load i32, i32* %b, align 4
  %912 = load i32, i32* %c, align 4
  %913 = xor i32 %911, %912
  %914 = load i32, i32* %d, align 4
  %915 = xor i32 %913, %914
  %916 = load i32*, i32** %2, align 8
  %917 = getelementptr inbounds i32, i32* %916, i64 13
  %918 = load i32, i32* %917, align 4
  %919 = add i32 %915, %918
  %920 = add i32 %919, 681279174
  %921 = load i32, i32* %a, align 4
  %922 = add i32 %921, %920
  store i32 %922, i32* %a, align 4
  %923 = load i32, i32* %a, align 4
  %924 = shl i32 %923, 4
  %925 = load i32, i32* %a, align 4
  %926 = lshr i32 %925, 28
  %927 = or i32 %924, %926
  store i32 %927, i32* %a, align 4
  %928 = load i32, i32* %b, align 4
  %929 = load i32, i32* %a, align 4
  %930 = add i32 %929, %928
  store i32 %930, i32* %a, align 4
  %931 = load i32, i32* %a, align 4
  %932 = load i32, i32* %b, align 4
  %933 = xor i32 %931, %932
  %934 = load i32, i32* %c, align 4
  %935 = xor i32 %933, %934
  %936 = load i32*, i32** %2, align 8
  %937 = getelementptr inbounds i32, i32* %936, i64 0
  %938 = load i32, i32* %937, align 4
  %939 = add i32 %935, %938
  %940 = add i32 %939, -358537222
  %941 = load i32, i32* %d, align 4
  %942 = add i32 %941, %940
  store i32 %942, i32* %d, align 4
  %943 = load i32, i32* %d, align 4
  %944 = shl i32 %943, 11
  %945 = load i32, i32* %d, align 4
  %946 = lshr i32 %945, 21
  %947 = or i32 %944, %946
  store i32 %947, i32* %d, align 4
  %948 = load i32, i32* %a, align 4
  %949 = load i32, i32* %d, align 4
  %950 = add i32 %949, %948
  store i32 %950, i32* %d, align 4
  %951 = load i32, i32* %d, align 4
  %952 = load i32, i32* %a, align 4
  %953 = xor i32 %951, %952
  %954 = load i32, i32* %b, align 4
  %955 = xor i32 %953, %954
  %956 = load i32*, i32** %2, align 8
  %957 = getelementptr inbounds i32, i32* %956, i64 3
  %958 = load i32, i32* %957, align 4
  %959 = add i32 %955, %958
  %960 = add i32 %959, -722521979
  %961 = load i32, i32* %c, align 4
  %962 = add i32 %961, %960
  store i32 %962, i32* %c, align 4
  %963 = load i32, i32* %c, align 4
  %964 = shl i32 %963, 16
  %965 = load i32, i32* %c, align 4
  %966 = lshr i32 %965, 16
  %967 = or i32 %964, %966
  store i32 %967, i32* %c, align 4
  %968 = load i32, i32* %d, align 4
  %969 = load i32, i32* %c, align 4
  %970 = add i32 %969, %968
  store i32 %970, i32* %c, align 4
  %971 = load i32, i32* %c, align 4
  %972 = load i32, i32* %d, align 4
  %973 = xor i32 %971, %972
  %974 = load i32, i32* %a, align 4
  %975 = xor i32 %973, %974
  %976 = load i32*, i32** %2, align 8
  %977 = getelementptr inbounds i32, i32* %976, i64 6
  %978 = load i32, i32* %977, align 4
  %979 = add i32 %975, %978
  %980 = add i32 %979, 76029189
  %981 = load i32, i32* %b, align 4
  %982 = add i32 %981, %980
  store i32 %982, i32* %b, align 4
  %983 = load i32, i32* %b, align 4
  %984 = shl i32 %983, 23
  %985 = load i32, i32* %b, align 4
  %986 = lshr i32 %985, 9
  %987 = or i32 %984, %986
  store i32 %987, i32* %b, align 4
  %988 = load i32, i32* %c, align 4
  %989 = load i32, i32* %b, align 4
  %990 = add i32 %989, %988
  store i32 %990, i32* %b, align 4
  %991 = load i32, i32* %b, align 4
  %992 = load i32, i32* %c, align 4
  %993 = xor i32 %991, %992
  %994 = load i32, i32* %d, align 4
  %995 = xor i32 %993, %994
  %996 = load i32*, i32** %2, align 8
  %997 = getelementptr inbounds i32, i32* %996, i64 9
  %998 = load i32, i32* %997, align 4
  %999 = add i32 %995, %998
  %1000 = add i32 %999, -640364487
  %1001 = load i32, i32* %a, align 4
  %1002 = add i32 %1001, %1000
  store i32 %1002, i32* %a, align 4
  %1003 = load i32, i32* %a, align 4
  %1004 = shl i32 %1003, 4
  %1005 = load i32, i32* %a, align 4
  %1006 = lshr i32 %1005, 28
  %1007 = or i32 %1004, %1006
  store i32 %1007, i32* %a, align 4
  %1008 = load i32, i32* %b, align 4
  %1009 = load i32, i32* %a, align 4
  %1010 = add i32 %1009, %1008
  store i32 %1010, i32* %a, align 4
  %1011 = load i32, i32* %a, align 4
  %1012 = load i32, i32* %b, align 4
  %1013 = xor i32 %1011, %1012
  %1014 = load i32, i32* %c, align 4
  %1015 = xor i32 %1013, %1014
  %1016 = load i32*, i32** %2, align 8
  %1017 = getelementptr inbounds i32, i32* %1016, i64 12
  %1018 = load i32, i32* %1017, align 4
  %1019 = add i32 %1015, %1018
  %1020 = add i32 %1019, -421815835
  %1021 = load i32, i32* %d, align 4
  %1022 = add i32 %1021, %1020
  store i32 %1022, i32* %d, align 4
  %1023 = load i32, i32* %d, align 4
  %1024 = shl i32 %1023, 11
  %1025 = load i32, i32* %d, align 4
  %1026 = lshr i32 %1025, 21
  %1027 = or i32 %1024, %1026
  store i32 %1027, i32* %d, align 4
  %1028 = load i32, i32* %a, align 4
  %1029 = load i32, i32* %d, align 4
  %1030 = add i32 %1029, %1028
  store i32 %1030, i32* %d, align 4
  %1031 = load i32, i32* %d, align 4
  %1032 = load i32, i32* %a, align 4
  %1033 = xor i32 %1031, %1032
  %1034 = load i32, i32* %b, align 4
  %1035 = xor i32 %1033, %1034
  %1036 = load i32*, i32** %2, align 8
  %1037 = getelementptr inbounds i32, i32* %1036, i64 15
  %1038 = load i32, i32* %1037, align 4
  %1039 = add i32 %1035, %1038
  %1040 = add i32 %1039, 530742520
  %1041 = load i32, i32* %c, align 4
  %1042 = add i32 %1041, %1040
  store i32 %1042, i32* %c, align 4
  %1043 = load i32, i32* %c, align 4
  %1044 = shl i32 %1043, 16
  %1045 = load i32, i32* %c, align 4
  %1046 = lshr i32 %1045, 16
  %1047 = or i32 %1044, %1046
  store i32 %1047, i32* %c, align 4
  %1048 = load i32, i32* %d, align 4
  %1049 = load i32, i32* %c, align 4
  %1050 = add i32 %1049, %1048
  store i32 %1050, i32* %c, align 4
  %1051 = load i32, i32* %c, align 4
  %1052 = load i32, i32* %d, align 4
  %1053 = xor i32 %1051, %1052
  %1054 = load i32, i32* %a, align 4
  %1055 = xor i32 %1053, %1054
  %1056 = load i32*, i32** %2, align 8
  %1057 = getelementptr inbounds i32, i32* %1056, i64 2
  %1058 = load i32, i32* %1057, align 4
  %1059 = add i32 %1055, %1058
  %1060 = add i32 %1059, -995338651
  %1061 = load i32, i32* %b, align 4
  %1062 = add i32 %1061, %1060
  store i32 %1062, i32* %b, align 4
  %1063 = load i32, i32* %b, align 4
  %1064 = shl i32 %1063, 23
  %1065 = load i32, i32* %b, align 4
  %1066 = lshr i32 %1065, 9
  %1067 = or i32 %1064, %1066
  store i32 %1067, i32* %b, align 4
  %1068 = load i32, i32* %c, align 4
  %1069 = load i32, i32* %b, align 4
  %1070 = add i32 %1069, %1068
  store i32 %1070, i32* %b, align 4
  %1071 = load i32, i32* %c, align 4
  %1072 = load i32, i32* %b, align 4
  %1073 = load i32, i32* %d, align 4
  %1074 = xor i32 %1073, -1
  %1075 = or i32 %1072, %1074
  %1076 = xor i32 %1071, %1075
  %1077 = load i32*, i32** %2, align 8
  %1078 = getelementptr inbounds i32, i32* %1077, i64 0
  %1079 = load i32, i32* %1078, align 4
  %1080 = add i32 %1076, %1079
  %1081 = add i32 %1080, -198630844
  %1082 = load i32, i32* %a, align 4
  %1083 = add i32 %1082, %1081
  store i32 %1083, i32* %a, align 4
  %1084 = load i32, i32* %a, align 4
  %1085 = shl i32 %1084, 6
  %1086 = load i32, i32* %a, align 4
  %1087 = lshr i32 %1086, 26
  %1088 = or i32 %1085, %1087
  store i32 %1088, i32* %a, align 4
  %1089 = load i32, i32* %b, align 4
  %1090 = load i32, i32* %a, align 4
  %1091 = add i32 %1090, %1089
  store i32 %1091, i32* %a, align 4
  %1092 = load i32, i32* %b, align 4
  %1093 = load i32, i32* %a, align 4
  %1094 = load i32, i32* %c, align 4
  %1095 = xor i32 %1094, -1
  %1096 = or i32 %1093, %1095
  %1097 = xor i32 %1092, %1096
  %1098 = load i32*, i32** %2, align 8
  %1099 = getelementptr inbounds i32, i32* %1098, i64 7
  %1100 = load i32, i32* %1099, align 4
  %1101 = add i32 %1097, %1100
  %1102 = add i32 %1101, 1126891415
  %1103 = load i32, i32* %d, align 4
  %1104 = add i32 %1103, %1102
  store i32 %1104, i32* %d, align 4
  %1105 = load i32, i32* %d, align 4
  %1106 = shl i32 %1105, 10
  %1107 = load i32, i32* %d, align 4
  %1108 = lshr i32 %1107, 22
  %1109 = or i32 %1106, %1108
  store i32 %1109, i32* %d, align 4
  %1110 = load i32, i32* %a, align 4
  %1111 = load i32, i32* %d, align 4
  %1112 = add i32 %1111, %1110
  store i32 %1112, i32* %d, align 4
  %1113 = load i32, i32* %a, align 4
  %1114 = load i32, i32* %d, align 4
  %1115 = load i32, i32* %b, align 4
  %1116 = xor i32 %1115, -1
  %1117 = or i32 %1114, %1116
  %1118 = xor i32 %1113, %1117
  %1119 = load i32*, i32** %2, align 8
  %1120 = getelementptr inbounds i32, i32* %1119, i64 14
  %1121 = load i32, i32* %1120, align 4
  %1122 = add i32 %1118, %1121
  %1123 = add i32 %1122, -1416354905
  %1124 = load i32, i32* %c, align 4
  %1125 = add i32 %1124, %1123
  store i32 %1125, i32* %c, align 4
  %1126 = load i32, i32* %c, align 4
  %1127 = shl i32 %1126, 15
  %1128 = load i32, i32* %c, align 4
  %1129 = lshr i32 %1128, 17
  %1130 = or i32 %1127, %1129
  store i32 %1130, i32* %c, align 4
  %1131 = load i32, i32* %d, align 4
  %1132 = load i32, i32* %c, align 4
  %1133 = add i32 %1132, %1131
  store i32 %1133, i32* %c, align 4
  %1134 = load i32, i32* %d, align 4
  %1135 = load i32, i32* %c, align 4
  %1136 = load i32, i32* %a, align 4
  %1137 = xor i32 %1136, -1
  %1138 = or i32 %1135, %1137
  %1139 = xor i32 %1134, %1138
  %1140 = load i32*, i32** %2, align 8
  %1141 = getelementptr inbounds i32, i32* %1140, i64 5
  %1142 = load i32, i32* %1141, align 4
  %1143 = add i32 %1139, %1142
  %1144 = add i32 %1143, -57434055
  %1145 = load i32, i32* %b, align 4
  %1146 = add i32 %1145, %1144
  store i32 %1146, i32* %b, align 4
  %1147 = load i32, i32* %b, align 4
  %1148 = shl i32 %1147, 21
  %1149 = load i32, i32* %b, align 4
  %1150 = lshr i32 %1149, 11
  %1151 = or i32 %1148, %1150
  store i32 %1151, i32* %b, align 4
  %1152 = load i32, i32* %c, align 4
  %1153 = load i32, i32* %b, align 4
  %1154 = add i32 %1153, %1152
  store i32 %1154, i32* %b, align 4
  %1155 = load i32, i32* %c, align 4
  %1156 = load i32, i32* %b, align 4
  %1157 = load i32, i32* %d, align 4
  %1158 = xor i32 %1157, -1
  %1159 = or i32 %1156, %1158
  %1160 = xor i32 %1155, %1159
  %1161 = load i32*, i32** %2, align 8
  %1162 = getelementptr inbounds i32, i32* %1161, i64 12
  %1163 = load i32, i32* %1162, align 4
  %1164 = add i32 %1160, %1163
  %1165 = add i32 %1164, 1700485571
  %1166 = load i32, i32* %a, align 4
  %1167 = add i32 %1166, %1165
  store i32 %1167, i32* %a, align 4
  %1168 = load i32, i32* %a, align 4
  %1169 = shl i32 %1168, 6
  %1170 = load i32, i32* %a, align 4
  %1171 = lshr i32 %1170, 26
  %1172 = or i32 %1169, %1171
  store i32 %1172, i32* %a, align 4
  %1173 = load i32, i32* %b, align 4
  %1174 = load i32, i32* %a, align 4
  %1175 = add i32 %1174, %1173
  store i32 %1175, i32* %a, align 4
  %1176 = load i32, i32* %b, align 4
  %1177 = load i32, i32* %a, align 4
  %1178 = load i32, i32* %c, align 4
  %1179 = xor i32 %1178, -1
  %1180 = or i32 %1177, %1179
  %1181 = xor i32 %1176, %1180
  %1182 = load i32*, i32** %2, align 8
  %1183 = getelementptr inbounds i32, i32* %1182, i64 3
  %1184 = load i32, i32* %1183, align 4
  %1185 = add i32 %1181, %1184
  %1186 = add i32 %1185, -1894986606
  %1187 = load i32, i32* %d, align 4
  %1188 = add i32 %1187, %1186
  store i32 %1188, i32* %d, align 4
  %1189 = load i32, i32* %d, align 4
  %1190 = shl i32 %1189, 10
  %1191 = load i32, i32* %d, align 4
  %1192 = lshr i32 %1191, 22
  %1193 = or i32 %1190, %1192
  store i32 %1193, i32* %d, align 4
  %1194 = load i32, i32* %a, align 4
  %1195 = load i32, i32* %d, align 4
  %1196 = add i32 %1195, %1194
  store i32 %1196, i32* %d, align 4
  %1197 = load i32, i32* %a, align 4
  %1198 = load i32, i32* %d, align 4
  %1199 = load i32, i32* %b, align 4
  %1200 = xor i32 %1199, -1
  %1201 = or i32 %1198, %1200
  %1202 = xor i32 %1197, %1201
  %1203 = load i32*, i32** %2, align 8
  %1204 = getelementptr inbounds i32, i32* %1203, i64 10
  %1205 = load i32, i32* %1204, align 4
  %1206 = add i32 %1202, %1205
  %1207 = add i32 %1206, -1051523
  %1208 = load i32, i32* %c, align 4
  %1209 = add i32 %1208, %1207
  store i32 %1209, i32* %c, align 4
  %1210 = load i32, i32* %c, align 4
  %1211 = shl i32 %1210, 15
  %1212 = load i32, i32* %c, align 4
  %1213 = lshr i32 %1212, 17
  %1214 = or i32 %1211, %1213
  store i32 %1214, i32* %c, align 4
  %1215 = load i32, i32* %d, align 4
  %1216 = load i32, i32* %c, align 4
  %1217 = add i32 %1216, %1215
  store i32 %1217, i32* %c, align 4
  %1218 = load i32, i32* %d, align 4
  %1219 = load i32, i32* %c, align 4
  %1220 = load i32, i32* %a, align 4
  %1221 = xor i32 %1220, -1
  %1222 = or i32 %1219, %1221
  %1223 = xor i32 %1218, %1222
  %1224 = load i32*, i32** %2, align 8
  %1225 = getelementptr inbounds i32, i32* %1224, i64 1
  %1226 = load i32, i32* %1225, align 4
  %1227 = add i32 %1223, %1226
  %1228 = add i32 %1227, -2054922799
  %1229 = load i32, i32* %b, align 4
  %1230 = add i32 %1229, %1228
  store i32 %1230, i32* %b, align 4
  %1231 = load i32, i32* %b, align 4
  %1232 = shl i32 %1231, 21
  %1233 = load i32, i32* %b, align 4
  %1234 = lshr i32 %1233, 11
  %1235 = or i32 %1232, %1234
  store i32 %1235, i32* %b, align 4
  %1236 = load i32, i32* %c, align 4
  %1237 = load i32, i32* %b, align 4
  %1238 = add i32 %1237, %1236
  store i32 %1238, i32* %b, align 4
  %1239 = load i32, i32* %c, align 4
  %1240 = load i32, i32* %b, align 4
  %1241 = load i32, i32* %d, align 4
  %1242 = xor i32 %1241, -1
  %1243 = or i32 %1240, %1242
  %1244 = xor i32 %1239, %1243
  %1245 = load i32*, i32** %2, align 8
  %1246 = getelementptr inbounds i32, i32* %1245, i64 8
  %1247 = load i32, i32* %1246, align 4
  %1248 = add i32 %1244, %1247
  %1249 = add i32 %1248, 1873313359
  %1250 = load i32, i32* %a, align 4
  %1251 = add i32 %1250, %1249
  store i32 %1251, i32* %a, align 4
  %1252 = load i32, i32* %a, align 4
  %1253 = shl i32 %1252, 6
  %1254 = load i32, i32* %a, align 4
  %1255 = lshr i32 %1254, 26
  %1256 = or i32 %1253, %1255
  store i32 %1256, i32* %a, align 4
  %1257 = load i32, i32* %b, align 4
  %1258 = load i32, i32* %a, align 4
  %1259 = add i32 %1258, %1257
  store i32 %1259, i32* %a, align 4
  %1260 = load i32, i32* %b, align 4
  %1261 = load i32, i32* %a, align 4
  %1262 = load i32, i32* %c, align 4
  %1263 = xor i32 %1262, -1
  %1264 = or i32 %1261, %1263
  %1265 = xor i32 %1260, %1264
  %1266 = load i32*, i32** %2, align 8
  %1267 = getelementptr inbounds i32, i32* %1266, i64 15
  %1268 = load i32, i32* %1267, align 4
  %1269 = add i32 %1265, %1268
  %1270 = add i32 %1269, -30611744
  %1271 = load i32, i32* %d, align 4
  %1272 = add i32 %1271, %1270
  store i32 %1272, i32* %d, align 4
  %1273 = load i32, i32* %d, align 4
  %1274 = shl i32 %1273, 10
  %1275 = load i32, i32* %d, align 4
  %1276 = lshr i32 %1275, 22
  %1277 = or i32 %1274, %1276
  store i32 %1277, i32* %d, align 4
  %1278 = load i32, i32* %a, align 4
  %1279 = load i32, i32* %d, align 4
  %1280 = add i32 %1279, %1278
  store i32 %1280, i32* %d, align 4
  %1281 = load i32, i32* %a, align 4
  %1282 = load i32, i32* %d, align 4
  %1283 = load i32, i32* %b, align 4
  %1284 = xor i32 %1283, -1
  %1285 = or i32 %1282, %1284
  %1286 = xor i32 %1281, %1285
  %1287 = load i32*, i32** %2, align 8
  %1288 = getelementptr inbounds i32, i32* %1287, i64 6
  %1289 = load i32, i32* %1288, align 4
  %1290 = add i32 %1286, %1289
  %1291 = add i32 %1290, -1560198380
  %1292 = load i32, i32* %c, align 4
  %1293 = add i32 %1292, %1291
  store i32 %1293, i32* %c, align 4
  %1294 = load i32, i32* %c, align 4
  %1295 = shl i32 %1294, 15
  %1296 = load i32, i32* %c, align 4
  %1297 = lshr i32 %1296, 17
  %1298 = or i32 %1295, %1297
  store i32 %1298, i32* %c, align 4
  %1299 = load i32, i32* %d, align 4
  %1300 = load i32, i32* %c, align 4
  %1301 = add i32 %1300, %1299
  store i32 %1301, i32* %c, align 4
  %1302 = load i32, i32* %d, align 4
  %1303 = load i32, i32* %c, align 4
  %1304 = load i32, i32* %a, align 4
  %1305 = xor i32 %1304, -1
  %1306 = or i32 %1303, %1305
  %1307 = xor i32 %1302, %1306
  %1308 = load i32*, i32** %2, align 8
  %1309 = getelementptr inbounds i32, i32* %1308, i64 13
  %1310 = load i32, i32* %1309, align 4
  %1311 = add i32 %1307, %1310
  %1312 = add i32 %1311, 1309151649
  %1313 = load i32, i32* %b, align 4
  %1314 = add i32 %1313, %1312
  store i32 %1314, i32* %b, align 4
  %1315 = load i32, i32* %b, align 4
  %1316 = shl i32 %1315, 21
  %1317 = load i32, i32* %b, align 4
  %1318 = lshr i32 %1317, 11
  %1319 = or i32 %1316, %1318
  store i32 %1319, i32* %b, align 4
  %1320 = load i32, i32* %c, align 4
  %1321 = load i32, i32* %b, align 4
  %1322 = add i32 %1321, %1320
  store i32 %1322, i32* %b, align 4
  %1323 = load i32, i32* %c, align 4
  %1324 = load i32, i32* %b, align 4
  %1325 = load i32, i32* %d, align 4
  %1326 = xor i32 %1325, -1
  %1327 = or i32 %1324, %1326
  %1328 = xor i32 %1323, %1327
  %1329 = load i32*, i32** %2, align 8
  %1330 = getelementptr inbounds i32, i32* %1329, i64 4
  %1331 = load i32, i32* %1330, align 4
  %1332 = add i32 %1328, %1331
  %1333 = add i32 %1332, -145523070
  %1334 = load i32, i32* %a, align 4
  %1335 = add i32 %1334, %1333
  store i32 %1335, i32* %a, align 4
  %1336 = load i32, i32* %a, align 4
  %1337 = shl i32 %1336, 6
  %1338 = load i32, i32* %a, align 4
  %1339 = lshr i32 %1338, 26
  %1340 = or i32 %1337, %1339
  store i32 %1340, i32* %a, align 4
  %1341 = load i32, i32* %b, align 4
  %1342 = load i32, i32* %a, align 4
  %1343 = add i32 %1342, %1341
  store i32 %1343, i32* %a, align 4
  %1344 = load i32, i32* %b, align 4
  %1345 = load i32, i32* %a, align 4
  %1346 = load i32, i32* %c, align 4
  %1347 = xor i32 %1346, -1
  %1348 = or i32 %1345, %1347
  %1349 = xor i32 %1344, %1348
  %1350 = load i32*, i32** %2, align 8
  %1351 = getelementptr inbounds i32, i32* %1350, i64 11
  %1352 = load i32, i32* %1351, align 4
  %1353 = add i32 %1349, %1352
  %1354 = add i32 %1353, -1120210379
  %1355 = load i32, i32* %d, align 4
  %1356 = add i32 %1355, %1354
  store i32 %1356, i32* %d, align 4
  %1357 = load i32, i32* %d, align 4
  %1358 = shl i32 %1357, 10
  %1359 = load i32, i32* %d, align 4
  %1360 = lshr i32 %1359, 22
  %1361 = or i32 %1358, %1360
  store i32 %1361, i32* %d, align 4
  %1362 = load i32, i32* %a, align 4
  %1363 = load i32, i32* %d, align 4
  %1364 = add i32 %1363, %1362
  store i32 %1364, i32* %d, align 4
  %1365 = load i32, i32* %a, align 4
  %1366 = load i32, i32* %d, align 4
  %1367 = load i32, i32* %b, align 4
  %1368 = xor i32 %1367, -1
  %1369 = or i32 %1366, %1368
  %1370 = xor i32 %1365, %1369
  %1371 = load i32*, i32** %2, align 8
  %1372 = getelementptr inbounds i32, i32* %1371, i64 2
  %1373 = load i32, i32* %1372, align 4
  %1374 = add i32 %1370, %1373
  %1375 = add i32 %1374, 718787259
  %1376 = load i32, i32* %c, align 4
  %1377 = add i32 %1376, %1375
  store i32 %1377, i32* %c, align 4
  %1378 = load i32, i32* %c, align 4
  %1379 = shl i32 %1378, 15
  %1380 = load i32, i32* %c, align 4
  %1381 = lshr i32 %1380, 17
  %1382 = or i32 %1379, %1381
  store i32 %1382, i32* %c, align 4
  %1383 = load i32, i32* %d, align 4
  %1384 = load i32, i32* %c, align 4
  %1385 = add i32 %1384, %1383
  store i32 %1385, i32* %c, align 4
  %1386 = load i32, i32* %d, align 4
  %1387 = load i32, i32* %c, align 4
  %1388 = load i32, i32* %a, align 4
  %1389 = xor i32 %1388, -1
  %1390 = or i32 %1387, %1389
  %1391 = xor i32 %1386, %1390
  %1392 = load i32*, i32** %2, align 8
  %1393 = getelementptr inbounds i32, i32* %1392, i64 9
  %1394 = load i32, i32* %1393, align 4
  %1395 = add i32 %1391, %1394
  %1396 = add i32 %1395, -343485551
  %1397 = load i32, i32* %b, align 4
  %1398 = add i32 %1397, %1396
  store i32 %1398, i32* %b, align 4
  %1399 = load i32, i32* %b, align 4
  %1400 = shl i32 %1399, 21
  %1401 = load i32, i32* %b, align 4
  %1402 = lshr i32 %1401, 11
  %1403 = or i32 %1400, %1402
  store i32 %1403, i32* %b, align 4
  %1404 = load i32, i32* %c, align 4
  %1405 = load i32, i32* %b, align 4
  %1406 = add i32 %1405, %1404
  store i32 %1406, i32* %b, align 4
  %1407 = load i32, i32* %a, align 4
  %1408 = load i32*, i32** %1, align 8
  %1409 = getelementptr inbounds i32, i32* %1408, i64 0
  %1410 = load i32, i32* %1409, align 4
  %1411 = add i32 %1410, %1407
  store i32 %1411, i32* %1409, align 4
  %1412 = load i32, i32* %b, align 4
  %1413 = load i32*, i32** %1, align 8
  %1414 = getelementptr inbounds i32, i32* %1413, i64 1
  %1415 = load i32, i32* %1414, align 4
  %1416 = add i32 %1415, %1412
  store i32 %1416, i32* %1414, align 4
  %1417 = load i32, i32* %c, align 4
  %1418 = load i32*, i32** %1, align 8
  %1419 = getelementptr inbounds i32, i32* %1418, i64 2
  %1420 = load i32, i32* %1419, align 4
  %1421 = add i32 %1420, %1417
  store i32 %1421, i32* %1419, align 4
  %1422 = load i32, i32* %d, align 4
  %1423 = load i32*, i32** %1, align 8
  %1424 = getelementptr inbounds i32, i32* %1423, i64 3
  %1425 = load i32, i32* %1424, align 4
  %1426 = add i32 %1425, %1422
  store i32 %1426, i32* %1424, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MDTestSuite() #0 {
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.6, i32 0, i32 0))
  call void @MDString(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal void @MDString(i8* %inString) #0 {
  %1 = alloca i8*, align 8
  %mdContext = alloca %struct.MD5_CTX, align 4
  %len = alloca i32, align 4
  store i8* %inString, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i64 @strlen(i8* %2) #3
  %4 = trunc i64 %3 to i32
  store i32 %4, i32* %len, align 4
  call void @MD5Init(%struct.MD5_CTX* %mdContext)
  %5 = load i8*, i8** %1, align 8
  %6 = load i32, i32* %len, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext, i8* %5, i32 %6)
  call void @MD5Final(%struct.MD5_CTX* %mdContext)
  call void @MDPrint(%struct.MD5_CTX* %mdContext)
  %7 = load i8*, i8** %1, align 8
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i8* %7)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind uwtable
define internal void @MDPrint(%struct.MD5_CTX* %mdContext) #0 {
  %1 = alloca %struct.MD5_CTX*, align 8
  %i = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 16
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.MD5_CTX*, %struct.MD5_CTX** %1, align 8
  %9 = getelementptr inbounds %struct.MD5_CTX, %struct.MD5_CTX* %8, i32 0, i32 3
  %10 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i32 0, i64 %7
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i32
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i32 %12)
  br label %14

; <label>:14                                      ; preds = %5
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
