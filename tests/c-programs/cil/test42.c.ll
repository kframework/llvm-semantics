; ModuleID = './test42.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [16 x i8] c"hello world %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @sum(i32 %s0, ...) #0 {
  %1 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %copy = alloca [1 x %struct.__va_list_tag], align 16
  %s = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %s0, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  store i32 %2, i32* %s, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  br label %5

; <label>:5                                       ; preds = %34, %0
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 0
  %8 = load i32, i32* %7
  %9 = icmp ule i32 %8, 40
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %5
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 3
  %12 = load i8*, i8** %11
  %13 = getelementptr i8, i8* %12, i32 %8
  %14 = bitcast i8* %13 to i32*
  %15 = add i32 %8, 8
  store i32 %15, i32* %7
  br label %21

; <label>:16                                      ; preds = %5
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %6, i32 0, i32 2
  %18 = load i8*, i8** %17
  %19 = bitcast i8* %18 to i32*
  %20 = getelementptr i8, i8* %18, i32 8
  store i8* %20, i8** %17
  br label %21

; <label>:21                                      ; preds = %16, %10
  %22 = phi i32* [ %14, %10 ], [ %19, %16 ]
  %23 = load i32, i32* %22
  store i32 %23, i32* %n, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %38

; <label>:25                                      ; preds = %21
  %26 = load i32, i32* %s, align 4
  %27 = load i32, i32* %1, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %34

; <label>:29                                      ; preds = %25
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %copy, i32 0, i32 0
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %32 = bitcast %struct.__va_list_tag* %30 to i8*
  %33 = bitcast %struct.__va_list_tag* %31 to i8*
  call void @llvm.va_copy(i8* %32, i8* %33)
  br label %34

; <label>:34                                      ; preds = %29, %25
  %35 = load i32, i32* %n, align 4
  %36 = load i32, i32* %s, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, i32* %s, align 4
  br label %5

; <label>:38                                      ; preds = %21
  %39 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %40 = bitcast %struct.__va_list_tag* %39 to i8*
  call void @llvm.va_end(i8* %40)
  br label %41

; <label>:41                                      ; preds = %61, %38
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %copy, i32 0, i32 0
  %43 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 0
  %44 = load i32, i32* %43
  %45 = icmp ule i32 %44, 40
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %41
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 3
  %48 = load i8*, i8** %47
  %49 = getelementptr i8, i8* %48, i32 %44
  %50 = bitcast i8* %49 to i32*
  %51 = add i32 %44, 8
  store i32 %51, i32* %43
  br label %57

; <label>:52                                      ; preds = %41
  %53 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 2
  %54 = load i8*, i8** %53
  %55 = bitcast i8* %54 to i32*
  %56 = getelementptr i8, i8* %54, i32 8
  store i8* %56, i8** %53
  br label %57

; <label>:57                                      ; preds = %52, %46
  %58 = phi i32* [ %50, %46 ], [ %55, %52 ]
  %59 = load i32, i32* %58
  store i32 %59, i32* %n, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %57
  %62 = load i32, i32* %n, align 4
  %63 = load i32, i32* %s, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, i32* %s, align 4
  br label %41

; <label>:65                                      ; preds = %57
  %66 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %copy, i32 0, i32 0
  %67 = bitcast %struct.__va_list_tag* %66 to i8*
  call void @llvm.va_end(i8* %67)
  %68 = load i32, i32* %s, align 4
  ret i32 %68
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_copy(i8*, i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (i32, ...) @sum(i32 4, i32 3, i32 32, i32 22, i32 0)
  store i32 %4, i32* %x, align 4
  %5 = load i32, i32* %x, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
