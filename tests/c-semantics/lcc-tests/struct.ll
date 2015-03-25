; ModuleID = './struct.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.odd = type { [3 x i8] }
%struct.point = type { i32, i32 }
%struct.rect = type { %struct.point, %struct.point }

@y = global %struct.odd { [3 x i8] c"ab\00" }, align 1
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@main.maxpt = private unnamed_addr constant %struct.point { i32 320, i32 320 }, align 4
@main.pts = private unnamed_addr constant [4 x %struct.point] [%struct.point { i32 -1, i32 -1 }, %struct.point { i32 1, i32 1 }, %struct.point { i32 20, i32 300 }, %struct.point { i32 500, i32 400 }], align 16
@.str1 = private unnamed_addr constant [12 x i8] c"(%d,%d) is \00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"not \00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"within [%d,%d; %d,%d]\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @addpoint(i64 %p1.coerce, i64 %p2.coerce) #0 {
  %1 = alloca %struct.point, align 4
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %2 = bitcast %struct.point* %p1 to i64*
  store i64 %p1.coerce, i64* %2, align 1
  %3 = bitcast %struct.point* %p2 to i64*
  store i64 %p2.coerce, i64* %3, align 1
  %4 = getelementptr inbounds %struct.point* %p2, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = getelementptr inbounds %struct.point* %p1, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = add nsw i32 %7, %5
  store i32 %8, i32* %6, align 4
  %9 = getelementptr inbounds %struct.point* %p2, i32 0, i32 1
  %10 = load i32* %9, align 4
  %11 = getelementptr inbounds %struct.point* %p1, i32 0, i32 1
  %12 = load i32* %11, align 4
  %13 = add nsw i32 %12, %10
  store i32 %13, i32* %11, align 4
  %14 = bitcast %struct.point* %1 to i8*
  %15 = bitcast %struct.point* %p1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 4, i1 false)
  %16 = bitcast %struct.point* %1 to i64*
  %17 = load i64* %16, align 1
  ret i64 %17
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define { i64, i64 } @canonrect(i64 %r.coerce0, i64 %r.coerce1) #0 {
  %1 = alloca %struct.rect, align 4
  %r = alloca %struct.rect, align 8
  %temp = alloca %struct.rect, align 4
  %2 = bitcast %struct.rect* %r to { i64, i64 }*
  %3 = getelementptr { i64, i64 }* %2, i32 0, i32 0
  store i64 %r.coerce0, i64* %3
  %4 = getelementptr { i64, i64 }* %2, i32 0, i32 1
  store i64 %r.coerce1, i64* %4
  %5 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %6 = getelementptr inbounds %struct.point* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %9 = getelementptr inbounds %struct.point* %8, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %14 = getelementptr inbounds %struct.point* %13, i32 0, i32 0
  %15 = load i32* %14, align 4
  br label %20

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %18 = getelementptr inbounds %struct.point* %17, i32 0, i32 0
  %19 = load i32* %18, align 4
  br label %20

; <label>:20                                      ; preds = %16, %12
  %21 = phi i32 [ %15, %12 ], [ %19, %16 ]
  %22 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 0
  %23 = getelementptr inbounds %struct.point* %22, i32 0, i32 0
  store i32 %21, i32* %23, align 4
  %24 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %25 = getelementptr inbounds %struct.point* %24, i32 0, i32 1
  %26 = load i32* %25, align 4
  %27 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %28 = getelementptr inbounds %struct.point* %27, i32 0, i32 1
  %29 = load i32* %28, align 4
  %30 = icmp slt i32 %26, %29
  br i1 %30, label %31, label %35

; <label>:31                                      ; preds = %20
  %32 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %33 = getelementptr inbounds %struct.point* %32, i32 0, i32 1
  %34 = load i32* %33, align 4
  br label %39

; <label>:35                                      ; preds = %20
  %36 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %37 = getelementptr inbounds %struct.point* %36, i32 0, i32 1
  %38 = load i32* %37, align 4
  br label %39

; <label>:39                                      ; preds = %35, %31
  %40 = phi i32 [ %34, %31 ], [ %38, %35 ]
  %41 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 0
  %42 = getelementptr inbounds %struct.point* %41, i32 0, i32 1
  store i32 %40, i32* %42, align 4
  %43 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %44 = getelementptr inbounds %struct.point* %43, i32 0, i32 0
  %45 = load i32* %44, align 4
  %46 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %47 = getelementptr inbounds %struct.point* %46, i32 0, i32 0
  %48 = load i32* %47, align 4
  %49 = icmp sgt i32 %45, %48
  br i1 %49, label %50, label %54

