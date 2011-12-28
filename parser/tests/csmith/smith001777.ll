; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001777.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 427756073, align 4
@g_7 = global [9 x [2 x i8]] [[2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF", [2 x i8] c"\FF\FF"], align 16
@g_10 = global [6 x [1 x [5 x i32]]] [[1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]], [1 x [5 x i32]] [[5 x i32] [i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617, i32 1391673617]]], align 16
@g_9 = global i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [5 x i32]]]* @g_10 to i8*), i64 20) to i32*), align 8
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
  %l_14 = alloca i16, align 2
  %l_8 = alloca i32, align 4
  store i16 -1, i16* %l_14, align 2
  volatile store i32 -24, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %l_8, align 4
  %tmp2 = volatile load i32* @g_2, align 4
  %tmp3 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %conv = zext i8 %tmp3 to i32
  %neg = xor i32 %conv, -1
  %tmp4 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %tobool = icmp ne i8 %tmp4, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %cmp5 = icmp sle i32 %neg, %lnot.ext
  %conv6 = zext i1 %cmp5 to i32
  %tmp7 = load i32* %l_8, align 4
  %xor = xor i32 %conv6, %tmp7
  %and = and i32 %tmp2, %xor
  %conv8 = trunc i32 %and to i8
  %tmp9 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 3, i64 1), align 1
  %call = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv8, i8 signext %tmp9)
  %conv10 = sext i8 %call to i32
  %tmp11 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %conv12 = zext i8 %tmp11 to i32
  %cmp13 = icmp sle i32 %conv10, %conv12
  %conv14 = zext i1 %cmp13 to i32
  %tmp15 = volatile load i32** @g_9, align 8
  store i32 %conv14, i32* %tmp15
  store i32 11, i32* %l_8, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc, %for.body
  %tmp17 = load i32* %l_8, align 4
  %cmp18 = icmp sge i32 %tmp17, 12
  br i1 %cmp18, label %for.body20, label %for.end

for.body20:                                       ; preds = %for.cond16
  store i32** @g_9, i32*** @g_13, align 8
  %tmp21 = load i32*** @g_13, align 8
  %tmp22 = volatile load i32** %tmp21
  %tmp23 = load i32* %tmp22
  %tmp24 = load i16* %l_14, align 2
  %conv25 = zext i16 %tmp24 to i32
  %or = or i32 %conv25, %tmp23
  %conv26 = trunc i32 %or to i16
  store i16 %conv26, i16* %l_14, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body20
  %tmp27 = load i32* %l_8, align 4
  %call28 = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp27, i32 3)
  store i32 %call28, i32* %l_8, align 4
  br label %for.cond16

for.end:                                          ; preds = %for.cond16
  br label %for.inc29

