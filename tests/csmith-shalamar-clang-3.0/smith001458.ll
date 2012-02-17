; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001458.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [2 x [6 x i32]] [[6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@g_3 = global i32 635938415, align 4
@g_4 = global i32 0, align 4
@g_12 = global i32* bitcast (i8* getelementptr (i8* bitcast ([2 x [6 x i32]]* @g_2 to i8*), i64 44) to i32*), align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_11 = alloca i32*, align 8
  %l_10 = alloca [2 x i32**], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = load volatile i32* @g_4, align 4
  %3 = urem i32 %2, 6
  %4 = zext i32 %3 to i64
  %5 = load i32* @g_3, align 4
  %6 = urem i32 %5, 2
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [2 x [6 x i32]]* @g_2, i32 0, i64 %7
  %9 = getelementptr inbounds [6 x i32]* %8, i32 0, i64 %4
  store i32* %9, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %17, %0
  %11 = load i32* %i, align 4
  %12 = icmp slt i32 %11, 2
  br i1 %12, label %13, label %20

; <label>:13                                      ; preds = %10
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [2 x i32**]* %l_10, i32 0, i64 %15
  store i32** %l_11, i32*** %16, align 8
  br label %17

; <label>:17                                      ; preds = %13
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %10

; <label>:20                                      ; preds = %10
  store i32 1, i32* @g_3, align 4
  br label %21

; <label>:21                                      ; preds = %35, %20
  %22 = load i32* @g_3, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %24, label %38

; <label>:24                                      ; preds = %21
  store volatile i32 1, i32* @g_4, align 4
  br label %25

; <label>:25                                      ; preds = %31, %24
  %26 = load volatile i32* @g_4, align 4
  %27 = icmp slt i32 %26, 6
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %25
  %29 = load volatile i32* @g_4, align 4
  %30 = trunc i32 %29 to i8
  store i8 %30, i8* %1
  br label %50
                                                  ; No predecessors!
  %32 = load volatile i32* @g_4, align 4
  %33 = add nsw i32 %32, 4
  store volatile i32 %33, i32* @g_4, align 4
  br label %25

; <label>:34                                      ; preds = %25
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32* @g_3, align 4
  %37 = add nsw i32 %36, 2
  store i32 %37, i32* @g_3, align 4
  br label %21

; <label>:38                                      ; preds = %21
  %39 = load volatile i32* @g_4, align 4
  %40 = urem i32 %39, 6
  %41 = zext i32 %40 to i64
  %42 = load i32* @g_3, align 4
  %43 = urem i32 %42, 2
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [2 x [6 x i32]]* @g_2, i32 0, i64 %44
  %46 = getelementptr inbounds [6 x i32]* %45, i32 0, i64 %41
  %47 = call i32* @func_5(i32* @g_3, i32* @g_3, i32* %46, i16 signext 7)
  store i32* %47, i32** @g_12, align 8
  %48 = load i32* @g_3, align 4
  %49 = trunc i32 %48 to i8
  store i8 %49, i8* %1
  br label %50

; <label>:50                                      ; preds = %38, %28
  %51 = load i8* %1
  ret i8 %51
}

define i32* @func_5(i32* %p_6, i32* %p_7, i32* %p_8, i16 signext %p_9) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i16, align 2
  store i32* %p_6, i32** %1, align 8
  store i32* %p_7, i32** %2, align 8
  store i32* %p_8, i32** %3, align 8
  store i16 %p_9, i16* %4, align 2
  %5 = load i32** %3, align 8
  ret i32* %5
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
  %4 = call zeroext i8 @func_1()
  %5 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 2), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 3), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 4), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* @g_3, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load volatile i32* @g_4, align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* %1
  ret i32 %33
}

declare i32 @printf(i8*, ...)
