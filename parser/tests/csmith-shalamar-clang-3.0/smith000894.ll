; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000894.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32, i16, i8, i32, i8, i8, i16, i32 }

@g_9 = global i16 -27904, align 2
@g_11 = global i32 -4, align 4
@g_10 = global i32* @g_11, align 8
@g_12 = global [8 x [1 x i32**]] [[1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10]], align 16
@g_18 = global i32 1, align 4
@g_19 = global [9 x i32] [i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082], align 16
@g_49 = global i32* @g_18, align 8
@g_51 = global i32** @g_10, align 8
@g_58 = global i32** @g_10, align 8
@g_57 = global i32*** @g_58, align 8
@g_59 = global %struct.S0 { i32 -1, i16 26275, i8 -113, i32 -1, i8 -41, i8 74, i16 0, i32 1 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_19[0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_19[1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_19[2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_19[3] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_19[4] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_19[5] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_19[6] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"checksum g_19[7] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [23 x i8] c"checksum g_19[8] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [23 x i8] c"checksum g_59.f0 = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [23 x i8] c"checksum g_59.f1 = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [23 x i8] c"checksum g_59.f2 = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"checksum g_59.f3 = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"checksum g_59.f4 = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [23 x i8] c"checksum g_59.f5 = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [23 x i8] c"checksum g_59.f6 = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [23 x i8] c"checksum g_59.f7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* noalias sret %agg.result) nounwind uwtable {
  %l_13 = alloca i32*, align 8
  %l_31 = alloca i32*, align 8
  %l_34 = alloca [1 x i64], align 8
  %l_50 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* @g_11, i32** %l_13, align 8
  store i32* @g_18, i32** %l_31, align 8
  store i32 -8, i32* %l_50, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1 x i64]* %l_34, i32 0, i64 %6
  store i64 1, i64* %7, align 8
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i16* @g_9, align 2
  %13 = sext i16 %12 to i32
  %14 = load i32** @g_10, align 8
  %15 = call i32* @func_2(i32 %13, i32* %14)
  store i32* %15, i32** %l_13, align 8
  %16 = load i32** %l_13, align 8
  %17 = load i32* %16
  %18 = load i32** %l_31, align 8
  %19 = call i32* @func_2(i32 %17, i32* %18)
  %20 = load volatile i32*** @g_51, align 8
  store i32* %19, i32** %20
  %21 = load i32**** @g_57, align 8
  %22 = call i32 @func_52(i32*** %21, i32 376620625)
  %23 = load i32** %l_13, align 8
  %24 = load i32* %23
  %25 = or i32 %24, %22
  store i32 %25, i32* %23
  %26 = bitcast %struct.S0* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* bitcast (%struct.S0* @g_59 to i8*), i64 20, i32 4, i1 false)
  ret void
}

define i32* @func_2(i32 %p_3, i32* %p_4) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %l_5 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %l_7 = alloca i32**, align 8
  %l_6 = alloca i32***, align 8
  store i32 %p_3, i32* %1, align 4
  store i32* %p_4, i32** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %8
  store i32 3, i32* %9, align 4
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  store i32 1, i32* %1, align 4
  br label %14

; <label>:14                                      ; preds = %23, %13
  %15 = load i32* %1, align 4
  %16 = icmp slt i32 %15, 4
  br i1 %16, label %17, label %26

; <label>:17                                      ; preds = %14
  %18 = load i32* %1, align 4
  %19 = urem i32 %18, 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %20
  store i32* %21, i32** %l_8, align 8
  store i32** %l_8, i32*** %l_7, align 8
  store i32*** %l_7, i32**** %l_6, align 8
  %22 = load i32**** %l_6, align 8
  store i32** null, i32*** %22
  br label %23

; <label>:23                                      ; preds = %17
  %24 = load i32* %1, align 4
  %25 = add nsw i32 %24, 3
  store i32 %25, i32* %1, align 4
  br label %14

; <label>:26                                      ; preds = %14
  %27 = load i16* @g_9, align 2
  %28 = sext i16 %27 to i32
  %29 = load i32** %2, align 8
  %30 = load i32* %29
  %31 = xor i32 %30, %28
  store i32 %31, i32* %29
  %32 = load i32** %2, align 8
  ret i32* %32
}

define i32 @func_52(i32*** %p_53, i32 %p_54) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32***, align 8
  %3 = alloca i32, align 4
  %l_55 = alloca i16, align 2
  %l_56 = alloca i32, align 4
  store i32*** %p_53, i32**** %2, align 8
  store i32 %p_54, i32* %3, align 4
  %4 = load i32** @g_10, align 8
  %5 = load i32* %4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %15, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32* %3, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %7
  store i16 15157, i16* %l_55, align 2
  store i32 15157, i32* %1
  br label %16

