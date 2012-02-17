; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000808.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [8 x i8] c"\EE\EE\EE\EE\EE\EE\EE\EE", align 1
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i8, align 1
  %l_3 = alloca i32, align 4
  store i8 -126, i8* %l_2, align 1
  store i32 -2, i32* %l_3, align 4
  %tmp = load i8* %l_2, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %l_2, align 1
  %conv2 = zext i8 %tmp1 to i32
  %cmp = icmp eq i32 %conv, %conv2
  %conv3 = zext i1 %cmp to i32
  store i32 %conv3, i32* %l_3, align 4
  store i32 0, i32* %l_3, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %l_3, align 4
  %cmp5 = icmp slt i32 %tmp4, 8
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp7 = load i32* %l_3, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [8 x i8]* @g_4, i32 0, i64 %idxprom
  store i8 -69, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %l_3, align 4
  %add = add nsw i32 %tmp8, 1
  store i32 %add, i32* %l_3, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp9 = load i8* %l_2, align 1
  ret i8 %tmp9
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
  %call = call zeroext i8 @func_1()
  %tmp = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 0), align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 1), align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 2), align 1
  %conv6 = zext i8 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 3), align 1
  %conv9 = zext i8 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 4), align 1
  %conv12 = zext i8 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 5), align 1
  %conv15 = zext i8 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 6), align 1
  %conv18 = zext i8 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i8* getelementptr inbounds ([8 x i8]* @g_4, i32 0, i64 7), align 1
  %conv21 = zext i8 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
