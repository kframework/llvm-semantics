; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000398.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [2 x [10 x i32]] [[10 x i32] [i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566], [10 x i32] [i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566]], align 16
@g_11 = global i32 -230779952, align 4
@g_22 = global i32* bitcast (i8* getelementptr (i8* bitcast ([2 x [10 x i32]]* @g_3 to i8*), i64 44) to i32*), align 8
@g_23 = global [3 x i32] [i32 845166746, i32 845166746, i32 845166746], align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][9] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][7] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][8] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][9] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [23 x i8] c"checksum g_23[0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [23 x i8] c"checksum g_23[1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [23 x i8] c"checksum g_23[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32*, align 8
  %l_34 = alloca i32**, align 8
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), i32** %l_2, align 8
  store i32** @g_22, i32*** %l_34, align 8
  %tmp = load i32** %l_2, align 8
  %tmp1 = load i32* %tmp
  %conv = sext i32 %tmp1 to i64
  %xor = xor i64 %conv, 992394718
  %conv2 = trunc i64 %xor to i32
  store i32 %conv2, i32* %tmp
  br label %lbl_35

lbl_35:                                           ; preds = %if.then, %entry
  %tmp3 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %call = call i32 @safe_unary_minus_func_uint32_t_u(i32 %tmp3)
  %tmp4 = load i32** %l_2, align 8
  %tmp5 = load i32* %tmp4
  %cmp = icmp eq i32 %call, %tmp5
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lbl_35
  %tmp7 = load i32** %l_2, align 8
  %tmp8 = load i32* %tmp7
  %tobool = icmp ne i32 %tmp8, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %tmp9 = load i32** %l_2, align 8
  %tmp10 = load i32* %tmp9
  %tobool11 = icmp ne i32 %tmp10, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %0 = phi i1 [ true, %land.rhs ], [ %tobool11, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %lbl_35
  %1 = phi i1 [ false, %lbl_35 ], [ %0, %lor.end ]
  %land.ext = zext i1 %1 to i32
  %tmp12 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 7), align 4
  %conv13 = trunc i32 %tmp12 to i16
  %call14 = call i64 @safe_mod_func_int64_t_s_s(i64 1330929378, i64 3736564344)
  %conv15 = trunc i64 %call14 to i16
  %call16 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %conv13, i16 zeroext %conv15)
  %conv17 = zext i16 %call16 to i32
  %cmp18 = icmp ne i32 %land.ext, %conv17
  %conv19 = zext i1 %cmp18 to i32
  %tmp20 = load i32** %l_2, align 8
  store i32 %conv19, i32* %tmp20
  %tmp21 = load i32** %l_2, align 8
  %call22 = call i32* @func_9(i32* %tmp21)
  %tmp23 = load i32*** %l_34, align 8
  store i32* %call22, i32** %tmp23
  %tmp24 = load i32* @g_11, align 4
  %tobool25 = icmp ne i32 %tmp24, 0
  br i1 %tobool25, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  br label %lbl_35

if.end:                                           ; preds = %land.end
  %tmp26 = load i32** %l_2, align 8
  %tmp27 = load i32* %tmp26
  ret i32 %tmp27
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i32, align 4
  store i32 %ui, i32* %ui.addr, align 4
  %tmp = load i32* %ui.addr, align 4
  %sub = sub i32 0, %tmp
  ret i32 %sub
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui2.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i16* %ui1.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i16* %ui2.addr, align 2
  %conv7 = zext i16 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* %si1.addr, align 8
  %cmp2 = icmp eq i64 %tmp1, -9223372036854775808
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i64* %si2.addr, align 8
  %cmp4 = icmp eq i64 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i64* %si1.addr, align 8
  %tmp7 = load i64* %si2.addr, align 8
  %rem = srem i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define i32* @func_9(i32* %p_10) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_10.addr = alloca i32*, align 8
  %l_27 = alloca [3 x i32**], align 16
  %l_33 = alloca i16, align 2
  %i = alloca i32, align 4
  %l_28 = alloca [2 x i32**], align 16
  %i9 = alloca i32, align 4
  %j = alloca i32, align 4
  %l_21 = alloca i32*, align 8
  %l_20 = alloca [9 x i32**], align 16
  %i29 = alloca i32, align 4
  store i32* %p_10, i32** %p_10.addr, align 8
  store i16 27291, i16* %l_33, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32**]* %l_27, i32 0, i64 %idxprom
  store i32** @g_22, i32*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @g_11, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc110, %for.end
  %tmp4 = load i32* @g_11, align 4
  %cmp5 = icmp eq i32 %tmp4, -14
  br i1 %cmp5, label %for.body6, label %for.end113

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %i9, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc18, %for.body6
  %tmp12 = load i32* %i9, align 4
  %cmp13 = icmp slt i32 %tmp12, 2
  br i1 %cmp13, label %for.body14, label %for.end21

