; ModuleID = './931004-10.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.tiny, align 1
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x1 = alloca i64, align 8
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %44, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %47

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 0
  %11 = load i32* %10
  %12 = icmp ule i32 %11, 40
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8** %14
  %16 = getelementptr i8* %15, i32 %11
  %17 = bitcast i8* %16 to %struct.tiny*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %8
  %20 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8** %20
  %22 = bitcast i8* %21 to %struct.tiny*
  %23 = getelementptr i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi %struct.tiny* [ %17, %13 ], [ %22, %19 ]
  %26 = bitcast %struct.tiny* %x to i8*
  %27 = bitcast %struct.tiny* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 2, i32 1, i1 false)
  %28 = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %29 = load i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 10
  %33 = icmp ne i32 %30, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %24
  call void @abort() #3
  unreachable

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %37 = load i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 20
  %41 = icmp ne i32 %38, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %35
  call void @abort() #3
  unreachable

; <label>:43                                      ; preds = %35
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %4

; <label>:47                                      ; preds = %4
  %48 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %49 = getelementptr inbounds %struct.__va_list_tag* %48, i32 0, i32 0
  %50 = load i32* %49
  %51 = icmp ule i32 %50, 40
  br i1 %51, label %52, label %58

; <label>:52                                      ; preds = %47
  %53 = getelementptr inbounds %struct.__va_list_tag* %48, i32 0, i32 3
  %54 = load i8** %53
  %55 = getelementptr i8* %54, i32 %50
  %56 = bitcast i8* %55 to i64*
  %57 = add i32 %50, 8
  store i32 %57, i32* %49
  br label %63

; <label>:58                                      ; preds = %47
  %59 = getelementptr inbounds %struct.__va_list_tag* %48, i32 0, i32 2
  %60 = load i8** %59
  %61 = bitcast i8* %60 to i64*
  %62 = getelementptr i8* %60, i32 8
  store i8* %62, i8** %59
  br label %63

; <label>:63                                      ; preds = %58, %52
  %64 = phi i64* [ %56, %52 ], [ %61, %58 ]
  %65 = load i64* %64
  store i64 %65, i64* %x1, align 8
  %66 = load i64* %x1, align 8
  %67 = icmp ne i64 %66, 123
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %63
  call void @abort() #3
  unreachable

; <label>:69                                      ; preds = %63
  %70 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %71 = bitcast %struct.__va_list_tag* %70 to i8*
  call void @llvm.va_end(i8* %71)
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
  %2 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny* %2, i32 0, i32 0
  store i8 10, i8* %3, align 1
  %4 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny* %4, i32 0, i32 0
  store i8 11, i8* %5, align 1
  %6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny* %6, i32 0, i32 0
  store i8 12, i8* %7, align 1
  %8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds %struct.tiny* %8, i32 0, i32 1
  store i8 20, i8* %9, align 1
  %10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %11 = getelementptr inbounds %struct.tiny* %10, i32 0, i32 1
  store i8 21, i8* %11, align 1
  %12 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %13 = getelementptr inbounds %struct.tiny* %12, i32 0, i32 1
  store i8 22, i8* %13, align 1
  %14 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %17 = bitcast %struct.tiny* %14 to i16*
  %18 = load i16* %17, align 1
  %19 = bitcast %struct.tiny* %15 to i16*
  %20 = load i16* %19, align 1
  %21 = bitcast %struct.tiny* %16 to i16*
  %22 = load i16* %21, align 1
  call void (i32, ...)* @f(i32 3, i16 %18, i16 %20, i16 %22, i64 123)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %24 = load i32* %1
  ret i32 %24
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
