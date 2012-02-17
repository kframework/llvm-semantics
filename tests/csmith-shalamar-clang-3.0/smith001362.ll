; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001362.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = constant i32 -1793153426, align 4
@g_39 = global i32 -3, align 4
@g_41 = global i32 868786368, align 4
@g_40 = global i32* @g_41, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_39 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_43 = alloca i32*, align 8
  %l_44 = alloca i32**, align 8
  store i32* @g_41, i32** %l_43, align 8
  store i32** %l_43, i32*** %l_44, align 8
  %1 = load i32** @g_40, align 8
  %2 = load i32*** %l_44, align 8
  store i32* %1, i32** %2
  %3 = load i32*** %l_44, align 8
  %4 = load i32** %3
  %5 = load i32* %4
  ret i32 %5
}

define i32* @func_2(i32* %p_3, i64 %p_4, i32 %p_5) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  %l_7 = alloca [7 x i8], align 1
  %l_38 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %i1 = alloca i32, align 4
  store i32* %p_3, i32** %2, align 8
  store i64 %p_4, i64* %3, align 8
  store i32 %p_5, i32* %4, align 4
  store i32 0, i32* %l_6, align 4
  store i32* @g_39, i32** %l_38, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 7
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [7 x i8]* %l_7, i32 0, i64 %10
  store i8 -2, i8* %11, align 1
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  %16 = load i32* %l_6, align 4
  %17 = zext i32 %16 to i64
  %18 = xor i64 %17, 3118091527
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %20, label %107

; <label>:20                                      ; preds = %15
  store i32* @g_9, i32** %l_8, align 8
  br label %21

; <label>:21                                      ; preds = %37, %20
  store i32 4, i32* %l_6, align 4
  br label %22

; <label>:22                                      ; preds = %27, %21
  %23 = load i32* %l_6, align 4
  %24 = icmp uge i32 %23, 0
  br i1 %24, label %25, label %30

; <label>:25                                      ; preds = %22
  %26 = load i32** %l_8, align 8
  store i32* %26, i32** %1
  br label %115
                                                  ; No predecessors!
  %28 = load i32* %l_6, align 4
  %29 = add i32 %28, -4
  store i32 %29, i32* %l_6, align 4
  br label %22

; <label>:30                                      ; preds = %22
  store i64 2, i64* %3, align 8
  br label %31

; <label>:31                                      ; preds = %102, %30
  %32 = load i64* %3, align 8
  %33 = icmp ult i64 %32, 7
  br i1 %33, label %34, label %105

; <label>:34                                      ; preds = %31
  %35 = load i32* %l_6, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34
  br label %21

; <label>:38                                      ; preds = %34
  store i32 0, i32* %l_6, align 4
  br label %39

; <label>:39                                      ; preds = %96, %38
  %40 = load i32* %l_6, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %101

; <label>:42                                      ; preds = %39
  %43 = load i32** %2, align 8
  %44 = load i32* %43
  %45 = icmp sgt i32 %44, -1793153426
  %46 = zext i1 %45 to i32
  %47 = load i32* %4, align 4
  %48 = icmp uge i32 %46, %47
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %42
  br label %50

; <label>:50                                      ; preds = %49, %42
  %51 = phi i1 [ false, %42 ], [ true, %49 ]
  %52 = zext i1 %51 to i32
  %53 = trunc i32 %52 to i8
  %54 = load i32** %l_38, align 8
  %55 = icmp eq i32* null, %54
  %56 = xor i1 %55, true
  %57 = zext i1 %56 to i32
  %58 = trunc i32 %57 to i8
  %59 = load i64* %3, align 8
  %60 = urem i64 %59, 7
  %61 = getelementptr inbounds [7 x i8]* %l_7, i32 0, i64 %60
  %62 = load i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %72, label %65

; <label>:65                                      ; preds = %50
  %66 = load i32** %l_38, align 8
  %67 = load i32* %66
  %68 = call i32 @func_15(i32 %67, i32* @g_39, i8 signext 110)
  %69 = load i32** @g_40, align 8
  %70 = call i32 @func_15(i32 %68, i32* %69, i8 signext 110)
  %71 = icmp ne i32 %70, 0
  br label %72

; <label>:72                                      ; preds = %65, %50
  %73 = phi i1 [ true, %50 ], [ %71, %65 ]
  %74 = zext i1 %73 to i32
  %75 = load i32** %2, align 8
  %76 = load i32** %l_8, align 8
  %77 = icmp ne i32* %75, %76
  br i1 %77, label %78, label %86

