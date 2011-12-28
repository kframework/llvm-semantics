; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001198.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -18895, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_3 = alloca [4 x i16], align 2
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [4 x i16]* %l_3, i32 0, i64 %7
  store i16 -2, i16* %8, align 2
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load volatile i16* @g_2, align 2
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds [4 x i16]* %l_3, i32 0, i64 1
  %16 = load i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = xor i32 %17, %14
  %19 = trunc i32 %18 to i16
  store i16 %19, i16* %15, align 2
  store volatile i16 0, i16* @g_2, align 2
  br label %20

; <label>:20                                      ; preds = %27, %12
  %21 = load volatile i16* @g_2, align 2
  %22 = zext i16 %21 to i32
  %23 = icmp slt i32 %22, 4
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %20
  %25 = load volatile i16* @g_2, align 2
  %26 = zext i16 %25 to i64
  store i64 %26, i64* %1
  br label %36
                                                  ; No predecessors!
  %28 = load volatile i16* @g_2, align 2
  %29 = zext i16 %28 to i32
  %30 = add nsw i32 %29, 3
  %31 = trunc i32 %30 to i16
  store volatile i16 %31, i16* @g_2, align 2
  br label %20

; <label>:32                                      ; preds = %20
  %33 = getelementptr inbounds [4 x i16]* %l_3, i32 0, i64 1
  %34 = load i16* %33, align 2
  %35 = zext i16 %34 to i64
  store i64 %35, i64* %1
  br label %36

; <label>:36                                      ; preds = %32, %24
  %37 = load i64* %1
  ret i64 %37
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i16* @g_2, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* %1
  ret i32 %8
}

declare i32 @printf(i8*, ...)
