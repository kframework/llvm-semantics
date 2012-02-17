; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000602.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -19514, align 2
@g_4 = global i32 -1311847611, align 4
@g_3 = constant [3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4], align 16
@g_5 = global i32* null, align 8
@g_6 = global i32* null, align 8
@g_12 = global [8 x i32] [i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846, i32 1687928846], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_12[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_12[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_12[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_12[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_12[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_12[5] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_12[6] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_12[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca [2 x [6 x [1 x i32*]]], align 16
  %l_8 = alloca [5 x [4 x [1 x i8]]], align 16
  %l_10 = alloca i32*, align 8
  %l_9 = alloca [5 x i32**], align 16
  %l_11 = alloca [1 x [1 x [2 x i32*]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* null, i32** %l_10, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [2 x [6 x [1 x i32*]]]* %l_7, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [6 x [1 x i32*]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x i32*]* %arrayidx14, i32 0, i64 %idxprom
  store i32* @g_4, i32** %arrayidx15, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp16 = load i32* %k, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %tmp18 = load i32* %j, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond1

for.end20:                                        ; preds = %for.cond1
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc54, %for.end24
  %tmp26 = load i32* %i, align 4
  %cmp27 = icmp slt i32 %tmp26, 5
  br i1 %cmp27, label %for.body28, label %for.end57

for.body28:                                       ; preds = %for.cond25
  store i32 0, i32* %j, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc50, %for.body28
  %tmp30 = load i32* %j, align 4
  %cmp31 = icmp slt i32 %tmp30, 4
  br i1 %cmp31, label %for.body32, label %for.end53

for.body32:                                       ; preds = %for.cond29
  store i32 0, i32* %k, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc46, %for.body32
  %tmp34 = load i32* %k, align 4
  %cmp35 = icmp slt i32 %tmp34, 1
  br i1 %cmp35, label %for.body36, label %for.end49

for.body36:                                       ; preds = %for.cond33
  %tmp37 = load i32* %k, align 4
  %idxprom38 = sext i32 %tmp37 to i64
  %tmp39 = load i32* %j, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %tmp41 = load i32* %i, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %arrayidx43 = getelementptr inbounds [5 x [4 x [1 x i8]]]* %l_8, i32 0, i64 %idxprom42
  %arrayidx44 = getelementptr inbounds [4 x [1 x i8]]* %arrayidx43, i32 0, i64 %idxprom40
  %arrayidx45 = getelementptr inbounds [1 x i8]* %arrayidx44, i32 0, i64 %idxprom38
  volatile store i8 -42, i8* %arrayidx45, align 1
  br label %for.inc46

for.inc46:                                        ; preds = %for.body36
  %tmp47 = load i32* %k, align 4
  %inc48 = add nsw i32 %tmp47, 1
  store i32 %inc48, i32* %k, align 4
  br label %for.cond33

for.end49:                                        ; preds = %for.cond33
  br label %for.inc50

for.inc50:                                        ; preds = %for.end49
  %tmp51 = load i32* %j, align 4
  %inc52 = add nsw i32 %tmp51, 1
  store i32 %inc52, i32* %j, align 4
  br label %for.cond29

for.end53:                                        ; preds = %for.cond29
  br label %for.inc54

for.inc54:                                        ; preds = %for.end53
  %tmp55 = load i32* %i, align 4
  %inc56 = add nsw i32 %tmp55, 1
  store i32 %inc56, i32* %i, align 4
  br label %for.cond25

for.end57:                                        ; preds = %for.cond25
  store i32 0, i32* %i, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc65, %for.end57
  %tmp59 = load i32* %i, align 4
  %cmp60 = icmp slt i32 %tmp59, 5
  br i1 %cmp60, label %for.body61, label %for.end68

for.body61:                                       ; preds = %for.cond58
  %tmp62 = load i32* %i, align 4
  %idxprom63 = sext i32 %tmp62 to i64
  %arrayidx64 = getelementptr inbounds [5 x i32**]* %l_9, i32 0, i64 %idxprom63
  store i32** %l_10, i32*** %arrayidx64, align 8
  br label %for.inc65

for.inc65:                                        ; preds = %for.body61
  %tmp66 = load i32* %i, align 4
  %inc67 = add nsw i32 %tmp66, 1
  store i32 %inc67, i32* %i, align 4
  br label %for.cond58

for.end68:                                        ; preds = %for.cond58
  store i32 0, i32* %i, align 4
  br label %for.cond69

for.cond69:                                       ; preds = %for.inc98, %for.end68
  %tmp70 = load i32* %i, align 4
  %cmp71 = icmp slt i32 %tmp70, 1
  br i1 %cmp71, label %for.body72, label %for.end101

for.body72:                                       ; preds = %for.cond69
  store i32 0, i32* %j, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc94, %for.body72
  %tmp74 = load i32* %j, align 4
  %cmp75 = icmp slt i32 %tmp74, 1
  br i1 %cmp75, label %for.body76, label %for.end97

for.body76:                                       ; preds = %for.cond73
  store i32 0, i32* %k, align 4
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc90, %for.body76
  %tmp78 = load i32* %k, align 4
  %cmp79 = icmp slt i32 %tmp78, 2
  br i1 %cmp79, label %for.body80, label %for.end93

for.body80:                                       ; preds = %for.cond77
  %tmp81 = load i32* %k, align 4
  %idxprom82 = sext i32 %tmp81 to i64
  %tmp83 = load i32* %j, align 4
  %idxprom84 = sext i32 %tmp83 to i64
  %tmp85 = load i32* %i, align 4
  %idxprom86 = sext i32 %tmp85 to i64
  %arrayidx87 = getelementptr inbounds [1 x [1 x [2 x i32*]]]* %l_11, i32 0, i64 %idxprom86
  %arrayidx88 = getelementptr inbounds [1 x [2 x i32*]]* %arrayidx87, i32 0, i64 %idxprom84
  %arrayidx89 = getelementptr inbounds [2 x i32*]* %arrayidx88, i32 0, i64 %idxprom82
  store i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 5), i32** %arrayidx89, align 8
  br label %for.inc90

for.inc90:                                        ; preds = %for.body80
  %tmp91 = load i32* %k, align 4
  %inc92 = add nsw i32 %tmp91, 1
  store i32 %inc92, i32* %k, align 4
  br label %for.cond77

for.end93:                                        ; preds = %for.cond77
  br label %for.inc94

for.inc94:                                        ; preds = %for.end93
  %tmp95 = load i32* %j, align 4
  %inc96 = add nsw i32 %tmp95, 1
  store i32 %inc96, i32* %j, align 4
  br label %for.cond73

for.end97:                                        ; preds = %for.cond73
  br label %for.inc98

for.inc98:                                        ; preds = %for.end97
  %tmp99 = load i32* %i, align 4
  %inc100 = add nsw i32 %tmp99, 1
  store i32 %inc100, i32* %i, align 4
  br label %for.cond69

for.end101:                                       ; preds = %for.cond69
  %tmp102 = volatile load i16* @g_2, align 2
  %conv = trunc i16 %tmp102 to i8
  %arrayidx103 = getelementptr inbounds [5 x [4 x [1 x i8]]]* %l_8, i32 0, i64 3
  %arrayidx104 = getelementptr inbounds [4 x [1 x i8]]* %arrayidx103, i32 0, i64 2
  %arrayidx105 = getelementptr inbounds [1 x i8]* %arrayidx104, i32 0, i64 0
  volatile store i8 %conv, i8* %arrayidx105, align 1
  %arrayidx106 = getelementptr inbounds [1 x [1 x [2 x i32*]]]* %l_11, i32 0, i64 0
  %arrayidx107 = getelementptr inbounds [1 x [2 x i32*]]* %arrayidx106, i32 0, i64 0
  %arrayidx108 = getelementptr inbounds [2 x i32*]* %arrayidx107, i32 0, i64 0
  store i32* null, i32** %arrayidx108, align 8
  %tmp109 = volatile load i16* @g_2, align 2
  %conv110 = sext i16 %tmp109 to i64
  ret i64 %conv110
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i16* @g_2, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 4), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 6), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 7), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([8 x i32]* @g_12, i32 0, i64 5), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp20)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
