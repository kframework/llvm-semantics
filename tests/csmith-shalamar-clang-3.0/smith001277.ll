; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001277.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1988232740, align 4
@g_5 = global i32 -950892824, align 4
@g_11 = global i32* null, align 8
@g_12 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_10 = alloca i32, align 4
  store i32 -3, i32* %l_10, align 4
  store volatile i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %20, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %4, label %25

; <label>:4                                       ; preds = %1
  store i32 0, i32* @g_5, align 4
  br label %5

; <label>:5                                       ; preds = %14, %4
  %6 = load i32* @g_5, align 4
  %7 = icmp ne i32 %6, -21
  br i1 %7, label %8, label %19

; <label>:8                                       ; preds = %5
  %9 = load i32* @g_5, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  br label %19

; <label>:12                                      ; preds = %8
  %13 = load i32* @g_5, align 4
  store i32 %13, i32* @g_5, align 4
  br label %14

; <label>:14                                      ; preds = %12
  %15 = load i32* @g_5, align 4
  %16 = sext i32 %15 to i64
  %17 = call i64 @safe_sub_func_uint64_t_u_u(i64 %16, i64 1)
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* @g_5, align 4
  br label %5

; <label>:19                                      ; preds = %11, %5
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load volatile i32* @g_2, align 4
  %22 = sext i32 %21 to i64
  %23 = call i64 @safe_add_func_uint64_t_u_u(i64 %22, i64 8)
  %24 = trunc i64 %23 to i32
  store volatile i32 %24, i32* @g_2, align 4
  br label %1

; <label>:25                                      ; preds = %1
  %26 = load i32* %l_10, align 4
  %27 = trunc i32 %26 to i8
  %28 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %27, i8 zeroext -4)
  %29 = zext i8 %28 to i32
  %30 = load volatile i32** @g_12, align 8
  store i32 %29, i32* %30
  %31 = load volatile i32* @g_2, align 4
  %32 = sext i32 %31 to i64
  ret i64 %32
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

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_5, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
