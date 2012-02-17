; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001536.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [6 x [7 x i16]] [[7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1]], align 16
@g_3 = global i32* null, align 8
@g_5 = global i32 1521740042, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][2] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][3] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][4] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][5] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][6] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][5] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][6] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][1] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][2] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][3] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][4] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][5] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][6] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_4 = alloca [7 x [1 x [4 x [1 x i32*]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %41, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %44

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %37, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %33, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 4
  br i1 %11, label %12, label %36

; <label>:12                                      ; preds = %9
  store i32 0, i32* %l, align 4
  br label %13

; <label>:13                                      ; preds = %29, %12
  %14 = load i32* %l, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %32

; <label>:16                                      ; preds = %13
  %17 = load i32* %l, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32* %k, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [7 x [1 x [4 x [1 x i32*]]]]* %l_4, i32 0, i64 %24
  %26 = getelementptr inbounds [1 x [4 x [1 x i32*]]]* %25, i32 0, i64 %22
  %27 = getelementptr inbounds [4 x [1 x i32*]]* %26, i32 0, i64 %20
  %28 = getelementptr inbounds [1 x i32*]* %27, i32 0, i64 %18
  store i32* null, i32** %28, align 8
  br label %29

; <label>:29                                      ; preds = %16
  %30 = load i32* %l, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %l, align 4
  br label %13

; <label>:32                                      ; preds = %13
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load i32* %k, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %k, align 4
  br label %9

; <label>:36                                      ; preds = %9
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %5

; <label>:40                                      ; preds = %5
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %1

; <label>:44                                      ; preds = %1
  %45 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 5), align 2
  %46 = sext i16 %45 to i32
  %47 = load i32* @g_5, align 4
  %48 = and i32 %47, %46
  store i32 %48, i32* @g_5, align 4
  %49 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 3), align 2
  %50 = sext i16 %49 to i64
  ret i64 %50
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
  %4 = call i64 @func_1()
  %5 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 0), align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 1), align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 2), align 2
  %12 = sext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 3), align 2
  %15 = sext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 4), align 2
  %18 = sext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 5), align 2
  %21 = sext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 6), align 2
  %24 = sext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 0), align 2
  %27 = sext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 1), align 2
  %30 = sext i16 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 2), align 2
  %33 = sext i16 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %33)
  %35 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 3), align 2
  %36 = sext i16 %35 to i32
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %36)
  %38 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 4), align 2
  %39 = sext i16 %38 to i32
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %39)
  %41 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 5), align 2
  %42 = sext i16 %41 to i32
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %42)
  %44 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 6), align 2
  %45 = sext i16 %44 to i32
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %45)
  %47 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 0), align 2
  %48 = sext i16 %47 to i32
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %48)
  %50 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 1), align 2
  %51 = sext i16 %50 to i32
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %51)
  %53 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 2), align 2
  %54 = sext i16 %53 to i32
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %54)
  %56 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 3), align 2
  %57 = sext i16 %56 to i32
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %57)
  %59 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 4), align 2
  %60 = sext i16 %59 to i32
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %60)
  %62 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 5), align 2
  %63 = sext i16 %62 to i32
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %63)
  %65 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 6), align 2
  %66 = sext i16 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %66)
  %68 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 0), align 2
  %69 = sext i16 %68 to i32
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %69)
  %71 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 1), align 2
  %72 = sext i16 %71 to i32
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %72)
  %74 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 2), align 2
  %75 = sext i16 %74 to i32
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %75)
  %77 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 3), align 2
  %78 = sext i16 %77 to i32
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %78)
  %80 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 4), align 2
  %81 = sext i16 %80 to i32
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %81)
  %83 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 5), align 2
  %84 = sext i16 %83 to i32
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %84)
  %86 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 6), align 2
  %87 = sext i16 %86 to i32
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %87)
  %89 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 0), align 2
  %90 = sext i16 %89 to i32
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %90)
  %92 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 1), align 2
  %93 = sext i16 %92 to i32
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %93)
  %95 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 2), align 2
  %96 = sext i16 %95 to i32
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %96)
  %98 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 3), align 2
  %99 = sext i16 %98 to i32
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %99)
  %101 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 4), align 2
  %102 = sext i16 %101 to i32
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %102)
  %104 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 5), align 2
  %105 = sext i16 %104 to i32
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %105)
  %107 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 6), align 2
  %108 = sext i16 %107 to i32
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %108)
  %110 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 0), align 2
  %111 = sext i16 %110 to i32
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %111)
  %113 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 1), align 2
  %114 = sext i16 %113 to i32
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %114)
  %116 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 2), align 2
  %117 = sext i16 %116 to i32
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %117)
  %119 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 3), align 2
  %120 = sext i16 %119 to i32
  %121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %120)
  %122 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 4), align 2
  %123 = sext i16 %122 to i32
  %124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %123)
  %125 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 5), align 2
  %126 = sext i16 %125 to i32
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %126)
  %128 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 6), align 2
  %129 = sext i16 %128 to i32
  %130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %129)
  %131 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 5), align 2
  %132 = sext i16 %131 to i32
  %133 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %132)
  %134 = load i32* @g_5, align 4
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str42, i32 0, i32 0), i32 %134)
  %136 = load i32* %1
  ret i32 %136
}

declare i32 @printf(i8*, ...)
