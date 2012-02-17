; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001819.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1990901451, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32**, align 8
  store i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %17, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp sgt i32 %2, -15
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32* @g_2, i32** %l_5, align 8
  store i32** %l_5, i32*** %l_6, align 8
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32** %l_5, align 8
  %7 = load i32*** %l_6, align 8
  store i32* %6, i32** %7
  %8 = load i32** %l_5, align 8
  %9 = load i32* %8
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5
  br label %22

; <label>:12                                      ; preds = %5
  %13 = load i32* @g_2, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %12
  br label %5

; <label>:16                                      ; preds = %12
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i32* @g_2, align 4
  %19 = trunc i32 %18 to i8
  %20 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %19, i8 zeroext 1)
  %21 = zext i8 %20 to i32
  store i32 %21, i32* @g_2, align 4
  br label %1

; <label>:22                                      ; preds = %11, %1
  %23 = load i32* @g_2, align 4
  %24 = trunc i32 %23 to i16
  ret i16 %24
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
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
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
