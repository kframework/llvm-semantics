; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001907.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1145476772, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  store volatile i32 -7, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp sle i32 %3, -4
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %2
  %6 = load volatile i32* @g_2, align 4
  %7 = sext i32 %6 to i64
  store i64 %7, i64* %1
  br label %14
                                                  ; No predecessors!
  %9 = load volatile i32* @g_2, align 4
  %10 = call i32 @safe_add_func_uint32_t_u_u(i32 %9, i32 5)
  store volatile i32 %10, i32* @g_2, align 4
  br label %2

; <label>:11                                      ; preds = %2
  %12 = load volatile i32* @g_2, align 4
  %13 = sext i32 %12 to i64
  store i64 %13, i64* %1
  br label %14

; <label>:14                                      ; preds = %11, %5
  %15 = load i64* %1
  ret i64 %15
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
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
