; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001782.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 20, align 1
@g_12 = global [2 x i32] [i32 1335413498, i32 1335413498], align 4
@g_14 = global i32 -1942426574, align 4
@g_19 = global i32 -1932179853, align 4
@g_18 = global i32* @g_19, align 8
@g_17 = constant i32** @g_18, align 8
@g_20 = global i32** @g_18, align 8
@g_28 = global i16 4766, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_12[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_12[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_9 = alloca i64, align 8
  %l_29 = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %l_13 = alloca i32*, align 8
  store i64 1, i64* %l_9, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i32]* %l_29, i32 0, i64 %7
  store i32 2133371286, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i8* @g_4, align 1
  %14 = zext i8 %13 to i32
  %15 = load i64* %l_9, align 8
  %16 = trunc i64 %15 to i8
  %17 = load i8* @g_4, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %24, label %20

; <label>:20                                      ; preds = %12
  %21 = load i8* @g_4, align 1
  %22 = zext i8 %21 to i32
  %23 = icmp ne i32 %22, 0
  br label %24

; <label>:24                                      ; preds = %20, %12
  %25 = phi i1 [ true, %12 ], [ %23, %20 ]
  %26 = zext i1 %25 to i32
  %27 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %16, i32 %26)
  %28 = load i8* @g_4, align 1
  %29 = zext i8 %28 to i64
  %30 = load i64* %l_9, align 8
  %31 = or i64 %29, %30
  %32 = trunc i64 %31 to i8
  %33 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %27, i8 signext %32)
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %14, %34
  %36 = zext i1 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = load i8* @g_4, align 1
  %39 = load i8* @g_4, align 1
  %40 = zext i8 %39 to i32
  %41 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %38, i32 %40)
  %42 = sext i8 %41 to i64
  %43 = call i64 @safe_sub_func_uint64_t_u_u(i64 %37, i64 %42)
  %44 = icmp ne i64 %43, 4
  br i1 %44, label %45, label %82

; <label>:45                                      ; preds = %24
  %46 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  %47 = sext i32 %46 to i64
  %48 = xor i64 %47, 2200975219
  %49 = trunc i64 %48 to i32
  store i32 %49, i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  store i64 0, i64* %l_9, align 8
  br label %50

; <label>:50                                      ; preds = %63, %45
  %51 = load i64* %l_9, align 8
  %52 = icmp slt i64 %51, 2
  br i1 %52, label %53, label %66

; <label>:53                                      ; preds = %50
  store i32* @g_14, i32** %l_13, align 8
  %54 = load i32** %l_13, align 8
  %55 = load i32* %54
  %56 = sext i32 %55 to i64
  %57 = and i64 %56, 1772236215
  %58 = trunc i64 %57 to i32
  store i32 %58, i32* %54
  %59 = load i64* %l_9, align 8
  %60 = urem i64 %59, 2
  %61 = getelementptr inbounds [2 x i32]* @g_12, i32 0, i64 %60
  %62 = load i32* %61, align 4
  store i32 %62, i32* %1
  br label %140
                                                  ; No predecessors!
  %64 = load i64* %l_9, align 8
  %65 = add nsw i64 %64, 1
  store i64 %65, i64* %l_9, align 8
  br label %50

; <label>:66                                      ; preds = %50
  store i8 -6, i8* @g_4, align 1
  br label %67

; <label>:67                                      ; preds = %76, %66
  %68 = load i8* @g_4, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %81

; <label>:71                                      ; preds = %67
  %72 = load i32*** @g_17, align 8
  store i32** %72, i32*** @g_20, align 8
  %73 = load i32** @g_18, align 8
  %74 = load volatile i32* %73
  %75 = load i32** @g_18, align 8
  store volatile i32 %74, i32* %75
  br label %76

; <label>:76                                      ; preds = %71
  %77 = load i8* @g_4, align 1
  %78 = zext i8 %77 to i32
  %79 = call i32 @safe_add_func_uint32_t_u_u(i32 %78, i32 2)
  %80 = trunc i32 %79 to i8
  store i8 %80, i8* @g_4, align 1
  br label %67

; <label>:81                                      ; preds = %67
  br label %137