; <label>:50                                      ; preds = %39
  %51 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %52 = getelementptr inbounds %struct.point* %51, i32 0, i32 0
  %53 = load i32* %52, align 4
  br label %58

; <label>:54                                      ; preds = %39
  %55 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %56 = getelementptr inbounds %struct.point* %55, i32 0, i32 0
  %57 = load i32* %56, align 4
  br label %58

; <label>:58                                      ; preds = %54, %50
  %59 = phi i32 [ %53, %50 ], [ %57, %54 ]
  %60 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 1
  %61 = getelementptr inbounds %struct.point* %60, i32 0, i32 0
  store i32 %59, i32* %61, align 4
  %62 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %63 = getelementptr inbounds %struct.point* %62, i32 0, i32 1
  %64 = load i32* %63, align 4
  %65 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %66 = getelementptr inbounds %struct.point* %65, i32 0, i32 1
  %67 = load i32* %66, align 4
  %68 = icmp sgt i32 %64, %67
  br i1 %68, label %69, label %73

; <label>:69                                      ; preds = %58
  %70 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %71 = getelementptr inbounds %struct.point* %70, i32 0, i32 1
  %72 = load i32* %71, align 4
  br label %77

; <label>:73                                      ; preds = %58
  %74 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %75 = getelementptr inbounds %struct.point* %74, i32 0, i32 1
  %76 = load i32* %75, align 4
  br label %77

; <label>:77                                      ; preds = %73, %69
  %78 = phi i32 [ %72, %69 ], [ %76, %73 ]
  %79 = getelementptr inbounds %struct.rect* %temp, i32 0, i32 1
  %80 = getelementptr inbounds %struct.point* %79, i32 0, i32 1
  store i32 %78, i32* %80, align 4
  %81 = bitcast %struct.rect* %1 to i8*
  %82 = bitcast %struct.rect* %temp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %81, i8* %82, i64 16, i32 4, i1 false)
  %83 = bitcast %struct.rect* %1 to { i64, i64 }*
  %84 = load { i64, i64 }* %83, align 1
  ret { i64, i64 } %84
}

; Function Attrs: nounwind uwtable
define i64 @makepoint(i32 %x, i32 %y) #0 {
  %1 = alloca %struct.point, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %p = alloca %struct.point, align 4
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = getelementptr inbounds %struct.point* %p, i32 0, i32 0
  store i32 %4, i32* %5, align 4
  %6 = load i32* %3, align 4
  %7 = getelementptr inbounds %struct.point* %p, i32 0, i32 1
  store i32 %6, i32* %7, align 4
  %8 = bitcast %struct.point* %1 to i8*
  %9 = bitcast %struct.point* %p to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 4, i1 false)
  %10 = bitcast %struct.point* %1 to i64*
  %11 = load i64* %10, align 1
  ret i64 %11
}

; Function Attrs: nounwind uwtable
define { i64, i64 } @makerect(i64 %p1.coerce, i64 %p2.coerce) #0 {
  %1 = alloca %struct.rect, align 4
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %r = alloca %struct.rect, align 4
  %2 = bitcast %struct.point* %p1 to i64*
  store i64 %p1.coerce, i64* %2, align 1
  %3 = bitcast %struct.point* %p2 to i64*
  store i64 %p2.coerce, i64* %3, align 1
  %4 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %5 = bitcast %struct.point* %4 to i8*
  %6 = bitcast %struct.point* %p1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 8, i32 4, i1 false)
  %7 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %8 = bitcast %struct.point* %7 to i8*
  %9 = bitcast %struct.point* %p2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 4, i1 false)
  %10 = bitcast %struct.rect* %r to { i64, i64 }*
  %11 = getelementptr { i64, i64 }* %10, i32 0, i32 0
  %12 = load i64* %11, align 1
  %13 = getelementptr { i64, i64 }* %10, i32 0, i32 1
  %14 = load i64* %13, align 1
  %15 = call { i64, i64 } @canonrect(i64 %12, i64 %14)
  %16 = bitcast %struct.rect* %1 to { i64, i64 }*
  %17 = getelementptr { i64, i64 }* %16, i32 0, i32 0
  %18 = extractvalue { i64, i64 } %15, 0
  store i64 %18, i64* %17, align 1
  %19 = getelementptr { i64, i64 }* %16, i32 0, i32 1
  %20 = extractvalue { i64, i64 } %15, 1
  store i64 %20, i64* %19, align 1
  %21 = bitcast %struct.rect* %1 to { i64, i64 }*
  %22 = load { i64, i64 }* %21, align 1
  ret { i64, i64 } %22
}

