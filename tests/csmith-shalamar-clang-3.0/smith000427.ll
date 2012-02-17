; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000427.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global [7 x i32] zeroinitializer, align 16
@g_28 = global i32 -851710698, align 4
@.str = private unnamed_addr constant [23 x i8] c"checksum g_10[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_10[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_10[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_10[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_10[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_10[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_10[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_26 = alloca i64, align 8
  %l_27 = alloca i32*, align 8
  store i64 3800383344303724903, i64* %l_26, align 8
  store i32* @g_28, i32** %l_27, align 8
  %1 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %2 = trunc i32 %1 to i8
  %3 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext 0, i8 signext %2)
  %4 = load i64* %l_26, align 8
  %5 = trunc i64 %4 to i8
  %6 = load i64* %l_26, align 8
  %7 = load i64* %l_26, align 8
  %8 = icmp ule i64 %6, %7
  %9 = zext i1 %8 to i32
  %10 = trunc i32 %9 to i8
  %11 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %5, i8 zeroext %10)
  %12 = zext i8 %11 to i64
  %13 = icmp sge i64 %12, 1370397191
  %14 = zext i1 %13 to i32
  %15 = trunc i32 %14 to i16
  %16 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %17 = sext i32 %16 to i64
  %18 = call i32 @func_21(i16 zeroext %15, i64 %17)
  %19 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %3, i32 %18)
  %20 = sext i8 %19 to i32
  %21 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %22 = trunc i32 %21 to i8
  %23 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %24 = trunc i32 %23 to i16
  %25 = call i32 @func_2(i32 %20, i8 signext %22, i16 zeroext %24, i32 1798619750)
  %26 = load i32** %l_27, align 8
  %27 = load i32* %26
  %28 = or i32 %27, %25
  store i32 %28, i32* %26
  %29 = load i32** %l_27, align 8
  %30 = load i32* %29
  ret i32 %30
}

define i32 @func_2(i32 %p_3, i8 signext %p_4, i16 zeroext %p_5, i32 %p_6) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_12 = alloca i32**, align 8
  %l_16 = alloca i32*, align 8
  %l_15 = alloca [1 x [6 x [3 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %p_3, i32* %2, align 4
  store i8 %p_4, i8* %3, align 1
  store i16 %p_5, i16* %4, align 2
  store i32 %p_6, i32* %5, align 4
  store i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), i32** %l_11, align 8
  store i32** %l_11, i32*** %l_12, align 8
  store i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 1), i32** %l_16, align 8
  %6 = call i32* @func_7(i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5))
  store i32* %6, i32** %l_11, align 8
  %7 = load i32*** %l_12, align 8
  store i32* null, i32** %7
  store i32 0, i32* %5, align 4
  br label %8

; <label>:8                                       ; preds = %50, %0
  %9 = load i32* %5, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %55

; <label>:11                                      ; preds = %8
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %41, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 1
  br i1 %14, label %15, label %44

; <label>:15                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %37, %15
  %17 = load i32* %j, align 4
  %18 = icmp slt i32 %17, 6
  br i1 %18, label %19, label %40

; <label>:19                                      ; preds = %16
  store i32 0, i32* %k, align 4
  br label %20

; <label>:20                                      ; preds = %33, %19
  %21 = load i32* %k, align 4
  %22 = icmp slt i32 %21, 3
  br i1 %22, label %23, label %36

; <label>:23                                      ; preds = %20
  %24 = load i32* %k, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32* %j, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1 x [6 x [3 x i16]]]* %l_15, i32 0, i64 %29
  %31 = getelementptr inbounds [6 x [3 x i16]]* %30, i32 0, i64 %27
  %32 = getelementptr inbounds [3 x i16]* %31, i32 0, i64 %25
  store i16 -1, i16* %32, align 2
  br label %33

; <label>:33                                      ; preds = %23
  %34 = load i32* %k, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %k, align 4
  br label %20

; <label>:36                                      ; preds = %20
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %16

; <label>:40                                      ; preds = %16
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %12

; <label>:44                                      ; preds = %12
  %45 = getelementptr inbounds [1 x [6 x [3 x i16]]]* %l_15, i32 0, i64 0
  %46 = getelementptr inbounds [6 x [3 x i16]]* %45, i32 0, i64 0
  %47 = getelementptr inbounds [3 x i16]* %46, i32 0, i64 2
  %48 = load i16* %47, align 2
  %49 = zext i16 %48 to i32
  store i32 %49, i32* %1
  br label %59
                                                  ; No predecessors!
  %51 = load i32* %5, align 4
  %52 = trunc i32 %51 to i16
  %53 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %52, i16 zeroext 1)
  %54 = zext i16 %53 to i32
  store i32 %54, i32* %5, align 4
  br label %8

; <label>:55                                      ; preds = %8
  %56 = load i32** %l_16, align 8
  store i32 1, i32* %56
  %57 = load i16* %4, align 2
  %58 = zext i16 %57 to i32
  store i32 %58, i32* %1
  br label %59

; <label>:59                                      ; preds = %55, %44
  %60 = load i32* %1
  ret i32 %60
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 127, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @func_21(i16 zeroext %p_22, i64 %p_23) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i64, align 8
  store i16 %p_22, i16* %1, align 2
  store i64 %p_23, i64* %2, align 8
  %3 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  ret i32 %3
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
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
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define i32* @func_7(i32* %p_8) nounwind uwtable {
  %1 = alloca i32*, align 8
  %l_9 = alloca i32*, align 8
  store i32* %p_8, i32** %1, align 8
  store i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), i32** %l_9, align 8
  %2 = load i32** %l_9, align 8
  ret i32* %2
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
  %5 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %19)
  %21 = load i32* @g_28, align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %21)
  %23 = load i32* %1
  ret i32 %23
}

declare i32 @printf(i8*, ...)
