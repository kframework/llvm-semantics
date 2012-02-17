; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001704.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i16, i8, i16, i16 }

@g_4 = global [2 x i32] zeroinitializer, align 4
@g_5 = global %struct.S0 { i16 -11030, i16 -1, i8 -4, i16 0, i16 12254 }, align 2
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5.f0 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5.f1 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5.f2 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5.f3 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5.f4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define { i64, i16 } @func_1() nounwind uwtable {
  %1 = alloca %struct.S0, align 2
  %l_2 = alloca i16, align 2
  %l_3 = alloca i32*, align 8
  %2 = alloca { i64, i16 }
  store i16 -3, i16* %l_2, align 2
  store i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 0), i32** %l_3, align 8
  %3 = load i16* %l_2, align 2
  %4 = zext i16 %3 to i32
  %5 = load i32** %l_3, align 8
  %6 = load i32* %5
  %7 = xor i32 %6, %4
  store i32 %7, i32* %5
  %8 = bitcast %struct.S0* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast (%struct.S0* @g_5 to i8*), i64 10, i32 2, i1 false)
  %9 = bitcast { i64, i16 }* %2 to %struct.S0*
  %10 = load %struct.S0* %1
  store %struct.S0 %10, %struct.S0* %9, align 1
  %11 = load { i64, i16 }* %2
  ret { i64, i16 } %11
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %4 = alloca %struct.S0, align 2
  %5 = alloca { i64, i16 }
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %6 = call { i64, i16 } @func_1()
  store { i64, i16 } %6, { i64, i16 }* %5
  %7 = bitcast { i64, i16 }* %5 to %struct.S0*
  %8 = load %struct.S0* %7, align 1
  store %struct.S0 %8, %struct.S0* %4
  %9 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 0), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 1), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 0), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %13)
  %15 = load volatile i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 0), align 2
  %16 = sext i16 %15 to i32
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %16)
  %18 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 1), align 2
  %19 = sext i16 %18 to i32
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %19)
  %21 = load i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 2), align 1
  %22 = sext i8 %21 to i32
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %22)
  %24 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 3), align 2
  %25 = zext i16 %24 to i32
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %25)
  %27 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 4), align 2
  %28 = sext i16 %27 to i32
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %28)
  %30 = load i32* %1
  ret i32 %30
}

declare i32 @printf(i8*, ...)
