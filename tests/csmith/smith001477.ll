; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001477.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant [9 x i16] [i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72, i16 -72], align 16
@g_4 = global i32 1822608209, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_2[8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca [8 x i32*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32*]* %l_3, i32 0, i64 %idxprom
  store i32* @g_4, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 1), align 2
  %conv = zext i16 %tmp3 to i32
  %tmp4 = load i32* @g_4, align 4
  %and = and i32 %tmp4, %conv
  store i32 %and, i32* @g_4, align 4
  %tmp5 = load i32* @g_4, align 4
  ret i32 %tmp5
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
  %tmp = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 1), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 2), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 3), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 4), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 5), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 6), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 7), align 2
  %conv21 = zext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %tmp23 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 8), align 2
  %conv24 = zext i16 %tmp23 to i32
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %conv24)
  %tmp26 = load i16* getelementptr inbounds ([9 x i16]* @g_2, i32 0, i64 1), align 2
  %conv27 = zext i16 %tmp26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv27)
  %tmp29 = load i32* @g_4, align 4
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i32 0, i32 0), i32 %tmp29)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
