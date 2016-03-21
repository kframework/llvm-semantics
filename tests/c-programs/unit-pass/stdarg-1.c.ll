; ModuleID = './stdarg-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@pap = common global [1 x %struct.__va_list_tag]* null, align 8
@bar_arg = common global i32 0, align 4
@d = common global double 0.000000e+00, align 8
@x = common global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @foo(i32 %v, %struct.__va_list_tag* %ap) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.__va_list_tag*, align 8
  store i32 %v, i32* %1, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %2, align 8
  %3 = load i32, i32* %1, align 4
  switch i32 %3, label %23 [
    i32 5, label %4
  ]

; <label>:4                                       ; preds = %0
  %5 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %6 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 0
  %7 = load i32, i32* %6
  %8 = icmp ule i32 %7, 40
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %4
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 3
  %11 = load i8*, i8** %10
  %12 = getelementptr i8, i8* %11, i32 %7
  %13 = bitcast i8* %12 to i32*
  %14 = add i32 %7, 8
  store i32 %14, i32* %6
  br label %20

; <label>:15                                      ; preds = %4
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 2
  %17 = load i8*, i8** %16
  %18 = bitcast i8* %17 to i32*
  %19 = getelementptr i8, i8* %17, i32 8
  store i8* %19, i8** %16
  br label %20

; <label>:20                                      ; preds = %15, %9
  %21 = phi i32* [ %13, %9 ], [ %18, %15 ]
  %22 = load i32, i32* %21
  store i32 %22, i32* @foo_arg, align 4
  br label %24

; <label>:23                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:24                                      ; preds = %20
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @bar(i32 %v) #0 {
  %1 = alloca i32, align 4
  store i32 %v, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp eq i32 %2, 16390
  br i1 %3, label %4, label %38

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  %6 = icmp ule i32 %5, 160
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %4
  %8 = load i8*, i8** getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %9 = getelementptr i8, i8* %8, i32 %5
  %10 = bitcast i8* %9 to double*
  %11 = add i32 %5, 16
  store i32 %11, i32* getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  br label %16

; <label>:12                                      ; preds = %4
  %13 = load i8*, i8** getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %14 = bitcast i8* %13 to double*
  %15 = getelementptr i8, i8* %13, i32 8
  store i8* %15, i8** getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %16

; <label>:16                                      ; preds = %12, %7
  %17 = phi double* [ %10, %7 ], [ %14, %12 ]
  %18 = load double, double* %17
  %19 = fcmp une double %18, 1.700000e+01
  br i1 %19, label %36, label %20

; <label>:20                                      ; preds = %16
  %21 = load i32, i32* getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  %22 = icmp ule i32 %21, 40
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %20
  %24 = load i8*, i8** getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %25 = getelementptr i8, i8* %24, i32 %21
  %26 = bitcast i8* %25 to i64*
  %27 = add i32 %21, 8
  store i32 %27, i32* getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  br label %32

