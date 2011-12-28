; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001032.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 245849238, align 4
@g_14 = global [4 x [5 x i32]] [[5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][2] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][3] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][4] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][1] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][2] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][3] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_9 = alloca i32, align 4
  %l_23 = alloca i32, align 4
  %l_24 = alloca i32*, align 8
  %l_25 = alloca i8, align 1
  store i32 2119968860, i32* %l_9, align 4
  store volatile i32 15, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %52, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp eq i32 %2, 3
  br i1 %3, label %4, label %57

; <label>:4                                       ; preds = %1
  store i32 1826108312, i32* %l_23, align 4
  store i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 4), i32** %l_24, align 8
  store i8 -1, i8* %l_25, align 1
  %5 = load i32* %l_9, align 4
  %6 = load i32* %l_9, align 4
  %7 = trunc i32 %6 to i8
  %8 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %7, i32 -1336616002)
  %9 = zext i8 %8 to i32
  %10 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %11 = trunc i32 %10 to i8
  %12 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %11, i32 -1)
  %13 = zext i8 %12 to i32
  %14 = icmp sgt i32 %9, %13
  %15 = zext i1 %14 to i32
  %16 = xor i32 %5, %15
  %17 = sext i32 %16 to i64
  %18 = call i64 @safe_add_func_uint64_t_u_u(i64 1, i64 %17)
  %19 = icmp ne i64 0, %18
  %20 = zext i1 %19 to i32
  %21 = trunc i32 %20 to i16
  %22 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 4), align 4
  %23 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %24 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %25 = trunc i32 %24 to i8
  %26 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 2), align 4
  %27 = trunc i32 %26 to i8
  %28 = load i32* %l_23, align 4
  %29 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %30 = and i32 %28, %29
  %31 = load i32* %l_9, align 4
  %32 = load i32* %l_23, align 4
  %33 = icmp uge i32 %31, %32
  %34 = zext i1 %33 to i32
  %35 = xor i32 %30, %34
  %36 = trunc i32 %35 to i8
  %37 = call i32 @func_17(i32 %23, i32 1264470359, i8 zeroext %25, i8 zeroext %27, i8 signext %36)
  %38 = icmp ne i32 %22, %37
  %39 = zext i1 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = load i32* %l_23, align 4
  %42 = zext i32 %41 to i64
  %43 = call i64 @safe_add_func_int64_t_s_s(i64 %40, i64 %42)
  %44 = trunc i64 %43 to i32
  %45 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %21, i32 %44)
  %46 = zext i16 %45 to i32
  %47 = load i32** %l_24, align 8
  store i32 %46, i32* %47
  %48 = load i8* %l_25, align 1
  %49 = icmp ne i8 %48, 0
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %4
  br label %52

; <label>:51                                      ; preds = %4
  br label %52

; <label>:52                                      ; preds = %51, %50
  %53 = load volatile i32* @g_2, align 4
  %54 = trunc i32 %53 to i8
  %55 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %54, i8 signext 1)
  %56 = sext i8 %55 to i32
  store volatile i32 %56, i32* @g_2, align 4
  br label %1

; <label>:57                                      ; preds = %1
  %58 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 1), align 4
  %59 = trunc i32 %58 to i16
  ret i16 %59
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 65535, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i16
  ret i16 %21
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

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 255, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i8* %1, align 1
  %16 = zext i8 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i8
  ret i8 %21
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i8
  ret i8 %15
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %1, align 8
  %10 = load i64* %2, align 8
  %11 = sub nsw i64 9223372036854775807, %10
  %12 = icmp sgt i64 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i64* %1, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i64* %2, align 8
  %18 = icmp slt i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i64* %1, align 8
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 -9223372036854775808, %21
  %23 = icmp slt i64 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i64* %1, align 8
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i64* %1, align 8
  %28 = load i64* %2, align 8
  %29 = add nsw i64 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i64 [ %25, %24 ], [ %29, %26 ]
  ret i64 %31
}

define i32 @func_17(i32 %p_18, i32 %p_19, i8 zeroext %p_20, i8 zeroext %p_21, i8 signext %p_22) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i32 %p_18, i32* %1, align 4
  store i32 %p_19, i32* %2, align 4
  store i8 %p_20, i8* %3, align 1
  store i8 %p_21, i8* %4, align 1
  store i8 %p_22, i8* %5, align 1
  %6 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  ret i32 %6
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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
  %4 = call signext i16 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 0, i64 4), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 1), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 2), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 3), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 1, i64 4), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 0), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 1), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 3), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 4), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 0), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 1), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 2), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 3), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 3, i64 4), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i32 0, i64 2, i64 2), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0), i32 %47)
  %49 = load i32* %1
  ret i32 %49
}

declare i32 @printf(i8*, ...)