for.body14:                                       ; preds = %for.cond11
  %tmp15 = load i32* %i9, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %arrayidx17 = getelementptr inbounds [2 x i32**]* %l_28, i32 0, i64 %idxprom16
  store i32** @g_22, i32*** %arrayidx17, align 8
  br label %for.inc18

for.inc18:                                        ; preds = %for.body14
  %tmp19 = load i32* %i9, align 4
  %inc20 = add nsw i32 %tmp19, 1
  store i32 %inc20, i32* %i9, align 4
  br label %for.cond11

for.end21:                                        ; preds = %for.cond11
  br label %lbl_24

lbl_24:                                           ; preds = %if.then, %for.end21
  store i32 0, i32* @g_11, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc43, %lbl_24
  %tmp23 = load i32* @g_11, align 4
  %cmp24 = icmp eq i32 %tmp23, -9
  br i1 %cmp24, label %for.body25, label %for.end47

for.body25:                                       ; preds = %for.cond22
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 8), i32** %l_21, align 8
  store i32 0, i32* %i29, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc37, %for.body25
  %tmp31 = load i32* %i29, align 4
  %cmp32 = icmp slt i32 %tmp31, 9
  br i1 %cmp32, label %for.body33, label %for.end40

for.body33:                                       ; preds = %for.cond30
  %tmp34 = load i32* %i29, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx36 = getelementptr inbounds [9 x i32**]* %l_20, i32 0, i64 %idxprom35
  store i32** %l_21, i32*** %arrayidx36, align 8
  br label %for.inc37

for.inc37:                                        ; preds = %for.body33
  %tmp38 = load i32* %i29, align 4
  %inc39 = add nsw i32 %tmp38, 1
  store i32 %inc39, i32* %i29, align 4
  br label %for.cond30

for.end40:                                        ; preds = %for.cond30
  %tmp41 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %tmp42 = load i32* @g_11, align 4
  %call = call i32* @func_16(i32 %tmp41, i32 %tmp42, i32* null)
  store i32* %call, i32** @g_22, align 8
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), i32** %retval
  br label %return

for.inc43:                                        ; No predecessors!
  %tmp44 = load i32* @g_11, align 4
  %conv = trunc i32 %tmp44 to i16
  %call45 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv, i16 signext 1)
  %conv46 = sext i16 %call45 to i32
  store i32 %conv46, i32* @g_11, align 4
  br label %for.cond22

for.end47:                                        ; preds = %for.cond22
  store i32 0, i32* @g_11, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc62, %for.end47
  %tmp49 = load i32* @g_11, align 4
  %cmp50 = icmp slt i32 %tmp49, 2
  br i1 %cmp50, label %for.body52, label %for.end65

for.body52:                                       ; preds = %for.cond48
  volatile store i32 8, i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc59, %for.body52
  %tmp54 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %cmp55 = icmp sge i32 %tmp54, 0
  br i1 %cmp55, label %for.body57, label %for.end61

for.body57:                                       ; preds = %for.cond53
  %tmp58 = load i32* @g_11, align 4
  %tobool = icmp ne i32 %tmp58, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body57
  br label %lbl_24

if.end:                                           ; preds = %for.body57
  br label %for.inc59

for.inc59:                                        ; preds = %if.end
  %tmp60 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %add = add nsw i32 %tmp60, -7
  volatile store i32 %add, i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  br label %for.cond53

for.end61:                                        ; preds = %for.cond53
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %tmp63 = load i32* @g_11, align 4
  %add64 = add nsw i32 %tmp63, 2
  store i32 %add64, i32* @g_11, align 4
  br label %for.cond48

