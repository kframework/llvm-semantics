; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001955.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [7 x i32] [i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033, i32 -512397033], align 16
@g_5 = global i32* bitcast (i8* getelementptr (i8* bitcast ([7 x i32]* @g_2 to i8*), i64 16) to i32*), align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  store volatile i32 -3, i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %4 = icmp slt i32 %3, -7
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %7 = load volatile i32** @g_5, align 8
  store volatile i32 %6, i32* %7
  %8 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %9 = sext i32 %8 to i64
  store i64 %9, i64* %1
  br label %16
                                                  ; No predecessors!
  %11 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %12 = call i32 @safe_add_func_uint32_t_u_u(i32 %11, i32 1)
  store volatile i32 %12, i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %15 = sext i32 %14 to i64
  store i64 %15, i64* %1
  br label %16

; <label>:16                                      ; preds = %13, %5
  %17 = load i64* %1
  ret i64 %17
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add i32 %3, %4
  ret i32 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_2, i32 0, i64 3), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %19)
  %21 = load i32* %1
  ret i32 %21
}

declare i32 @printf(i8*, ...)
