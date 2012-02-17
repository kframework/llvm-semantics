; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000137.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [3 x i32] [i32 -1133618054, i32 -1133618054, i32 -1133618054], align 4
@g_3 = global i32 2054024901, align 4
@g_5 = global [7 x i32] [i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620, i32 -95328620], align 16
@g_8 = global i32 0, align 4
@g_21 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %l_4 = alloca i32*, align 8
  %l_13 = alloca i32*, align 8
  %l_16 = alloca i16, align 2
  store i32 1, i32* @g_3, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %tmp = load i32* @g_3, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* @g_3, align 4
  %rem = urem i32 %tmp2, 3
  %idxprom = zext i32 %rem to i64
  %arrayidx = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom
  store i32* %arrayidx, i32** %l_4, align 8
  %tmp3 = load i32** %l_4, align 8
  store i32 1819585037, i32* %tmp3
  store i32 0, i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %tmp5 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %cmp6 = icmp sge i32 %tmp5, 0
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %tmp8 = load i32** %l_4, align 8
  %tmp9 = load i32* %tmp8
  store i32 %tmp9, i32* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp10 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %conv = trunc i32 %tmp10 to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv, i8 signext 9)
  %conv11 = sext i8 %call to i32
  store i32 %conv11, i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %tmp12 = load i32* @g_3, align 4
  %tobool = icmp ne i32 %tmp12, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  br label %lbl_19

if.end:                                           ; preds = %for.end
  br label %for.inc13

for.inc13:                                        ; preds = %if.end
  %tmp14 = load i32* @g_3, align 4
  %add = add nsw i32 %tmp14, 2
  store i32 %add, i32* @g_3, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  br label %lbl_19

lbl_19:                                           ; preds = %for.end15, %if.then
  store i32 1, i32* @g_3, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc110, %lbl_19
  %tmp17 = load i32* @g_3, align 4
  %cmp18 = icmp slt i32 %tmp17, 3
  br i1 %cmp18, label %for.body20, label %for.end113

for.body20:                                       ; preds = %for.cond16
  store i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), i32** %l_13, align 8
  store i32 13, i32* @g_8, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc100, %for.body20
  %tmp23 = load i32* @g_8, align 4
  %cmp24 = icmp slt i32 %tmp23, 0
  br i1 %cmp24, label %for.body26, label %for.end105

for.body26:                                       ; preds = %for.cond22
  store i16 1, i16* %l_16, align 2
  %tmp28 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 0), align 4
  %tmp29 = load i32* @g_8, align 4
  %tmp30 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 2), align 4
  %tmp31 = load i32* @g_3, align 4
  %rem32 = urem i32 %tmp31, 3
  %idxprom33 = zext i32 %rem32 to i64
  %arrayidx34 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom33
  %tmp35 = load i32* %arrayidx34, align 4
  %cmp36 = icmp sgt i32 %tmp30, %tmp35
  %conv37 = zext i1 %cmp36 to i32
  %tmp38 = load i32** %l_13, align 8
  %cmp39 = icmp eq i32* @g_8, %tmp38
  %conv40 = zext i1 %cmp39 to i32
  %cmp41 = icmp sle i32 %conv37, %conv40
  %conv42 = zext i1 %cmp41 to i32
  %conv43 = trunc i32 %conv42 to i16
  %tmp44 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %tobool45 = icmp ne i32 %tmp44, 0
  br i1 %tobool45, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body26
  %tmp46 = load i32* @g_3, align 4
  %tobool47 = icmp ne i32 %tmp46, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body26
  %0 = phi i1 [ true, %for.body26 ], [ %tobool47, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv48 = trunc i32 %lor.ext to i16
  %tmp49 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %tobool50 = icmp ne i32 %tmp49, 0
  br i1 %tobool50, label %lor.end55, label %lor.rhs51

lor.rhs51:                                        ; preds = %lor.end
  %tmp52 = load i16* %l_16, align 2
  %conv53 = sext i16 %tmp52 to i32
  %tobool54 = icmp ne i32 %conv53, 0
  br label %lor.end55

lor.end55:                                        ; preds = %lor.rhs51, %lor.end
  %1 = phi i1 [ true, %lor.end ], [ %tobool54, %lor.rhs51 ]
  %lor.ext56 = zext i1 %1 to i32
  %conv57 = trunc i32 %lor.ext56 to i16
  %call58 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv48, i16 zeroext %conv57)
  %call59 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv43, i16 signext %call58)
  %conv60 = sext i16 %call59 to i32
  %tmp61 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 5), align 4
  %tmp62 = load i32* @g_3, align 4
  %and = and i32 %tmp61, %tmp62
  %tmp63 = load i32* @g_3, align 4
  %rem64 = urem i32 %tmp63, 3
  %idxprom65 = zext i32 %rem64 to i64
  %arrayidx66 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom65
  %tmp67 = load i32* %arrayidx66, align 4
  %conv68 = trunc i32 %tmp67 to i16
  %tmp69 = load i32* @g_8, align 4
  %conv70 = trunc i32 %tmp69 to i16
  %call71 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv68, i16 signext %conv70)
  %conv72 = sext i16 %call71 to i32
  %cmp73 = icmp sle i32 %and, %conv72
  %conv74 = zext i1 %cmp73 to i32
  %tmp75 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %tmp76 = load i32** %l_13, align 8
  %tmp77 = load i32* %tmp76
  %cmp78 = icmp slt i32 %tmp75, %tmp77
  %conv79 = zext i1 %cmp78 to i32
  %tmp80 = load i32* @g_3, align 4
  %add81 = add nsw i32 %tmp80, 1
  %rem82 = urem i32 %add81, 3
  %idxprom83 = zext i32 %rem82 to i64
  %arrayidx84 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom83
  %tmp85 = load i32* %arrayidx84, align 4
  %tmp86 = load i32* @g_3, align 4
  %rem87 = urem i32 %tmp86, 3
  %idxprom88 = zext i32 %rem87 to i64
  %arrayidx89 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom88
  %tmp90 = load i32* %arrayidx89, align 4
  %xor = xor i32 %tmp85, %tmp90
  %or = or i32 %conv79, %xor
  %cmp91 = icmp sge i32 %conv74, %or
  %conv92 = zext i1 %cmp91 to i32
  %cmp93 = icmp sge i32 %conv60, %conv92
  %conv94 = zext i1 %cmp93 to i32
  %or95 = or i32 %tmp29, %conv94
  %or96 = or i32 %tmp28, %or95
  %tmp97 = load i32** %l_13, align 8
  store i32 %or96, i32* %tmp97
  %tmp98 = load i16* %l_16, align 2
  %conv99 = sext i16 %tmp98 to i32
  store i32 %conv99, i32* %retval
  br label %return

