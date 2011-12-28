; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000551.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { i16, i16, i32, i32, %struct.S0, %struct.S0, i8, i32 }
%struct.S0 = type { i16, i32, i8 }

@g_2 = global { i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 } { i16 6846, i16 -3568, i32 0, i32 -2, { i16, i32, i8, [3 x i8] } { i16 30940, i32 -1473638230, i8 -7, [3 x i8] undef }, { i16, i32, i8, [3 x i8] } { i16 1, i32 -1014273266, i8 0, [3 x i8] undef }, i8 -1, i32 -3 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2.f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2.f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2.f4.f0 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2.f4.f1 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2.f4.f2 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2.f5.f0 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2.f5.f1 = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2.f5.f2 = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_2.f6 = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [22 x i8] c"checksum g_2.f7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S1* noalias sret %agg.result) nounwind uwtable {
  %1 = bitcast %struct.S1* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to i8*), i64 44, i32 4, i1 false)
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
  %5 = load i16* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 0), align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load volatile i16* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 1), align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load i16* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 4, i32 0), align 2
  %16 = sext i16 %15 to i32
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i32* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 4, i32 1), align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %18)
  %20 = load volatile i8* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 4, i32 2), align 1
  %21 = sext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 5, i32 0), align 2
  %24 = sext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %24)
  %26 = load i32* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 5, i32 1), align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %26)
  %28 = load volatile i8* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 5, i32 2), align 1
  %29 = sext i8 %28 to i32
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %29)
  %31 = load i8* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 6), align 1
  %32 = sext i8 %31 to i32
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %32)
  %34 = load volatile i32* getelementptr inbounds (%struct.S1* bitcast ({ i16, i16, i32, i32, { i16, i32, i8, [3 x i8] }, { i16, i32, i8, [3 x i8] }, i8, i32 }* @g_2 to %struct.S1*), i32 0, i32 7), align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str11, i32 0, i32 0), i32 %34)
  %36 = load i32* %1
  ret i32 %36
}

declare i32 @printf(i8*, ...)
