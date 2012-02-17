; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001777.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 427756073, align 4
@g_7 = global [9 x [2 x i8]] [[2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF"], align 16
@g_10 = global [6 x [1 x [5 x i32]]] [[1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]]], align 16
@g_9 = global i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 0), align 8
@g_13 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_7[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_7[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_7[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_7[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_7[2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_7[2][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_7[3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_7[3][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_7[4][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_7[4][1] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_7[5][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_7[5][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_7[6][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_7[6][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_7[7][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_7[7][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_7[8][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_7[8][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][2] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][3] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_10[0][0][4] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][1] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][2] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][3] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_10[1][0][4] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][1] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][2] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][3] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_10[2][0][4] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][1] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][2] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][3] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_10[3][0][4] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][0] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][1] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][2] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][3] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [29 x i8] c"checksum g_10[4][0][4] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][0] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][1] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][2] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][3] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [29 x i8] c"checksum g_10[5][0][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  volatile store i32 -24, i32* @g_2, align 4
  %tmp6 = volatile load i32* @g_2, align 4
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %for.inc29, label %for.end34

for.inc29:                                        ; preds = %for.inc29, %entry
  %tmp2 = volatile load i32* @g_2, align 4
  %tmp2.tr = trunc i32 %tmp2 to i8
  %conv8 = and i8 %tmp2.tr, 1
  %tmp9 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 3, i64 1), align 1
  %tmp3 = sub i8 0, %conv8
  %mul.i = and i8 %tmp9, %tmp3
  %conv10 = sext i8 %mul.i to i32
  %tmp11 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 4, i64 0), align 8
  %conv12 = zext i8 %tmp11 to i32
  %cmp13 = icmp sle i32 %conv10, %conv12
  %conv14 = zext i1 %cmp13 to i32
  %tmp15 = volatile load i32** @g_9, align 8
  store i32 %conv14, i32* %tmp15, align 4
  %tmp30 = volatile load i32* @g_2, align 4
  %sub.i = shl i32 %tmp30, 16
  %sext = add i32 %sub.i, -589824
  %conv33 = ashr exact i32 %sext, 16
  volatile store i32 %conv33, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %for.inc29, label %for.end34

for.end34:                                        ; preds = %for.inc29, %entry
  ret i8 -1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 -24, i32* @g_2, align 4
  %tmp6.i = volatile load i32* @g_2, align 4
  %cmp7.i = icmp eq i32 %tmp6.i, 0
  br i1 %cmp7.i, label %for.inc29.i, label %func_1.exit

for.inc29.i:                                      ; preds = %entry, %for.inc29.i
  %tmp2.i = volatile load i32* @g_2, align 4
  %tmp2.tr.i = trunc i32 %tmp2.i to i8
  %conv8.i = and i8 %tmp2.tr.i, 1
  %tmp9.i = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 3, i64 1), align 1
  %tmp3.i = sub i8 0, %conv8.i
  %mul.i.i = and i8 %tmp9.i, %tmp3.i
  %conv10.i = sext i8 %mul.i.i to i32
  %tmp11.i = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 4, i64 0), align 8
  %conv12.i = zext i8 %tmp11.i to i32
  %cmp13.i = icmp sle i32 %conv10.i, %conv12.i
  %conv14.i = zext i1 %cmp13.i to i32
  %tmp15.i = volatile load i32** @g_9, align 8
  store i32 %conv14.i, i32* %tmp15.i, align 4
  %tmp30.i = volatile load i32* @g_2, align 4
  %sub.i.i = shl i32 %tmp30.i, 16
  %sext.i = add i32 %sub.i.i, -589824
  %conv33.i = ashr exact i32 %sext.i, 16
  volatile store i32 %conv33.i, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp eq i32 %tmp.i, 0
  br i1 %cmp.i, label %for.inc29.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.inc29.i, %entry
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 0, i64 0), align 16
  %conv = zext i8 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 0, i64 1), align 1
  %conv5 = zext i8 %tmp4 to i32
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %conv5) nounwind
  %tmp7 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 1, i64 0), align 2
  %conv8 = zext i8 %tmp7 to i32
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %conv8) nounwind
  %tmp10 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 1, i64 1), align 1
  %conv11 = zext i8 %tmp10 to i32
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv11) nounwind
  %tmp13 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 2, i64 0), align 4
  %conv14 = zext i8 %tmp13 to i32
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %conv14) nounwind
  %tmp16 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 2, i64 1), align 1
  %conv17 = zext i8 %tmp16 to i32
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %conv17) nounwind
  %tmp19 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 3, i64 0), align 2
  %conv20 = zext i8 %tmp19 to i32
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %conv20) nounwind
  %tmp22 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 3, i64 1), align 1
  %conv23 = zext i8 %tmp22 to i32
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %conv23) nounwind
  %tmp25 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 4, i64 0), align 8
  %conv26 = zext i8 %tmp25 to i32
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %conv26) nounwind
  %tmp28 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 4, i64 1), align 1
  %conv29 = zext i8 %tmp28 to i32
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %conv29) nounwind
  %tmp31 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 5, i64 0), align 2
  %conv32 = zext i8 %tmp31 to i32
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %conv32) nounwind
  %tmp34 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 5, i64 1), align 1
  %conv35 = zext i8 %tmp34 to i32
  %call36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %conv35) nounwind
  %tmp37 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 6, i64 0), align 4
  %conv38 = zext i8 %tmp37 to i32
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %conv38) nounwind
  %tmp40 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 6, i64 1), align 1
  %conv41 = zext i8 %tmp40 to i32
  %call42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %conv41) nounwind
  %tmp43 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 7, i64 0), align 2
  %conv44 = zext i8 %tmp43 to i32
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %conv44) nounwind
  %tmp46 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 7, i64 1), align 1
  %conv47 = zext i8 %tmp46 to i32
  %call48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %conv47) nounwind
  %tmp49 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 8, i64 0), align 16
  %conv50 = zext i8 %tmp49 to i32
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 %conv50) nounwind
  %tmp52 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 8, i64 1), align 1
  %conv53 = zext i8 %tmp52 to i32
  %call54 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 %conv53) nounwind
  %tmp55 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i64 0, i64 4, i64 0), align 8
  %conv56 = zext i8 %tmp55 to i32
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %conv56) nounwind
  %tmp58 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 0, i64 0, i64 0), align 16
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i64 0, i64 0), i32 %tmp58) nounwind
  %tmp60 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 0, i64 0, i64 1), align 4
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i64 0, i64 0), i32 %tmp60) nounwind
  %tmp62 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 0, i64 0, i64 2), align 8
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 0, i64 0, i64 3), align 4
  %call65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i64 0, i64 0), i32 %tmp64) nounwind
  %tmp66 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 0, i64 0, i64 4), align 16
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i64 0, i64 0), i32 %tmp66) nounwind
  %tmp68 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 0), align 4
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i64 0, i64 0), i32 %tmp68) nounwind
  %tmp70 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 1), align 4
  %call71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i64 0, i64 0), i32 %tmp70) nounwind
  %tmp72 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 2), align 4
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i64 0, i64 0), i32 %tmp72) nounwind
  %tmp74 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 3), align 4
  %call75 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i64 0, i64 0), i32 %tmp74) nounwind
  %tmp76 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 4), align 4
  %call77 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i64 0, i64 0), i32 %tmp76) nounwind
  %tmp78 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 2, i64 0, i64 0), align 8
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i64 0, i64 0), i32 %tmp78) nounwind
  %tmp80 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 2, i64 0, i64 1), align 4
  %call81 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i64 0, i64 0), i32 %tmp80) nounwind
  %tmp82 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 2, i64 0, i64 2), align 8
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i64 0, i64 0), i32 %tmp82) nounwind
  %tmp84 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 2, i64 0, i64 3), align 4
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i64 0, i64 0), i32 %tmp84) nounwind
  %tmp86 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 2, i64 0, i64 4), align 8
  %call87 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i64 0, i64 0), i32 %tmp86) nounwind
  %tmp88 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 3, i64 0, i64 0), align 4
  %call89 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i64 0, i64 0), i32 %tmp88) nounwind
  %tmp90 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 3, i64 0, i64 1), align 4
  %call91 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i64 0, i64 0), i32 %tmp90) nounwind
  %tmp92 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 3, i64 0, i64 2), align 4
  %call93 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i64 0, i64 0), i32 %tmp92) nounwind
  %tmp94 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 3, i64 0, i64 3), align 4
  %call95 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i64 0, i64 0), i32 %tmp94) nounwind
  %tmp96 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 3, i64 0, i64 4), align 4
  %call97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i64 0, i64 0), i32 %tmp96) nounwind
  %tmp98 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 4, i64 0, i64 0), align 16
  %call99 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i64 0, i64 0), i32 %tmp98) nounwind
  %tmp100 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 4, i64 0, i64 1), align 4
  %call101 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i64 0, i64 0), i32 %tmp100) nounwind
  %tmp102 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 4, i64 0, i64 2), align 8
  %call103 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i64 0, i64 0), i32 %tmp102) nounwind
  %tmp104 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 4, i64 0, i64 3), align 4
  %call105 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str42, i64 0, i64 0), i32 %tmp104) nounwind
  %tmp106 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 4, i64 0, i64 4), align 16
  %call107 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str43, i64 0, i64 0), i32 %tmp106) nounwind
  %tmp108 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 5, i64 0, i64 0), align 4
  %call109 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str44, i64 0, i64 0), i32 %tmp108) nounwind
  %tmp110 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 5, i64 0, i64 1), align 4
  %call111 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str45, i64 0, i64 0), i32 %tmp110) nounwind
  %tmp112 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 5, i64 0, i64 2), align 4
  %call113 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str46, i64 0, i64 0), i32 %tmp112) nounwind
  %tmp114 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 5, i64 0, i64 3), align 4
  %call115 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str47, i64 0, i64 0), i32 %tmp114) nounwind
  %tmp116 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 5, i64 0, i64 4), align 4
  %call117 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str48, i64 0, i64 0), i32 %tmp116) nounwind
  %tmp118 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i64 0, i64 1, i64 0, i64 0), align 4
  %call119 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i64 0, i64 0), i32 %tmp118) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
