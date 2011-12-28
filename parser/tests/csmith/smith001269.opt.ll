; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001269.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 9, align 4
@g_7 = global i32 1, align 4
@g_6 = global i32* @g_7, align 8
@g_11 = global [1 x [10 x [5 x i32]]] [[10 x [5 x i32]] [[5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1]]], align 16
@g_15 = constant i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][3] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][4] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][2] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][3] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][4] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][1] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][2] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][3] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][4] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][1] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][2] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][3] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][4] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][1] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][2] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][3] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][4] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][0] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][1] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][2] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][3] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][4] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][0] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][1] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][2] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][3] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][4] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][0] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][1] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][2] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][3] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp1 = load i32* @g_5, align 4
  %add.i = add i32 %tmp1, 250
  %conv3 = and i32 %add.i, 255
  %tmp4 = volatile load i32** @g_6, align 8
  store i32 %conv3, i32* %tmp4, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end42, %entry
  %tmp53 = phi i32 [ 0, %entry ], [ %conv56, %if.end42 ]
  store i32 %tmp53, i32* @g_7, align 4
  %cmp = icmp eq i32 %tmp53, 5
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %tmp8 = volatile load i32** @g_6, align 8
  %tmp9 = load i32* %tmp8, align 4
  %tobool = icmp eq i32 %tmp9, 0
  %tmp15 = volatile load i32** @g_6, align 8
  %tmp16 = load i32* %tmp15, align 4
  br i1 %tobool, label %if.else, label %if.end42

if.else:                                          ; preds = %for.body
  %tmp17 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 3), align 4
  %cmp20 = icmp slt i32 %tmp17, 21
  %conv22 = zext i1 %cmp20 to i64
  %tmp23 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 2), align 4
  %or = or i32 %tmp23, 21
  %conv26 = sext i32 %or to i64
  %cmp2.i = icmp sgt i32 %or, 0
  %or.cond.i = and i1 %cmp20, %cmp2.i
  %sub.i2 = sub nsw i64 9223372036854775807, %conv26
  %cmp6.i = icmp slt i64 %sub.i2, %conv22
  %or.cond2.i = and i1 %or.cond.i, %cmp6.i
  %si1.add.i = select i1 %or.cond2.i, i64 0, i64 %conv26
  %conv22.si1.add.i = add nsw i64 %conv22, %si1.add.i
  %tmp28 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %conv29 = sext i32 %tmp28 to i64
  %cmp30 = icmp ne i64 %conv22.si1.add.i, %conv29
  %conv31 = zext i1 %cmp30 to i32
  %tmp32 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 2), align 8
  %not.tobool33 = icmp ne i32 %conv31, %tmp32
  %0 = zext i1 %not.tobool33 to i32
  %xor37 = xor i32 %0, %tmp16
  store i32 %xor37, i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  br label %for.end

if.end42:                                         ; preds = %for.body
  %tmp14 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %and = and i32 %tmp16, -6
  %and47 = and i32 %and, %tmp14
  %xor51 = xor i32 %and47, -297000713
  store i32 %xor51, i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %sub.i = add i32 %tmp53, 255
  %conv56 = and i32 %sub.i, 255
  br label %for.cond

for.end:                                          ; preds = %for.cond, %if.else
  ret i32 -6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = load i32* @g_5, align 4
  %add.i.i = add i32 %tmp1.i, 250
  %conv3.i = and i32 %add.i.i, 255
  %tmp4.i = volatile load i32** @g_6, align 8
  store i32 %conv3.i, i32* %tmp4.i, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %if.end42.i, %entry
  %tmp53.i = phi i32 [ 0, %entry ], [ %conv56.i, %if.end42.i ]
  store i32 %tmp53.i, i32* @g_7, align 4
  %cmp.i = icmp eq i32 %tmp53.i, 5
  br i1 %cmp.i, label %func_1.exit, label %for.body.i

for.body.i:                                       ; preds = %for.cond.i
  %tmp8.i = volatile load i32** @g_6, align 8
  %tmp9.i = load i32* %tmp8.i, align 4
  %tobool.i = icmp eq i32 %tmp9.i, 0
  %tmp15.i = volatile load i32** @g_6, align 8
  %tmp16.i = load i32* %tmp15.i, align 4
  br i1 %tobool.i, label %if.else.i, label %if.end42.i

