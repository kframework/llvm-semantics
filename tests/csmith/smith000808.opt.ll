; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000808.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [8 x i8] c"\EE\EE\EE\EE\EE\EE\EE\EE", align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  store i64 -4919131752989213765, i64* bitcast ([8 x i8]* @g_4 to i64*), align 8
  ret i8 -126
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i64 -4919131752989213765, i64* bitcast ([8 x i8]* @g_4 to i64*), align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 187) nounwind
  %tmp2 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 1), align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 2), align 2
  %conv6 = zext i8 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 3), align 1
  %conv9 = zext i8 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 4), align 4
  %conv12 = zext i8 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 5), align 1
  %conv15 = zext i8 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 6), align 2
  %conv18 = zext i8 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i64 0, i64 7), align 1
  %conv21 = zext i8 %tmp20 to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %conv21) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
