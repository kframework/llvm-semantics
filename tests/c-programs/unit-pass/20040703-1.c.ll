; ModuleID = './20040703-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cpp_num = type { i32, i32, i32, i32 }

@precision = global i32 64, align 4
@n = global i32 16, align 4
@num = global %struct.cpp_num { i32 0, i32 3, i32 0, i32 0 }, align 4

; Function Attrs: nounwind uwtable
define { i64, i64 } @num_lshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) #0 {
  %1 = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %orig = alloca %struct.cpp_num, align 4
  %m = alloca i32, align 4
  %4 = alloca %struct.cpp_num, align 4
  %maybe_orig = alloca %struct.cpp_num, align 4
  %5 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %6 = getelementptr { i64, i64 }, { i64, i64 }* %5, i32 0, i32 0
  store i64 %num.coerce0, i64* %6
  %7 = getelementptr { i64, i64 }, { i64, i64 }* %5, i32 0, i32 1
  store i64 %num.coerce1, i64* %7
  store i32 %precision, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  %8 = load i32, i32* %3, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp uge i32 %8, %9
  br i1 %10, label %11, label %29

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %23, label %15

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  %20 = or i32 %17, %19
  %21 = icmp eq i32 %20, 0
  %22 = xor i1 %21, true
  br label %23

; <label>:23                                      ; preds = %15, %11
  %24 = phi i1 [ false, %11 ], [ %22, %15 ]
  %25 = zext i1 %24 to i32
  %26 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 3
  store i32 %25, i32* %26, align 4
  %27 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  store i32 0, i32* %27, align 4
  %28 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 0, i32* %28, align 4
  br label %117

; <label>:29                                      ; preds = %0
  %30 = load i32, i32* %3, align 4
  store i32 %30, i32* %m, align 4
  %31 = bitcast %struct.cpp_num* %orig to i8*
  %32 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 16, i32 4, i1 false)
  %33 = load i32, i32* %m, align 4
  %34 = zext i32 %33 to i64
  %35 = icmp uge i64 %34, 32
  br i1 %35, label %36, label %45

; <label>:36                                      ; preds = %29
  %37 = load i32, i32* %m, align 4
  %38 = zext i32 %37 to i64
  %39 = sub i64 %38, 32
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* %m, align 4
  %41 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 %42, i32* %43, align 4
  %44 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  store i32 0, i32* %44, align 4
  br label %45

; <label>:45                                      ; preds = %36, %29
  %46 = load i32, i32* %m, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %66

; <label>:48                                      ; preds = %45
  %49 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %50 = load i32, i32* %49, align 4
  %51 = load i32, i32* %m, align 4
  %52 = shl i32 %50, %51
  %53 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = load i32, i32* %m, align 4
  %56 = zext i32 %55 to i64
  %57 = sub i64 32, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i32 %54, %58
  %60 = or i32 %52, %59
  %61 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 %60, i32* %61, align 4
  %62 = load i32, i32* %m, align 4
  %63 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %64 = load i32, i32* %63, align 4
  %65 = shl i32 %64, %62
  store i32 %65, i32* %63, align 4
  br label %66

; <label>:66                                      ; preds = %48, %45
  %67 = load i32, i32* %2, align 4
  %68 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %69 = getelementptr { i64, i64 }, { i64, i64 }* %68, i32 0, i32 0
  %70 = load i64, i64* %69, align 1
  %71 = getelementptr { i64, i64 }, { i64, i64 }* %68, i32 0, i32 1
  %72 = load i64, i64* %71, align 1
  %73 = call { i64, i64 } @num_trim(i64 %70, i64 %72, i32 %67)
  %74 = bitcast %struct.cpp_num* %4 to { i64, i64 }*
  %75 = getelementptr { i64, i64 }, { i64, i64 }* %74, i32 0, i32 0
  %76 = extractvalue { i64, i64 } %73, 0
  store i64 %76, i64* %75, align 4
  %77 = getelementptr { i64, i64 }, { i64, i64 }* %74, i32 0, i32 1
  %78 = extractvalue { i64, i64 } %73, 1
  store i64 %78, i64* %77, align 4
  %79 = bitcast %struct.cpp_num* %num to i8*
  %80 = bitcast %struct.cpp_num* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %79, i8* %80, i64 16, i32 4, i1 false)
  %81 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 2
  %82 = load i32, i32* %81, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %86

; <label>:84                                      ; preds = %66
  %85 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 3
  store i32 0, i32* %85, align 4
  br label %116

