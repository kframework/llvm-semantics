; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000254.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S2 = type { i8, i8, i32, i32 }

@g_4 = global [2 x %struct.S2] [%struct.S2 { i8 -9, i8 -12, i32 -1, i32 1052116627 }, %struct.S2 { i8 -9, i8 -12, i32 -1, i32 1052116627 }], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f0 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f1 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f2 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %l_3 = alloca %struct.S2*, align 8
  %l_2 = alloca %struct.S2**, align 8
  store %struct.S2* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1), %struct.S2** %l_3, align 8
  store %struct.S2** %l_3, %struct.S2*** %l_2, align 8
  %1 = load %struct.S2*** %l_2, align 8
  store %struct.S2* null, %struct.S2** %1
  %2 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 0), align 1
  %3 = sext i8 %2 to i32
  ret i32 %3
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
  %5 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 0), align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 1), align 1
  %9 = zext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load volatile i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 2), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %11)
  %13 = load volatile i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 3), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %13)
  %15 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 0), align 1
  %16 = sext i8 %15 to i32
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %18 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 1), align 1
  %19 = zext i8 %18 to i32
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %19)
  %21 = load volatile i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 2), align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %21)
  %23 = load volatile i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 3), align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %23)
  %25 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 0), align 1
  %26 = sext i8 %25 to i32
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %26)
  %28 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 1), align 1
  %29 = zext i8 %28 to i32
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %29)
  %31 = load volatile i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 2), align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %31)
  %33 = load volatile i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 3), align 4
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %33)
  %35 = load i32* %1
  ret i32 %35
}

declare i32 @printf(i8*, ...)
