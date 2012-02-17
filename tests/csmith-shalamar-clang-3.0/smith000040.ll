; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000040.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32* null, align 8
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca [9 x i64], align 16
  %l_4 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 627744503, i32* %l_4, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 9
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 %6
  store i64 1, i64* %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 8
  %13 = load i64* %12, align 8
  %14 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 8
  %15 = load i64* %14, align 8
  %16 = xor i64 %13, %15
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %l_4, align 4
  %18 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 6
  %19 = load i64* %18, align 8
  %20 = trunc i64 %19 to i32
  ret i32 %20
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* %1
  ret i32 %5
}