; <label>:86                                      ; preds = %66
  %87 = load i32, i32* %2, align 4
  %88 = load i32, i32* %3, align 4
  %89 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %90 = getelementptr { i64, i64 }, { i64, i64 }* %89, i32 0, i32 0
  %91 = load i64, i64* %90, align 1
  %92 = getelementptr { i64, i64 }, { i64, i64 }* %89, i32 0, i32 1
  %93 = load i64, i64* %92, align 1
  %94 = call { i64, i64 } @num_rshift(i64 %91, i64 %93, i32 %87, i32 %88)
  %95 = bitcast %struct.cpp_num* %maybe_orig to { i64, i64 }*
  %96 = getelementptr { i64, i64 }, { i64, i64 }* %95, i32 0, i32 0
  %97 = extractvalue { i64, i64 } %94, 0
  store i64 %97, i64* %96, align 4
  %98 = getelementptr { i64, i64 }, { i64, i64 }* %95, i32 0, i32 1
  %99 = extractvalue { i64, i64 } %94, 1
  store i64 %99, i64* %98, align 4
  %100 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %orig, i32 0, i32 1
  %101 = load i32, i32* %100, align 4
  %102 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %maybe_orig, i32 0, i32 1
  %103 = load i32, i32* %102, align 4
  %104 = icmp eq i32 %101, %103
  br i1 %104, label %105, label %111

; <label>:105                                     ; preds = %86
  %106 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %orig, i32 0, i32 0
  %107 = load i32, i32* %106, align 4
  %108 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %maybe_orig, i32 0, i32 0
  %109 = load i32, i32* %108, align 4
  %110 = icmp eq i32 %107, %109
  br label %111

; <label>:111                                     ; preds = %105, %86
  %112 = phi i1 [ false, %86 ], [ %110, %105 ]
  %113 = xor i1 %112, true
  %114 = zext i1 %113 to i32
  %115 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 3
  store i32 %114, i32* %115, align 4
  br label %116

; <label>:116                                     ; preds = %111, %84
  br label %117

; <label>:117                                     ; preds = %116, %23
  %118 = bitcast %struct.cpp_num* %1 to i8*
  %119 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %118, i8* %119, i64 16, i32 4, i1 false)
  %120 = bitcast %struct.cpp_num* %1 to { i64, i64 }*
  %121 = load { i64, i64 }, { i64, i64 }* %120, align 4
  ret { i64, i64 } %121
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define internal { i64, i64 } @num_trim(i64 %num.coerce0, i64 %num.coerce1, i32 %precision) #0 {
  %1 = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %2 = alloca i32, align 4
  %3 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %4 = getelementptr { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %num.coerce0, i64* %4
  %5 = getelementptr { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %num.coerce1, i64* %5
  store i32 %precision, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = zext i32 %6 to i64
  %8 = icmp ugt i64 %7, 32
  br i1 %8, label %9, label %25

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* %2, align 4
  %11 = zext i32 %10 to i64
  %12 = sub i64 %11, 32
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %2, align 4
  %14 = load i32, i32* %2, align 4
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %15, 32
  br i1 %16, label %17, label %24

; <label>:17                                      ; preds = %9
  %18 = load i32, i32* %2, align 4
  %19 = shl i32 1, %18
  %20 = sub i32 %19, 1
  %21 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %22 = load i32, i32* %21, align 4
  %23 = and i32 %22, %20
  store i32 %23, i32* %21, align 4
  br label %24

; <label>:24                                      ; preds = %17, %9
  br label %38

; <label>:25                                      ; preds = %0
  %26 = load i32, i32* %2, align 4
  %27 = zext i32 %26 to i64
  %28 = icmp ult i64 %27, 32
  br i1 %28, label %29, label %36

; <label>:29                                      ; preds = %25
  %30 = load i32, i32* %2, align 4
  %31 = shl i32 1, %30
  %32 = sub i32 %31, 1
  %33 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %34 = load i32, i32* %33, align 4
  %35 = and i32 %34, %32
  store i32 %35, i32* %33, align 4
  br label %36

; <label>:36                                      ; preds = %29, %25
  %37 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 0, i32* %37, align 4
  br label %38

; <label>:38                                      ; preds = %36, %24
  %39 = bitcast %struct.cpp_num* %1 to i8*
  %40 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* %40, i64 16, i32 4, i1 false)
  %41 = bitcast %struct.cpp_num* %1 to { i64, i64 }*
  %42 = load { i64, i64 }, { i64, i64 }* %41, align 4
  ret { i64, i64 } %42
}

