; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001623.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [1 x [3 x i32]] [[3 x i32] [i32 -1, i32 -1, i32 -1]], align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 0, i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %4 = icmp sle i32 %3, 0
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  store i32 %6, i32* %1
  br label %14
                                                  ; No predecessors!
  %8 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %9 = trunc i32 %8 to i8
  %10 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %9, i8 signext 1)
  %11 = sext i8 %10 to i32
  store i32 %11, i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  store i32 %13, i32* %1
  br label %14

; <label>:14                                      ; preds = %12, %5
  %15 = load i32* %1
  ret i32 %15
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %11)
  %13 = load i32* %1
  ret i32 %13
}

declare i32 @printf(i8*, ...)
