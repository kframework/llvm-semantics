; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001012.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_5 = global i16 -30495, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_6 = alloca i64, align 8
  store i64 8449633485961041367, i64* %l_6, align 8
  store i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* @g_2, align 4
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i16* @g_5, align 2
  store i16 %6, i16* %1
  br label %15
                                                  ; No predecessors!
  %8 = load i32* @g_2, align 4
  %9 = sext i32 %8 to i64
  %10 = call i64 @safe_add_func_uint64_t_u_u(i64 %9, i64 0)
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* @g_2, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i64* %l_6, align 8
  %14 = trunc i64 %13 to i16
  store i16 %14, i16* %1
  br label %15

; <label>:15                                      ; preds = %12, %5
  %16 = load i16* %1
  ret i16 %16
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i16* @g_5, align 2
  %8 = zext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
