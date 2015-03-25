; ModuleID = './va-arg-18.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(double %p0, double %p1, double %p2, double %p3, double %p4, double %p5, double %p6, double %p7, double %p8, ...) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %select = alloca [1 x %struct.__va_list_tag], align 16
  store double %p0, double* %1, align 8
  store double %p1, double* %2, align 8
  store double %p2, double* %3, align 8
  store double %p3, double* %4, align 8
  store double %p4, double* %5, align 8
  store double %p5, double* %6, align 8
  store double %p6, double* %7, align 8
  store double %p7, double* %8, align 8
  store double %p8, double* %9, align 8
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %13 = getelementptr inbounds %struct.__va_list_tag* %12, i32 0, i32 0
  %14 = load i32* %13
  %15 = icmp ule i32 %14, 40
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag* %12, i32 0, i32 3
  %18 = load i8** %17
  %19 = getelementptr i8* %18, i32 %14
  %20 = bitcast i8* %19 to i32*
  %21 = add i32 %14, 8
  store i32 %21, i32* %13
  br label %27

; <label>:22                                      ; preds = %0
  %23 = getelementptr inbounds %struct.__va_list_tag* %12, i32 0, i32 2
  %24 = load i8** %23
  %25 = bitcast i8* %24 to i32*
  %26 = getelementptr i8* %24, i32 8
  store i8* %26, i8** %23
  br label %27

; <label>:27                                      ; preds = %22, %16
  %28 = phi i32* [ %20, %16 ], [ %25, %22 ]
  %29 = load i32* %28
  %30 = icmp ne i32 %29, 10
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %27
  call void @abort() #3
  unreachable

; <label>:32                                      ; preds = %27
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %34 = getelementptr inbounds %struct.__va_list_tag* %33, i32 0, i32 0
  %35 = load i32* %34
  %36 = icmp ule i32 %35, 40
  br i1 %36, label %37, label %43

; <label>:37                                      ; preds = %32
  %38 = getelementptr inbounds %struct.__va_list_tag* %33, i32 0, i32 3
  %39 = load i8** %38
  %40 = getelementptr i8* %39, i32 %35
  %41 = bitcast i8* %40 to i32*
  %42 = add i32 %35, 8
  store i32 %42, i32* %34
  br label %48

; <label>:43                                      ; preds = %32
  %44 = getelementptr inbounds %struct.__va_list_tag* %33, i32 0, i32 2
  %45 = load i8** %44
  %46 = bitcast i8* %45 to i32*
  %47 = getelementptr i8* %45, i32 8
  store i8* %47, i8** %44
  br label %48

; <label>:48                                      ; preds = %43, %37
  %49 = phi i32* [ %41, %37 ], [ %46, %43 ]
  %50 = load i32* %49
  %51 = icmp ne i32 %50, 11
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %48
  call void @abort() #3
  unreachable

; <label>:53                                      ; preds = %48
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %55 = getelementptr inbounds %struct.__va_list_tag* %54, i32 0, i32 0
  %56 = load i32* %55
  %57 = icmp ule i32 %56, 40
  br i1 %57, label %58, label %64

; <label>:58                                      ; preds = %53
  %59 = getelementptr inbounds %struct.__va_list_tag* %54, i32 0, i32 3
  %60 = load i8** %59
  %61 = getelementptr i8* %60, i32 %56
  %62 = bitcast i8* %61 to i32*
  %63 = add i32 %56, 8
  store i32 %63, i32* %55
  br label %69

; <label>:64                                      ; preds = %53
  %65 = getelementptr inbounds %struct.__va_list_tag* %54, i32 0, i32 2
  %66 = load i8** %65
  %67 = bitcast i8* %66 to i32*
  %68 = getelementptr i8* %66, i32 8
  store i8* %68, i8** %65
  br label %69

; <label>:69                                      ; preds = %64, %58
  %70 = phi i32* [ %62, %58 ], [ %67, %64 ]
  %71 = load i32* %70
  %72 = icmp ne i32 %71, 12
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %69
  call void @abort() #3
  unreachable

; <label>:74                                      ; preds = %69
  %75 = getelementptr inbounds [1 x %struct.__va_list_tag]* %select, i32 0, i32 0
  %76 = bitcast %struct.__va_list_tag* %75 to i8*
  call void @llvm.va_end(i8* %76)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (double, double, double, double, double, double, double, double, double, ...)* @f(double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, i32 10, i32 11, i32 12)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
