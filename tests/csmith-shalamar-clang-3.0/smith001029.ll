; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001029.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_5 = alloca [6 x i64], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 6
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [6 x i64]* %l_5, i32 0, i64 %7
  store i64 2670192184585374386, i64* %8, align 8
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 0, i32* @g_2, align 4
  br label %13

; <label>:13                                      ; preds = %20, %12
  %14 = load i32* @g_2, align 4
  %15 = icmp sle i32 %14, 17
  br i1 %15, label %16, label %25

; <label>:16                                      ; preds = %13
  %17 = getelementptr inbounds [6 x i64]* %l_5, i32 0, i64 5
  %18 = load i64* %17, align 8
  %19 = trunc i64 %18 to i32
  store i32 %19, i32* %1
  br label %27
                                                  ; No predecessors!
  %21 = load i32* @g_2, align 4
  %22 = sext i32 %21 to i64
  %23 = call i64 @safe_sub_func_uint64_t_u_u(i64 %22, i64 5)
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* @g_2, align 4
  br label %13

; <label>:25                                      ; preds = %13
  %26 = load i32* @g_2, align 4
  store i32 %26, i32* %1
  br label %27

; <label>:27                                      ; preds = %25, %16
  %28 = load i32* %1
  ret i32 %28
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
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
