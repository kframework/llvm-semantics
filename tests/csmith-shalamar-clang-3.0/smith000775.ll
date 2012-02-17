; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000775.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -1239700647, align 4
@g_8 = global i32* @g_9, align 8
@g_11 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_4 = alloca i64, align 8
  %l_10 = alloca i32*, align 8
  store i64 0, i64* %l_4, align 8
  store i32* @g_11, i32** %l_10, align 8
  %1 = load i64* %l_4, align 8
  %2 = trunc i64 %1 to i16
  %3 = load volatile i32* @g_9, align 4
  %4 = call i32 @func_5(i32 %3)
  %5 = trunc i32 %4 to i16
  %6 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %2, i16 zeroext %5)
  %7 = zext i16 %6 to i32
  %8 = load i32** %l_10, align 8
  %9 = load i32* %8
  %10 = xor i32 %9, %7
  store i32 %10, i32* %8
  %11 = load i32** %l_10, align 8
  %12 = load i32* %11
  %13 = trunc i32 %12 to i8
  ret i8 %13
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

define i32 @func_5(i32 %p_6) nounwind uwtable {
  %1 = alloca i32, align 4
  %l_7 = alloca [9 x i32**], align 16
  %i = alloca i32, align 4
  store i32 %p_6, i32* %1, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 9
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [9 x i32**]* %l_7, i32 0, i64 %7
  store i32** null, i32*** %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32* null, i32** @g_8, align 8
  %13 = load i32* %1, align 4
  ret i32 %13
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load volatile i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_11, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
