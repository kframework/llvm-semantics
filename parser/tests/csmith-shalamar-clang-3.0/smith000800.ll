; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000800.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -599044590, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_5 = alloca i16, align 2
  store i16 -18002, i16* %l_5, align 2
  store volatile i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load i16* %l_5, align 2
  %7 = sext i16 %6 to i64
  store i64 %7, i64* %1
  br label %16
                                                  ; No predecessors!
  %9 = load volatile i32* @g_2, align 4
  %10 = trunc i32 %9 to i8
  %11 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %10, i8 zeroext 1)
  %12 = zext i8 %11 to i32
  store volatile i32 %12, i32* @g_2, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load volatile i32* @g_2, align 4
  %15 = sext i32 %14 to i64
  store i64 %15, i64* %1
  br label %16

; <label>:16                                      ; preds = %13, %5
  %17 = load i64* %1
  ret i64 %17
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
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* %1
  ret i32 %7
}

declare i32 @printf(i8*, ...)
