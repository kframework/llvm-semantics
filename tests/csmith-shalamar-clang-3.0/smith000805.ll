; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000805.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global [8 x i32] [i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4], align 16
@g_13 = global i32 2, align 4
@g_15 = global i32 51721773, align 4
@.str = private unnamed_addr constant [23 x i8] c"checksum g_11[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_11[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_11[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_11[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_11[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_11[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_11[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_11[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_14 = alloca i32*, align 8
  store i32* @g_15, i32** %l_14, align 8
  %1 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 6), align 4
  %2 = trunc i32 %1 to i16
  %3 = call i32 @func_2(i16 signext %2, i32 -443810737, i8 signext -46, i32 1)
  %4 = load i32** %l_14, align 8
  %5 = load i32* %4
  %6 = xor i32 %5, %3
  store i32 %6, i32* %4
  %7 = load i32** %l_14, align 8
  %8 = load i32** %l_14, align 8
  %9 = icmp eq i32* %7, %8
  %10 = zext i1 %9 to i32
  %11 = load i32** %l_14, align 8
  %12 = load i32* %11
  %13 = and i32 %12, %10
  store i32 %13, i32* %11
  %14 = load i32* @g_15, align 4
  %15 = trunc i32 %14 to i16
  ret i16 %15
}

define i32 @func_2(i16 signext %p_3, i32 %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %l_9 = alloca i32, align 4
  %l_12 = alloca i32*, align 8
  store i16 %p_3, i16* %1, align 2
  store i32 %p_4, i32* %2, align 4
  store i8 %p_5, i8* %3, align 1
  store i32 %p_6, i32* %4, align 4
  store i32 1, i32* %l_9, align 4
  store i32* @g_13, i32** %l_12, align 8
  %5 = load i32* %l_9, align 4
  %6 = trunc i32 %5 to i8
  %7 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  %8 = trunc i32 %7 to i16
  %9 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %8)
  %10 = sext i16 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %0
  br label %13

; <label>:13                                      ; preds = %12, %0
  %14 = phi i1 [ true, %0 ], [ true, %12 ]
  %15 = zext i1 %14 to i32
  %16 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %6, i32 %15)
  %17 = sext i8 %16 to i32
  %18 = load i32** %l_12, align 8
  %19 = load i32* %18
  %20 = or i32 %19, %17
  store i32 %20, i32* %18
  %21 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  ret i32 %21
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
}

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %si, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %21)
  %23 = load i32* @g_13, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %23)
  %25 = load i32* @g_15, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %25)
  %27 = load i32* %1
  ret i32 %27
}

declare i32 @printf(i8*, ...)