; <label>:82                                      ; preds = %24
  %83 = load i32*** @g_20, align 8
  %84 = load volatile i32** %83
  %85 = load volatile i32* %84
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %129, label %87

; <label>:87                                      ; preds = %82
  %88 = load i64* %l_9, align 8
  %89 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext -7, i32 9)
  %90 = sext i8 %89 to i32
  %91 = load i32*** @g_17, align 8
  %92 = load volatile i32** %91
  %93 = load volatile i32* %92
  %94 = trunc i32 %93 to i16
  %95 = load i32* @g_14, align 4
  %96 = trunc i32 %95 to i16
  %97 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %94, i16 zeroext %96)
  %98 = zext i16 %97 to i32
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %104, label %100

; <label>:100                                     ; preds = %87
  %101 = load i32** @g_18, align 8
  %102 = load volatile i32* %101
  %103 = icmp ne i32 %102, 0
  br label %104

; <label>:104                                     ; preds = %100, %87
  %105 = phi i1 [ true, %87 ], [ %103, %100 ]
  %106 = zext i1 %105 to i32
  %107 = icmp sle i32 %90, %106
  br i1 %107, label %108, label %123

; <label>:108                                     ; preds = %104
  %109 = load i64* %l_9, align 8
  %110 = load i64* %l_9, align 8
  %111 = load i32** @g_18, align 8
  %112 = load volatile i32* %111
  %113 = sext i32 %112 to i64
  %114 = icmp eq i64 %110, %113
  %115 = zext i1 %114 to i32
  %116 = sext i32 %115 to i64
  %117 = icmp sgt i64 %109, %116
  %118 = zext i1 %117 to i32
  %119 = trunc i32 %118 to i16
  %120 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %119)
  %121 = sext i16 %120 to i32
  %122 = icmp ne i32 %121, 0
  br label %123

; <label>:123                                     ; preds = %108, %104
  %124 = phi i1 [ false, %104 ], [ %122, %108 ]
  %125 = zext i1 %124 to i32
  %126 = sext i32 %125 to i64
  %127 = call i64 @safe_sub_func_uint64_t_u_u(i64 %88, i64 %126)
  %128 = icmp ne i64 %127, 0
  br label %129

; <label>:129                                     ; preds = %123, %82
  %130 = phi i1 [ true, %82 ], [ %128, %123 ]
  %131 = zext i1 %130 to i32
  %132 = load i16* @g_28, align 2
  %133 = sext i16 %132 to i32
  %134 = xor i32 %133, %131
  %135 = trunc i32 %134 to i16
  store i16 %135, i16* @g_28, align 2
  %136 = load i32*** @g_20, align 8
  store volatile i32* null, i32** %136
  br label %137

; <label>:137                                     ; preds = %129, %81
  %138 = getelementptr inbounds [2 x i32]* %l_29, i32 0, i64 1
  %139 = load i32* %138, align 4
  store i32 %139, i32* %1
  br label %140

; <label>:140                                     ; preds = %137, %53
  %141 = load i32* %1
  ret i32 %141
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

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %18, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %9
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  %15 = load i32* %2, align 4
  %16 = ashr i32 127, %15
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12, %9, %6, %0
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  br label %26

; <label>:21                                      ; preds = %12
  %22 = load i8* %1, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %2, align 4
  %25 = shl i32 %23, %24
  br label %26

; <label>:26                                      ; preds = %21, %18
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = trunc i32 %27 to i8
  ret i8 %28
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

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 32
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9, %6, %0
  %13 = load i8* %1, align 1
  %14 = sext i8 %13 to i32
  br label %20

; <label>:15                                      ; preds = %9
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32* %2, align 4
  %19 = ashr i32 %17, %18
  br label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i32 [ %14, %12 ], [ %19, %15 ]
  %22 = trunc i32 %21 to i8
  ret i8 %22
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

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
  %1 = alloca i16, align 2
  store i16 %si, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i8* @g_4, align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 0), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i32* @g_14, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load volatile i32* @g_19, align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i16* @g_28, align 2
  %19 = sext i16 %18 to i32
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %19)
  %21 = load i32* %1
  ret i32 %21
}

declare i32 @printf(i8*, ...)
