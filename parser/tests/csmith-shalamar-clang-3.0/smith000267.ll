; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000267.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16 }

@g_2 = global [3 x %struct.S0] [%struct.S0 { i16 -7 }, %struct.S0 { i16 -7 }, %struct.S0 { i16 -7 }], align 2
@g_3 = global [8 x [5 x i32]] [[5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070], [5 x i32] [i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070, i32 -500997070]], align 16
@g_4 = global [7 x [2 x i32]] [[2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 -1, i32 -1]], align 16
@g_7 = global i32 -1472885804, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0].f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[1].f0 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[2].f0 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][2] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][3] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][4] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][4] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][1] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][2] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][3] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][4] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][0] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][1] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][2] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][3] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_3[6][4] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][0] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][1] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][2] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][3] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_3[7][4] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][0] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][1] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][0] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][1] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][0] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][1] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][1] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][0] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][1] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][0] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][1] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][0] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][1] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 1, i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  br label %2

; <label>:2                                       ; preds = %32, %0
  %3 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %35

; <label>:5                                       ; preds = %2
  store i32 -25, i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  br label %6

; <label>:6                                       ; preds = %26, %5
  %7 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %8 = icmp sge i32 %7, 9
  br i1 %8, label %9, label %31

; <label>:9                                       ; preds = %6
  store volatile i32 29, i32* @g_7, align 4
  br label %10

; <label>:10                                      ; preds = %18, %9
  %11 = load volatile i32* @g_7, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %21

; <label>:13                                      ; preds = %10
  %14 = load volatile i32* @g_7, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  br label %21

; <label>:17                                      ; preds = %13
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load volatile i32* @g_7, align 4
  %20 = call i32 @safe_sub_func_uint32_t_u_u(i32 %19, i32 1)
  store volatile i32 %20, i32* @g_7, align 4
  br label %10

; <label>:21                                      ; preds = %16, %10
  %22 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 4, i64 1), align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  br label %26

; <label>:25                                      ; preds = %21
  br label %26

; <label>:26                                      ; preds = %25, %24
  %27 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %28 = trunc i32 %27 to i16
  %29 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %28, i16 zeroext 1)
  %30 = zext i16 %29 to i32
  store i32 %30, i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  br label %6

; <label>:31                                      ; preds = %6
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %34 = add nsw i32 %33, 3
  store i32 %34, i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  br label %2

; <label>:35                                      ; preds = %2
  store volatile i32 0, i32* @g_7, align 4
  br label %36

; <label>:36                                      ; preds = %41, %35
  %37 = load volatile i32* @g_7, align 4
  %38 = icmp slt i32 %37, 24
  br i1 %38, label %39, label %46

; <label>:39                                      ; preds = %36
  %40 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 5, i64 0), align 4
  store i32 %40, i32* %1
  br label %54
                                                  ; No predecessors!
  %42 = load volatile i32* @g_7, align 4
  %43 = trunc i32 %42 to i8
  %44 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %43, i8 signext 1)
  %45 = sext i8 %44 to i32
  store volatile i32 %45, i32* @g_7, align 4
  br label %36

; <label>:46                                      ; preds = %36
  %47 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %48 = urem i32 %47, 3
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [3 x %struct.S0]* @g_2, i32 0, i64 %49
  %51 = getelementptr inbounds %struct.S0* %50, i32 0, i32 0
  %52 = load i16* %51, align 2
  %53 = sext i16 %52 to i32
  store i32 %53, i32* %1
  br label %54

; <label>:54                                      ; preds = %46, %39
  %55 = load i32* %1
  ret i32 %55
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

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
  %4 = call i32 @func_1()
  %5 = load i16* getelementptr inbounds ([3 x %struct.S0]* @g_2, i32 0, i64 0, i32 0), align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([3 x %struct.S0]* @g_2, i32 0, i64 1, i32 0), align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([3 x %struct.S0]* @g_2, i32 0, i64 2, i32 0), align 2
  %12 = sext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %28)
  %30 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %30)
  %32 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %32)
  %34 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 0), align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %34)
  %36 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 1), align 4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %36)
  %38 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 2), align 4
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %38)
  %40 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 3), align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %40)
  %42 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 2, i64 4), align 4
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %42)
  %44 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 0), align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %44)
  %46 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 1), align 4
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %46)
  %48 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 2), align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %48)
  %50 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 3), align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %50)
  %52 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 3, i64 4), align 4
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %52)
  %54 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 0), align 4
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %54)
  %56 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 1), align 4
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %56)
  %58 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 2), align 4
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %58)
  %60 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 3), align 4
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %60)
  %62 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 4, i64 4), align 4
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %62)
  %64 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 0), align 4
  %65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %64)
  %66 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 1), align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %66)
  %68 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 2), align 4
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %68)
  %70 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 3), align 4
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %70)
  %72 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 5, i64 4), align 4
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %72)
  %74 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 0), align 4
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %74)
  %76 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 1), align 4
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %76)
  %78 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 2), align 4
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %78)
  %80 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 3), align 4
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %80)
  %82 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 6, i64 4), align 4
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %82)
  %84 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 0), align 4
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %84)
  %86 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 1), align 4
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %86)
  %88 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 2), align 4
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %88)
  %90 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 3), align 4
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %90)
  %92 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 7, i64 4), align 4
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %92)
  %94 = load i32* getelementptr inbounds ([8 x [5 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %94)
  %96 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 0, i64 0), align 4
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %96)
  %98 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 0, i64 1), align 4
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %98)
  %100 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 0), align 4
  %101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %100)
  %102 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %102)
  %104 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 2, i64 0), align 4
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %104)
  %106 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 2, i64 1), align 4
  %107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %106)
  %108 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 3, i64 0), align 4
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i32 0, i32 0), i32 %108)
  %110 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 3, i64 1), align 4
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i32 0, i32 0), i32 %110)
  %112 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 4, i64 0), align 4
  %113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i32 0, i32 0), i32 %112)
  %114 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 4, i64 1), align 4
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i32 0, i32 0), i32 %114)
  %116 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 5, i64 0), align 4
  %117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i32 0, i32 0), i32 %116)
  %118 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 5, i64 1), align 4
  %119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i32 0, i32 0), i32 %118)
  %120 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 6, i64 0), align 4
  %121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i32 0, i32 0), i32 %120)
  %122 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 6, i64 1), align 4
  %123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i32 0, i32 0), i32 %122)
  %124 = load i32* getelementptr inbounds ([7 x [2 x i32]]* @g_4, i32 0, i64 1, i64 1), align 4
  %125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %124)
  %126 = load volatile i32* @g_7, align 4
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str57, i32 0, i32 0), i32 %126)
  %128 = load i32* %1
  ret i32 %128
}

declare i32 @printf(i8*, ...)
