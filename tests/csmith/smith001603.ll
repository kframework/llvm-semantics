; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001603.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -512397033, align 4
@g_5 = global [6 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]]], align 16
@g_6 = global i32 -836883443, align 4
@g_7 = global i32 891083955, align 4
@g_15 = global i32 1749084996, align 4
@g_27 = global i32* @g_7, align 8
@g_26 = constant i32** @g_27, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][0][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][0][1] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][1][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][1][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][0][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][1][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][1][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][0][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][1][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][1][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][0][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][1][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][1][1] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_12 = alloca i64, align 8
  %l_16 = alloca [8 x i32], align 16
  %i = alloca i32, align 4
  %i8 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_13 = alloca i8, align 1
  %l_14 = alloca [6 x i32*], align 16
  %i26 = alloca i32, align 4
  %l_28 = alloca i32**, align 8
  store i64 -3305103600195634765, i64* %l_12, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32]* %l_16, i32 0, i64 %idxprom
  store i32 -2053899842, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i32 -10, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc133, %for.end
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp sle i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end138

for.body6:                                        ; preds = %for.cond3
  volatile store i32 3, i32* @g_2, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc129, %for.body6
  %tmp12 = volatile load i32* @g_2, align 4
  %cmp13 = icmp slt i32 %tmp12, 6
  br i1 %cmp13, label %for.body14, label %for.end132

for.body14:                                       ; preds = %for.cond11
  store i32 1, i32* @g_6, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc125, %for.body14
  %tmp16 = load i32* @g_6, align 4
  %cmp17 = icmp slt i32 %tmp16, 2
  br i1 %cmp17, label %for.body18, label %for.end128

for.body18:                                       ; preds = %for.cond15
  store i32 1, i32* @g_7, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc122, %for.body18
  %tmp20 = load i32* @g_7, align 4
  %cmp21 = icmp slt i32 %tmp20, 2
  br i1 %cmp21, label %for.body22, label %for.end124

for.body22:                                       ; preds = %for.cond19
  store i8 -59, i8* %l_13, align 1
  store i32 0, i32* %i26, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc34, %for.body22
  %tmp28 = load i32* %i26, align 4
  %cmp29 = icmp slt i32 %tmp28, 6
  br i1 %cmp29, label %for.body30, label %for.end37

for.body30:                                       ; preds = %for.cond27
  %tmp31 = load i32* %i26, align 4
  %idxprom32 = sext i32 %tmp31 to i64
  %arrayidx33 = getelementptr inbounds [6 x i32*]* %l_14, i32 0, i64 %idxprom32
  store i32* @g_15, i32** %arrayidx33, align 8
  br label %for.inc34

for.inc34:                                        ; preds = %for.body30
  %tmp35 = load i32* %i26, align 4
  %inc36 = add nsw i32 %tmp35, 1
  store i32 %inc36, i32* %i26, align 4
  br label %for.cond27

