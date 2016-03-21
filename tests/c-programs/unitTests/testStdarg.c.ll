; ModuleID = './testStdarg.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.s = type { i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"arg1 = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"first == NULL\0A\00", align 1
@.str.3 = private unnamed_addr constant [36 x i8] c"%d, %d, %d, %d, %d, %d, %d, %d, %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"Hello, \00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"world!\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"23\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"456\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"789\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printargs(i32 %arg1, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %2)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load i32, i32* %1, align 4
  store i32 %6, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %29, %0
  %8 = load i32, i32* %i, align 4
  %9 = icmp ne i32 %8, -1
  br i1 %9, label %10, label %32

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %i, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %11)
  br label %13

; <label>:13                                      ; preds = %10
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %14, i32 0, i32 0
  %16 = load i32, i32* %15
  %17 = icmp ule i32 %16, 40
  br i1 %17, label %18, label %24

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %14, i32 0, i32 3
  %20 = load i8*, i8** %19
  %21 = getelementptr i8, i8* %20, i32 %16
  %22 = bitcast i8* %21 to i32*
  %23 = add i32 %16, 8
  store i32 %23, i32* %15
  br label %29

; <label>:24                                      ; preds = %13
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %14, i32 0, i32 2
  %26 = load i8*, i8** %25
  %27 = bitcast i8* %26 to i32*
  %28 = getelementptr i8, i8* %26, i32 8
  store i8* %28, i8** %25
  br label %29

; <label>:29                                      ; preds = %24, %18
  %30 = phi i32* [ %22, %18 ], [ %27, %24 ]
  %31 = load i32, i32* %30
  store i32 %31, i32* %i, align 4
  br label %7

; <label>:32                                      ; preds = %7
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %34 = bitcast %struct.__va_list_tag* %33 to i8*
  call void @llvm.va_end(i8* %34)
  %35 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

declare i32 @putchar(i32) #1

; Function Attrs: nounwind uwtable
define i8* @vstrcat(i8* %first, ...) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %len = alloca i64, align 8
  %retbuf = alloca i8*, align 8
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %p = alloca i8*, align 8
  store i8* %first, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = icmp eq i8* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0))
  store i8* null, i8** %1
  br label %80

; <label>:7                                       ; preds = %0
  %8 = load i8*, i8** %2, align 8
  %9 = call i64 @strlen(i8* %8) #5
  store i64 %9, i64* %len, align 8
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  br label %12

; <label>:12                                      ; preds = %32, %7
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 0
  %15 = load i32, i32* %14
  %16 = icmp ule i32 %15, 40
  br i1 %16, label %17, label %23

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 3
  %19 = load i8*, i8** %18
  %20 = getelementptr i8, i8* %19, i32 %15
  %21 = bitcast i8* %20 to i8**
  %22 = add i32 %15, 8
  store i32 %22, i32* %14
  br label %28

; <label>:23                                      ; preds = %12
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 2
  %25 = load i8*, i8** %24
  %26 = bitcast i8* %25 to i8**
  %27 = getelementptr i8, i8* %25, i32 8
  store i8* %27, i8** %24
  br label %28

; <label>:28                                      ; preds = %23, %17
  %29 = phi i8** [ %21, %17 ], [ %26, %23 ]
  %30 = load i8*, i8** %29
  store i8* %30, i8** %p, align 8
  %31 = icmp ne i8* %30, null
  br i1 %31, label %32, label %37

; <label>:32                                      ; preds = %28
  %33 = load i8*, i8** %p, align 8
  %34 = call i64 @strlen(i8* %33) #5
  %35 = load i64, i64* %len, align 8
  %36 = add i64 %35, %34
  store i64 %36, i64* %len, align 8
  br label %12

; <label>:37                                      ; preds = %28
  %38 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %39 = bitcast %struct.__va_list_tag* %38 to i8*
  call void @llvm.va_end(i8* %39)
  %40 = load i64, i64* %len, align 8
  %41 = add i64 %40, 1
  %42 = call noalias i8* @malloc(i64 %41) #2
  store i8* %42, i8** %retbuf, align 8
  %43 = load i8*, i8** %retbuf, align 8
  %44 = icmp eq i8* %43, null
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %37
  store i8* null, i8** %1
  br label %80