; <label>:11                                      ; preds = %7
  %12 = load volatile i32*** @g_51, align 8
  %13 = load i32** %12
  %14 = load i32* %13
  store i32 %14, i32* %1
  br label %16

; <label>:15                                      ; preds = %0
  store i32 -1263399019, i32* %l_56, align 4
  store i32 -1263399019, i32* %1
  br label %16

; <label>:16                                      ; preds = %15, %11, %10
  %17 = load i32* %1
  ret i32 %17
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32* @func_14(i32* %p_15, i32* %p_16, i32 %p_17) nounwind uwtable {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_28 = alloca i8, align 1
  %l_25 = alloca i32, align 4
  %l_29 = alloca [8 x [8 x i32*]], align 16
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %l_30 = alloca i32, align 4
  store i32* %p_15, i32** %2, align 8
  store i32* %p_16, i32** %3, align 8
  store i32 %p_17, i32* %4, align 4
  br label %5

; <label>:5                                       ; preds = %64, %0
  store i32 3, i32* %4, align 4
  br label %6

; <label>:6                                       ; preds = %49, %5
  %7 = load i32* %4, align 4
  %8 = icmp ult i32 %7, 8
  br i1 %8, label %9, label %52

; <label>:9                                       ; preds = %6
  store i16 0, i16* @g_9, align 2
  br label %10

; <label>:10                                      ; preds = %43, %9
  %11 = load i16* @g_9, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp slt i32 %12, 1
  br i1 %13, label %14, label %48

; <label>:14                                      ; preds = %10
  store i32 0, i32* @g_18, align 4
  br label %15

; <label>:15                                      ; preds = %33, %14
  %16 = load i32* @g_18, align 4
  %17 = icmp slt i32 %16, 8
  br i1 %17, label %18, label %36

; <label>:18                                      ; preds = %15
  store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  br label %19

; <label>:19                                      ; preds = %29, %18
  %20 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %21 = icmp slt i32 %20, 1
  br i1 %21, label %22, label %32

; <label>:22                                      ; preds = %19
  %23 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %24 = sext i32 %23 to i64
  %25 = load i32* @g_18, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x [1 x i32**]]* @g_12, i32 0, i64 %26
  %28 = getelementptr inbounds [1 x i32**]* %27, i32 0, i64 %24
  store volatile i32** @g_10, i32*** %28, align 8
  br label %29

; <label>:29                                      ; preds = %22
  %30 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  br label %19

; <label>:32                                      ; preds = %19
  br label %33

; <label>:33                                      ; preds = %32
  %34 = load i32* @g_18, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* @g_18, align 4
  br label %15

; <label>:36                                      ; preds = %15
  %37 = load i32** @g_10, align 8
  %38 = load i32* %37
  %39 = load i32** %3, align 8
  %40 = load i32* %39
  %41 = or i32 %40, %38
  store i32 %41, i32* %39
  %42 = load i32** %2, align 8
  store i32* %42, i32** %1
  br label %158
                                                  ; No predecessors!
  %44 = load i16* @g_9, align 2
  %45 = sext i16 %44 to i32
  %46 = add nsw i32 %45, 1
  %47 = trunc i32 %46 to i16
  store i16 %47, i16* @g_9, align 2
  br label %10

; <label>:48                                      ; preds = %10
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32* %4, align 4
  %51 = add i32 %50, 4
  store i32 %51, i32* %4, align 4
  br label %6

; <label>:52                                      ; preds = %6
  store i16 3, i16* @g_9, align 2
  br label %53

; <label>:53                                      ; preds = %71, %52
  %54 = load i16* @g_9, align 2
  %55 = sext i16 %54 to i32
  %56 = icmp slt i32 %55, 8
  br i1 %56, label %57, label %76

; <label>:57                                      ; preds = %53
  store i32 0, i32* %4, align 4
  br label %58

; <label>:58                                      ; preds = %67, %57
  %59 = load i32* %4, align 4
  %60 = icmp ult i32 %59, 1
  br i1 %60, label %61, label %70

; <label>:61                                      ; preds = %58
  %62 = load i32* @g_11, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  br label %5

; <label>:65                                      ; preds = %61
  %66 = load i32** %3, align 8
  store i32* %66, i32** %1
  br label %158
                                                  ; No predecessors!
  %68 = load i32* %4, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %4, align 4
  br label %58

