; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001266.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@g_17 = global i32 -336830778, align 4
@g_25 = global [2 x [5 x [4 x i32]]] [[5 x [4 x i32]] [[4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902]], [5 x [4 x i32]] [[4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][1] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][2] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][3] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][1] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][2] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][3] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][0] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][1] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][2] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][3] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][1] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][2] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][3] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][0] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][1] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][2] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_5 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  %l_22 = alloca i32, align 4
  %l_23 = alloca i64, align 8
  %l_24 = alloca i32*, align 8
  %l_30 = alloca i32*, align 8
  store i32 -1929245742, i32* %l_5, align 4
  store i32 1884241230, i32* %l_6, align 4
  store i32 -1, i32* %l_22, align 4
  store i64 1, i64* %l_23, align 8
  store i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 0), i32** %l_24, align 8
  store i32* %l_5, i32** %l_30, align 8
  volatile store i32 18, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %l_5, align 4
  %tmp2 = load i32* %l_6, align 4
  %or = or i32 %tmp2, %tmp1
  store i32 %or, i32* %l_6, align 4
  %tmp3 = volatile load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp4 = volatile load i32* @g_2, align 4
  %conv = sext i32 %tmp4 to i64
  %call = call i64 @safe_add_func_uint64_t_u_u(i64 %conv, i64 1)
  %conv5 = trunc i64 %call to i32
  volatile store i32 %conv5, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %tmp6 = load i32* %l_6, align 4
  %conv7 = trunc i32 %tmp6 to i16
  %call8 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv7, i32 -1)
  %call9 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %call8, i32 1462075040)
  %call10 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext 6812, i16 signext %call9)
  %conv11 = sext i16 %call10 to i32
  %tmp12 = load i32* %l_5, align 4
  %tmp13 = load i32* %l_6, align 4
  %tmp14 = volatile load i32* @g_2, align 4
  %or15 = or i32 %tmp13, %tmp14
  %conv16 = trunc i32 %or15 to i8
  %call17 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv16, i32 2)
  %conv18 = sext i8 %call17 to i32
  %tmp19 = load i32* @g_17, align 4
  %tobool20 = icmp ne i32 %tmp19, 0
  br i1 %tobool20, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp21 = load i32* %l_5, align 4
  %tobool22 = icmp ne i32 %tmp21, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool22, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv23 = trunc i32 %lor.ext to i8
  %call24 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv23, i8 signext -110)
  %conv25 = sext i8 %call24 to i32
  %or26 = or i32 %conv18, %conv25
  %tmp27 = load i32* %l_6, align 4
  %conv28 = trunc i32 %tmp27 to i8
  %tmp29 = load i32* %l_6, align 4
  %conv30 = trunc i32 %tmp29 to i8
  %call31 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv28, i8 signext %conv30)
  %conv32 = sext i8 %call31 to i32
  %tobool33 = icmp ne i32 %conv32, 0
  br i1 %tobool33, label %lor.end37, label %lor.rhs34

lor.rhs34:                                        ; preds = %lor.end
  %tmp35 = load i32* @g_17, align 4
  %tobool36 = icmp ne i32 %tmp35, 0
  br label %lor.end37

lor.end37:                                        ; preds = %lor.rhs34, %lor.end
  %1 = phi i1 [ true, %lor.end ], [ %tobool36, %lor.rhs34 ]
  %lor.ext38 = zext i1 %1 to i32
  %tmp39 = load i32* @g_17, align 4
  %tmp40 = load i32* %l_22, align 4
  %conv41 = trunc i32 %tmp40 to i8
  %tmp42 = load i64* %l_23, align 8
  %conv43 = trunc i64 %tmp42 to i8
  %call44 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv41, i8 zeroext %conv43)
  %conv45 = zext i8 %call44 to i32
  %and = and i32 %tmp39, %conv45
  %and46 = and i32 %lor.ext38, %and
  %cmp47 = icmp slt i32 %or26, %and46
  %conv48 = zext i1 %cmp47 to i32
  %cmp49 = icmp sge i32 %tmp12, %conv48
  %conv50 = zext i1 %cmp49 to i32
  %xor = xor i32 %conv11, %conv50
  %tmp51 = load i32** %l_24, align 8
  %tmp52 = load i32* %tmp51
  %or53 = or i32 %tmp52, %xor
  store i32 %or53, i32* %tmp51
  store i32 0, i32* %l_5, align 4
  br label %for.cond54