if.else.i:                                        ; preds = %for.body.i
  %tmp17.i = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 3), align 4
  %cmp20.i = icmp slt i32 %tmp17.i, 21
  %conv22.i = zext i1 %cmp20.i to i64
  %tmp23.i = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 2), align 4
  %or.i = or i32 %tmp23.i, 21
  %conv26.i = sext i32 %or.i to i64
  %cmp2.i.i = icmp sgt i32 %or.i, 0
  %or.cond.i.i = and i1 %cmp20.i, %cmp2.i.i
  %sub.i2.i = sub nsw i64 9223372036854775807, %conv26.i
  %cmp6.i.i = icmp slt i64 %sub.i2.i, %conv22.i
  %or.cond2.i.i = and i1 %or.cond.i.i, %cmp6.i.i
  %si1.add.i.i = select i1 %or.cond2.i.i, i64 0, i64 %conv26.i
  %conv22.si1.add.i.i = add nsw i64 %si1.add.i.i, %conv22.i
  %tmp28.i = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %conv29.i = sext i32 %tmp28.i to i64
  %cmp30.i = icmp ne i64 %conv22.si1.add.i.i, %conv29.i
  %conv31.i = zext i1 %cmp30.i to i32
  %tmp32.i = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 2), align 8
  %not.tobool33.i = icmp ne i32 %conv31.i, %tmp32.i
  %0 = zext i1 %not.tobool33.i to i32
  %xor37.i = xor i32 %0, %tmp16.i
  store i32 %xor37.i, i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  br label %func_1.exit

if.end42.i:                                       ; preds = %for.body.i
  %tmp14.i = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %and.i = and i32 %tmp16.i, -6
  %and47.i = and i32 %and.i, %tmp14.i
  %xor51.i = xor i32 %and47.i, -297000713
  store i32 %xor51.i, i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %sub.i.i = add i32 %tmp53.i, 255
  %conv56.i = and i32 %sub.i.i, 255
  br label %for.cond.i

func_1.exit:                                      ; preds = %for.cond.i, %if.else.i
  %tmp = load i32* @g_5, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_7, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 0), align 16
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 2), align 8
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 3), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 0, i64 4), align 16
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 1, i64 0), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 1, i64 1), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 1, i64 2), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 1, i64 3), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 1, i64 4), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 0), align 8
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 1), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 2), align 8
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 3), align 4
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 3, i64 0), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 3, i64 1), align 4
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 3, i64 2), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 3, i64 3), align 4
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 3, i64 4), align 4
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 4, i64 0), align 16
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 4, i64 1), align 4
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 4, i64 2), align 8
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 4, i64 3), align 4
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i64 0, i64 0), i32 %tmp50) nounwind
  %tmp52 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 4, i64 4), align 16
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i64 0, i64 0), i32 %tmp52) nounwind
  %tmp54 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 0), align 4
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i64 0, i64 0), i32 %tmp54) nounwind
  %tmp56 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 1), align 4
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i64 0, i64 0), i32 %tmp56) nounwind
  %tmp58 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 2), align 4
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i64 0, i64 0), i32 %tmp58) nounwind
  %tmp60 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 3), align 4
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i64 0, i64 0), i32 %tmp60) nounwind
  %tmp62 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 5, i64 4), align 4
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 6, i64 0), align 8
  %call65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i64 0, i64 0), i32 %tmp64) nounwind
  %tmp66 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 6, i64 1), align 4
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i64 0, i64 0), i32 %tmp66) nounwind
  %tmp68 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 6, i64 2), align 8
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i64 0, i64 0), i32 %tmp68) nounwind
  %tmp70 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 6, i64 3), align 4
  %call71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i64 0, i64 0), i32 %tmp70) nounwind
  %tmp72 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 6, i64 4), align 8
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i64 0, i64 0), i32 %tmp72) nounwind
  %tmp74 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 0), align 4
  %call75 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i64 0, i64 0), i32 %tmp74) nounwind
  %tmp76 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 1), align 4
  %call77 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i64 0, i64 0), i32 %tmp76) nounwind
  %tmp78 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 2), align 4
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i64 0, i64 0), i32 %tmp78) nounwind
  %tmp80 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 3), align 4
  %call81 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i64 0, i64 0), i32 %tmp80) nounwind
  %tmp82 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 7, i64 4), align 4
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i64 0, i64 0), i32 %tmp82) nounwind
  %tmp84 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 8, i64 0), align 16
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str42, i64 0, i64 0), i32 %tmp84) nounwind
  %tmp86 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 8, i64 1), align 4
  %call87 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str43, i64 0, i64 0), i32 %tmp86) nounwind
  %tmp88 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 8, i64 2), align 8
  %call89 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str44, i64 0, i64 0), i32 %tmp88) nounwind
  %tmp90 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 8, i64 3), align 4
  %call91 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str45, i64 0, i64 0), i32 %tmp90) nounwind
  %tmp92 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 8, i64 4), align 16
  %call93 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str46, i64 0, i64 0), i32 %tmp92) nounwind
  %tmp94 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 9, i64 0), align 4
  %call95 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str47, i64 0, i64 0), i32 %tmp94) nounwind
  %tmp96 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 9, i64 1), align 4
  %call97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str48, i64 0, i64 0), i32 %tmp96) nounwind
  %tmp98 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 9, i64 2), align 4
  %call99 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str49, i64 0, i64 0), i32 %tmp98) nounwind
  %tmp100 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 9, i64 3), align 4
  %call101 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str50, i64 0, i64 0), i32 %tmp100) nounwind
  %tmp102 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 9, i64 4), align 4
  %call103 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str51, i64 0, i64 0), i32 %tmp102) nounwind
  %tmp104 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i64 0, i64 0, i64 2, i64 4), align 8
  %call105 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i64 0, i64 0), i32 %tmp104) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