; Function Attrs: nounwind uwtable
define i32 @ptinrect(i64 %p.coerce, i64 %r.coerce0, i64 %r.coerce1) #0 {
  %p = alloca %struct.point, align 8
  %r = alloca %struct.rect, align 8
  %1 = bitcast %struct.point* %p to i64*
  store i64 %p.coerce, i64* %1, align 1
  %2 = bitcast %struct.rect* %r to { i64, i64 }*
  %3 = getelementptr { i64, i64 }* %2, i32 0, i32 0
  store i64 %r.coerce0, i64* %3
  %4 = getelementptr { i64, i64 }* %2, i32 0, i32 1
  store i64 %r.coerce1, i64* %4
  %5 = getelementptr inbounds %struct.point* %p, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %8 = getelementptr inbounds %struct.point* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = icmp sge i32 %6, %9
  br i1 %10, label %11, label %32

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.point* %p, i32 0, i32 0
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %15 = getelementptr inbounds %struct.point* %14, i32 0, i32 0
  %16 = load i32* %15, align 4
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %32

; <label>:18                                      ; preds = %11
  %19 = getelementptr inbounds %struct.point* %p, i32 0, i32 1
  %20 = load i32* %19, align 4
  %21 = getelementptr inbounds %struct.rect* %r, i32 0, i32 0
  %22 = getelementptr inbounds %struct.point* %21, i32 0, i32 1
  %23 = load i32* %22, align 4
  %24 = icmp sge i32 %20, %23
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %18
  %26 = getelementptr inbounds %struct.point* %p, i32 0, i32 1
  %27 = load i32* %26, align 4
  %28 = getelementptr inbounds %struct.rect* %r, i32 0, i32 1
  %29 = getelementptr inbounds %struct.point* %28, i32 0, i32 1
  %30 = load i32* %29, align 4
  %31 = icmp slt i32 %27, %30
  br label %32

; <label>:32                                      ; preds = %25, %18, %11, %0
  %33 = phi i1 [ false, %18 ], [ false, %11 ], [ false, %0 ], [ %31, %25 ]
  %34 = zext i1 %33 to i32
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define void @odd(i24 %y.coerce) #0 {
  %y = alloca %struct.odd, align 4
  %1 = alloca i24
  %x = alloca %struct.odd, align 1
  %2 = getelementptr %struct.odd* %y, i32 0, i32 0
  store i24 %y.coerce, i24* %1
  %3 = bitcast i24* %1 to i8*
  %4 = bitcast [3 x i8]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %3, i64 3, i32 1, i1 false)
  %5 = bitcast %struct.odd* %x to i8*
  %6 = bitcast %struct.odd* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 3, i32 1, i1 false)
  %7 = getelementptr inbounds %struct.odd* %x, i32 0, i32 0
  %8 = getelementptr inbounds [3 x i8]* %7, i32 0, i32 0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* %8)
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.point, align 4
  %origin = alloca %struct.point, align 4
  %maxpt = alloca %struct.point, align 4
  %pts = alloca [4 x %struct.point], align 16
  %screen = alloca %struct.rect, align 4
  %2 = alloca %struct.point, align 4
  %3 = alloca %struct.point, align 4
  %4 = alloca %struct.point, align 4
  %5 = alloca %struct.point, align 4
  %6 = alloca %struct.point, align 4
  %7 = alloca %struct.point, align 4
  %8 = alloca i24
  store i32 0, i32* %1
  %9 = bitcast %struct.point* %origin to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 8, i32 4, i1 false)
  %10 = bitcast %struct.point* %maxpt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast (%struct.point* @main.maxpt to i8*), i64 8, i32 4, i1 false)
  %11 = bitcast [4 x %struct.point]* %pts to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* bitcast ([4 x %struct.point]* @main.pts to i8*), i64 32, i32 16, i1 false)
  %12 = call i64 @makepoint(i32 -10, i32 -10)
  %13 = bitcast %struct.point* %3 to i64*
  store i64 %12, i64* %13, align 1
  %14 = bitcast %struct.point* %maxpt to i64*
  %15 = load i64* %14, align 1
  %16 = bitcast %struct.point* %3 to i64*
  %17 = load i64* %16, align 1
  %18 = call i64 @addpoint(i64 %15, i64 %17)
  %19 = bitcast %struct.point* %2 to i64*
  store i64 %18, i64* %19, align 1
  %20 = call i64 @makepoint(i32 10, i32 10)
  %21 = bitcast %struct.point* %5 to i64*
  store i64 %20, i64* %21, align 1
  %22 = bitcast %struct.point* %origin to i64*
  %23 = load i64* %22, align 1
  %24 = bitcast %struct.point* %5 to i64*
  %25 = load i64* %24, align 1
  %26 = call i64 @addpoint(i64 %23, i64 %25)
  %27 = bitcast %struct.point* %4 to i64*
  store i64 %26, i64* %27, align 1
  %28 = bitcast %struct.point* %2 to i64*
  %29 = load i64* %28, align 1
  %30 = bitcast %struct.point* %4 to i64*
  %31 = load i64* %30, align 1
  %32 = call { i64, i64 } @makerect(i64 %29, i64 %31)
  %33 = bitcast %struct.rect* %screen to { i64, i64 }*
  %34 = getelementptr { i64, i64 }* %33, i32 0, i32 0
  %35 = extractvalue { i64, i64 } %32, 0
  store i64 %35, i64* %34, align 1
  %36 = getelementptr { i64, i64 }* %33, i32 0, i32 1
  %37 = extractvalue { i64, i64 } %32, 1
  store i64 %37, i64* %36, align 1
  store i32 0, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %92, %0
  %39 = load i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = icmp ult i64 %40, 4
  br i1 %41, label %42, label %95