; Function Attrs: nounwind uwtable
define internal { i64, i64 } @num_rshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) #0 {
  %1 = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %sign_mask = alloca i32, align 4
  %x = alloca i32, align 4
  %4 = alloca %struct.cpp_num, align 4
  %5 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %6 = getelementptr { i64, i64 }, { i64, i64 }* %5, i32 0, i32 0
  store i64 %num.coerce0, i64* %6
  %7 = getelementptr { i64, i64 }, { i64, i64 }* %5, i32 0, i32 1
  store i64 %num.coerce1, i64* %7
  store i32 %precision, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  %8 = load i32, i32* %2, align 4
  %9 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %10 = getelementptr { i64, i64 }, { i64, i64 }* %9, i32 0, i32 0
  %11 = load i64, i64* %10, align 1
  %12 = getelementptr { i64, i64 }, { i64, i64 }* %9, i32 0, i32 1
  %13 = load i64, i64* %12, align 1
  %14 = call i32 @num_positive(i64 %11, i64 %13, i32 %8)
  store i32 %14, i32* %x, align 4
  %15 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 2
  %16 = load i32, i32* %15, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %0
  %19 = load i32, i32* %x, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18, %0
  store i32 0, i32* %sign_mask, align 4
  br label %23

; <label>:22                                      ; preds = %18
  store i32 -1, i32* %sign_mask, align 4
  br label %23

; <label>:23                                      ; preds = %22, %21
  %24 = load i32, i32* %3, align 4
  %25 = load i32, i32* %2, align 4
  %26 = icmp uge i32 %24, %25
  br i1 %26, label %27, label %31

; <label>:27                                      ; preds = %23
  %28 = load i32, i32* %sign_mask, align 4
  %29 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  store i32 %28, i32* %29, align 4
  %30 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 %28, i32* %30, align 4
  br label %103

; <label>:31                                      ; preds = %23
  %32 = load i32, i32* %2, align 4
  %33 = zext i32 %32 to i64
  %34 = icmp ult i64 %33, 32
  br i1 %34, label %35, label %44

; <label>:35                                      ; preds = %31
  %36 = load i32, i32* %sign_mask, align 4
  %37 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 %36, i32* %37, align 4
  %38 = load i32, i32* %sign_mask, align 4
  %39 = load i32, i32* %2, align 4
  %40 = shl i32 %38, %39
  %41 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = or i32 %42, %40
  store i32 %43, i32* %41, align 4
  br label %59

; <label>:44                                      ; preds = %31
  %45 = load i32, i32* %2, align 4
  %46 = zext i32 %45 to i64
  %47 = icmp ult i64 %46, 64
  br i1 %47, label %48, label %58

; <label>:48                                      ; preds = %44
  %49 = load i32, i32* %sign_mask, align 4
  %50 = load i32, i32* %2, align 4
  %51 = zext i32 %50 to i64
  %52 = sub i64 %51, 32
  %53 = trunc i64 %52 to i32
  %54 = shl i32 %49, %53
  %55 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %56 = load i32, i32* %55, align 4
  %57 = or i32 %56, %54
  store i32 %57, i32* %55, align 4
  br label %58

; <label>:58                                      ; preds = %48, %44
  br label %59

; <label>:59                                      ; preds = %58, %35
  %60 = load i32, i32* %3, align 4
  %61 = zext i32 %60 to i64
  %62 = icmp uge i64 %61, 32
  br i1 %62, label %63, label %73

; <label>:63                                      ; preds = %59
  %64 = load i32, i32* %3, align 4
  %65 = zext i32 %64 to i64
  %66 = sub i64 %65, 32
  %67 = trunc i64 %66 to i32
  store i32 %67, i32* %3, align 4
  %68 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  store i32 %69, i32* %70, align 4
  %71 = load i32, i32* %sign_mask, align 4
  %72 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 %71, i32* %72, align 4
  br label %73

; <label>:73                                      ; preds = %63, %59
  %74 = load i32, i32* %3, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %102

; <label>:76                                      ; preds = %73
  %77 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %78 = load i32, i32* %77, align 4
  %79 = load i32, i32* %3, align 4
  %80 = lshr i32 %78, %79
  %81 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %82 = load i32, i32* %81, align 4
  %83 = load i32, i32* %3, align 4
  %84 = zext i32 %83 to i64
  %85 = sub i64 32, %84
  %86 = trunc i64 %85 to i32
  %87 = shl i32 %82, %86
  %88 = or i32 %80, %87
  %89 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  store i32 %88, i32* %89, align 4
  %90 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %91 = load i32, i32* %90, align 4
  %92 = load i32, i32* %3, align 4
  %93 = lshr i32 %91, %92
  %94 = load i32, i32* %sign_mask, align 4
  %95 = load i32, i32* %3, align 4
  %96 = zext i32 %95 to i64
  %97 = sub i64 32, %96
  %98 = trunc i64 %97 to i32
  %99 = shl i32 %94, %98
  %100 = or i32 %93, %99
  %101 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  store i32 %100, i32* %101, align 4
  br label %102

