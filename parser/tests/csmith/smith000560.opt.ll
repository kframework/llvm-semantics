; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000560.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [4 x [5 x i32]] [[5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8], [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8], [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8], [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8]], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][4] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][2] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][3] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable readonly {
entry:
  %tmp = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 1), align 4
  %conv = trunc i32 %tmp to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 0), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 1), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 2), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 3), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 4), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 2, i64 0), align 8
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 2, i64 1), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 2, i64 2), align 8
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 2, i64 3), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 2, i64 4), align 8
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 3, i64 0), align 4
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 3, i64 1), align 4
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 3, i64 2), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 3, i64 3), align 4
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 3, i64 4), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_2, i64 0, i64 1, i64 1), align 4
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp40) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
