; ModuleID = './931004-14.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8, i8, i8 }
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

; <label>:4                                       ; preds = %60, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %63

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 4, i32 1, i1 false)
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
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32, i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %4

; <label>:63                                      ; preds = %4
  %64 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %65 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %64, i32 0, i32 0
  %66 = load i32, i32* %65
  %67 = icmp ule i32 %66, 40
  br i1 %67, label %68, label %74

; <label>:68                                      ; preds = %63
  %69 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %64, i32 0, i32 3
  %70 = load i8*, i8** %69
  %71 = getelementptr i8, i8* %70, i32 %66
  %72 = bitcast i8* %71 to i64*
  %73 = add i32 %66, 8
  store i32 %73, i32* %65
  br label %79

; <label>:74                                      ; preds = %63
  %75 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %64, i32 0, i32 2
  %76 = load i8*, i8** %75
  %77 = bitcast i8* %76 to i64*
  %78 = getelementptr i8, i8* %76, i32 8
  store i8* %78, i8** %75
  br label %79

; <label>:79                                      ; preds = %74, %68
  %80 = phi i64* [ %72, %68 ], [ %77, %74 ]
  %81 = load i64, i64* %80
  store i64 %81, i64* %x1, align 8
  %82 = load i64, i64* %x1, align 8
  %83 = icmp ne i64 %82, 123
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %79
  call void @abort() #3
  unreachable

; <label>:85                                      ; preds = %79
  %86 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %87 = bitcast %struct.__va_list_tag* %86 to i8*
  call void @llvm.va_end(i8* %87)
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
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny, %struct.tiny* %2, i32 0, i32 0
  store i8 10, i8* %3, align 1
  %4 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny, %struct.tiny* %4, i32 0, i32 0
  store i8 11, i8* %5, align 1
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i8 12, i8* %7, align 1
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds %struct.tiny, %struct.tiny* %8, i32 0, i32 1
  store i8 20, i8* %9, align 1
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %11 = getelementptr inbounds %struct.tiny, %struct.tiny* %10, i32 0, i32 1
  store i8 21, i8* %11, align 1
  %12 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %13 = getelementptr inbounds %struct.tiny, %struct.tiny* %12, i32 0, i32 1
  store i8 22, i8* %13, align 1
  %14 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %15 = getelementptr inbounds %struct.tiny, %struct.tiny* %14, i32 0, i32 2
  store i8 30, i8* %15, align 1
  %16 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %17 = getelementptr inbounds %struct.tiny, %struct.tiny* %16, i32 0, i32 2
  store i8 31, i8* %17, align 1
  %18 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %19 = getelementptr inbounds %struct.tiny, %struct.tiny* %18, i32 0, i32 2
  store i8 32, i8* %19, align 1
  %20 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %21 = getelementptr inbounds %struct.tiny, %struct.tiny* %20, i32 0, i32 3
  store i8 40, i8* %21, align 1
  %22 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %23 = getelementptr inbounds %struct.tiny, %struct.tiny* %22, i32 0, i32 3
  store i8 41, i8* %23, align 1
  %24 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %25 = getelementptr inbounds %struct.tiny, %struct.tiny* %24, i32 0, i32 3
  store i8 42, i8* %25, align 1
  %26 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %27 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %28 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %29 = bitcast %struct.tiny* %26 to i32*
  %30 = load i32, i32* %29, align 1
  %31 = bitcast %struct.tiny* %27 to i32*
  %32 = load i32, i32* %31, align 1
  %33 = bitcast %struct.tiny* %28 to i32*
  %34 = load i32, i32* %33, align 1
  call void (i32, ...) @f(i32 3, i32 %30, i32 %32, i32 %34, i64 123)
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
