; ModuleID = './920625-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.point = type { double, double }
%struct.ipoint = type { i32, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@pts = global [4 x %struct.point] [%struct.point { double 1.000000e+00, double 2.000000e+00 }, %struct.point { double 3.000000e+00, double 4.000000e+00 }, %struct.point { double 5.000000e+00, double 6.000000e+00 }, %struct.point { double 7.000000e+00, double 8.000000e+00 }], align 16
@ipts = global [4 x %struct.ipoint] [%struct.ipoint { i32 1, i32 2 }, %struct.ipoint { i32 3, i32 4 }, %struct.ipoint { i32 5, i32 6 }, %struct.ipoint { i32 7, i32 8 }], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast ([4 x %struct.point]* @pts to { double, double }*), i32 0, i32 0), align 1
  %3 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast ([4 x %struct.point]* @pts to { double, double }*), i32 0, i32 1), align 1
  %4 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 1) to { double, double }*), i32 0, i32 0), align 1
  %5 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 1) to { double, double }*), i32 0, i32 1), align 1
  %6 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 2) to { double, double }*), i32 0, i32 0), align 1
  %7 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 2) to { double, double }*), i32 0, i32 1), align 1
  %8 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 3) to { double, double }*), i32 0, i32 0), align 1
  %9 = load double, double* getelementptr ({ double, double }, { double, double }* bitcast (%struct.point* getelementptr inbounds ([4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 3) to { double, double }*), i32 0, i32 1), align 1
  %10 = call i32 (i32, ...) @va1(i32 4, double %2, double %3, double %4, double %5, double %6, double %7, double %8, double %9)
  %11 = load i64, i64* bitcast ([4 x %struct.ipoint]* @ipts to i64*), align 4
  %12 = load i64, i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint], [4 x %struct.ipoint]* @ipts, i32 0, i64 1) to i64*), align 4
  %13 = load i64, i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint], [4 x %struct.ipoint]* @ipts, i32 0, i64 2) to i64*), align 4
  %14 = load i64, i64* bitcast (%struct.ipoint* getelementptr inbounds ([4 x %struct.ipoint], [4 x %struct.ipoint]* @ipts, i32 0, i64 3) to i64*), align 4
  %15 = call i32 (i32, ...) @va2(i32 4, i64 %11, i64 %12, i64 %13, i64 %14)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %17 = load i32, i32* %1
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define internal i32 @va1(i32 %nargs, ...) #0 {
  %1 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  %pi = alloca %struct.point, align 8
  %2 = alloca %struct.point, align 8
  store i32 %nargs, i32* %1, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %56, %0
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %59

; <label>:9                                       ; preds = %5
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %10, i32 0, i32 1
  %12 = load i32, i32* %11
  %13 = icmp ule i32 %12, 144
  br i1 %13, label %14, label %28

; <label>:14                                      ; preds = %9
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %10, i32 0, i32 3
  %16 = load i8*, i8** %15
  %17 = getelementptr i8, i8* %16, i32 %12
  %18 = getelementptr i8, i8* %17, i32 16
  %19 = bitcast %struct.point* %2 to { double, double }*
  %20 = bitcast i8* %17 to double*
  %21 = load double, double* %20
  %22 = getelementptr inbounds { double, double }, { double, double }* %19, i32 0, i32 0
  store double %21, double* %22
  %23 = bitcast i8* %18 to double*
  %24 = load double, double* %23
  %25 = getelementptr inbounds { double, double }, { double, double }* %19, i32 0, i32 1
  store double %24, double* %25
  %26 = bitcast { double, double }* %19 to %struct.point*
  %27 = add i32 %12, 32
  store i32 %27, i32* %11
  br label %33

; <label>:28                                      ; preds = %9
  %29 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %10, i32 0, i32 2
  %30 = load i8*, i8** %29
  %31 = bitcast i8* %30 to %struct.point*
  %32 = getelementptr i8, i8* %30, i32 16
  store i8* %32, i8** %29
  br label %33

; <label>:33                                      ; preds = %28, %14
  %34 = phi %struct.point* [ %26, %14 ], [ %31, %28 ]
  %35 = bitcast %struct.point* %pi to i8*
  %36 = bitcast %struct.point* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* %36, i64 16, i32 8, i1 false)
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 %38
  %40 = getelementptr inbounds %struct.point, %struct.point* %39, i32 0, i32 0
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds %struct.point, %struct.point* %pi, i32 0, i32 0
  %43 = load double, double* %42, align 8
  %44 = fcmp une double %41, %43
  br i1 %44, label %54, label %45

; <label>:45                                      ; preds = %33
  %46 = load i32, i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [4 x %struct.point], [4 x %struct.point]* @pts, i32 0, i64 %47
  %49 = getelementptr inbounds %struct.point, %struct.point* %48, i32 0, i32 1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds %struct.point, %struct.point* %pi, i32 0, i32 1
  %52 = load double, double* %51, align 8
  %53 = fcmp une double %50, %52
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %45, %33
  call void @abort() #3
  unreachable

; <label>:55                                      ; preds = %45
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32, i32* %i, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %i, align 4
  br label %5

; <label>:59                                      ; preds = %5
  %60 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %61 = bitcast %struct.__va_list_tag* %60 to i8*
  call void @llvm.va_end(i8* %61)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @va2(i32 %nargs, ...) #0 {
  %1 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  %pi = alloca %struct.ipoint, align 4
  store i32 %nargs, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %47, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %50

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 0
  %11 = load i32, i32* %10
  %12 = icmp ule i32 %11, 40
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8*, i8** %14
  %16 = getelementptr i8, i8* %15, i32 %11
  %17 = bitcast i8* %16 to %struct.ipoint*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %8
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8*, i8** %20
  %22 = bitcast i8* %21 to %struct.ipoint*
  %23 = getelementptr i8, i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi %struct.ipoint* [ %17, %13 ], [ %22, %19 ]
  %26 = bitcast %struct.ipoint* %pi to i8*
  %27 = bitcast %struct.ipoint* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 8, i32 4, i1 false)
  %28 = load i32, i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x %struct.ipoint], [4 x %struct.ipoint]* @ipts, i32 0, i64 %29
  %31 = getelementptr inbounds %struct.ipoint, %struct.ipoint* %30, i32 0, i32 0
  %32 = load i32, i32* %31, align 4
  %33 = getelementptr inbounds %struct.ipoint, %struct.ipoint* %pi, i32 0, i32 0
  %34 = load i32, i32* %33, align 4
  %35 = icmp ne i32 %32, %34
  br i1 %35, label %45, label %36

; <label>:36                                      ; preds = %24
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x %struct.ipoint], [4 x %struct.ipoint]* @ipts, i32 0, i64 %38
  %40 = getelementptr inbounds %struct.ipoint, %struct.ipoint* %39, i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  %42 = getelementptr inbounds %struct.ipoint, %struct.ipoint* %pi, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = icmp ne i32 %41, %43
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %36, %24
  call void @abort() #3
  unreachable

; <label>:46                                      ; preds = %36
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32, i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %4

; <label>:50                                      ; preds = %4
  %51 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %52 = bitcast %struct.__va_list_tag* %51 to i8*
  call void @llvm.va_end(i8* %52)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
