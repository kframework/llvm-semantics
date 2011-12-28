; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000431.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 4, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_7 = alloca i32**, align 8
  %l_6 = alloca i32***, align 8
  store i32** @g_4, i32*** %l_7, align 8
  store i32*** %l_7, i32**** %l_6, align 8
  %1 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext 0, i32 1545096272)
  %2 = sext i16 %1 to i32
  %3 = load volatile i32** @g_4, align 8
  %4 = load i32* %3
  %5 = and i32 %4, %2
  store i32 %5, i32* %3
  %6 = load i32**** %l_6, align 8
  store i32** @g_4, i32*** %6
  %7 = load i32**** %l_6, align 8
  %8 = load i32*** %7
  %9 = load volatile i32** %8
  %10 = load i32* %9
  %11 = trunc i32 %10 to i16
  %12 = load i32* @g_5, align 4
  %13 = trunc i32 %12 to i16
  %14 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %11, i16 zeroext %13)
  %15 = zext i16 %14 to i32
  %16 = load i32**** %l_6, align 8
  %17 = load i32*** %16
  %18 = load volatile i32** %17
  store i32 %15, i32* %18
  %19 = load i32**** %l_6, align 8
  %20 = load i32*** %19
  %21 = load volatile i32** %20
  %22 = load i32* %21
  %23 = sext i32 %22 to i64
  ret i64 %23
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 32767, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_5, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
