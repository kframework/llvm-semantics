; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001401.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -8679, align 2
@g_9 = global i16 4, align 2
@g_16 = global i32 -300116159, align 4
@g_20 = global i16 -2, align 2
@g_21 = global i32* null, align 8
@g_30 = global [5 x [4 x [1 x i32]]] [[4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]]], align 16
@g_32 = global i32** null, align 8
@g_34 = global i32* @g_16, align 8
@g_33 = global i32** @g_34, align 8
@g_36 = global i32** @g_34, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_16 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_20 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][1][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][3][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][1][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][3][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][1][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][2][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][1][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][2][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][3][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_10 = alloca i64, align 8
  %l_22 = alloca i32, align 4
  %l_23 = alloca i32*, align 8
  %l_38 = alloca i64, align 8
  %l_37 = alloca i32, align 4
  %l_35 = alloca i32**, align 8
  store i64 7, i64* %l_10, align 8
  store i32 1599806319, i32* %l_22, align 4
  store i32* @g_16, i32** %l_23, align 8
  store i64 8727868780990093312, i64* %l_38, align 8
  %2 = load volatile i16* @g_2, align 2
  %3 = sext i16 %2 to i32
  %4 = load i64* %l_10, align 8
  %5 = trunc i64 %4 to i16
  %6 = load i64* %l_10, align 8
  %7 = trunc i64 %6 to i32
  %8 = call signext i8 @func_11(i32 %7)
  %9 = load i16* @g_20, align 2
  %10 = sext i16 %9 to i64
  %11 = load i16* @g_20, align 2
  %12 = load i16* @g_20, align 2
  %13 = sext i16 %12 to i32
  %14 = call i32 @func_3(i16 zeroext %5, i8 signext %8, i64 %10, i16 zeroext %11, i32 %13)
  %15 = icmp sle i32 %3, %14
  %16 = zext i1 %15 to i32
  store i32 %16, i32* %l_22, align 4
  %17 = load i32** %l_23, align 8
  store i32 0, i32* %17
  store i16 6, i16* @g_20, align 2
  br label %18

; <label>:18                                      ; preds = %38, %0
  %19 = load i16* @g_20, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp slt i32 %20, 8
  br i1 %21, label %22, label %43

; <label>:22                                      ; preds = %18
  store i32 -1, i32* %l_37, align 4
  %23 = load i32** %l_23, align 8
  store i32 1165515285, i32* %23
  store i32 -25, i32* %l_22, align 4
  br label %24

; <label>:24                                      ; preds = %32, %22
  %25 = load i32* %l_22, align 4
  %26 = icmp eq i32 %25, 21
  br i1 %26, label %27, label %37

; <label>:27                                      ; preds = %24
  store i32** null, i32*** %l_35, align 8
  %28 = call i32* @func_28(i32* @g_16)
  %29 = load volatile i32*** @g_33, align 8
  store i32* %28, i32** %29
  %30 = load i32** @g_34, align 8
  %31 = load volatile i32*** @g_36, align 8
  store i32* %30, i32** %31
  br label %32

; <label>:32                                      ; preds = %27
  %33 = load i32* %l_22, align 4
  %34 = trunc i32 %33 to i8
  %35 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %34, i8 signext 1)
  %36 = sext i8 %35 to i32
  store i32 %36, i32* %l_22, align 4
  br label %24

; <label>:37                                      ; preds = %24
  store i8 -1, i8* %1
  br label %53
                                                  ; No predecessors!
  %39 = load i16* @g_20, align 2
  %40 = trunc i16 %39 to i8
  %41 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %40, i8 zeroext 1)
  %42 = zext i8 %41 to i16
  store i16 %42, i16* @g_20, align 2
  br label %18