for.end37:                                        ; preds = %for.cond27
  %tmp38 = load i32* @g_7, align 4
  %rem = urem i32 %tmp38, 2
  %idxprom39 = zext i32 %rem to i64
  %tmp40 = load i32* @g_6, align 4
  %rem41 = urem i32 %tmp40, 2
  %idxprom42 = zext i32 %rem41 to i64
  %tmp43 = volatile load i32* @g_2, align 4
  %rem44 = urem i32 %tmp43, 6
  %idxprom45 = zext i32 %rem44 to i64
  %arrayidx46 = getelementptr inbounds [6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx46, i32 0, i64 %idxprom42
  %arrayidx48 = getelementptr inbounds [2 x i32]* %arrayidx47, i32 0, i64 %idxprom39
  %tmp49 = load i32* %arrayidx48, align 4
  %conv = trunc i32 %tmp49 to i16
  %tmp50 = load i64* %l_12, align 8
  %tmp51 = load i32* @g_7, align 4
  %tmp52 = load i8* %l_13, align 1
  %conv53 = sext i8 %tmp52 to i32
  %cmp54 = icmp slt i32 %tmp51, %conv53
  %conv55 = zext i1 %cmp54 to i32
  %conv56 = sext i32 %conv55 to i64
  %cmp57 = icmp ule i64 %tmp50, %conv56
  %conv58 = zext i1 %cmp57 to i32
  %conv59 = trunc i32 %conv58 to i16
  %call = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv59)
  %conv60 = zext i16 %call to i64
  %cmp61 = icmp sle i64 %conv60, 1
  %conv62 = zext i1 %cmp61 to i32
  %conv63 = trunc i32 %conv62 to i8
  %tmp64 = load i8* %l_13, align 1
  %conv65 = sext i8 %tmp64 to i32
  %tobool = icmp ne i32 %conv65, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end37
  %tmp66 = load i32* @g_6, align 4
  %tobool67 = icmp ne i32 %tmp66, 0
  br i1 %tobool67, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %tmp68 = load i64* %l_12, align 8
  %tobool69 = icmp ne i64 %tmp68, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %0 = phi i1 [ true, %land.rhs ], [ %tobool69, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.end37
  %1 = phi i1 [ false, %for.end37 ], [ %0, %lor.end ]
  %land.ext = zext i1 %1 to i32
  %conv70 = trunc i32 %land.ext to i8
  %call71 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv63, i8 signext %conv70)
  %conv72 = sext i8 %call71 to i64
  %cmp73 = icmp sge i64 %conv72, 1
  %conv74 = zext i1 %cmp73 to i32
  %arrayidx75 = getelementptr inbounds [8 x i32]* %l_16, i32 0, i64 5
  store i32 %conv74, i32* %arrayidx75, align 4
  %tmp76 = load i32* @g_7, align 4
  %tobool77 = icmp ne i32 %tmp76, 0
  br i1 %tobool77, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  br label %lbl_21

if.end:                                           ; preds = %land.end
  store i8 0, i8* %l_13, align 1
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc118, %if.end
  %tmp79 = load i8* %l_13, align 1
  %conv80 = sext i8 %tmp79 to i32
  %cmp81 = icmp sgt i32 %conv80, 0
  br i1 %cmp81, label %for.body83, label %for.end121

for.body83:                                       ; preds = %for.cond78
  br label %lbl_21

lbl_21:                                           ; preds = %for.body83, %if.then
  store i64 0, i64* %l_12, align 8
  br label %for.cond84

for.cond84:                                       ; preds = %for.inc91, %lbl_21
  %tmp85 = load i64* %l_12, align 8
  %cmp86 = icmp ule i64 %tmp85, 0
  br i1 %cmp86, label %for.body88, label %for.end94

for.body88:                                       ; preds = %for.cond84
  %tmp89 = load i32* @g_15, align 4
  %conv90 = trunc i32 %tmp89 to i16
  store i16 %conv90, i16* %retval
  br label %return

for.inc91:                                        ; No predecessors!
  %tmp92 = load i64* %l_12, align 8
  %call93 = call i64 @safe_add_func_int64_t_s_s(i64 %tmp92, i64 1)
  store i64 %call93, i64* %l_12, align 8
  br label %for.cond84

for.end94:                                        ; preds = %for.cond84
  store i8 -26, i8* %l_13, align 1
  br label %for.cond95

for.cond95:                                       ; preds = %for.inc114, %for.end94
  %tmp96 = load i8* %l_13, align 1
  %conv97 = sext i8 %tmp96 to i32
  %cmp98 = icmp sgt i32 %conv97, 0
  br i1 %cmp98, label %for.body100, label %for.end117

for.body100:                                      ; preds = %for.cond95
  %tmp101 = load i32* @g_15, align 4
  %conv102 = trunc i32 %tmp101 to i8
  %call103 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv102, i32 -1232533963)
  %tobool104 = icmp ne i8 %call103, 0
  br i1 %tobool104, label %if.then105, label %if.else

if.then105:                                       ; preds = %for.body100
  %tmp106 = volatile load i32*** @g_26, align 8
  store i32* @g_15, i32** %tmp106
  %arrayidx107 = getelementptr inbounds [8 x i32]* %l_16, i32 0, i64 5
  %tmp108 = load i32* %arrayidx107, align 4
  %conv109 = trunc i32 %tmp108 to i16
  store i16 %conv109, i16* %retval
  br label %return

