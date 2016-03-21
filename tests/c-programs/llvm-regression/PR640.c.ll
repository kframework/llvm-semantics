; ModuleID = './PR640.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [7 x i8] c"ERROR\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"All done.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @test_stdarg(i32 1)
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  store i32 1, i32* %1
  br label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* %1
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = load i32, i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define internal i32 @test_stdarg(i32 %r) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %c1 = alloca i8, align 1
  %c2 = alloca i8, align 1
  store i32 %r, i32* %2, align 4
  store i8 1, i8* %c1, align 1
  store i8 2, i8* %c2, align 1
  %3 = bitcast i32* %2 to i8*
  %4 = load i8, i8* %c1, align 1
  %5 = sext i8 %4 to i32
  %6 = load i8, i8* %c2, align 1
  %7 = sext i8 %6 to i32
  %8 = call i32 (i8*, ...) @test_stdarg_va(i8* %3, i32 %5, i64 1981891429, i32 %7, i32* %2)
  %9 = icmp ne i32 %8, 1
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  store i32 0, i32* %1
  br label %23

; <label>:11                                      ; preds = %0
  %12 = bitcast i32* %2 to i8*
  %13 = load i8, i8* %c1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i8, i8* %c2, align 1
  %16 = sext i8 %15 to i32
  %17 = call i32 (i8*, ...) @test_stdarg_builtin_va(i8* %12, i32 %14, i64 1981891433, i32 %16, i32* %2)
  %18 = icmp ne i32 %17, 1
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %11
  store i32 0, i32* %1
  br label %23

; <label>:20                                      ; preds = %11
  %21 = load i32, i32* %2, align 4
  %22 = and i32 %21, 1
  store i32 %22, i32* %1
  br label %23

; <label>:23                                      ; preds = %20, %19, %10
  %24 = load i32, i32* %1
  ret i32 %24
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @test_stdarg_va(i8* %p1, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %l = alloca i64, align 8
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %p2 = alloca i8*, align 8
  store i8* %p1, i8** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 0
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 40
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to i32*
  %13 = add i32 %6, 8
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi i32* [ %12, %8 ], [ %17, %14 ]
  %21 = load i32, i32* %20
  store i32 %21, i32* %i1, align 4
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 0
  %24 = load i32, i32* %23
  %25 = icmp ule i32 %24, 40
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %19
  %27 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 3
  %28 = load i8*, i8** %27
  %29 = getelementptr i8, i8* %28, i32 %24
  %30 = bitcast i8* %29 to i64*
  %31 = add i32 %24, 8
  store i32 %31, i32* %23
  br label %37

; <label>:32                                      ; preds = %19
  %33 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 2
  %34 = load i8*, i8** %33
  %35 = bitcast i8* %34 to i64*
  %36 = getelementptr i8, i8* %34, i32 8
  store i8* %36, i8** %33
  br label %37

; <label>:37                                      ; preds = %32, %26
  %38 = phi i64* [ %30, %26 ], [ %35, %32 ]
  %39 = load i64, i64* %38
  store i64 %39, i64* %l, align 8
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %41 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 0
  %42 = load i32, i32* %41
  %43 = icmp ule i32 %42, 40
  br i1 %43, label %44, label %50

; <label>:44                                      ; preds = %37
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 3
  %46 = load i8*, i8** %45
  %47 = getelementptr i8, i8* %46, i32 %42
  %48 = bitcast i8* %47 to i32*
  %49 = add i32 %42, 8
  store i32 %49, i32* %41
  br label %55

; <label>:50                                      ; preds = %37
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 2
  %52 = load i8*, i8** %51
  %53 = bitcast i8* %52 to i32*
  %54 = getelementptr i8, i8* %52, i32 8
  store i8* %54, i8** %51
  br label %55

; <label>:55                                      ; preds = %50, %44
  %56 = phi i32* [ %48, %44 ], [ %53, %50 ]
  %57 = load i32, i32* %56
  store i32 %57, i32* %i2, align 4
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %59 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 0
  %60 = load i32, i32* %59
  %61 = icmp ule i32 %60, 40
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %55
  %63 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 3
  %64 = load i8*, i8** %63
  %65 = getelementptr i8, i8* %64, i32 %60
  %66 = bitcast i8* %65 to i8**
  %67 = add i32 %60, 8
  store i32 %67, i32* %59
  br label %73

; <label>:68                                      ; preds = %55
  %69 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 2
  %70 = load i8*, i8** %69
  %71 = bitcast i8* %70 to i8**
  %72 = getelementptr i8, i8* %70, i32 8
  store i8* %72, i8** %69
  br label %73

; <label>:73                                      ; preds = %68, %62
  %74 = phi i8** [ %66, %62 ], [ %71, %68 ]
  %75 = load i8*, i8** %74
  store i8* %75, i8** %p2, align 8
  %76 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %77 = bitcast %struct.__va_list_tag* %76 to i8*
  call void @llvm.va_end(i8* %77)
  %78 = load i8*, i8** %1, align 8
  %79 = load i8*, i8** %p2, align 8
  %80 = icmp eq i8* %78, %79
  br i1 %80, label %81, label %90

; <label>:81                                      ; preds = %73
  %82 = load i32, i32* %i1, align 4
  %83 = icmp eq i32 %82, 1
  br i1 %83, label %84, label %90

; <label>:84                                      ; preds = %81
  %85 = load i64, i64* %l, align 8
  %86 = icmp eq i64 %85, 1981891429
  br i1 %86, label %87, label %90

; <label>:87                                      ; preds = %84
  %88 = load i32, i32* %i2, align 4
  %89 = icmp eq i32 %88, 2
  br label %90

; <label>:90                                      ; preds = %87, %84, %81, %73
  %91 = phi i1 [ false, %84 ], [ false, %81 ], [ false, %73 ], [ %89, %87 ]
  %92 = zext i1 %91 to i32
  ret i32 %92
}