for.inc29:                                        ; preds = %for.end
  %tmp30 = volatile load i32* @g_2, align 4
  %conv31 = trunc i32 %tmp30 to i16
  %call32 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv31, i16 signext 9)
  %conv33 = sext i16 %call32 to i32
  volatile store i32 %conv33, i32* @g_2, align 4
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  %tmp35 = load i16* %l_14, align 2
  %conv36 = trunc i16 %tmp35 to i8
  ret i8 %conv36
}

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %mul = mul nsw i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i8
  ret i8 %conv3
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 0, i64 0), align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %tmp4 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 0, i64 1), align 1
  %conv5 = zext i8 %tmp4 to i32
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %conv5)
  %tmp7 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 1, i64 0), align 1
  %conv8 = zext i8 %tmp7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %conv8)
  %tmp10 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 1, i64 1), align 1
  %conv11 = zext i8 %tmp10 to i32
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %conv11)
  %tmp13 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 2, i64 0), align 1
  %conv14 = zext i8 %tmp13 to i32
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %conv14)
  %tmp16 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 2, i64 1), align 1
  %conv17 = zext i8 %tmp16 to i32
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %conv17)
  %tmp19 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 3, i64 0), align 1
  %conv20 = zext i8 %tmp19 to i32
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %conv20)
  %tmp22 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 3, i64 1), align 1
  %conv23 = zext i8 %tmp22 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %conv23)
  %tmp25 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %conv26 = zext i8 %tmp25 to i32
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %conv26)
  %tmp28 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 1), align 1
  %conv29 = zext i8 %tmp28 to i32
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %conv29)
  %tmp31 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 5, i64 0), align 1
  %conv32 = zext i8 %tmp31 to i32
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %conv32)
  %tmp34 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 5, i64 1), align 1
  %conv35 = zext i8 %tmp34 to i32
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %conv35)
  %tmp37 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 6, i64 0), align 1
  %conv38 = zext i8 %tmp37 to i32
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %conv38)
  %tmp40 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 6, i64 1), align 1
  %conv41 = zext i8 %tmp40 to i32
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %conv41)
  %tmp43 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 7, i64 0), align 1
  %conv44 = zext i8 %tmp43 to i32
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %conv44)
  %tmp46 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 7, i64 1), align 1
  %conv47 = zext i8 %tmp46 to i32
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %conv47)
  %tmp49 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 8, i64 0), align 1
  %conv50 = zext i8 %tmp49 to i32
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %conv50)
  %tmp52 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 8, i64 1), align 1
  %conv53 = zext i8 %tmp52 to i32
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %conv53)
  %tmp55 = load i8* getelementptr inbounds ([9 x [2 x i8]]* @g_7, i32 0, i64 4, i64 0), align 1
  %conv56 = zext i8 %tmp55 to i32
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %conv56)
  %tmp58 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 0), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 1), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %tmp60)
  %tmp62 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 2), align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 3), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %tmp64)
  %tmp66 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 0, i64 0, i64 4), align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 0), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %tmp68)
  %tmp70 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 1), align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i32 %tmp70)
  %tmp72 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 2), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0), i32 %tmp72)
  %tmp74 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 3), align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i32 0, i32 0), i32 %tmp74)
  %tmp76 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 4), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i32 0, i32 0), i32 %tmp76)
  %tmp78 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 0), align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i32 %tmp78)
  %tmp80 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 1), align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i32 0, i32 0), i32 %tmp80)
  %tmp82 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 2), align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i32 %tmp82)
  %tmp84 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 3), align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i32 0, i32 0), i32 %tmp84)
  %tmp86 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 2, i64 0, i64 4), align 4
  %call87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i32 0, i32 0), i32 %tmp86)
  %tmp88 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 0), align 4
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i32 0, i32 0), i32 %tmp88)
  %tmp90 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 1), align 4
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i32 %tmp90)
  %tmp92 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 2), align 4
  %call93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i32 0, i32 0), i32 %tmp92)
  %tmp94 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 3), align 4
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i32 0, i32 0), i32 %tmp94)
  %tmp96 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 3, i64 0, i64 4), align 4
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i32 0, i32 0), i32 %tmp96)
  %tmp98 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 0), align 4
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i32 0, i32 0), i32 %tmp98)
  %tmp100 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 1), align 4
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i32 0, i32 0), i32 %tmp100)
  %tmp102 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 2), align 4
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i32 0, i32 0), i32 %tmp102)
  %tmp104 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 3), align 4
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str42, i32 0, i32 0), i32 %tmp104)
  %tmp106 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 4, i64 0, i64 4), align 4
  %call107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str43, i32 0, i32 0), i32 %tmp106)
  %tmp108 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 0), align 4
  %call109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str44, i32 0, i32 0), i32 %tmp108)
  %tmp110 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 1), align 4
  %call111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str45, i32 0, i32 0), i32 %tmp110)
  %tmp112 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 2), align 4
  %call113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str46, i32 0, i32 0), i32 %tmp112)
  %tmp114 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 3), align 4
  %call115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str47, i32 0, i32 0), i32 %tmp114)
  %tmp116 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 5, i64 0, i64 4), align 4
  %call117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str48, i32 0, i32 0), i32 %tmp116)
  %tmp118 = load i32* getelementptr inbounds ([6 x [1 x [5 x i32]]]* @g_10, i32 0, i64 1, i64 0, i64 0), align 4
  %call119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %tmp118)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
