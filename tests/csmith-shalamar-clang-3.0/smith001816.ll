; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001816.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 0, align 4
@g_11 = global [1 x [8 x i32]] [[8 x i32] [i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_10 = global i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [8 x i32]]* @g_11 to i8*), i64 12) to i32*), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %l_8 = alloca i32, align 4
  store i32 0, i32* %l_8, align 4
  %1 = load i32* %l_8, align 4
  %2 = sext i32 %1 to i64
  %3 = or i64 1, %2
  %4 = trunc i64 %3 to i16
  %5 = load i32* %l_8, align 4
  %6 = trunc i32 %5 to i16
  %7 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %4, i16 signext %6)
  %8 = trunc i16 %7 to i8
  %9 = load i32* @g_9, align 4
  %10 = zext i32 %9 to i64
  %11 = and i64 %10, 1
  %12 = trunc i64 %11 to i8
  %13 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %8, i8 zeroext %12)
  %14 = zext i8 %13 to i16
  %15 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %14, i32 0)
  %16 = icmp ne i16 %15, 0
  br i1 %16, label %17, label %21

; <label>:17                                      ; preds = %0
  br label %18

; <label>:18                                      ; preds = %24, %17
  %19 = load i32* @g_9, align 4
  %20 = load volatile i32** @g_10, align 8
  store i32 %19, i32* %20
  br label %26

; <label>:21                                      ; preds = %0
  %22 = load i32* @g_9, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  br label %18

; <label>:25                                      ; preds = %21
  br label %26

; <label>:26                                      ; preds = %25, %18
  %27 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 0), align 4
  %28 = trunc i32 %27 to i16
  ret i16 %28
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i16
  ret i16 %15
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
  %4 = call signext i16 @func_1()
  %5 = load i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 4), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 5), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 6), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 7), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i32 0, i64 0, i64 3), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %23)
  %25 = load i32* %1
  ret i32 %25
}

declare i32 @printf(i8*, ...)
