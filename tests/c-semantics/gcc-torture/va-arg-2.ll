; ModuleID = './va-arg-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@to_hex.hex = internal global [17 x i8] c"0123456789abcdef\00", align 16
@.str = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1

; Function Attrs: nounwind uwtable
define i32 @to_hex(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ugt i32 %2, 15
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [17 x i8]* @to_hex.hex, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = sext i8 %9 to i32
  ret i32 %10
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @f0(i8* %format, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %format, i8** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i8** %1, align 8
  %5 = call i64 @strlen(i8* %4)
  %6 = icmp ne i64 %5, 16
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %39, %8
  %10 = load i8** %1, align 8
  %11 = load i8* %10, align 1
  %12 = icmp ne i8 %11, 0
  br i1 %12, label %13, label %40

; <label>:13                                      ; preds = %9
  %14 = load i8** %1, align 8
  %15 = getelementptr inbounds i8* %14, i32 1
  store i8* %15, i8** %1, align 8
  %16 = load i8* %14, align 1
  %17 = sext i8 %16 to i32
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %19 = getelementptr inbounds %struct.__va_list_tag* %18, i32 0, i32 0
  %20 = load i32* %19
  %21 = icmp ule i32 %20, 40
  br i1 %21, label %22, label %28

; <label>:22                                      ; preds = %13
  %23 = getelementptr inbounds %struct.__va_list_tag* %18, i32 0, i32 3
  %24 = load i8** %23
  %25 = getelementptr i8* %24, i32 %20
  %26 = bitcast i8* %25 to i32*
  %27 = add i32 %20, 8
  store i32 %27, i32* %19
  br label %33

; <label>:28                                      ; preds = %13
  %29 = getelementptr inbounds %struct.__va_list_tag* %18, i32 0, i32 2
  %30 = load i8** %29
  %31 = bitcast i8* %30 to i32*
  %32 = getelementptr i8* %30, i32 8
  store i8* %32, i8** %29
  br label %33

; <label>:33                                      ; preds = %28, %22
  %34 = phi i32* [ %26, %22 ], [ %31, %28 ]
  %35 = load i32* %34
  %36 = call i32 @to_hex(i32 %35)
  %37 = icmp ne i32 %17, %36
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %33
  call void @abort() #4
  unreachable

; <label>:39                                      ; preds = %33
  br label %9

; <label>:40                                      ; preds = %9
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %42 = bitcast %struct.__va_list_tag* %41 to i8*
  call void @llvm.va_end(i8* %42)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define void @f1(i32 %a1, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i8* %format, i8** %2, align 8
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i8** %2, align 8
  %6 = call i64 @strlen(i8* %5)
  %7 = icmp ne i64 %6, 15
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %40, %9
  %11 = load i8** %2, align 8
  %12 = load i8* %11, align 1
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %41

; <label>:14                                      ; preds = %10
  %15 = load i8** %2, align 8
  %16 = getelementptr inbounds i8* %15, i32 1
  store i8* %16, i8** %2, align 8
  %17 = load i8* %15, align 1
  %18 = sext i8 %17 to i32
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 0
  %21 = load i32* %20
  %22 = icmp ule i32 %21, 40
  br i1 %22, label %23, label %29

; <label>:23                                      ; preds = %14
  %24 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 3
  %25 = load i8** %24
  %26 = getelementptr i8* %25, i32 %21
  %27 = bitcast i8* %26 to i32*
  %28 = add i32 %21, 8
  store i32 %28, i32* %20
  br label %34

; <label>:29                                      ; preds = %14
  %30 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 2
  %31 = load i8** %30
  %32 = bitcast i8* %31 to i32*
  %33 = getelementptr i8* %31, i32 8
  store i8* %33, i8** %30
  br label %34

; <label>:34                                      ; preds = %29, %23
  %35 = phi i32* [ %27, %23 ], [ %32, %29 ]
  %36 = load i32* %35
  %37 = call i32 @to_hex(i32 %36)
  %38 = icmp ne i32 %18, %37
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %34
  call void @abort() #4
  unreachable

; <label>:40                                      ; preds = %34
  br label %10

; <label>:41                                      ; preds = %10
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %43 = bitcast %struct.__va_list_tag* %42 to i8*
  call void @llvm.va_end(i8* %43)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f2(i32 %a1, i32 %a2, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i8* %format, i8** %3, align 8
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load i8** %3, align 8
  %7 = call i64 @strlen(i8* %6)
  %8 = icmp ne i64 %7, 14
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:10                                      ; preds = %0
  br label %11

; <label>:11                                      ; preds = %41, %10
  %12 = load i8** %3, align 8
  %13 = load i8* %12, align 1
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %42

; <label>:15                                      ; preds = %11
  %16 = load i8** %3, align 8
  %17 = getelementptr inbounds i8* %16, i32 1
  store i8* %17, i8** %3, align 8
  %18 = load i8* %16, align 1
  %19 = sext i8 %18 to i32
  %20 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %21 = getelementptr inbounds %struct.__va_list_tag* %20, i32 0, i32 0
  %22 = load i32* %21
  %23 = icmp ule i32 %22, 40
  br i1 %23, label %24, label %30

; <label>:24                                      ; preds = %15
  %25 = getelementptr inbounds %struct.__va_list_tag* %20, i32 0, i32 3
  %26 = load i8** %25
  %27 = getelementptr i8* %26, i32 %22
  %28 = bitcast i8* %27 to i32*
  %29 = add i32 %22, 8
  store i32 %29, i32* %21
  br label %35

; <label>:30                                      ; preds = %15
  %31 = getelementptr inbounds %struct.__va_list_tag* %20, i32 0, i32 2
  %32 = load i8** %31
  %33 = bitcast i8* %32 to i32*
  %34 = getelementptr i8* %32, i32 8
  store i8* %34, i8** %31
  br label %35

; <label>:35                                      ; preds = %30, %24
  %36 = phi i32* [ %28, %24 ], [ %33, %30 ]
  %37 = load i32* %36
  %38 = call i32 @to_hex(i32 %37)
  %39 = icmp ne i32 %19, %38
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  call void @abort() #4
  unreachable

; <label>:41                                      ; preds = %35
  br label %11

; <label>:42                                      ; preds = %11
  %43 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %44 = bitcast %struct.__va_list_tag* %43 to i8*
  call void @llvm.va_end(i8* %44)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f3(i32 %a1, i32 %a2, i32 %a3, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i8* %format, i8** %4, align 8
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = bitcast %struct.__va_list_tag* %5 to i8*
  call void @llvm.va_start(i8* %6)
  %7 = load i8** %4, align 8
  %8 = call i64 @strlen(i8* %7)
  %9 = icmp ne i64 %8, 13
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:11                                      ; preds = %0
  br label %12

; <label>:12                                      ; preds = %42, %11
  %13 = load i8** %4, align 8
  %14 = load i8* %13, align 1
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %43

; <label>:16                                      ; preds = %12
  %17 = load i8** %4, align 8
  %18 = getelementptr inbounds i8* %17, i32 1
  store i8* %18, i8** %4, align 8
  %19 = load i8* %17, align 1
  %20 = sext i8 %19 to i32
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %22 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 0
  %23 = load i32* %22
  %24 = icmp ule i32 %23, 40
  br i1 %24, label %25, label %31

; <label>:25                                      ; preds = %16
  %26 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 3
  %27 = load i8** %26
  %28 = getelementptr i8* %27, i32 %23
  %29 = bitcast i8* %28 to i32*
  %30 = add i32 %23, 8
  store i32 %30, i32* %22
  br label %36

; <label>:31                                      ; preds = %16
  %32 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 2
  %33 = load i8** %32
  %34 = bitcast i8* %33 to i32*
  %35 = getelementptr i8* %33, i32 8
  store i8* %35, i8** %32
  br label %36

; <label>:36                                      ; preds = %31, %25
  %37 = phi i32* [ %29, %25 ], [ %34, %31 ]
  %38 = load i32* %37
  %39 = call i32 @to_hex(i32 %38)
  %40 = icmp ne i32 %20, %39
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %36
  call void @abort() #4
  unreachable

; <label>:42                                      ; preds = %36
  br label %12

; <label>:43                                      ; preds = %12
  %44 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %45 = bitcast %struct.__va_list_tag* %44 to i8*
  call void @llvm.va_end(i8* %45)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f4(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i8* %format, i8** %5, align 8
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = bitcast %struct.__va_list_tag* %6 to i8*
  call void @llvm.va_start(i8* %7)
  %8 = load i8** %5, align 8
  %9 = call i64 @strlen(i8* %8)
  %10 = icmp ne i64 %9, 12
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:12                                      ; preds = %0
  br label %13

; <label>:13                                      ; preds = %43, %12
  %14 = load i8** %5, align 8
  %15 = load i8* %14, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %44

; <label>:17                                      ; preds = %13
  %18 = load i8** %5, align 8
  %19 = getelementptr inbounds i8* %18, i32 1
  store i8* %19, i8** %5, align 8
  %20 = load i8* %18, align 1
  %21 = sext i8 %20 to i32
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %23 = getelementptr inbounds %struct.__va_list_tag* %22, i32 0, i32 0
  %24 = load i32* %23
  %25 = icmp ule i32 %24, 40
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %17
  %27 = getelementptr inbounds %struct.__va_list_tag* %22, i32 0, i32 3
  %28 = load i8** %27
  %29 = getelementptr i8* %28, i32 %24
  %30 = bitcast i8* %29 to i32*
  %31 = add i32 %24, 8
  store i32 %31, i32* %23
  br label %37

; <label>:32                                      ; preds = %17
  %33 = getelementptr inbounds %struct.__va_list_tag* %22, i32 0, i32 2
  %34 = load i8** %33
  %35 = bitcast i8* %34 to i32*
  %36 = getelementptr i8* %34, i32 8
  store i8* %36, i8** %33
  br label %37

; <label>:37                                      ; preds = %32, %26
  %38 = phi i32* [ %30, %26 ], [ %35, %32 ]
  %39 = load i32* %38
  %40 = call i32 @to_hex(i32 %39)
  %41 = icmp ne i32 %21, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %37
  call void @abort() #4
  unreachable

; <label>:43                                      ; preds = %37
  br label %13

; <label>:44                                      ; preds = %13
  %45 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %46 = bitcast %struct.__va_list_tag* %45 to i8*
  call void @llvm.va_end(i8* %46)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f5(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i8* %format, i8** %6, align 8
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_start(i8* %8)
  %9 = load i8** %6, align 8
  %10 = call i64 @strlen(i8* %9)
  %11 = icmp ne i64 %10, 11
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:13                                      ; preds = %0
  br label %14

; <label>:14                                      ; preds = %44, %13
  %15 = load i8** %6, align 8
  %16 = load i8* %15, align 1
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %18, label %45

; <label>:18                                      ; preds = %14
  %19 = load i8** %6, align 8
  %20 = getelementptr inbounds i8* %19, i32 1
  store i8* %20, i8** %6, align 8
  %21 = load i8* %19, align 1
  %22 = sext i8 %21 to i32
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %24 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 0
  %25 = load i32* %24
  %26 = icmp ule i32 %25, 40
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %18
  %28 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 3
  %29 = load i8** %28
  %30 = getelementptr i8* %29, i32 %25
  %31 = bitcast i8* %30 to i32*
  %32 = add i32 %25, 8
  store i32 %32, i32* %24
  br label %38

; <label>:33                                      ; preds = %18
  %34 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 2
  %35 = load i8** %34
  %36 = bitcast i8* %35 to i32*
  %37 = getelementptr i8* %35, i32 8
  store i8* %37, i8** %34
  br label %38

; <label>:38                                      ; preds = %33, %27
  %39 = phi i32* [ %31, %27 ], [ %36, %33 ]
  %40 = load i32* %39
  %41 = call i32 @to_hex(i32 %40)
  %42 = icmp ne i32 %22, %41
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %38
  call void @abort() #4
  unreachable

; <label>:44                                      ; preds = %38
  br label %14

; <label>:45                                      ; preds = %14
  %46 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %47 = bitcast %struct.__va_list_tag* %46 to i8*
  call void @llvm.va_end(i8* %47)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f6(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i8* %format, i8** %7, align 8
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %9 = bitcast %struct.__va_list_tag* %8 to i8*
  call void @llvm.va_start(i8* %9)
  %10 = load i8** %7, align 8
  %11 = call i64 @strlen(i8* %10)
  %12 = icmp ne i64 %11, 10
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:14                                      ; preds = %0
  br label %15

; <label>:15                                      ; preds = %45, %14
  %16 = load i8** %7, align 8
  %17 = load i8* %16, align 1
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %46

; <label>:19                                      ; preds = %15
  %20 = load i8** %7, align 8
  %21 = getelementptr inbounds i8* %20, i32 1
  store i8* %21, i8** %7, align 8
  %22 = load i8* %20, align 1
  %23 = sext i8 %22 to i32
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %25 = getelementptr inbounds %struct.__va_list_tag* %24, i32 0, i32 0
  %26 = load i32* %25
  %27 = icmp ule i32 %26, 40
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %19
  %29 = getelementptr inbounds %struct.__va_list_tag* %24, i32 0, i32 3
  %30 = load i8** %29
  %31 = getelementptr i8* %30, i32 %26
  %32 = bitcast i8* %31 to i32*
  %33 = add i32 %26, 8
  store i32 %33, i32* %25
  br label %39

; <label>:34                                      ; preds = %19
  %35 = getelementptr inbounds %struct.__va_list_tag* %24, i32 0, i32 2
  %36 = load i8** %35
  %37 = bitcast i8* %36 to i32*
  %38 = getelementptr i8* %36, i32 8
  store i8* %38, i8** %35
  br label %39

; <label>:39                                      ; preds = %34, %28
  %40 = phi i32* [ %32, %28 ], [ %37, %34 ]
  %41 = load i32* %40
  %42 = call i32 @to_hex(i32 %41)
  %43 = icmp ne i32 %23, %42
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %39
  call void @abort() #4
  unreachable

; <label>:45                                      ; preds = %39
  br label %15

; <label>:46                                      ; preds = %15
  %47 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %48 = bitcast %struct.__va_list_tag* %47 to i8*
  call void @llvm.va_end(i8* %48)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f7(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i8* %format, i8** %8, align 8
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_start(i8* %10)
  %11 = load i8** %8, align 8
  %12 = call i64 @strlen(i8* %11)
  %13 = icmp ne i64 %12, 9
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %46, %15
  %17 = load i8** %8, align 8
  %18 = load i8* %17, align 1
  %19 = icmp ne i8 %18, 0
  br i1 %19, label %20, label %47

; <label>:20                                      ; preds = %16
  %21 = load i8** %8, align 8
  %22 = getelementptr inbounds i8* %21, i32 1
  store i8* %22, i8** %8, align 8
  %23 = load i8* %21, align 1
  %24 = sext i8 %23 to i32
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %20
  %30 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8** %30
  %32 = getelementptr i8* %31, i32 %27
  %33 = bitcast i8* %32 to i32*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %20
  %36 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8** %36
  %38 = bitcast i8* %37 to i32*
  %39 = getelementptr i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i32* [ %33, %29 ], [ %38, %35 ]
  %42 = load i32* %41
  %43 = call i32 @to_hex(i32 %42)
  %44 = icmp ne i32 %24, %43
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %40
  call void @abort() #4
  unreachable

; <label>:46                                      ; preds = %40
  br label %16

; <label>:47                                      ; preds = %16
  %48 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %49 = bitcast %struct.__va_list_tag* %48 to i8*
  call void @llvm.va_end(i8* %49)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f8(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i8* %format, i8** %9, align 8
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  %12 = load i8** %9, align 8
  %13 = call i64 @strlen(i8* %12)
  %14 = icmp ne i64 %13, 8
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:16                                      ; preds = %0
  br label %17

; <label>:17                                      ; preds = %47, %16
  %18 = load i8** %9, align 8
  %19 = load i8* %18, align 1
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %21, label %48

; <label>:21                                      ; preds = %17
  %22 = load i8** %9, align 8
  %23 = getelementptr inbounds i8* %22, i32 1
  store i8* %23, i8** %9, align 8
  %24 = load i8* %22, align 1
  %25 = sext i8 %24 to i32
  %26 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %27 = getelementptr inbounds %struct.__va_list_tag* %26, i32 0, i32 0
  %28 = load i32* %27
  %29 = icmp ule i32 %28, 40
  br i1 %29, label %30, label %36

; <label>:30                                      ; preds = %21
  %31 = getelementptr inbounds %struct.__va_list_tag* %26, i32 0, i32 3
  %32 = load i8** %31
  %33 = getelementptr i8* %32, i32 %28
  %34 = bitcast i8* %33 to i32*
  %35 = add i32 %28, 8
  store i32 %35, i32* %27
  br label %41

; <label>:36                                      ; preds = %21
  %37 = getelementptr inbounds %struct.__va_list_tag* %26, i32 0, i32 2
  %38 = load i8** %37
  %39 = bitcast i8* %38 to i32*
  %40 = getelementptr i8* %38, i32 8
  store i8* %40, i8** %37
  br label %41

; <label>:41                                      ; preds = %36, %30
  %42 = phi i32* [ %34, %30 ], [ %39, %36 ]
  %43 = load i32* %42
  %44 = call i32 @to_hex(i32 %43)
  %45 = icmp ne i32 %25, %44
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %41
  call void @abort() #4
  unreachable

; <label>:47                                      ; preds = %41
  br label %17

; <label>:48                                      ; preds = %17
  %49 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %50 = bitcast %struct.__va_list_tag* %49 to i8*
  call void @llvm.va_end(i8* %50)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f9(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i8* %format, i8** %10, align 8
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %12 = bitcast %struct.__va_list_tag* %11 to i8*
  call void @llvm.va_start(i8* %12)
  %13 = load i8** %10, align 8
  %14 = call i64 @strlen(i8* %13)
  %15 = icmp ne i64 %14, 7
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:17                                      ; preds = %0
  br label %18

; <label>:18                                      ; preds = %48, %17
  %19 = load i8** %10, align 8
  %20 = load i8* %19, align 1
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %49

; <label>:22                                      ; preds = %18
  %23 = load i8** %10, align 8
  %24 = getelementptr inbounds i8* %23, i32 1
  store i8* %24, i8** %10, align 8
  %25 = load i8* %23, align 1
  %26 = sext i8 %25 to i32
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %28 = getelementptr inbounds %struct.__va_list_tag* %27, i32 0, i32 0
  %29 = load i32* %28
  %30 = icmp ule i32 %29, 40
  br i1 %30, label %31, label %37

; <label>:31                                      ; preds = %22
  %32 = getelementptr inbounds %struct.__va_list_tag* %27, i32 0, i32 3
  %33 = load i8** %32
  %34 = getelementptr i8* %33, i32 %29
  %35 = bitcast i8* %34 to i32*
  %36 = add i32 %29, 8
  store i32 %36, i32* %28
  br label %42

; <label>:37                                      ; preds = %22
  %38 = getelementptr inbounds %struct.__va_list_tag* %27, i32 0, i32 2
  %39 = load i8** %38
  %40 = bitcast i8* %39 to i32*
  %41 = getelementptr i8* %39, i32 8
  store i8* %41, i8** %38
  br label %42

; <label>:42                                      ; preds = %37, %31
  %43 = phi i32* [ %35, %31 ], [ %40, %37 ]
  %44 = load i32* %43
  %45 = call i32 @to_hex(i32 %44)
  %46 = icmp ne i32 %26, %45
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %42
  call void @abort() #4
  unreachable

; <label>:48                                      ; preds = %42
  br label %18

; <label>:49                                      ; preds = %18
  %50 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %51 = bitcast %struct.__va_list_tag* %50 to i8*
  call void @llvm.va_end(i8* %51)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f10(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i32 %a10, i32* %10, align 4
  store i8* %format, i8** %11, align 8
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %13 = bitcast %struct.__va_list_tag* %12 to i8*
  call void @llvm.va_start(i8* %13)
  %14 = load i8** %11, align 8
  %15 = call i64 @strlen(i8* %14)
  %16 = icmp ne i64 %15, 6
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:18                                      ; preds = %0
  br label %19

; <label>:19                                      ; preds = %49, %18
  %20 = load i8** %11, align 8
  %21 = load i8* %20, align 1
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %50

; <label>:23                                      ; preds = %19
  %24 = load i8** %11, align 8
  %25 = getelementptr inbounds i8* %24, i32 1
  store i8* %25, i8** %11, align 8
  %26 = load i8* %24, align 1
  %27 = sext i8 %26 to i32
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %29 = getelementptr inbounds %struct.__va_list_tag* %28, i32 0, i32 0
  %30 = load i32* %29
  %31 = icmp ule i32 %30, 40
  br i1 %31, label %32, label %38

; <label>:32                                      ; preds = %23
  %33 = getelementptr inbounds %struct.__va_list_tag* %28, i32 0, i32 3
  %34 = load i8** %33
  %35 = getelementptr i8* %34, i32 %30
  %36 = bitcast i8* %35 to i32*
  %37 = add i32 %30, 8
  store i32 %37, i32* %29
  br label %43

; <label>:38                                      ; preds = %23
  %39 = getelementptr inbounds %struct.__va_list_tag* %28, i32 0, i32 2
  %40 = load i8** %39
  %41 = bitcast i8* %40 to i32*
  %42 = getelementptr i8* %40, i32 8
  store i8* %42, i8** %39
  br label %43

; <label>:43                                      ; preds = %38, %32
  %44 = phi i32* [ %36, %32 ], [ %41, %38 ]
  %45 = load i32* %44
  %46 = call i32 @to_hex(i32 %45)
  %47 = icmp ne i32 %27, %46
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %43
  call void @abort() #4
  unreachable

; <label>:49                                      ; preds = %43
  br label %19

; <label>:50                                      ; preds = %19
  %51 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %52 = bitcast %struct.__va_list_tag* %51 to i8*
  call void @llvm.va_end(i8* %52)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f11(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i32 %a10, i32* %10, align 4
  store i32 %a11, i32* %11, align 4
  store i8* %format, i8** %12, align 8
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %14 = bitcast %struct.__va_list_tag* %13 to i8*
  call void @llvm.va_start(i8* %14)
  %15 = load i8** %12, align 8
  %16 = call i64 @strlen(i8* %15)
  %17 = icmp ne i64 %16, 5
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:19                                      ; preds = %0
  br label %20

; <label>:20                                      ; preds = %50, %19
  %21 = load i8** %12, align 8
  %22 = load i8* %21, align 1
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %51

; <label>:24                                      ; preds = %20
  %25 = load i8** %12, align 8
  %26 = getelementptr inbounds i8* %25, i32 1
  store i8* %26, i8** %12, align 8
  %27 = load i8* %25, align 1
  %28 = sext i8 %27 to i32
  %29 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %30 = getelementptr inbounds %struct.__va_list_tag* %29, i32 0, i32 0
  %31 = load i32* %30
  %32 = icmp ule i32 %31, 40
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %24
  %34 = getelementptr inbounds %struct.__va_list_tag* %29, i32 0, i32 3
  %35 = load i8** %34
  %36 = getelementptr i8* %35, i32 %31
  %37 = bitcast i8* %36 to i32*
  %38 = add i32 %31, 8
  store i32 %38, i32* %30
  br label %44

; <label>:39                                      ; preds = %24
  %40 = getelementptr inbounds %struct.__va_list_tag* %29, i32 0, i32 2
  %41 = load i8** %40
  %42 = bitcast i8* %41 to i32*
  %43 = getelementptr i8* %41, i32 8
  store i8* %43, i8** %40
  br label %44

; <label>:44                                      ; preds = %39, %33
  %45 = phi i32* [ %37, %33 ], [ %42, %39 ]
  %46 = load i32* %45
  %47 = call i32 @to_hex(i32 %46)
  %48 = icmp ne i32 %28, %47
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %44
  call void @abort() #4
  unreachable

; <label>:50                                      ; preds = %44
  br label %20

; <label>:51                                      ; preds = %20
  %52 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %53 = bitcast %struct.__va_list_tag* %52 to i8*
  call void @llvm.va_end(i8* %53)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f12(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i32 %a10, i32* %10, align 4
  store i32 %a11, i32* %11, align 4
  store i32 %a12, i32* %12, align 4
  store i8* %format, i8** %13, align 8
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %15 = bitcast %struct.__va_list_tag* %14 to i8*
  call void @llvm.va_start(i8* %15)
  %16 = load i8** %13, align 8
  %17 = call i64 @strlen(i8* %16)
  %18 = icmp ne i64 %17, 4
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:20                                      ; preds = %0
  br label %21

; <label>:21                                      ; preds = %51, %20
  %22 = load i8** %13, align 8
  %23 = load i8* %22, align 1
  %24 = icmp ne i8 %23, 0
  br i1 %24, label %25, label %52

; <label>:25                                      ; preds = %21
  %26 = load i8** %13, align 8
  %27 = getelementptr inbounds i8* %26, i32 1
  store i8* %27, i8** %13, align 8
  %28 = load i8* %26, align 1
  %29 = sext i8 %28 to i32
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %31 = getelementptr inbounds %struct.__va_list_tag* %30, i32 0, i32 0
  %32 = load i32* %31
  %33 = icmp ule i32 %32, 40
  br i1 %33, label %34, label %40

; <label>:34                                      ; preds = %25
  %35 = getelementptr inbounds %struct.__va_list_tag* %30, i32 0, i32 3
  %36 = load i8** %35
  %37 = getelementptr i8* %36, i32 %32
  %38 = bitcast i8* %37 to i32*
  %39 = add i32 %32, 8
  store i32 %39, i32* %31
  br label %45

; <label>:40                                      ; preds = %25
  %41 = getelementptr inbounds %struct.__va_list_tag* %30, i32 0, i32 2
  %42 = load i8** %41
  %43 = bitcast i8* %42 to i32*
  %44 = getelementptr i8* %42, i32 8
  store i8* %44, i8** %41
  br label %45

; <label>:45                                      ; preds = %40, %34
  %46 = phi i32* [ %38, %34 ], [ %43, %40 ]
  %47 = load i32* %46
  %48 = call i32 @to_hex(i32 %47)
  %49 = icmp ne i32 %29, %48
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %45
  call void @abort() #4
  unreachable

; <label>:51                                      ; preds = %45
  br label %21

; <label>:52                                      ; preds = %21
  %53 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %54 = bitcast %struct.__va_list_tag* %53 to i8*
  call void @llvm.va_end(i8* %54)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f13(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i32 %a10, i32* %10, align 4
  store i32 %a11, i32* %11, align 4
  store i32 %a12, i32* %12, align 4
  store i32 %a13, i32* %13, align 4
  store i8* %format, i8** %14, align 8
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %16 = bitcast %struct.__va_list_tag* %15 to i8*
  call void @llvm.va_start(i8* %16)
  %17 = load i8** %14, align 8
  %18 = call i64 @strlen(i8* %17)
  %19 = icmp ne i64 %18, 3
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:21                                      ; preds = %0
  br label %22

; <label>:22                                      ; preds = %52, %21
  %23 = load i8** %14, align 8
  %24 = load i8* %23, align 1
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %53

; <label>:26                                      ; preds = %22
  %27 = load i8** %14, align 8
  %28 = getelementptr inbounds i8* %27, i32 1
  store i8* %28, i8** %14, align 8
  %29 = load i8* %27, align 1
  %30 = sext i8 %29 to i32
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %32 = getelementptr inbounds %struct.__va_list_tag* %31, i32 0, i32 0
  %33 = load i32* %32
  %34 = icmp ule i32 %33, 40
  br i1 %34, label %35, label %41

; <label>:35                                      ; preds = %26
  %36 = getelementptr inbounds %struct.__va_list_tag* %31, i32 0, i32 3
  %37 = load i8** %36
  %38 = getelementptr i8* %37, i32 %33
  %39 = bitcast i8* %38 to i32*
  %40 = add i32 %33, 8
  store i32 %40, i32* %32
  br label %46

; <label>:41                                      ; preds = %26
  %42 = getelementptr inbounds %struct.__va_list_tag* %31, i32 0, i32 2
  %43 = load i8** %42
  %44 = bitcast i8* %43 to i32*
  %45 = getelementptr i8* %43, i32 8
  store i8* %45, i8** %42
  br label %46

; <label>:46                                      ; preds = %41, %35
  %47 = phi i32* [ %39, %35 ], [ %44, %41 ]
  %48 = load i32* %47
  %49 = call i32 @to_hex(i32 %48)
  %50 = icmp ne i32 %30, %49
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %46
  call void @abort() #4
  unreachable

; <label>:52                                      ; preds = %46
  br label %22

; <label>:53                                      ; preds = %22
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %55 = bitcast %struct.__va_list_tag* %54 to i8*
  call void @llvm.va_end(i8* %55)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f14(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i32 %a10, i32* %10, align 4
  store i32 %a11, i32* %11, align 4
  store i32 %a12, i32* %12, align 4
  store i32 %a13, i32* %13, align 4
  store i32 %a14, i32* %14, align 4
  store i8* %format, i8** %15, align 8
  %16 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %17 = bitcast %struct.__va_list_tag* %16 to i8*
  call void @llvm.va_start(i8* %17)
  %18 = load i8** %15, align 8
  %19 = call i64 @strlen(i8* %18)
  %20 = icmp ne i64 %19, 2
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:22                                      ; preds = %0
  br label %23

; <label>:23                                      ; preds = %53, %22
  %24 = load i8** %15, align 8
  %25 = load i8* %24, align 1
  %26 = icmp ne i8 %25, 0
  br i1 %26, label %27, label %54

; <label>:27                                      ; preds = %23
  %28 = load i8** %15, align 8
  %29 = getelementptr inbounds i8* %28, i32 1
  store i8* %29, i8** %15, align 8
  %30 = load i8* %28, align 1
  %31 = sext i8 %30 to i32
  %32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %33 = getelementptr inbounds %struct.__va_list_tag* %32, i32 0, i32 0
  %34 = load i32* %33
  %35 = icmp ule i32 %34, 40
  br i1 %35, label %36, label %42

; <label>:36                                      ; preds = %27
  %37 = getelementptr inbounds %struct.__va_list_tag* %32, i32 0, i32 3
  %38 = load i8** %37
  %39 = getelementptr i8* %38, i32 %34
  %40 = bitcast i8* %39 to i32*
  %41 = add i32 %34, 8
  store i32 %41, i32* %33
  br label %47

; <label>:42                                      ; preds = %27
  %43 = getelementptr inbounds %struct.__va_list_tag* %32, i32 0, i32 2
  %44 = load i8** %43
  %45 = bitcast i8* %44 to i32*
  %46 = getelementptr i8* %44, i32 8
  store i8* %46, i8** %43
  br label %47

; <label>:47                                      ; preds = %42, %36
  %48 = phi i32* [ %40, %36 ], [ %45, %42 ]
  %49 = load i32* %48
  %50 = call i32 @to_hex(i32 %49)
  %51 = icmp ne i32 %31, %50
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %47
  call void @abort() #4
  unreachable

; <label>:53                                      ; preds = %47
  br label %23

; <label>:54                                      ; preds = %23
  %55 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %56 = bitcast %struct.__va_list_tag* %55 to i8*
  call void @llvm.va_end(i8* %56)
  ret void
}

; Function Attrs: nounwind uwtable
define void @f15(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i8* %format, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a1, i32* %1, align 4
  store i32 %a2, i32* %2, align 4
  store i32 %a3, i32* %3, align 4
  store i32 %a4, i32* %4, align 4
  store i32 %a5, i32* %5, align 4
  store i32 %a6, i32* %6, align 4
  store i32 %a7, i32* %7, align 4
  store i32 %a8, i32* %8, align 4
  store i32 %a9, i32* %9, align 4
  store i32 %a10, i32* %10, align 4
  store i32 %a11, i32* %11, align 4
  store i32 %a12, i32* %12, align 4
  store i32 %a13, i32* %13, align 4
  store i32 %a14, i32* %14, align 4
  store i32 %a15, i32* %15, align 4
  store i8* %format, i8** %16, align 8
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = bitcast %struct.__va_list_tag* %17 to i8*
  call void @llvm.va_start(i8* %18)
  %19 = load i8** %16, align 8
  %20 = call i64 @strlen(i8* %19)
  %21 = icmp ne i64 %20, 1
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:23                                      ; preds = %0
  br label %24

; <label>:24                                      ; preds = %54, %23
  %25 = load i8** %16, align 8
  %26 = load i8* %25, align 1
  %27 = icmp ne i8 %26, 0
  br i1 %27, label %28, label %55

; <label>:28                                      ; preds = %24
  %29 = load i8** %16, align 8
  %30 = getelementptr inbounds i8* %29, i32 1
  store i8* %30, i8** %16, align 8
  %31 = load i8* %29, align 1
  %32 = sext i8 %31 to i32
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %34 = getelementptr inbounds %struct.__va_list_tag* %33, i32 0, i32 0
  %35 = load i32* %34
  %36 = icmp ule i32 %35, 40
  br i1 %36, label %37, label %43

; <label>:37                                      ; preds = %28
  %38 = getelementptr inbounds %struct.__va_list_tag* %33, i32 0, i32 3
  %39 = load i8** %38
  %40 = getelementptr i8* %39, i32 %35
  %41 = bitcast i8* %40 to i32*
  %42 = add i32 %35, 8
  store i32 %42, i32* %34
  br label %48

; <label>:43                                      ; preds = %28
  %44 = getelementptr inbounds %struct.__va_list_tag* %33, i32 0, i32 2
  %45 = load i8** %44
  %46 = bitcast i8* %45 to i32*
  %47 = getelementptr i8* %45, i32 8
  store i8* %47, i8** %44
  br label %48

; <label>:48                                      ; preds = %43, %37
  %49 = phi i32* [ %41, %37 ], [ %46, %43 ]
  %50 = load i32* %49
  %51 = call i32 @to_hex(i32 %50)
  %52 = icmp ne i32 %32, %51
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %48
  call void @abort() #4
  unreachable

; <label>:54                                      ; preds = %48
  br label %24

; <label>:55                                      ; preds = %24
  %56 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %57 = bitcast %struct.__va_list_tag* %56 to i8*
  call void @llvm.va_end(i8* %57)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i8** %f, align 8
  %2 = load i8** %f, align 8
  %3 = getelementptr inbounds i8* %2, i64 0
  call void (i8*, ...)* @f0(i8* %3, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %4 = load i8** %f, align 8
  %5 = getelementptr inbounds i8* %4, i64 1
  call void (i32, i8*, ...)* @f1(i32 0, i8* %5, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %6 = load i8** %f, align 8
  %7 = getelementptr inbounds i8* %6, i64 2
  call void (i32, i32, i8*, ...)* @f2(i32 0, i32 1, i8* %7, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %8 = load i8** %f, align 8
  %9 = getelementptr inbounds i8* %8, i64 3
  call void (i32, i32, i32, i8*, ...)* @f3(i32 0, i32 1, i32 2, i8* %9, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %10 = load i8** %f, align 8
  %11 = getelementptr inbounds i8* %10, i64 4
  call void (i32, i32, i32, i32, i8*, ...)* @f4(i32 0, i32 1, i32 2, i32 3, i8* %11, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %12 = load i8** %f, align 8
  %13 = getelementptr inbounds i8* %12, i64 5
  call void (i32, i32, i32, i32, i32, i8*, ...)* @f5(i32 0, i32 1, i32 2, i32 3, i32 4, i8* %13, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %14 = load i8** %f, align 8
  %15 = getelementptr inbounds i8* %14, i64 6
  call void (i32, i32, i32, i32, i32, i32, i8*, ...)* @f6(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i8* %15, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %16 = load i8** %f, align 8
  %17 = getelementptr inbounds i8* %16, i64 7
  call void (i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f7(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i8* %17, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %18 = load i8** %f, align 8
  %19 = getelementptr inbounds i8* %18, i64 8
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i8* %19, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %20 = load i8** %f, align 8
  %21 = getelementptr inbounds i8* %20, i64 9
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f9(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i8* %21, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %22 = load i8** %f, align 8
  %23 = getelementptr inbounds i8* %22, i64 10
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f10(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i8* %23, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  %24 = load i8** %f, align 8
  %25 = getelementptr inbounds i8* %24, i64 11
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f11(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i8* %25, i32 11, i32 12, i32 13, i32 14, i32 15)
  %26 = load i8** %f, align 8
  %27 = getelementptr inbounds i8* %26, i64 12
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f12(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i8* %27, i32 12, i32 13, i32 14, i32 15)
  %28 = load i8** %f, align 8
  %29 = getelementptr inbounds i8* %28, i64 13
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f13(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i8* %29, i32 13, i32 14, i32 15)
  %30 = load i8** %f, align 8
  %31 = getelementptr inbounds i8* %30, i64 14
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f14(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i8* %31, i32 14, i32 15)
  %32 = load i8** %f, align 8
  %33 = getelementptr inbounds i8* %32, i64 15
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f15(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i8* %33, i32 15)
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
