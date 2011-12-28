; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000403.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant i16 -1, align 2
@g_3 = global i16 8, align 2
@g_5 = global [6 x i32] [i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  %i10 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x i32]* %l_4, i32 0, i64 %idxprom
  store i32 1806489493, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = volatile load i16* @g_2, align 2
  volatile store i16 %tmp3, i16* @g_3, align 2
  volatile store i16 2, i16* @g_3, align 2
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc11, %for.end
  %tmp5 = volatile load i16* @g_3, align 2
  %conv = sext i16 %tmp5 to i32
  %cmp6 = icmp slt i32 %conv, 5
  br i1 %cmp6, label %for.body8, label %for.end15

for.body8:                                        ; preds = %for.cond4
  br label %for.inc11

for.inc11:                                        ; preds = %for.body8
  %tmp12 = volatile load i16* @g_3, align 2
  %conv13 = sext i16 %tmp12 to i32
  %add = add nsw i32 %conv13, 3
  %conv14 = trunc i32 %add to i16
  volatile store i16 %conv14, i16* @g_3, align 2
  br label %for.cond4

for.end15:                                        ; preds = %for.cond4
  %tmp16 = volatile load i16* @g_3, align 2
  %conv17 = zext i16 %tmp16 to i32
  %rem = srem i32 %conv17, 5
  %idxprom18 = sext i32 %rem to i64
  %arrayidx19 = getelementptr inbounds [5 x i32]* %l_4, i32 0, i64 %idxprom18
  %tmp20 = load i32* %arrayidx19, align 4
  %conv21 = trunc i32 %tmp20 to i16
  ret i16 %conv21
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
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i16* @g_3, align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 0), align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp5)
  %tmp7 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 1), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp7)
  %tmp9 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 2), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp9)
  %tmp11 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 3), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp11)
  %tmp13 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 4), align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp13)
  %tmp15 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 5), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp15)
  %tmp17 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i32 0, i64 0), align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp17)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