for.end65:                                        ; preds = %for.cond48
  %tmp66 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %rem = urem i32 %tmp66, 10
  %idxprom67 = zext i32 %rem to i64
  %tmp68 = load i32* @g_11, align 4
  %rem69 = urem i32 %tmp68, 2
  %idxprom70 = zext i32 %rem69 to i64
  %arrayidx71 = getelementptr inbounds [2 x [10 x i32]]* @g_3, i32 0, i64 %idxprom70
  %arrayidx72 = getelementptr inbounds [10 x i32]* %arrayidx71, i32 0, i64 %idxprom67
  %tmp73 = load i32* %arrayidx72, align 4
  %tmp74 = load i32** @g_22, align 8
  %tmp75 = load i32* %tmp74
  %or = or i32 %tmp73, %tmp75
  %arrayidx76 = getelementptr inbounds [3 x i32**]* %l_27, i32 0, i64 0
  %tmp77 = load i32*** %arrayidx76, align 8
  %arrayidx78 = getelementptr inbounds [2 x i32**]* %l_28, i32 0, i64 1
  %tmp79 = load i32*** %arrayidx78, align 8
  %cmp80 = icmp eq i32** %tmp77, %tmp79
  %conv81 = zext i1 %cmp80 to i32
  %conv82 = trunc i32 %conv81 to i16
  %call83 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext -1, i16 zeroext %conv82)
  %conv84 = zext i16 %call83 to i32
  %tmp85 = load i32** @g_22, align 8
  %tmp86 = load i32* %tmp85
  %conv87 = trunc i32 %tmp86 to i16
  %tmp88 = load i32** %p_10.addr, align 8
  %tmp89 = load i32* %tmp88
  %conv90 = trunc i32 %tmp89 to i16
  %call91 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv87, i16 signext %conv90)
  %conv92 = trunc i16 %call91 to i8
  %tmp93 = load i16* %l_33, align 2
  %conv94 = zext i16 %tmp93 to i32
  %tmp95 = load i32** %p_10.addr, align 8
  %tmp96 = load i32* %tmp95
  %cmp97 = icmp sle i32 %conv94, %tmp96
  %conv98 = zext i1 %cmp97 to i32
  %call99 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv92, i32 %conv98)
  %conv100 = zext i8 %call99 to i32
  %cmp101 = icmp eq i32 %conv84, %conv100
  br i1 %cmp101, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end65
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end65
  %0 = phi i1 [ false, %for.end65 ], [ true, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %cmp103 = icmp sgt i32 %or, %land.ext
  %conv104 = zext i1 %cmp103 to i32
  %tmp105 = load i32** %p_10.addr, align 8
  %tmp106 = load i32* %tmp105
  %cmp107 = icmp eq i32 %conv104, %tmp106
  %conv108 = zext i1 %cmp107 to i32
  %tmp109 = load i32** %p_10.addr, align 8
  store i32 %conv108, i32* %tmp109
  br label %for.inc110

for.inc110:                                       ; preds = %land.end
  %tmp111 = load i32* @g_11, align 4
  %call112 = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp111, i32 7)
  store i32 %call112, i32* @g_11, align 4
  br label %for.cond3

for.end113:                                       ; preds = %for.cond3
  %tmp114 = load i32** %p_10.addr, align 8
  store i32* %tmp114, i32** %retval
  br label %return

return:                                           ; preds = %for.end113, %for.end40
  %1 = load i32** %retval
  ret i32* %1
}

define i32* @func_16(i32 %p_17, i32 %p_18, i32* %p_19) nounwind uwtable {
entry:
  %p_17.addr = alloca i32, align 4
  %p_18.addr = alloca i32, align 4
  %p_19.addr = alloca i32*, align 8
  store i32 %p_17, i32* %p_17.addr, align 4
  store i32 %p_18, i32* %p_18.addr, align 4
  store i32* %p_19, i32** %p_19.addr, align 8
  ret i32* %p_18.addr
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
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

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i8
  ret i8 %conv7
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
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 7), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 8), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 0, i64 9), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 1), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 2), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 3), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 4), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 5), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 7), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 8), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 9), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i32 0, i64 1, i64 6), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* @g_11, align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %tmp42)
  %tmp44 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str21, i32 0, i32 0), i32 %tmp44)
  %tmp46 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 1), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str22, i32 0, i32 0), i32 %tmp46)
  %tmp48 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str23, i32 0, i32 0), i32 %tmp48)
  %tmp50 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i32 0, i64 2), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str23, i32 0, i32 0), i32 %tmp50)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