; <label>:78                                      ; preds = %72
  %79 = load i64* %3, align 8
  %80 = add i64 %79, 4
  %81 = urem i64 %80, 7
  %82 = getelementptr inbounds [7 x i8]* %l_7, i32 0, i64 %81
  %83 = load i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = icmp ne i32 %84, 0
  br label %86

; <label>:86                                      ; preds = %78, %72
  %87 = phi i1 [ false, %72 ], [ %85, %78 ]
  %88 = zext i1 %87 to i32
  %89 = and i32 %74, %88
  %90 = trunc i32 %89 to i8
  %91 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %58, i8 zeroext %90)
  %92 = zext i8 %91 to i32
  %93 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %53, i32 %92)
  %94 = sext i8 %93 to i32
  %95 = load i32** @g_40, align 8
  store i32 %94, i32* %95
  br label %96

; <label>:96                                      ; preds = %86
  %97 = load i32* %l_6, align 4
  %98 = trunc i32 %97 to i16
  %99 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %98, i16 zeroext 1)
  %100 = zext i16 %99 to i32
  store i32 %100, i32* %l_6, align 4
  br label %39

; <label>:101                                     ; preds = %39
  br label %102

; <label>:102                                     ; preds = %101
  %103 = load i64* %3, align 8
  %104 = add i64 %103, 3
  store i64 %104, i64* %3, align 8
  br label %31

; <label>:105                                     ; preds = %31
  %106 = load i32** %2, align 8
  store i32* %106, i32** %1
  br label %115

; <label>:107                                     ; preds = %15
  %108 = load i32** %2, align 8
  %109 = load i32* %108
  %110 = sext i32 %109 to i64
  %111 = call i64 @safe_unary_minus_func_int64_t_s(i64 %110)
  %112 = trunc i64 %111 to i32
  %113 = load i32** %2, align 8
  store i32 %112, i32* %113
  %114 = load i32** %2, align 8
  store i32* %114, i32** %1
  br label %115

; <label>:115                                     ; preds = %107, %105, %25
  %116 = load i32** %1
  ret i32* %116
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 127, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = mul i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define i32 @func_15(i32 %p_16, i32* %p_17, i8 signext %p_18) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i8, align 1
  %l_33 = alloca i64, align 8
  store i32 %p_16, i32* %1, align 4
  store i32* %p_17, i32** %2, align 8
  store i8 %p_18, i8* %3, align 1
  store i64 1, i64* %l_33, align 8
  %4 = load i32** %2, align 8
  %5 = load i32* %4
  %6 = load i32** %2, align 8
  store i32 %5, i32* %6
  %7 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 17867, i16 zeroext -1)
  %8 = zext i16 %7 to i32
  %9 = load i32** %2, align 8
  %10 = load i32* %9
  %11 = call i32 @safe_mod_func_uint32_t_u_u(i32 0, i32 %10)
  %12 = call i32 @safe_sub_func_uint32_t_u_u(i32 %8, i32 %11)
  %13 = load i32** %2, align 8
  %14 = load i32* %13
  %15 = trunc i32 %14 to i16
  %16 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %15, i32 0)
  %17 = zext i16 %16 to i32
  %18 = load i64* %l_33, align 8
  %19 = trunc i64 %18 to i16
  %20 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %19, i16 signext 1)
  %21 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %20, i16 signext -22930)
  %22 = trunc i16 %21 to i8
  %23 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %22, i8 zeroext -36)
  %24 = zext i8 %23 to i32
  %25 = xor i32 %17, %24
  %26 = or i32 %12, %25
  %27 = load i32** %2, align 8
  store i32 %26, i32* %27
  ret i32 -1793153426
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal i64 @safe_unary_minus_func_int64_t_s(i64 %si) nounwind uwtable {
  %1 = alloca i64, align 8
  store i64 %si, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = icmp eq i64 %2, -9223372036854775808
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i64* %1, align 8
  br label %9

; <label>:6                                       ; preds = %0
  %7 = load i64* %1, align 8
  %8 = sub nsw i64 0, %7
  br label %9

; <label>:9                                       ; preds = %6, %4
  %10 = phi i64 [ %5, %4 ], [ %8, %6 ]
  ret i64 %10
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub i32 %3, %4
  ret i32 %5
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

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = urem i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i16
  ret i16 %18
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

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 -1793153426)
  %6 = load i32* @g_39, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_41, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %8)
  %10 = load i32* %1
  ret i32 %10
}

declare i32 @printf(i8*, ...)
