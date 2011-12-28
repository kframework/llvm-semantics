; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001679.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 7, align 4
@g_9 = global i32 -94376035, align 4
@g_8 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_7 = alloca i32, align 4
  %l_32 = alloca i8, align 1
  %l_21 = alloca i32, align 4
  %l_24 = alloca i32*, align 8
  %l_27 = alloca [6 x [3 x [3 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_30 = alloca i8, align 1
  %l_31 = alloca i32*, align 8
  store i32 468890265, i32* %l_7, align 4
  store i8 -4, i8* %l_32, align 1
  store volatile i32 0, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load volatile i32* @g_2, align 4
  store i32 %6, i32* %1
  br label %118
                                                  ; No predecessors!
  %8 = load volatile i32* @g_2, align 4
  %9 = trunc i32 %8 to i8
  %10 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %9, i8 zeroext 2)
  %11 = zext i8 %10 to i32
  store volatile i32 %11, i32* @g_2, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load volatile i32* @g_2, align 4
  %14 = load i32* %l_7, align 4
  %15 = icmp slt i32 %13, %14
  %16 = zext i1 %15 to i32
  %17 = trunc i32 %16 to i16
  %18 = load i32* %l_7, align 4
  %19 = trunc i32 %18 to i16
  %20 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %17, i16 zeroext %19)
  %21 = zext i16 %20 to i32
  %22 = load volatile i32** @g_8, align 8
  store i32 %21, i32* %22
  %23 = load volatile i32** @g_8, align 8
  %24 = load i32* %23
  %25 = load i32* %l_7, align 4
  %26 = xor i32 %24, %25
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %105

; <label>:28                                      ; preds = %12
  store i32 -1, i32* %l_21, align 4
  store i32* @g_9, i32** %l_24, align 8
  %29 = call i32 @func_12(i32* null)
  %30 = trunc i32 %29 to i8
  %31 = load i32* %l_7, align 4
  %32 = trunc i32 %31 to i16
  %33 = load i32* %l_7, align 4
  %34 = load volatile i32** @g_8, align 8
  %35 = load i32* %34
  %36 = icmp ne i32 %33, %35
  %37 = zext i1 %36 to i32
  %38 = sext i32 %37 to i64
  %39 = icmp eq i64 399134342, %38
  %40 = zext i1 %39 to i32
  %41 = load i32* %l_21, align 4
  %42 = load i32* %l_21, align 4
  %43 = xor i32 %41, %42
  %44 = trunc i32 %43 to i8
  %45 = load i32* %l_7, align 4
  %46 = load i32* %l_21, align 4
  %47 = call i32 @safe_mod_func_int32_t_s_s(i32 %45, i32 %46)
  %48 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %44, i32 %47)
  %49 = zext i8 %48 to i32
  %50 = xor i32 %40, %49
  %51 = trunc i32 %50 to i16
  %52 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %32, i16 signext %51)
  %53 = sext i16 %52 to i64
  %54 = icmp sle i64 %53, 2237590656
  %55 = zext i1 %54 to i32
  %56 = trunc i32 %55 to i8
  %57 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %30, i8 zeroext %56)
  %58 = zext i8 %57 to i32
  %59 = load i32** %l_24, align 8
  store i32 %58, i32* %59
  store i32 10, i32* @g_9, align 4
  br label %60

; <label>:60                                      ; preds = %101, %28
  %61 = load i32* @g_9, align 4
  %62 = icmp sge i32 %61, 0
  br i1 %62, label %63, label %104

; <label>:63                                      ; preds = %60
  store i32 0, i32* %i, align 4
  br label %64

; <label>:64                                      ; preds = %93, %63
  %65 = load i32* %i, align 4
  %66 = icmp slt i32 %65, 6
  br i1 %66, label %67, label %96

; <label>:67                                      ; preds = %64
  store i32 0, i32* %j, align 4
  br label %68

; <label>:68                                      ; preds = %89, %67
  %69 = load i32* %j, align 4
  %70 = icmp slt i32 %69, 3
  br i1 %70, label %71, label %92

; <label>:71                                      ; preds = %68
  store i32 0, i32* %k, align 4
  br label %72

; <label>:72                                      ; preds = %85, %71
  %73 = load i32* %k, align 4
  %74 = icmp slt i32 %73, 3
  br i1 %74, label %75, label %88

