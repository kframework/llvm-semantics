; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001275.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -878530592, align 4
@g_6 = global [7 x [2 x [1 x i8]]] [[2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"]], align 1
@g_7 = global i32 0, align 4
@g_8 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_6[1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_6[1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_6[2][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_6[2][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_6[3][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_6[3][1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_6[4][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_6[4][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_6[5][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_6[5][1][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_6[6][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_6[6][1][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_9 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_5 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [3 x i32]* %l_9, i32 0, i64 %7
  store i32 -1418275319, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 0, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %19, %12
  %14 = load i32* @g_2, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %13
  store i32 -7, i32* %l_5, align 4
  %17 = load i32* %l_5, align 4
  %18 = trunc i32 %17 to i16
  store i16 %18, i16* %1
  br label %86
                                                  ; No predecessors!
  %20 = load i32* @g_2, align 4
  %21 = call i32 @safe_add_func_int32_t_s_s(i32 %20, i32 1)
  store i32 %21, i32* @g_2, align 4
  br label %13

; <label>:22                                      ; preds = %13
  store i32 1, i32* @g_2, align 4
  br label %23

; <label>:23                                      ; preds = %46, %22
  %24 = load i32* @g_2, align 4
  %25 = icmp slt i32 %24, 7
  br i1 %25, label %26, label %49

; <label>:26                                      ; preds = %23
  store i32 0, i32* @g_7, align 4
  br label %27

; <label>:27                                      ; preds = %42, %26
  %28 = load i32* @g_7, align 4
  %29 = icmp slt i32 %28, 2
  br i1 %29, label %30, label %45

; <label>:30                                      ; preds = %27
  store volatile i32 0, i32* @g_8, align 4
  br label %31

; <label>:31                                      ; preds = %38, %30
  %32 = load volatile i32* @g_8, align 4
  %33 = icmp slt i32 %32, 1
  br i1 %33, label %34, label %41

; <label>:34                                      ; preds = %31
  %35 = getelementptr inbounds [3 x i32]* %l_9, i32 0, i64 2
  %36 = load i32* %35, align 4
  %37 = trunc i32 %36 to i16
  store i16 %37, i16* %1
  br label %86
                                                  ; No predecessors!
  %39 = load volatile i32* @g_8, align 4
  %40 = add nsw i32 %39, 1
  store volatile i32 %40, i32* @g_8, align 4
  br label %31

; <label>:41                                      ; preds = %31
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* @g_7, align 4
  %44 = add nsw i32 %43, 2
  store i32 %44, i32* @g_7, align 4
  br label %27

; <label>:45                                      ; preds = %27
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* @g_2, align 4
  %48 = add nsw i32 %47, 6
  store i32 %48, i32* @g_2, align 4
  br label %23

; <label>:49                                      ; preds = %23
  store i32 0, i32* @g_2, align 4
  br label %50

; <label>:50                                      ; preds = %79, %49
  %51 = load i32* @g_2, align 4
  %52 = icmp slt i32 %51, 7
  br i1 %52, label %53, label %82

; <label>:53                                      ; preds = %50
  store volatile i32 0, i32* @g_8, align 4
  br label %54

; <label>:54                                      ; preds = %75, %53
  %55 = load volatile i32* @g_8, align 4
  %56 = icmp slt i32 %55, 2
  br i1 %56, label %57, label %78

; <label>:57                                      ; preds = %54
  store i32 0, i32* @g_7, align 4
  br label %58

; <label>:58                                      ; preds = %71, %57
  %59 = load i32* @g_7, align 4
  %60 = icmp slt i32 %59, 1
  br i1 %60, label %61, label %74

; <label>:61                                      ; preds = %58
  %62 = load i32* @g_7, align 4
  %63 = sext i32 %62 to i64
  %64 = load volatile i32* @g_8, align 4
  %65 = sext i32 %64 to i64
  %66 = load i32* @g_2, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 %67
  %69 = getelementptr inbounds [2 x [1 x i8]]* %68, i32 0, i64 %65
  %70 = getelementptr inbounds [1 x i8]* %69, i32 0, i64 %63
  store i8 8, i8* %70, align 1
  br label %71

; <label>:71                                      ; preds = %61
  %72 = load i32* @g_7, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* @g_7, align 4
  br label %58

; <label>:74                                      ; preds = %58
  br label %75

; <label>:75                                      ; preds = %74
  %76 = load volatile i32* @g_8, align 4
  %77 = add nsw i32 %76, 1
  store volatile i32 %77, i32* @g_8, align 4
  br label %54

; <label>:78                                      ; preds = %54
  br label %79

; <label>:79                                      ; preds = %78
  %80 = load i32* @g_2, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* @g_2, align 4
  br label %50

; <label>:82                                      ; preds = %50
  %83 = getelementptr inbounds [3 x i32]* %l_9, i32 0, i64 2
  %84 = load i32* %83, align 4
  %85 = trunc i32 %84 to i16
  store i16 %85, i16* %1
  br label %86

; <label>:86                                      ; preds = %82, %34, %16
  %87 = load i16* %1
  ret i16 %87
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %1, align 4
  %10 = load i32* %2, align 4
  %11 = sub nsw i32 2147483647, %10
  %12 = icmp sgt i32 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i32* %2, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i32* %1, align 4
  %21 = load i32* %2, align 4
  %22 = sub nsw i32 -2147483648, %21
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i32* %1, align 4
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i32* %1, align 4
  %28 = load i32* %2, align 4
  %29 = add nsw i32 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i32 [ %25, %24 ], [ %29, %26 ]
  ret i32 %31
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
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 0, i64 0, i64 0), align 1
  %8 = zext i8 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 1
  %11 = zext i8 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 1, i64 0, i64 0), align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 1, i64 1, i64 0), align 1
  %17 = zext i8 %16 to i32
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %17)
  %19 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 2, i64 0, i64 0), align 1
  %20 = zext i8 %19 to i32
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %20)
  %22 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 2, i64 1, i64 0), align 1
  %23 = zext i8 %22 to i32
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %23)
  %25 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 3, i64 0, i64 0), align 1
  %26 = zext i8 %25 to i32
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %26)
  %28 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 3, i64 1, i64 0), align 1
  %29 = zext i8 %28 to i32
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %29)
  %31 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 4, i64 0, i64 0), align 1
  %32 = zext i8 %31 to i32
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %32)
  %34 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 4, i64 1, i64 0), align 1
  %35 = zext i8 %34 to i32
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %35)
  %37 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 5, i64 0, i64 0), align 1
  %38 = zext i8 %37 to i32
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %38)
  %40 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 5, i64 1, i64 0), align 1
  %41 = zext i8 %40 to i32
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %41)
  %43 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 6, i64 0, i64 0), align 1
  %44 = zext i8 %43 to i32
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %44)
  %46 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 6, i64 1, i64 0), align 1
  %47 = zext i8 %46 to i32
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %47)
  %49 = load i32* @g_7, align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str15, i32 0, i32 0), i32 %49)
  %51 = load volatile i32* @g_8, align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str16, i32 0, i32 0), i32 %51)
  %53 = load i32* %1
  ret i32 %53
}

declare i32 @printf(i8*, ...)
