; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000207.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1, align 4
@g_6 = global i32 -103315879, align 4
@g_5 = constant i32* @g_6, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_7 = alloca [2 x [6 x [3 x [2 x [1 x i16]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %52, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %55

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %48, %4
  %6 = load i32* %j, align 4
  %7 = icmp slt i32 %6, 6
  br i1 %7, label %8, label %51

; <label>:8                                       ; preds = %5
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %44, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %47

; <label>:12                                      ; preds = %9
  store i32 0, i32* %l, align 4
  br label %13

; <label>:13                                      ; preds = %40, %12
  %14 = load i32* %l, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %43

; <label>:16                                      ; preds = %13
  store i32 0, i32* %m, align 4
  br label %17

; <label>:17                                      ; preds = %36, %16
  %18 = load i32* %m, align 4
  %19 = icmp slt i32 %18, 1
  br i1 %19, label %20, label %39

; <label>:20                                      ; preds = %17
  %21 = load i32* %m, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %l, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32* %k, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i32 0, i64 %30
  %32 = getelementptr inbounds [6 x [3 x [2 x [1 x i16]]]]* %31, i32 0, i64 %28
  %33 = getelementptr inbounds [3 x [2 x [1 x i16]]]* %32, i32 0, i64 %26
  %34 = getelementptr inbounds [2 x [1 x i16]]* %33, i32 0, i64 %24
  %35 = getelementptr inbounds [1 x i16]* %34, i32 0, i64 %22
  store i16 -9, i16* %35, align 2
  br label %36

; <label>:36                                      ; preds = %20
  %37 = load i32* %m, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %m, align 4
  br label %17

; <label>:39                                      ; preds = %17
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %l, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %l, align 4
  br label %13

; <label>:43                                      ; preds = %13
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %k, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %k, align 4
  br label %9

; <label>:47                                      ; preds = %9
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32* %j, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %j, align 4
  br label %5

; <label>:51                                      ; preds = %5
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %1

; <label>:55                                      ; preds = %1
  %56 = load i32* @g_4, align 4
  %57 = trunc i32 %56 to i8
  %58 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %57, i32 468890265)
  %59 = zext i8 %58 to i64
  %60 = and i64 %59, 3754887628
  %61 = trunc i64 %60 to i32
  %62 = load volatile i32** @g_5, align 8
  store i32 %61, i32* %62
  %63 = getelementptr inbounds [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i32 0, i64 0
  %64 = getelementptr inbounds [6 x [3 x [2 x [1 x i16]]]]* %63, i32 0, i64 1
  %65 = getelementptr inbounds [3 x [2 x [1 x i16]]]* %64, i32 0, i64 2
  %66 = getelementptr inbounds [2 x [1 x i16]]* %65, i32 0, i64 1
  %67 = getelementptr inbounds [1 x i16]* %66, i32 0, i64 0
  %68 = load i16* %67, align 2
  %69 = zext i16 %68 to i32
  ret i32 %69
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %5
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 255, %11
  %13 = icmp sgt i32 %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8, %5, %0
  %15 = load i8* %1, align 1
  %16 = zext i8 %15 to i32
  br label %22

; <label>:17                                      ; preds = %8
  %18 = load i8* %1, align 1
  %19 = zext i8 %18 to i32
  %20 = load i32* %2, align 4
  %21 = shl i32 %19, %20
  br label %22

; <label>:22                                      ; preds = %17, %14
  %23 = phi i32 [ %16, %14 ], [ %21, %17 ]
  %24 = trunc i32 %23 to i8
  ret i8 %24
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