; <label>:75                                      ; preds = %72
  %76 = load i32* %k, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32* %j, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32* %i, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [6 x [3 x [3 x i32]]]* %l_27, i32 0, i64 %81
  %83 = getelementptr inbounds [3 x [3 x i32]]* %82, i32 0, i64 %79
  %84 = getelementptr inbounds [3 x i32]* %83, i32 0, i64 %77
  store i32 1624657053, i32* %84, align 4
  br label %85

; <label>:85                                      ; preds = %75
  %86 = load i32* %k, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %k, align 4
  br label %72

; <label>:88                                      ; preds = %72
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i32* %j, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %j, align 4
  br label %68

; <label>:92                                      ; preds = %68
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32* %i, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %i, align 4
  br label %64

; <label>:96                                      ; preds = %64
  %97 = getelementptr inbounds [6 x [3 x [3 x i32]]]* %l_27, i32 0, i64 2
  %98 = getelementptr inbounds [3 x [3 x i32]]* %97, i32 0, i64 1
  %99 = getelementptr inbounds [3 x i32]* %98, i32 0, i64 2
  %100 = load i32* %99, align 4
  store i32 %100, i32* %1
  br label %118
                                                  ; No predecessors!
  %102 = load i32* @g_9, align 4
  %103 = call i32 @safe_add_func_int32_t_s_s(i32 %102, i32 2)
  store i32 %103, i32* @g_9, align 4
  br label %60

; <label>:104                                     ; preds = %60
  br label %115

; <label>:105                                     ; preds = %12
  store i8 -96, i8* %l_30, align 1
  store i32* @g_9, i32** %l_31, align 8
  %106 = call i32 @func_12(i32* @g_9)
  %107 = trunc i32 %106 to i8
  %108 = load i8* %l_30, align 1
  %109 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %107, i8 signext %108)
  %110 = sext i8 %109 to i32
  %111 = load i32** %l_31, align 8
  %112 = load i32* %111
  %113 = and i32 %112, %110
  store i32 %113, i32* %111
  %114 = load volatile i32* @g_2, align 4
  store i32 %114, i32* %1
  br label %118

; <label>:115                                     ; preds = %104
  %116 = load i8* %l_32, align 1
  %117 = sext i8 %116 to i32
  store i32 %117, i32* %1
  br label %118

; <label>:118                                     ; preds = %115, %105, %96, %5
  %119 = load i32* %1
  ret i32 %119
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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

define i32 @func_12(i32* %p_13) nounwind uwtable {
  %1 = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  %l_14 = alloca i32**, align 8
  %l_16 = alloca i32, align 4
  store i32* %p_13, i32** %1, align 8
  store i32* @g_9, i32** %l_15, align 8
  store i32** %l_15, i32*** %l_14, align 8
  store i32 -1, i32* %l_16, align 4
  store i32** %1, i32*** %l_14, align 8
  %2 = load i32* %l_16, align 4
  ret i32 %2
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = load i32* %2, align 4
  %12 = ashr i32 %10, %11
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = phi i32 [ %7, %5 ], [ %12, %8 ]
  %15 = trunc i32 %14 to i8
  ret i8 %15
}

define internal i32 @safe_mod_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp eq i32 %6, -2147483648
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i32* %1, align 4
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i32* %1, align 4
  %15 = load i32* %2, align 4
  %16 = srem i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i32 [ %12, %11 ], [ %16, %13 ]
  ret i32 %18
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %si1, i32* %1, align 4
  store i32 %si2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %1, align 4
  %10 = load i32* %2, align 4
  %11 = sub nsw i32 2147483647, %10
  %12 = icmp sgt i32 %9, %11
  br i1 %12, label %24, label %13

; <label>:13                                      ; preds = %8, %5, %0
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %13
  %17 = load i32* %2, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i32* %1, align 4
  %21 = load i32* %2, align 4
  %22 = sub nsw i32 -2147483648, %21
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19, %8
  %25 = load i32* %1, align 4
  br label %30

; <label>:26                                      ; preds = %19, %16, %13
  %27 = load i32* %1, align 4
  %28 = load i32* %2, align 4
  %29 = add nsw i32 %27, %28
  br label %30

; <label>:30                                      ; preds = %26, %24
  %31 = phi i32 [ %25, %24 ], [ %29, %26 ]
  ret i32 %31
}

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = mul nsw i32 %4, %6
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
  %4 = call i32 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_9, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* %1
  ret i32 %9
}

declare i32 @printf(i8*, ...)
