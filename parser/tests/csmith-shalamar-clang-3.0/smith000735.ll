; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000735.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = constant i32 -681110032, align 4
@g_10 = global i32 -1, align 4
@g_12 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_6 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_15 = alloca i8, align 1
  store i32 -1554040502, i32* %l_6, align 4
  store i32* @g_12, i32** %l_11, align 8
  br label %2

; <label>:2                                       ; preds = %55, %0
  %3 = load i32* %l_6, align 4
  %4 = trunc i32 %3 to i8
  %5 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %4, i32 -201137379)
  %6 = sext i8 %5 to i64
  %7 = load i32* %l_6, align 4
  %8 = zext i32 %7 to i64
  %9 = call i64 @safe_add_func_uint64_t_u_u(i64 %6, i64 %8)
  %10 = load volatile i32* @g_9, align 4
  %11 = trunc i32 %10 to i16
  %12 = load i32* %l_6, align 4
  %13 = load i32* %l_6, align 4
  %14 = icmp ule i32 %12, %13
  %15 = zext i1 %14 to i32
  %16 = load i32* @g_10, align 4
  %17 = icmp ne i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = load i32* %l_6, align 4
  %20 = load i32* %l_6, align 4
  %21 = icmp eq i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = load i32* @g_10, align 4
  %24 = icmp ne i32 %22, %23
  %25 = zext i1 %24 to i32
  %26 = icmp slt i32 %18, %25
  %27 = zext i1 %26 to i32
  %28 = trunc i32 %27 to i16
  %29 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %11, i16 zeroext %28)
  %30 = zext i16 %29 to i32
  %31 = load i32* @g_10, align 4
  %32 = zext i32 %31 to i64
  %33 = icmp slt i64 %32, 9
  %34 = zext i1 %33 to i32
  %35 = icmp eq i32 %30, %34
  %36 = zext i1 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = icmp ugt i64 %9, %37
  %39 = zext i1 %38 to i32
  %40 = load i32** %l_11, align 8
  %41 = load i32* %40
  %42 = or i32 %41, %39
  store i32 %42, i32* %40
  store i32 0, i32* @g_12, align 4
  br label %43

; <label>:43                                      ; preds = %49, %2
  %44 = load i32* @g_12, align 4
  %45 = icmp sge i32 %44, 0
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %43
  store i8 -58, i8* %l_15, align 1
  %47 = load i8* %l_15, align 1
  %48 = sext i8 %47 to i64
  store i64 %48, i64* %1
  br label %59
                                                  ; No predecessors!
  %50 = load i32* @g_12, align 4
  %51 = call i32 @safe_add_func_uint32_t_u_u(i32 %50, i32 1)
  store i32 %51, i32* @g_12, align 4
  br label %43

; <label>:52                                      ; preds = %43
  %53 = load i32* %l_6, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %52
  br label %2

; <label>:56                                      ; preds = %52
  %57 = load volatile i32* @g_9, align 4
  %58 = zext i32 %57 to i64
  store i64 %58, i64* %1
  br label %59

; <label>:59                                      ; preds = %56, %46
  %60 = load i64* %1
  ret i64 %60
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

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i8
  ret i8 %19
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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
  %5 = load volatile i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_10, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_12, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* %1
  ret i32 %11
}

declare i32 @printf(i8*, ...)
