; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000514.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i16 3977, align 2
@g_7 = global i32 355227899, align 4
@g_14 = global i32 7, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %l_8 = alloca [7 x i32], align 16
  %l_9 = alloca i8, align 1
  %l_12 = alloca i64, align 8
  %i = alloca i32, align 4
  %l_13 = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  %l_16 = alloca i32*, align 8
  %l_19 = alloca [10 x [7 x i16]], align 16
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 111, i8* %l_9, align 1
  store i64 -6, i64* %l_12, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 7
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 %7
  store i32 0, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load volatile i16* @g_4, align 2
  %14 = zext i16 %13 to i32
  %15 = load i32* @g_7, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* @g_7, align 4
  %18 = icmp ne i32 %17, 0
  %19 = xor i1 %18, true
  %20 = zext i1 %19 to i32
  %21 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 4
  %22 = load i32* %21, align 4
  %23 = icmp eq i32 %20, %22
  %24 = zext i1 %23 to i32
  %25 = sext i32 %24 to i64
  %26 = call i64 @safe_sub_func_uint64_t_u_u(i64 %16, i64 %25)
  %27 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 4
  %28 = load i32* %27, align 4
  %29 = zext i32 %28 to i64
  %30 = icmp eq i64 %26, %29
  %31 = zext i1 %30 to i32
  %32 = or i32 %14, %31
  %33 = trunc i32 %32 to i16
  %34 = load i8* %l_9, align 1
  %35 = zext i8 %34 to i16
  %36 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %33, i16 signext %35)
  %37 = icmp ne i16 %36, 0
  br i1 %37, label %38, label %61

; <label>:38                                      ; preds = %12
  store i8 -10, i8* %l_9, align 1
  br label %39

; <label>:39                                      ; preds = %55, %38
  %40 = load i8* %l_9, align 1
  %41 = zext i8 %40 to i32
  %42 = icmp sle i32 %41, -16
  br i1 %42, label %43, label %60

; <label>:43                                      ; preds = %39
  store i32* @g_14, i32** %l_13, align 8
  %44 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 4
  %45 = load i32* %44, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %43
  br label %60

; <label>:48                                      ; preds = %43
  %49 = load i64* %l_12, align 8
  %50 = load i32** %l_13, align 8
  %51 = load i32* %50
  %52 = sext i32 %51 to i64
  %53 = or i64 %52, %49
  %54 = trunc i64 %53 to i32
  store i32 %54, i32* %50
  br label %55

; <label>:55                                      ; preds = %48
  %56 = load i8* %l_9, align 1
  %57 = zext i8 %56 to i16
  %58 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %57, i16 signext 1)
  %59 = trunc i16 %58 to i8
  store i8 %59, i8* %l_9, align 1
  br label %39

; <label>:60                                      ; preds = %47, %39
  br label %66

; <label>:61                                      ; preds = %12
  store i32* null, i32** %l_15, align 8
  store i32* @g_14, i32** %l_16, align 8
  %62 = load i32** %l_15, align 8
  %63 = icmp eq i32* null, %62
  %64 = zext i1 %63 to i32
  %65 = load i32** %l_16, align 8
  store i32 %64, i32* %65
  br label %66

; <label>:66                                      ; preds = %61, %60
  store i64 0, i64* %l_12, align 8
  br label %67

; <label>:67                                      ; preds = %97, %66
  %68 = load i64* %l_12, align 8
  %69 = icmp ult i64 %68, 12
  br i1 %69, label %70, label %102

; <label>:70                                      ; preds = %67
  store i32 0, i32* %i1, align 4
  br label %71

; <label>:71                                      ; preds = %89, %70
  %72 = load i32* %i1, align 4
  %73 = icmp slt i32 %72, 10
  br i1 %73, label %74, label %92

; <label>:74                                      ; preds = %71
  store i32 0, i32* %j, align 4
  br label %75

; <label>:75                                      ; preds = %85, %74
  %76 = load i32* %j, align 4
  %77 = icmp slt i32 %76, 7
  br i1 %77, label %78, label %88

; <label>:78                                      ; preds = %75
  %79 = load i32* %j, align 4
  %80 = sext i32 %79 to i64
  %81 = load i32* %i1, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [10 x [7 x i16]]* %l_19, i32 0, i64 %82
  %84 = getelementptr inbounds [7 x i16]* %83, i32 0, i64 %80
  store i16 1, i16* %84, align 2
  br label %85

; <label>:85                                      ; preds = %78
  %86 = load i32* %j, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %j, align 4
  br label %75

; <label>:88                                      ; preds = %75
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i32* %i1, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %i1, align 4
  br label %71

; <label>:92                                      ; preds = %71
  %93 = getelementptr inbounds [10 x [7 x i16]]* %l_19, i32 0, i64 6
  %94 = getelementptr inbounds [7 x i16]* %93, i32 0, i64 0
  %95 = load i16* %94, align 2
  %96 = sext i16 %95 to i32
  store i32 %96, i32* %1
  br label %105
                                                  ; No predecessors!
  %98 = load i64* %l_12, align 8
  %99 = trunc i64 %98 to i8
  %100 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %99, i8 zeroext 1)
  %101 = zext i8 %100 to i64
  store i64 %101, i64* %l_12, align 8
  br label %67

; <label>:102                                     ; preds = %67
  %103 = load i8* %l_9, align 1
  %104 = zext i8 %103 to i32
  store i32 %104, i32* %1
  br label %105

; <label>:105                                     ; preds = %102, %92
  %106 = load i32* %1
  ret i32 %106
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i16* %2, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i16* %1, align 2
  %16 = sext i16 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i16* %1, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16* %2, align 2
  %21 = sext i16 %20 to i32
  %22 = sdiv i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
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
  %4 = call i32 @func_1()
  %5 = load volatile i16* @g_4, align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32* @g_7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_14, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
