; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001166.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [7 x [4 x [1 x i32]]] [[4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]], [4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]], [4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]], [4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]], [4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]], [4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]], [4 x [1 x i32]] [[1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1], [1 x i32] [i32 -1]]], align 16
@g_2 = global [2 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([7 x [4 x [1 x i32]]]* @g_3 to i8*), i64 108) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([7 x [4 x [1 x i32]]]* @g_3 to i8*), i64 108) to i32*)], align 16
@g_4 = global [2 x i32**] zeroinitializer, align 16
@g_5 = global [2 x i32**] zeroinitializer, align 16
@g_6 = global i32** getelementptr inbounds ([2 x i32*]* @g_2, i32 0, i32 0), align 8
@.str = private unnamed_addr constant [28 x i8] c"checksum g_3[0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_3[0][1][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_3[0][2][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_3[0][3][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_3[1][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_3[1][1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_3[1][2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_3[1][3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_3[2][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_3[2][1][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_3[2][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_3[2][3][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_3[3][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_3[3][1][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_3[3][2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_3[3][3][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_3[4][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_3[4][1][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_3[4][2][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_3[4][3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_3[5][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_3[5][1][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_3[5][2][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_3[5][3][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_3[6][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [28 x i8] c"checksum g_3[6][1][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [28 x i8] c"checksum g_3[6][2][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [28 x i8] c"checksum g_3[6][3][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = load i32** getelementptr inbounds ([2 x i32*]* @g_2, i32 0, i64 0), align 8
  %2 = load volatile i32*** @g_6, align 8
  store i32* %1, i32** %2
  %3 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 6, i64 3, i64 0), align 4
  %4 = trunc i32 %3 to i16
  ret i16 %4
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
  %4 = call zeroext i16 @func_1()
  %5 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 0, i64 1, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 0, i64 2, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 0, i64 3, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 1, i64 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 1, i64 1, i64 0), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 1, i64 2, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 1, i64 3, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 2, i64 0, i64 0), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 2, i64 1, i64 0), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 2, i64 2, i64 0), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 2, i64 3, i64 0), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 3, i64 0, i64 0), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 3, i64 1, i64 0), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 3, i64 2, i64 0), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 3, i64 3, i64 0), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 4, i64 0, i64 0), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 4, i64 1, i64 0), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 4, i64 2, i64 0), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 4, i64 3, i64 0), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 5, i64 0, i64 0), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 5, i64 1, i64 0), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 5, i64 2, i64 0), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 5, i64 3, i64 0), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 6, i64 0, i64 0), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i32 0, i32 0), i32 %53)
  %55 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 6, i64 1, i64 0), align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str25, i32 0, i32 0), i32 %55)
  %57 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 6, i64 2, i64 0), align 4
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str26, i32 0, i32 0), i32 %57)
  %59 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 6, i64 3, i64 0), align 4
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str27, i32 0, i32 0), i32 %59)
  %61 = load i32* getelementptr inbounds ([7 x [4 x [1 x i32]]]* @g_3, i32 0, i64 6, i64 3, i64 0), align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str27, i32 0, i32 0), i32 %61)
  %63 = load i32* %1
  ret i32 %63
}

declare i32 @printf(i8*, ...)