; <label>:28                                      ; preds = %20
  %29 = load i8*, i8** getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %30 = bitcast i8* %29 to i64*
  %31 = getelementptr i8, i8* %29, i32 8
  store i8* %31, i8** getelementptr inbounds ([1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %32

; <label>:32                                      ; preds = %28, %23
  %33 = phi i64* [ %26, %23 ], [ %30, %28 ]
  %34 = load i64, i64* %33
  %35 = icmp ne i64 %34, 129
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %32, %16
  call void @abort() #3
  unreachable

; <label>:37                                      ; preds = %32
  br label %99

; <label>:38                                      ; preds = %0
  %39 = load i32, i32* %1, align 4
  %40 = icmp eq i32 %39, 16392
  br i1 %40, label %41, label %98

; <label>:41                                      ; preds = %38
  %42 = load [1 x %struct.__va_list_tag]*, [1 x %struct.__va_list_tag]** @pap, align 8
  %43 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %42, i32 0, i32 0
  %44 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 0
  %45 = load i32, i32* %44
  %46 = icmp ule i32 %45, 40
  br i1 %46, label %47, label %53

; <label>:47                                      ; preds = %41
  %48 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 3
  %49 = load i8*, i8** %48
  %50 = getelementptr i8, i8* %49, i32 %45
  %51 = bitcast i8* %50 to i64*
  %52 = add i32 %45, 8
  store i32 %52, i32* %44
  br label %58

; <label>:53                                      ; preds = %41
  %54 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 2
  %55 = load i8*, i8** %54
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr i8, i8* %55, i32 8
  store i8* %57, i8** %54
  br label %58

; <label>:58                                      ; preds = %53, %47
  %59 = phi i64* [ %51, %47 ], [ %56, %53 ]
  %60 = load i64, i64* %59
  %61 = icmp ne i64 %60, 14
  br i1 %61, label %96, label %62

; <label>:62                                      ; preds = %58
  %63 = load [1 x %struct.__va_list_tag]*, [1 x %struct.__va_list_tag]** @pap, align 8
  %64 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %63, i32 0, i32 0
  %65 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %64, i32 0, i32 2
  %66 = load i8*, i8** %65
  %67 = getelementptr i8, i8* %66, i64 15
  %68 = ptrtoint i8* %67 to i64
  %69 = and i64 %68, -16
  %70 = inttoptr i64 %69 to i8*
  %71 = bitcast i8* %70 to x86_fp80*
  %72 = getelementptr i8, i8* %70, i32 16
  store i8* %72, i8** %65
  %73 = load x86_fp80, x86_fp80* %71
  %74 = fcmp une x86_fp80 %73, 0xK40068300000000000000
  br i1 %74, label %96, label %75

; <label>:75                                      ; preds = %62
  %76 = load [1 x %struct.__va_list_tag]*, [1 x %struct.__va_list_tag]** @pap, align 8
  %77 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %76, i32 0, i32 0
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %77, i32 0, i32 0
  %79 = load i32, i32* %78
  %80 = icmp ule i32 %79, 40
  br i1 %80, label %81, label %87

; <label>:81                                      ; preds = %75
  %82 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %77, i32 0, i32 3
  %83 = load i8*, i8** %82
  %84 = getelementptr i8, i8* %83, i32 %79
  %85 = bitcast i8* %84 to i32*
  %86 = add i32 %79, 8
  store i32 %86, i32* %78
  br label %92

; <label>:87                                      ; preds = %75
  %88 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %77, i32 0, i32 2
  %89 = load i8*, i8** %88
  %90 = bitcast i8* %89 to i32*
  %91 = getelementptr i8, i8* %89, i32 8
  store i8* %91, i8** %88
  br label %92

; <label>:92                                      ; preds = %87, %81
  %93 = phi i32* [ %85, %81 ], [ %90, %87 ]
  %94 = load i32, i32* %93
  %95 = icmp ne i32 %94, 17
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %92, %62, %58
  call void @abort() #3
  unreachable

; <label>:97                                      ; preds = %92
  br label %98

; <label>:98                                      ; preds = %97, %38
  br label %99

; <label>:99                                      ; preds = %98, %37
  %100 = load i32, i32* %1, align 4
  store i32 %100, i32* @bar_arg, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f0(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f1(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_end(i8* %5)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define void @f2(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load double, double* @d, align 8
  %5 = fptosi double %4 to i32
  call void @bar(i32 %5)
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 0
  %8 = load i32, i32* %7
  %9 = icmp ule i32 %8, 40
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 3
  %12 = load i8*, i8** %11
  %13 = getelementptr i8, i8* %12, i32 %8
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %8, 8
  store i32 %15, i32* %7
  br label %21

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 2
  %18 = load i8*, i8** %17
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr i8, i8* %18, i32 8
  store i8* %20, i8** %17
  br label %21

; <label>:21                                      ; preds = %16, %10
  %22 = phi i64* [ %14, %10 ], [ %19, %16 ]
  %23 = load i64, i64* %22
  store i64 %23, i64* @x, align 8
  %24 = load i64, i64* @x, align 8
  %25 = trunc i64 %24 to i32
  call void @bar(i32 %25)
  %26 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %27 = bitcast %struct.__va_list_tag* %26 to i8*
  call void @llvm.va_end(i8* %27)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f3(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 1
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 160
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to double*
  %13 = add i32 %6, 16
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to double*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi double* [ %12, %8 ], [ %17, %14 ]
  %21 = load double, double* %20
  store double %21, double* @d, align 8
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %23 = bitcast %struct.__va_list_tag* %22 to i8*
  call void @llvm.va_end(i8* %23)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f4(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 1
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 160
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to double*
  %13 = add i32 %6, 16
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to double*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi double* [ %12, %8 ], [ %17, %14 ]
  %21 = load double, double* %20
  %22 = fptosi double %21 to i64
  store i64 %22, i64* @x, align 8
  %23 = load i32, i32* %1, align 4
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @foo(i32 %23, %struct.__va_list_tag* %24)
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %26 = bitcast %struct.__va_list_tag* %25 to i8*
  call void @llvm.va_end(i8* %26)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f5(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_copy(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*), i8* %5)
  %6 = load i32, i32* %1, align 4
  call void @bar(i32 %6)
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_end(i8* %8)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_copy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define void @f6(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load double, double* @d, align 8
  %5 = fptosi double %4 to i32
  call void @bar(i32 %5)
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 0
  %8 = load i32, i32* %7
  %9 = icmp ule i32 %8, 40
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 3
  %12 = load i8*, i8** %11
  %13 = getelementptr i8, i8* %12, i32 %8
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %8, 8
  store i32 %15, i32* %7
  br label %21

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 2
  %18 = load i8*, i8** %17
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr i8, i8* %18, i32 8
  store i8* %20, i8** %17
  br label %21

; <label>:21                                      ; preds = %16, %10
  %22 = phi i64* [ %14, %10 ], [ %19, %16 ]
  %23 = load i64, i64* %22
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %24, i32 0, i32 0
  %26 = load i32, i32* %25
  %27 = icmp ule i32 %26, 40
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %21
  %29 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %24, i32 0, i32 3
  %30 = load i8*, i8** %29
  %31 = getelementptr i8, i8* %30, i32 %26
  %32 = bitcast i8* %31 to i64*
  %33 = add i32 %26, 8
  store i32 %33, i32* %25
  br label %39

; <label>:34                                      ; preds = %21
  %35 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %24, i32 0, i32 2
  %36 = load i8*, i8** %35
  %37 = bitcast i8* %36 to i64*
  %38 = getelementptr i8, i8* %36, i32 8
  store i8* %38, i8** %35
  br label %39

; <label>:39                                      ; preds = %34, %28
  %40 = phi i64* [ %32, %28 ], [ %37, %34 ]
  %41 = load i64, i64* %40
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %43 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 0
  %44 = load i32, i32* %43
  %45 = icmp ule i32 %44, 40
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %39
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 3
  %48 = load i8*, i8** %47
  %49 = getelementptr i8, i8* %48, i32 %44
  %50 = bitcast i8* %49 to i64*
  %51 = add i32 %44, 8
  store i32 %51, i32* %43
  br label %57

; <label>:52                                      ; preds = %39
  %53 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 2
  %54 = load i8*, i8** %53
  %55 = bitcast i8* %54 to i64*
  %56 = getelementptr i8, i8* %54, i32 8
  store i8* %56, i8** %53
  br label %57

; <label>:57                                      ; preds = %52, %46
  %58 = phi i64* [ %50, %46 ], [ %55, %52 ]
  %59 = load i64, i64* %58
  store i64 %59, i64* @x, align 8
  %60 = load i64, i64* @x, align 8
  %61 = trunc i64 %60 to i32
  call void @bar(i32 %61)
  %62 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %63 = bitcast %struct.__va_list_tag* %62 to i8*
  call void @llvm.va_end(i8* %63)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f7(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  %4 = load i32, i32* %1, align 4
  call void @bar(i32 %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = bitcast %struct.__va_list_tag* %5 to i8*
  call void @llvm.va_end(i8* %6)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f8(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  %4 = load i32, i32* %1, align 4
  call void @bar(i32 %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 1
  %7 = load i32, i32* %6
  %8 = icmp ule i32 %7, 160
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 3
  %11 = load i8*, i8** %10
  %12 = getelementptr i8, i8* %11, i32 %7
  %13 = bitcast i8* %12 to double*
  %14 = add i32 %7, 16
  store i32 %14, i32* %6
  br label %20

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 2
  %17 = load i8*, i8** %16
  %18 = bitcast i8* %17 to double*
  %19 = getelementptr i8, i8* %17, i32 8
  store i8* %19, i8** %16
  br label %20

; <label>:20                                      ; preds = %15, %9
  %21 = phi double* [ %13, %9 ], [ %18, %15 ]
  %22 = load double, double* %21
  store double %22, double* @d, align 8
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %24 = bitcast %struct.__va_list_tag* %23 to i8*
  call void @llvm.va_end(i8* %24)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...) @f0(i32 1)
  call void (i32, ...) @f1(i32 2)
  store double 3.100000e+01, double* @d, align 8
  call void (i32, ...) @f2(i32 3, i64 28)
  %2 = load i32, i32* @bar_arg, align 4
  %3 = icmp ne i32 %2, 28
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i64, i64* @x, align 8
  %6 = icmp ne i64 %5, 28
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4, %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %4
  call void (i32, ...) @f3(i32 4, double 1.310000e+02)
  %9 = load double, double* @d, align 8
  %10 = fcmp une double %9, 1.310000e+02
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  call void @abort() #3
  unreachable

; <label>:12                                      ; preds = %8
  call void (i32, ...) @f4(i32 5, double 1.600000e+01, i32 128)
  %13 = load i64, i64* @x, align 8
  %14 = icmp ne i64 %13, 16
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %12
  %16 = load i32, i32* @foo_arg, align 4
  %17 = icmp ne i32 %16, 128
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15, %12
  call void @abort() #3
  unreachable

; <label>:19                                      ; preds = %15
  call void (i32, ...) @f5(i32 16390, double 1.700000e+01, i64 129)
  %20 = load i32, i32* @bar_arg, align 4
  %21 = icmp ne i32 %20, 16390
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  call void @abort() #3
  unreachable

; <label>:23                                      ; preds = %19
  call void (i32, ...) @f6(i32 7, i64 12, i64 14, i64 -31)
  %24 = load i32, i32* @bar_arg, align 4
  %25 = icmp ne i32 %24, -31
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23
  call void @abort() #3
  unreachable

; <label>:27                                      ; preds = %23
  call void (i32, ...) @f7(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.600000e+01)
  %28 = load i32, i32* @bar_arg, align 4
  %29 = icmp ne i32 %28, 16392
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %27
  call void @abort() #3
  unreachable

; <label>:31                                      ; preds = %27
  call void (i32, ...) @f8(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.700000e+01)
  %32 = load i32, i32* @bar_arg, align 4
  %33 = icmp ne i32 %32, 16392
  br i1 %33, label %37, label %34

; <label>:34                                      ; preds = %31
  %35 = load double, double* @d, align 8
  %36 = fcmp une double %35, 2.700000e+01
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34, %31
  call void @abort() #3
  unreachable

; <label>:38                                      ; preds = %34
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