; <label>:102                                     ; preds = %76, %73
  br label %103

; <label>:103                                     ; preds = %102, %27
  %104 = load i32, i32* %2, align 4
  %105 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %106 = getelementptr { i64, i64 }, { i64, i64 }* %105, i32 0, i32 0
  %107 = load i64, i64* %106, align 1
  %108 = getelementptr { i64, i64 }, { i64, i64 }* %105, i32 0, i32 1
  %109 = load i64, i64* %108, align 1
  %110 = call { i64, i64 } @num_trim(i64 %107, i64 %109, i32 %104)
  %111 = bitcast %struct.cpp_num* %4 to { i64, i64 }*
  %112 = getelementptr { i64, i64 }, { i64, i64 }* %111, i32 0, i32 0
  %113 = extractvalue { i64, i64 } %110, 0
  store i64 %113, i64* %112, align 4
  %114 = getelementptr { i64, i64 }, { i64, i64 }* %111, i32 0, i32 1
  %115 = extractvalue { i64, i64 } %110, 1
  store i64 %115, i64* %114, align 4
  %116 = bitcast %struct.cpp_num* %num to i8*
  %117 = bitcast %struct.cpp_num* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %116, i8* %117, i64 16, i32 4, i1 false)
  %118 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 3
  store i32 0, i32* %118, align 4
  %119 = bitcast %struct.cpp_num* %1 to i8*
  %120 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %119, i8* %120, i64 16, i32 4, i1 false)
  %121 = bitcast %struct.cpp_num* %1 to { i64, i64 }*
  %122 = load { i64, i64 }, { i64, i64 }* %121, align 4
  ret { i64, i64 } %122
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %res = alloca %struct.cpp_num, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* @n, align 4
  %3 = load i64, i64* getelementptr ({ i64, i64 }, { i64, i64 }* bitcast (%struct.cpp_num* @num to { i64, i64 }*), i32 0, i32 0), align 1
  %4 = load i64, i64* getelementptr ({ i64, i64 }, { i64, i64 }* bitcast (%struct.cpp_num* @num to { i64, i64 }*), i32 0, i32 1), align 1
  %5 = call { i64, i64 } @num_lshift(i64 %3, i64 %4, i32 64, i32 %2)
  %6 = bitcast %struct.cpp_num* %res to { i64, i64 }*
  %7 = getelementptr { i64, i64 }, { i64, i64 }* %6, i32 0, i32 0
  %8 = extractvalue { i64, i64 } %5, 0
  store i64 %8, i64* %7, align 4
  %9 = getelementptr { i64, i64 }, { i64, i64 }* %6, i32 0, i32 1
  %10 = extractvalue { i64, i64 } %5, 1
  store i64 %10, i64* %9, align 4
  %11 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %res, i32 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = icmp ne i32 %12, 196608
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %res, i32 0, i32 0
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %res, i32 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %20
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %20
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %27 = load i32, i32* %1
  ret i32 %27
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define internal i32 @num_positive(i64 %num.coerce0, i64 %num.coerce1, i32 %precision) #0 {
  %1 = alloca i32, align 4
  %num = alloca %struct.cpp_num, align 8
  %2 = alloca i32, align 4
  %3 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %4 = getelementptr { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %num.coerce0, i64* %4
  %5 = getelementptr { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %num.coerce1, i64* %5
  store i32 %precision, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = zext i32 %6 to i64
  %8 = icmp ugt i64 %7, 32
  br i1 %8, label %9, label %22

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* %2, align 4
  %11 = zext i32 %10 to i64
  %12 = sub i64 %11, 32
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %2, align 4
  %14 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 0
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %2, align 4
  %17 = sub i32 %16, 1
  %18 = shl i32 1, %17
  %19 = and i32 %15, %18
  %20 = icmp eq i32 %19, 0
  %21 = zext i1 %20 to i32
  store i32 %21, i32* %1
  br label %31

; <label>:22                                      ; preds = %0
  %23 = getelementptr inbounds %struct.cpp_num, %struct.cpp_num* %num, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %2, align 4
  %26 = sub i32 %25, 1
  %27 = shl i32 1, %26
  %28 = and i32 %24, %27
  %29 = icmp eq i32 %28, 0
  %30 = zext i1 %29 to i32
  store i32 %30, i32* %1
  br label %31

; <label>:31                                      ; preds = %22, %9
  %32 = load i32, i32* %1
  ret i32 %32
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
