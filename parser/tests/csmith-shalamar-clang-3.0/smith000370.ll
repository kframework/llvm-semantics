; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000370.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i32 -2, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_16 = alloca [3 x [6 x i16]], align 16
  %l_23 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* @g_8, i32** %l_23, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %15, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 6
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 %12
  %14 = getelementptr inbounds [6 x i16]* %13, i32 0, i64 %10
  store i16 22506, i16* %14, align 2
  br label %15

; <label>:15                                      ; preds = %8
  %16 = load i32* %j, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %j, align 4
  br label %5

; <label>:18                                      ; preds = %5
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %1

; <label>:22                                      ; preds = %1
  %23 = load i32* @g_8, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %22
  %26 = load i32* @g_8, align 4
  %27 = icmp ne i32 %26, 0
  br label %28

; <label>:28                                      ; preds = %25, %22
  %29 = phi i1 [ false, %22 ], [ %27, %25 ]
  %30 = zext i1 %29 to i32
  %31 = trunc i32 %30 to i16
  %32 = load i32* @g_8, align 4
  %33 = trunc i32 %32 to i16
  %34 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 0
  %35 = getelementptr inbounds [6 x i16]* %34, i32 0, i64 1
  %36 = load i16* %35, align 2
  %37 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 0
  %38 = getelementptr inbounds [6 x i16]* %37, i32 0, i64 1
  %39 = load i16* %38, align 2
  %40 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %36, i16 signext %39)
  %41 = sext i16 %40 to i32
  %42 = getelementptr inbounds [3 x [6 x i16]]* %l_16, i32 0, i64 2
  %43 = getelementptr inbounds [6 x i16]* %42, i32 0, i64 3
  %44 = load i16* %43, align 2
  %45 = trunc i16 %44 to i8
  %46 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %45, i32 -1178413535)
  %47 = sext i8 %46 to i32
  %48 = icmp sge i32 %41, %47
  br i1 %48, label %62, label %49

; <label>:49                                      ; preds = %28
  %50 = load i32* @g_8, align 4
  %51 = trunc i32 %50 to i8
  %52 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %51, i32 2)
  %53 = sext i8 %52 to i16
  %54 = load i32** %l_23, align 8
  %55 = load i32** %l_23, align 8
  %56 = icmp eq i32* %54, %55
  %57 = zext i1 %56 to i32
  %58 = trunc i32 %57 to i16
  %59 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %53, i16 signext %58)
  %60 = sext i16 %59 to i32
  %61 = icmp ne i32 %60, 0
  br label %62

; <label>:62                                      ; preds = %49, %28
  %63 = phi i1 [ true, %28 ], [ %61, %49 ]
  %64 = zext i1 %63 to i32
  %65 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext 0, i32 %64)
  %66 = trunc i16 %65 to i8
  %67 = load i32* @g_8, align 4
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %73

; <label>:69                                      ; preds = %62
  %70 = load i32** %l_23, align 8
  %71 = load i32* %70
  %72 = icmp ne i32 %71, 0
  br label %73

; <label>:73                                      ; preds = %69, %62
  %74 = phi i1 [ false, %62 ], [ %72, %69 ]
  %75 = zext i1 %74 to i32
  %76 = trunc i32 %75 to i8
  %77 = load i32** %l_23, align 8
  %78 = load i32* %77
  %79 = trunc i32 %78 to i8
  %80 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %76, i8 zeroext %79)
  %81 = zext i8 %80 to i64
  %82 = call i64 @safe_mod_func_uint64_t_u_u(i64 %81, i64 0)
  %83 = trunc i64 %82 to i32
  %84 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %66, i32 %83)
  %85 = sext i8 %84 to i16
  %86 = call i32 @func_2(i32 -1, i16 zeroext %31, i16 zeroext %33, i16 zeroext %85)
  %87 = load i32** %l_23, align 8
  store i32 %86, i32* %87
  %88 = load i32* @g_8, align 4
  ret i32 %88
}

define i32 @func_2(i32 %p_3, i16 zeroext %p_4, i16 zeroext %p_5, i16 zeroext %p_6) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %l_7 = alloca i32*, align 8
  %l_9 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  store i32 %p_3, i32* %1, align 4
  store i16 %p_4, i16* %2, align 2
  store i16 %p_5, i16* %3, align 2
  store i16 %p_6, i16* %4, align 2
  store i32* @g_8, i32** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [4 x i32]* %l_9, i32 0, i64 %10
  store i32 1726319874, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  %16 = load i32* %1, align 4
  %17 = load i32** %l_7, align 8
  store i32 %16, i32* %17
  %18 = load i32** %l_7, align 8
  store i32 0, i32* %18
  %19 = getelementptr inbounds [4 x i32]* %l_9, i32 0, i64 2
  %20 = load i32* %19, align 4
  ret i32 %20
}

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 127, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i8* %1, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i8
  ret i8 %28
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 65535, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i16* %1, align 2
  %16 = zext i16 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i16* %1, align 2
  %19 = zext i16 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i16
  ret i16 %24
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i8
  ret i8 %22
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

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 127, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal i64 @safe_mod_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
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
  %10 = urem i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_8, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