for.inc100:                                       ; No predecessors!
  %tmp101 = load i32* @g_8, align 4
  %conv102 = trunc i32 %tmp101 to i16
  %call103 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv102, i16 signext 7)
  %conv104 = sext i16 %call103 to i32
  store i32 %conv104, i32* @g_8, align 4
  br label %for.cond22

for.end105:                                       ; preds = %for.cond22
  br label %lbl_20

lbl_20:                                           ; preds = %if.then116, %for.end105
  %tmp106 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 2), align 4
  %tobool107 = icmp ne i32 %tmp106, 0
  br i1 %tobool107, label %if.then108, label %if.end109

if.then108:                                       ; preds = %lbl_20
  br label %for.inc110

if.end109:                                        ; preds = %lbl_20
  br label %for.inc110

for.inc110:                                       ; preds = %if.end109, %if.then108
  %tmp111 = load i32* @g_3, align 4
  %add112 = add nsw i32 %tmp111, 1
  store i32 %add112, i32* @g_3, align 4
  br label %for.cond16

for.end113:                                       ; preds = %for.cond16
  %tmp114 = load i32* @g_3, align 4
  %tobool115 = icmp ne i32 %tmp114, 0
  br i1 %tobool115, label %if.then116, label %if.end117

if.then116:                                       ; preds = %for.end113
  br label %lbl_20

if.end117:                                        ; preds = %for.end113
  %tmp118 = load i32* @g_3, align 4
  %rem119 = urem i32 %tmp118, 3
  %idxprom120 = zext i32 %rem119 to i64
  %arrayidx121 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom120
  %tmp122 = load i32* %arrayidx121, align 4
  %tmp123 = volatile load i32** @g_21, align 8
  store i32 %tmp122, i32* %tmp123
  %tmp124 = load i32* @g_3, align 4
  %rem125 = urem i32 %tmp124, 3
  %idxprom126 = zext i32 %rem125 to i64
  %arrayidx127 = getelementptr inbounds [3 x i32]* @g_2, i32 0, i64 %idxprom126
  %tmp128 = load i32* %arrayidx127, align 4
  store i32 %tmp128, i32* %retval
  br label %return

return:                                           ; preds = %if.end117, %lor.end55, %for.body7
  %2 = load i32* %retval
  ret i32 %2
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si2.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i16* %si1.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -32768
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i16* %si2.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i16* %si1.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i16* %si1.addr, align 2
  %conv13 = sext i16 %tmp12 to i32
  %tmp14 = load i16* %si2.addr, align 2
  %conv15 = sext i16 %tmp14 to i32
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si2.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i16* %si1.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -32768
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i16* %si2.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i16* %si1.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i16* %si1.addr, align 2
  %conv13 = sext i16 %tmp12 to i32
  %tmp14 = load i16* %si2.addr, align 2
  %conv15 = sext i16 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
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
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([3 x i32]* @g_2, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* @g_3, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 1), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 3), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 4), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 5), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 6), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([7 x i32]* @g_5, i32 0, i64 2), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* @g_8, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str11, i32 0, i32 0), i32 %tmp24)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
