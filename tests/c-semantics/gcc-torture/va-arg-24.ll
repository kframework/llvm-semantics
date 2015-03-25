; ModuleID = './va-arg-24.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@errors = internal global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"varargs9\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c" %s: n[%d] = %d expected %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"varargs8\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"varargs7\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"varargs6\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"varargs5\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"varargs4\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"varargs3\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"varargs2\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c"varargs1\00", align 1
@.str10 = private unnamed_addr constant [9 x i8] c"varargs0\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...)* @varargs0(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, ...)* @varargs1(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, ...)* @varargs2(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, ...)* @varargs3(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, ...)* @varargs4(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, ...)* @varargs5(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, ...)* @varargs6(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs7(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs9(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  %2 = load i32* @errors, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define internal void @varargs0(i32 %q0, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i32* %1, align 4
  %5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %4, i32* %5, align 4
  store i32 1, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %31, %0
  %7 = load i32* %i, align 4
  %8 = icmp sle i32 %7, 10
  br i1 %8, label %9, label %34

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = getelementptr inbounds %struct.__va_list_tag* %10, i32 0, i32 0
  %12 = load i32* %11
  %13 = icmp ule i32 %12, 40
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %9
  %15 = getelementptr inbounds %struct.__va_list_tag* %10, i32 0, i32 3
  %16 = load i8** %15
  %17 = getelementptr i8* %16, i32 %12
  %18 = bitcast i8* %17 to i32*
  %19 = add i32 %12, 8
  store i32 %19, i32* %11
  br label %25

; <label>:20                                      ; preds = %9
  %21 = getelementptr inbounds %struct.__va_list_tag* %10, i32 0, i32 2
  %22 = load i8** %21
  %23 = bitcast i8* %22 to i32*
  %24 = getelementptr i8* %22, i32 8
  store i8* %24, i8** %21
  br label %25

; <label>:25                                      ; preds = %20, %14
  %26 = phi i32* [ %18, %14 ], [ %23, %20 ]
  %27 = load i32* %26
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %29
  store i32 %27, i32* %30, align 4
  br label %31

; <label>:31                                      ; preds = %25
  %32 = load i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %6

