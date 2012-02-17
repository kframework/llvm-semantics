; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001171.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -3, align 4
@g_11 = global [10 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_11[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_11[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_11[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_11[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_11[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_11[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_11[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_11[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_11[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"checksum g_11[9] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %l_5 = alloca i16, align 2
  %l_6 = alloca i32*, align 8
  %l_10 = alloca i32*, align 8
  store i32* @g_2, i32** %l_9, align 8
  store i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %47, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp sle i32 %3, 3
  br i1 %4, label %5, label %50

; <label>:5                                       ; preds = %2
  store i16 25668, i16* %l_5, align 2
  store i32* @g_2, i32** %l_6, align 8
  store i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), i32** %l_10, align 8
  %6 = load i16* %l_5, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %5
  br label %10

; <label>:10                                      ; preds = %9, %5
  %11 = phi i1 [ true, %5 ], [ true, %9 ]
  %12 = zext i1 %11 to i32
  %13 = load i32** %l_6, align 8
  %14 = load i32* %13
  %15 = xor i32 %14, %12
  store i32 %15, i32* %13
  %16 = load i32* @g_2, align 4
  %17 = load i32** %l_9, align 8
  %18 = icmp eq i32* @g_2, %17
  %19 = zext i1 %18 to i32
  %20 = or i32 %16, %19
  %21 = load i32* @g_2, align 4
  %22 = load i32** %l_6, align 8
  %23 = load i32* %22
  %24 = or i32 %21, %23
  %25 = load i32** %l_9, align 8
  %26 = load i32* %25
  %27 = icmp sle i32 %24, %26
  %28 = zext i1 %27 to i32
  %29 = icmp sgt i32 %20, %28
  %30 = zext i1 %29 to i32
  %31 = load i32** %l_6, align 8
  %32 = load i32* %31
  %33 = xor i32 %30, %32
  %34 = trunc i32 %33 to i16
  %35 = load i32** %l_9, align 8
  %36 = load i32* %35
  %37 = trunc i32 %36 to i16
  %38 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %34, i16 zeroext %37)
  %39 = zext i16 %38 to i32
  %40 = icmp ne i32 %39, 0
  %41 = zext i1 %40 to i32
  %42 = load i32** %l_10, align 8
  %43 = load i32* %42
  %44 = and i32 %43, %41
  store i32 %44, i32* %42
  %45 = load i32** %l_6, align 8
  %46 = load i32* %45
  store i32 %46, i32* %1
  br label %52
                                                  ; No predecessors!
  %48 = load i32* @g_2, align 4
  %49 = call i32 @safe_add_func_uint32_t_u_u(i32 %48, i32 1)
  store i32 %49, i32* @g_2, align 4
  br label %2

; <label>:50                                      ; preds = %2
  %51 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), align 4
  store i32 %51, i32* %1
  br label %52

; <label>:52                                      ; preds = %50, %10
  %53 = load i32* %1
  ret i32 %53
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add i32 %3, %4
  ret i32 %5
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
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 4), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 5), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 6), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 7), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 8), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 9), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %27)
  %29 = load i32* %1
  ret i32 %29
}

declare i32 @printf(i8*, ...)
