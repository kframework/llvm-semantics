; ModuleID = './931004-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x1 = alloca i64, align 8
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %35, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %38

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 4, i32 4, i1 false)
  %28 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  %29 = load i32, i32* %28, align 4
  %30 = load i32, i32* %i, align 4
  %31 = add nsw i32 %30, 10
  %32 = icmp ne i32 %29, %31
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %24
  call void @abort() #3
  unreachable

; <label>:34                                      ; preds = %24
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32, i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %4

; <label>:38                                      ; preds = %4
  %39 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %39, i32 0, i32 0
  %41 = load i32, i32* %40
  %42 = icmp ule i32 %41, 40
  br i1 %42, label %43, label %49

; <label>:43                                      ; preds = %38
  %44 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %39, i32 0, i32 3
  %45 = load i8*, i8** %44
  %46 = getelementptr i8, i8* %45, i32 %41
  %47 = bitcast i8* %46 to i64*
  %48 = add i32 %41, 8
  store i32 %48, i32* %40
  br label %54

; <label>:49                                      ; preds = %38
  %50 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %39, i32 0, i32 2
  %51 = load i8*, i8** %50
  %52 = bitcast i8* %51 to i64*
  %53 = getelementptr i8, i8* %51, i32 8
  store i8* %53, i8** %50
  br label %54

; <label>:54                                      ; preds = %49, %43
  %55 = phi i64* [ %47, %43 ], [ %52, %49 ]
  %56 = load i64, i64* %55
  store i64 %56, i64* %x1, align 8
  %57 = load i64, i64* %x1, align 8
  %58 = icmp ne i64 %57, 123
  br i1 %58, label %59, label %60

; <label>:59                                      ; preds = %54
  call void @abort() #3
  unreachable

; <label>:60                                      ; preds = %54
  %61 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %62 = bitcast %struct.__va_list_tag* %61 to i8*
  call void @llvm.va_end(i8* %62)
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
  %x = alloca [3 x %struct.tiny], align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny, %struct.tiny* %2, i32 0, i32 0
  store i32 10, i32* %3, align 4
  %4 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny, %struct.tiny* %4, i32 0, i32 0
  store i32 11, i32* %5, align 4
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i32 12, i32* %7, align 4
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %11 = getelementptr %struct.tiny, %struct.tiny* %8, i32 0, i32 0
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr %struct.tiny, %struct.tiny* %9, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr %struct.tiny, %struct.tiny* %10, i32 0, i32 0
  %16 = load i32, i32* %15, align 4
  call void (i32, ...) @f(i32 3, i32 %12, i32 %14, i32 %16, i64 123)
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
