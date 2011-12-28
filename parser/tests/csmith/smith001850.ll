; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001850.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_9 = global [8 x [6 x i32]] [[6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220]], align 16
@g_12 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][2] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][3] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][4] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][5] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][2] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][3] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][4] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][5] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][1] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][2] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][3] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][4] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][5] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][0] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][1] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][2] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][3] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][4] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][5] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][0] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][1] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][2] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][3] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][4] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][5] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][0] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][1] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][2] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][3] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][4] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  %i8 = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %idxprom
  store i32 -1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -21, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc32, %for.end
  %tmp4 = load i32* @g_2, align 4
  %cmp5 = icmp ne i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end37

for.body6:                                        ; preds = %for.cond3
  store i32 1, i32* @g_2, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc29, %for.body6
  %tmp10 = load i32* @g_2, align 4
  %cmp11 = icmp slt i32 %tmp10, 4
  br i1 %cmp11, label %for.body12, label %for.end31

for.body12:                                       ; preds = %for.cond9
  store i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), i32** %l_8, align 8
  %tmp14 = load i32* @g_2, align 4
  %conv = trunc i32 %tmp14 to i16
  %tmp15 = load i32* @g_2, align 4
  %rem = urem i32 %tmp15, 4
  %idxprom16 = zext i32 %rem to i64
  %arrayidx17 = getelementptr inbounds [4 x i32]* %l_5, i32 0, i64 %idxprom16
  %tmp18 = load i32* %arrayidx17, align 4
  %call = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %conv, i32 %tmp18)
  %conv19 = zext i16 %call to i32
  %tmp20 = load i32** %l_8, align 8
  store i32 %conv19, i32* %tmp20
  %tmp21 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 1), align 4
  %tobool = icmp ne i32 %tmp21, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body12
  br label %for.end31

if.end:                                           ; preds = %for.body12
  %tmp22 = load i32** %l_8, align 8
  %tmp23 = load i32* %tmp22
  %conv24 = sext i32 %tmp23 to i64
  %xor = xor i64 433591417, %conv24
  %conv25 = trunc i64 %xor to i32
  %call26 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext 1, i32 %conv25)
  %conv27 = sext i8 %call26 to i32
  %tmp28 = load i32** %l_8, align 8
  store i32 %conv27, i32* %tmp28
  br label %for.inc29

for.inc29:                                        ; preds = %if.end
  %tmp30 = load i32* @g_2, align 4
  %add = add nsw i32 %tmp30, 2
  store i32 %add, i32* @g_2, align 4
  br label %for.cond9

for.end31:                                        ; preds = %if.then, %for.cond9
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* @g_2, align 4
  %conv34 = trunc i32 %tmp33 to i8
  %call35 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv34, i8 signext 1)
  %conv36 = sext i8 %call35 to i32
  store i32 %conv36, i32* @g_2, align 4
  br label %for.cond3

for.end37:                                        ; preds = %for.cond3
  %tmp38 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), align 4
  %tmp39 = volatile load i32** @g_12, align 8
  %tmp40 = load i32* %tmp39
  %or = or i32 %tmp40, %tmp38
  store i32 %or, i32* %tmp39
  %tmp41 = load i32* @g_2, align 4
  %conv42 = trunc i32 %tmp41 to i16
  ret i16 %conv42
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i16* %left.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i16
  ret i16 %conv5
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i8* %left.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i8* %left.addr, align 1
  %conv10 = sext i8 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  ret i8 %conv14
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
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
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 2), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 4), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 0, i64 5), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 2), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 3), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 5), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 1), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 2), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 3), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 4), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 2, i64 5), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 1), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 2), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 3), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 4), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 3, i64 5), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 0), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 1), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 2), align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i32 0, i32 0), i32 %tmp54)
  %tmp56 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 3), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i32 0, i32 0), i32 %tmp56)
  %tmp58 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 4), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 4, i64 5), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i32 0, i32 0), i32 %tmp60)
  %tmp62 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 0), align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 1), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i32 0, i32 0), i32 %tmp64)
  %tmp66 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 2), align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 3), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i32 0, i32 0), i32 %tmp68)
  %tmp70 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 4), align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i32 0, i32 0), i32 %tmp70)
  %tmp72 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 5, i64 5), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %tmp72)
  %tmp74 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 0), align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i32 0, i32 0), i32 %tmp74)
  %tmp76 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 1), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i32 0, i32 0), i32 %tmp76)
  %tmp78 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 2), align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 %tmp78)
  %tmp80 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 3), align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i32 %tmp80)
  %tmp82 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 4), align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i32 0, i32 0), i32 %tmp82)
  %tmp84 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 6, i64 5), align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i32 0, i32 0), i32 %tmp84)
  %tmp86 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 0), align 4
  %call87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i32 0, i32 0), i32 %tmp86)
  %tmp88 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 1), align 4
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i32 0, i32 0), i32 %tmp88)
  %tmp90 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 2), align 4
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i32 0, i32 0), i32 %tmp90)
  %tmp92 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 3), align 4
  %call93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i32 0, i32 0), i32 %tmp92)
  %tmp94 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 4), align 4
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i32 0, i32 0), i32 %tmp94)
  %tmp96 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 7, i64 5), align 4
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i32 %tmp96)
  %tmp98 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i32 0, i64 1, i64 4), align 4
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp98)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
