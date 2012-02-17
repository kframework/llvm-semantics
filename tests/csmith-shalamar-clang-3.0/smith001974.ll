; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001974.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [4 x [6 x i8]] [[6 x i8] c"\12\12\12\12\12\12", [6 x i8] c"\12\12\12\12\12\12", [6 x i8] c"\12\12\12\12\12\12", [6 x i8] c"\12\12\12\12\12\12"], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][5] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][3] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][4] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][5] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][4] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
  %l_4 = alloca i32, align 4
  store i32 1208023666, i32* %l_4, align 4
  %1 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext 1, i16 zeroext -1422)
  %2 = zext i16 %1 to i32
  %3 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  %4 = zext i8 %3 to i32
  %5 = or i32 %4, %2
  %6 = trunc i32 %5 to i8
  store i8 %6, i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  ret i8 114
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %ui1, i16* %1, align 2
  store i16 %ui2, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i16* %1, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* %2, align 2
  %13 = zext i16 %12 to i32
  %14 = sdiv i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i16
  ret i16 %17
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
  %4 = call zeroext i8 @func_1()
  %5 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 0), align 1
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 1), align 1
  %9 = zext i8 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 2), align 1
  %12 = zext i8 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 3), align 1
  %15 = zext i8 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 4), align 1
  %18 = zext i8 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 0, i64 5), align 1
  %21 = zext i8 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 0), align 1
  %24 = zext i8 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 1), align 1
  %27 = zext i8 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 2), align 1
  %30 = zext i8 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 3), align 1
  %33 = zext i8 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %33)
  %35 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 4), align 1
  %36 = zext i8 %35 to i32
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %36)
  %38 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 1, i64 5), align 1
  %39 = zext i8 %38 to i32
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %39)
  %41 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 0), align 1
  %42 = zext i8 %41 to i32
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %42)
  %44 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 1), align 1
  %45 = zext i8 %44 to i32
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %45)
  %47 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  %48 = zext i8 %47 to i32
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %48)
  %50 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 3), align 1
  %51 = zext i8 %50 to i32
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %51)
  %53 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 4), align 1
  %54 = zext i8 %53 to i32
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %54)
  %56 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 5), align 1
  %57 = zext i8 %56 to i32
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %57)
  %59 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 0), align 1
  %60 = zext i8 %59 to i32
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %60)
  %62 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 1), align 1
  %63 = zext i8 %62 to i32
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %63)
  %65 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 2), align 1
  %66 = zext i8 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %66)
  %68 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 3), align 1
  %69 = zext i8 %68 to i32
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %69)
  %71 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 4), align 1
  %72 = zext i8 %71 to i32
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %72)
  %74 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 3, i64 5), align 1
  %75 = zext i8 %74 to i32
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %75)
  %77 = load i8* getelementptr inbounds ([4 x [6 x i8]]* @g_5, i32 0, i64 2, i64 2), align 1
  %78 = zext i8 %77 to i32
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %78)
  %80 = load i32* %1
  ret i32 %80
}

declare i32 @printf(i8*, ...)
