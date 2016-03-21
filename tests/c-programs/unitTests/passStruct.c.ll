; ModuleID = './passStruct.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8, i8 }

@.str = private unnamed_addr constant [9 x i8] c"BUG: 10\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"BUG: 20\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"BUG: 30\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"BUG: 11\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"BUG: 21\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"BUG: 31\0A\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"BUG: 12\0A\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"BUG: 22\0A\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"BUG: 33\0A\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"BUG: 123\0A\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"BUG: 22b\0A\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"BUG: 22c\0A\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"BUG: 22d\0A\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"End\0A\00", align 1

; Function Attrs: nounwind uwtable
define i24 @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) #0 {
  %1 = alloca %struct.tiny, align 1
  %x = alloca %struct.tiny, align 4
  %2 = alloca i24, align 4
  %y = alloca %struct.tiny, align 4
  %3 = alloca i24, align 4
  %z = alloca %struct.tiny, align 4
  %4 = alloca i24, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i24, align 1
  store i24 %x.coerce, i24* %2, align 4
  %8 = bitcast i24* %2 to i8*
  %9 = bitcast %struct.tiny* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %8, i64 3, i32 4, i1 false)
  store i24 %y.coerce, i24* %3, align 4
  %10 = bitcast i24* %3 to i8*
  %11 = bitcast %struct.tiny* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %10, i64 3, i32 4, i1 false)
  store i24 %z.coerce, i24* %4, align 4
  %12 = bitcast i24* %4 to i8*
  %13 = bitcast %struct.tiny* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %12, i64 3, i32 4, i1 false)
  store i32 %n, i32* %5, align 4
  store i64 %l, i64* %6, align 8
  %14 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %16, 10
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  br label %20

; <label>:20                                      ; preds = %18, %0
  %21 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 1
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 20
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %20
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  br label %27

; <label>:27                                      ; preds = %25, %20
  %28 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 2
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %30, 30
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %27
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0))
  br label %34

; <label>:34                                      ; preds = %32, %27
  %35 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 0
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp ne i32 %37, 11
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %34
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
  br label %41

; <label>:41                                      ; preds = %39, %34
  %42 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 1
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 21
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %41
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %46, %41
  %49 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 2
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 31
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %48
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0))
  br label %55

; <label>:55                                      ; preds = %53, %48
  %56 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 0
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 12
  br i1 %59, label %60, label %62

; <label>:60                                      ; preds = %55
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0))
  br label %62

; <label>:62                                      ; preds = %60, %55
  %63 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 1
  %64 = load i8, i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp ne i32 %65, 22
  br i1 %66, label %67, label %69

; <label>:67                                      ; preds = %62
  %68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0))
  br label %69

; <label>:69                                      ; preds = %67, %62
  %70 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 2
  %71 = load i8, i8* %70, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp ne i32 %72, 32
  br i1 %73, label %74, label %76

; <label>:74                                      ; preds = %69
  %75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8, i32 0, i32 0))
  br label %76

; <label>:76                                      ; preds = %74, %69
  %77 = load i64, i64* %6, align 8
  %78 = icmp ne i64 %77, 123
  br i1 %78, label %79, label %81

; <label>:79                                      ; preds = %76
  %80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0))
  br label %81

; <label>:81                                      ; preds = %79, %76
  %82 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 1
  store i8 77, i8* %82, align 1
  %83 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 1
  %84 = load i8, i8* %83, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp ne i32 %85, 77
  br i1 %86, label %87, label %89

; <label>:87                                      ; preds = %81
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i32 0, i32 0))
  br label %89

; <label>:89                                      ; preds = %87, %81
  %90 = bitcast %struct.tiny* %1 to i8*
  %91 = bitcast %struct.tiny* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %91, i64 3, i32 1, i1 false)
  %92 = bitcast i24* %7 to i8*
  %93 = bitcast %struct.tiny* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %93, i64 3, i32 1, i1 false)
  %94 = load i24, i24* %7, align 1
  ret i24 %94
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %result = alloca %struct.tiny, align 1
  %2 = alloca i24, align 1
  %3 = alloca i24, align 1
  %4 = alloca i24, align 1
  %5 = alloca i24, align 1
  store i32 0, i32* %1
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i8 10, i8* %7, align 1
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %9 = getelementptr inbounds %struct.tiny, %struct.tiny* %8, i32 0, i32 0
  store i8 11, i8* %9, align 1
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %11 = getelementptr inbounds %struct.tiny, %struct.tiny* %10, i32 0, i32 0
  store i8 12, i8* %11, align 1
  %12 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %13 = getelementptr inbounds %struct.tiny, %struct.tiny* %12, i32 0, i32 1
  store i8 20, i8* %13, align 1
  %14 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %15 = getelementptr inbounds %struct.tiny, %struct.tiny* %14, i32 0, i32 1
  store i8 21, i8* %15, align 1
  %16 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %17 = getelementptr inbounds %struct.tiny, %struct.tiny* %16, i32 0, i32 1
  store i8 22, i8* %17, align 1
  %18 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %19 = getelementptr inbounds %struct.tiny, %struct.tiny* %18, i32 0, i32 2
  store i8 30, i8* %19, align 1
  %20 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %21 = getelementptr inbounds %struct.tiny, %struct.tiny* %20, i32 0, i32 2
  store i8 31, i8* %21, align 1
  %22 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %23 = getelementptr inbounds %struct.tiny, %struct.tiny* %22, i32 0, i32 2
  store i8 32, i8* %23, align 1
  %24 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %25 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %26 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %27 = bitcast i24* %2 to i8*
  %28 = bitcast %struct.tiny* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 3, i32 1, i1 false)
  %29 = load i24, i24* %2, align 1
  %30 = bitcast i24* %3 to i8*
  %31 = bitcast %struct.tiny* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 3, i32 1, i1 false)
  %32 = load i24, i24* %3, align 1
  %33 = bitcast i24* %4 to i8*
  %34 = bitcast %struct.tiny* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %34, i64 3, i32 1, i1 false)
  %35 = load i24, i24* %4, align 1
  %36 = call i24 @f(i32 3, i24 %29, i24 %32, i24 %35, i64 123)
  store i24 %36, i24* %5, align 1
  %37 = bitcast i24* %5 to i8*
  %38 = bitcast %struct.tiny* %result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %37, i64 3, i32 1, i1 false)
  %39 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %40 = getelementptr inbounds %struct.tiny, %struct.tiny* %39, i32 0, i32 1
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 22
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %0
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0))
  br label %46

; <label>:46                                      ; preds = %44, %0
  %47 = getelementptr inbounds %struct.tiny, %struct.tiny* %result, i32 0, i32 1
  %48 = load i8, i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp ne i32 %49, 77
  br i1 %50, label %51, label %53

; <label>:51                                      ; preds = %46
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12, i32 0, i32 0))
  br label %53

; <label>:53                                      ; preds = %51, %46
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