; <label>:34                                      ; preds = %6
  %35 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %36 = bitcast %struct.__va_list_tag* %35 to i8*
  call void @llvm.va_end(i8* %36)
  %37 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0), i32* %37)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs1(i32 %q0, i32 %q1, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load i32* %1, align 4
  %6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %5, i32* %6, align 4
  %7 = load i32* %2, align 4
  %8 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %7, i32* %8, align 4
  store i32 2, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %34, %0
  %10 = load i32* %i, align 4
  %11 = icmp sle i32 %10, 10
  br i1 %11, label %12, label %37

; <label>:12                                      ; preds = %9
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %14 = getelementptr inbounds %struct.__va_list_tag* %13, i32 0, i32 0
  %15 = load i32* %14
  %16 = icmp ule i32 %15, 40
  br i1 %16, label %17, label %23

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds %struct.__va_list_tag* %13, i32 0, i32 3
  %19 = load i8** %18
  %20 = getelementptr i8* %19, i32 %15
  %21 = bitcast i8* %20 to i32*
  %22 = add i32 %15, 8
  store i32 %22, i32* %14
  br label %28

; <label>:23                                      ; preds = %12
  %24 = getelementptr inbounds %struct.__va_list_tag* %13, i32 0, i32 2
  %25 = load i8** %24
  %26 = bitcast i8* %25 to i32*
  %27 = getelementptr i8* %25, i32 8
  store i8* %27, i8** %24
  br label %28

; <label>:28                                      ; preds = %23, %17
  %29 = phi i32* [ %21, %17 ], [ %26, %23 ]
  %30 = load i32* %29
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %32
  store i32 %30, i32* %33, align 4
  br label %34

; <label>:34                                      ; preds = %28
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %9

; <label>:37                                      ; preds = %9
  %38 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %39 = bitcast %struct.__va_list_tag* %38 to i8*
  call void @llvm.va_end(i8* %39)
  %40 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0), i32* %40)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs2(i32 %q0, i32 %q1, i32 %q2, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load i32* %1, align 4
  %7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %6, i32* %7, align 4
  %8 = load i32* %2, align 4
  %9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %8, i32* %9, align 4
  %10 = load i32* %3, align 4
  %11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %10, i32* %11, align 4
  store i32 3, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %37, %0
  %13 = load i32* %i, align 4
  %14 = icmp sle i32 %13, 10
  br i1 %14, label %15, label %40

; <label>:15                                      ; preds = %12
  %16 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %17 = getelementptr inbounds %struct.__va_list_tag* %16, i32 0, i32 0
  %18 = load i32* %17
  %19 = icmp ule i32 %18, 40
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %struct.__va_list_tag* %16, i32 0, i32 3
  %22 = load i8** %21
  %23 = getelementptr i8* %22, i32 %18
  %24 = bitcast i8* %23 to i32*
  %25 = add i32 %18, 8
  store i32 %25, i32* %17
  br label %31

; <label>:26                                      ; preds = %15
  %27 = getelementptr inbounds %struct.__va_list_tag* %16, i32 0, i32 2
  %28 = load i8** %27
  %29 = bitcast i8* %28 to i32*
  %30 = getelementptr i8* %28, i32 8
  store i8* %30, i8** %27
  br label %31

; <label>:31                                      ; preds = %26, %20
  %32 = phi i32* [ %24, %20 ], [ %29, %26 ]
  %33 = load i32* %32
  %34 = load i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %35
  store i32 %33, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %31
  %38 = load i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %12

; <label>:40                                      ; preds = %12
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %42 = bitcast %struct.__va_list_tag* %41 to i8*
  call void @llvm.va_end(i8* %42)
  %43 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0), i32* %43)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs3(i32 %q0, i32 %q1, i32 %q2, i32 %q3, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = bitcast %struct.__va_list_tag* %5 to i8*
  call void @llvm.va_start(i8* %6)
  %7 = load i32* %1, align 4
  %8 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %7, i32* %8, align 4
  %9 = load i32* %2, align 4
  %10 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %9, i32* %10, align 4
  %11 = load i32* %3, align 4
  %12 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %11, i32* %12, align 4
  %13 = load i32* %4, align 4
  %14 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %13, i32* %14, align 4
  store i32 4, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %40, %0
  %16 = load i32* %i, align 4
  %17 = icmp sle i32 %16, 10
  br i1 %17, label %18, label %43

; <label>:18                                      ; preds = %15
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 0
  %21 = load i32* %20
  %22 = icmp ule i32 %21, 40
  br i1 %22, label %23, label %29

; <label>:23                                      ; preds = %18
  %24 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 3
  %25 = load i8** %24
  %26 = getelementptr i8* %25, i32 %21
  %27 = bitcast i8* %26 to i32*
  %28 = add i32 %21, 8
  store i32 %28, i32* %20
  br label %34

; <label>:29                                      ; preds = %18
  %30 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 2
  %31 = load i8** %30
  %32 = bitcast i8* %31 to i32*
  %33 = getelementptr i8* %31, i32 8
  store i8* %33, i8** %30
  br label %34

; <label>:34                                      ; preds = %29, %23
  %35 = phi i32* [ %27, %23 ], [ %32, %29 ]
  %36 = load i32* %35
  %37 = load i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %38
  store i32 %36, i32* %39, align 4
  br label %40

; <label>:40                                      ; preds = %34
  %41 = load i32* %i, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %15

; <label>:43                                      ; preds = %15
  %44 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %45 = bitcast %struct.__va_list_tag* %44 to i8*
  call void @llvm.va_end(i8* %45)
  %46 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0), i32* %46)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs4(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  store i32 %q4, i32* %5, align 4
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = bitcast %struct.__va_list_tag* %6 to i8*
  call void @llvm.va_start(i8* %7)
  %8 = load i32* %1, align 4
  %9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %8, i32* %9, align 4
  %10 = load i32* %2, align 4
  %11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %10, i32* %11, align 4
  %12 = load i32* %3, align 4
  %13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %12, i32* %13, align 4
  %14 = load i32* %4, align 4
  %15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %14, i32* %15, align 4
  %16 = load i32* %5, align 4
  %17 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %16, i32* %17, align 4
  store i32 5, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %43, %0
  %19 = load i32* %i, align 4
  %20 = icmp sle i32 %19, 10
  br i1 %20, label %21, label %46

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %23 = getelementptr inbounds %struct.__va_list_tag* %22, i32 0, i32 0
  %24 = load i32* %23
  %25 = icmp ule i32 %24, 40
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %21
  %27 = getelementptr inbounds %struct.__va_list_tag* %22, i32 0, i32 3
  %28 = load i8** %27
  %29 = getelementptr i8* %28, i32 %24
  %30 = bitcast i8* %29 to i32*
  %31 = add i32 %24, 8
  store i32 %31, i32* %23
  br label %37

; <label>:32                                      ; preds = %21
  %33 = getelementptr inbounds %struct.__va_list_tag* %22, i32 0, i32 2
  %34 = load i8** %33
  %35 = bitcast i8* %34 to i32*
  %36 = getelementptr i8* %34, i32 8
  store i8* %36, i8** %33
  br label %37

; <label>:37                                      ; preds = %32, %26
  %38 = phi i32* [ %30, %26 ], [ %35, %32 ]
  %39 = load i32* %38
  %40 = load i32* %i, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %41
  store i32 %39, i32* %42, align 4
  br label %43

; <label>:43                                      ; preds = %37
  %44 = load i32* %i, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %i, align 4
  br label %18

; <label>:46                                      ; preds = %18
  %47 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %48 = bitcast %struct.__va_list_tag* %47 to i8*
  call void @llvm.va_end(i8* %48)
  %49 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0), i32* %49)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs5(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  store i32 %q4, i32* %5, align 4
  store i32 %q5, i32* %6, align 4
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_start(i8* %8)
  %9 = load i32* %1, align 4
  %10 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %9, i32* %10, align 4
  %11 = load i32* %2, align 4
  %12 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %11, i32* %12, align 4
  %13 = load i32* %3, align 4
  %14 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %13, i32* %14, align 4
  %15 = load i32* %4, align 4
  %16 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %15, i32* %16, align 4
  %17 = load i32* %5, align 4
  %18 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %17, i32* %18, align 4
  %19 = load i32* %6, align 4
  %20 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %19, i32* %20, align 4
  store i32 6, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %46, %0
  %22 = load i32* %i, align 4
  %23 = icmp sle i32 %22, 10
  br i1 %23, label %24, label %49

; <label>:24                                      ; preds = %21
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8** %30
  %32 = getelementptr i8* %31, i32 %27
  %33 = bitcast i8* %32 to i32*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8** %36
  %38 = bitcast i8* %37 to i32*
  %39 = getelementptr i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i32* [ %33, %29 ], [ %38, %35 ]
  %42 = load i32* %41
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %44
  store i32 %42, i32* %45, align 4
  br label %46

; <label>:46                                      ; preds = %40
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %21

; <label>:49                                      ; preds = %21
  %50 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %51 = bitcast %struct.__va_list_tag* %50 to i8*
  call void @llvm.va_end(i8* %51)
  %52 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32* %52)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs6(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  store i32 %q4, i32* %5, align 4
  store i32 %q5, i32* %6, align 4
  store i32 %q6, i32* %7, align 4
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %9 = bitcast %struct.__va_list_tag* %8 to i8*
  call void @llvm.va_start(i8* %9)
  %10 = load i32* %1, align 4
  %11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %10, i32* %11, align 4
  %12 = load i32* %2, align 4
  %13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %12, i32* %13, align 4
  %14 = load i32* %3, align 4
  %15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %14, i32* %15, align 4
  %16 = load i32* %4, align 4
  %17 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %16, i32* %17, align 4
  %18 = load i32* %5, align 4
  %19 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %18, i32* %19, align 4
  %20 = load i32* %6, align 4
  %21 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %20, i32* %21, align 4
  %22 = load i32* %7, align 4
  %23 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %22, i32* %23, align 4
  store i32 7, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %49, %0
  %25 = load i32* %i, align 4
  %26 = icmp sle i32 %25, 10
  br i1 %26, label %27, label %52

; <label>:27                                      ; preds = %24
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %29 = getelementptr inbounds %struct.__va_list_tag* %28, i32 0, i32 0
  %30 = load i32* %29
  %31 = icmp ule i32 %30, 40
  br i1 %31, label %32, label %38

; <label>:32                                      ; preds = %27
  %33 = getelementptr inbounds %struct.__va_list_tag* %28, i32 0, i32 3
  %34 = load i8** %33
  %35 = getelementptr i8* %34, i32 %30
  %36 = bitcast i8* %35 to i32*
  %37 = add i32 %30, 8
  store i32 %37, i32* %29
  br label %43

; <label>:38                                      ; preds = %27
  %39 = getelementptr inbounds %struct.__va_list_tag* %28, i32 0, i32 2
  %40 = load i8** %39
  %41 = bitcast i8* %40 to i32*
  %42 = getelementptr i8* %40, i32 8
  store i8* %42, i8** %39
  br label %43

; <label>:43                                      ; preds = %38, %32
  %44 = phi i32* [ %36, %32 ], [ %41, %38 ]
  %45 = load i32* %44
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %47
  store i32 %45, i32* %48, align 4
  br label %49

; <label>:49                                      ; preds = %43
  %50 = load i32* %i, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %i, align 4
  br label %24

; <label>:52                                      ; preds = %24
  %53 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %54 = bitcast %struct.__va_list_tag* %53 to i8*
  call void @llvm.va_end(i8* %54)
  %55 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32* %55)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs7(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  store i32 %q4, i32* %5, align 4
  store i32 %q5, i32* %6, align 4
  store i32 %q6, i32* %7, align 4
  store i32 %q7, i32* %8, align 4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_start(i8* %10)
  %11 = load i32* %1, align 4
  %12 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %11, i32* %12, align 4
  %13 = load i32* %2, align 4
  %14 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %13, i32* %14, align 4
  %15 = load i32* %3, align 4
  %16 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %15, i32* %16, align 4
  %17 = load i32* %4, align 4
  %18 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %17, i32* %18, align 4
  %19 = load i32* %5, align 4
  %20 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %19, i32* %20, align 4
  %21 = load i32* %6, align 4
  %22 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %21, i32* %22, align 4
  %23 = load i32* %7, align 4
  %24 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %23, i32* %24, align 4
  %25 = load i32* %8, align 4
  %26 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %25, i32* %26, align 4
  store i32 8, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %52, %0
  %28 = load i32* %i, align 4
  %29 = icmp sle i32 %28, 10
  br i1 %29, label %30, label %55

; <label>:30                                      ; preds = %27
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %32 = getelementptr inbounds %struct.__va_list_tag* %31, i32 0, i32 0
  %33 = load i32* %32
  %34 = icmp ule i32 %33, 40
  br i1 %34, label %35, label %41

; <label>:35                                      ; preds = %30
  %36 = getelementptr inbounds %struct.__va_list_tag* %31, i32 0, i32 3
  %37 = load i8** %36
  %38 = getelementptr i8* %37, i32 %33
  %39 = bitcast i8* %38 to i32*
  %40 = add i32 %33, 8
  store i32 %40, i32* %32
  br label %46

; <label>:41                                      ; preds = %30
  %42 = getelementptr inbounds %struct.__va_list_tag* %31, i32 0, i32 2
  %43 = load i8** %42
  %44 = bitcast i8* %43 to i32*
  %45 = getelementptr i8* %43, i32 8
  store i8* %45, i8** %42
  br label %46

; <label>:46                                      ; preds = %41, %35
  %47 = phi i32* [ %39, %35 ], [ %44, %41 ]
  %48 = load i32* %47
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %50
  store i32 %48, i32* %51, align 4
  br label %52

; <label>:52                                      ; preds = %46
  %53 = load i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %27

; <label>:55                                      ; preds = %27
  %56 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %57 = bitcast %struct.__va_list_tag* %56 to i8*
  call void @llvm.va_end(i8* %57)
  %58 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32* %58)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs8(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, i32 %q8, ...) #0 {
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
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  store i32 %q4, i32* %5, align 4
  store i32 %q5, i32* %6, align 4
  store i32 %q6, i32* %7, align 4
  store i32 %q7, i32* %8, align 4
  store i32 %q8, i32* %9, align 4
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  %12 = load i32* %1, align 4
  %13 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %12, i32* %13, align 4
  %14 = load i32* %2, align 4
  %15 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %14, i32* %15, align 4
  %16 = load i32* %3, align 4
  %17 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %16, i32* %17, align 4
  %18 = load i32* %4, align 4
  %19 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %18, i32* %19, align 4
  %20 = load i32* %5, align 4
  %21 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %20, i32* %21, align 4
  %22 = load i32* %6, align 4
  %23 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %22, i32* %23, align 4
  %24 = load i32* %7, align 4
  %25 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %24, i32* %25, align 4
  %26 = load i32* %8, align 4
  %27 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %26, i32* %27, align 4
  %28 = load i32* %9, align 4
  %29 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 8
  store i32 %28, i32* %29, align 4
  store i32 9, i32* %i, align 4
  br label %30

