; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000634.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 736797483, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_5 = alloca i32, align 4
  store i32 1, i32* %l_5, align 4
  store volatile i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp sle i32 %3, -2
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %2
  %6 = load volatile i32* @g_2, align 4
  %7 = load i32* %l_5, align 4
  %8 = or i32 %7, %6
  store i32 %8, i32* %l_5, align 4
  store volatile i32 0, i32* @g_2, align 4
  br label %9

; <label>:9                                       ; preds = %17, %5
  %10 = load volatile i32* @g_2, align 4
  %11 = icmp ne i32 %10, -30
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %9
  %13 = load volatile i32* @g_2, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %12
  br label %22

; <label>:16                                      ; preds = %12
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load volatile i32* @g_2, align 4
  %19 = trunc i32 %18 to i8
  %20 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %19, i8 signext 1)
  %21 = sext i8 %20 to i32
  store volatile i32 %21, i32* @g_2, align 4
  br label %9

; <label>:22                                      ; preds = %15, %9
  %23 = load volatile i32* @g_2, align 4
  %24 = trunc i32 %23 to i16
  store i16 %24, i16* %1
  br label %33
                                                  ; No predecessors!
  %26 = load volatile i32* @g_2, align 4
  %27 = trunc i32 %26 to i16
  %28 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %27, i16 zeroext 5)
  %29 = zext i16 %28 to i32
  store volatile i32 %29, i32* @g_2, align 4
  br label %2

; <label>:30                                      ; preds = %2
  %31 = load volatile i32* @g_2, align 4
  %32 = trunc i32 %31 to i16
  store i16 %32, i16* %1
  br label %33

; <label>:33                                      ; preds = %30, %22
  %34 = load i16* %1
  ret i16 %34
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
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
