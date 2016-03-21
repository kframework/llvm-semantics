; ModuleID = './stdarg-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@y = common global i64 0, align 8
@x = common global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @f1(i32 %i, ...) #0 {
  %1 = alloca %struct.__va_list_tag*, align 8
  %2 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %2, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  store %struct.__va_list_tag* %5, %struct.__va_list_tag** %1, align 8
  %6 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 1
  %8 = load i32, i32* %7
  %9 = icmp ule i32 %8, 160
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 3
  %12 = load i8*, i8** %11
  %13 = getelementptr i8, i8* %12, i32 %8
  %14 = bitcast i8* %13 to double*
  %15 = add i32 %8, 16
  store i32 %15, i32* %7
  br label %21

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 2
  %18 = load i8*, i8** %17
  %19 = bitcast i8* %18 to double*
  %20 = getelementptr i8, i8* %18, i32 8
  store i8* %20, i8** %17
  br label %21

; <label>:21                                      ; preds = %16, %10
  %22 = phi double* [ %14, %10 ], [ %19, %16 ]
  %23 = load double, double* %22
  %24 = fptosi double %23 to i64
  store i64 %24, i64* @x, align 8
  %25 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32, i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %21
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8*, i8** %30
  %32 = getelementptr i8, i8* %31, i32 %27
  %33 = bitcast i8* %32 to i64*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %21
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8*, i8** %36
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr i8, i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i64* [ %33, %29 ], [ %38, %35 ]
  %42 = load i64, i64* %41
  %43 = load i64, i64* @x, align 8
  %44 = add nsw i64 %43, %42
  store i64 %44, i64* @x, align 8
  %45 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %46 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %45, i32 0, i32 1
  %47 = load i32, i32* %46
  %48 = icmp ule i32 %47, 160
  br i1 %48, label %49, label %55

; <label>:49                                      ; preds = %40
  %50 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %45, i32 0, i32 3
  %51 = load i8*, i8** %50
  %52 = getelementptr i8, i8* %51, i32 %47
  %53 = bitcast i8* %52 to double*
  %54 = add i32 %47, 16
  store i32 %54, i32* %46
  br label %f1i.exit

; <label>:55                                      ; preds = %40
  %56 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %45, i32 0, i32 2
  %57 = load i8*, i8** %56
  %58 = bitcast i8* %57 to double*
  %59 = getelementptr i8, i8* %57, i32 8
  store i8* %59, i8** %56
  br label %f1i.exit

f1i.exit:                                         ; preds = %49, %55
  %60 = phi double* [ %53, %49 ], [ %58, %55 ]
  %61 = load double, double* %60
  %62 = load i64, i64* @x, align 8
  %63 = sitofp i64 %62 to double
  %64 = fadd double %63, %61
  %65 = fptosi double %64 to i64
  store i64 %65, i64* @x, align 8
  %66 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %67 = bitcast %struct.__va_list_tag* %66 to i8*
  call void @llvm.va_end(i8* %67)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define void @f2(i32 %i, ...) #0 {
  %1 = alloca %struct.__va_list_tag*, align 8
  %2 = alloca %struct.__va_list_tag*, align 8
  %3 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %3, align 4
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  store %struct.__va_list_tag* %6, %struct.__va_list_tag** %2, align 8
  %7 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %7, i32 0, i32 0
  %9 = load i32, i32* %8
  %10 = icmp ule i32 %9, 40
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %7, i32 0, i32 3
  %13 = load i8*, i8** %12
  %14 = getelementptr i8, i8* %13, i32 %9
  %15 = bitcast i8* %14 to i32*
  %16 = add i32 %9, 8
  store i32 %16, i32* %8
  br label %22

; <label>:17                                      ; preds = %0
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %7, i32 0, i32 2
  %19 = load i8*, i8** %18
  %20 = bitcast i8* %19 to i32*
  %21 = getelementptr i8, i8* %19, i32 8
  store i8* %21, i8** %18
  br label %22