; <label>:30                                      ; preds = %55, %0
  %31 = load i32* %i, align 4
  %32 = icmp sle i32 %31, 10
  br i1 %32, label %33, label %58

; <label>:33                                      ; preds = %30
  %34 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %35 = getelementptr inbounds %struct.__va_list_tag* %34, i32 0, i32 0
  %36 = load i32* %35
  %37 = icmp ule i32 %36, 40
  br i1 %37, label %38, label %44

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds %struct.__va_list_tag* %34, i32 0, i32 3
  %40 = load i8** %39
  %41 = getelementptr i8* %40, i32 %36
  %42 = bitcast i8* %41 to i32*
  %43 = add i32 %36, 8
  store i32 %43, i32* %35
  br label %49

; <label>:44                                      ; preds = %33
  %45 = getelementptr inbounds %struct.__va_list_tag* %34, i32 0, i32 2
  %46 = load i8** %45
  %47 = bitcast i8* %46 to i32*
  %48 = getelementptr i8* %46, i32 8
  store i8* %48, i8** %45
  br label %49

; <label>:49                                      ; preds = %44, %38
  %50 = phi i32* [ %42, %38 ], [ %47, %44 ]
  %51 = load i32* %50
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %53
  store i32 %51, i32* %54, align 4
  br label %55

