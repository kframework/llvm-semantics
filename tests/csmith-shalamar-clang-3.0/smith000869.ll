; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000869.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [5 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %l_5 = alloca i16, align 2
  store i16 20955, i16* %l_5, align 2
  store volatile i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  br label %1

; <label>:1                                       ; preds = %9, %0
  %2 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 3), align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %14

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8
  %10 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %11 = sext i32 %10 to i64
  %12 = call i64 @safe_add_func_uint64_t_u_u(i64 %11, i64 5)
  %13 = trunc i64 %12 to i32
  store volatile i32 %13, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  br label %1

; <label>:14                                      ; preds = %7, %1
  %15 = load i16* %l_5, align 2
  ret i16 %15
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = add i64 %3, %4
  ret i64 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %15)
  %17 = load i32* %1
  ret i32 %17
}

declare i32 @printf(i8*, ...)
