; ModuleID = './991216-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @test(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 2, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %31, %0
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %34

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
  %17 = bitcast i8* %16 to i32*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %8
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8*, i8** %20
  %22 = bitcast i8* %21 to i32*
  %23 = getelementptr i8, i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi i32* [ %17, %13 ], [ %22, %19 ]
  %26 = load i32, i32* %25
  %27 = load i32, i32* %i, align 4
  %28 = icmp ne i32 %26, %27
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %24
  call void @abort() #3
  unreachable

; <label>:30                                      ; preds = %24
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32, i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %4

; <label>:34                                      ; preds = %4
  %35 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %35, i32 0, i32 0
  %37 = load i32, i32* %36
  %38 = icmp ule i32 %37, 40
  br i1 %38, label %39, label %45

; <label>:39                                      ; preds = %34
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %35, i32 0, i32 3
  %41 = load i8*, i8** %40
  %42 = getelementptr i8, i8* %41, i32 %37
  %43 = bitcast i8* %42 to i64*
  %44 = add i32 %37, 8
  store i32 %44, i32* %36
  br label %50

; <label>:45                                      ; preds = %34
  %46 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %35, i32 0, i32 2
  %47 = load i8*, i8** %46
  %48 = bitcast i8* %47 to i64*
  %49 = getelementptr i8, i8* %47, i32 8
  store i8* %49, i8** %46
  br label %50

; <label>:50                                      ; preds = %45, %39
  %51 = phi i64* [ %43, %39 ], [ %48, %45 ]
  %52 = load i64, i64* %51
  %53 = icmp ne i64 %52, 81985529216486895
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %50
  call void @abort() #3
  unreachable

; <label>:55                                      ; preds = %50
  %56 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 0
  %58 = load i32, i32* %57
  %59 = icmp ule i32 %58, 40
  br i1 %59, label %60, label %66

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 3
  %62 = load i8*, i8** %61
  %63 = getelementptr i8, i8* %62, i32 %58
  %64 = bitcast i8* %63 to i32*
  %65 = add i32 %58, 8
  store i32 %65, i32* %57
  br label %71

; <label>:66                                      ; preds = %55
  %67 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 2
  %68 = load i8*, i8** %67
  %69 = bitcast i8* %68 to i32*
  %70 = getelementptr i8, i8* %68, i32 8
  store i8* %70, i8** %67
  br label %71

; <label>:71                                      ; preds = %66, %60
  %72 = phi i32* [ %64, %60 ], [ %69, %66 ]
  %73 = load i32, i32* %72
  %74 = icmp ne i32 %73, 85
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %71
  call void @abort() #3
  unreachable

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %78 = bitcast %struct.__va_list_tag* %77 to i8*
  call void @llvm.va_end(i8* %78)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...) @test(i32 1, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 2, i32 2, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 3, i32 2, i32 3, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 4, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 5, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 6, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 7, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  call void (i32, ...) @test(i32 8, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
