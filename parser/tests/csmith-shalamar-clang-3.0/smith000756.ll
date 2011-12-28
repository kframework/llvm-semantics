; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000756.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [3 x [7 x i32]] [[7 x i32] [i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880], [7 x i32] [i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880], [7 x i32] [i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880, i32 1249198880]], align 16
@g_4 = global i32 8, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_2 = alloca [6 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 6
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 %7
  store i8 -9, i8* %8, align 1
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 0, i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  br label %13

; <label>:13                                      ; preds = %20, %12
  %14 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %15 = icmp slt i32 %14, 6
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %13
  %17 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 %18
  store i8 -41, i8* %19, align 1
  br label %20

; <label>:20                                      ; preds = %16
  %21 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  br label %13

; <label>:23                                      ; preds = %13
  store volatile i32 0, i32* @g_4, align 4
  br label %24

; <label>:24                                      ; preds = %30, %23
  %25 = load volatile i32* @g_4, align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %35

; <label>:27                                      ; preds = %24
  %28 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 1
  %29 = load i8* %28, align 1
  store i8 %29, i8* %1
  br label %38
                                                  ; No predecessors!
  %31 = load volatile i32* @g_4, align 4
  %32 = sext i32 %31 to i64
  %33 = call i64 @safe_sub_func_uint64_t_u_u(i64 %32, i64 1)
  %34 = trunc i64 %33 to i32
  store volatile i32 %34, i32* @g_4, align 4
  br label %24

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds [6 x i8]* %l_2, i32 0, i64 3
  %37 = load i8* %36, align 1
  store i8 %37, i8* %1
  br label %38

; <label>:38                                      ; preds = %35, %27
  %39 = load i8* %1
  ret i8 %39
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
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
  %5 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 5), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 1), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 2), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 3), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 4), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 5), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 6), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([3 x [7 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %47)
  %49 = load volatile i32* @g_4, align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str21, i32 0, i32 0), i32 %49)
  %51 = load i32* %1
  ret i32 %51
}

declare i32 @printf(i8*, ...)
