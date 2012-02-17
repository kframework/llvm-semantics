; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000981.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [6 x [8 x i32]] [[8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881]], align 16
@g_5 = global [10 x [1 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][7] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][1] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][2] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][3] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][4] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][5] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][6] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][7] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][1] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][2] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][3] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][4] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][5] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][6] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][7] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][1] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][2] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][3] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][4] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][5] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][6] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][7] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][0] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][1] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][2] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][3] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][4] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][5] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][6] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][7] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][0] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_5[4][0] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_5[5][0] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_5[6][0] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_5[7][0] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_5[8][0] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [25 x i8] c"checksum g_5[9][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_2 = alloca [5 x i32], align 16
  %l_4 = alloca [4 x i32*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [5 x i32]* %l_2, i32 0, i64 %7
  store i32 -332526347, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %20, %12
  %14 = load i32* %i, align 4
  %15 = icmp slt i32 %14, 4
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %13
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x i32*]* %l_4, i32 0, i64 %18
  store i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 8, i64 0), i32** %19, align 8
  br label %20

; <label>:20                                      ; preds = %16
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %13

; <label>:23                                      ; preds = %13
  store volatile i32 3, i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  br label %24

; <label>:24                                      ; preds = %29, %23
  %25 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %32

; <label>:27                                      ; preds = %24
  %28 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  store i32 %28, i32* %1
  br label %34
                                                  ; No predecessors!
  %30 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  %31 = add nsw i32 %30, -1
  store volatile i32 %31, i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  br label %24

; <label>:32                                      ; preds = %24
  store i32 -1156469557, i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 8, i64 0), align 4
  %33 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 5, i64 0), align 4
  store i32 %33, i32* %1
  br label %34

; <label>:34                                      ; preds = %32, %27
  %35 = load i32* %1
  ret i32 %35
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
  %4 = call i32 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 5), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 1, i64 7), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 1), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 2), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 3), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 4), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 5), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 6), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 2, i64 7), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %53)
  %55 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 1), align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %55)
  %57 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 2), align 4
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %57)
  %59 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 3), align 4
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %59)
  %61 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 4), align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %61)
  %63 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 5), align 4
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %63)
  %65 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 6), align 4
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %65)
  %67 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 7), align 4
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %67)
  %69 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 0), align 4
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %69)
  %71 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 1), align 4
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %71)
  %73 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 2), align 4
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %73)
  %75 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 3), align 4
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %75)
  %77 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 4), align 4
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %77)
  %79 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 5), align 4
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %79)
  %81 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 6), align 4
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %81)
  %83 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 4, i64 7), align 4
  %84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %83)
  %85 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 0), align 4
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %85)
  %87 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 1), align 4
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %87)
  %89 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 2), align 4
  %90 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %89)
  %91 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 3), align 4
  %92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %91)
  %93 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 4), align 4
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %93)
  %95 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 5), align 4
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %95)
  %97 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 6), align 4
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %97)
  %99 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 5, i64 7), align 4
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %99)
  %101 = load volatile i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %101)
  %103 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 0, i64 0), align 4
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %103)
  %105 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 1, i64 0), align 4
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i32 0, i32 0), i32 %105)
  %107 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 2, i64 0), align 4
  %108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i32 0, i32 0), i32 %107)
  %109 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 3, i64 0), align 4
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i32 0, i32 0), i32 %109)
  %111 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 4, i64 0), align 4
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i32 0, i32 0), i32 %111)
  %113 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 5, i64 0), align 4
  %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i32 0, i32 0), i32 %113)
  %115 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 6, i64 0), align 4
  %116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i32 0, i32 0), i32 %115)
  %117 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 7, i64 0), align 4
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i32 0, i32 0), i32 %117)
  %119 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 8, i64 0), align 4
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i32 0, i32 0), i32 %119)
  %121 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 9, i64 0), align 4
  %122 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str57, i32 0, i32 0), i32 %121)
  %123 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i32 0, i64 8, i64 0), align 4
  %124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i32 0, i32 0), i32 %123)
  %125 = load i32* %1
  ret i32 %125
}

declare i32 @printf(i8*, ...)