; <label>:43                                      ; preds = %18
  %44 = load i64* %l_38, align 8
  %45 = load i32** @g_34, align 8
  %46 = load i32* %45
  %47 = sext i32 %46 to i64
  %48 = xor i64 %47, %44
  %49 = trunc i64 %48 to i32
  store i32 %49, i32* %45
  %50 = load i32** %l_23, align 8
  %51 = load i32* %50
  %52 = trunc i32 %51 to i8
  store i8 %52, i8* %1
  br label %53

; <label>:53                                      ; preds = %43, %37
  %54 = load i8* %1
  ret i8 %54
}

define i32 @func_3(i16 zeroext %p_4, i8 signext %p_5, i64 %p_6, i16 zeroext %p_7, i32 %p_8) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %3 = alloca i64, align 8
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  store i16 %p_4, i16* %1, align 2
  store i8 %p_5, i8* %2, align 1
  store i64 %p_6, i64* %3, align 8
  store i16 %p_7, i16* %4, align 2
  store i32 %p_8, i32* %5, align 4
  %6 = load i16* @g_9, align 2
  %7 = zext i16 %6 to i32
  ret i32 %7
}

define signext i8 @func_11(i32 %p_12) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %l_19 = alloca [2 x i16], align 2
  %i = alloca i32, align 4
  %l_15 = alloca i32*, align 8
  %l_18 = alloca i32**, align 8
  %l_17 = alloca i32***, align 8
  %i1 = alloca i32, align 4
  store i32 %p_12, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 %8
  store i16 0, i16* %9, align 2
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  store i16 4, i16* @g_9, align 2
  br label %14

; <label>:14                                      ; preds = %43, %13
  %15 = load i16* @g_9, align 2
  %16 = zext i16 %15 to i32
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %48

; <label>:18                                      ; preds = %14
  store i32* @g_16, i32** %l_15, align 8
  store i32** %l_15, i32*** %l_18, align 8
  store i32*** %l_18, i32**** %l_17, align 8
  %19 = load i16* @g_9, align 2
  %20 = zext i16 %19 to i32
  %21 = load i32** %l_15, align 8
  %22 = load i32* %21
  %23 = or i32 %22, %20
  store i32 %23, i32* %21
  %24 = load i32**** %l_17, align 8
  store i32** %l_15, i32*** %24
  store i16 0, i16* @g_9, align 2
  br label %25

; <label>:25                                      ; preds = %33, %18
  %26 = load i16* @g_9, align 2
  %27 = zext i16 %26 to i32
  %28 = icmp slt i32 %27, 2
  br i1 %28, label %29, label %38

; <label>:29                                      ; preds = %25
  %30 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 0
  %31 = load i16* %30, align 2
  %32 = trunc i16 %31 to i8
  store i8 %32, i8* %1
  br label %74
                                                  ; No predecessors!
  %34 = load i16* @g_9, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %35, 1
  %37 = trunc i32 %36 to i16
  store i16 %37, i16* @g_9, align 2
  br label %25

; <label>:38                                      ; preds = %25
  %39 = load i32* @g_16, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %38
  br label %48

; <label>:42                                      ; preds = %38
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i16* @g_9, align 2
  %45 = zext i16 %44 to i64
  %46 = call i64 @safe_add_func_int64_t_s_s(i64 %45, i64 1)
  %47 = trunc i64 %46 to i16
  store i16 %47, i16* @g_9, align 2
  br label %14

; <label>:48                                      ; preds = %41, %14
  store i16 1, i16* @g_9, align 2
  br label %49

; <label>:49                                      ; preds = %61, %48
  %50 = load i16* @g_9, align 2
  %51 = zext i16 %50 to i32
  %52 = icmp slt i32 %51, 2
  br i1 %52, label %53, label %66

; <label>:53                                      ; preds = %49
  %54 = load i16* @g_9, align 2
  %55 = zext i16 %54 to i32
  %56 = srem i32 %55, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 %57
  %59 = load i16* %58, align 2
  %60 = trunc i16 %59 to i8
  store i8 %60, i8* %1
  br label %74
                                                  ; No predecessors!
  %62 = load i16* @g_9, align 2
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 %63, 1
  %65 = trunc i32 %64 to i16
  store i16 %65, i16* @g_9, align 2
  br label %49

