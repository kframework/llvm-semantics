; ModuleID = './931004-12.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8, i8 }
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

; <label>:4                                       ; preds = %52, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %55

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 3, i32 1, i1 false)
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
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32, i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %4

; <label>:55                                      ; preds = %4
  %56 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 0
  %58 = load i32, i32* %57
  %59 = icmp ule i32 %58, 40
  br i1 %59, label %60, label %66

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 3
  %62 = load i8*, i8** %61
  %63 = getelementptr i8, i8* %62, i32 %58
  %64 = bitcast i8* %63 to i64*
  %65 = add i32 %58, 8
  store i32 %65, i32* %57
  br label %71

; <label>:66                                      ; preds = %55
  %67 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 2
  %68 = load i8*, i8** %67
  %69 = bitcast i8* %68 to i64*
  %70 = getelementptr i8, i8* %68, i32 8
  store i8* %70, i8** %67
  br label %71

; <label>:71                                      ; preds = %66, %60
  %72 = phi i64* [ %64, %60 ], [ %69, %66 ]
  %73 = load i64, i64* %72
  store i64 %73, i64* %x1, align 8
  %74 = load i64, i64* %x1, align 8
  %75 = icmp ne i64 %74, 123
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %71
  call void @abort() #3
  unreachable

; <label>:77                                      ; preds = %71
  %78 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %79 = bitcast %struct.__va_list_tag* %78 to i8*
  call void @llvm.va_end(i8* %79)
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
  %2 = alloca i24, align 1
  %3 = alloca i24, align 1
  %4 = alloca i24, align 1
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
  %24 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %25 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %26 = bitcast i24* %2 to i8*
  %27 = bitcast %struct.tiny* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 3, i32 1, i1 false)
  %28 = load i24, i24* %2, align 1
  %29 = bitcast i24* %3 to i8*
  %30 = bitcast %struct.tiny* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 3, i32 1, i1 false)
  %31 = load i24, i24* %3, align 1
  %32 = bitcast i24* %4 to i8*
  %33 = bitcast %struct.tiny* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 3, i32 1, i1 false)
  %34 = load i24, i24* %4, align 1
  call void (i32, ...) @f(i32 3, i24 %28, i24 %31, i24 %34, i64 123)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %36 = load i32, i32* %1
  ret i32 %36
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
