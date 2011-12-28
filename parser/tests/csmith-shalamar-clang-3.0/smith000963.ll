; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000963.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32 }

@g_3 = global [2 x i32] [i32 -1, i32 -1], align 4
@g_2 = global [5 x [10 x i32*]] [[10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)]], align 16
@g_7 = constant %struct.S0 { i32 -1180962629 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7.f0 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = alloca %struct.S0, align 4
  %l_4 = alloca [1 x [6 x i32**]], align 16
  %l_5 = alloca i64, align 8
  %l_6 = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 -3, i64* %l_5, align 8
  store i16 0, i16* %l_6, align 2
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %16, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 6
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1 x [6 x i32**]]* %l_4, i32 0, i64 %13
  %15 = getelementptr inbounds [6 x i32**]* %14, i32 0, i64 %11
  store i32** null, i32*** %15, align 8
  br label %16

; <label>:16                                      ; preds = %9
  %17 = load i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %6

; <label>:19                                      ; preds = %6
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  %24 = load i32** getelementptr inbounds ([5 x [10 x i32*]]* @g_2, i32 0, i64 1, i64 6), align 8
  store i32* %24, i32** getelementptr inbounds ([5 x [10 x i32*]]* @g_2, i32 0, i64 1, i64 6), align 8
  %25 = load i64* %l_5, align 8
  %26 = load i16* %l_6, align 2
  %27 = sext i16 %26 to i64
  %28 = xor i64 %27, %25
  %29 = trunc i64 %28 to i16
  store i16 %29, i16* %l_6, align 2
  %30 = bitcast %struct.S0* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* bitcast (%struct.S0* @g_7 to i8*), i64 4, i32 4, i1 false)
  %31 = getelementptr %struct.S0* %1, i32 0, i32 0
  %32 = load i32* %31
  ret i32 %32
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

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
  %5 = call i32 @func_1()
  %6 = getelementptr %struct.S0* %4, i32 0, i32 0
  store i32 %5, i32* %6
  %7 = load volatile i32* getelementptr inbounds ([2 x i32]* @g_3, i32 0, i64 0), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %7)
  %9 = load volatile i32* getelementptr inbounds ([2 x i32]* @g_3, i32 0, i64 1), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([2 x i32]* @g_3, i32 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds (%struct.S0* @g_7, i32 0, i32 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)
