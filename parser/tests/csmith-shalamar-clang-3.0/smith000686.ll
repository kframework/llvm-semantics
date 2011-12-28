; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000686.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 0, align 2
@g_3 = global i16 -1, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  store i32 -642455217, i32* %l_4, align 4
  %1 = load volatile i16* @g_2, align 2
  %2 = zext i16 %1 to i32
  %3 = load i16* @g_3, align 2
  %4 = zext i16 %3 to i32
  %5 = xor i32 %2, %4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load i16* @g_3, align 2
  %9 = zext i16 %8 to i64
  %10 = and i64 7, %9
  %11 = icmp ne i64 %10, 0
  br label %12

; <label>:12                                      ; preds = %7, %0
  %13 = phi i1 [ false, %0 ], [ %11, %7 ]
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %l_4, align 4
  %15 = load i32* %l_4, align 4
  %16 = trunc i32 %15 to i16
  ret i16 %16
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i16* @g_2, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* @g_3, align 2
  %9 = zext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
