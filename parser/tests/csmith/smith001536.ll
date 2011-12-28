; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001536.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [6 x [7 x i16]] [[7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1]], align 16
@g_3 = global i32* null, align 8
@g_5 = global i32 1521740042, align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][6] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][4] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][5] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_2[2][6] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][2] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][3] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][4] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][5] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_2[3][6] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][1] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][2] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][3] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][4] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][5] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_2[4][6] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][1] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][2] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][3] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][4] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][5] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_2[5][6] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [7 x [1 x [4 x [1 x i32*]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc28, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 1
  br i1 %cmp3, label %for.body4, label %for.end31

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc24, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 4
  br i1 %cmp7, label %for.body8, label %for.end27

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %l, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %l, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %l, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %k, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %tmp16 = load i32* %j, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx = getelementptr inbounds [7 x [1 x [4 x [1 x i32*]]]]* %l_4, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [1 x [4 x [1 x i32*]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [4 x [1 x i32*]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i32*]* %arrayidx21, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx22, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %tmp23 = load i32* %l, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %k, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond5

for.end27:                                        ; preds = %for.cond5
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %j, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond1

for.end31:                                        ; preds = %for.cond1
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  %tmp36 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 5), align 2
  %conv = sext i16 %tmp36 to i32
  %tmp37 = load i32* @g_5, align 4
  %and = and i32 %tmp37, %conv
  store i32 %and, i32* @g_5, align 4
  %tmp38 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 3), align 2
  %conv39 = sext i16 %tmp38 to i64
  ret i64 %conv39
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 0), align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 1), align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 2), align 2
  %conv6 = sext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 3), align 2
  %conv9 = sext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 4), align 2
  %conv12 = sext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 5), align 2
  %conv15 = sext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 0, i64 6), align 2
  %conv18 = sext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 0), align 2
  %conv21 = sext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %tmp23 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 1), align 2
  %conv24 = sext i16 %tmp23 to i32
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %conv24)
  %tmp26 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 2), align 2
  %conv27 = sext i16 %tmp26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %conv27)
  %tmp29 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 3), align 2
  %conv30 = sext i16 %tmp29 to i32
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %conv30)
  %tmp32 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 4), align 2
  %conv33 = sext i16 %tmp32 to i32
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %conv33)
  %tmp35 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 5), align 2
  %conv36 = sext i16 %tmp35 to i32
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %conv36)
  %tmp38 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 1, i64 6), align 2
  %conv39 = sext i16 %tmp38 to i32
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %conv39)
  %tmp41 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 0), align 2
  %conv42 = sext i16 %tmp41 to i32
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %conv42)
  %tmp44 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 1), align 2
  %conv45 = sext i16 %tmp44 to i32
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %conv45)
  %tmp47 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 2), align 2
  %conv48 = sext i16 %tmp47 to i32
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %conv48)
  %tmp50 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 3), align 2
  %conv51 = sext i16 %tmp50 to i32
  %call52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %conv51)
  %tmp53 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 4), align 2
  %conv54 = sext i16 %tmp53 to i32
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %conv54)
  %tmp56 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 5), align 2
  %conv57 = sext i16 %tmp56 to i32
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %conv57)
  %tmp59 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 2, i64 6), align 2
  %conv60 = sext i16 %tmp59 to i32
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %conv60)
  %tmp62 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 0), align 2
  %conv63 = sext i16 %tmp62 to i32
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %conv63)
  %tmp65 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 1), align 2
  %conv66 = sext i16 %tmp65 to i32
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %conv66)
  %tmp68 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 2), align 2
  %conv69 = sext i16 %tmp68 to i32
  %call70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %conv69)
  %tmp71 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 3), align 2
  %conv72 = sext i16 %tmp71 to i32
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %conv72)
  %tmp74 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 4), align 2
  %conv75 = sext i16 %tmp74 to i32
  %call76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %conv75)
  %tmp77 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 5), align 2
  %conv78 = sext i16 %tmp77 to i32
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %conv78)
  %tmp80 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 3, i64 6), align 2
  %conv81 = sext i16 %tmp80 to i32
  %call82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %conv81)
  %tmp83 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 0), align 2
  %conv84 = sext i16 %tmp83 to i32
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %conv84)
  %tmp86 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 1), align 2
  %conv87 = sext i16 %tmp86 to i32
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %conv87)
  %tmp89 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 2), align 2
  %conv90 = sext i16 %tmp89 to i32
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %conv90)
  %tmp92 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 3), align 2
  %conv93 = sext i16 %tmp92 to i32
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %conv93)
  %tmp95 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 4), align 2
  %conv96 = sext i16 %tmp95 to i32
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %conv96)
  %tmp98 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 5), align 2
  %conv99 = sext i16 %tmp98 to i32
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %conv99)
  %tmp101 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 4, i64 6), align 2
  %conv102 = sext i16 %tmp101 to i32
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %conv102)
  %tmp104 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 0), align 2
  %conv105 = sext i16 %tmp104 to i32
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %conv105)
  %tmp107 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 1), align 2
  %conv108 = sext i16 %tmp107 to i32
  %call109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %conv108)
  %tmp110 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 2), align 2
  %conv111 = sext i16 %tmp110 to i32
  %call112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %conv111)
  %tmp113 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 3), align 2
  %conv114 = sext i16 %tmp113 to i32
  %call115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %conv114)
  %tmp116 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 4), align 2
  %conv117 = sext i16 %tmp116 to i32
  %call118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %conv117)
  %tmp119 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 5), align 2
  %conv120 = sext i16 %tmp119 to i32
  %call121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %conv120)
  %tmp122 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 6), align 2
  %conv123 = sext i16 %tmp122 to i32
  %call124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %conv123)
  %tmp125 = load i16* getelementptr inbounds ([6 x [7 x i16]]* @g_2, i32 0, i64 5, i64 5), align 2
  %conv126 = sext i16 %tmp125 to i32
  %call127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %conv126)
  %tmp128 = load i32* @g_5, align 4
  %call129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str42, i32 0, i32 0), i32 %tmp128)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
