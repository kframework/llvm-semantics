; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant [8 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], align 16
@g_8 = global i32* null, align 8
@g_10 = global i32 5, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_7 = alloca i64, align 8
  %l_11 = alloca [5 x [2 x i16]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %l_12 = alloca i32, align 4
  store i64 1, i64* %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x [2 x i16]]* %l_11, i32 0, i64 %13
  %15 = getelementptr inbounds [2 x i16]* %14, i32 0, i64 %11
  store i16 -7, i16* %15, align 2
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  %24 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %25 = trunc i32 %24 to i8
  %26 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %25, i32 -435186401)
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %35, label %29

; <label>:29                                      ; preds = %23
  %30 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 6), align 4
  %31 = trunc i32 %30 to i8
  %32 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext -108, i8 signext %31)
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %60

; <label>:35                                      ; preds = %29, %23
  store i32* @g_10, i32** %l_9, align 8
  %36 = load i64* %l_7, align 8
  %37 = trunc i64 %36 to i32
  %38 = load i32** %l_9, align 8
  store i32 %37, i32* %38
  store i32 0, i32* @g_10, align 4
  br label %39

; <label>:39                                      ; preds = %53, %35
  %40 = load i32* @g_10, align 4
  %41 = icmp slt i32 %40, 5
  br i1 %41, label %42, label %56

; <label>:42                                      ; preds = %39
  store i64 1, i64* %l_7, align 8
  br label %43

; <label>:43                                      ; preds = %49, %42
  %44 = load i64* %l_7, align 8
  %45 = icmp slt i64 %44, 2
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %43
  %47 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 7), align 4
  %48 = trunc i32 %47 to i8
  store i8 %48, i8* %1
  br label %63
                                                  ; No predecessors!
  %50 = load i64* %l_7, align 8
  %51 = add nsw i64 %50, 2
  store i64 %51, i64* %l_7, align 8
  br label %43

; <label>:52                                      ; preds = %43
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load i32* @g_10, align 4
  %55 = add nsw i32 %54, 5
  store i32 %55, i32* @g_10, align 4
  br label %39

; <label>:56                                      ; preds = %39
  %57 = load i32** %l_9, align 8
  %58 = load i32* %57
  %59 = trunc i32 %58 to i8
  store i8 %59, i8* %1
  br label %63

; <label>:60                                      ; preds = %29
  store i32 -409933724, i32* %l_12, align 4
  %61 = load i32* %l_12, align 4
  %62 = trunc i32 %61 to i8
  store i8 %62, i8* %1
  br label %63

; <label>:63                                      ; preds = %60, %56, %46
  %64 = load i8* %1
  ret i8 %64
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i32* @g_10, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %23)
  %25 = load i32* %1
  ret i32 %25
}

declare i32 @printf(i8*, ...)