; <label>:46                                      ; preds = %37
  %47 = load i8*, i8** %retbuf, align 8
  %48 = load i8*, i8** %2, align 8
  %49 = call i8* @strcpy(i8* %47, i8* %48) #2
  %50 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %51 = bitcast %struct.__va_list_tag* %50 to i8*
  call void @llvm.va_start(i8* %51)
  br label %52

; <label>:52                                      ; preds = %72, %46
  %53 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %54 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %53, i32 0, i32 0
  %55 = load i32, i32* %54
  %56 = icmp ule i32 %55, 40
  br i1 %56, label %57, label %63

; <label>:57                                      ; preds = %52
  %58 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %53, i32 0, i32 3
  %59 = load i8*, i8** %58
  %60 = getelementptr i8, i8* %59, i32 %55
  %61 = bitcast i8* %60 to i8**
  %62 = add i32 %55, 8
  store i32 %62, i32* %54
  br label %68

; <label>:63                                      ; preds = %52
  %64 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %53, i32 0, i32 2
  %65 = load i8*, i8** %64
  %66 = bitcast i8* %65 to i8**
  %67 = getelementptr i8, i8* %65, i32 8
  store i8* %67, i8** %64
  br label %68

; <label>:68                                      ; preds = %63, %57
  %69 = phi i8** [ %61, %57 ], [ %66, %63 ]
  %70 = load i8*, i8** %69
  store i8* %70, i8** %p, align 8
  %71 = icmp ne i8* %70, null
  br i1 %71, label %72, label %76

; <label>:72                                      ; preds = %68
  %73 = load i8*, i8** %retbuf, align 8
  %74 = load i8*, i8** %p, align 8
  %75 = call i8* @strcat(i8* %73, i8* %74) #2
  br label %52

; <label>:76                                      ; preds = %68
  %77 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %78 = bitcast %struct.__va_list_tag* %77 to i8*
  call void @llvm.va_end(i8* %78)
  %79 = load i8*, i8** %retbuf, align 8
  store i8* %79, i8** %1
  br label %80

; <label>:80                                      ; preds = %76, %45, %5
  %81 = load i8*, i8** %1
  ret i8* %81
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #4

; Function Attrs: nounwind uwtable
define i32 @testDifferent(i32 %x, ...) #0 {
  %1 = alloca i32, align 4
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %y1 = alloca i32, align 4
  %y2 = alloca i32, align 4
  %y3 = alloca i32, align 4
  %y4 = alloca i64, align 8
  %y5 = alloca i64, align 8
  %y6 = alloca double, align 8
  %y7 = alloca double, align 8
  %y6a = alloca i32, align 4
  %y7a = alloca i32, align 4
  %mys = alloca %struct.s, align 4
  store i32 %x, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 0
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 40
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to i32*
  %13 = add i32 %6, 8
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi i32* [ %12, %8 ], [ %17, %14 ]
  %21 = load i32, i32* %20
  store i32 %21, i32* %y1, align 4
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 0
  %24 = load i32, i32* %23
  %25 = icmp ule i32 %24, 40
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %19
  %27 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 3
  %28 = load i8*, i8** %27
  %29 = getelementptr i8, i8* %28, i32 %24
  %30 = bitcast i8* %29 to i32*
  %31 = add i32 %24, 8
  store i32 %31, i32* %23
  br label %37

; <label>:32                                      ; preds = %19
  %33 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 2
  %34 = load i8*, i8** %33
  %35 = bitcast i8* %34 to i32*
  %36 = getelementptr i8, i8* %34, i32 8
  store i8* %36, i8** %33
  br label %37

; <label>:37                                      ; preds = %32, %26
  %38 = phi i32* [ %30, %26 ], [ %35, %32 ]
  %39 = load i32, i32* %38
  store i32 %39, i32* %y2, align 4
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %41 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 0
  %42 = load i32, i32* %41
  %43 = icmp ule i32 %42, 40
  br i1 %43, label %44, label %50

; <label>:44                                      ; preds = %37
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 3
  %46 = load i8*, i8** %45
  %47 = getelementptr i8, i8* %46, i32 %42
  %48 = bitcast i8* %47 to i32*
  %49 = add i32 %42, 8
  store i32 %49, i32* %41
  br label %55