; <label>:66                                      ; preds = %49
  %67 = load i16* @g_9, align 2
  %68 = zext i16 %67 to i32
  %69 = srem i32 %68, 2
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 %70
  %72 = load i16* %71, align 2
  %73 = trunc i16 %72 to i8
  store i8 %73, i8* %1
  br label %74

; <label>:74                                      ; preds = %66, %53, %29
  %75 = load i8* %1
  ret i8 %75
}

define i32* @func_28(i32* %p_29) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %l_31 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %p_29, i32** %2, align 8
  store i32* @g_16, i32** %l_31, align 8
  %3 = load i32** %2, align 8
  %4 = load i32* %3
  %5 = sext i32 %4 to i64
  %6 = xor i64 %5, 721254348
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %3
  store volatile i16 1, i16* @g_2, align 2
  br label %8

; <label>:8                                       ; preds = %33, %0
  %9 = load volatile i16* @g_2, align 2
  %10 = sext i16 %9 to i32
  %11 = icmp slt i32 %10, 5
  br i1 %11, label %12, label %38

; <label>:12                                      ; preds = %8
  store i16 2, i16* @g_20, align 2
  br label %13

; <label>:13                                      ; preds = %27, %12
  %14 = load i16* @g_20, align 2
  %15 = sext i16 %14 to i32
  %16 = icmp slt i32 %15, 4
  br i1 %16, label %17, label %32

; <label>:17                                      ; preds = %13
  store i32 0, i32* @g_16, align 4
  br label %18

; <label>:18                                      ; preds = %23, %17
  %19 = load i32* @g_16, align 4
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %21, label %26

; <label>:21                                      ; preds = %18
  %22 = load i32** %l_31, align 8
  store i32* %22, i32** %1
  br label %39
                                                  ; No predecessors!
  %24 = load i32* @g_16, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* @g_16, align 4
  br label %18

; <label>:26                                      ; preds = %18
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i16* @g_20, align 2
  %29 = sext i16 %28 to i32
  %30 = add nsw i32 %29, 1
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* @g_20, align 2
  br label %13

; <label>:32                                      ; preds = %13
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load volatile i16* @g_2, align 2
  %35 = sext i16 %34 to i32
  %36 = add nsw i32 %35, 5
  %37 = trunc i32 %36 to i16
  store volatile i16 %37, i16* @g_2, align 2
  br label %8

; <label>:38                                      ; preds = %8
  store i32* @g_16, i32** %1
  br label %39

; <label>:39                                      ; preds = %38, %21
  %40 = load i32** %1
  ret i32* %40
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load volatile i16* @g_2, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* @g_9, align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* @g_16, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i16* @g_20, align 2
  %14 = sext i16 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 0, i64 0), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 1, i64 0), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 2, i64 0), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 3, i64 0), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 0, i64 0), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 1, i64 0), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 2, i64 0), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i32 %28)
  %30 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 3, i64 0), align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i32 %30)
  %32 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 0, i64 0), align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i32 %32)
  %34 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 1, i64 0), align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 %34)
  %36 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 2, i64 0), align 4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i32 %36)
  %38 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 3, i64 0), align 4
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i32 %38)
  %40 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 0, i64 0), align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %40)
  %42 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 1, i64 0), align 4
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i32 0, i32 0), i32 %42)
  %44 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 2, i64 0), align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %44)
  %46 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 3, i64 0), align 4
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %46)
  %48 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 0, i64 0), align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %48)
  %50 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 1, i64 0), align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %50)
  %52 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 2, i64 0), align 4
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %52)
  %54 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 3, i64 0), align 4
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %54)
  %56 = load i32* %1
  ret i32 %56
}

declare i32 @printf(i8*, ...)
