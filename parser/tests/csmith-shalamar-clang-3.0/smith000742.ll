; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000742.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -4, align 4
@g_5 = global [10 x [10 x [1 x i32*]]] [[10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]], [10 x [1 x i32*]] [[1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2], [1 x i32*] [i32* @g_2]]], align 16
@g_6 = global [5 x [10 x [1 x [2 x [1 x [1 x i32*]]]]]] [[10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]], [10 x [1 x [2 x [1 x [1 x i32*]]]]] [[1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], [1 x [2 x [1 x [1 x i32*]]]] [[2 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]]]], align 16
@g_11 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_7 = alloca i8, align 1
  %l_10 = alloca [9 x [3 x [2 x [1 x i16]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 -25, i32* @g_2, align 4
  br label %1

; <label>:1                                       ; preds = %10, %0
  %2 = load i32* @g_2, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %15

; <label>:4                                       ; preds = %1
  store i8 -7, i8* %l_7, align 1
  %5 = load i32* @g_2, align 4
  %6 = sext i32 %5 to i64
  %7 = icmp slt i64 799321460, %6
  %8 = zext i1 %7 to i32
  %9 = trunc i32 %8 to i8
  store i8 %9, i8* %l_7, align 1
  br label %10

; <label>:10                                      ; preds = %4
  %11 = load i32* @g_2, align 4
  %12 = trunc i32 %11 to i8
  %13 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %12, i8 zeroext 1)
  %14 = zext i8 %13 to i32
  store i32 %14, i32* @g_2, align 4
  br label %1

; <label>:15                                      ; preds = %1
  store i32 -14, i32* @g_2, align 4
  br label %16

; <label>:16                                      ; preds = %71, %15
  %17 = load i32* @g_2, align 4
  %18 = icmp eq i32 %17, -21
  br i1 %18, label %19, label %76

; <label>:19                                      ; preds = %16
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %60, %19
  %21 = load i32* %i, align 4
  %22 = icmp slt i32 %21, 9
  br i1 %22, label %23, label %63

; <label>:23                                      ; preds = %20
  store i32 0, i32* %j, align 4
  br label %24

; <label>:24                                      ; preds = %56, %23
  %25 = load i32* %j, align 4
  %26 = icmp slt i32 %25, 3
  br i1 %26, label %27, label %59

; <label>:27                                      ; preds = %24
  store i32 0, i32* %k, align 4
  br label %28

; <label>:28                                      ; preds = %52, %27
  %29 = load i32* %k, align 4
  %30 = icmp slt i32 %29, 2
  br i1 %30, label %31, label %55

; <label>:31                                      ; preds = %28
  store i32 0, i32* %l, align 4
  br label %32

; <label>:32                                      ; preds = %48, %31
  %33 = load i32* %l, align 4
  %34 = icmp slt i32 %33, 1
  br i1 %34, label %35, label %51

; <label>:35                                      ; preds = %32
  %36 = load i32* %l, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32* %k, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32* %j, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [9 x [3 x [2 x [1 x i16]]]]* %l_10, i32 0, i64 %43
  %45 = getelementptr inbounds [3 x [2 x [1 x i16]]]* %44, i32 0, i64 %41
  %46 = getelementptr inbounds [2 x [1 x i16]]* %45, i32 0, i64 %39
  %47 = getelementptr inbounds [1 x i16]* %46, i32 0, i64 %37
  store i16 -7, i16* %47, align 2
  br label %48

; <label>:48                                      ; preds = %35
  %49 = load i32* %l, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %l, align 4
  br label %32

; <label>:51                                      ; preds = %32
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %k, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %k, align 4
  br label %28

; <label>:55                                      ; preds = %28
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32* %j, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %j, align 4
  br label %24

; <label>:59                                      ; preds = %24
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %20

; <label>:63                                      ; preds = %20
  %64 = getelementptr inbounds [9 x [3 x [2 x [1 x i16]]]]* %l_10, i32 0, i64 7
  %65 = getelementptr inbounds [3 x [2 x [1 x i16]]]* %64, i32 0, i64 0
  %66 = getelementptr inbounds [2 x [1 x i16]]* %65, i32 0, i64 1
  %67 = getelementptr inbounds [1 x i16]* %66, i32 0, i64 0
  %68 = load i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = load volatile i32** @g_11, align 8
  store i32 %69, i32* %70
  br label %71

; <label>:71                                      ; preds = %63
  %72 = load i32* @g_2, align 4
  %73 = trunc i32 %72 to i16
  %74 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %73, i16 signext 6)
  %75 = sext i16 %74 to i32
  store i32 %75, i32* @g_2, align 4
  br label %16

; <label>:76                                      ; preds = %16
  %77 = load volatile i32** @g_11, align 8
  %78 = load i32* %77
  ret i32 %78
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
