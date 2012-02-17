; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001777.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 427756073, align 4
@g_7 = global [9 x [2 x i8]] [[2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF"], align 16
@g_10 = global [6 x [1 x [5 x i32]]] [[1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]]], align 16
@g_9 = global i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [5 x i32]]]* @g_10 to i8*), i64 20) to i32*), align 8
@g_13 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_7[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_7[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_7[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_7[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_7[2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_7[2][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_7[3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_7[3][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_7[4][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_7[4][1] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_7[5][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_7[5][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_7[6][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_7[6][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_7[7][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_7[7][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_7[8][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_7[8][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][2] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][3] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][4] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][1] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][2] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][3] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][4] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][1] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][2] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][3] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][4] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][1] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][2] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][3] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][4] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][0] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][1] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][2] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][3] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][4] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][0] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][1] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][2] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][3] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_14 = alloca i16, align 2
  %l_8 = alloca i32, align 4
  store i16 -1, i16* %l_14, align 2
  store volatile i32 -24, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %42, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %47

; <label>:4                                       ; preds = %1
  store i32 0, i32* %l_8, align 4
  %5 = load volatile i32* @g_2, align 4
  %6 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %7 = zext i8 %6 to i32
  %8 = xor i32 %7, -1
  %9 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %10 = icmp ne i8 %9, 0
  %11 = xor i1 %10, true
  %12 = zext i1 %11 to i32
  %13 = icmp sle i32 %8, %12
  %14 = zext i1 %13 to i32
  %15 = load i32* %l_8, align 4
  %16 = xor i32 %14, %15
  %17 = and i32 %5, %16
  %18 = trunc i32 %17 to i8
  %19 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 3, i64 1), align 1
  %20 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %18, i8 signext %19)
  %21 = sext i8 %20 to i32
  %22 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %23 = zext i8 %22 to i32
  %24 = icmp sle i32 %21, %23
  %25 = zext i1 %24 to i32
  %26 = load volatile i32** @g_9, align 8
  store i32 %25, i32* %26
  store i32 11, i32* %l_8, align 4
  br label %27

; <label>:27                                      ; preds = %38, %4
  %28 = load i32* %l_8, align 4
  %29 = icmp sge i32 %28, 12
  br i1 %29, label %30, label %41

; <label>:30                                      ; preds = %27
  store i32** @g_9, i32*** @g_13, align 8
  %31 = load i32*** @g_13, align 8
  %32 = load volatile i32** %31
  %33 = load i32* %32
  %34 = load i16* %l_14, align 2
  %35 = zext i16 %34 to i32
  %36 = or i32 %35, %33
  %37 = trunc i32 %36 to i16
  store i16 %37, i16* %l_14, align 2
  br label %38

; <label>:38                                      ; preds = %30
  %39 = load i32* %l_8, align 4
  %40 = call i32 @safe_add_func_uint32_t_u_u(i32 %39, i32 3)
  store i32 %40, i32* %l_8, align 4
  br label %27

; <label>:41                                      ; preds = %27
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load volatile i32* @g_2, align 4
  %44 = trunc i32 %43 to i16
  %45 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %44, i16 signext 9)
  %46 = sext i16 %45 to i32
  store volatile i32 %46, i32* @g_2, align 4
  br label %1

; <label>:47                                      ; preds = %1
  %48 = load i16* %l_14, align 2
  %49 = trunc i16 %48 to i8
  ret i8 %49
}

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
  %4 = call signext i8 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 0, i64 0), align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 0, i64 1), align 1
  %11 = zext i8 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 1, i64 0), align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 1, i64 1), align 1
  %17 = zext i8 %16 to i32
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %17)
  %19 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 2, i64 0), align 1
  %20 = zext i8 %19 to i32
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %20)
  %22 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 2, i64 1), align 1
  %23 = zext i8 %22 to i32
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %23)
  %25 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 3, i64 0), align 1
  %26 = zext i8 %25 to i32
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %26)
  %28 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 3, i64 1), align 1
  %29 = zext i8 %28 to i32
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %29)
  %31 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %32 = zext i8 %31 to i32
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %32)
  %34 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 1), align 1
  %35 = zext i8 %34 to i32
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %35)
  %37 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 5, i64 0), align 1
  %38 = zext i8 %37 to i32
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %38)
  %40 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 5, i64 1), align 1
  %41 = zext i8 %40 to i32
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %41)
  %43 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 6, i64 0), align 1
  %44 = zext i8 %43 to i32
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %44)
  %46 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 6, i64 1), align 1
  %47 = zext i8 %46 to i32
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %47)
  %49 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 7, i64 0), align 1
  %50 = zext i8 %49 to i32
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %50)
  %52 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 7, i64 1), align 1
  %53 = zext i8 %52 to i32
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %53)
  %55 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 8, i64 0), align 1
  %56 = zext i8 %55 to i32
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %56)
  %58 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 8, i64 1), align 1
  %59 = zext i8 %58 to i32
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %59)
  %61 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %62 = zext i8 %61 to i32
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %62)
  %64 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 0), align 4
  %65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %64)
  %66 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 1), align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %66)
  %68 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 2), align 4
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %68)
  %70 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 3), align 4
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %70)
  %72 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 4), align 4
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %72)
  %74 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 0), align 4
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %74)
  %76 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 1), align 4
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i32 %76)
  %78 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 2), align 4
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0), i32 %78)
  %80 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 3), align 4
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i32 0, i32 0), i32 %80)
  %82 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 4), align 4
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i32 0, i32 0), i32 %82)
  %84 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 0), align 4
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i32 %84)
  %86 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 1), align 4
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i32 0, i32 0), i32 %86)
  %88 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 2), align 4
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i32 %88)
  %90 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 3), align 4
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i32 0, i32 0), i32 %90)
  %92 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 4), align 4
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i32 0, i32 0), i32 %92)
  %94 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 0), align 4
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i32 0, i32 0), i32 %94)
  %96 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 1), align 4
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i32 %96)
  %98 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 2), align 4
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i32 0, i32 0), i32 %98)
  %100 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 3), align 4
  %101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i32 0, i32 0), i32 %100)
  %102 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 4), align 4
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i32 0, i32 0), i32 %102)
  %104 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 0), align 4
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i32 0, i32 0), i32 %104)
  %106 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 1), align 4
  %107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i32 0, i32 0), i32 %106)
  %108 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 2), align 4
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i32 0, i32 0), i32 %108)
  %110 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 3), align 4
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str42, i32 0, i32 0), i32 %110)
  %112 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 4), align 4
  %113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str43, i32 0, i32 0), i32 %112)
  %114 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 0), align 4
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str44, i32 0, i32 0), i32 %114)
  %116 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 1), align 4
  %117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str45, i32 0, i32 0), i32 %116)
  %118 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 2), align 4
  %119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str46, i32 0, i32 0), i32 %118)
  %120 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 3), align 4
  %121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str47, i32 0, i32 0), i32 %120)
  %122 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 4), align 4
  %123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str48, i32 0, i32 0), i32 %122)
  %124 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 0), align 4
  %125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %124)
  %126 = load i32* %1
  ret i32 %126
}

declare i32 @printf(i8*, ...)
