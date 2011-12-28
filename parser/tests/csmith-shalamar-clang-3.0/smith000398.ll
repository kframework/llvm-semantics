; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000398.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [2 x [10 x i32]] [[10 x i32] [i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566], [10 x i32] [i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566]], align 16
@g_11 = global i32 -230779952, align 4
@g_22 = global i32* bitcast (i8* getelementptr (i8* bitcast ([2 x [10 x i32]]* @g_3 to i8*), i64 44) to i32*), align 8
@g_23 = global [3 x i32] [i32 845166746, i32 845166746, i32 845166746], align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][9] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][7] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][8] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][9] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [23 x i8] c"checksum g_23[0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [23 x i8] c"checksum g_23[1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [23 x i8] c"checksum g_23[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_2 = alloca i32*, align 8
  %l_34 = alloca i32**, align 8
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), i32** %l_2, align 8
  store i32** @g_22, i32*** %l_34, align 8
  %1 = load i32** %l_2, align 8
  %2 = load i32* %1
  %3 = sext i32 %2 to i64
  %4 = xor i64 %3, 992394718
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %1
  br label %6

; <label>:6                                       ; preds = %39, %0
  %7 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %8 = call i32 @safe_unary_minus_func_uint32_t_u(i32 %7)
  %9 = load i32** %l_2, align 8
  %10 = load i32* %9
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %6
  %13 = load i32** %l_2, align 8
  %14 = load i32* %13
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %20, label %16

; <label>:16                                      ; preds = %12
  %17 = load i32** %l_2, align 8
  %18 = load i32* %17
  %19 = icmp ne i32 %18, 0
  br label %20

; <label>:20                                      ; preds = %16, %12
  %21 = phi i1 [ true, %12 ], [ %19, %16 ]
  br label %22

; <label>:22                                      ; preds = %20, %6
  %23 = phi i1 [ false, %6 ], [ %21, %20 ]
  %24 = zext i1 %23 to i32
  %25 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 7), align 4
  %26 = trunc i32 %25 to i16
  %27 = call i64 @safe_mod_func_int64_t_s_s(i64 1330929378, i64 3736564344)
  %28 = trunc i64 %27 to i16
  %29 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %26, i16 zeroext %28)
  %30 = zext i16 %29 to i32
  %31 = icmp ne i32 %24, %30
  %32 = zext i1 %31 to i32
  %33 = load i32** %l_2, align 8
  store i32 %32, i32* %33
  %34 = load i32** %l_2, align 8
  %35 = call i32* @func_9(i32* %34)
  %36 = load i32*** %l_34, align 8
  store i32* %35, i32** %36
  %37 = load i32* @g_11, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %22
  br label %6

; <label>:40                                      ; preds = %22
  %41 = load i32** %l_2, align 8
  %42 = load i32* %41
  ret i32 %42
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %ui, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sub i32 0, %2
  ret i32 %3
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %si1, i64* %1, align 8
  store i64 %si2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = icmp eq i64 %6, -9223372036854775808
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i64* %2, align 8
  %10 = icmp eq i64 %9, -1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8, %0
  %12 = load i64* %1, align 8
  br label %17

; <label>:13                                      ; preds = %8, %5
  %14 = load i64* %1, align 8
  %15 = load i64* %2, align 8
  %16 = srem i64 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %11
  %18 = phi i64 [ %12, %11 ], [ %16, %13 ]
  ret i64 %18
}

define i32* @func_9(i32* %p_10) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %l_27 = alloca [3 x i32**], align 16
  %l_33 = alloca i16, align 2
  %i = alloca i32, align 4
  %l_28 = alloca [2 x i32**], align 16
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  %l_21 = alloca i32*, align 8
  %l_20 = alloca [9 x i32**], align 16
  %i2 = alloca i32, align 4
  store i32* %p_10, i32** %2, align 8
  store i16 27291, i16* %l_33, align 2
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [3 x i32**]* %l_27, i32 0, i64 %8
  store i32** @g_22, i32*** %9, align 8
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  store i32 0, i32* @g_11, align 4
  br label %14

; <label>:14                                      ; preds = %123, %13
  %15 = load i32* @g_11, align 4
  %16 = icmp eq i32 %15, -14
  br i1 %16, label %17, label %126

; <label>:17                                      ; preds = %14
  store i32 0, i32* %i1, align 4
  br label %18

; <label>:18                                      ; preds = %25, %17
  %19 = load i32* %i1, align 4
  %20 = icmp slt i32 %19, 2
  br i1 %20, label %21, label %28

; <label>:21                                      ; preds = %18
  %22 = load i32* %i1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i32**]* %l_28, i32 0, i64 %23
  store i32** @g_22, i32*** %24, align 8
  br label %25

; <label>:25                                      ; preds = %21
  %26 = load i32* %i1, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i1, align 4
  br label %18

; <label>:28                                      ; preds = %18
  br label %29

; <label>:29                                      ; preds = %64, %28
  store i32 0, i32* @g_11, align 4
  br label %30

; <label>:30                                      ; preds = %48, %29
  %31 = load i32* @g_11, align 4
  %32 = icmp eq i32 %31, -9
  br i1 %32, label %33, label %53

; <label>:33                                      ; preds = %30
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 8), i32** %l_21, align 8
  store i32 0, i32* %i2, align 4
  br label %34

; <label>:34                                      ; preds = %41, %33
  %35 = load i32* %i2, align 4
  %36 = icmp slt i32 %35, 9
  br i1 %36, label %37, label %44

; <label>:37                                      ; preds = %34
  %38 = load i32* %i2, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [9 x i32**]* %l_20, i32 0, i64 %39
  store i32** %l_21, i32*** %40, align 8
  br label %41

