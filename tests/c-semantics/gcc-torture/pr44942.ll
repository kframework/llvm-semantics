; ModuleID = './pr44942.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @test1(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, x86_fp80 %h, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %f, i32* %6, align 4
  store i32 %g, i32* %7, align 4
  store x86_fp80 %h, x86_fp80* %8, align 16
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_start(i8* %10)
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %12 = getelementptr inbounds %struct.__va_list_tag* %11, i32 0, i32 0
  %13 = load i32* %12
  %14 = icmp ule i32 %13, 40
  br i1 %14, label %15, label %21

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.__va_list_tag* %11, i32 0, i32 3
  %17 = load i8** %16
  %18 = getelementptr i8* %17, i32 %13
  %19 = bitcast i8* %18 to i32*
  %20 = add i32 %13, 8
  store i32 %20, i32* %12
  br label %26

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.__va_list_tag* %11, i32 0, i32 2
  %23 = load i8** %22
  %24 = bitcast i8* %23 to i32*
  %25 = getelementptr i8* %23, i32 8
  store i8* %25, i8** %22
  br label %26

; <label>:26                                      ; preds = %21, %15
  %27 = phi i32* [ %19, %15 ], [ %24, %21 ]
  %28 = load i32* %27
  store i32 %28, i32* %i, align 4
  %29 = load i32* %i, align 4
  %30 = icmp ne i32 %29, 1234
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %26
  call void @abort() #3
  unreachable

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %34 = bitcast %struct.__va_list_tag* %33 to i8*
  call void @llvm.va_end(i8* %34)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define void @test2(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, x86_fp80 %h, i32 %i, x86_fp80 %j, i32 %k, x86_fp80 %l, i32 %m, x86_fp80 %n, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca x86_fp80, align 16
  %9 = alloca i32, align 4
  %10 = alloca x86_fp80, align 16
  %11 = alloca i32, align 4
  %12 = alloca x86_fp80, align 16
  %13 = alloca i32, align 4
  %14 = alloca x86_fp80, align 16
  %o = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %f, i32* %6, align 4
  store i32 %g, i32* %7, align 4
  store x86_fp80 %h, x86_fp80* %8, align 16
  store i32 %i, i32* %9, align 4
  store x86_fp80 %j, x86_fp80* %10, align 16
  store i32 %k, i32* %11, align 4
  store x86_fp80 %l, x86_fp80* %12, align 16
  store i32 %m, i32* %13, align 4
  store x86_fp80 %n, x86_fp80* %14, align 16
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %16 = bitcast %struct.__va_list_tag* %15 to i8*
  call void @llvm.va_start(i8* %16)
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 0
  %19 = load i32* %18
  %20 = icmp ule i32 %19, 40
  br i1 %20, label %21, label %27

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 3
  %23 = load i8** %22
  %24 = getelementptr i8* %23, i32 %19
  %25 = bitcast i8* %24 to i32*
  %26 = add i32 %19, 8
  store i32 %26, i32* %18
  br label %32

; <label>:27                                      ; preds = %0
  %28 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 2
  %29 = load i8** %28
  %30 = bitcast i8* %29 to i32*
  %31 = getelementptr i8* %29, i32 8
  store i8* %31, i8** %28
  br label %32

; <label>:32                                      ; preds = %27, %21
  %33 = phi i32* [ %25, %21 ], [ %30, %27 ]
  %34 = load i32* %33
  store i32 %34, i32* %o, align 4
  %35 = load i32* %o, align 4
  %36 = icmp ne i32 %35, 1234
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %32
  call void @abort() #3
  unreachable

; <label>:38                                      ; preds = %32
  %39 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %40 = bitcast %struct.__va_list_tag* %39 to i8*
  call void @llvm.va_end(i8* %40)
  ret void
}

