; ModuleID = './20071213-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @h(i32 %x, %struct.__va_list_tag* %ap) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.__va_list_tag*, align 8
  store i32 %x, i32* %1, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %2, align 8
  %3 = load i32, i32* %1, align 4
  switch i32 %3, label %88 [
    i32 1, label %4
    i32 5, label %46
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
  %23 = icmp ne i32 %22, 3
  br i1 %23, label %44, label %24

; <label>:24                                      ; preds = %20
  %25 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32, i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8*, i8** %30
  %32 = getelementptr i8, i8* %31, i32 %27
  %33 = bitcast i8* %32 to i32*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8*, i8** %36
  %38 = bitcast i8* %37 to i32*
  %39 = getelementptr i8, i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i32* [ %33, %29 ], [ %38, %35 ]
  %42 = load i32, i32* %41
  %43 = icmp ne i32 %42, 4
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %40, %20
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %40
  br label %89

; <label>:46                                      ; preds = %0
  %47 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %48 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %47, i32 0, i32 0
  %49 = load i32, i32* %48
  %50 = icmp ule i32 %49, 40
  br i1 %50, label %51, label %57

; <label>:51                                      ; preds = %46
  %52 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %47, i32 0, i32 3
  %53 = load i8*, i8** %52
  %54 = getelementptr i8, i8* %53, i32 %49
  %55 = bitcast i8* %54 to i32*
  %56 = add i32 %49, 8
  store i32 %56, i32* %48
  br label %62

; <label>:57                                      ; preds = %46
  %58 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %47, i32 0, i32 2
  %59 = load i8*, i8** %58
  %60 = bitcast i8* %59 to i32*
  %61 = getelementptr i8, i8* %59, i32 8
  store i8* %61, i8** %58
  br label %62

; <label>:62                                      ; preds = %57, %51
  %63 = phi i32* [ %55, %51 ], [ %60, %57 ]
  %64 = load i32, i32* %63
  %65 = icmp ne i32 %64, 9
  br i1 %65, label %86, label %66

; <label>:66                                      ; preds = %62
  %67 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %68 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 0
  %69 = load i32, i32* %68
  %70 = icmp ule i32 %69, 40
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %66
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 3
  %73 = load i8*, i8** %72
  %74 = getelementptr i8, i8* %73, i32 %69
  %75 = bitcast i8* %74 to i32*
  %76 = add i32 %69, 8
  store i32 %76, i32* %68
  br label %82

; <label>:77                                      ; preds = %66
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 2
  %79 = load i8*, i8** %78
  %80 = bitcast i8* %79 to i32*
  %81 = getelementptr i8, i8* %79, i32 8
  store i8* %81, i8** %78
  br label %82

; <label>:82                                      ; preds = %77, %71
  %83 = phi i32* [ %75, %71 ], [ %80, %77 ]
  %84 = load i32, i32* %83
  %85 = icmp ne i32 %84, 10
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %82, %62
  call void @abort() #3
  unreachable

; <label>:87                                      ; preds = %82
  br label %89

; <label>:88                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:89                                      ; preds = %87, %45
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @f1(i32 %i, i64 %j, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  store i64 %j, i64* %2, align 8
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32, i32* %1, align 4
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @h(i32 %5, %struct.__va_list_tag* %6)
  %7 = load i32, i32* %1, align 4
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %0
  %10 = load i64, i64* %2, align 8
  %11 = icmp ne i64 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9, %0
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %15 = bitcast %struct.__va_list_tag* %14 to i8*
  call void @llvm.va_end(i8* %15)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define void @f2(i32 %i, i32 %j, i32 %k, i64 %l, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %1, align 4
  store i32 %j, i32* %2, align 4
  store i32 %k, i32* %3, align 4
  store i64 %l, i64* %4, align 8
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = bitcast %struct.__va_list_tag* %5 to i8*
  call void @llvm.va_start(i8* %6)
  %7 = load i32, i32* %1, align 4
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @h(i32 %7, %struct.__va_list_tag* %8)
  %9 = load i32, i32* %1, align 4
  %10 = icmp ne i32 %9, 5
  br i1 %10, label %20, label %11

; <label>:11                                      ; preds = %0
  %12 = load i32, i32* %2, align 4
  %13 = icmp ne i32 %12, 6
  br i1 %13, label %20, label %14

; <label>:14                                      ; preds = %11
  %15 = load i32, i32* %3, align 4
  %16 = icmp ne i32 %15, 7
  br i1 %16, label %20, label %17

; <label>:17                                      ; preds = %14
  %18 = load i64, i64* %4, align 8
  %19 = icmp ne i64 %18, 8
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17, %14, %11, %0
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %23 = bitcast %struct.__va_list_tag* %22 to i8*
  call void @llvm.va_end(i8* %23)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, i64, ...) @f1(i32 1, i64 2, i32 3, i32 4)
  call void (i32, i32, i32, i64, ...) @f2(i32 5, i32 6, i32 7, i64 8, i32 9, i32 10)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
