; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001920.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1950570959, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_5 = alloca [5 x [8 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x [8 x i32]]* %l_5, i32 0, i64 %13
  %15 = getelementptr inbounds [8 x i32]* %14, i32 0, i64 %11
  store i32 -4, i32* %15, align 4
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
  store i32 0, i32* @g_2, align 4
  br label %24

; <label>:24                                      ; preds = %29, %23
  %25 = load i32* @g_2, align 4
  %26 = icmp sle i32 %25, 0
  br i1 %26, label %27, label %32

; <label>:27                                      ; preds = %24
  %28 = load i32* @g_2, align 4
  store i32 %28, i32* %1
  br label %36
                                                  ; No predecessors!
  %30 = load i32* @g_2, align 4
  %31 = call i32 @safe_sub_func_uint32_t_u_u(i32 %30, i32 6)
  store i32 %31, i32* @g_2, align 4
  br label %24

; <label>:32                                      ; preds = %24
  %33 = getelementptr inbounds [5 x [8 x i32]]* %l_5, i32 0, i64 1
  %34 = getelementptr inbounds [8 x i32]* %33, i32 0, i64 3
  %35 = load i32* %34, align 4
  store i32 %35, i32* %1
  br label %36

; <label>:36                                      ; preds = %32, %27
  %37 = load i32* %1
  ret i32 %37
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
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
