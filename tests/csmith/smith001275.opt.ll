; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001275.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -878530592, align 4
@g_6 = global [7 x [2 x [1 x i8]]] [[2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"]], align 1
@g_7 = global i32 0, align 4
@g_8 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_6[1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_6[1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_6[2][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_6[2][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_6[3][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_6[3][1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_6[4][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_6[4][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_6[5][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_6[5][1][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_6[6][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_6[6][1][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  ret i16 -7
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %tmp2 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 0, i64 0, i64 0), align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 0, i64 1, i64 0), align 1
  %conv5 = zext i8 %tmp4 to i32
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 %conv5) nounwind
  %tmp7 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 1, i64 0, i64 0), align 1
  %conv8 = zext i8 %tmp7 to i32
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i64 0, i64 0), i32 %conv8) nounwind
  %tmp10 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 1, i64 1, i64 0), align 1
  %conv11 = zext i8 %tmp10 to i32
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i64 0, i64 0), i32 %conv11) nounwind
  %tmp13 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 2, i64 0, i64 0), align 1
  %conv14 = zext i8 %tmp13 to i32
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), i32 %conv14) nounwind
  %tmp16 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 2, i64 1, i64 0), align 1
  %conv17 = zext i8 %tmp16 to i32
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i64 0, i64 0), i32 %conv17) nounwind
  %tmp19 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 3, i64 0, i64 0), align 1
  %conv20 = zext i8 %tmp19 to i32
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i64 0, i64 0), i32 %conv20) nounwind
  %tmp22 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 3, i64 1, i64 0), align 1
  %conv23 = zext i8 %tmp22 to i32
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i64 0, i64 0), i32 %conv23) nounwind
  %tmp25 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 4, i64 0, i64 0), align 1
  %conv26 = zext i8 %tmp25 to i32
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i64 0, i64 0), i32 %conv26) nounwind
  %tmp28 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 4, i64 1, i64 0), align 1
  %conv29 = zext i8 %tmp28 to i32
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i64 0, i64 0), i32 %conv29) nounwind
  %tmp31 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 5, i64 0, i64 0), align 1
  %conv32 = zext i8 %tmp31 to i32
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i32 %conv32) nounwind
  %tmp34 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 5, i64 1, i64 0), align 1
  %conv35 = zext i8 %tmp34 to i32
  %call36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i32 %conv35) nounwind
  %tmp37 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 6, i64 0, i64 0), align 1
  %conv38 = zext i8 %tmp37 to i32
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i64 0, i64 0), i32 %conv38) nounwind
  %tmp40 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i64 0, i64 6, i64 1, i64 0), align 1
  %conv41 = zext i8 %tmp40 to i32
  %call42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i64 0, i64 0), i32 %conv41) nounwind
  %tmp43 = load i32* @g_7, align 4
  %call44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str15, i64 0, i64 0), i32 %tmp43) nounwind
  %tmp45 = volatile load i32* @g_8, align 4
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str16, i64 0, i64 0), i32 %tmp45) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