; <label>:70                                      ; preds = %58
  br label %71

; <label>:71                                      ; preds = %70
  %72 = load i16* @g_9, align 2
  %73 = sext i16 %72 to i32
  %74 = add nsw i32 %73, 1
  %75 = trunc i32 %74 to i16
  store i16 %75, i16* @g_9, align 2
  br label %53

; <label>:76                                      ; preds = %53
  %77 = load i32** %3, align 8
  %78 = load i32* %77
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %114

; <label>:80                                      ; preds = %76
  store i8 4, i8* %l_28, align 1
  store i32 0, i32* %4, align 4
  br label %81

; <label>:81                                      ; preds = %110, %80
  %82 = load i32* %4, align 4
  %83 = icmp ult i32 %82, -6
  br i1 %83, label %84, label %113

; <label>:84                                      ; preds = %81
  store i32 1283171315, i32* %l_25, align 4
  %85 = icmp ne i32** %2, %2
  br i1 %85, label %86, label %92

; <label>:86                                      ; preds = %84
  %87 = load i32** %2, align 8
  %88 = load i32* %87
  %89 = load i32* %l_25, align 4
  %90 = call i32 @safe_add_func_int32_t_s_s(i32 %88, i32 %89)
  %91 = icmp ne i32 %90, 0
  br label %92

; <label>:92                                      ; preds = %86, %84
  %93 = phi i1 [ false, %84 ], [ %91, %86 ]
  %94 = zext i1 %93 to i32
  %95 = sext i32 %94 to i64
  %96 = load i32** %2, align 8
  %97 = load i32* %96
  %98 = sext i32 %97 to i64
  %99 = load i8* %l_28, align 1
  %100 = zext i8 %99 to i64
  %101 = call i64 @safe_add_func_uint64_t_u_u(i64 %98, i64 %100)
  %102 = or i64 %95, %101
  %103 = icmp ne i64 %102, 0
  %104 = xor i1 %103, true
  %105 = zext i1 %104 to i32
  %106 = load i32* %l_25, align 4
  %107 = and i32 %105, %106
  %108 = xor i32 %107, -1
  %109 = load i32** %2, align 8
  store i32 %108, i32* %109
  br label %110

; <label>:110                                     ; preds = %92
  %111 = load i32* %4, align 4
  %112 = call i32 @safe_add_func_uint32_t_u_u(i32 %111, i32 3)
  store i32 %112, i32* %4, align 4
  br label %81

; <label>:113                                     ; preds = %81
  br label %140

; <label>:114                                     ; preds = %76
  store i32 0, i32* %i1, align 4
  br label %115

; <label>:115                                     ; preds = %133, %114
  %116 = load i32* %i1, align 4
  %117 = icmp slt i32 %116, 8
  br i1 %117, label %118, label %136

; <label>:118                                     ; preds = %115
  store i32 0, i32* %j2, align 4
  br label %119

; <label>:119                                     ; preds = %129, %118
  %120 = load i32* %j2, align 4
  %121 = icmp slt i32 %120, 8
  br i1 %121, label %122, label %132

; <label>:122                                     ; preds = %119
  %123 = load i32* %j2, align 4
  %124 = sext i32 %123 to i64
  %125 = load i32* %i1, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [8 x [8 x i32*]]* %l_29, i32 0, i64 %126
  %128 = getelementptr inbounds [8 x i32*]* %127, i32 0, i64 %124
  store i32* @g_11, i32** %128, align 8
  br label %129

; <label>:129                                     ; preds = %122
  %130 = load i32* %j2, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %j2, align 4
  br label %119

; <label>:132                                     ; preds = %119
  br label %133

; <label>:133                                     ; preds = %132
  %134 = load i32* %i1, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %i1, align 4
  br label %115

; <label>:136                                     ; preds = %115
  %137 = getelementptr inbounds [8 x [8 x i32*]]* %l_29, i32 0, i64 1
  %138 = getelementptr inbounds [8 x i32*]* %137, i32 0, i64 2
  %139 = load i32** %138, align 8
  store i32* %139, i32** %1
  br label %158

; <label>:140                                     ; preds = %113
  store i32 3, i32* @g_18, align 4
  br label %141

; <label>:141                                     ; preds = %150, %140
  %142 = load i32* @g_18, align 4
  %143 = icmp slt i32 %142, 9
  br i1 %143, label %144, label %153

; <label>:144                                     ; preds = %141
  store i32 -8, i32* %l_30, align 4
  %145 = load i32* %l_30, align 4
  %146 = load i32** %2, align 8
  store i32 %145, i32* %146
  %147 = load i32** @g_10, align 8
  %148 = load i32* %147
  %149 = load i32** %3, align 8
  store i32 %148, i32* %149
  br label %150

