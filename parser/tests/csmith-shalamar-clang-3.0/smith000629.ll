; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000629.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_6 = global i32 -2, align 4
@g_5 = global i32* @g_6, align 8
@g_8 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_7 = alloca i32, align 4
  store i32 924345666, i32* %l_7, align 4
  store i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %12, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %17

; <label>:4                                       ; preds = %1
  %5 = load i32* @g_2, align 4
  %6 = sext i32 %5 to i64
  %7 = icmp slt i64 %6, 1118059925
  %8 = zext i1 %7 to i32
  %9 = load volatile i32** @g_5, align 8
  %10 = load i32* %9
  %11 = and i32 %10, %8
  store i32 %11, i32* %9
  br label %12

; <label>:12                                      ; preds = %4
  %13 = load i32* @g_2, align 4
  %14 = trunc i32 %13 to i8
  %15 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %14, i8 signext 4)
  %16 = sext i8 %15 to i32
  store i32 %16, i32* @g_2, align 4
  br label %1

; <label>:17                                      ; preds = %1
  %18 = load i32* %l_7, align 4
  %19 = load i32* %l_7, align 4
  %20 = icmp sge i32 %18, %19
  %21 = zext i1 %20 to i32
  %22 = load volatile i32** @g_8, align 8
  store i32 %21, i32* %22
  %23 = load i32* %l_7, align 4
  ret i32 %23
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
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
