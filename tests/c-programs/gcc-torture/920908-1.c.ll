; ModuleID = './920908-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.T = type { i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x, ...) #0 {
  %1 = alloca %struct.T, align 4
  %2 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %X = alloca %struct.T, align 4
  store i32 %x, i32* %2, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 0
  %7 = load i32, i32* %6
  %8 = icmp ule i32 %7, 40
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 3
  %11 = load i8*, i8** %10
  %12 = getelementptr i8, i8* %11, i32 %7
  %13 = bitcast i8* %12 to %struct.T*
  %14 = add i32 %7, 8
  store i32 %14, i32* %6
  br label %20

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 2
  %17 = load i8*, i8** %16
  %18 = bitcast i8* %17 to %struct.T*
  %19 = getelementptr i8, i8* %17, i32 8
  store i8* %19, i8** %16
  br label %20

; <label>:20                                      ; preds = %15, %9
  %21 = phi %struct.T* [ %13, %9 ], [ %18, %15 ]
  %22 = bitcast %struct.T* %X to i8*
  %23 = bitcast %struct.T* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 4, i32 4, i1 false)
  %24 = getelementptr inbounds %struct.T, %struct.T* %X, i32 0, i32 0
  %25 = load i32, i32* %24, align 4
  %26 = icmp ne i32 %25, 10
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %20
  call void @abort() #3
  unreachable

; <label>:28                                      ; preds = %20
  %29 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %29, i32 0, i32 0
  %31 = load i32, i32* %30
  %32 = icmp ule i32 %31, 40
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %28
  %34 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %29, i32 0, i32 3
  %35 = load i8*, i8** %34
  %36 = getelementptr i8, i8* %35, i32 %31
  %37 = bitcast i8* %36 to %struct.T*
  %38 = add i32 %31, 8
  store i32 %38, i32* %30
  br label %44

; <label>:39                                      ; preds = %28
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %29, i32 0, i32 2
  %41 = load i8*, i8** %40
  %42 = bitcast i8* %41 to %struct.T*
  %43 = getelementptr i8, i8* %41, i32 8
  store i8* %43, i8** %40
  br label %44

; <label>:44                                      ; preds = %39, %33
  %45 = phi %struct.T* [ %37, %33 ], [ %42, %39 ]
  %46 = bitcast %struct.T* %X to i8*
  %47 = bitcast %struct.T* %45 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %47, i64 4, i32 4, i1 false)
  %48 = getelementptr inbounds %struct.T, %struct.T* %X, i32 0, i32 0
  %49 = load i32, i32* %48, align 4
  %50 = icmp ne i32 %49, 20
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %44
  call void @abort() #3
  unreachable

; <label>:52                                      ; preds = %44
  %53 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %54 = bitcast %struct.__va_list_tag* %53 to i8*
  call void @llvm.va_end(i8* %54)
  %55 = bitcast %struct.T* %1 to i8*
  %56 = bitcast %struct.T* %X to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %56, i64 4, i32 4, i1 false)
  %57 = getelementptr %struct.T, %struct.T* %1, i32 0, i32 0
  %58 = load i32, i32* %57, align 4
  ret i32 %58
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
  %X = alloca %struct.T, align 4
  %Y = alloca %struct.T, align 4
  %i = alloca i32, align 4
  %2 = alloca %struct.T, align 4
  store i32 0, i32* %1
  %3 = getelementptr inbounds %struct.T, %struct.T* %X, i32 0, i32 0
  store i32 10, i32* %3, align 4
  %4 = getelementptr inbounds %struct.T, %struct.T* %Y, i32 0, i32 0
  store i32 20, i32* %4, align 4
  %5 = getelementptr %struct.T, %struct.T* %X, i32 0, i32 0
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr %struct.T, %struct.T* %Y, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i32, ...) @f(i32 2, i32 %6, i32 %8)
  %10 = getelementptr %struct.T, %struct.T* %2, i32 0, i32 0
  store i32 %9, i32* %10, align 4
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %12 = load i32, i32* %1
  ret i32 %12
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