; Function Attrs: nounwind uwtable
define void @test3(double %a, double %b, double %c, double %d, double %e, double %f, double %g, x86_fp80 %h, ...) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca x86_fp80, align 16
  %i = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  store double %c, double* %3, align 8
  store double %d, double* %4, align 8
  store double %e, double* %5, align 8
  store double %f, double* %6, align 8
  store double %g, double* %7, align 8
  store x86_fp80 %h, x86_fp80* %8, align 16
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_start(i8* %10)
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %12 = getelementptr inbounds %struct.__va_list_tag* %11, i32 0, i32 1
  %13 = load i32* %12
  %14 = icmp ule i32 %13, 160
  br i1 %14, label %15, label %21

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.__va_list_tag* %11, i32 0, i32 3
  %17 = load i8** %16
  %18 = getelementptr i8* %17, i32 %13
  %19 = bitcast i8* %18 to double*
  %20 = add i32 %13, 16
  store i32 %20, i32* %12
  br label %26

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.__va_list_tag* %11, i32 0, i32 2
  %23 = load i8** %22
  %24 = bitcast i8* %23 to double*
  %25 = getelementptr i8* %23, i32 8
  store i8* %25, i8** %22
  br label %26

; <label>:26                                      ; preds = %21, %15
  %27 = phi double* [ %19, %15 ], [ %24, %21 ]
  %28 = load double* %27
  store double %28, double* %i, align 8
  %29 = load double* %i, align 8
  %30 = fcmp une double %29, 1.234000e+03
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %26
  call void @abort() #3
  unreachable

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %34 = bitcast %struct.__va_list_tag* %33 to i8*
  call void @llvm.va_end(i8* %34)
  ret void
}

; Function Attrs: nounwind uwtable
define void @test4(double %a, double %b, double %c, double %d, double %e, double %f, double %g, x86_fp80 %h, double %i, x86_fp80 %j, double %k, x86_fp80 %l, double %m, x86_fp80 %n, ...) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca x86_fp80, align 16
  %9 = alloca double, align 8
  %10 = alloca x86_fp80, align 16
  %11 = alloca double, align 8
  %12 = alloca x86_fp80, align 16
  %13 = alloca double, align 8
  %14 = alloca x86_fp80, align 16
  %o = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  store double %c, double* %3, align 8
  store double %d, double* %4, align 8
  store double %e, double* %5, align 8
  store double %f, double* %6, align 8
  store double %g, double* %7, align 8
  store x86_fp80 %h, x86_fp80* %8, align 16
  store double %i, double* %9, align 8
  store x86_fp80 %j, x86_fp80* %10, align 16
  store double %k, double* %11, align 8
  store x86_fp80 %l, x86_fp80* %12, align 16
  store double %m, double* %13, align 8
  store x86_fp80 %n, x86_fp80* %14, align 16
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %16 = bitcast %struct.__va_list_tag* %15 to i8*
  call void @llvm.va_start(i8* %16)
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 1
  %19 = load i32* %18
  %20 = icmp ule i32 %19, 160
  br i1 %20, label %21, label %27

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 3
  %23 = load i8** %22
  %24 = getelementptr i8* %23, i32 %19
  %25 = bitcast i8* %24 to double*
  %26 = add i32 %19, 16
  store i32 %26, i32* %18
  br label %32

; <label>:27                                      ; preds = %0
  %28 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 2
  %29 = load i8** %28
  %30 = bitcast i8* %29 to double*
  %31 = getelementptr i8* %29, i32 8
  store i8* %31, i8** %28
  br label %32

; <label>:32                                      ; preds = %27, %21
  %33 = phi double* [ %25, %21 ], [ %30, %27 ]
  %34 = load double* %33
  store double %34, double* %o, align 8
  %35 = load double* %o, align 8
  %36 = fcmp une double %35, 1.234000e+03
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %32
  call void @abort() #3
  unreachable

; <label>:38                                      ; preds = %32
  %39 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %40 = bitcast %struct.__va_list_tag* %39 to i8*
  call void @llvm.va_end(i8* %40)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, i32, i32, i32, i32, i32, i32, x86_fp80, ...)* @test1(i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, x86_fp80 0xK00000000000000000000, i32 1234)
  call void (i32, i32, i32, i32, i32, i32, i32, x86_fp80, i32, x86_fp80, i32, x86_fp80, i32, x86_fp80, ...)* @test2(i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, x86_fp80 0xK00000000000000000000, i32 0, x86_fp80 0xK00000000000000000000, i32 0, x86_fp80 0xK00000000000000000000, i32 0, x86_fp80 0xK00000000000000000000, i32 1234)
  call void (double, double, double, double, double, double, double, x86_fp80, ...)* @test3(double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 1.234000e+03)
  call void (double, double, double, double, double, double, double, x86_fp80, double, x86_fp80, double, x86_fp80, double, x86_fp80, ...)* @test4(double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 1.234000e+03)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
