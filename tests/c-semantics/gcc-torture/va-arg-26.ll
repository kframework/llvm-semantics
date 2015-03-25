; ModuleID = './va-arg-26.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define double @f(float %f1, float %f2, float %f3, float %f4, float %f5, float %f6, ...) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %d = alloca double, align 8
  store float %f1, float* %1, align 4
  store float %f2, float* %2, align 4
  store float %f3, float* %3, align 4
  store float %f4, float* %4, align 4
  store float %f5, float* %5, align 4
  store float %f6, float* %6, align 4
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_start(i8* %8)
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 1
  %11 = load i32* %10
  %12 = icmp ule i32 %11, 160
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8** %14
  %16 = getelementptr i8* %15, i32 %11
  %17 = bitcast i8* %16 to double*
  %18 = add i32 %11, 16
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8** %20
  %22 = bitcast i8* %21 to double*
  %23 = getelementptr i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi double* [ %17, %13 ], [ %22, %19 ]
  %26 = load double* %25
  store double %26, double* %d, align 8
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %28 = bitcast %struct.__va_list_tag* %27 to i8*
  call void @llvm.va_end(i8* %28)
  %29 = load double* %d, align 8
  ret double %29
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call double (float, float, float, float, float, float, ...)* @f(float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, double 7.000000e+00)
  %3 = fcmp une double %2, 7.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
