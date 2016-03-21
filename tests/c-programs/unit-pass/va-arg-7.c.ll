; ModuleID = './va-arg-7.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, i32, i32, i32, i32, i32, i32, double, double, double, double, double, double, double, double, double, ...) @debug(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, i32 8, i32 9, i32 10)
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @debug(i32 %i1, i32 %i2, i32 %i3, i32 %i4, i32 %i5, i32 %i6, i32 %i7, double %f1, double %f2, double %f3, double %f4, double %f5, double %f6, double %f7, double %f8, double %f9, ...) #1 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i1, i32* %1, align 4
  store i32 %i2, i32* %2, align 4
  store i32 %i3, i32* %3, align 4
  store i32 %i4, i32* %4, align 4
  store i32 %i5, i32* %5, align 4
  store i32 %i6, i32* %6, align 4
  store i32 %i7, i32* %7, align 4
  store double %f1, double* %8, align 8
  store double %f2, double* %9, align 8
  store double %f3, double* %10, align 8
  store double %f4, double* %11, align 8
  store double %f5, double* %12, align 8
  store double %f6, double* %13, align 8
  store double %f7, double* %14, align 8
  store double %f8, double* %15, align 8
  store double %f9, double* %16, align 8
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = bitcast %struct.__va_list_tag* %17 to i8*
  call void @llvm.va_start(i8* %18)
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 0
  %21 = load i32, i32* %20
  %22 = icmp ule i32 %21, 40
  br i1 %22, label %23, label %29

; <label>:23                                      ; preds = %0
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 3
  %25 = load i8*, i8** %24
  %26 = getelementptr i8, i8* %25, i32 %21
  %27 = bitcast i8* %26 to i32*
  %28 = add i32 %21, 8
  store i32 %28, i32* %20
  br label %34

; <label>:29                                      ; preds = %0
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 2
  %31 = load i8*, i8** %30
  %32 = bitcast i8* %31 to i32*
  %33 = getelementptr i8, i8* %31, i32 8
  store i8* %33, i8** %30
  br label %34

; <label>:34                                      ; preds = %29, %23
  %35 = phi i32* [ %27, %23 ], [ %32, %29 ]
  %36 = load i32, i32* %35
  %37 = icmp ne i32 %36, 8
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %34
  call void @abort() #4
  unreachable

; <label>:39                                      ; preds = %34
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %41 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 0
  %42 = load i32, i32* %41
  %43 = icmp ule i32 %42, 40
  br i1 %43, label %44, label %50

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 3
  %46 = load i8*, i8** %45
  %47 = getelementptr i8, i8* %46, i32 %42
  %48 = bitcast i8* %47 to i32*
  %49 = add i32 %42, 8
  store i32 %49, i32* %41
  br label %55

; <label>:50                                      ; preds = %39
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 2
  %52 = load i8*, i8** %51
  %53 = bitcast i8* %52 to i32*
  %54 = getelementptr i8, i8* %52, i32 8
  store i8* %54, i8** %51
  br label %55

; <label>:55                                      ; preds = %50, %44
  %56 = phi i32* [ %48, %44 ], [ %53, %50 ]
  %57 = load i32, i32* %56
  %58 = icmp ne i32 %57, 9
  br i1 %58, label %59, label %60

; <label>:59                                      ; preds = %55
  call void @abort() #4
  unreachable

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %62 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %61, i32 0, i32 0
  %63 = load i32, i32* %62
  %64 = icmp ule i32 %63, 40
  br i1 %64, label %65, label %71

; <label>:65                                      ; preds = %60
  %66 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %61, i32 0, i32 3
  %67 = load i8*, i8** %66
  %68 = getelementptr i8, i8* %67, i32 %63
  %69 = bitcast i8* %68 to i32*
  %70 = add i32 %63, 8
  store i32 %70, i32* %62
  br label %76

; <label>:71                                      ; preds = %60
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %61, i32 0, i32 2
  %73 = load i8*, i8** %72
  %74 = bitcast i8* %73 to i32*
  %75 = getelementptr i8, i8* %73, i32 8
  store i8* %75, i8** %72
  br label %76

; <label>:76                                      ; preds = %71, %65
  %77 = phi i32* [ %69, %65 ], [ %74, %71 ]
  %78 = load i32, i32* %77
  %79 = icmp ne i32 %78, 10
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %76
  call void @abort() #4
  unreachable

; <label>:81                                      ; preds = %76
  %82 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %83 = bitcast %struct.__va_list_tag* %82 to i8*
  call void @llvm.va_end(i8* %83)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
