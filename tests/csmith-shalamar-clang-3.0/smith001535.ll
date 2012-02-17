; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001535.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i16 0, align 2
@g_6 = global i32 1, align 4
@g_11 = global [6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]] [[1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][0][0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][1][0][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][2][0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][3][0][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][4][0][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][5][0][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][0][0][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][1][0][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][2][0][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][3][0][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][4][0][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][5][0][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][0][0][0][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][1][0][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][2][0][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][3][0][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][4][0][0][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][5][0][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][0][0][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][1][0][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][2][0][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][3][0][0][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][4][0][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][5][0][0][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][0][0][0][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][1][0][0][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][2][0][0][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][3][0][0][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][4][0][0][0] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][5][0][0][0] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][0][0][0][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][1][0][0][0] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][2][0][0][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][3][0][0][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][4][0][0][0] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][5][0][0][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_2 = alloca [8 x i32*], align 16
  %l_7 = alloca i16, align 2
  %i = alloca i32, align 4
  store i16 1, i16* %l_7, align 2
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i32*]* %l_2, i32 0, i64 %7
  store i32* null, i32** %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store volatile i16 30172, i16* @g_3, align 2
  br label %13

; <label>:13                                      ; preds = %50, %12
  %14 = load volatile i16* @g_3, align 2
  %15 = sext i16 %14 to i32
  %16 = load i32* @g_6, align 4
  %17 = load i32* @g_6, align 4
  %18 = or i32 %16, %17
  %19 = load i32* @g_6, align 4
  %20 = load i16* %l_7, align 2
  %21 = zext i16 %20 to i32
  %22 = icmp ne i32 %19, %21
  %23 = zext i1 %22 to i32
  %24 = icmp ult i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = icmp sge i32 %15, %25
  %27 = zext i1 %26 to i32
  %28 = trunc i32 %27 to i16
  %29 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %28, i32 -10)
  %30 = sext i16 %29 to i32
  %31 = load i32* @g_6, align 4
  %32 = xor i32 %30, %31
  %33 = zext i32 %32 to i64
  %34 = icmp eq i64 %33, 8
  br i1 %34, label %35, label %52

; <label>:35                                      ; preds = %13
  store i32 -9, i32* @g_6, align 4
  br label %36

; <label>:36                                      ; preds = %44, %35
  %37 = load i32* @g_6, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %47

; <label>:39                                      ; preds = %36
  %40 = load i32* @g_6, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39
  br label %47

; <label>:43                                      ; preds = %39
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* @g_6, align 4
  %46 = call i32 @safe_sub_func_uint32_t_u_u(i32 %45, i32 4)
  store i32 %46, i32* @g_6, align 4
  br label %36

; <label>:47                                      ; preds = %42, %36
  %48 = load i32* @g_6, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %47
  br label %13

; <label>:51                                      ; preds = %47
  br label %54

; <label>:52                                      ; preds = %13
  %53 = load volatile i16* @g_3, align 2
  store i16 %53, i16* %1
  br label %60

; <label>:54                                      ; preds = %51
  %55 = load i32* @g_6, align 4
  %56 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %57 = and i32 %56, %55
  store i32 %57, i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %58 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %59 = trunc i32 %58 to i16
  store i16 %59, i16* %1
  br label %60

; <label>:60                                      ; preds = %54, %52
  %61 = load i16* %1
  ret i16 %61
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 32767, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load volatile i16* @g_3, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_6, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str7, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str8, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str9, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str10, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str11, i32 0, i32 0), i32 %28)
  %30 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str12, i32 0, i32 0), i32 %30)
  %32 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str13, i32 0, i32 0), i32 %32)
  %34 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str14, i32 0, i32 0), i32 %34)
  %36 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i32 %36)
  %38 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str16, i32 0, i32 0), i32 %38)
  %40 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str17, i32 0, i32 0), i32 %40)
  %42 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str18, i32 0, i32 0), i32 %42)
  %44 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str19, i32 0, i32 0), i32 %44)
  %46 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str20, i32 0, i32 0), i32 %46)
  %48 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str21, i32 0, i32 0), i32 %48)
  %50 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str22, i32 0, i32 0), i32 %50)
  %52 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str23, i32 0, i32 0), i32 %52)
  %54 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str24, i32 0, i32 0), i32 %54)
  %56 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str25, i32 0, i32 0), i32 %56)
  %58 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str26, i32 0, i32 0), i32 %58)
  %60 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str27, i32 0, i32 0), i32 %60)
  %62 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str28, i32 0, i32 0), i32 %62)
  %64 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str29, i32 0, i32 0), i32 %64)
  %66 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str30, i32 0, i32 0), i32 %66)
  %68 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str31, i32 0, i32 0), i32 %68)
  %70 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str32, i32 0, i32 0), i32 %70)
  %72 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str33, i32 0, i32 0), i32 %72)
  %74 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str34, i32 0, i32 0), i32 %74)
  %76 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str35, i32 0, i32 0), i32 %76)
  %78 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str36, i32 0, i32 0), i32 %78)
  %80 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str37, i32 0, i32 0), i32 %80)
  %82 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str23, i32 0, i32 0), i32 %82)
  %84 = load i32* %1
  ret i32 %84
}

declare i32 @printf(i8*, ...)
