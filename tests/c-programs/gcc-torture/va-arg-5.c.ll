; ModuleID = './va-arg-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @va_double(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
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
  %22 = fcmp une double %21, 3.141592e+00
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %19
  call void @abort() #3
  unreachable

; <label>:24                                      ; preds = %19
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 1
  %27 = load i32, i32* %26
  %28 = icmp ule i32 %27, 160
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8*, i8** %30
  %32 = getelementptr i8, i8* %31, i32 %27
  %33 = bitcast i8* %32 to double*
  %34 = add i32 %27, 16
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8*, i8** %36
  %38 = bitcast i8* %37 to double*
  %39 = getelementptr i8, i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi double* [ %33, %29 ], [ %38, %35 ]
  %42 = load double, double* %41
  %43 = fcmp une double %42, 2.718270e+00
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %40
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %40
  %46 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 1
  %48 = load i32, i32* %47
  %49 = icmp ule i32 %48, 160
  br i1 %49, label %50, label %56

; <label>:50                                      ; preds = %45
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 3
  %52 = load i8*, i8** %51
  %53 = getelementptr i8, i8* %52, i32 %48
  %54 = bitcast i8* %53 to double*
  %55 = add i32 %48, 16
  store i32 %55, i32* %47
  br label %61

; <label>:56                                      ; preds = %45
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 2
  %58 = load i8*, i8** %57
  %59 = bitcast i8* %58 to double*
  %60 = getelementptr i8, i8* %58, i32 8
  store i8* %60, i8** %57
  br label %61

; <label>:61                                      ; preds = %56, %50
  %62 = phi double* [ %54, %50 ], [ %59, %56 ]
  %63 = load double, double* %62
  %64 = fcmp une double %63, 0x4001E3779131154C
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %61
  call void @abort() #3
  unreachable

; <label>:66                                      ; preds = %61
  %67 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %68 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 1
  %69 = load i32, i32* %68
  %70 = icmp ule i32 %69, 160
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %66
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 3
  %73 = load i8*, i8** %72
  %74 = getelementptr i8, i8* %73, i32 %69
  %75 = bitcast i8* %74 to double*
  %76 = add i32 %69, 16
  store i32 %76, i32* %68
  br label %82

; <label>:77                                      ; preds = %66
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 2
  %79 = load i8*, i8** %78
  %80 = bitcast i8* %79 to double*
  %81 = getelementptr i8, i8* %79, i32 8
  store i8* %81, i8** %78
  br label %82

; <label>:82                                      ; preds = %77, %71
  %83 = phi double* [ %75, %71 ], [ %80, %77 ]
  %84 = load double, double* %83
  %85 = fcmp une double %84, 0x40012E0BE1B5921E
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %82
  call void @abort() #3
  unreachable

; <label>:87                                      ; preds = %82
  %88 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %89 = bitcast %struct.__va_list_tag* %88 to i8*
  call void @llvm.va_end(i8* %89)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define void @va_long_double(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %6 = load i8*, i8** %5
  %7 = getelementptr i8, i8* %6, i64 15
  %8 = ptrtoint i8* %7 to i64
  %9 = and i64 %8, -16
  %10 = inttoptr i64 %9 to i8*
  %11 = bitcast i8* %10 to x86_fp80*
  %12 = getelementptr i8, i8* %10, i32 16
  store i8* %12, i8** %5
  %13 = load x86_fp80, x86_fp80* %11
  %14 = fcmp une x86_fp80 %13, 0xK4000C90FD7E45803CD14
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 2
  %19 = load i8*, i8** %18
  %20 = getelementptr i8, i8* %19, i64 15
  %21 = ptrtoint i8* %20 to i64
  %22 = and i64 %21, -16
  %23 = inttoptr i64 %22 to i8*
  %24 = bitcast i8* %23 to x86_fp80*
  %25 = getelementptr i8, i8* %23, i32 16
  store i8* %25, i8** %18
  %26 = load x86_fp80, x86_fp80* %24
  %27 = fcmp une x86_fp80 %26, 0xK4000ADF822BBECAAB8A6
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %16
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %16
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %31 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %30, i32 0, i32 2
  %32 = load i8*, i8** %31
  %33 = getelementptr i8, i8* %32, i64 15
  %34 = ptrtoint i8* %33 to i64
  %35 = and i64 %34, -16
  %36 = inttoptr i64 %35 to i8*
  %37 = bitcast i8* %36 to x86_fp80*
  %38 = getelementptr i8, i8* %36, i32 16
  store i8* %38, i8** %31
  %39 = load x86_fp80, x86_fp80* %37
  %40 = fcmp une x86_fp80 %39, 0xK40008F1BBC8988AA5E0D
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:42                                      ; preds = %29
  %43 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %44 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 2
  %45 = load i8*, i8** %44
  %46 = getelementptr i8, i8* %45, i64 15
  %47 = ptrtoint i8* %46 to i64
  %48 = and i64 %47, -16
  %49 = inttoptr i64 %48 to i8*
  %50 = bitcast i8* %49 to x86_fp80*
  %51 = getelementptr i8, i8* %49, i32 16
  store i8* %51, i8** %44
  %52 = load x86_fp80, x86_fp80* %50
  %53 = fcmp une x86_fp80 %52, 0xK400089705F0DAC90ED23
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %42
  call void @abort() #3
  unreachable

; <label>:55                                      ; preds = %42
  %56 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %57 = bitcast %struct.__va_list_tag* %56 to i8*
  call void @llvm.va_end(i8* %57)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...) @va_double(i32 4, double 3.141592e+00, double 2.718270e+00, double 0x4001E3779131154C, double 0x40012E0BE1B5921E)
  call void (i32, ...) @va_long_double(i32 4, x86_fp80 0xK4000C90FD7E45803CD14, x86_fp80 0xK4000ADF822BBECAAB8A6, x86_fp80 0xK40008F1BBC8988AA5E0D, x86_fp80 0xK400089705F0DAC90ED23)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
