; ModuleID = './931004-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i16 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.tiny, align 2
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x1 = alloca i64, align 8
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %36, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %39

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 2, i32 2, i1 false)
  %28 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  %29 = load i16, i16* %28, align 2
  %30 = sext i16 %29 to i32
  %31 = load i32, i32* %i, align 4
  %32 = add nsw i32 %31, 10
  %33 = icmp ne i32 %30, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %24
  call void @abort() #3
  unreachable

; <label>:35                                      ; preds = %24
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32, i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %4

; <label>:39                                      ; preds = %4
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %41 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 0
  %42 = load i32, i32* %41
  %43 = icmp ule i32 %42, 40
  br i1 %43, label %44, label %50

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 3
  %46 = load i8*, i8** %45
  %47 = getelementptr i8, i8* %46, i32 %42
  %48 = bitcast i8* %47 to i64*
  %49 = add i32 %42, 8
  store i32 %49, i32* %41
  br label %55

; <label>:50                                      ; preds = %39
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 2
  %52 = load i8*, i8** %51
  %53 = bitcast i8* %52 to i64*
  %54 = getelementptr i8, i8* %52, i32 8
  store i8* %54, i8** %51
  br label %55

; <label>:55                                      ; preds = %50, %44
  %56 = phi i64* [ %48, %44 ], [ %53, %50 ]
  %57 = load i64, i64* %56
  store i64 %57, i64* %x1, align 8
  %58 = load i64, i64* %x1, align 8
  %59 = icmp ne i64 %58, 123
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %55
  call void @abort() #3
  unreachable

; <label>:61                                      ; preds = %55
  %62 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %63 = bitcast %struct.__va_list_tag* %62 to i8*
  call void @llvm.va_end(i8* %63)
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
  %x = alloca [3 x %struct.tiny], align 2
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny, %struct.tiny* %2, i32 0, i32 0
  store i16 10, i16* %3, align 2
  %4 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny, %struct.tiny* %4, i32 0, i32 0
  store i16 11, i16* %5, align 2
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i16 12, i16* %7, align 2
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %11 = getelementptr %struct.tiny, %struct.tiny* %8, i32 0, i32 0
  %12 = load i16, i16* %11, align 2
  %13 = getelementptr %struct.tiny, %struct.tiny* %9, i32 0, i32 0
  %14 = load i16, i16* %13, align 2
  %15 = getelementptr %struct.tiny, %struct.tiny* %10, i32 0, i32 0
  %16 = load i16, i16* %15, align 2
  call void (i32, ...) @f(i32 3, i16 %12, i16 %14, i16 %16, i64 123)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
