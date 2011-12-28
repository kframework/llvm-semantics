; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000092.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [3 x [4 x i32]] [[4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10], [4 x i32] [i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_33 = global i32 0, align 4
@g_32 = global i32* @g_33, align 8
@g_36 = global i32* @g_33, align 8
@g_38 = global i32* @g_33, align 8
@g_37 = global i32** @g_38, align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][3] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [20 x i8] c"checksum g_33 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp2 = volatile load i32** @g_32, align 8
  store i32 -2, i32* @g_33, align 4
  ret i32 -2
}

define i32 @func_6(i32 %p_7, i64 %p_8, i64 %p_9, i64 %p_10, i32 %p_11) nounwind uwtable {
for.body:
  %tmp1 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 2, i64 0), align 16
  ret i32 %tmp1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp2.i = volatile load i32** @g_32, align 8
  store i32 -2, i32* @g_33, align 4
  %tmp = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 1, i64 0), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 1, i64 1), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 1, i64 2), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 1, i64 3), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 2, i64 0), align 16
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 2, i64 1), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 2, i64 2), align 8
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 2, i64 3), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([3 x [4 x i32]]* @g_5, i64 0, i64 2, i64 0), align 16
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* @g_33, align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str12, i64 0, i64 0), i32 %tmp26) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
