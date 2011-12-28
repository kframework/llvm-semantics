; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001082.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 511789939, align 4
@g_7 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %l_5 = alloca i64, align 8
  %l_6 = alloca i32*, align 8
  store i64 -1, i64* %l_5, align 8
  store i32* @g_7, i32** %l_6, align 8
  %1 = load i32* @g_2, align 4
  %2 = load i32* @g_2, align 4
  %3 = zext i32 %2 to i64
  %4 = icmp ne i64 %3, 1
  %5 = zext i1 %4 to i32
  %6 = icmp ugt i32 %1, %5
  %7 = zext i1 %6 to i32
  %8 = load i64* %l_5, align 8
  %9 = trunc i64 %8 to i32
  %10 = load i64* %l_5, align 8
  %11 = trunc i64 %10 to i32
  %12 = call i32 @safe_div_func_uint32_t_u_u(i32 %9, i32 %11)
  %13 = icmp ugt i32 %7, %12
  %14 = zext i1 %13 to i32
  %15 = load i32** %l_6, align 8
  store i32 %14, i32* %15
  %16 = load i32** %l_6, align 8
  %17 = load i32* %16
  %18 = sext i32 %17 to i64
  ret i64 %18
}

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = udiv i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_7, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
