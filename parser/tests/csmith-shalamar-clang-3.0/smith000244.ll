; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000244.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i16 -8012, align 2
@g_8 = global [8 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]], [3 x [1 x i32]] [[1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580], [1 x i32] [i32 -1925412580]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_8[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_8[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_8[0][2][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_8[1][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_8[1][1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_8[1][2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_8[2][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_8[2][1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_8[2][2][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_8[3][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_8[3][1][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_8[3][2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_8[4][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_8[4][1][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_8[4][2][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_8[5][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_8[5][1][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_8[5][2][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_8[6][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_8[6][1][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_8[6][2][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_8[7][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_8[7][1][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_8[7][2][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_7 = alloca i32*, align 8
  store i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 1, i64 0), i32** %l_7, align 8
  %1 = load i16* @g_6, align 2
  %2 = trunc i16 %1 to i8
  %3 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %2, i32 0)
  %4 = zext i8 %3 to i64
  %5 = icmp sge i64 %4, 613181173
  %6 = zext i1 %5 to i32
  %7 = trunc i32 %6 to i8
  %8 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext 0, i8 signext %7)
  %9 = sext i8 %8 to i32
  %10 = load i32** %l_7, align 8
  %11 = load i32* %10
  %12 = xor i32 %11, %9
  store i32 %12, i32* %10
  %13 = load i16* @g_6, align 2
  %14 = icmp ne i16 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  br label %17

; <label>:16                                      ; preds = %0
  br label %17

; <label>:17                                      ; preds = %16, %15
  %18 = load i32** %l_7, align 8
  store i32 9, i32* %18
  %19 = load i32** %l_7, align 8
  store i32 2105282952, i32* %19
  %20 = load i32** %l_7, align 8
  %21 = load i32* %20
  ret i32 %21
}

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i8* %1, align 1
  %16 = sext i8 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i8* %1, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8* %2, align 1
  %21 = sext i8 %20 to i32
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i8
  ret i8 %18
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
  %5 = load i16* @g_6, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 0, i64 0, i64 0), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 0, i64 1, i64 0), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 0, i64 2, i64 0), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 1, i64 0, i64 0), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 1, i64 1, i64 0), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 1, i64 2, i64 0), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 2, i64 0, i64 0), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 2, i64 1, i64 0), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 2, i64 2, i64 0), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 3, i64 0, i64 0), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 3, i64 1, i64 0), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %28)
  %30 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 3, i64 2, i64 0), align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %30)
  %32 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 4, i64 0, i64 0), align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %32)
  %34 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 4, i64 1, i64 0), align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %34)
  %36 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 4, i64 2, i64 0), align 4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i32 0, i32 0), i32 %36)
  %38 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 5, i64 0, i64 0), align 4
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i32 0, i32 0), i32 %38)
  %40 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 5, i64 1, i64 0), align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i32 0, i32 0), i32 %40)
  %42 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 5, i64 2, i64 0), align 4
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i32 0, i32 0), i32 %42)
  %44 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 6, i64 0, i64 0), align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i32 0, i32 0), i32 %44)
  %46 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 6, i64 1, i64 0), align 4
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i32 0, i32 0), i32 %46)
  %48 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 6, i64 2, i64 0), align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i32 0, i32 0), i32 %48)
  %50 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 0, i64 0), align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i32 0, i32 0), i32 %50)
  %52 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 1, i64 0), align 4
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %52)
  %54 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 2, i64 0), align 4
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i32 0, i32 0), i32 %54)
  %56 = load i32* getelementptr inbounds ([8 x [3 x [1 x i32]]]* @g_8, i32 0, i64 7, i64 1, i64 0), align 4
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %56)
  %58 = load i32* %1
  ret i32 %58
}

declare i32 @printf(i8*, ...)