; <label>:22                                      ; preds = %17, %11
  %23 = phi i32* [ %15, %11 ], [ %20, %17 ]
  %24 = load i32, i32* %23
  %25 = sext i32 %24 to i64
  store i64 %25, i64* @y, align 8
  %26 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %27 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %26, i32 0, i32 0
  %28 = load i32, i32* %27
  %29 = icmp ule i32 %28, 40
  br i1 %29, label %30, label %36

; <label>:30                                      ; preds = %22
  %31 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %26, i32 0, i32 3
  %32 = load i8*, i8** %31
  %33 = getelementptr i8, i8* %32, i32 %28
  %34 = bitcast i8* %33 to i64*
  %35 = add i32 %28, 8
  store i32 %35, i32* %27
  br label %41

; <label>:36                                      ; preds = %22
  %37 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %26, i32 0, i32 2
  %38 = load i8*, i8** %37
  %39 = bitcast i8* %38 to i64*
  %40 = getelementptr i8, i8* %38, i32 8
  store i8* %40, i8** %37
  br label %41

; <label>:41                                      ; preds = %36, %30
  %42 = phi i64* [ %34, %30 ], [ %39, %36 ]
  %43 = load i64, i64* %42
  %44 = load i64, i64* @y, align 8
  %45 = add nsw i64 %44, %43
  store i64 %45, i64* @y, align 8
  %46 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 1
  %48 = load i32, i32* %47
  %49 = icmp ule i32 %48, 160
  br i1 %49, label %50, label %56

; <label>:50                                      ; preds = %41
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 3
  %52 = load i8*, i8** %51
  %53 = getelementptr i8, i8* %52, i32 %48
  %54 = bitcast i8* %53 to double*
  %55 = add i32 %48, 16
  store i32 %55, i32* %47
  br label %61

; <label>:56                                      ; preds = %41
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 2
  %58 = load i8*, i8** %57
  %59 = bitcast i8* %58 to double*
  %60 = getelementptr i8, i8* %58, i32 8
  store i8* %60, i8** %57
  br label %61

; <label>:61                                      ; preds = %56, %50
  %62 = phi double* [ %54, %50 ], [ %59, %56 ]
  %63 = load double, double* %62
  %64 = load i64, i64* @y, align 8
  %65 = sitofp i64 %64 to double
  %66 = fadd double %65, %63
  %67 = fptosi double %66 to i64
  store i64 %67, i64* @y, align 8
  %68 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  store %struct.__va_list_tag* %68, %struct.__va_list_tag** %1, align 8
  %69 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %70 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %69, i32 0, i32 1
  %71 = load i32, i32* %70
  %72 = icmp ule i32 %71, 160
  br i1 %72, label %73, label %79

; <label>:73                                      ; preds = %61
  %74 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %69, i32 0, i32 3
  %75 = load i8*, i8** %74
  %76 = getelementptr i8, i8* %75, i32 %71
  %77 = bitcast i8* %76 to double*
  %78 = add i32 %71, 16
  store i32 %78, i32* %70
  br label %84

; <label>:79                                      ; preds = %61
  %80 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %69, i32 0, i32 2
  %81 = load i8*, i8** %80
  %82 = bitcast i8* %81 to double*
  %83 = getelementptr i8, i8* %81, i32 8
  store i8* %83, i8** %80
  br label %84

; <label>:84                                      ; preds = %79, %73
  %85 = phi double* [ %77, %73 ], [ %82, %79 ]
  %86 = load double, double* %85
  %87 = fptosi double %86 to i64
  store i64 %87, i64* @x, align 8
  %88 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %89 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %88, i32 0, i32 0
  %90 = load i32, i32* %89
  %91 = icmp ule i32 %90, 40
  br i1 %91, label %92, label %98

; <label>:92                                      ; preds = %84
  %93 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %88, i32 0, i32 3
  %94 = load i8*, i8** %93
  %95 = getelementptr i8, i8* %94, i32 %90
  %96 = bitcast i8* %95 to i64*
  %97 = add i32 %90, 8
  store i32 %97, i32* %89
  br label %103

