; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000137.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [3 x i32] [i32 -1133618054, i32 -1133618054, i32 -1133618054], align 4
@g_3 = global i32 2054024901, align 4
@g_5 = global [7 x i32] [i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620], align 16
@g_8 = global i32 0, align 4
@g_21 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_4 = alloca i32*, align 8
  %l_13 = alloca i32*, align 8
  %l_16 = alloca i16, align 2
  store i32 1, i32* @g_3, align 4
  br label %2

; <label>:2                                       ; preds = %27, %0
  %3 = load i32* @g_3, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %2
  %6 = load i32* @g_3, align 4
  %7 = urem i32 %6, 3
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %8
  store i32* %9, i32** %l_4, align 8
  %10 = load i32** %l_4, align 8
  store i32 1819585037, i32* %10
  store i32 0, i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  br label %11

; <label>:11                                      ; preds = %17, %5
  %12 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %13 = icmp sge i32 %12, 0
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %11
  %15 = load i32** %l_4, align 8
  %16 = load i32* %15
  store i32 %16, i32* %1
  br label %150
                                                  ; No predecessors!
  %18 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %19 = trunc i32 %18 to i8
  %20 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %19, i8 signext 9)
  %21 = sext i8 %20 to i32
  store i32 %21, i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  br label %11

; <label>:22                                      ; preds = %11
  %23 = load i32* @g_3, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %22
  br label %31

; <label>:26                                      ; preds = %22
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* @g_3, align 4
  %29 = add nsw i32 %28, 2
  store i32 %29, i32* @g_3, align 4
  br label %2

; <label>:30                                      ; preds = %2
  br label %31

; <label>:31                                      ; preds = %30, %25
  store i32 1, i32* @g_3, align 4
  br label %32

; <label>:32                                      ; preds = %131, %31
  %33 = load i32* @g_3, align 4
  %34 = icmp slt i32 %33, 3
  br i1 %34, label %35, label %134

; <label>:35                                      ; preds = %32
  store i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), i32** %l_13, align 8
  store i32 13, i32* @g_8, align 4
  br label %36

; <label>:36                                      ; preds = %120, %35
  %37 = load i32* @g_8, align 4
  %38 = icmp slt i32 %37, 0
  br i1 %38, label %39, label %125

; <label>:39                                      ; preds = %36
  store i16 1, i16* %l_16, align 2
  %40 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 0), align 4
  %41 = load i32* @g_8, align 4
  %42 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 2), align 4
  %43 = load i32* @g_3, align 4
  %44 = urem i32 %43, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %45
  %47 = load i32* %46, align 4
  %48 = icmp sgt i32 %42, %47
  %49 = zext i1 %48 to i32
  %50 = load i32** %l_13, align 8
  %51 = icmp eq i32* @g_8, %50
  %52 = zext i1 %51 to i32
  %53 = icmp sle i32 %49, %52
  %54 = zext i1 %53 to i32
  %55 = trunc i32 %54 to i16
  %56 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %61, label %58

; <label>:58                                      ; preds = %39
  %59 = load i32* @g_3, align 4
  %60 = icmp ne i32 %59, 0
  br label %61

; <label>:61                                      ; preds = %58, %39
  %62 = phi i1 [ true, %39 ], [ %60, %58 ]
  %63 = zext i1 %62 to i32
  %64 = trunc i32 %63 to i16
  %65 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %71, label %67

; <label>:67                                      ; preds = %61
  %68 = load i16* %l_16, align 2
  %69 = sext i16 %68 to i32
  %70 = icmp ne i32 %69, 0
  br label %71

; <label>:71                                      ; preds = %67, %61
  %72 = phi i1 [ true, %61 ], [ %70, %67 ]
  %73 = zext i1 %72 to i32
  %74 = trunc i32 %73 to i16
  %75 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %64, i16 zeroext %74)
  %76 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %55, i16 signext %75)
  %77 = sext i16 %76 to i32
  %78 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 5), align 4
  %79 = load i32* @g_3, align 4
  %80 = and i32 %78, %79
  %81 = load i32* @g_3, align 4
  %82 = urem i32 %81, 3
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %83
  %85 = load i32* %84, align 4
  %86 = trunc i32 %85 to i16
  %87 = load i32* @g_8, align 4
  %88 = trunc i32 %87 to i16
  %89 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %86, i16 signext %88)
  %90 = sext i16 %89 to i32
  %91 = icmp sle i32 %80, %90
  %92 = zext i1 %91 to i32
  %93 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %94 = load i32** %l_13, align 8
  %95 = load i32* %94
  %96 = icmp slt i32 %93, %95
  %97 = zext i1 %96 to i32
  %98 = load i32* @g_3, align 4
  %99 = add nsw i32 %98, 1
  %100 = urem i32 %99, 3
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %101
  %103 = load i32* %102, align 4
  %104 = load i32* @g_3, align 4
  %105 = urem i32 %104, 3
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %106
  %108 = load i32* %107, align 4
  %109 = xor i32 %103, %108
  %110 = or i32 %97, %109
  %111 = icmp sge i32 %92, %110
  %112 = zext i1 %111 to i32
  %113 = icmp sge i32 %77, %112
  %114 = zext i1 %113 to i32
  %115 = or i32 %41, %114
  %116 = or i32 %40, %115
  %117 = load i32** %l_13, align 8
  store i32 %116, i32* %117
  %118 = load i16* %l_16, align 2
  %119 = sext i16 %118 to i32
  store i32 %119, i32* %1
  br label %150
                                                  ; No predecessors!
  %121 = load i32* @g_8, align 4
  %122 = trunc i32 %121 to i16
  %123 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %122, i16 signext 7)
  %124 = sext i16 %123 to i32
  store i32 %124, i32* @g_8, align 4
  br label %36

; <label>:125                                     ; preds = %36
  br label %126

; <label>:126                                     ; preds = %137, %125
  %127 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 2), align 4
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %130

; <label>:129                                     ; preds = %126
  br label %131

; <label>:130                                     ; preds = %126
  br label %131

; <label>:131                                     ; preds = %130, %129
  %132 = load i32* @g_3, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* @g_3, align 4
  br label %32

; <label>:134                                     ; preds = %32
  %135 = load i32* @g_3, align 4
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %138

; <label>:137                                     ; preds = %134
  br label %126

; <label>:138                                     ; preds = %134
  %139 = load i32* @g_3, align 4
  %140 = urem i32 %139, 3
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %141
  %143 = load i32* %142, align 4
  %144 = load volatile i32** @g_21, align 8
  store i32 %143, i32* %144
  %145 = load i32* @g_3, align 4
  %146 = urem i32 %145, 3
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %147
  %149 = load i32* %148, align 4
  store i32 %149, i32* %1
  br label %150

; <label>:150                                     ; preds = %138, %71, %14
  %151 = load i32* %1
  ret i32 %151
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

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
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
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* @g_3, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 1), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %17)
  %19 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 3), align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %19)
  %21 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 4), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %21)
  %23 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 5), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %23)
  %25 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 6), align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %25)
  %27 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %27)
  %29 = load i32* @g_8, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str11, i32 0, i32 0), i32 %29)
  %31 = load i32* %1
  ret i32 %31
}

declare i32 @printf(i8*, ...)