if.else:                                          ; preds = %for.body100
  store i32** @g_27, i32*** %l_28, align 8
  %tmp111 = load i32*** %l_28, align 8
  store i32* null, i32** %tmp111
  %tmp112 = load i32* @g_7, align 4
  %conv113 = trunc i32 %tmp112 to i16
  store i16 %conv113, i16* %retval
  br label %return

for.inc114:                                       ; No predecessors!
  %tmp115 = load i8* %l_13, align 1
  %call116 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %tmp115, i8 signext 3)
  store i8 %call116, i8* %l_13, align 1
  br label %for.cond95

for.end117:                                       ; preds = %for.cond95
  br label %for.inc118

for.inc118:                                       ; preds = %for.end117
  %tmp119 = load i8* %l_13, align 1
  %call120 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %tmp119, i8 signext 1)
  store i8 %call120, i8* %l_13, align 1
  br label %for.cond78

for.end121:                                       ; preds = %for.cond78
  br label %for.inc122

for.inc122:                                       ; preds = %for.end121
  %tmp123 = load i32* @g_7, align 4
  %add = add nsw i32 %tmp123, 2
  store i32 %add, i32* @g_7, align 4
  br label %for.cond19

for.end124:                                       ; preds = %for.cond19
  br label %for.inc125

for.inc125:                                       ; preds = %for.end124
  %tmp126 = load i32* @g_6, align 4
  %add127 = add nsw i32 %tmp126, 1
  store i32 %add127, i32* @g_6, align 4
  br label %for.cond15

for.end128:                                       ; preds = %for.cond15
  br label %for.inc129

for.inc129:                                       ; preds = %for.end128
  %tmp130 = volatile load i32* @g_2, align 4
  %add131 = add nsw i32 %tmp130, 3
  volatile store i32 %add131, i32* @g_2, align 4
  br label %for.cond11

for.end132:                                       ; preds = %for.cond11
  br label %for.inc133

for.inc133:                                       ; preds = %for.end132
  %tmp134 = volatile load i32* @g_2, align 4
  %conv135 = sext i32 %tmp134 to i64
  %call136 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv135, i64 1)
  %conv137 = trunc i64 %call136 to i32
  volatile store i32 %conv137, i32* @g_2, align 4
  br label %for.cond3

for.end138:                                       ; preds = %for.cond3
  %tmp139 = load i64* %l_12, align 8
  %conv140 = trunc i64 %tmp139 to i16
  store i16 %conv140, i16* %retval
  br label %return

return:                                           ; preds = %for.end138, %if.else, %if.then105, %for.body88
  %2 = load i16* %retval
  ret i16 %2
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

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %si2.addr, align 8
  %cmp2 = icmp sgt i64 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i64* %si1.addr, align 8
  %tmp5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %tmp5
  %cmp6 = icmp sgt i64 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i64* %si1.addr, align 8
  %cmp8 = icmp slt i64 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i64* %si2.addr, align 8
  %cmp11 = icmp slt i64 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i64* %si1.addr, align 8
  %tmp14 = load i64* %si2.addr, align 8
  %sub15 = sub nsw i64 -9223372036854775808, %tmp14
  %cmp16 = icmp slt i64 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i64* %si1.addr, align 8
  %tmp19 = load i64* %si2.addr, align 8
  %add = add nsw i64 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i64 %cond
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
  %call = call signext i16 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 1, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 0, i64 1, i64 1), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 0, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 0, i64 1), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 1, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 1, i64 1, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 0, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 0, i64 1), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 1, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 2, i64 1, i64 1), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 0, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 0, i64 1), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 1, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 3, i64 1, i64 1), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 0, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 0, i64 1), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 1, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 4, i64 1, i64 1), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 0, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 0, i64 1), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 1, i64 0), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i32 0, i64 5, i64 1, i64 1), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* @g_6, align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str25, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* @g_7, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str26, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* @g_15, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str27, i32 0, i32 0), i32 %tmp54)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