; <label>:98                                      ; preds = %84
  %99 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %88, i32 0, i32 2
  %100 = load i8*, i8** %99
  %101 = bitcast i8* %100 to i64*
  %102 = getelementptr i8, i8* %100, i32 8
  store i8* %102, i8** %99
  br label %103

; <label>:103                                     ; preds = %98, %92
  %104 = phi i64* [ %96, %92 ], [ %101, %98 ]
  %105 = load i64, i64* %104
  %106 = load i64, i64* @x, align 8
  %107 = add nsw i64 %106, %105
  store i64 %107, i64* @x, align 8
  %108 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %109 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %108, i32 0, i32 1
  %110 = load i32, i32* %109
  %111 = icmp ule i32 %110, 160
  br i1 %111, label %112, label %118

; <label>:112                                     ; preds = %103
  %113 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %108, i32 0, i32 3
  %114 = load i8*, i8** %113
  %115 = getelementptr i8, i8* %114, i32 %110
  %116 = bitcast i8* %115 to double*
  %117 = add i32 %110, 16
  store i32 %117, i32* %109
  br label %f2i.exit

; <label>:118                                     ; preds = %103
  %119 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %108, i32 0, i32 2
  %120 = load i8*, i8** %119
  %121 = bitcast i8* %120 to double*
  %122 = getelementptr i8, i8* %120, i32 8
  store i8* %122, i8** %119
  br label %f2i.exit

f2i.exit:                                         ; preds = %112, %118
  %123 = phi double* [ %116, %112 ], [ %121, %118 ]
  %124 = load double, double* %123
  %125 = load i64, i64* @x, align 8
  %126 = sitofp i64 %125 to double
  %127 = fadd double %126, %124
  %128 = fptosi double %127 to i64
  store i64 %128, i64* @x, align 8
  %129 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %130 = bitcast %struct.__va_list_tag* %129 to i8*
  call void @llvm.va_end(i8* %130)
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @f3h(i32 %i, i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i32 %i, i32* %1, align 4
  store i64 %arg0, i64* %2, align 8
  store i64 %arg1, i64* %3, align 8
  store i64 %arg2, i64* %4, align 8
  store i64 %arg3, i64* %5, align 8
  %6 = load i32, i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = load i64, i64* %2, align 8
  %9 = add nsw i64 %7, %8
  %10 = load i64, i64* %3, align 8
  %11 = add nsw i64 %9, %10
  %12 = load i64, i64* %4, align 8
  %13 = add nsw i64 %11, %12
  %14 = load i64, i64* %5, align 8
  %15 = add nsw i64 %13, %14
  ret i64 %15
}

