; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000510.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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

define i32 @func_1() nounwind uwtable readonly {
entry:
  %tmp = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 4, i64 1), align 2
  %conv = sext i16 %tmp to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 0, i64 0), align 16
  %conv = sext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 0, i64 1), align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 0, i64 2), align 4
  %conv6 = sext i16 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 1, i64 0), align 2
  %conv9 = sext i16 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 1, i64 1), align 2
  %conv12 = sext i16 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 1, i64 2), align 2
  %conv15 = sext i16 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 2, i64 0), align 4
  %conv18 = sext i16 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 2, i64 1), align 2
  %conv21 = sext i16 %tmp20 to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %conv21) nounwind
  %tmp23 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 2, i64 2), align 4
  %conv24 = sext i16 %tmp23 to i32
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %conv24) nounwind
  %tmp26 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 3, i64 0), align 2
  %conv27 = sext i16 %tmp26 to i32
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %conv27) nounwind
  %tmp29 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 3, i64 1), align 2
  %conv30 = sext i16 %tmp29 to i32
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %conv30) nounwind
  %tmp32 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 3, i64 2), align 2
  %conv33 = sext i16 %tmp32 to i32
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %conv33) nounwind
  %tmp35 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 4, i64 0), align 8
  %conv36 = sext i16 %tmp35 to i32
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %conv36) nounwind
  %tmp38 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 4, i64 1), align 2
  %conv39 = sext i16 %tmp38 to i32
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %conv39) nounwind
  %tmp41 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 4, i64 2), align 4
  %conv42 = sext i16 %tmp41 to i32
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %conv42) nounwind
  %tmp44 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 5, i64 0), align 2
  %conv45 = sext i16 %tmp44 to i32
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %conv45) nounwind
  %tmp47 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 5, i64 1), align 2
  %conv48 = sext i16 %tmp47 to i32
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %conv48) nounwind
  %tmp50 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 5, i64 2), align 2
  %conv51 = sext i16 %tmp50 to i32
  %call52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 %conv51) nounwind
  %tmp53 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 6, i64 0), align 4
  %conv54 = sext i16 %tmp53 to i32
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 %conv54) nounwind
  %tmp56 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 6, i64 1), align 2
  %conv57 = sext i16 %tmp56 to i32
  %call58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i64 0, i64 0), i32 %conv57) nounwind
  %tmp59 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 6, i64 2), align 4
  %conv60 = sext i16 %tmp59 to i32
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i64 0, i64 0), i32 %conv60) nounwind
  %tmp62 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 7, i64 0), align 2
  %conv63 = sext i16 %tmp62 to i32
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i64 0, i64 0), i32 %conv63) nounwind
  %tmp65 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 7, i64 1), align 2
  %conv66 = sext i16 %tmp65 to i32
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i64 0, i64 0), i32 %conv66) nounwind
  %tmp68 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 7, i64 2), align 2
  %conv69 = sext i16 %tmp68 to i32
  %call70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i64 0, i64 0), i32 %conv69) nounwind
  %tmp71 = load i16* getelementptr inbounds ([8 x [3 x i16]]* @g_2, i64 0, i64 4, i64 1), align 2
  %conv72 = sext i16 %tmp71 to i32
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %conv72) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
