; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001266.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@g_17 = global i32 -336830778, align 4
@g_25 = global [2 x [5 x [4 x i32]]] [[5 x [4 x i32]] [[4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902]], [5 x [4 x i32]] [[4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][1] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][2] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][3] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][1] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][2] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][3] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][0] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][1] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][2] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][3] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][1] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][2] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][3] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][0] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][1] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][2] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
  %1 = alloca i8, align 1
  %l_5 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  %l_22 = alloca i32, align 4
  %l_23 = alloca i64, align 8
  %l_24 = alloca i32*, align 8
  %l_30 = alloca i32*, align 8
  store i32 -1929245742, i32* %l_5, align 4
  store i32 1884241230, i32* %l_6, align 4
  store i32 -1, i32* %l_22, align 4
  store i64 1, i64* %l_23, align 8
  store i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 0), i32** %l_24, align 8
  store i32* %l_5, i32** %l_30, align 8
  store volatile i32 18, i32* @g_2, align 4
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load volatile i32* @g_2, align 4
  %4 = icmp sle i32 %3, 0
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %2
  %6 = load i32* %l_5, align 4
  %7 = load i32* %l_6, align 4
  %8 = or i32 %7, %6
  store i32 %8, i32* %l_6, align 4
  %9 = load volatile i32* @g_2, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5
  br label %18

; <label>:12                                      ; preds = %5
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load volatile i32* @g_2, align 4
  %15 = sext i32 %14 to i64
  %16 = call i64 @safe_add_func_uint64_t_u_u(i64 %15, i64 1)
  %17 = trunc i64 %16 to i32
  store volatile i32 %17, i32* @g_2, align 4
  br label %2

; <label>:18                                      ; preds = %11, %2
  %19 = load i32* %l_6, align 4
  %20 = trunc i32 %19 to i16
  %21 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %20, i32 -1)
  %22 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %21, i32 1462075040)
  %23 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext 6812, i16 signext %22)
  %24 = sext i16 %23 to i32
  %25 = load i32* %l_5, align 4
  %26 = load i32* %l_6, align 4
  %27 = load volatile i32* @g_2, align 4
  %28 = or i32 %26, %27
  %29 = trunc i32 %28 to i8
  %30 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %29, i32 2)
  %31 = sext i8 %30 to i32
  %32 = load i32* @g_17, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %37, label %34

; <label>:34                                      ; preds = %18
  %35 = load i32* %l_5, align 4
  %36 = icmp ne i32 %35, 0
  br label %37

; <label>:37                                      ; preds = %34, %18
  %38 = phi i1 [ true, %18 ], [ %36, %34 ]
  %39 = zext i1 %38 to i32
  %40 = trunc i32 %39 to i8
  %41 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %40, i8 signext -110)
  %42 = sext i8 %41 to i32
  %43 = or i32 %31, %42
  %44 = load i32* %l_6, align 4
  %45 = trunc i32 %44 to i8
  %46 = load i32* %l_6, align 4
  %47 = trunc i32 %46 to i8
  %48 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %45, i8 signext %47)
  %49 = sext i8 %48 to i32
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %54, label %51

; <label>:51                                      ; preds = %37
  %52 = load i32* @g_17, align 4
  %53 = icmp ne i32 %52, 0
  br label %54

; <label>:54                                      ; preds = %51, %37
  %55 = phi i1 [ true, %37 ], [ %53, %51 ]
  %56 = zext i1 %55 to i32
  %57 = load i32* @g_17, align 4
  %58 = load i32* %l_22, align 4
  %59 = trunc i32 %58 to i8
  %60 = load i64* %l_23, align 8
  %61 = trunc i64 %60 to i8
  %62 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %59, i8 zeroext %61)
  %63 = zext i8 %62 to i32
  %64 = and i32 %57, %63
  %65 = and i32 %56, %64
  %66 = icmp slt i32 %43, %65
  %67 = zext i1 %66 to i32
  %68 = icmp sge i32 %25, %67
  %69 = zext i1 %68 to i32
  %70 = xor i32 %24, %69
  %71 = load i32** %l_24, align 8
  %72 = load i32* %71
  %73 = or i32 %72, %70
  store i32 %73, i32* %71
  store i32 0, i32* %l_5, align 4
  br label %74

; <label>:74                                      ; preds = %80, %54
  %75 = load i32* %l_5, align 4
  %76 = icmp sge i32 %75, 0
  br i1 %76, label %77, label %85

