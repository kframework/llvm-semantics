; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000578.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 2111604215, align 4
@g_8 = global i32 1492875018, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_10 = alloca i32*, align 8
  %l_9 = alloca i32**, align 8
  %l_11 = alloca i32***, align 8
  %l_12 = alloca i16, align 2
  %l_7 = alloca i32*, align 8
  store i32* null, i32** %l_10, align 8
  store i32** %l_10, i32*** %l_9, align 8
  store i32*** %l_9, i32**** %l_11, align 8
  store i16 1, i16* %l_12, align 2
  store volatile i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %10, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp sge i32 %2, -24
  br i1 %3, label %4, label %15

; <label>:4                                       ; preds = %1
  store i32* @g_8, i32** %l_7, align 8
  %5 = load volatile i32* @g_2, align 4
  %6 = trunc i32 %5 to i8
  %7 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %6, i32 9)
  %8 = sext i8 %7 to i32
  %9 = load i32** %l_7, align 8
  store i32 %8, i32* %9
  br label %10

; <label>:10                                      ; preds = %4
  %11 = load volatile i32* @g_2, align 4
  %12 = trunc i32 %11 to i8
  %13 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %12, i8 signext 8)
  %14 = sext i8 %13 to i32
  store volatile i32 %14, i32* @g_2, align 4
  br label %1

; <label>:15                                      ; preds = %1
  %16 = load i32*** %l_9, align 8
  %17 = load i32**** %l_11, align 8
  store i32** %16, i32*** %17
  %18 = load i16* %l_12, align 2
  %19 = trunc i16 %18 to i8
  ret i8 %19
}

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 127, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i8* %1, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i8
  ret i8 %28
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_8, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