for.cond54:                                       ; preds = %for.inc61, %lor.end37
  %tmp55 = load i32* %l_5, align 4
  %cmp56 = icmp sge i32 %tmp55, 0
  br i1 %cmp56, label %for.body58, label %for.end66

for.body58:                                       ; preds = %for.cond54
  %tmp59 = load i32* @g_17, align 4
  %conv60 = trunc i32 %tmp59 to i8
  store i8 %conv60, i8* %retval
  br label %return

for.inc61:                                        ; No predecessors!
  %tmp62 = load i32* %l_5, align 4
  %conv63 = sext i32 %tmp62 to i64
  %call64 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv63, i64 4)
  %conv65 = trunc i64 %call64 to i32
  store i32 %conv65, i32* %l_5, align 4
  br label %for.cond54

for.end66:                                        ; preds = %for.cond54
  %tmp67 = load i32** %l_24, align 8
  %tmp68 = load i32* %tmp67
  %tobool69 = icmp ne i32 %tmp68, 0
  br i1 %tobool69, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end66
  %call70 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext 0, i32 1)
  %conv71 = zext i8 %call70 to i32
  %tobool72 = icmp ne i32 %conv71, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end66
  %2 = phi i1 [ false, %for.end66 ], [ %tobool72, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  %cmp73 = icmp slt i32 1, %land.ext
  %conv74 = zext i1 %cmp73 to i32
  %tmp75 = load i32** %l_30, align 8
  %tmp76 = load i32* %tmp75
  %or77 = or i32 %tmp76, %conv74
  store i32 %or77, i32* %tmp75
  %tmp78 = load i32** %l_30, align 8
  %tmp79 = load i32* %tmp78
  %conv80 = trunc i32 %tmp79 to i8
  store i8 %conv80, i8* %retval
  br label %return

return:                                           ; preds = %land.end, %for.body58
  %3 = load i8* %retval
  ret i8 %3
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %mul = mul nsw i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %right.addr, align 4
  %cmp2 = icmp sge i32 %tmp1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp3 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %tmp6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv7 = trunc i32 %cond to i16
  ret i16 %conv7
}

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i16* %left.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i16* %left.addr, align 2
  %conv6 = sext i16 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i16* %left.addr, align 2
  %conv8 = sext i16 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shr, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = sext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = sext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shr, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
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

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %tmp, %tmp1
  ret i64 %sub
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = zext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = zext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
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
  %tmp2 = load i32* @g_17, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 1), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 2), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 1, i64 3), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 1), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 2), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 2, i64 3), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 1), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 2), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 3, i64 3), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 0), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 1), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 2), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 4, i64 3), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 1), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 2), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 0, i64 3), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 0), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 1), align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i32 0, i32 0), i32 %tmp54)
  %tmp56 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 2), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i32 0, i32 0), i32 %tmp56)
  %tmp58 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 1, i64 3), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 0), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i32 0, i32 0), i32 %tmp60)
  %tmp62 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 1), align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 2), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i32 0, i32 0), i32 %tmp64)
  %tmp66 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 2, i64 3), align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 0), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i32 0, i32 0), i32 %tmp68)
  %tmp70 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 1), align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i32 %tmp70)
  %tmp72 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 2), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i32 0, i32 0), i32 %tmp72)
  %tmp74 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 3, i64 3), align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i32 0, i32 0), i32 %tmp74)
  %tmp76 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 0), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i32 0, i32 0), i32 %tmp76)
  %tmp78 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 1), align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i32 0, i32 0), i32 %tmp78)
  %tmp80 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 2), align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i32 0, i32 0), i32 %tmp80)
  %tmp82 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 1, i64 4, i64 3), align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i32 0, i32 0), i32 %tmp82)
  %tmp84 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i32 0, i64 0, i64 0, i64 0), align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %tmp84)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
