; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000189.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { %struct.S0, i16, i32, i32, %struct.S0 }
%struct.S0 = type { i16, i32 }

@g_3 = global i32 -1, align 4
@g_4 = global %struct.S1 { %struct.S0 { i16 1, i32 1 }, i16 -484, i32 694272248, i32 5, %struct.S0 { i16 12411, i32 -895981076 } }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4.f0.f0 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4.f0.f1 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4.f1 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4.f2 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4.f3 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4.f4.f0 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4.f4.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S1* noalias sret %agg.result) nounwind uwtable {
  %l_2 = alloca i32*, align 8
  store i32* @g_3, i32** %l_2, align 8
  %1 = load i32** %l_2, align 8
  store i32 1, i32* %1
  %2 = bitcast %struct.S1* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S1* @g_4 to i8*), i64 28, i32 4, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %4 = alloca %struct.S1, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @func_1(%struct.S1* sret %4)
  %5 = load i32* @g_3, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load volatile i16* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 0, i32 0), align 2
  %8 = zext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load volatile i32* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 0, i32 1), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i16* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 1), align 2
  %13 = zext i16 %12 to i32
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load volatile i32* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 2), align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %15)
  %17 = load i32* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 3), align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %17)
  %19 = load i16* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 4, i32 0), align 2
  %20 = zext i16 %19 to i32
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %20)
  %22 = load i32* getelementptr inbounds (%struct.S1* @g_4, i32 0, i32 4, i32 1), align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %22)
  %24 = load i32* %1
  ret i32 %24
}

declare i32 @printf(i8*, ...)