; <label>:150                                     ; preds = %144
  %151 = load i32* @g_18, align 4
  %152 = add nsw i32 %151, 5
  store i32 %152, i32* @g_18, align 4
  br label %141

; <label>:153                                     ; preds = %141
  %154 = load i32* @g_18, align 4
  %155 = urem i32 %154, 9
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds [9 x i32]* @g_19, i32 0, i64 %156
  store i32* %157, i32** %1
  br label %158

; <label>:158                                     ; preds = %153, %136, %65, %36
  %159 = load i32** %1
  ret i32* %159
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

define i32 @func_35(i16 zeroext %p_36) nounwind uwtable {
  %1 = alloca i16, align 2
  %l_43 = alloca i32, align 4
  %l_48 = alloca i32*, align 8
  store i16 %p_36, i16* %1, align 2
  store i32 1647115108, i32* %l_43, align 4
  store i32* null, i32** %l_48, align 8
  %2 = load i16* %1, align 2
  %3 = trunc i16 %2 to i8
  %4 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %3, i32 -7)
  %5 = sext i8 %4 to i32
  %6 = call i64 @safe_div_func_uint64_t_u_u(i64 1647115108, i64 1647115108)
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %18, label %8

; <label>:8                                       ; preds = %0
  %9 = load i16* %1, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %8
  %13 = load i32** @g_10, align 8
  %14 = load i32* %13
  %15 = icmp ne i32 %14, 0
  br label %16

; <label>:16                                      ; preds = %12, %8
  %17 = phi i1 [ false, %8 ], [ %15, %12 ]
  br label %18

; <label>:18                                      ; preds = %16, %0
  %19 = phi i1 [ true, %0 ], [ %17, %16 ]
  %20 = zext i1 %19 to i32
  %21 = icmp sgt i32 1647115108, %20
  %22 = zext i1 %21 to i32
  %23 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext 0, i32 %22)
  %24 = zext i8 %23 to i16
  %25 = load i16* %1, align 2
  %26 = zext i16 %25 to i64
  %27 = call i64 @safe_div_func_uint64_t_u_u(i64 %26, i64 130151609)
  %28 = or i64 %27, 1647115108
  %29 = trunc i64 %28 to i16
  %30 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %24, i16 zeroext %29)
  %31 = zext i16 %30 to i32
  %32 = icmp sle i32 %5, %31
  %33 = zext i1 %32 to i32
  %34 = load volatile i32** @g_49, align 8
  %35 = load i32* %34
  %36 = xor i32 %35, %33
  store i32 %36, i32* %34
  %37 = load i16* %1, align 2
  %38 = zext i16 %37 to i32
  ret i32 %38
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

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %ui1, i64* %1, align 8
  store i64 %ui2, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i64* %1, align 8
  %9 = load i64* %2, align 8
  %10 = udiv i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i64 [ %6, %5 ], [ %10, %7 ]
  ret i64 %12
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %4 = alloca %struct.S0, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @func_1(%struct.S0* sret %4)
  %5 = load i16* @g_9, align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_11, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_18, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 0), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %12)
  %14 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 1), align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %14)
  %16 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 2), align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 3), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %18)
  %20 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 4), align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %22)
  %24 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 6), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 7), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 8), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str11, i32 0, i32 0), i32 %28)
  %30 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i32 0, i64 5), align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load volatile i32* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 0), align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str12, i32 0, i32 0), i32 %32)
  %34 = load i16* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 1), align 2
  %35 = zext i16 %34 to i32
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i32 0, i32 0), i32 %35)
  %37 = load i8* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 2), align 1
  %38 = zext i8 %37 to i32
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str14, i32 0, i32 0), i32 %38)
  %40 = load i32* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 3), align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i32 %40)
  %42 = load volatile i8* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 4), align 1
  %43 = zext i8 %42 to i32
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i32 0, i32 0), i32 %43)
  %45 = load i8* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 5), align 1
  %46 = sext i8 %45 to i32
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str17, i32 0, i32 0), i32 %46)
  %48 = load i16* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 6), align 2
  %49 = zext i16 %48 to i32
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str18, i32 0, i32 0), i32 %49)
  %51 = load i32* getelementptr inbounds (%struct.S0* @g_59, i32 0, i32 7), align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str19, i32 0, i32 0), i32 %51)
  %53 = load i32* %1
  ret i32 %53
}

declare i32 @printf(i8*, ...)
