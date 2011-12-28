; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000506.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 966279603, align 4
@g_6 = global i32 7, align 4
@g_7 = global i32 -10, align 4
@g_8 = global i32 1013135427, align 4
@g_9 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = alloca i16, align 2
  %l_5 = alloca [8 x [7 x [1 x [1 x [1 x i8]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_10 = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %k3 = alloca i32, align 4
  %l4 = alloca i32, align 4
  %m5 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %53, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %56

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %49, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 7
  br i1 %8, label %9, label %52

; <label>:9                                       ; preds = %6
  store i32 0, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %45, %9
  %11 = load i32* %k, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %13, label %48

; <label>:13                                      ; preds = %10
  store i32 0, i32* %l, align 4
  br label %14

; <label>:14                                      ; preds = %41, %13
  %15 = load i32* %l, align 4
  %16 = icmp slt i32 %15, 1
  br i1 %16, label %17, label %44

; <label>:17                                      ; preds = %14
  store i32 0, i32* %m, align 4
  br label %18

; <label>:18                                      ; preds = %37, %17
  %19 = load i32* %m, align 4
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %21, label %40

; <label>:21                                      ; preds = %18
  %22 = load i32* %m, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32* %l, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32* %k, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x [7 x [1 x [1 x [1 x i8]]]]]* %l_5, i32 0, i64 %31
  %33 = getelementptr inbounds [7 x [1 x [1 x [1 x i8]]]]* %32, i32 0, i64 %29
  %34 = getelementptr inbounds [1 x [1 x [1 x i8]]]* %33, i32 0, i64 %27
  %35 = getelementptr inbounds [1 x [1 x i8]]* %34, i32 0, i64 %25
  %36 = getelementptr inbounds [1 x i8]* %35, i32 0, i64 %23
  store i8 20, i8* %36, align 1
  br label %37

; <label>:37                                      ; preds = %21
  %38 = load i32* %m, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %m, align 4
  br label %18

; <label>:40                                      ; preds = %18
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %l, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %l, align 4
  br label %14

; <label>:44                                      ; preds = %14
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %k, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %k, align 4
  br label %10

; <label>:48                                      ; preds = %10
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i32* %j, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %j, align 4
  br label %6

; <label>:52                                      ; preds = %6
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load i32* %i, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %i, align 4
  br label %2

; <label>:56                                      ; preds = %2
  store i32 0, i32* @g_2, align 4
  br label %57

; <label>:57                                      ; preds = %103, %56
  %58 = load i32* @g_2, align 4
  %59 = icmp sge i32 %58, -28
  br i1 %59, label %60, label %108

; <label>:60                                      ; preds = %57
  store i32 700532303, i32* %l_10, align 4
  store i32 7, i32* @g_2, align 4
  br label %61

; <label>:61                                      ; preds = %99, %60
  %62 = load i32* @g_2, align 4
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %102

; <label>:64                                      ; preds = %61
  store i32 2, i32* @g_6, align 4
  br label %65

; <label>:65                                      ; preds = %95, %64
  %66 = load i32* @g_6, align 4
  %67 = icmp slt i32 %66, 7
  br i1 %67, label %68, label %98

; <label>:68                                      ; preds = %65
  store i32 0, i32* @g_7, align 4
  br label %69

; <label>:69                                      ; preds = %91, %68
  %70 = load i32* @g_7, align 4
  %71 = icmp slt i32 %70, 1
  br i1 %71, label %72, label %94

; <label>:72                                      ; preds = %69
  store volatile i32 0, i32* @g_8, align 4
  br label %73

; <label>:73                                      ; preds = %87, %72
  %74 = load volatile i32* @g_8, align 4
  %75 = icmp slt i32 %74, 1
  br i1 %75, label %76, label %90

; <label>:76                                      ; preds = %73
  store volatile i32 0, i32* @g_9, align 4
  br label %77

; <label>:77                                      ; preds = %83, %76
  %78 = load volatile i32* @g_9, align 4
  %79 = icmp slt i32 %78, 1
  br i1 %79, label %80, label %86

; <label>:80                                      ; preds = %77
  %81 = load i32* %l_10, align 4
  %82 = trunc i32 %81 to i16
  store i16 %82, i16* %1
  br label %127
                                                  ; No predecessors!
  %84 = load volatile i32* @g_9, align 4
  %85 = add nsw i32 %84, 1
  store volatile i32 %85, i32* @g_9, align 4
  br label %77

; <label>:86                                      ; preds = %77
  br label %87

; <label>:87                                      ; preds = %86
  %88 = load volatile i32* @g_8, align 4
  %89 = add nsw i32 %88, 1
  store volatile i32 %89, i32* @g_8, align 4
  br label %73

; <label>:90                                      ; preds = %73
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load i32* @g_7, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* @g_7, align 4
  br label %69

; <label>:94                                      ; preds = %69
  br label %95

; <label>:95                                      ; preds = %94
  %96 = load i32* @g_6, align 4
  %97 = add nsw i32 %96, 3
  store i32 %97, i32* @g_6, align 4
  br label %65

; <label>:98                                      ; preds = %65
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load i32* @g_2, align 4
  %101 = add nsw i32 %100, -5
  store i32 %101, i32* @g_2, align 4
  br label %61

; <label>:102                                     ; preds = %61
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load i32* @g_2, align 4
  %105 = trunc i32 %104 to i8
  %106 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %105, i8 signext 4)
  %107 = sext i8 %106 to i32
  store i32 %107, i32* @g_2, align 4
  br label %57

; <label>:108                                     ; preds = %57
  %109 = getelementptr inbounds [8 x [7 x [1 x [1 x [1 x i8]]]]]* %l_5, i32 0, i64 2
  %110 = getelementptr inbounds [7 x [1 x [1 x [1 x i8]]]]* %109, i32 0, i64 6
  %111 = getelementptr inbounds [1 x [1 x [1 x i8]]]* %110, i32 0, i64 0
  %112 = getelementptr inbounds [1 x [1 x i8]]* %111, i32 0, i64 0
  %113 = getelementptr inbounds [1 x i8]* %112, i32 0, i64 0
  %114 = load i8* %113, align 1
  %115 = sext i8 %114 to i32
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %122, label %117

; <label>:117                                     ; preds = %108
  %118 = load i32* @g_7, align 4
  %119 = sext i32 %118 to i64
  %120 = or i64 885548468, %119
  %121 = icmp ne i64 %120, 0
  br label %122

; <label>:122                                     ; preds = %117, %108
  %123 = phi i1 [ true, %108 ], [ %121, %117 ]
  %124 = zext i1 %123 to i32
  store volatile i32 %124, i32* @g_9, align 4
  %125 = load i32* @g_2, align 4
  %126 = trunc i32 %125 to i16
  store i16 %126, i16* %1
  br label %127

; <label>:127                                     ; preds = %122, %80
  %128 = load i16* %1
  ret i16 %128
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call zeroext i16 @func_1()
  %5 = load i32* @g_2, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* @g_6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* @g_7, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* @g_8, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* @g_9, align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)
