; ModuleID = './va-arg-8.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, ...) @debug(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i64 20014547621496)
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @debug(i32 %i1, i32 %i2, i32 %i3, i32 %i4, i32 %i5, i32 %i6, i32 %i7, i32 %i8, i32 %i9, ...) #1 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i1, i32* %1, align 4
  store i32 %i2, i32* %2, align 4
  store i32 %i3, i32* %3, align 4
  store i32 %i4, i32* %4, align 4
  store i32 %i5, i32* %5, align 4
  store i32 %i6, i32* %6, align 4
  store i32 %i7, i32* %7, align 4
  store i32 %i8, i32* %8, align 4
  store i32 %i9, i32* %9, align 4
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %13 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %12, i32 0, i32 0
  %14 = load i32, i32* %13
  %15 = icmp ule i32 %14, 40
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %12, i32 0, i32 3
  %18 = load i8*, i8** %17
  %19 = getelementptr i8, i8* %18, i32 %14
  %20 = bitcast i8* %19 to i32*
  %21 = add i32 %14, 8
  store i32 %21, i32* %13
  br label %27

; <label>:22                                      ; preds = %0
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %12, i32 0, i32 2
  %24 = load i8*, i8** %23
  %25 = bitcast i8* %24 to i32*
  %26 = getelementptr i8, i8* %24, i32 8
  store i8* %26, i8** %23
  br label %27

; <label>:27                                      ; preds = %22, %16
  %28 = phi i32* [ %20, %16 ], [ %25, %22 ]
  %29 = load i32, i32* %28
  %30 = icmp ne i32 %29, 10
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %27
  call void @abort() #4
  unreachable

; <label>:32                                      ; preds = %27
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %34 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %33, i32 0, i32 0
  %35 = load i32, i32* %34
  %36 = icmp ule i32 %35, 40
  br i1 %36, label %37, label %43

; <label>:37                                      ; preds = %32
  %38 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %33, i32 0, i32 3
  %39 = load i8*, i8** %38
  %40 = getelementptr i8, i8* %39, i32 %35
  %41 = bitcast i8* %40 to i64*
  %42 = add i32 %35, 8
  store i32 %42, i32* %34
  br label %48

; <label>:43                                      ; preds = %32
  %44 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %33, i32 0, i32 2
  %45 = load i8*, i8** %44
  %46 = bitcast i8* %45 to i64*
  %47 = getelementptr i8, i8* %45, i32 8
  store i8* %47, i8** %44
  br label %48

; <label>:48                                      ; preds = %43, %37
  %49 = phi i64* [ %41, %37 ], [ %46, %43 ]
  %50 = load i64, i64* %49
  %51 = icmp ne i64 %50, 20014547621496
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %48
  call void @abort() #4
  unreachable

; <label>:53                                      ; preds = %48
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %55 = bitcast %struct.__va_list_tag* %54 to i8*
  call void @llvm.va_end(i8* %55)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