; Function Attrs: nounwind uwtable
define i64 @f3(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %t = alloca i64, align 8
  %arg0 = alloca i64, align 8
  %arg1 = alloca i64, align 8
  %arg2 = alloca i64, align 8
  %arg3 = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i32, i32* %1, align 4
  switch i32 %4, label %210 [
    i32 0, label %5
    i32 1, label %8
    i32 2, label %30
    i32 3, label %71
    i32 4, label %131
  ]

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %1, align 4
  %7 = call i64 @f3h(i32 %6, i64 0, i64 0, i64 0, i64 0)
  store i64 %7, i64* %t, align 8
  br label %211

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 0
  %11 = load i32, i32* %10
  %12 = icmp ule i32 %11, 40
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8*, i8** %14
  %16 = getelementptr i8, i8* %15, i32 %11
  %17 = bitcast i8* %16 to i64*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %8
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8*, i8** %20
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr i8, i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi i64* [ %17, %13 ], [ %22, %19 ]
  %26 = load i64, i64* %25
  store i64 %26, i64* %arg0, align 8
  %27 = load i32, i32* %1, align 4
  %28 = load i64, i64* %arg0, align 8
  %29 = call i64 @f3h(i32 %27, i64 %28, i64 0, i64 0, i64 0)
  store i64 %29, i64* %t, align 8
  br label %211

; <label>:30                                      ; preds = %0
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %32 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %31, i32 0, i32 0
  %33 = load i32, i32* %32
  %34 = icmp ule i32 %33, 40
  br i1 %34, label %35, label %41

; <label>:35                                      ; preds = %30
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %31, i32 0, i32 3
  %37 = load i8*, i8** %36
  %38 = getelementptr i8, i8* %37, i32 %33
  %39 = bitcast i8* %38 to i64*
  %40 = add i32 %33, 8
  store i32 %40, i32* %32
  br label %46

; <label>:41                                      ; preds = %30
  %42 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %31, i32 0, i32 2
  %43 = load i8*, i8** %42
  %44 = bitcast i8* %43 to i64*
  %45 = getelementptr i8, i8* %43, i32 8
  store i8* %45, i8** %42
  br label %46

; <label>:46                                      ; preds = %41, %35
  %47 = phi i64* [ %39, %35 ], [ %44, %41 ]
  %48 = load i64, i64* %47
  store i64 %48, i64* %arg0, align 8
  %49 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %50 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %49, i32 0, i32 0
  %51 = load i32, i32* %50
  %52 = icmp ule i32 %51, 40
  br i1 %52, label %53, label %59

; <label>:53                                      ; preds = %46
  %54 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %49, i32 0, i32 3
  %55 = load i8*, i8** %54
  %56 = getelementptr i8, i8* %55, i32 %51
  %57 = bitcast i8* %56 to i64*
  %58 = add i32 %51, 8
  store i32 %58, i32* %50
  br label %64

; <label>:59                                      ; preds = %46
  %60 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %49, i32 0, i32 2
  %61 = load i8*, i8** %60
  %62 = bitcast i8* %61 to i64*
  %63 = getelementptr i8, i8* %61, i32 8
  store i8* %63, i8** %60
  br label %64

; <label>:64                                      ; preds = %59, %53
  %65 = phi i64* [ %57, %53 ], [ %62, %59 ]
  %66 = load i64, i64* %65
  store i64 %66, i64* %arg1, align 8
  %67 = load i32, i32* %1, align 4
  %68 = load i64, i64* %arg0, align 8
  %69 = load i64, i64* %arg1, align 8
  %70 = call i64 @f3h(i32 %67, i64 %68, i64 %69, i64 0, i64 0)
  store i64 %70, i64* %t, align 8
  br label %211

; <label>:71                                      ; preds = %0
  %72 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %73 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 0
  %74 = load i32, i32* %73
  %75 = icmp ule i32 %74, 40
  br i1 %75, label %76, label %82

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 3
  %78 = load i8*, i8** %77
  %79 = getelementptr i8, i8* %78, i32 %74
  %80 = bitcast i8* %79 to i64*
  %81 = add i32 %74, 8
  store i32 %81, i32* %73
  br label %87

; <label>:82                                      ; preds = %71
  %83 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 2
  %84 = load i8*, i8** %83
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr i8, i8* %84, i32 8
  store i8* %86, i8** %83
  br label %87

; <label>:87                                      ; preds = %82, %76
  %88 = phi i64* [ %80, %76 ], [ %85, %82 ]
  %89 = load i64, i64* %88
  store i64 %89, i64* %arg0, align 8
  %90 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %90, i32 0, i32 0
  %92 = load i32, i32* %91
  %93 = icmp ule i32 %92, 40
  br i1 %93, label %94, label %100

; <label>:94                                      ; preds = %87
  %95 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %90, i32 0, i32 3
  %96 = load i8*, i8** %95
  %97 = getelementptr i8, i8* %96, i32 %92
  %98 = bitcast i8* %97 to i64*
  %99 = add i32 %92, 8
  store i32 %99, i32* %91
  br label %105

; <label>:100                                     ; preds = %87
  %101 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %90, i32 0, i32 2
  %102 = load i8*, i8** %101
  %103 = bitcast i8* %102 to i64*
  %104 = getelementptr i8, i8* %102, i32 8
  store i8* %104, i8** %101
  br label %105

; <label>:105                                     ; preds = %100, %94
  %106 = phi i64* [ %98, %94 ], [ %103, %100 ]
  %107 = load i64, i64* %106
  store i64 %107, i64* %arg1, align 8
  %108 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %109 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %108, i32 0, i32 0
  %110 = load i32, i32* %109
  %111 = icmp ule i32 %110, 40
  br i1 %111, label %112, label %118

; <label>:112                                     ; preds = %105
  %113 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %108, i32 0, i32 3
  %114 = load i8*, i8** %113
  %115 = getelementptr i8, i8* %114, i32 %110
  %116 = bitcast i8* %115 to i64*
  %117 = add i32 %110, 8
  store i32 %117, i32* %109
  br label %123

; <label>:118                                     ; preds = %105
  %119 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %108, i32 0, i32 2
  %120 = load i8*, i8** %119
  %121 = bitcast i8* %120 to i64*
  %122 = getelementptr i8, i8* %120, i32 8
  store i8* %122, i8** %119
  br label %123

; <label>:123                                     ; preds = %118, %112
  %124 = phi i64* [ %116, %112 ], [ %121, %118 ]
  %125 = load i64, i64* %124
  store i64 %125, i64* %arg2, align 8
  %126 = load i32, i32* %1, align 4
  %127 = load i64, i64* %arg0, align 8
  %128 = load i64, i64* %arg1, align 8
  %129 = load i64, i64* %arg2, align 8
  %130 = call i64 @f3h(i32 %126, i64 %127, i64 %128, i64 %129, i64 0)
  store i64 %130, i64* %t, align 8
  br label %211

; <label>:131                                     ; preds = %0
  %132 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %133 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %132, i32 0, i32 0
  %134 = load i32, i32* %133
  %135 = icmp ule i32 %134, 40
  br i1 %135, label %136, label %142

; <label>:136                                     ; preds = %131
  %137 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %132, i32 0, i32 3
  %138 = load i8*, i8** %137
  %139 = getelementptr i8, i8* %138, i32 %134
  %140 = bitcast i8* %139 to i64*
  %141 = add i32 %134, 8
  store i32 %141, i32* %133
  br label %147

; <label>:142                                     ; preds = %131
  %143 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %132, i32 0, i32 2
  %144 = load i8*, i8** %143
  %145 = bitcast i8* %144 to i64*
  %146 = getelementptr i8, i8* %144, i32 8
  store i8* %146, i8** %143
  br label %147

; <label>:147                                     ; preds = %142, %136
  %148 = phi i64* [ %140, %136 ], [ %145, %142 ]
  %149 = load i64, i64* %148
  store i64 %149, i64* %arg0, align 8
  %150 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %151 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %150, i32 0, i32 0
  %152 = load i32, i32* %151
  %153 = icmp ule i32 %152, 40
  br i1 %153, label %154, label %160

; <label>:154                                     ; preds = %147
  %155 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %150, i32 0, i32 3
  %156 = load i8*, i8** %155
  %157 = getelementptr i8, i8* %156, i32 %152
  %158 = bitcast i8* %157 to i64*
  %159 = add i32 %152, 8
  store i32 %159, i32* %151
  br label %165

; <label>:160                                     ; preds = %147
  %161 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %150, i32 0, i32 2
  %162 = load i8*, i8** %161
  %163 = bitcast i8* %162 to i64*
  %164 = getelementptr i8, i8* %162, i32 8
  store i8* %164, i8** %161
  br label %165

; <label>:165                                     ; preds = %160, %154
  %166 = phi i64* [ %158, %154 ], [ %163, %160 ]
  %167 = load i64, i64* %166
  store i64 %167, i64* %arg1, align 8
  %168 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %169 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 0
  %170 = load i32, i32* %169
  %171 = icmp ule i32 %170, 40
  br i1 %171, label %172, label %178

; <label>:172                                     ; preds = %165
  %173 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 3
  %174 = load i8*, i8** %173
  %175 = getelementptr i8, i8* %174, i32 %170
  %176 = bitcast i8* %175 to i64*
  %177 = add i32 %170, 8
  store i32 %177, i32* %169
  br label %183

; <label>:178                                     ; preds = %165
  %179 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %168, i32 0, i32 2
  %180 = load i8*, i8** %179
  %181 = bitcast i8* %180 to i64*
  %182 = getelementptr i8, i8* %180, i32 8
  store i8* %182, i8** %179
  br label %183

; <label>:183                                     ; preds = %178, %172
  %184 = phi i64* [ %176, %172 ], [ %181, %178 ]
  %185 = load i64, i64* %184
  store i64 %185, i64* %arg2, align 8
  %186 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %187 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %186, i32 0, i32 0
  %188 = load i32, i32* %187
  %189 = icmp ule i32 %188, 40
  br i1 %189, label %190, label %196

; <label>:190                                     ; preds = %183
  %191 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %186, i32 0, i32 3
  %192 = load i8*, i8** %191
  %193 = getelementptr i8, i8* %192, i32 %188
  %194 = bitcast i8* %193 to i64*
  %195 = add i32 %188, 8
  store i32 %195, i32* %187
  br label %201

; <label>:196                                     ; preds = %183
  %197 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %186, i32 0, i32 2
  %198 = load i8*, i8** %197
  %199 = bitcast i8* %198 to i64*
  %200 = getelementptr i8, i8* %198, i32 8
  store i8* %200, i8** %197
  br label %201

; <label>:201                                     ; preds = %196, %190
  %202 = phi i64* [ %194, %190 ], [ %199, %196 ]
  %203 = load i64, i64* %202
  store i64 %203, i64* %arg3, align 8
  %204 = load i32, i32* %1, align 4
  %205 = load i64, i64* %arg0, align 8
  %206 = load i64, i64* %arg1, align 8
  %207 = load i64, i64* %arg2, align 8
  %208 = load i64, i64* %arg3, align 8
  %209 = call i64 @f3h(i32 %204, i64 %205, i64 %206, i64 %207, i64 %208)
  store i64 %209, i64* %t, align 8
  br label %211

; <label>:210                                     ; preds = %0
  call void @abort() #3
  unreachable

; <label>:211                                     ; preds = %201, %123, %64, %24, %5
  %212 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %213 = bitcast %struct.__va_list_tag* %212 to i8*
  call void @llvm.va_end(i8* %213)
  %214 = load i64, i64* %t, align 8
  ret i64 %214
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @f4(i32 %i, ...) #0 {
  %1 = alloca %struct.__va_list_tag*, align 8
  %2 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %2, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32, i32* %2, align 4
  switch i32 %5, label %68 [
    i32 4, label %6
    i32 5, label %26
  ]

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %7, i32 0, i32 1
  %9 = load i32, i32* %8
  %10 = icmp ule i32 %9, 160
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %6
  %12 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %7, i32 0, i32 3
  %13 = load i8*, i8** %12
  %14 = getelementptr i8, i8* %13, i32 %9
  %15 = bitcast i8* %14 to double*
  %16 = add i32 %9, 16
  store i32 %16, i32* %8
  br label %22

; <label>:17                                      ; preds = %6
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %7, i32 0, i32 2
  %19 = load i8*, i8** %18
  %20 = bitcast i8* %19 to double*
  %21 = getelementptr i8, i8* %19, i32 8
  store i8* %21, i8** %18
  br label %22

; <label>:22                                      ; preds = %17, %11
  %23 = phi double* [ %15, %11 ], [ %20, %17 ]
  %24 = load double, double* %23
  %25 = fptosi double %24 to i64
  store i64 %25, i64* @y, align 8
  br label %69

; <label>:26                                      ; preds = %0
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %28 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %27, i32 0, i32 1
  %29 = load i32, i32* %28
  %30 = icmp ule i32 %29, 160
  br i1 %30, label %31, label %37

; <label>:31                                      ; preds = %26
  %32 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %27, i32 0, i32 3
  %33 = load i8*, i8** %32
  %34 = getelementptr i8, i8* %33, i32 %29
  %35 = bitcast i8* %34 to double*
  %36 = add i32 %29, 16
  store i32 %36, i32* %28
  br label %42

; <label>:37                                      ; preds = %26
  %38 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %27, i32 0, i32 2
  %39 = load i8*, i8** %38
  %40 = bitcast i8* %39 to double*
  %41 = getelementptr i8, i8* %39, i32 8
  store i8* %41, i8** %38
  br label %42

; <label>:42                                      ; preds = %37, %31
  %43 = phi double* [ %35, %31 ], [ %40, %37 ]
  %44 = load double, double* %43
  %45 = fptosi double %44 to i64
  store i64 %45, i64* @y, align 8
  %46 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 1
  %48 = load i32, i32* %47
  %49 = icmp ule i32 %48, 160
  br i1 %49, label %50, label %56

; <label>:50                                      ; preds = %42
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 3
  %52 = load i8*, i8** %51
  %53 = getelementptr i8, i8* %52, i32 %48
  %54 = bitcast i8* %53 to double*
  %55 = add i32 %48, 16
  store i32 %55, i32* %47
  br label %61

; <label>:56                                      ; preds = %42
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 2
  %58 = load i8*, i8** %57
  %59 = bitcast i8* %58 to double*
  %60 = getelementptr i8, i8* %58, i32 8
  store i8* %60, i8** %57
  br label %61

; <label>:61                                      ; preds = %56, %50
  %62 = phi double* [ %54, %50 ], [ %59, %56 ]
  %63 = load double, double* %62
  %64 = load i64, i64* @y, align 8
  %65 = sitofp i64 %64 to double
  %66 = fadd double %65, %63
  %67 = fptosi double %66 to i64
  store i64 %67, i64* @y, align 8
  br label %69

; <label>:68                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:69                                      ; preds = %61, %22
  %70 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  store %struct.__va_list_tag* %70, %struct.__va_list_tag** %1, align 8
  %71 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %71, i32 0, i32 1
  %73 = load i32, i32* %72
  %74 = icmp ule i32 %73, 160
  br i1 %74, label %75, label %81

; <label>:75                                      ; preds = %69
  %76 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %71, i32 0, i32 3
  %77 = load i8*, i8** %76
  %78 = getelementptr i8, i8* %77, i32 %73
  %79 = bitcast i8* %78 to double*
  %80 = add i32 %73, 16
  store i32 %80, i32* %72
  br label %86

; <label>:81                                      ; preds = %69
  %82 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %71, i32 0, i32 2
  %83 = load i8*, i8** %82
  %84 = bitcast i8* %83 to double*
  %85 = getelementptr i8, i8* %83, i32 8
  store i8* %85, i8** %82
  br label %86

; <label>:86                                      ; preds = %81, %75
  %87 = phi double* [ %79, %75 ], [ %84, %81 ]
  %88 = load double, double* %87
  %89 = fptosi double %88 to i64
  store i64 %89, i64* @x, align 8
  %90 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %90, i32 0, i32 0
  %92 = load i32, i32* %91
  %93 = icmp ule i32 %92, 40
  br i1 %93, label %94, label %100

; <label>:94                                      ; preds = %86
  %95 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %90, i32 0, i32 3
  %96 = load i8*, i8** %95
  %97 = getelementptr i8, i8* %96, i32 %92
  %98 = bitcast i8* %97 to i64*
  %99 = add i32 %92, 8
  store i32 %99, i32* %91
  br label %105

; <label>:100                                     ; preds = %86
  %101 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %90, i32 0, i32 2
  %102 = load i8*, i8** %101
  %103 = bitcast i8* %102 to i64*
  %104 = getelementptr i8, i8* %102, i32 8
  store i8* %104, i8** %101
  br label %105

; <label>:105                                     ; preds = %100, %94
  %106 = phi i64* [ %98, %94 ], [ %103, %100 ]
  %107 = load i64, i64* %106
  %108 = load i64, i64* @x, align 8
  %109 = add nsw i64 %108, %107
  store i64 %109, i64* @x, align 8
  %110 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %111 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %110, i32 0, i32 1
  %112 = load i32, i32* %111
  %113 = icmp ule i32 %112, 160
  br i1 %113, label %114, label %120

; <label>:114                                     ; preds = %105
  %115 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %110, i32 0, i32 3
  %116 = load i8*, i8** %115
  %117 = getelementptr i8, i8* %116, i32 %112
  %118 = bitcast i8* %117 to double*
  %119 = add i32 %112, 16
  store i32 %119, i32* %111
  br label %f1i.exit

; <label>:120                                     ; preds = %105
  %121 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %110, i32 0, i32 2
  %122 = load i8*, i8** %121
  %123 = bitcast i8* %122 to double*
  %124 = getelementptr i8, i8* %122, i32 8
  store i8* %124, i8** %121
  br label %f1i.exit

f1i.exit:                                         ; preds = %114, %120
  %125 = phi double* [ %118, %114 ], [ %123, %120 ]
  %126 = load double, double* %125
  %127 = load i64, i64* @x, align 8
  %128 = sitofp i64 %127 to double
  %129 = fadd double %128, %126
  %130 = fptosi double %129 to i64
  store i64 %130, i64* @x, align 8
  %131 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %132 = bitcast %struct.__va_list_tag* %131 to i8*
  call void @llvm.va_end(i8* %132)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...) @f1(i32 3, double 1.600000e+01, i64 128, double 3.200000e+01)
  %2 = load i64, i64* @x, align 8
  %3 = icmp ne i64 %2, 176
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  call void (i32, ...) @f2(i32 6, i32 5, i64 7, double 1.800000e+01, double 1.900000e+01, i64 17, double 6.400000e+01)
  %6 = load i64, i64* @x, align 8
  %7 = icmp ne i64 %6, 100
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %5
  %9 = load i64, i64* @y, align 8
  %10 = icmp ne i64 %9, 30
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8, %5
  call void @abort() #3
  unreachable

