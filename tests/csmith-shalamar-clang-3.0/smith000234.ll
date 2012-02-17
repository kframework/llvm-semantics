; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000234.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1324299973, align 4
@func_1.l_8 = internal constant [7 x i64] [i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_9 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_7 = alloca i64, align 8
  store i32 7, i32* %l_9, align 4
  store volatile i32 -25, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %18, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp sgt i32 %3, 17
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i64 -1, i64* %l_7, align 8
  store volatile i32 -17, i32* @g_2, align 4
  br label %6

; <label>:6                                       ; preds = %12, %5
  %7 = load volatile i32* @g_2, align 4
  %8 = icmp sle i32 %7, 8
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %6
  %10 = load i64* %l_7, align 8
  %11 = trunc i64 %10 to i16
  store i16 %11, i16* %1
  br label %28
                                                  ; No predecessors!
  %13 = load volatile i32* @g_2, align 4
  %14 = sext i32 %13 to i64
  %15 = call i64 @safe_add_func_uint64_t_u_u(i64 %14, i64 1)
  %16 = trunc i64 %15 to i32
  store volatile i32 %16, i32* @g_2, align 4
  br label %6

; <label>:17                                      ; preds = %6
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load volatile i32* @g_2, align 4
  %20 = trunc i32 %19 to i8
  %21 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %20, i8 zeroext 1)
  %22 = zext i8 %21 to i32
  store volatile i32 %22, i32* @g_2, align 4
  br label %2

; <label>:23                                      ; preds = %2
  %24 = load i64* getelementptr inbounds ([7 x i64]* @func_1.l_8, i32 0, i64 4), align 8
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %l_9, align 4
  %26 = load volatile i32* @g_2, align 4
  %27 = trunc i32 %26 to i16
  store i16 %27, i16* %1
  br label %28

; <label>:28                                      ; preds = %23, %9
  %29 = load i16* %1
  ret i16 %29
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

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
