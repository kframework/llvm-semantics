; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001327.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i16 0, align 2
@g_8 = global i32 741758029, align 4
@g_10 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_7 = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %l_11 = alloca i32*, align 8
  store i32 -1, i32* %l_7, align 4
  store i32* null, i32** %l_9, align 8
  store i32* @g_8, i32** %l_11, align 8
  %1 = load volatile i16* @g_4, align 2
  %2 = trunc i16 %1 to i8
  %3 = load i32* %l_7, align 4
  %4 = trunc i32 %3 to i8
  %5 = load i32* %l_7, align 4
  %6 = trunc i32 %5 to i8
  %7 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %4, i8 zeroext %6)
  %8 = zext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* @g_8, align 4
  %12 = icmp ne i32 %11, 0
  br label %13

; <label>:13                                      ; preds = %10, %0
  %14 = phi i1 [ true, %0 ], [ %12, %10 ]
  %15 = zext i1 %14 to i32
  %16 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %2, i32 %15)
  %17 = sext i8 %16 to i32
  %18 = load i32* @g_10, align 4
  %19 = and i32 %18, %17
  store i32 %19, i32* @g_10, align 4
  %20 = load i32* %l_7, align 4
  %21 = load i32** %l_11, align 8
  %22 = load i32* %21
  %23 = xor i32 %22, %20
  store i32 %23, i32* %21
  %24 = load volatile i16* @g_4, align 2
  %25 = zext i16 %24 to i32
  ret i32 %25
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i8
  ret i8 %22
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i16* @g_4, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_8, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_10, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
