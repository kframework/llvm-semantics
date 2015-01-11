; ModuleID = './va-arg-15.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define void @vafunction(i8* %dummy, ...) #0 {
  %1 = alloca i8*, align 8
  %darg = alloca double, align 8
  %iarg = alloca i32, align 4
  %flag = alloca i32, align 4
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %dummy, i8** %1, align 8
  store i32 0, i32* %flag, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 1, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %61, %0
  %5 = load i32* %i, align 4
  %6 = icmp sle i32 %5, 18
  br i1 %6, label %7, label %66

; <label>:7                                       ; preds = %4
  %8 = load i32* %flag, align 4
  %9 = and i32 %8, 1
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %36

; <label>:11                                      ; preds = %7
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %13 = getelementptr inbounds %struct.__va_list_tag* %12, i32 0, i32 1
  %14 = load i32* %13
  %15 = icmp ule i32 %14, 160
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds %struct.__va_list_tag* %12, i32 0, i32 3
  %18 = load i8** %17
  %19 = getelementptr i8* %18, i32 %14
  %20 = bitcast i8* %19 to double*
  %21 = add i32 %14, 16
  store i32 %21, i32* %13
  br label %27

; <label>:22                                      ; preds = %11
  %23 = getelementptr inbounds %struct.__va_list_tag* %12, i32 0, i32 2
  %24 = load i8** %23
  %25 = bitcast i8* %24 to double*
  %26 = getelementptr i8* %24, i32 8
  store i8* %26, i8** %23
  br label %27

; <label>:27                                      ; preds = %22, %16
  %28 = phi double* [ %20, %16 ], [ %25, %22 ]
  %29 = load double* %28
  store double %29, double* %darg, align 8
  %30 = load double* %darg, align 8
  %31 = load i32* %i, align 4
  %32 = sitofp i32 %31 to double
  %33 = fcmp une double %30, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %27
  call void @abort() #3
  unreachable

; <label>:35                                      ; preds = %27
  br label %60

; <label>:36                                      ; preds = %7
  %37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %38 = getelementptr inbounds %struct.__va_list_tag* %37, i32 0, i32 0
  %39 = load i32* %38
  %40 = icmp ule i32 %39, 40
  br i1 %40, label %41, label %47

; <label>:41                                      ; preds = %36
  %42 = getelementptr inbounds %struct.__va_list_tag* %37, i32 0, i32 3
  %43 = load i8** %42
  %44 = getelementptr i8* %43, i32 %39
  %45 = bitcast i8* %44 to i32*
  %46 = add i32 %39, 8
  store i32 %46, i32* %38
  br label %52

; <label>:47                                      ; preds = %36
  %48 = getelementptr inbounds %struct.__va_list_tag* %37, i32 0, i32 2
  %49 = load i8** %48
  %50 = bitcast i8* %49 to i32*
  %51 = getelementptr i8* %49, i32 8
  store i8* %51, i8** %48
  br label %52

; <label>:52                                      ; preds = %47, %41
  %53 = phi i32* [ %45, %41 ], [ %50, %47 ]
  %54 = load i32* %53
  store i32 %54, i32* %iarg, align 4
  %55 = load i32* %iarg, align 4
  %56 = load i32* %i, align 4
  %57 = icmp ne i32 %55, %56
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %52
  call void @abort() #3
  unreachable

; <label>:59                                      ; preds = %52
  br label %60

; <label>:60                                      ; preds = %59, %35
  br label %61

; <label>:61                                      ; preds = %60
  %62 = load i32* %i, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %i, align 4
  %64 = load i32* %flag, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %flag, align 4
  br label %4

; <label>:66                                      ; preds = %4
  %67 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %68 = bitcast %struct.__va_list_tag* %67 to i8*
  call void @llvm.va_end(i8* %68)
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
  call void (i8*, ...)* @vafunction(i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 1, double 2.000000e+00, i32 3, double 4.000000e+00, i32 5, double 6.000000e+00, i32 7, double 8.000000e+00, i32 9, double 1.000000e+01, i32 11, double 1.200000e+01, i32 13, double 1.400000e+01, i32 15, double 1.600000e+01, i32 17, double 1.800000e+01)
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
