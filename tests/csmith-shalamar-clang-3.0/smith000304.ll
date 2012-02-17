; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000304.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -6, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %l_5 = alloca i32, align 4
  store i32 -816528442, i32* %l_5, align 4
  store i32 29, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %9, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp eq i32 %2, -16
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = load i32* @g_2, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %14

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load i32* @g_2, align 4
  %11 = trunc i32 %10 to i16
  %12 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %11, i16 signext 2)
  %13 = sext i16 %12 to i32
  store i32 %13, i32* @g_2, align 4
  br label %1

; <label>:14                                      ; preds = %7, %1
  %15 = load i32* %l_5, align 4
  %16 = trunc i32 %15 to i8
  ret i8 %16
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
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
  %4 = call signext i8 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
