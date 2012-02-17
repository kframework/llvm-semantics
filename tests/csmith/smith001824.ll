; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001824.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 174214363, align 4
@g_4 = global i32 8, align 4
@g_5 = global [9 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_5[7] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_5[8] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [7 x [6 x [1 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
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
  %arrayidx = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [6 x [1 x i16]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x i16]* %arrayidx14, i32 0, i64 %idxprom
  store i16 -7898, i16* %arrayidx15, align 2
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
  volatile store i32 0, i32* @g_3, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc53, %for.end24
  %tmp26 = volatile load i32* @g_3, align 4
  %cmp27 = icmp slt i32 %tmp26, 7
  br i1 %cmp27, label %for.body28, label %for.end56

for.body28:                                       ; preds = %for.cond25
  store i32 0, i32* @g_4, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc49, %for.body28
  %tmp30 = load i32* @g_4, align 4
  %cmp31 = icmp slt i32 %tmp30, 6
  br i1 %cmp31, label %for.body32, label %for.end52

for.body32:                                       ; preds = %for.cond29
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc46, %for.body32
  %tmp34 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %cmp35 = icmp slt i32 %tmp34, 1
  br i1 %cmp35, label %for.body36, label %for.end48

for.body36:                                       ; preds = %for.cond33
  %tmp37 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %idxprom38 = sext i32 %tmp37 to i64
  %tmp39 = load i32* @g_4, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %tmp41 = volatile load i32* @g_3, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %arrayidx43 = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i32 0, i64 %idxprom42
  %arrayidx44 = getelementptr inbounds [6 x [1 x i16]]* %arrayidx43, i32 0, i64 %idxprom40
  %arrayidx45 = getelementptr inbounds [1 x i16]* %arrayidx44, i32 0, i64 %idxprom38
  store i16 8670, i16* %arrayidx45, align 2
  br label %for.inc46

for.inc46:                                        ; preds = %for.body36
  %tmp47 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %add = add nsw i32 %tmp47, 1
  volatile store i32 %add, i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  br label %for.cond33

for.end48:                                        ; preds = %for.cond33
  br label %for.inc49

for.inc49:                                        ; preds = %for.end48
  %tmp50 = load i32* @g_4, align 4
  %add51 = add nsw i32 %tmp50, 1
  store i32 %add51, i32* @g_4, align 4
  br label %for.cond29

for.end52:                                        ; preds = %for.cond29
  br label %for.inc53

for.inc53:                                        ; preds = %for.end52
  %tmp54 = volatile load i32* @g_3, align 4
  %add55 = add nsw i32 %tmp54, 1
  volatile store i32 %add55, i32* @g_3, align 4
  br label %for.cond25

for.end56:                                        ; preds = %for.cond25
  %arrayidx57 = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i32 0, i64 1
  %arrayidx58 = getelementptr inbounds [6 x [1 x i16]]* %arrayidx57, i32 0, i64 4
  %arrayidx59 = getelementptr inbounds [1 x i16]* %arrayidx58, i32 0, i64 0
  %tmp60 = load i16* %arrayidx59, align 2
  %conv = zext i16 %tmp60 to i32
  ret i32 %conv
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
  %call = call i32 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 4), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 6), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 8), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i32 0, i64 7), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %tmp22)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