; <label>:77                                      ; preds = %74
  %78 = load i32* @g_17, align 4
  %79 = trunc i32 %78 to i8
  store i8 %79, i8* %1
  br label %104
                                                  ; No predecessors!
  %81 = load i32* %l_5, align 4
  %82 = sext i32 %81 to i64
  %83 = call i64 @safe_sub_func_uint64_t_u_u(i64 %82, i64 4)
  %84 = trunc i64 %83 to i32
  store i32 %84, i32* %l_5, align 4
  br label %74

; <label>:85                                      ; preds = %74
  %86 = load i32** %l_24, align 8
  %87 = load i32* %86
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %93

; <label>:89                                      ; preds = %85
  %90 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext 0, i32 1)
  %91 = zext i8 %90 to i32
  %92 = icmp ne i32 %91, 0
  br label %93

; <label>:93                                      ; preds = %89, %85
  %94 = phi i1 [ false, %85 ], [ %92, %89 ]
  %95 = zext i1 %94 to i32
  %96 = icmp slt i32 1, %95
  %97 = zext i1 %96 to i32
  %98 = load i32** %l_30, align 8
  %99 = load i32* %98
  %100 = or i32 %99, %97
  store i32 %100, i32* %98
  %101 = load i32** %l_30, align 8
  %102 = load i32* %101
  %103 = trunc i32 %102 to i8
  store i8 %103, i8* %1
  br label %104

; <label>:104                                     ; preds = %93, %77
  %105 = load i8* %1
  ret i8 %105
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

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
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

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %left, i16* %1, align 2
  store i32 %right, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %6, %0
  %10 = load i16* %1, align 2
  %11 = sext i16 %10 to i32
  br label %17

; <label>:12                                      ; preds = %6
  %13 = load i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %12, %9
  %18 = phi i32 [ %11, %9 ], [ %16, %12 ]
  %19 = trunc i32 %18 to i16
  ret i16 %19
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

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
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

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = sub i64 %3, %4
  ret i64 %5
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp uge i32 %3, 32
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8* %1, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32* %2, align 4
  %9 = ashr i32 255, %8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5, %0
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i8* %1, align 1
  %16 = zext i8 %15 to i32
  %17 = load i32* %2, align 4
  %18 = shl i32 %16, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %20 = phi i32 [ %13, %11 ], [ %18, %14 ]
  %21 = trunc i32 %20 to i8
  ret i8 %21
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i8 @func_1()
  %5 = load volatile i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_17, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 2), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 3), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 0), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 1), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 2), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 3), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 0), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 1), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i32 %27)
  %29 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 2), align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i32 %29)
  %31 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 3), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 %31)
  %33 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 0), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i32 %33)
  %35 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 1), align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i32 %35)
  %37 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 2), align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %37)
  %39 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 3), align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i32 0, i32 0), i32 %39)
  %41 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 0), align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %41)
  %43 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 1), align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %43)
  %45 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 2), align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %45)
  %47 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 3), align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %47)
  %49 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 0), align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 1), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %51)
  %53 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 2), align 4
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %53)
  %55 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 3), align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i32 %55)
  %57 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 0), align 4
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0), i32 %57)
  %59 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 1), align 4
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i32 0, i32 0), i32 %59)
  %61 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 2), align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i32 0, i32 0), i32 %61)
  %63 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 3), align 4
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i32 %63)
  %65 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 0), align 4
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i32 0, i32 0), i32 %65)
  %67 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 1), align 4
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i32 %67)
  %69 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 2), align 4
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i32 0, i32 0), i32 %69)
  %71 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 3), align 4
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i32 0, i32 0), i32 %71)
  %73 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 0), align 4
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i32 0, i32 0), i32 %73)
  %75 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 1), align 4
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i32 %75)
  %77 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 2), align 4
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i32 0, i32 0), i32 %77)
  %79 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 3), align 4
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i32 0, i32 0), i32 %79)
  %81 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 0), align 4
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i32 0, i32 0), i32 %81)
  %83 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 1), align 4
  %84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i32 0, i32 0), i32 %83)
  %85 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 2), align 4
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i32 0, i32 0), i32 %85)
  %87 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 3), align 4
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i32 0, i32 0), i32 %87)
  %89 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 0), align 4
  %90 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %89)
  %91 = load i32* %1
  ret i32 %91
}

declare i32 @printf(i8*, ...)