; <label>:55                                      ; preds = %49
  %56 = load i32* %i, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %i, align 4
  br label %30

; <label>:58                                      ; preds = %30
  %59 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %60 = bitcast %struct.__va_list_tag* %59 to i8*
  call void @llvm.va_end(i8* %60)
  %61 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32* %61)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @varargs9(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, i32 %q8, i32 %q9, ...) #0 {
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
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %1, align 4
  store i32 %q1, i32* %2, align 4
  store i32 %q2, i32* %3, align 4
  store i32 %q3, i32* %4, align 4
  store i32 %q4, i32* %5, align 4
  store i32 %q5, i32* %6, align 4
  store i32 %q6, i32* %7, align 4
  store i32 %q7, i32* %8, align 4
  store i32 %q8, i32* %9, align 4
  store i32 %q9, i32* %10, align 4
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %12 = bitcast %struct.__va_list_tag* %11 to i8*
  call void @llvm.va_start(i8* %12)
  %13 = load i32* %1, align 4
  %14 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %13, i32* %14, align 4
  %15 = load i32* %2, align 4
  %16 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %15, i32* %16, align 4
  %17 = load i32* %3, align 4
  %18 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %17, i32* %18, align 4
  %19 = load i32* %4, align 4
  %20 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %19, i32* %20, align 4
  %21 = load i32* %5, align 4
  %22 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %21, i32* %22, align 4
  %23 = load i32* %6, align 4
  %24 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %23, i32* %24, align 4
  %25 = load i32* %7, align 4
  %26 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %25, i32* %26, align 4
  %27 = load i32* %8, align 4
  %28 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %27, i32* %28, align 4
  %29 = load i32* %9, align 4
  %30 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 8
  store i32 %29, i32* %30, align 4
  %31 = load i32* %10, align 4
  %32 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 9
  store i32 %31, i32* %32, align 4
  store i32 10, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %58, %0
  %34 = load i32* %i, align 4
  %35 = icmp sle i32 %34, 10
  br i1 %35, label %36, label %61

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %38 = getelementptr inbounds %struct.__va_list_tag* %37, i32 0, i32 0
  %39 = load i32* %38
  %40 = icmp ule i32 %39, 40
  br i1 %40, label %41, label %47

