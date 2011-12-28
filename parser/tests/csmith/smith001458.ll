; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001458.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [2 x [6 x i32]] [[6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@g_3 = global i32 635938415, align 4
@g_4 = global i32 0, align 4
@g_12 = global i32* bitcast (i8* getelementptr (i8* bitcast ([2 x [6 x i32]]* @g_2 to i8*), i64 44) to i32*), align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_11 = alloca i32*, align 8
  %l_10 = alloca [2 x i32**], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = volatile load i32* @g_4, align 4
  %rem = urem i32 %tmp, 6
  %idxprom = zext i32 %rem to i64
  %tmp1 = load i32* @g_3, align 4
  %rem2 = urem i32 %tmp1, 2
  %idxprom3 = zext i32 %rem2 to i64
  %arrayidx = getelementptr inbounds [2 x [6 x i32]]* @g_2, i32 0, i64 %idxprom3
  %arrayidx4 = getelementptr inbounds [6 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32* %arrayidx4, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp8 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp8, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp9 = load i32* %i, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %arrayidx11 = getelementptr inbounds [2 x i32**]* %l_10, i32 0, i64 %idxprom10
  store i32** %l_11, i32*** %arrayidx11, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp12 = load i32* %i, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* @g_3, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc25, %for.end
  %tmp14 = load i32* @g_3, align 4
  %cmp15 = icmp slt i32 %tmp14, 2
  br i1 %cmp15, label %for.body16, label %for.end28

for.body16:                                       ; preds = %for.cond13
  volatile store i32 1, i32* @g_4, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc22, %for.body16
  %tmp18 = volatile load i32* @g_4, align 4
  %cmp19 = icmp slt i32 %tmp18, 6
  br i1 %cmp19, label %for.body20, label %for.end24

for.body20:                                       ; preds = %for.cond17
  %tmp21 = volatile load i32* @g_4, align 4
  %conv = trunc i32 %tmp21 to i8
  store i8 %conv, i8* %retval
  br label %return

for.inc22:                                        ; No predecessors!
  %tmp23 = volatile load i32* @g_4, align 4
  %add = add nsw i32 %tmp23, 4
  volatile store i32 %add, i32* @g_4, align 4
  br label %for.cond17

for.end24:                                        ; preds = %for.cond17
  br label %for.inc25

for.inc25:                                        ; preds = %for.end24
  %tmp26 = load i32* @g_3, align 4
  %add27 = add nsw i32 %tmp26, 2
  store i32 %add27, i32* @g_3, align 4
  br label %for.cond13

for.end28:                                        ; preds = %for.cond13
  %tmp29 = volatile load i32* @g_4, align 4
  %rem30 = urem i32 %tmp29, 6
  %idxprom31 = zext i32 %rem30 to i64
  %tmp32 = load i32* @g_3, align 4
  %rem33 = urem i32 %tmp32, 2
  %idxprom34 = zext i32 %rem33 to i64
  %arrayidx35 = getelementptr inbounds [2 x [6 x i32]]* @g_2, i32 0, i64 %idxprom34
  %arrayidx36 = getelementptr inbounds [6 x i32]* %arrayidx35, i32 0, i64 %idxprom31
  %call = call i32* @func_5(i32* @g_3, i32* @g_3, i32* %arrayidx36, i16 signext 7)
  store i32* %call, i32** @g_12, align 8
  %tmp37 = load i32* @g_3, align 4
  %conv38 = trunc i32 %tmp37 to i8
  store i8 %conv38, i8* %retval
  br label %return

return:                                           ; preds = %for.end28, %for.body20
  %0 = load i8* %retval
  ret i8 %0
}

define i32* @func_5(i32* %p_6, i32* %p_7, i32* %p_8, i16 signext %p_9) nounwind uwtable {
entry:
  %p_6.addr = alloca i32*, align 8
  %p_7.addr = alloca i32*, align 8
  %p_8.addr = alloca i32*, align 8
  %p_9.addr = alloca i16, align 2
  store i32* %p_6, i32** %p_6.addr, align 8
  store i32* %p_7, i32** %p_7.addr, align 8
  store i32* %p_8, i32** %p_8.addr, align 8
  store i16 %p_9, i16* %p_9.addr, align 2
  %tmp = load i32** %p_8.addr, align 8
  ret i32* %tmp
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
  %call = call zeroext i8 @func_1()
  %tmp = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 1), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 2), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 3), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 4), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i32 0, i64 1, i64 5), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* @g_3, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = volatile load i32* @g_4, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