; <label>:50                                      ; preds = %37
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 2
  %52 = load i8*, i8** %51
  %53 = bitcast i8* %52 to i32*
  %54 = getelementptr i8, i8* %52, i32 8
  store i8* %54, i8** %51
  br label %55

; <label>:55                                      ; preds = %50, %44
  %56 = phi i32* [ %48, %44 ], [ %53, %50 ]
  %57 = load i32, i32* %56
  store i32 %57, i32* %y3, align 4
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %59 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 0
  %60 = load i32, i32* %59
  %61 = icmp ule i32 %60, 40
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %55
  %63 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 3
  %64 = load i8*, i8** %63
  %65 = getelementptr i8, i8* %64, i32 %60
  %66 = bitcast i8* %65 to i64*
  %67 = add i32 %60, 8
  store i32 %67, i32* %59
  br label %73

; <label>:68                                      ; preds = %55
  %69 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 2
  %70 = load i8*, i8** %69
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr i8, i8* %70, i32 8
  store i8* %72, i8** %69
  br label %73

; <label>:73                                      ; preds = %68, %62
  %74 = phi i64* [ %66, %62 ], [ %71, %68 ]
  %75 = load i64, i64* %74
  store i64 %75, i64* %y4, align 8
  %76 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %77 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 0
  %78 = load i32, i32* %77
  %79 = icmp ule i32 %78, 40
  br i1 %79, label %80, label %86

; <label>:80                                      ; preds = %73
  %81 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 3
  %82 = load i8*, i8** %81
  %83 = getelementptr i8, i8* %82, i32 %78
  %84 = bitcast i8* %83 to i64*
  %85 = add i32 %78, 8
  store i32 %85, i32* %77
  br label %91

; <label>:86                                      ; preds = %73
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 2
  %88 = load i8*, i8** %87
  %89 = bitcast i8* %88 to i64*
  %90 = getelementptr i8, i8* %88, i32 8
  store i8* %90, i8** %87
  br label %91

; <label>:91                                      ; preds = %86, %80
  %92 = phi i64* [ %84, %80 ], [ %89, %86 ]
  %93 = load i64, i64* %92
  store i64 %93, i64* %y5, align 8
  %94 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %95 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %94, i32 0, i32 1
  %96 = load i32, i32* %95
  %97 = icmp ule i32 %96, 160
  br i1 %97, label %98, label %104

; <label>:98                                      ; preds = %91
  %99 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %94, i32 0, i32 3
  %100 = load i8*, i8** %99
  %101 = getelementptr i8, i8* %100, i32 %96
  %102 = bitcast i8* %101 to double*
  %103 = add i32 %96, 16
  store i32 %103, i32* %95
  br label %109

; <label>:104                                     ; preds = %91
  %105 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %94, i32 0, i32 2
  %106 = load i8*, i8** %105
  %107 = bitcast i8* %106 to double*
  %108 = getelementptr i8, i8* %106, i32 8
  store i8* %108, i8** %105
  br label %109

; <label>:109                                     ; preds = %104, %98
  %110 = phi double* [ %102, %98 ], [ %107, %104 ]
  %111 = load double, double* %110
  store double %111, double* %y6, align 8
  %112 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %113 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %112, i32 0, i32 1
  %114 = load i32, i32* %113
  %115 = icmp ule i32 %114, 160
  br i1 %115, label %116, label %122

; <label>:116                                     ; preds = %109
  %117 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %112, i32 0, i32 3
  %118 = load i8*, i8** %117
  %119 = getelementptr i8, i8* %118, i32 %114
  %120 = bitcast i8* %119 to double*
  %121 = add i32 %114, 16
  store i32 %121, i32* %113
  br label %127

; <label>:122                                     ; preds = %109
  %123 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %112, i32 0, i32 2
  %124 = load i8*, i8** %123
  %125 = bitcast i8* %124 to double*
  %126 = getelementptr i8, i8* %124, i32 8
  store i8* %126, i8** %123
  br label %127

