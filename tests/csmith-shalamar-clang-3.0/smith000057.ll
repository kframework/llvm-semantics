; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000057.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i32, i32, i16, i32, i32, i16, i16, i16, i32 }

@g_2 = global %struct.S0 { i16 2020, i32 0, i32 -2047168541, i16 -2681, i32 -638706537, i32 316620087, i16 23421, i16 5, i16 -5, i32 -842840578 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2.f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2.f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2.f4 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2.f5 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2.f6 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2.f7 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_2.f8 = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_2.f9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* noalias sret %agg.result) nounwind uwtable {
  %1 = bitcast %struct.S0* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.S0* @g_2 to i8*), i64 36, i32 4, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %4 = alloca %struct.S0, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @func_1(%struct.S0* sret %4)
  %5 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 0), align 2
  %6 = zext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 1), align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 2), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 3), align 2
  %13 = sext i16 %12 to i32
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 4), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 5), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %17)
  %19 = load volatile i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 6), align 2
  %20 = sext i16 %19 to i32
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %20)
  %22 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 7), align 2
  %23 = sext i16 %22 to i32
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %23)
  %25 = load volatile i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 8), align 2
  %26 = zext i16 %25 to i32
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %26)
  %28 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 9), align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %28)
  %30 = load i32* %1
  ret i32 %30
}

declare i32 @printf(i8*, ...)
