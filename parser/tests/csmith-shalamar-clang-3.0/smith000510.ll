; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000510.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [8 x [3 x i16]] [[3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8], [3 x i16] [i16 -8, i16 -8, i16 -8]], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][1] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][2] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][2] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_2[6][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_2[6][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_2[6][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_2[7][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_2[7][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_2[7][2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
  %1 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 4, i64 1), align 2
  %2 = sext i16 %1 to i32
  ret i32 %2
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @func_1()
  %5 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 0, i64 0), align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 0, i64 1), align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 0, i64 2), align 2
  %12 = sext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 1, i64 0), align 2
  %15 = sext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 1, i64 1), align 2
  %18 = sext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 1, i64 2), align 2
  %21 = sext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 2, i64 0), align 2
  %24 = sext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 2, i64 1), align 2
  %27 = sext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 2, i64 2), align 2
  %30 = sext i16 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 3, i64 0), align 2
  %33 = sext i16 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %33)
  %35 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 3, i64 1), align 2
  %36 = sext i16 %35 to i32
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %36)
  %38 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 3, i64 2), align 2
  %39 = sext i16 %38 to i32
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %39)
  %41 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 4, i64 0), align 2
  %42 = sext i16 %41 to i32
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %42)
  %44 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 4, i64 1), align 2
  %45 = sext i16 %44 to i32
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %45)
  %47 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 4, i64 2), align 2
  %48 = sext i16 %47 to i32
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %48)
  %50 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 5, i64 0), align 2
  %51 = sext i16 %50 to i32
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %51)
  %53 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 5, i64 1), align 2
  %54 = sext i16 %53 to i32
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %54)
  %56 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 5, i64 2), align 2
  %57 = sext i16 %56 to i32
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %57)
  %59 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 6, i64 0), align 2
  %60 = sext i16 %59 to i32
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %60)
  %62 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 6, i64 1), align 2
  %63 = sext i16 %62 to i32
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %63)
  %65 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 6, i64 2), align 2
  %66 = sext i16 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %66)
  %68 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 7, i64 0), align 2
  %69 = sext i16 %68 to i32
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %69)
  %71 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 7, i64 1), align 2
  %72 = sext i16 %71 to i32
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %72)
  %74 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 7, i64 2), align 2
  %75 = sext i16 %74 to i32
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %75)
  %77 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i32 0, i64 4, i64 1), align 2
  %78 = sext i16 %77 to i32
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %78)
  %80 = load i32* %1
  ret i32 %80
}

declare i32 @printf(i8*, ...)
