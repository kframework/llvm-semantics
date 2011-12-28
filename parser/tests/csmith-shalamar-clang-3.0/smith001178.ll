; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001178.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 1857468893, align 4
@g_3 = global [7 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_2 = alloca [4 x i32**], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 4
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [4 x i32**]* %l_2, i32 0, i64 %6
  store i32** null, i32*** %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32* null, i32** getelementptr inbounds ([7 x [3 x i32*]]* @g_3, i32 0, i64 5, i64 0), align 8
  %12 = load i32* @g_4, align 4
  %13 = trunc i32 %12 to i8
  ret i8 %13
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i8 @func_1()
  %5 = load i32* @g_4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
