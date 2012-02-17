; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000035.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 -4, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca i32, align 4
  %l_7 = alloca i32*, align 8
  %l_8 = alloca i32*, align 8
  %l_5 = alloca i32*, align 8
  store i32 221752643, i32* %l_2, align 4
  store i32* null, i32** %l_7, align 8
  store i32* %l_2, i32** %l_8, align 8
  store i32 1595784908, i32* %l_2, align 4
  store i32 -5, i32* %l_2, align 4
  br label %1

; <label>:1                                       ; preds = %10, %0
  %2 = load i32* %l_2, align 4
  %3 = icmp sge i32 %2, -27
  br i1 %3, label %4, label %13

; <label>:4                                       ; preds = %1
  store i32* %l_2, i32** %l_5, align 8
  %5 = load i32** %l_5, align 8
  %6 = load i32* %5
  %7 = sext i32 %6 to i64
  %8 = xor i64 %7, 2426108200
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %5
  br label %10

; <label>:10                                      ; preds = %4
  %11 = load i32* %l_2, align 4
  %12 = call i32 @safe_sub_func_uint32_t_u_u(i32 %11, i32 1)
  store i32 %12, i32* %l_2, align 4
  br label %1

; <label>:13                                      ; preds = %1
  %14 = load volatile i32* @g_6, align 4
  %15 = load i32** %l_8, align 8
  %16 = load i32* %15
  %17 = xor i32 %16, %14
  store i32 %17, i32* %15
  %18 = load volatile i32* @g_6, align 4
  ret i32 %18
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_6, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
