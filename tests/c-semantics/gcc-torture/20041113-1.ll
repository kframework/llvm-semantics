; ModuleID = './20041113-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@a = global double 4.000000e+01, align 8

; Function Attrs: nounwind uwtable
define void @test(i32 %x, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag* %4, i32 0, i32 0
  %6 = load i32* %5
  %7 = icmp ule i32 %6, 40
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8** %9
  %11 = getelementptr i8* %10, i32 %6
  %12 = bitcast i8* %11 to i32*
  %13 = add i32 %6, 8
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8** %15
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi i32* [ %12, %8 ], [ %17, %14 ]
  %21 = load i32* %20
  %22 = icmp ne i32 %21, 1
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %19
  call void @abort() #3
  unreachable

; <label>:24                                      ; preds = %19
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8** %30
  %32 = getelementptr i8* %31, i32 %27
  %33 = bitcast i8* %32 to i32*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8** %36
  %38 = bitcast i8* %37 to i32*
  %39 = getelementptr i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i32* [ %33, %29 ], [ %38, %35 ]
  %42 = load i32* %41
  %43 = icmp ne i32 %42, 2
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %40
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %40
  %46 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %47 = getelementptr inbounds %struct.__va_list_tag* %46, i32 0, i32 0
  %48 = load i32* %47
  %49 = icmp ule i32 %48, 40
  br i1 %49, label %50, label %56

; <label>:50                                      ; preds = %45
  %51 = getelementptr inbounds %struct.__va_list_tag* %46, i32 0, i32 3
  %52 = load i8** %51
  %53 = getelementptr i8* %52, i32 %48
  %54 = bitcast i8* %53 to i32*
  %55 = add i32 %48, 8
  store i32 %55, i32* %47
  br label %61

; <label>:56                                      ; preds = %45
  %57 = getelementptr inbounds %struct.__va_list_tag* %46, i32 0, i32 2
  %58 = load i8** %57
  %59 = bitcast i8* %58 to i32*
  %60 = getelementptr i8* %58, i32 8
  store i8* %60, i8** %57
  br label %61

; <label>:61                                      ; preds = %56, %50
  %62 = phi i32* [ %54, %50 ], [ %59, %56 ]
  %63 = load i32* %62
  %64 = icmp ne i32 %63, 3
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %61
  call void @abort() #3
  unreachable

; <label>:66                                      ; preds = %61
  %67 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %68 = getelementptr inbounds %struct.__va_list_tag* %67, i32 0, i32 0
  %69 = load i32* %68
  %70 = icmp ule i32 %69, 40
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %66
  %72 = getelementptr inbounds %struct.__va_list_tag* %67, i32 0, i32 3
  %73 = load i8** %72
  %74 = getelementptr i8* %73, i32 %69
  %75 = bitcast i8* %74 to i32*
  %76 = add i32 %69, 8
  store i32 %76, i32* %68
  br label %82

; <label>:77                                      ; preds = %66
  %78 = getelementptr inbounds %struct.__va_list_tag* %67, i32 0, i32 2
  %79 = load i8** %78
  %80 = bitcast i8* %79 to i32*
  %81 = getelementptr i8* %79, i32 8
  store i8* %81, i8** %78
  br label %82

; <label>:82                                      ; preds = %77, %71
  %83 = phi i32* [ %75, %71 ], [ %80, %77 ]
  %84 = load i32* %83
  %85 = icmp ne i32 %84, 4
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %82
  call void @abort() #3
  unreachable

; <label>:87                                      ; preds = %82
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load double* @a, align 8
  %5 = fdiv double %4, 1.000000e+01
  %6 = fptosi double %5 to i32
  call void (i32, ...)* @test(i32 0, i32 1, i32 2, i32 3, i32 %6)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
