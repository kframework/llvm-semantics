; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000848.ll'
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
  %tmp = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 2, i64 0, i64 0), align 4
  %tmp2 = volatile load i32** @g_3, align 8
  store i32 0, i32* %tmp2, align 4
  ret i8 -1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 2, i64 0, i64 0), align 4
  %tmp2.i = volatile load i32** @g_3, align 8
  store i32 0, i32* %tmp2.i, align 4
  %tmp = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 0, i64 0, i64 0), align 16
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 0, i64 1, i64 0), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 0, i64 2, i64 0), align 4
  %conv6 = zext i16 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 1, i64 0, i64 0), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 1, i64 1, i64 0), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 1, i64 2, i64 0), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 2, i64 0, i64 0), align 4
  %conv18 = zext i16 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 2, i64 1, i64 0), align 2
  %conv21 = zext i16 %tmp20 to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i64 0, i64 0), i32 %conv21) nounwind
  %tmp23 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 2, i64 2, i64 0), align 4
  %conv24 = zext i16 %tmp23 to i32
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i64 0, i64 0), i32 %conv24) nounwind
  %tmp26 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 3, i64 0, i64 0), align 2
  %conv27 = zext i16 %tmp26 to i32
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i64 0, i64 0), i32 %conv27) nounwind
  %tmp29 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 3, i64 1, i64 0), align 2
  %conv30 = zext i16 %tmp29 to i32
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i64 0, i64 0), i32 %conv30) nounwind
  %tmp32 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 3, i64 2, i64 0), align 2
  %conv33 = zext i16 %tmp32 to i32
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i64 0, i64 0), i32 %conv33) nounwind
  %tmp35 = volatile load i16* getelementptr inbounds ([1 x [4 x [3 x [1 x i16]]]]* @g_2, i64 0, i64 0, i64 2, i64 0, i64 0), align 4
  %conv36 = zext i16 %tmp35 to i32
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i64 0, i64 0), i32 %conv36) nounwind
  %tmp38 = load i32* @g_4, align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str12, i64 0, i64 0), i32 %tmp38) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
