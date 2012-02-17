; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000968.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [5 x i32*] zeroinitializer, align 16
@g_7 = global [8 x [3 x [1 x [1 x i32]]]] [[3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]]], align 16
@.str = private unnamed_addr constant [31 x i8] c"checksum g_7[0][0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"checksum g_7[0][1][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"checksum g_7[0][2][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"checksum g_7[1][0][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c"checksum g_7[1][1][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"checksum g_7[1][2][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"checksum g_7[2][0][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"checksum g_7[2][1][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"checksum g_7[2][2][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"checksum g_7[3][0][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"checksum g_7[3][1][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"checksum g_7[3][2][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [31 x i8] c"checksum g_7[4][0][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [31 x i8] c"checksum g_7[4][1][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [31 x i8] c"checksum g_7[4][2][0][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [31 x i8] c"checksum g_7[5][0][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [31 x i8] c"checksum g_7[5][1][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [31 x i8] c"checksum g_7[5][2][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [31 x i8] c"checksum g_7[6][0][0][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [31 x i8] c"checksum g_7[6][1][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [31 x i8] c"checksum g_7[6][2][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [31 x i8] c"checksum g_7[7][0][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [31 x i8] c"checksum g_7[7][1][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [31 x i8] c"checksum g_7[7][2][0][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_6 = alloca [2 x i32*], align 16
  %l_8 = alloca i32**, align 8
  %i = alloca i32, align 4
  store i32** null, i32*** %l_8, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [2 x i32*]* %l_6, i32 0, i64 %6
  store i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), i32** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = getelementptr inbounds [2 x i32*]* %l_6, i32 0, i64 1
  %13 = load i32** %12, align 8
  %14 = icmp eq i32* %13, null
  %15 = zext i1 %14 to i32
  %16 = trunc i32 %15 to i8
  %17 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 2, i64 0, i64 0), align 4
  %18 = trunc i32 %17 to i16
  %19 = call i32* @func_2(i8 signext %16, i16 signext %18)
  store i32* %19, i32** getelementptr inbounds ([5 x i32*]* @g_5, i32 0, i64 0), align 8
  %20 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  ret i32 %20
}

define i32* @func_2(i8 signext %p_3, i16 signext %p_4) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i16, align 2
  store i8 %p_3, i8* %1, align 1
  store i16 %p_4, i16* %2, align 2
  %3 = load i32** getelementptr inbounds ([5 x i32*]* @g_5, i32 0, i64 1), align 8
  ret i32* %3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 0, i64 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 0, i64 1, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 0, i64 2, i64 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 1, i64 0, i64 0, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 1, i64 1, i64 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 1, i64 2, i64 0, i64 0), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 2, i64 0, i64 0, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 2, i64 1, i64 0, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 2, i64 2, i64 0, i64 0), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 1, i64 0, i64 0), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 2, i64 0, i64 0), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 0, i64 0, i64 0), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 1, i64 0, i64 0), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 2, i64 0, i64 0), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 5, i64 0, i64 0, i64 0), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 5, i64 1, i64 0, i64 0), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 5, i64 2, i64 0, i64 0), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 6, i64 0, i64 0, i64 0), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 6, i64 1, i64 0, i64 0), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 6, i64 2, i64 0, i64 0), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 7, i64 1, i64 0, i64 0), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 7, i64 2, i64 0, i64 0), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %53)
  %55 = load i32* %1
  ret i32 %55
}

declare i32 @printf(i8*, ...)
