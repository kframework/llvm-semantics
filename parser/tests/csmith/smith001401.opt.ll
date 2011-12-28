; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001401.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -8679, align 2
@g_9 = global i16 4, align 2
@g_16 = global i32 -300116159, align 4
@g_20 = global i16 -2, align 2
@g_21 = global i32* null, align 8
@g_30 = global [5 x [4 x [1 x i32]]] [[4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]]], align 16
@g_32 = global i32** null, align 8
@g_34 = global i32* @g_16, align 8
@g_33 = global i32** @g_34, align 8
@g_36 = global i32** @g_34, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_16 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_20 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][1][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][3][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][1][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][3][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][1][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][2][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][1][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][2][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][3][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
return:
  %tmp = volatile load i16* @g_2, align 2
  store i16 0, i16* @g_9, align 2
  store i16 6, i16* @g_20, align 2
  store i32 1165515285, i32* @g_16, align 4
  ret i8 -1
}

define i32 @func_3(i16 zeroext %p_4, i8 signext %p_5, i64 %p_6, i16 zeroext %p_7, i32 %p_8) nounwind uwtable readonly {
entry:
  %tmp = load i16* @g_9, align 2
  %conv = zext i16 %tmp to i32
  ret i32 %conv
}

define signext i8 @func_11(i32 %p_12) nounwind uwtable {
entry:
  %tmp16 = load i32* @g_16, align 4
  %or = or i32 %tmp16, 4
  store i32 %or, i32* @g_16, align 4
  store i16 0, i16* @g_9, align 2
  ret i8 0
}

define i32* @func_28(i32* nocapture %p_29) nounwind uwtable {
for.cond:
  %tmp1 = load i32* %p_29, align 4
  %xor = xor i32 %tmp1, 721254348
  store i32 %xor, i32* %p_29, align 4
  volatile store i16 1, i16* @g_2, align 2
  %tmp3 = volatile load i16* @g_2, align 2
  %cmp = icmp slt i16 %tmp3, 5
  br i1 %cmp, label %for.body16, label %return

for.body16:                                       ; preds = %for.cond
  store i16 2, i16* @g_20, align 2
  store i32 0, i32* @g_16, align 4
  br label %return

return:                                           ; preds = %for.cond, %for.body16
  ret i32* @g_16
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i16* @g_2, align 2
  store i16 0, i16* @g_9, align 2
  store i16 6, i16* @g_20, align 2
  store i32 1165515285, i32* @g_16, align 4
  %tmp = volatile load i16* @g_2, align 2
  %conv = sext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* @g_9, align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i32* @g_16, align 4
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = load i16* @g_20, align 2
  %conv8 = sext i16 %tmp7 to i32
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 %conv8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 0, i64 0, i64 0), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 0, i64 1, i64 0), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 0, i64 2, i64 0), align 8
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 0, i64 3, i64 0), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 1, i64 0, i64 0), align 16
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 1, i64 1, i64 0), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 1, i64 2, i64 0), align 8
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 1, i64 3, i64 0), align 4
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 2, i64 0, i64 0), align 16
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 2, i64 1, i64 0), align 4
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 2, i64 2, i64 0), align 8
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 2, i64 3, i64 0), align 4
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 3, i64 0, i64 0), align 16
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 3, i64 1, i64 0), align 4
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 3, i64 2, i64 0), align 8
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 3, i64 3, i64 0), align 4
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 4, i64 0, i64 0), align 16
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 4, i64 1, i64 0), align 4
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 4, i64 2, i64 0), align 8
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i64 0, i64 4, i64 3, i64 0), align 4
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i64 0, i64 0), i32 %tmp48) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
