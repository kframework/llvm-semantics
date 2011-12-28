; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000556.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [9 x i32] [i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172, i32 1891830172], align 16
@g_9 = global i32 374868041, align 4
@g_14 = global i32* null, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_7[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_7[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_7[8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_10 = alloca i32, align 4
  %l_12 = alloca i32*, align 8
  %l_11 = alloca i32**, align 8
  %l_13 = alloca [5 x i32*], align 16
  %l_15 = alloca i8, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %l_10, align 4
  store i32* @g_9, i32** %l_12, align 8
  store i32** %l_12, i32*** %l_11, align 8
  store i8 -109, i8* %l_15, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x i32*]* %l_13, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* @g_9, align 4
  %tmp4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 1), align 4
  %conv = trunc i32 %tmp4 to i16
  %tmp5 = load i32* @g_9, align 4
  %conv6 = trunc i32 %tmp5 to i8
  %call = call i32* @func_2(i32 %tmp3, i16 zeroext %conv, i16 signext 0, i8 signext %conv6)
  %tmp7 = load i32*** %l_11, align 8
  store i32* %call, i32** %tmp7
  %arrayidx8 = getelementptr inbounds [5 x i32*]* %l_13, i32 0, i64 2
  %tmp9 = load i32** %arrayidx8, align 8
  store i32* %tmp9, i32** @g_14, align 8
  %tmp10 = load i32*** %l_11, align 8
  store i32* null, i32** %tmp10
  %tmp11 = load i8* %l_15, align 1
  %conv12 = sext i8 %tmp11 to i16
  ret i16 %conv12
}

define i32* @func_2(i32 %p_3, i16 zeroext %p_4, i16 signext %p_5, i8 signext %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i16, align 2
  %p_5.addr = alloca i16, align 2
  %p_6.addr = alloca i8, align 1
  %l_8 = alloca i32*, align 8
  store i32 %p_3, i32* %p_3.addr, align 4
  store i16 %p_4, i16* %p_4.addr, align 2
  store i16 %p_5, i16* %p_5.addr, align 2
  store i8 %p_6, i8* %p_6.addr, align 1
  store i32* @g_9, i32** %l_8, align 8
  %tmp = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 4), align 4
  %tmp1 = load i32** %l_8, align 8
  %tmp2 = load i32* %tmp1
  %or = or i32 %tmp2, %tmp
  store i32 %or, i32* %tmp1
  %tmp3 = load i32** %l_8, align 8
  ret i32* %tmp3
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
  %call = call signext i16 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 7), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 8), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_7, i32 0, i64 4), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* @g_9, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i32 0, i32 0), i32 %tmp20)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
