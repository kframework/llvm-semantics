; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001831.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -9, align 4
@g_8 = global i32 1372024187, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_10 = alloca i16, align 2
  store i16 -1, i16* %l_10, align 2
  store i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %14, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp sgt i32 %2, 7
  br i1 %3, label %4, label %19

; <label>:4                                       ; preds = %1
  br label %5

; <label>:5                                       ; preds = %22, %4
  %6 = load i32* @g_2, align 4
  %7 = sext i32 %6 to i64
  %8 = call i64 @safe_div_func_uint64_t_u_u(i64 %7, i64 -2)
  %9 = load volatile i32** @g_7, align 8
  %10 = load i32* %9
  %11 = sext i32 %10 to i64
  %12 = xor i64 %11, %8
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %9
  br label %14

; <label>:14                                      ; preds = %5
  %15 = load i32* @g_2, align 4
  %16 = trunc i32 %15 to i8
  %17 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %16, i8 zeroext 1)
  %18 = zext i8 %17 to i32
  store i32 %18, i32* @g_2, align 4
  br label %1

; <label>:19                                      ; preds = %1
  %20 = load i32* @g_2, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  br label %5

; <label>:23                                      ; preds = %19
  %24 = load i16* %l_10, align 2
  %25 = sext i16 %24 to i32
  ret i32 %25
}

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i64* %1, align 8
  %9 = load i64* %2, align 8
  %10 = udiv i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
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
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_8, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
