; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 9, align 4
@g_7 = global i32 1, align 4
@g_6 = global i32* @g_7, align 8
@g_11 = global [1 x [10 x [5 x i32]]] [[10 x [5 x i32]] [[5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1]]], align 16
@g_15 = constant i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [10 x [5 x i32]]]* @g_11 to i8*), i64 56) to i32*), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][3] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][4] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][2] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][3] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][4] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][1] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][2] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][3] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][4] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][1] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][2] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][3] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][4] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][1] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][2] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][3] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][4] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][0] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][1] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][2] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][3] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][4] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][0] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][1] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][2] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][3] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][4] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][0] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][1] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][2] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][3] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_4 = alloca i16, align 2
  %l_14 = alloca i8, align 1
  %l_10 = alloca i32*, align 8
  store i16 -6, i16* %l_4, align 2
  %1 = load i16* %l_4, align 2
  %2 = trunc i16 %1 to i8
  %3 = load i32* @g_5, align 4
  %4 = trunc i32 %3 to i8
  %5 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %2, i8 zeroext %4)
  %6 = zext i8 %5 to i32
  %7 = load volatile i32** @g_6, align 8
  store i32 %6, i32* %7
  store i32 0, i32* @g_7, align 4
  br label %8

; <label>:8                                       ; preds = %66, %0
  %9 = load i32* @g_7, align 4
  %10 = icmp ne i32 %9, 5
  br i1 %10, label %11, label %71

; <label>:11                                      ; preds = %8
  store i8 21, i8* %l_14, align 1
  %12 = load volatile i32** @g_6, align 8
  %13 = load i32* %12
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %21

; <label>:15                                      ; preds = %11
  store i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), i32** %l_10, align 8
  %16 = load volatile i32** @g_6, align 8
  %17 = load i32* %16
  %18 = load i32** %l_10, align 8
  %19 = load i32* %18
  %20 = and i32 %19, %17
  store i32 %20, i32* %18
  br label %55

; <label>:21                                      ; preds = %11
  %22 = load volatile i32** @g_6, align 8
  %23 = load i32* %22
  %24 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 3), align 4
  %25 = load i8* %l_14, align 1
  %26 = zext i8 %25 to i32
  %27 = icmp slt i32 %24, %26
  %28 = zext i1 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 2), align 4
  %31 = load i8* %l_14, align 1
  %32 = zext i8 %31 to i32
  %33 = or i32 %30, %32
  %34 = sext i32 %33 to i64
  %35 = call i64 @safe_add_func_int64_t_s_s(i64 %29, i64 %34)
  %36 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), align 4
  %37 = sext i32 %36 to i64
  %38 = icmp ne i64 %35, %37
  %39 = zext i1 %38 to i32
  %40 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 2), align 4
  %41 = xor i32 %39, %40
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %21
  %44 = load i32** @g_15, align 8
  %45 = icmp ne i32* %44, @g_7
  br label %46

; <label>:46                                      ; preds = %43, %21
  %47 = phi i1 [ false, %21 ], [ %45, %43 ]
  %48 = zext i1 %47 to i32
  %49 = xor i32 %23, %48
  %50 = load i32** @g_15, align 8
  store i32 %49, i32* %50
  %51 = load i8* %l_14, align 1
  %52 = icmp ne i8 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %46
  br label %71

; <label>:54                                      ; preds = %46
  br label %55

; <label>:55                                      ; preds = %54, %15
  %56 = load i16* %l_4, align 2
  %57 = sext i16 %56 to i32
  %58 = load i32** @g_15, align 8
  %59 = load i32* %58
  %60 = and i32 %59, %57
  store i32 %60, i32* %58
  %61 = load i32** @g_15, align 8
  %62 = load i32* %61
  %63 = sext i32 %62 to i64
  %64 = xor i64 %63, 3997966583
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* %61
  br label %66

; <label>:66                                      ; preds = %55
  %67 = load i32* @g_7, align 4
  %68 = trunc i32 %67 to i8
  %69 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %68, i8 zeroext 1)
  %70 = zext i8 %69 to i32
  store i32 %70, i32* @g_7, align 4
  br label %8

; <label>:71                                      ; preds = %53, %8
  %72 = load i16* %l_4, align 2
  %73 = sext i16 %72 to i32
  ret i32 %73
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = add nsw i32 %4, %6
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_7, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 2), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 3), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 4), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 1), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 2), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 3), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 4), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 0), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 1), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 2), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 3), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 0), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 1), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 2), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 3), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 4), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 0), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 1), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 2), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %53)
  %55 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 3), align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i32 %55)
  %57 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 4), align 4
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0), i32 %57)
  %59 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 0), align 4
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i32 0, i32 0), i32 %59)
  %61 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 1), align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i32 0, i32 0), i32 %61)
  %63 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 2), align 4
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i32 %63)
  %65 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 3), align 4
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i32 0, i32 0), i32 %65)
  %67 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 4), align 4
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i32 %67)
  %69 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 0), align 4
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i32 0, i32 0), i32 %69)
  %71 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 1), align 4
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i32 0, i32 0), i32 %71)
  %73 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 2), align 4
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i32 0, i32 0), i32 %73)
  %75 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 3), align 4
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i32 %75)
  %77 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 4), align 4
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i32 0, i32 0), i32 %77)
  %79 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 0), align 4
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i32 0, i32 0), i32 %79)
  %81 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 1), align 4
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i32 0, i32 0), i32 %81)
  %83 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 2), align 4
  %84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i32 0, i32 0), i32 %83)
  %85 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 3), align 4
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i32 0, i32 0), i32 %85)
  %87 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 4), align 4
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i32 0, i32 0), i32 %87)
  %89 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 0), align 4
  %90 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str42, i32 0, i32 0), i32 %89)
  %91 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 1), align 4
  %92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str43, i32 0, i32 0), i32 %91)
  %93 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 2), align 4
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str44, i32 0, i32 0), i32 %93)
  %95 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 3), align 4
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str45, i32 0, i32 0), i32 %95)
  %97 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 4), align 4
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str46, i32 0, i32 0), i32 %97)
  %99 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 0), align 4
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str47, i32 0, i32 0), i32 %99)
  %101 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 1), align 4
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str48, i32 0, i32 0), i32 %101)
  %103 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 2), align 4
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str49, i32 0, i32 0), i32 %103)
  %105 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 3), align 4
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str50, i32 0, i32 0), i32 %105)
  %107 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 4), align 4
  %108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str51, i32 0, i32 0), i32 %107)
  %109 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), align 4
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %109)
  %111 = load i32* %1
  ret i32 %111
}

declare i32 @printf(i8*, ...)
