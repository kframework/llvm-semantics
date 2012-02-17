; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001830.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i8 106, align 1
@g_5 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca i32, align 4
  %l_4 = alloca i32*, align 8
  store i32 -9, i32* %l_2, align 4
  store i32* @g_5, i32** %l_4, align 8
  %1 = load i32* %l_2, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %7

; <label>:3                                       ; preds = %0
  %4 = load volatile i8* @g_3, align 1
  %5 = sext i8 %4 to i64
  %6 = icmp sgt i64 3083795101, %5
  br label %7

; <label>:7                                       ; preds = %3, %0
  %8 = phi i1 [ false, %0 ], [ %6, %3 ]
  %9 = zext i1 %8 to i32
  %10 = load i32** %l_4, align 8
  %11 = load i32* %10
  %12 = xor i32 %11, %9
  store i32 %12, i32* %10
  %13 = icmp ne i32* null, %l_2
  %14 = zext i1 %13 to i32
  %15 = load i32** %l_4, align 8
  store i32 %14, i32* %15
  %16 = load i32* @g_5, align 4
  ret i32 %16
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load volatile i8* @g_3, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_5, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
