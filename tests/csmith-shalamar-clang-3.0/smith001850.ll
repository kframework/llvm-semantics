; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001850.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_9 = global [8 x [6 x i32]] [[6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220]], align 16
@g_12 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][2] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][3] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][4] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][5] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][2] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][3] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][4] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][5] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][1] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][2] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][3] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][4] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][5] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][0] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][1] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][2] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][3] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][4] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][5] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][0] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][1] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][2] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][3] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][4] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][5] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][0] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][1] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][2] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][3] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][4] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_5 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 4
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %6
  store i32 -1, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 -21, i32* @g_2, align 4
  br label %12

; <label>:12                                      ; preds = %46, %11
  %13 = load i32* @g_2, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %51

; <label>:15                                      ; preds = %12
  store i32 1, i32* @g_2, align 4
  br label %16

; <label>:16                                      ; preds = %42, %15
  %17 = load i32* @g_2, align 4
  %18 = icmp slt i32 %17, 4
  br i1 %18, label %19, label %45

; <label>:19                                      ; preds = %16
  store i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), i32** %l_8, align 8
  %20 = load i32* @g_2, align 4
  %21 = trunc i32 %20 to i16
  %22 = load i32* @g_2, align 4
  %23 = urem i32 %22, 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %24
  %26 = load i32* %25, align 4
  %27 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %21, i32 %26)
  %28 = zext i16 %27 to i32
  %29 = load i32** %l_8, align 8
  store i32 %28, i32* %29
  %30 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 1), align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %19
  br label %45

; <label>:33                                      ; preds = %19
  %34 = load i32** %l_8, align 8
  %35 = load i32* %34
  %36 = sext i32 %35 to i64
  %37 = xor i64 433591417, %36
  %38 = trunc i64 %37 to i32
  %39 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext 1, i32 %38)
  %40 = sext i8 %39 to i32
  %41 = load i32** %l_8, align 8
  store i32 %40, i32* %41
  br label %42

; <label>:42                                      ; preds = %33
  %43 = load i32* @g_2, align 4
  %44 = add nsw i32 %43, 2
  store i32 %44, i32* @g_2, align 4
  br label %16

; <label>:45                                      ; preds = %32, %16
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* @g_2, align 4
  %48 = trunc i32 %47 to i8
  %49 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %48, i8 signext 1)
  %50 = sext i8 %49 to i32
  store i32 %50, i32* @g_2, align 4
  br label %12

; <label>:51                                      ; preds = %12
  %52 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), align 4
  %53 = load volatile i32** @g_12, align 8
  %54 = load i32* %53
  %55 = or i32 %54, %52
  store i32 %55, i32* %53
  %56 = load i32* @g_2, align 4
  %57 = trunc i32 %56 to i16
  ret i16 %57
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i16
  ret i16 %15
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
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 4), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 5), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 1), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 2), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 3), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 5), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 0), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 1), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 2), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 3), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 4), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 5), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 0), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 1), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 2), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 3), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 4), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 5), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %53)
  %55 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 0), align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %55)
  %57 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 1), align 4
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %57)
  %59 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 2), align 4
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %59)
  %61 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 3), align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %61)
  %63 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 4), align 4
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %63)
  %65 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 5), align 4
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %65)
  %67 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 0), align 4
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %67)
  %69 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 1), align 4
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %69)
  %71 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 2), align 4
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %71)
  %73 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 3), align 4
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %73)
  %75 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 4), align 4
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %75)
  %77 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 5), align 4
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %77)
  %79 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 0), align 4
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %79)
  %81 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 1), align 4
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %81)
  %83 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 2), align 4
  %84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %83)
  %85 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 3), align 4
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %85)
  %87 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 4), align 4
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %87)
  %89 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 5), align 4
  %90 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %89)
  %91 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 0), align 4
  %92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %91)
  %93 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 1), align 4
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %93)
  %95 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 2), align 4
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %95)
  %97 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 3), align 4
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %97)
  %99 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 4), align 4
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %99)
  %101 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 5), align 4
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %101)
  %103 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), align 4
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %103)
  %105 = load i32* %1
  ret i32 %105
}

declare i32 @printf(i8*, ...)
