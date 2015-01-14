; ModuleID = './stdarg-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.A = type { i32, [1 x %struct.__va_list_tag], [2 x [1 x %struct.__va_list_tag]] }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@bar_arg = common global i32 0, align 4
@x = common global i64 0, align 8
@d = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define void @foo(i32 %v, %struct.__va_list_tag* %ap) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.__va_list_tag*, align 8
  store i32 %v, i32* %1, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %2, align 8
  %3 = load i32* %1, align 4
  switch i32 %3, label %142 [
    i32 5, label %4
    i32 8, label %67
    i32 11, label %109
  ]

; <label>:4                                       ; preds = %0
  %5 = load %struct.__va_list_tag** %2, align 8
  %6 = getelementptr inbounds %struct.__va_list_tag* %5, i32 0, i32 0
  %7 = load i32* %6
  %8 = icmp ule i32 %7, 40
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %4
  %10 = getelementptr inbounds %struct.__va_list_tag* %5, i32 0, i32 3
  %11 = load i8** %10
  %12 = getelementptr i8* %11, i32 %7
  %13 = bitcast i8* %12 to i32*
  %14 = add i32 %7, 8
  store i32 %14, i32* %6
  br label %20

; <label>:15                                      ; preds = %4
  %16 = getelementptr inbounds %struct.__va_list_tag* %5, i32 0, i32 2
  %17 = load i8** %16
  %18 = bitcast i8* %17 to i32*
  %19 = getelementptr i8* %17, i32 8
  store i8* %19, i8** %16
  br label %20

; <label>:20                                      ; preds = %15, %9
  %21 = phi i32* [ %13, %9 ], [ %18, %15 ]
  %22 = load i32* %21
  store i32 %22, i32* @foo_arg, align 4
  %23 = load %struct.__va_list_tag** %2, align 8
  %24 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 1
  %25 = load i32* %24
  %26 = icmp ule i32 %25, 160
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %20
  %28 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 3
  %29 = load i8** %28
  %30 = getelementptr i8* %29, i32 %25
  %31 = bitcast i8* %30 to double*
  %32 = add i32 %25, 16
  store i32 %32, i32* %24
  br label %38

; <label>:33                                      ; preds = %20
  %34 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 2
  %35 = load i8** %34
  %36 = bitcast i8* %35 to double*
  %37 = getelementptr i8* %35, i32 8
  store i8* %37, i8** %34
  br label %38

; <label>:38                                      ; preds = %33, %27
  %39 = phi double* [ %31, %27 ], [ %36, %33 ]
  %40 = load double* %39
  %41 = load i32* @foo_arg, align 4
  %42 = sitofp i32 %41 to double
  %43 = fadd double %42, %40
  %44 = fptosi double %43 to i32
  store i32 %44, i32* @foo_arg, align 4
  %45 = load %struct.__va_list_tag** %2, align 8
  %46 = getelementptr inbounds %struct.__va_list_tag* %45, i32 0, i32 0
  %47 = load i32* %46
  %48 = icmp ule i32 %47, 40
  br i1 %48, label %49, label %55

; <label>:49                                      ; preds = %38
  %50 = getelementptr inbounds %struct.__va_list_tag* %45, i32 0, i32 3
  %51 = load i8** %50
  %52 = getelementptr i8* %51, i32 %47
  %53 = bitcast i8* %52 to i64*
  %54 = add i32 %47, 8
  store i32 %54, i32* %46
  br label %60

; <label>:55                                      ; preds = %38
  %56 = getelementptr inbounds %struct.__va_list_tag* %45, i32 0, i32 2
  %57 = load i8** %56
  %58 = bitcast i8* %57 to i64*
  %59 = getelementptr i8* %57, i32 8
  store i8* %59, i8** %56
  br label %60

; <label>:60                                      ; preds = %55, %49
  %61 = phi i64* [ %53, %49 ], [ %58, %55 ]
  %62 = load i64* %61
  %63 = load i32* @foo_arg, align 4
  %64 = sext i32 %63 to i64
  %65 = add nsw i64 %64, %62
  %66 = trunc i64 %65 to i32
  store i32 %66, i32* @foo_arg, align 4
  br label %143

; <label>:67                                      ; preds = %0
  %68 = load %struct.__va_list_tag** %2, align 8
  %69 = getelementptr inbounds %struct.__va_list_tag* %68, i32 0, i32 0
  %70 = load i32* %69
  %71 = icmp ule i32 %70, 40
  br i1 %71, label %72, label %78