; <label>:41                                      ; preds = %37
  %42 = load i32* %i2, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i2, align 4
  br label %34

; <label>:44                                      ; preds = %34
  %45 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %46 = load i32* @g_11, align 4
  %47 = call i32* @func_16(i32 %45, i32 %46, i32* null)
  store i32* %47, i32** @g_22, align 8
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), i32** %1
  br label %128
                                                  ; No predecessors!
  %49 = load i32* @g_11, align 4
  %50 = trunc i32 %49 to i16
  %51 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %50, i16 signext 1)
  %52 = sext i16 %51 to i32
  store i32 %52, i32* @g_11, align 4
  br label %30

; <label>:53                                      ; preds = %30
  store i32 0, i32* @g_11, align 4
  br label %54

; <label>:54                                      ; preds = %70, %53
  %55 = load i32* @g_11, align 4
  %56 = icmp slt i32 %55, 2
  br i1 %56, label %57, label %73

; <label>:57                                      ; preds = %54
  store volatile i32 8, i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  br label %58

; <label>:58                                      ; preds = %66, %57
  %59 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %60 = icmp sge i32 %59, 0
  br i1 %60, label %61, label %69

; <label>:61                                      ; preds = %58
  %62 = load i32* @g_11, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  br label %29

; <label>:65                                      ; preds = %61
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %68 = add nsw i32 %67, -7
  store volatile i32 %68, i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  br label %58

; <label>:69                                      ; preds = %58
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load i32* @g_11, align 4
  %72 = add nsw i32 %71, 2
  store i32 %72, i32* @g_11, align 4
  br label %54

; <label>:73                                      ; preds = %54
  %74 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %75 = urem i32 %74, 10
  %76 = zext i32 %75 to i64
  %77 = load i32* @g_11, align 4
  %78 = urem i32 %77, 2
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds [2 x [10 x i32]]* @g_3, i32 0, i64 %79
  %81 = getelementptr inbounds [10 x i32]* %80, i32 0, i64 %76
  %82 = load i32* %81, align 4
  %83 = load i32** @g_22, align 8
  %84 = load i32* %83
  %85 = or i32 %82, %84
  %86 = getelementptr inbounds [3 x i32**]* %l_27, i32 0, i64 0
  %87 = load i32*** %86, align 8
  %88 = getelementptr inbounds [2 x i32**]* %l_28, i32 0, i64 1
  %89 = load i32*** %88, align 8
  %90 = icmp eq i32** %87, %89
  %91 = zext i1 %90 to i32
  %92 = trunc i32 %91 to i16
  %93 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext -1, i16 zeroext %92)
  %94 = zext i16 %93 to i32
  %95 = load i32** @g_22, align 8
  %96 = load i32* %95
  %97 = trunc i32 %96 to i16
  %98 = load i32** %2, align 8
  %99 = load i32* %98
  %100 = trunc i32 %99 to i16
  %101 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %97, i16 signext %100)
  %102 = trunc i16 %101 to i8
  %103 = load i16* %l_33, align 2
  %104 = zext i16 %103 to i32
  %105 = load i32** %2, align 8
  %106 = load i32* %105
  %107 = icmp sle i32 %104, %106
  %108 = zext i1 %107 to i32
  %109 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %102, i32 %108)
  %110 = zext i8 %109 to i32
  %111 = icmp eq i32 %94, %110
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %73
  br label %113

; <label>:113                                     ; preds = %112, %73
  %114 = phi i1 [ false, %73 ], [ true, %112 ]
  %115 = zext i1 %114 to i32
  %116 = icmp sgt i32 %85, %115
  %117 = zext i1 %116 to i32
  %118 = load i32** %2, align 8
  %119 = load i32* %118
  %120 = icmp eq i32 %117, %119
  %121 = zext i1 %120 to i32
  %122 = load i32** %2, align 8
  store i32 %121, i32* %122
  br label %123

; <label>:123                                     ; preds = %113
  %124 = load i32* @g_11, align 4
  %125 = call i32 @safe_add_func_uint32_t_u_u(i32 %124, i32 7)
  store i32 %125, i32* @g_11, align 4
  br label %14

; <label>:126                                     ; preds = %14
  %127 = load i32** %2, align 8
  store i32* %127, i32** %1
  br label %128

; <label>:128                                     ; preds = %126, %44
  %129 = load i32** %1
  ret i32* %129
}

define i32* @func_16(i32 %p_17, i32 %p_18, i32* %p_19) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  store i32 %p_17, i32* %1, align 4
  store i32 %p_18, i32* %2, align 4
  store i32* %p_19, i32** %3, align 8
  ret i32* %2
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

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load i8* %1, align 1
  %10 = zext i8 %9 to i32
  br label %16

; <label>:11                                      ; preds = %5
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  %14 = load i32* %2, align 4
  %15 = ashr i32 %13, %14
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i32 [ %10, %8 ], [ %15, %11 ]
  %18 = trunc i32 %17 to i8
  ret i8 %18
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
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 5), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 7), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 8), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 9), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 5), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 7), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 8), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 9), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %45)
  %47 = load i32* @g_11, align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %47)
  %49 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 0), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str21, i32 0, i32 0), i32 %49)
  %51 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 1), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str22, i32 0, i32 0), i32 %51)
  %53 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str23, i32 0, i32 0), i32 %53)
  %55 = load volatile i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str23, i32 0, i32 0), i32 %55)
  %57 = load i32* %1
  ret i32 %57
}

declare i32 @printf(i8*, ...)
