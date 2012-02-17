; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001241.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_5 = alloca [6 x [7 x i8]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 6
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 7
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [6 x [7 x i8]]* %l_5, i32 0, i64 %13
  %15 = getelementptr inbounds [7 x i8]* %14, i32 0, i64 %11
  store i8 0, i8* %15, align 1
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  store volatile i32 0, i32* @g_2, align 4
  br label %24

; <label>:24                                      ; preds = %32, %23
  %25 = load volatile i32* @g_2, align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %35

; <label>:27                                      ; preds = %24
  %28 = getelementptr inbounds [6 x [7 x i8]]* %l_5, i32 0, i64 1
  %29 = getelementptr inbounds [7 x i8]* %28, i32 0, i64 3
  %30 = load i8* %29, align 1
  %31 = sext i8 %30 to i16
  store i16 %31, i16* %1
  br label %40
                                                  ; No predecessors!
  %33 = load volatile i32* @g_2, align 4
  %34 = call i32 @safe_add_func_uint32_t_u_u(i32 %33, i32 1)
  store volatile i32 %34, i32* @g_2, align 4
  br label %24

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds [6 x [7 x i8]]* %l_5, i32 0, i64 1
  %37 = getelementptr inbounds [7 x i8]* %36, i32 0, i64 3
  %38 = load i8* %37, align 1
  %39 = sext i8 %38 to i16
  store i16 %39, i16* %1
  br label %40

; <label>:40                                      ; preds = %35, %27
  %41 = load i16* %1
  ret i16 %41
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add i32 %3, %4
  ret i32 %5
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
