; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001295.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i16 -28066, align 2
@g_12 = global i32 -868071568, align 4
@g_11 = constant i32* @g_12, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_6 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %l_10 = alloca [5 x [3 x [6 x i32]]], align 16
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 %7
  store i32 -2101511396, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 1
  %14 = load i32* %13, align 4
  %15 = trunc i32 %14 to i16
  %16 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 1
  %17 = load i32* %16, align 4
  %18 = getelementptr inbounds [3 x i32]* %l_6, i32 0, i64 1
  %19 = load i32* %18, align 4
  %20 = icmp ule i32 %17, %19
  br i1 %20, label %26, label %21

; <label>:21                                      ; preds = %12
  %22 = load i16* @g_9, align 2
  %23 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %22, i32 1)
  %24 = sext i16 %23 to i32
  %25 = icmp ne i32 %24, 0
  br label %26

; <label>:26                                      ; preds = %21, %12
  %27 = phi i1 [ true, %12 ], [ %25, %21 ]
  %28 = xor i1 %27, true
  %29 = zext i1 %28 to i32
  %30 = trunc i32 %29 to i16
  %31 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %15, i16 zeroext %30)
  %32 = load i16* @g_9, align 2
  %33 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %31, i16 zeroext %32)
  %34 = zext i16 %33 to i64
  %35 = xor i64 %34, 410561473
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %26
  %38 = load i16* @g_9, align 2
  %39 = zext i16 %38 to i64
  store i64 %39, i64* %1
  br label %83

; <label>:40                                      ; preds = %26
  store i32 0, i32* %i1, align 4
  br label %41

; <label>:41                                      ; preds = %70, %40
  %42 = load i32* %i1, align 4
  %43 = icmp slt i32 %42, 5
  br i1 %43, label %44, label %73

; <label>:44                                      ; preds = %41
  store i32 0, i32* %j, align 4
  br label %45

; <label>:45                                      ; preds = %66, %44
  %46 = load i32* %j, align 4
  %47 = icmp slt i32 %46, 3
  br i1 %47, label %48, label %69

; <label>:48                                      ; preds = %45
  store i32 0, i32* %k, align 4
  br label %49

; <label>:49                                      ; preds = %62, %48
  %50 = load i32* %k, align 4
  %51 = icmp slt i32 %50, 6
  br i1 %51, label %52, label %65

; <label>:52                                      ; preds = %49
  %53 = load i32* %k, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32* %j, align 4
  %56 = sext i32 %55 to i64
  %57 = load i32* %i1, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [5 x [3 x [6 x i32]]]* %l_10, i32 0, i64 %58
  %60 = getelementptr inbounds [3 x [6 x i32]]* %59, i32 0, i64 %56
  %61 = getelementptr inbounds [6 x i32]* %60, i32 0, i64 %54
  store i32 -7, i32* %61, align 4
  br label %62

; <label>:62                                      ; preds = %52
  %63 = load i32* %k, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %k, align 4
  br label %49

; <label>:65                                      ; preds = %49
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load i32* %j, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %j, align 4
  br label %45

; <label>:69                                      ; preds = %45
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load i32* %i1, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %i1, align 4
  br label %41

; <label>:73                                      ; preds = %41
  %74 = getelementptr inbounds [5 x [3 x [6 x i32]]]* %l_10, i32 0, i64 3
  %75 = getelementptr inbounds [3 x [6 x i32]]* %74, i32 0, i64 2
  %76 = getelementptr inbounds [6 x i32]* %75, i32 0, i64 3
  %77 = load i32* %76, align 4
  %78 = load volatile i32** @g_11, align 8
  %79 = load i32* %78
  %80 = and i32 %79, %77
  store i32 %80, i32* %78
  %81 = load i32* @g_12, align 4
  %82 = sext i32 %81 to i64
  store i64 %82, i64* %1
  br label %83

; <label>:83                                      ; preds = %73, %37
  %84 = load i64* %1
  ret i64 %84
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
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

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 32767, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i16* %1, align 2
  %17 = sext i16 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i16* %1, align 2
  %20 = sext i16 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
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
  %4 = call i64 @func_1()
  %5 = load i16* @g_9, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_12, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
