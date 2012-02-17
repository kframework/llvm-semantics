; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001521.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [4 x i32] [i32 -1638421099, i32 -1638421099, i32 -1638421099, i32 -1638421099], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_5 = alloca i32, align 4
  %l_6 = alloca [5 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_11 = alloca i8, align 1
  store i32 4, i32* %l_5, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 %13
  %15 = getelementptr inbounds [10 x i32]* %14, i32 0, i64 %11
  store i32 -2052499604, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  store i32 0, i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  br label %24

; <label>:24                                      ; preds = %31, %23
  %25 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %24
  %28 = load i32* %l_5, align 4
  %29 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 2
  %30 = getelementptr inbounds [10 x i32]* %29, i32 0, i64 6
  store i32 %28, i32* %30, align 4
  br label %31

; <label>:31                                      ; preds = %27
  %32 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %33 = sext i32 %32 to i64
  %34 = call i64 @safe_sub_func_uint64_t_u_u(i64 %33, i64 3)
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  br label %24

; <label>:36                                      ; preds = %24
  store i32 0, i32* %l_5, align 4
  br label %37

; <label>:37                                      ; preds = %60, %36
  %38 = load i32* %l_5, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %65

; <label>:40                                      ; preds = %37
  %41 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 2
  %42 = getelementptr inbounds [10 x i32]* %41, i32 0, i64 6
  %43 = load i32* %42, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %40
  br label %65

; <label>:46                                      ; preds = %40
  store i32 21, i32* %l_5, align 4
  br label %47

; <label>:47                                      ; preds = %54, %46
  %48 = load i32* %l_5, align 4
  %49 = icmp ule i32 %48, 0
  br i1 %49, label %50, label %59

; <label>:50                                      ; preds = %47
  store i8 1, i8* %l_11, align 1
  %51 = load i8* %l_11, align 1
  %52 = sext i8 %51 to i32
  store i32 %52, i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 2), align 4
  %53 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  store i32 %53, i32* %1
  br label %69
                                                  ; No predecessors!
  %55 = load i32* %l_5, align 4
  %56 = zext i32 %55 to i64
  %57 = call i64 @safe_add_func_uint64_t_u_u(i64 %56, i64 5)
  %58 = trunc i64 %57 to i32
  store i32 %58, i32* %l_5, align 4
  br label %47

; <label>:59                                      ; preds = %47
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %l_5, align 4
  %62 = zext i32 %61 to i64
  %63 = call i64 @safe_sub_func_uint64_t_u_u(i64 %62, i64 7)
  %64 = trunc i64 %63 to i32
  store i32 %64, i32* %l_5, align 4
  br label %37

; <label>:65                                      ; preds = %45, %37
  %66 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 0
  %67 = getelementptr inbounds [10 x i32]* %66, i32 0, i64 3
  %68 = load i32* %67, align 4
  store i32 %68, i32* %1
  br label %69

; <label>:69                                      ; preds = %65, %50
  %70 = load i32* %1
  ret i32 %70
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = add i64 %3, %4
  ret i64 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)