; <label>:72                                      ; preds = %67
  %73 = getelementptr inbounds %struct.__va_list_tag* %68, i32 0, i32 3
  %74 = load i8** %73
  %75 = getelementptr i8* %74, i32 %70
  %76 = bitcast i8* %75 to i64*
  %77 = add i32 %70, 8
  store i32 %77, i32* %69
  br label %83

; <label>:78                                      ; preds = %67
  %79 = getelementptr inbounds %struct.__va_list_tag* %68, i32 0, i32 2
  %80 = load i8** %79
  %81 = bitcast i8* %80 to i64*
  %82 = getelementptr i8* %80, i32 8
  store i8* %82, i8** %79
  br label %83

; <label>:83                                      ; preds = %78, %72
  %84 = phi i64* [ %76, %72 ], [ %81, %78 ]
  %85 = load i64* %84
  %86 = trunc i64 %85 to i32
  store i32 %86, i32* @foo_arg, align 4
  %87 = load %struct.__va_list_tag** %2, align 8
  %88 = getelementptr inbounds %struct.__va_list_tag* %87, i32 0, i32 1
  %89 = load i32* %88
  %90 = icmp ule i32 %89, 160
  br i1 %90, label %91, label %97

; <label>:91                                      ; preds = %83
  %92 = getelementptr inbounds %struct.__va_list_tag* %87, i32 0, i32 3
  %93 = load i8** %92
  %94 = getelementptr i8* %93, i32 %89
  %95 = bitcast i8* %94 to double*
  %96 = add i32 %89, 16
  store i32 %96, i32* %88
  br label %102

; <label>:97                                      ; preds = %83
  %98 = getelementptr inbounds %struct.__va_list_tag* %87, i32 0, i32 2
  %99 = load i8** %98
  %100 = bitcast i8* %99 to double*
  %101 = getelementptr i8* %99, i32 8
  store i8* %101, i8** %98
  br label %102

; <label>:102                                     ; preds = %97, %91
  %103 = phi double* [ %95, %91 ], [ %100, %97 ]
  %104 = load double* %103
  %105 = load i32* @foo_arg, align 4
  %106 = sitofp i32 %105 to double
  %107 = fadd double %106, %104
  %108 = fptosi double %107 to i32
  store i32 %108, i32* @foo_arg, align 4
  br label %143

; <label>:109                                     ; preds = %0
  %110 = load %struct.__va_list_tag** %2, align 8
  %111 = getelementptr inbounds %struct.__va_list_tag* %110, i32 0, i32 0
  %112 = load i32* %111
  %113 = icmp ule i32 %112, 40
  br i1 %113, label %114, label %120

; <label>:114                                     ; preds = %109
  %115 = getelementptr inbounds %struct.__va_list_tag* %110, i32 0, i32 3
  %116 = load i8** %115
  %117 = getelementptr i8* %116, i32 %112
  %118 = bitcast i8* %117 to i32*
  %119 = add i32 %112, 8
  store i32 %119, i32* %111
  br label %125

; <label>:120                                     ; preds = %109
  %121 = getelementptr inbounds %struct.__va_list_tag* %110, i32 0, i32 2
  %122 = load i8** %121
  %123 = bitcast i8* %122 to i32*
  %124 = getelementptr i8* %122, i32 8
  store i8* %124, i8** %121
  br label %125

; <label>:125                                     ; preds = %120, %114
  %126 = phi i32* [ %118, %114 ], [ %123, %120 ]
  %127 = load i32* %126
  store i32 %127, i32* @foo_arg, align 4
  %128 = load %struct.__va_list_tag** %2, align 8
  %129 = getelementptr inbounds %struct.__va_list_tag* %128, i32 0, i32 2
  %130 = load i8** %129
  %131 = getelementptr i8* %130, i64 15
  %132 = ptrtoint i8* %131 to i64
  %133 = and i64 %132, -16
  %134 = inttoptr i64 %133 to i8*
  %135 = bitcast i8* %134 to x86_fp80*
  %136 = getelementptr i8* %134, i32 16
  store i8* %136, i8** %129
  %137 = load x86_fp80* %135
  %138 = load i32* @foo_arg, align 4
  %139 = sitofp i32 %138 to x86_fp80
  %140 = fadd x86_fp80 %139, %137
  %141 = fptosi x86_fp80 %140 to i32
  store i32 %141, i32* @foo_arg, align 4
  br label %143

; <label>:142                                     ; preds = %0
  call void @abort() #3
  unreachable

