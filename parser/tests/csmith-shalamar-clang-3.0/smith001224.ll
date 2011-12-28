; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001224.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i8 8, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_2 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  store i32 -5, i32* %l_2, align 4
  %2 = load i32* %l_2, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %37, label %4

; <label>:4                                       ; preds = %0
  %5 = load i8* @g_3, align 1
  %6 = sext i8 %5 to i32
  %7 = load i8* @g_3, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %18, label %10

; <label>:10                                      ; preds = %4
  %11 = load i8* @g_3, align 1
  %12 = sext i8 %11 to i32
  %13 = load i8* @g_3, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %l_2, align 4
  %16 = xor i32 %14, %15
  %17 = icmp ne i32 %12, %16
  br i1 %17, label %18, label %33

; <label>:18                                      ; preds = %10, %4
  %19 = load i32* %l_2, align 4
  %20 = trunc i32 %19 to i16
  %21 = load i32* %l_2, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %26, label %23

; <label>:23                                      ; preds = %18
  %24 = load i32* %l_2, align 4
  %25 = icmp ne i32 %24, 0
  br label %26

; <label>:26                                      ; preds = %23, %18
  %27 = phi i1 [ true, %18 ], [ %25, %23 ]
  %28 = zext i1 %27 to i32
  %29 = trunc i32 %28 to i16
  %30 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %20, i16 signext %29)
  %31 = sext i16 %30 to i32
  %32 = icmp ne i32 %31, 0
  br label %33

; <label>:33                                      ; preds = %26, %10
  %34 = phi i1 [ false, %10 ], [ %32, %26 ]
  %35 = zext i1 %34 to i32
  %36 = icmp sge i32 %6, %35
  br i1 %36, label %37, label %39

; <label>:37                                      ; preds = %33, %0
  store i32 -4, i32* %l_6, align 4
  %38 = load i32* %l_6, align 4
  store i32 %38, i32* %1
  br label %42

; <label>:39                                      ; preds = %33
  %40 = load i8* @g_3, align 1
  %41 = sext i8 %40 to i32
  store i32 %41, i32* %1
  br label %42

; <label>:42                                      ; preds = %39, %37
  %43 = load i32* %1
  ret i32 %43
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i16* %2, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i16* %1, align 2
  %16 = sext i16 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i16* %1, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16* %2, align 2
  %21 = sext i16 %20 to i32
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i8* @g_3, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* %1
  ret i32 %8
}

declare i32 @printf(i8*, ...)