; <label>:41                                      ; preds = %36
  %42 = getelementptr inbounds %struct.__va_list_tag* %37, i32 0, i32 3
  %43 = load i8** %42
  %44 = getelementptr i8* %43, i32 %39
  %45 = bitcast i8* %44 to i32*
  %46 = add i32 %39, 8
  store i32 %46, i32* %38
  br label %52

; <label>:47                                      ; preds = %36
  %48 = getelementptr inbounds %struct.__va_list_tag* %37, i32 0, i32 2
  %49 = load i8** %48
  %50 = bitcast i8* %49 to i32*
  %51 = getelementptr i8* %49, i32 8
  store i8* %51, i8** %48
  br label %52

; <label>:52                                      ; preds = %47, %41
  %53 = phi i32* [ %45, %41 ], [ %50, %47 ]
  %54 = load i32* %53
  %55 = load i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %56
  store i32 %54, i32* %57, align 4
  br label %58

; <label>:58                                      ; preds = %52
  %59 = load i32* %i, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %33

; <label>:61                                      ; preds = %33
  %62 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %63 = bitcast %struct.__va_list_tag* %62 to i8*
  call void @llvm.va_end(i8* %63)
  %64 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32* %64)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define internal void @verify(i8* %tcase, i32* %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i8* %tcase, i8** %1, align 8
  store i32* %n, i32** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %27, %0
  %4 = load i32* %i, align 4
  %5 = icmp sle i32 %4, 10
  br i1 %5, label %6, label %30

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load i32** %2, align 8
  %10 = getelementptr inbounds i32* %9, i64 %8
  %11 = load i32* %10, align 4
  %12 = load i32* %i, align 4
  %13 = icmp ne i32 %11, %12
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %6
  %15 = load i8** %1, align 8
  %16 = load i32* %i, align 4
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32** %2, align 8
  %20 = getelementptr inbounds i32* %19, i64 %18
  %21 = load i32* %20, align 4
  %22 = load i32* %i, align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i8* %15, i32 %16, i32 %21, i32 %22)
  %24 = load i32* @errors, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* @errors, align 4
  br label %26

; <label>:26                                      ; preds = %14, %6
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %3

; <label>:30                                      ; preds = %3
  ret void
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