; <label>:143                                     ; preds = %125, %102, %60
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @bar(i32 %v) #0 {
  %1 = alloca i32, align 4
  store i32 %v, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, 16386
  br i1 %3, label %4, label %38

; <label>:4                                       ; preds = %0
  %5 = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  %6 = icmp ule i32 %5, 40
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %4
  %8 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %9 = getelementptr i8* %8, i32 %5
  %10 = bitcast i8* %9 to i32*
  %11 = add i32 %5, 8
  store i32 %11, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  br label %16

; <label>:12                                      ; preds = %4
  %13 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %14 = bitcast i8* %13 to i32*
  %15 = getelementptr i8* %13, i32 8
  store i8* %15, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %16

; <label>:16                                      ; preds = %12, %7
  %17 = phi i32* [ %10, %7 ], [ %14, %12 ]
  %18 = load i32* %17
  %19 = icmp ne i32 %18, 13
  br i1 %19, label %36, label %20

; <label>:20                                      ; preds = %16
  %21 = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  %22 = icmp ule i32 %21, 160
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %20
  %24 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %25 = getelementptr i8* %24, i32 %21
  %26 = bitcast i8* %25 to double*
  %27 = add i32 %21, 16
  store i32 %27, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 1)
  br label %32

; <label>:28                                      ; preds = %20
  %29 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %30 = bitcast i8* %29 to double*
  %31 = getelementptr i8* %29, i32 8
  store i8* %31, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %32

; <label>:32                                      ; preds = %28, %23
  %33 = phi double* [ %26, %23 ], [ %30, %28 ]
  %34 = load double* %33
  %35 = fcmp une double %34, -1.400000e+01
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %32, %16
  call void @abort() #3
  unreachable

; <label>:37                                      ; preds = %32
  br label %38

; <label>:38                                      ; preds = %37, %0
  %39 = load i32* %1, align 4
  store i32 %39, i32* @bar_arg, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f1(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %2 = load i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  %3 = icmp ule i32 %2, 40
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 3)
  %6 = getelementptr i8* %5, i32 %2
  %7 = bitcast i8* %6 to i64*
  %8 = add i32 %2, 8
  store i32 %8, i32* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 0)
  br label %13

; <label>:9                                       ; preds = %0
  %10 = load i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  %11 = bitcast i8* %10 to i64*
  %12 = getelementptr i8* %10, i32 8
  store i8* %12, i8** getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0, i32 2)
  br label %13