; Function Attrs: nounwind uwtable
define internal i32 @test_stdarg_builtin_va(i8* %p1, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %l = alloca i64, align 8
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %p2 = alloca i8*, align 8
  store i8* %p1, i8** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 0
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 40
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to i32*
  %13 = add i32 %6, 8
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi i32* [ %12, %8 ], [ %17, %14 ]
  %21 = load i32, i32* %20
  store i32 %21, i32* %i1, align 4
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 0
  %24 = load i32, i32* %23
  %25 = icmp ule i32 %24, 40
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %19
  %27 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 3
  %28 = load i8*, i8** %27
  %29 = getelementptr i8, i8* %28, i32 %24
  %30 = bitcast i8* %29 to i64*
  %31 = add i32 %24, 8
  store i32 %31, i32* %23
  br label %37

; <label>:32                                      ; preds = %19
  %33 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %22, i32 0, i32 2
  %34 = load i8*, i8** %33
  %35 = bitcast i8* %34 to i64*
  %36 = getelementptr i8, i8* %34, i32 8
  store i8* %36, i8** %33
  br label %37

; <label>:37                                      ; preds = %32, %26
  %38 = phi i64* [ %30, %26 ], [ %35, %32 ]
  %39 = load i64, i64* %38
  store i64 %39, i64* %l, align 8
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %41 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 0
  %42 = load i32, i32* %41
  %43 = icmp ule i32 %42, 40
  br i1 %43, label %44, label %50

; <label>:44                                      ; preds = %37
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 3
  %46 = load i8*, i8** %45
  %47 = getelementptr i8, i8* %46, i32 %42
  %48 = bitcast i8* %47 to i32*
  %49 = add i32 %42, 8
  store i32 %49, i32* %41
  br label %55

; <label>:50                                      ; preds = %37
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %40, i32 0, i32 2
  %52 = load i8*, i8** %51
  %53 = bitcast i8* %52 to i32*
  %54 = getelementptr i8, i8* %52, i32 8
  store i8* %54, i8** %51
  br label %55

; <label>:55                                      ; preds = %50, %44
  %56 = phi i32* [ %48, %44 ], [ %53, %50 ]
  %57 = load i32, i32* %56
  store i32 %57, i32* %i2, align 4
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %59 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 0
  %60 = load i32, i32* %59
  %61 = icmp ule i32 %60, 40
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %55
  %63 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 3
  %64 = load i8*, i8** %63
  %65 = getelementptr i8, i8* %64, i32 %60
  %66 = bitcast i8* %65 to i8**
  %67 = add i32 %60, 8
  store i32 %67, i32* %59
  br label %73

; <label>:68                                      ; preds = %55
  %69 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %58, i32 0, i32 2
  %70 = load i8*, i8** %69
  %71 = bitcast i8* %70 to i8**
  %72 = getelementptr i8, i8* %70, i32 8
  store i8* %72, i8** %69
  br label %73

; <label>:73                                      ; preds = %68, %62
  %74 = phi i8** [ %66, %62 ], [ %71, %68 ]
  %75 = load i8*, i8** %74
  store i8* %75, i8** %p2, align 8
  %76 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %77 = bitcast %struct.__va_list_tag* %76 to i8*
  call void @llvm.va_end(i8* %77)
  %78 = load i8*, i8** %1, align 8
  %79 = load i8*, i8** %p2, align 8
  %80 = icmp eq i8* %78, %79
  br i1 %80, label %81, label %90

; <label>:81                                      ; preds = %73
  %82 = load i32, i32* %i1, align 4
  %83 = icmp eq i32 %82, 1
  br i1 %83, label %84, label %90

; <label>:84                                      ; preds = %81
  %85 = load i64, i64* %l, align 8
  %86 = icmp eq i64 %85, 1981891433
  br i1 %86, label %87, label %90

; <label>:87                                      ; preds = %84
  %88 = load i32, i32* %i2, align 4
  %89 = icmp eq i32 %88, 2
  br label %90

; <label>:90                                      ; preds = %87, %84, %81, %73
  %91 = phi i1 [ false, %84 ], [ false, %81 ], [ false, %73 ], [ %89, %87 ]
  %92 = zext i1 %91 to i32
  ret i32 %92
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