; <label>:12                                      ; preds = %8
  %13 = call i64 (i32, ...) @f3(i32 0)
  %14 = icmp ne i64 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %12
  call void @abort() #3
  unreachable

; <label>:16                                      ; preds = %12
  %17 = call i64 (i32, ...) @f3(i32 1, i64 18)
  %18 = icmp ne i64 %17, 19
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %16
  %21 = call i64 (i32, ...) @f3(i32 2, i64 18, i64 100)
  %22 = icmp ne i64 %21, 120
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %20
  call void @abort() #3
  unreachable

; <label>:24                                      ; preds = %20
  %25 = call i64 (i32, ...) @f3(i32 3, i64 18, i64 100, i64 300)
  %26 = icmp ne i64 %25, 421
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  call void @abort() #3
  unreachable

; <label>:28                                      ; preds = %24
  %29 = call i64 (i32, ...) @f3(i32 4, i64 18, i64 71, i64 64, i64 86)
  %30 = icmp ne i64 %29, 243
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %28
  call void @abort() #3
  unreachable

; <label>:32                                      ; preds = %28
  call void (i32, ...) @f4(i32 4, double 6.000000e+00, double 9.000000e+00, i64 16, double 1.800000e+01)
  %33 = load i64, i64* @x, align 8
  %34 = icmp ne i64 %33, 43
  br i1 %34, label %38, label %35

; <label>:35                                      ; preds = %32
  %36 = load i64, i64* @y, align 8
  %37 = icmp ne i64 %36, 6
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %35, %32
  call void @abort() #3
  unreachable

; <label>:39                                      ; preds = %35
  call void (i32, ...) @f4(i32 5, double 7.000000e+00, double 2.100000e+01, double 1.000000e+00, i64 17, double 1.260000e+02)
  %40 = load i64, i64* @x, align 8
  %41 = icmp ne i64 %40, 144
  br i1 %41, label %45, label %42

; <label>:42                                      ; preds = %39
  %43 = load i64, i64* @y, align 8
  %44 = icmp ne i64 %43, 28
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %42, %39
  call void @abort() #3
  unreachable

; <label>:46                                      ; preds = %42
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