; <label>:127                                     ; preds = %122, %116
  %128 = phi double* [ %120, %116 ], [ %125, %122 ]
  %129 = load double, double* %128
  store double %129, double* %y7, align 8
  %130 = load double, double* %y6, align 8
  %131 = fmul double %130, 1.000000e+04
  %132 = fptosi double %131 to i32
  store i32 %132, i32* %y6a, align 4
  %133 = load double, double* %y7, align 8
  %134 = fmul double %133, 1.000000e+02
  %135 = fptosi double %134 to i32
  store i32 %135, i32* %y7a, align 4
  %136 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %137 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %136, i32 0, i32 0
  %138 = load i32, i32* %137
  %139 = icmp ule i32 %138, 40
  br i1 %139, label %140, label %146

; <label>:140                                     ; preds = %127
  %141 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %136, i32 0, i32 3
  %142 = load i8*, i8** %141
  %143 = getelementptr i8, i8* %142, i32 %138
  %144 = bitcast i8* %143 to %struct.s*
  %145 = add i32 %138, 8
  store i32 %145, i32* %137
  br label %151

; <label>:146                                     ; preds = %127
  %147 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %136, i32 0, i32 2
  %148 = load i8*, i8** %147
  %149 = bitcast i8* %148 to %struct.s*
  %150 = getelementptr i8, i8* %148, i32 8
  store i8* %150, i8** %147
  br label %151

; <label>:151                                     ; preds = %146, %140
  %152 = phi %struct.s* [ %144, %140 ], [ %149, %146 ]
  %153 = bitcast %struct.s* %mys to i8*
  %154 = bitcast %struct.s* %152 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %153, i8* %154, i64 8, i32 4, i1 false)
  %155 = load i32, i32* %y1, align 4
  %156 = load i32, i32* %y2, align 4
  %157 = load i32, i32* %y3, align 4
  %158 = load i64, i64* %y4, align 8
  %159 = trunc i64 %158 to i32
  %160 = load i64, i64* %y5, align 8
  %161 = trunc i64 %160 to i32
  %162 = load i32, i32* %y6a, align 4
  %163 = load i32, i32* %y7a, align 4
  %164 = getelementptr inbounds %struct.s, %struct.s* %mys, i32 0, i32 0
  %165 = load i32, i32* %164, align 4
  %166 = getelementptr inbounds %struct.s, %struct.s* %mys, i32 0, i32 1
  %167 = load i32, i32* %166, align 4
  %168 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i32 %155, i32 %156, i32 %157, i32 %159, i32 %161, i32 %162, i32 %163, i32 %165, i32 %167)
  %169 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %170 = bitcast %struct.__va_list_tag* %169 to i8*
  call void @llvm.va_end(i8* %170)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %str = alloca i8*, align 8
  %mys = alloca %struct.s, align 4
  %mychar = alloca i8, align 1
  %myshort = alloca i16, align 2
  %myfloat = alloca float, align 4
  %mydouble = alloca double, align 8
  store i32 0, i32* %1
  call void (i32, ...) @printargs(i32 5, i32 2, i32 14, i32 84, i32 97, i32 15, i32 24, i32 48, i32 -1)
  call void (i32, ...) @printargs(i32 84, i32 51, i32 -1)
  call void (i32, ...) @printargs(i32 -1)
  call void (i32, ...) @printargs(i32 1, i32 -1)
  %2 = call i8* (i8*, ...) @vstrcat(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* null)
  store i8* %2, i8** %str, align 8
  %3 = load i8*, i8** %str, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* %3)
  %5 = getelementptr inbounds %struct.s, %struct.s* %mys, i32 0, i32 0
  store i32 100, i32* %5, align 4
  %6 = getelementptr inbounds %struct.s, %struct.s* %mys, i32 0, i32 1
  store i32 200, i32* %6, align 4
  store i8 5, i8* %mychar, align 1
  store i16 10, i16* %myshort, align 2
  store float 3.050000e+01, float* %myfloat, align 4
  store double 7.223400e+01, double* %mydouble, align 8
  %7 = load i8, i8* %mychar, align 1
  %8 = sext i8 %7 to i32
  %9 = load i16, i16* %myshort, align 2
  %10 = sext i16 %9 to i32
  %11 = load float, float* %myfloat, align 4
  %12 = fpext float %11 to double
  %13 = load double, double* %mydouble, align 8
  %14 = bitcast %struct.s* %mys to i64*
  %15 = load i64, i64* %14, align 4
  %16 = call i32 (i32, ...) @testDifferent(i32 0, i32 %8, i32 %10, i32 15, i64 20, i64 25, double %12, double %13, i64 %15)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
