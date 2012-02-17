; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001917.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 1384573041, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  store i32 -1, i32* %l_4, align 4
  store i32* @g_6, i32** %l_5, align 8
  %1 = load i32* %l_4, align 4
  %2 = trunc i32 %1 to i8
  %3 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %2, i32 -10)
  %4 = zext i8 %3 to i32
  %5 = load i32** %l_5, align 8
  %6 = load i32* %5
  %7 = or i32 %6, %4
  store i32 %7, i32* %5
  %8 = load i32* @g_6, align 4
  %9 = load i32** %l_5, align 8
  store i32 %8, i32* %9
  %10 = load i32** %l_5, align 8
  %11 = load i32* %10
  ret i32 %11
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i8
  ret i8 %15
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_6, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
