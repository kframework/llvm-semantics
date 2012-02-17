; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001260.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [9 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_2[8] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readonly {
entry:
  %tmp = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 5), align 2
  %conv = sext i16 %tmp to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 0), align 16
  %conv = sext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 1), align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 2), align 4
  %conv6 = sext i16 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 3), align 2
  %conv9 = sext i16 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 4), align 8
  %conv12 = sext i16 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 5), align 2
  %conv15 = sext i16 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 6), align 4
  %conv18 = sext i16 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 7), align 2
  %conv21 = sext i16 %tmp20 to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %conv21) nounwind
  %tmp23 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 8), align 16
  %conv24 = sext i16 %tmp23 to i32
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 %conv24) nounwind
  %tmp26 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i64 0, i64 5), align 2
  %conv27 = sext i16 %tmp26 to i32
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %conv27) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
