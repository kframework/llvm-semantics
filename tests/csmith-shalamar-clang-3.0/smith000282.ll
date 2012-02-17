; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000282.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1557455636, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_2 = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i32]* %l_2, i32 0, i64 %7
  store i32 -2078589847, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store volatile i32 0, i32* @g_3, align 4
  br label %13

; <label>:13                                      ; preds = %19, %12
  %14 = load volatile i32* @g_3, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %13
  %17 = load volatile i32* @g_3, align 4
  %18 = sext i32 %17 to i64
  store i64 %18, i64* %1
  br label %25
                                                  ; No predecessors!
  %20 = load volatile i32* @g_3, align 4
  %21 = add nsw i32 %20, 2
  store volatile i32 %21, i32* @g_3, align 4
  br label %13

; <label>:22                                      ; preds = %13
  %23 = load volatile i32* @g_3, align 4
  %24 = sext i32 %23 to i64
  store i64 %24, i64* %1
  br label %25

; <label>:25                                      ; preds = %22, %16
  %26 = load i64* %1
  ret i64 %26
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
