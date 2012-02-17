; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith000689.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant [10 x [7 x i16]] [[7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074], [7 x i16] [i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074, i16 18074]], align 16
@g_5 = global i32 6, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_4[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_4[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][2] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][3] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][4] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][5] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_4[3][6] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][5] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_4[4][6] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][1] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][2] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][3] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][4] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][5] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_4[5][6] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][0] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][1] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][2] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][3] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][4] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][5] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_4[6][6] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][1] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][2] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][3] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][4] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][5] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_4[7][6] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][0] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][1] = %d\0A\00", align 1
@.str58 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][2] = %d\0A\00", align 1
@.str59 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][3] = %d\0A\00", align 1
@.str60 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][4] = %d\0A\00", align 1
@.str61 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][5] = %d\0A\00", align 1
@.str62 = private unnamed_addr constant [25 x i8] c"checksum g_4[8][6] = %d\0A\00", align 1
@.str63 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][0] = %d\0A\00", align 1
@.str64 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][1] = %d\0A\00", align 1
@.str65 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][2] = %d\0A\00", align 1
@.str66 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][3] = %d\0A\00", align 1
@.str67 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][4] = %d\0A\00", align 1
@.str68 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][5] = %d\0A\00", align 1
@.str69 = private unnamed_addr constant [25 x i8] c"checksum g_4[9][6] = %d\0A\00", align 1
@.str70 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
  %1 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %2 = trunc i16 %1 to i8
  %3 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %4 = trunc i16 %3 to i8
  %5 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %2, i8 zeroext %4)
  %6 = zext i8 %5 to i32
  %7 = load i32* @g_5, align 4
  %8 = or i32 %7, %6
  store i32 %8, i32* @g_5, align 4
  %9 = load i32* @g_5, align 4
  %10 = trunc i32 %9 to i16
  ret i16 %10
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
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
  %4 = call zeroext i16 @func_1()
  %5 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 0), align 2
  %6 = sext i16 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 1), align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 2), align 2
  %12 = sext i16 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %12)
  %14 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 3), align 2
  %15 = sext i16 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %15)
  %17 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 4), align 2
  %18 = sext i16 %17 to i32
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %18)
  %20 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 5), align 2
  %21 = sext i16 %20 to i32
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %21)
  %23 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 0, i64 6), align 2
  %24 = sext i16 %23 to i32
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %24)
  %26 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 0), align 2
  %27 = sext i16 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %27)
  %29 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 1), align 2
  %30 = sext i16 %29 to i32
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %30)
  %32 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 2), align 2
  %33 = sext i16 %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %33)
  %35 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 3), align 2
  %36 = sext i16 %35 to i32
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %36)
  %38 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 4), align 2
  %39 = sext i16 %38 to i32
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %39)
  %41 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 5), align 2
  %42 = sext i16 %41 to i32
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %42)
  %44 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %45 = sext i16 %44 to i32
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %45)
  %47 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 0), align 2
  %48 = sext i16 %47 to i32
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %48)
  %50 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 1), align 2
  %51 = sext i16 %50 to i32
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %51)
  %53 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 2), align 2
  %54 = sext i16 %53 to i32
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %54)
  %56 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 3), align 2
  %57 = sext i16 %56 to i32
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %57)
  %59 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 4), align 2
  %60 = sext i16 %59 to i32
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %60)
  %62 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 5), align 2
  %63 = sext i16 %62 to i32
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %63)
  %65 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 2, i64 6), align 2
  %66 = sext i16 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %66)
  %68 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 0), align 2
  %69 = sext i16 %68 to i32
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %69)
  %71 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 1), align 2
  %72 = sext i16 %71 to i32
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %72)
  %74 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 2), align 2
  %75 = sext i16 %74 to i32
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %75)
  %77 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 3), align 2
  %78 = sext i16 %77 to i32
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %78)
  %80 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 4), align 2
  %81 = sext i16 %80 to i32
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %81)
  %83 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 5), align 2
  %84 = sext i16 %83 to i32
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %84)
  %86 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 3, i64 6), align 2
  %87 = sext i16 %86 to i32
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %87)
  %89 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 0), align 2
  %90 = sext i16 %89 to i32
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %90)
  %92 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 1), align 2
  %93 = sext i16 %92 to i32
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %93)
  %95 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 2), align 2
  %96 = sext i16 %95 to i32
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %96)
  %98 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 3), align 2
  %99 = sext i16 %98 to i32
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %99)
  %101 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 4), align 2
  %102 = sext i16 %101 to i32
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %102)
  %104 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 5), align 2
  %105 = sext i16 %104 to i32
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %105)
  %107 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 4, i64 6), align 2
  %108 = sext i16 %107 to i32
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %108)
  %110 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 0), align 2
  %111 = sext i16 %110 to i32
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %111)
  %113 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 1), align 2
  %114 = sext i16 %113 to i32
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %114)
  %116 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 2), align 2
  %117 = sext i16 %116 to i32
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %117)
  %119 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 3), align 2
  %120 = sext i16 %119 to i32
  %121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %120)
  %122 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 4), align 2
  %123 = sext i16 %122 to i32
  %124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %123)
  %125 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 5), align 2
  %126 = sext i16 %125 to i32
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %126)
  %128 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 5, i64 6), align 2
  %129 = sext i16 %128 to i32
  %130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %129)
  %131 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 0), align 2
  %132 = sext i16 %131 to i32
  %133 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %132)
  %134 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 1), align 2
  %135 = sext i16 %134 to i32
  %136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %135)
  %137 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 2), align 2
  %138 = sext i16 %137 to i32
  %139 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %138)
  %140 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 3), align 2
  %141 = sext i16 %140 to i32
  %142 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %141)
  %143 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 4), align 2
  %144 = sext i16 %143 to i32
  %145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %144)
  %146 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 5), align 2
  %147 = sext i16 %146 to i32
  %148 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %147)
  %149 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 6, i64 6), align 2
  %150 = sext i16 %149 to i32
  %151 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %150)
  %152 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 0), align 2
  %153 = sext i16 %152 to i32
  %154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i32 0, i32 0), i32 %153)
  %155 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 1), align 2
  %156 = sext i16 %155 to i32
  %157 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i32 0, i32 0), i32 %156)
  %158 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 2), align 2
  %159 = sext i16 %158 to i32
  %160 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i32 0, i32 0), i32 %159)
  %161 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 3), align 2
  %162 = sext i16 %161 to i32
  %163 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i32 0, i32 0), i32 %162)
  %164 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 4), align 2
  %165 = sext i16 %164 to i32
  %166 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i32 0, i32 0), i32 %165)
  %167 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 5), align 2
  %168 = sext i16 %167 to i32
  %169 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i32 0, i32 0), i32 %168)
  %170 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 7, i64 6), align 2
  %171 = sext i16 %170 to i32
  %172 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i32 0, i32 0), i32 %171)
  %173 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 0), align 2
  %174 = sext i16 %173 to i32
  %175 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i32 0, i32 0), i32 %174)
  %176 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 1), align 2
  %177 = sext i16 %176 to i32
  %178 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str57, i32 0, i32 0), i32 %177)
  %179 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 2), align 2
  %180 = sext i16 %179 to i32
  %181 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str58, i32 0, i32 0), i32 %180)
  %182 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 3), align 2
  %183 = sext i16 %182 to i32
  %184 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str59, i32 0, i32 0), i32 %183)
  %185 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 4), align 2
  %186 = sext i16 %185 to i32
  %187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str60, i32 0, i32 0), i32 %186)
  %188 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 5), align 2
  %189 = sext i16 %188 to i32
  %190 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str61, i32 0, i32 0), i32 %189)
  %191 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 8, i64 6), align 2
  %192 = sext i16 %191 to i32
  %193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str62, i32 0, i32 0), i32 %192)
  %194 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 0), align 2
  %195 = sext i16 %194 to i32
  %196 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str63, i32 0, i32 0), i32 %195)
  %197 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 1), align 2
  %198 = sext i16 %197 to i32
  %199 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str64, i32 0, i32 0), i32 %198)
  %200 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 2), align 2
  %201 = sext i16 %200 to i32
  %202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str65, i32 0, i32 0), i32 %201)
  %203 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 3), align 2
  %204 = sext i16 %203 to i32
  %205 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str66, i32 0, i32 0), i32 %204)
  %206 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 4), align 2
  %207 = sext i16 %206 to i32
  %208 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str67, i32 0, i32 0), i32 %207)
  %209 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 5), align 2
  %210 = sext i16 %209 to i32
  %211 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str68, i32 0, i32 0), i32 %210)
  %212 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 9, i64 6), align 2
  %213 = sext i16 %212 to i32
  %214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str69, i32 0, i32 0), i32 %213)
  %215 = load i16* getelementptr inbounds ([10 x [7 x i16]]* @g_4, i32 0, i64 1, i64 6), align 2
  %216 = sext i16 %215 to i32
  %217 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %216)
  %218 = load i32* @g_5, align 4
  %219 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str70, i32 0, i32 0), i32 %218)
  %220 = load i32* %1
  ret i32 %220
}

declare i32 @printf(i8*, ...)