; <label>:42                                      ; preds = %38
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [4 x %struct.point]* %pts, i32 0, i64 %44
  %46 = getelementptr inbounds %struct.point* %45, i32 0, i32 0
  %47 = load i32* %46, align 4
  %48 = load i32* %i, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [4 x %struct.point]* %pts, i32 0, i64 %49
  %51 = getelementptr inbounds %struct.point* %50, i32 0, i32 0
  %52 = load i32* %51, align 4
  %53 = load i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [4 x %struct.point]* %pts, i32 0, i64 %54
  %56 = getelementptr inbounds %struct.point* %55, i32 0, i32 1
  %57 = load i32* %56, align 4
  %58 = call i64 @makepoint(i32 %52, i32 %57)
  %59 = bitcast %struct.point* %7 to i64*
  store i64 %58, i64* %59, align 1
  %60 = bitcast %struct.point* %x to i8*
  %61 = bitcast %struct.point* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %60, i8* %61, i64 8, i32 4, i1 false)
  %62 = bitcast %struct.point* %6 to i8*
  %63 = bitcast %struct.point* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* %63, i64 8, i32 4, i1 false)
  %64 = getelementptr inbounds %struct.point* %6, i32 0, i32 1
  %65 = load i32* %64, align 4
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %47, i32 %65)
  %67 = bitcast %struct.point* %x to i64*
  %68 = load i64* %67, align 1
  %69 = bitcast %struct.rect* %screen to { i64, i64 }*
  %70 = getelementptr { i64, i64 }* %69, i32 0, i32 0
  %71 = load i64* %70, align 1
  %72 = getelementptr { i64, i64 }* %69, i32 0, i32 1
  %73 = load i64* %72, align 1
  %74 = call i32 @ptinrect(i64 %68, i64 %71, i64 %73)
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76                                      ; preds = %42
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  br label %78

; <label>:78                                      ; preds = %76, %42
  %79 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 0
  %80 = getelementptr inbounds %struct.point* %79, i32 0, i32 0
  %81 = load i32* %80, align 4
  %82 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 0
  %83 = getelementptr inbounds %struct.point* %82, i32 0, i32 1
  %84 = load i32* %83, align 4
  %85 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 1
  %86 = getelementptr inbounds %struct.point* %85, i32 0, i32 0
  %87 = load i32* %86, align 4
  %88 = getelementptr inbounds %struct.rect* %screen, i32 0, i32 1
  %89 = getelementptr inbounds %struct.point* %88, i32 0, i32 1
  %90 = load i32* %89, align 4
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %81, i32 %84, i32 %87, i32 %90)
  br label %92

; <label>:92                                      ; preds = %78
  %93 = load i32* %i, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %i, align 4
  br label %38

; <label>:95                                      ; preds = %38
  %96 = bitcast i24* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %96, i8* getelementptr inbounds (%struct.odd* @y, i32 0, i32 0, i32 0), i64 3, i32 1, i1 false)
  %97 = load i24* %8
  call void @odd(i24 %97)
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %99 = load i32* %1
  ret i32 %99
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
