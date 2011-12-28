; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001735.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [4 x [4 x i8]] [[4 x i8] c"\FF\FF\FF\FF", [4 x i8] c"\FF\FF\FF\FF", [4 x i8] c"\FF\FF\FF\FF", [4 x i8] c"\FF\FF\FF\FF"], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable readonly {
entry:
  %tmp = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 1, i64 0), align 4
  %conv = sext i8 %tmp to i64
  ret i64 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 0, i64 0), align 16
  %conv = sext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 0, i64 1), align 1
  %conv3 = sext i8 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 0, i64 2), align 2
  %conv6 = sext i8 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 0, i64 3), align 1
  %conv9 = sext i8 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 1, i64 0), align 4
  %conv12 = sext i8 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 1, i64 1), align 1
  %conv15 = sext i8 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 1, i64 2), align 2
  %conv18 = sext i8 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 1, i64 3), align 1
  %conv21 = sext i8 %tmp20 to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %conv21) nounwind
  %tmp23 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 2, i64 0), align 8
  %conv24 = sext i8 %tmp23 to i32
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %conv24) nounwind
  %tmp26 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 2, i64 1), align 1
  %conv27 = sext i8 %tmp26 to i32
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %conv27) nounwind
  %tmp29 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 2, i64 2), align 2
  %conv30 = sext i8 %tmp29 to i32
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %conv30) nounwind
  %tmp32 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 2, i64 3), align 1
  %conv33 = sext i8 %tmp32 to i32
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %conv33) nounwind
  %tmp35 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 3, i64 0), align 4
  %conv36 = sext i8 %tmp35 to i32
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %conv36) nounwind
  %tmp38 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 3, i64 1), align 1
  %conv39 = sext i8 %tmp38 to i32
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %conv39) nounwind
  %tmp41 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 3, i64 2), align 2
  %conv42 = sext i8 %tmp41 to i32
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %conv42) nounwind
  %tmp44 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 3, i64 3), align 1
  %conv45 = sext i8 %tmp44 to i32
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %conv45) nounwind
  %tmp47 = load i8* getelementptr inbounds ([4 x [4 x i8]]* @g_2, i64 0, i64 1, i64 0), align 4
  %conv48 = sext i8 %tmp47 to i32
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv48) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
