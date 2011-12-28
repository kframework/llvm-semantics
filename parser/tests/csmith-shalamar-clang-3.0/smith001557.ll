; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001557.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32* null, align 8
@g_4 = global [2 x [1 x [6 x [5 x i32*]]]] zeroinitializer, align 16
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_2 = alloca [7 x i32], align 16
  %l_5 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 -634722377, i32* %l_5, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [7 x i32]* %l_2, i32 0, i64 %6
  store i32 5, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = getelementptr inbounds [7 x i32]* %l_2, i32 0, i64 0
  %13 = load i32* %12, align 4
  %14 = load i32* %l_5, align 4
  %15 = xor i32 %14, %13
  store i32 %15, i32* %l_5, align 4
  %16 = getelementptr inbounds [7 x i32]* %l_2, i32 0, i64 0
  %17 = load i32* %16, align 4
  %18 = trunc i32 %17 to i16
  ret i16 %18
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* %1
  ret i32 %5
}
