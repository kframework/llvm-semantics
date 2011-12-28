; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000485.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32, i32, i64, i32, i32, i64, i64, i8 }

@g_2 = global [2 x [6 x i32]] [[6 x i32] [i32 -8, i32 -8, i32 -8, i32 -8, i32 -8, i32 -8], [6 x i32] [i32 -8, i32 -8, i32 -8, i32 -8, i32 -8, i32 -8]], align 16
@g_7 = global %struct.S0* null, align 8
@func_1.l_5 = internal constant [6 x [10 x [1 x [1 x i32]]]] [[10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]], [10 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]], [1 x [1 x i32]] [[1 x i32] [i32 541403686]]]], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_6 = alloca i32*, align 8
  %l_8 = alloca [10 x [4 x %struct.S0**]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 7, i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  br label %1

; <label>:1                                       ; preds = %36, %0
  %2 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %41

; <label>:4                                       ; preds = %1
  store i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), i32** %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %23, %4
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 10
  br i1 %7, label %8, label %26

; <label>:8                                       ; preds = %5
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %19, %8
  %10 = load i32* %j, align 4
  %11 = icmp slt i32 %10, 4
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %9
  %13 = load i32* %j, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x [4 x %struct.S0**]]* %l_8, i32 0, i64 %16
  %18 = getelementptr inbounds [4 x %struct.S0**]* %17, i32 0, i64 %14
  store %struct.S0** @g_7, %struct.S0*** %18, align 8
  br label %19

; <label>:19                                      ; preds = %12
  %20 = load i32* %j, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %j, align 4
  br label %9

; <label>:22                                      ; preds = %9
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %5

; <label>:26                                      ; preds = %5
  %27 = load i32* getelementptr inbounds ([6 x [10 x [1 x [1 x i32]]]]* @func_1.l_5, i32 0, i64 0, i64 7, i64 0, i64 0), align 4
  %28 = load i32** %l_6, align 8
  %29 = load i32* %28
  %30 = and i32 %29, %27
  store i32 %30, i32* %28
  %31 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %26
  br label %41

; <label>:34                                      ; preds = %26
  %35 = load %struct.S0** @g_7, align 8
  store %struct.S0* %35, %struct.S0** @g_7, align 8
  br label %36

; <label>:36                                      ; preds = %34
  %37 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %38 = sext i32 %37 to i64
  %39 = call i64 @safe_sub_func_uint64_t_u_u(i64 %38, i64 1)
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  br label %1

; <label>:41                                      ; preds = %33, %1
  %42 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %43 = trunc i32 %42 to i8
  ret i8 %43
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 2), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 3), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 4), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %29)
  %31 = load i32* %1
  ret i32 %31
}

declare i32 @printf(i8*, ...)
