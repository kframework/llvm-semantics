; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001119.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global i8 -93, align 1
@g_8 = global i8 0, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_15 = alloca [4 x [5 x [1 x [1 x i16]]]], align 16
  %l_16 = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i8 -94, i8* %l_16, align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %42, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %45

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %38, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %41

; <label>:9                                       ; preds = %6
  store i32 0, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %34, %9
  %11 = load i32* %k, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %13, label %37

; <label>:13                                      ; preds = %10
  store i32 0, i32* %l, align 4
  br label %14

; <label>:14                                      ; preds = %30, %13
  %15 = load i32* %l, align 4
  %16 = icmp slt i32 %15, 1
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %14
  %18 = load i32* %l, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %k, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %j, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i32 0, i64 %25
  %27 = getelementptr inbounds [5 x [1 x [1 x i16]]]* %26, i32 0, i64 %23
  %28 = getelementptr inbounds [1 x [1 x i16]]* %27, i32 0, i64 %21
  %29 = getelementptr inbounds [1 x i16]* %28, i32 0, i64 %19
  store i16 22799, i16* %29, align 2
  br label %30

; <label>:30                                      ; preds = %17
  %31 = load i32* %l, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %l, align 4
  br label %14

; <label>:33                                      ; preds = %14
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %k, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %k, align 4
  br label %10

; <label>:37                                      ; preds = %10
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i32* %j, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %j, align 4
  br label %6

; <label>:41                                      ; preds = %6
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32* %i, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %i, align 4
  br label %2

; <label>:45                                      ; preds = %2
  %46 = load volatile i8* @g_7, align 1
  %47 = zext i8 %46 to i16
  %48 = load i8* @g_8, align 1
  %49 = sext i8 %48 to i16
  %50 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %47, i16 zeroext %49)
  %51 = load i8* @g_8, align 1
  %52 = sext i8 %51 to i16
  %53 = load i8* @g_8, align 1
  %54 = sext i8 %53 to i32
  %55 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %52, i32 %54)
  %56 = trunc i16 %55 to i8
  %57 = call i32 @func_11(i8 zeroext %56)
  %58 = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i32 0, i64 2
  %59 = getelementptr inbounds [5 x [1 x [1 x i16]]]* %58, i32 0, i64 3
  %60 = getelementptr inbounds [1 x [1 x i16]]* %59, i32 0, i64 0
  %61 = getelementptr inbounds [1 x i16]* %60, i32 0, i64 0
  %62 = load i16* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = load i8* @g_8, align 1
  %65 = call i32 @func_11(i8 zeroext %64)
  %66 = icmp sgt i32 %63, %65
  %67 = zext i1 %66 to i32
  %68 = icmp sgt i32 %57, %67
  %69 = zext i1 %68 to i32
  %70 = trunc i32 %69 to i16
  %71 = getelementptr inbounds [4 x [5 x [1 x [1 x i16]]]]* %l_15, i32 0, i64 2
  %72 = getelementptr inbounds [5 x [1 x [1 x i16]]]* %71, i32 0, i64 3
  %73 = getelementptr inbounds [1 x [1 x i16]]* %72, i32 0, i64 0
  %74 = getelementptr inbounds [1 x i16]* %73, i32 0, i64 0
  %75 = load i16* %74, align 2
  %76 = sext i16 %75 to i32
  %77 = load i8* @g_8, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp sge i32 %76, %78
  %80 = zext i1 %79 to i32
  %81 = load i8* @g_8, align 1
  %82 = call i32 @func_11(i8 zeroext %81)
  %83 = xor i32 %80, %82
  %84 = load i8* @g_8, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp eq i32 %83, %85
  %87 = zext i1 %86 to i32
  %88 = trunc i32 %87 to i16
  %89 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %70, i16 signext %88)
  %90 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %50, i16 signext %89)
  %91 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %90)
  %92 = icmp ne i16 %91, 0
  br i1 %92, label %93, label %96

; <label>:93                                      ; preds = %45
  %94 = load i8* @g_8, align 1
  %95 = sext i8 %94 to i32
  store i32 %95, i32* %1
  br label %99

; <label>:96                                      ; preds = %45
  %97 = load i8* %l_16, align 1
  %98 = zext i8 %97 to i32
  store i32 %98, i32* %1
  br label %99

; <label>:99                                      ; preds = %96, %93
  %100 = load i32* %1
  ret i32 %100
}

define internal zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %ui) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %ui, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
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
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

define i32 @func_11(i8 zeroext %p_12) nounwind uwtable {
  %1 = alloca i8, align 1
  store i8 %p_12, i8* %1, align 1
  %2 = load i8* @g_8, align 1
  %3 = sext i8 %2 to i32
  ret i32 %3
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i16
  ret i16 %15
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i8* @g_7, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i8* @g_8, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
