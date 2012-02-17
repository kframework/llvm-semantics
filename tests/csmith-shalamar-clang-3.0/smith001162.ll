; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001162.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1931221442, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_5 = alloca i32*, align 8
  store i32* @g_2, i32** %l_5, align 8
  store volatile i32 0, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %9, %0
  %2 = load volatile i32* @g_2, align 4
  %3 = icmp ne i32 %2, 7
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = load volatile i32* @g_2, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %14

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load volatile i32* @g_2, align 4
  %11 = trunc i32 %10 to i8
  %12 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %11, i8 zeroext 4)
  %13 = zext i8 %12 to i32
  store volatile i32 %13, i32* @g_2, align 4
  br label %1

; <label>:14                                      ; preds = %7, %1
  %15 = load volatile i32* @g_2, align 4
  %16 = load i32** %l_5, align 8
  store volatile i32 %15, i32* %16
  %17 = load volatile i32* @g_2, align 4
  ret i32 %17
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
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