; <label>:13                                      ; preds = %9, %4
  %14 = phi i64* [ %7, %4 ], [ %11, %9 ]
  %15 = load i64* %14
  store i64 %15, i64* @x, align 8
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define void @f2(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %2 = load i32* %1, align 4
  call void @bar(i32 %2)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

; Function Attrs: nounwind uwtable
define void @f3(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.__va_list_tag* %6, i32 0, i32 0
  %8 = load i32* %7
  %9 = icmp ule i32 %8, 40
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.__va_list_tag* %6, i32 0, i32 3
  %12 = load i8** %11
  %13 = getelementptr i8* %12, i32 %8
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %8, 8
  store i32 %15, i32* %7
  br label %21

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag* %6, i32 0, i32 2
  %18 = load i8** %17
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr i8* %18, i32 8
  store i8* %20, i8** %17
  br label %21

; <label>:21                                      ; preds = %16, %10
  %22 = phi i64* [ %14, %10 ], [ %19, %16 ]
  %23 = load i64* %22
  store i64 %23, i64* @x, align 8
  %24 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %24, i32 0, i32 0
  %26 = bitcast %struct.__va_list_tag* %25 to i8*
  call void @llvm.va_end(i8* %26)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f4(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32* %1, align 4
  call void @bar(i32 %5)
  %6 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_end(i8* %8)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f5(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32* %1, align 4
  %6 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  call void @foo(i32 %5, %struct.__va_list_tag* %7)
  %8 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %8, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_end(i8* %10)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f6(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.__va_list_tag* %6, i32 0, i32 0
  %8 = load i32* %7
  %9 = icmp ule i32 %8, 40
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.__va_list_tag* %6, i32 0, i32 3
  %12 = load i8** %11
  %13 = getelementptr i8* %12, i32 %8
  %14 = bitcast i8* %13 to i64*
  %15 = add i32 %8, 8
  store i32 %15, i32* %7
  br label %21

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag* %6, i32 0, i32 2
  %18 = load i8** %17
  %19 = bitcast i8* %18 to i64*
  %20 = getelementptr i8* %18, i32 8
  store i8* %20, i8** %17
  br label %21

; <label>:21                                      ; preds = %16, %10
  %22 = phi i64* [ %14, %10 ], [ %19, %16 ]
  %23 = load i64* %22
  store i64 %23, i64* @x, align 8
  %24 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %24, i32 0, i32 0
  %26 = bitcast %struct.__va_list_tag* %25 to i8*
  call void @llvm.va_end(i8* %26)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f7(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32* %1, align 4
  call void @bar(i32 %5)
  %6 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_end(i8* %8)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f8(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32* %1, align 4
  %6 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  call void @foo(i32 %5, %struct.__va_list_tag* %7)
  %8 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %8, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_end(i8* %10)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f10(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %2, i32 0, i64 1
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %7 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %6, i32 0, i64 1
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.__va_list_tag* %8, i32 0, i32 0
  %10 = load i32* %9
  %11 = icmp ule i32 %10, 40
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.__va_list_tag* %8, i32 0, i32 3
  %14 = load i8** %13
  %15 = getelementptr i8* %14, i32 %10
  %16 = bitcast i8* %15 to i64*
  %17 = add i32 %10, 8
  store i32 %17, i32* %9
  br label %23

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds %struct.__va_list_tag* %8, i32 0, i32 2
  %20 = load i8** %19
  %21 = bitcast i8* %20 to i64*
  %22 = getelementptr i8* %20, i32 8
  store i8* %22, i8** %19
  br label %23

; <label>:23                                      ; preds = %18, %12
  %24 = phi i64* [ %16, %12 ], [ %21, %18 ]
  %25 = load i64* %24
  store i64 %25, i64* @x, align 8
  %26 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %27 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %26, i32 0, i64 1
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %27, i32 0, i32 0
  %29 = bitcast %struct.__va_list_tag* %28 to i8*
  call void @llvm.va_end(i8* %29)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f11(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %2, i32 0, i64 1
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load i32* %1, align 4
  call void @bar(i32 %6)
  %7 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %8 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %7, i32 0, i64 1
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %8, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_end(i8* %10)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f12(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %2, i32 0, i64 1
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load i32* %1, align 4
  %7 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %8 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %7, i32 0, i64 1
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %8, i32 0, i32 0
  call void @foo(i32 %6, %struct.__va_list_tag* %9)
  %10 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %11 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %10, i32 0, i64 1
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %11, i32 0, i32 0
  %13 = bitcast %struct.__va_list_tag* %12 to i8*
  call void @llvm.va_end(i8* %13)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...)* @f1(i32 1, i64 79)
  %2 = load i64* @x, align 8
  %3 = icmp ne i64 %2, 79
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  call void (i32, ...)* @f2(i32 16386, i32 13, double -1.400000e+01)
  %6 = load i32* @bar_arg, align 4
  %7 = icmp ne i32 %6, 16386
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  call void (i32, ...)* @f3(i32 3, i64 2031)
  %10 = load i64* @x, align 8
  %11 = icmp ne i64 %10, 2031
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  call void (i32, ...)* @f4(i32 4, i32 18)
  %14 = load i32* @bar_arg, align 4
  %15 = icmp ne i32 %14, 4
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  call void (i32, ...)* @f5(i32 5, i32 1, double 1.900000e+01, i64 18)
  %18 = load i32* @foo_arg, align 4
  %19 = icmp ne i32 %18, 38
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  call void (i32, ...)* @f6(i32 6, i64 18)
  %22 = load i64* @x, align 8
  %23 = icmp ne i64 %22, 18
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %21
  call void (i32, ...)* @f7(i32 7)
  %26 = load i32* @bar_arg, align 4
  %27 = icmp ne i32 %26, 7
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %25
  call void (i32, ...)* @f8(i32 8, i64 2031, double 1.300000e+01)
  %30 = load i32* @foo_arg, align 4
  %31 = icmp ne i32 %30, 2044
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  call void (i32, ...)* @f10(i32 9, i64 180)
  %34 = load i64* @x, align 8
  %35 = icmp ne i64 %34, 180
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #3
  unreachable

; <label>:37                                      ; preds = %33
  call void (i32, ...)* @f11(i32 10)
  %38 = load i32* @bar_arg, align 4
  %39 = icmp ne i32 %38, 10
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #3
  unreachable

; <label>:41                                      ; preds = %37
  call void (i32, ...)* @f12(i32 11, i32 2030, x86_fp80 0xK4002C000000000000000)
  %42 = load i32* @foo_arg, align 4
  %43 = icmp ne i32 %42, 2042
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %41
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
