; ModuleID = './strct-stdarg-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8, i8, i8, i8 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.tiny, align 1
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x1 = alloca i64, align 8
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %68, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %71

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 0
  %11 = load i32, i32* %10
  %12 = icmp ule i32 %11, 40
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8*, i8** %14
  %16 = getelementptr i8, i8* %15, i32 %11
  %17 = bitcast i8* %16 to %struct.tiny*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %8
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8*, i8** %20
  %22 = bitcast i8* %21 to %struct.tiny*
  %23 = getelementptr i8, i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi %struct.tiny* [ %17, %13 ], [ %22, %19 ]
  %26 = bitcast %struct.tiny* %x to i8*
  %27 = bitcast %struct.tiny* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 5, i32 1, i1 false)
  %28 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = load i32, i32* %i, align 4
  %32 = add nsw i32 %31, 10
  %33 = icmp ne i32 %30, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %24
  call void @abort() #3
  unreachable

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 1
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = load i32, i32* %i, align 4
  %40 = add nsw i32 %39, 20
  %41 = icmp ne i32 %38, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %35
  call void @abort() #3
  unreachable

; <label>:43                                      ; preds = %35
  %44 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 2
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = load i32, i32* %i, align 4
  %48 = add nsw i32 %47, 30
  %49 = icmp ne i32 %46, %48
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %43
  call void @abort() #3
  unreachable

; <label>:51                                      ; preds = %43
  %52 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 3
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = load i32, i32* %i, align 4
  %56 = add nsw i32 %55, 40
  %57 = icmp ne i32 %54, %56
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %51
  call void @abort() #3
  unreachable

; <label>:59                                      ; preds = %51
  %60 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 4
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = load i32, i32* %i, align 4
  %64 = add nsw i32 %63, 50
  %65 = icmp ne i32 %62, %64
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %59
  call void @abort() #3
  unreachable

; <label>:67                                      ; preds = %59
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32, i32* %i, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %i, align 4
  br label %4

; <label>:71                                      ; preds = %4
  %72 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %73 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 0
  %74 = load i32, i32* %73
  %75 = icmp ule i32 %74, 40
  br i1 %75, label %76, label %82

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 3
  %78 = load i8*, i8** %77
  %79 = getelementptr i8, i8* %78, i32 %74
  %80 = bitcast i8* %79 to i64*
  %81 = add i32 %74, 8
  store i32 %81, i32* %73
  br label %87

; <label>:82                                      ; preds = %71
  %83 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %72, i32 0, i32 2
  %84 = load i8*, i8** %83
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr i8, i8* %84, i32 8
  store i8* %86, i8** %83
  br label %87

; <label>:87                                      ; preds = %82, %76
  %88 = phi i64* [ %80, %76 ], [ %85, %82 ]
  %89 = load i64, i64* %88
  store i64 %89, i64* %x1, align 8
  %90 = load i64, i64* %x1, align 8
  %91 = icmp ne i64 %90, 123
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %87
  call void @abort() #3
  unreachable

; <label>:93                                      ; preds = %87
  %94 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %95 = bitcast %struct.__va_list_tag* %94 to i8*
  call void @llvm.va_end(i8* %95)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %2 = alloca i40, align 1
  %3 = alloca i40, align 1
  %4 = alloca i40, align 1
  store i32 0, i32* %1
  %5 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %6 = getelementptr inbounds %struct.tiny, %struct.tiny* %5, i32 0, i32 0
  store i8 10, i8* %6, align 1
  %7 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %8 = getelementptr inbounds %struct.tiny, %struct.tiny* %7, i32 0, i32 0
  store i8 11, i8* %8, align 1
  %9 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %10 = getelementptr inbounds %struct.tiny, %struct.tiny* %9, i32 0, i32 0
  store i8 12, i8* %10, align 1
  %11 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %12 = getelementptr inbounds %struct.tiny, %struct.tiny* %11, i32 0, i32 1
  store i8 20, i8* %12, align 1
  %13 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %14 = getelementptr inbounds %struct.tiny, %struct.tiny* %13, i32 0, i32 1
  store i8 21, i8* %14, align 1
  %15 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %16 = getelementptr inbounds %struct.tiny, %struct.tiny* %15, i32 0, i32 1
  store i8 22, i8* %16, align 1
  %17 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %18 = getelementptr inbounds %struct.tiny, %struct.tiny* %17, i32 0, i32 2
  store i8 30, i8* %18, align 1
  %19 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %20 = getelementptr inbounds %struct.tiny, %struct.tiny* %19, i32 0, i32 2
  store i8 31, i8* %20, align 1
  %21 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %22 = getelementptr inbounds %struct.tiny, %struct.tiny* %21, i32 0, i32 2
  store i8 32, i8* %22, align 1
  %23 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %24 = getelementptr inbounds %struct.tiny, %struct.tiny* %23, i32 0, i32 3
  store i8 40, i8* %24, align 1
  %25 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %26 = getelementptr inbounds %struct.tiny, %struct.tiny* %25, i32 0, i32 3
  store i8 41, i8* %26, align 1
  %27 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %28 = getelementptr inbounds %struct.tiny, %struct.tiny* %27, i32 0, i32 3
  store i8 42, i8* %28, align 1
  %29 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %30 = getelementptr inbounds %struct.tiny, %struct.tiny* %29, i32 0, i32 4
  store i8 50, i8* %30, align 1
  %31 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %32 = getelementptr inbounds %struct.tiny, %struct.tiny* %31, i32 0, i32 4
  store i8 51, i8* %32, align 1
  %33 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %34 = getelementptr inbounds %struct.tiny, %struct.tiny* %33, i32 0, i32 4
  store i8 52, i8* %34, align 1
  %35 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %36 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %37 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %38 = bitcast i40* %2 to i8*
  %39 = bitcast %struct.tiny* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %39, i64 5, i32 1, i1 false)
  %40 = load i40, i40* %2, align 1
  %41 = bitcast i40* %3 to i8*
  %42 = bitcast %struct.tiny* %36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 5, i32 1, i1 false)
  %43 = load i40, i40* %3, align 1
  %44 = bitcast i40* %4 to i8*
  %45 = bitcast %struct.tiny* %37 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %44, i8* %45, i64 5, i32 1, i1 false)
  %46 = load i40, i40* %4, align 1
  call void (i32, ...) @f(i32 3, i40 %40, i40 %43, i40 %46, i64 123)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %48 = load i32, i32* %1
  ret i32 %48
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
