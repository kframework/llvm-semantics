; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000848.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [1 x [4 x [3 x [1 x i16]]]] zeroinitializer, align 16
@g_4 = global i32 -4, align 4
@g_3 = global i32* @g_4, align 8
@.str = private unnamed_addr constant [31 x i8] c"checksum g_2[0][0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][0][1][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][0][2][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][1][2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][2][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][2][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][2][2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][3][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][3][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"checksum g_2[0][3][2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i64, align 8
  store i64 -1, i64* %l_5, align 8
  %tmp = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 0, i64 0), align 2
  %conv = zext i16 %tmp to i64
  %cmp = icmp sle i64 290607819, %conv
  %conv1 = zext i1 %cmp to i32
  %tmp2 = volatile load i32** @g_3, align 8
  store i32 %conv1, i32* %tmp2
  %tmp3 = load i64* %l_5, align 8
  %conv4 = trunc i64 %tmp3 to i8
  ret i8 %conv4
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 0, i64 0, i64 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 0, i64 1, i64 0), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 0, i64 2, i64 0), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 1, i64 0, i64 0), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 1, i64 1, i64 0), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 1, i64 2, i64 0), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 0, i64 0), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 1, i64 0), align 2
  %conv21 = zext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %tmp23 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 2, i64 0), align 2
  %conv24 = zext i16 %tmp23 to i32
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0), i32 %conv24)
  %tmp26 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 3, i64 0, i64 0), align 2
  %conv27 = zext i16 %tmp26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %conv27)
  %tmp29 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 3, i64 1, i64 0), align 2
  %conv30 = zext i16 %tmp29 to i32
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0), i32 %conv30)
  %tmp32 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 3, i64 2, i64 0), align 2
  %conv33 = zext i16 %tmp32 to i32
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %conv33)
  %tmp35 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i32 0, i64 0, i64 2, i64 0, i64 0), align 2
  %conv36 = zext i16 %tmp35 to i32
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %conv36)
  %tmp38 = load i32* @g_4, align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str12, i32 0, i32 0), i32 %tmp38)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
