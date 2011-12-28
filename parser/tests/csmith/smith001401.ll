; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001401.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -8679, align 2
@g_9 = global i16 4, align 2
@g_16 = global i32 -300116159, align 4
@g_20 = global i16 -2, align 2
@g_21 = global i32* null, align 8
@g_30 = global [5 x [4 x [1 x i32]]] [[4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]], [4 x [1 x i32]] [[1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133], [1 x i32] [i32 -184967133]]], align 16
@g_32 = global i32** null, align 8
@g_34 = global i32* @g_16, align 8
@g_33 = global i32** @g_34, align 8
@g_36 = global i32** @g_34, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_16 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_20 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][2][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_30[0][3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][1][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_30[1][3][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][1][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_30[2][3][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][1][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][2][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_30[3][3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][1][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][2][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_30[4][3][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_10 = alloca i64, align 8
  %l_22 = alloca i32, align 4
  %l_23 = alloca i32*, align 8
  %l_38 = alloca i64, align 8
  %l_37 = alloca i32, align 4
  %l_35 = alloca i32**, align 8
  store i64 7, i64* %l_10, align 8
  store i32 1599806319, i32* %l_22, align 4
  store i32* @g_16, i32** %l_23, align 8
  store i64 8727868780990093312, i64* %l_38, align 8
  %tmp = volatile load i16* @g_2, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i64* %l_10, align 8
  %conv2 = trunc i64 %tmp1 to i16
  %tmp3 = load i64* %l_10, align 8
  %conv4 = trunc i64 %tmp3 to i32
  %call = call signext i8 @func_11(i32 %conv4)
  %tmp5 = load i16* @g_20, align 2
  %conv6 = sext i16 %tmp5 to i64
  %tmp7 = load i16* @g_20, align 2
  %tmp8 = load i16* @g_20, align 2
  %conv9 = sext i16 %tmp8 to i32
  %call10 = call i32 @func_3(i16 zeroext %conv2, i8 signext %call, i64 %conv6, i16 zeroext %tmp7, i32 %conv9)
  %cmp = icmp sle i32 %conv, %call10
  %conv11 = zext i1 %cmp to i32
  store i32 %conv11, i32* %l_22, align 4
  %tmp12 = load i32** %l_23, align 8
  store i32 0, i32* %tmp12
  store i16 6, i16* @g_20, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %tmp13 = load i16* @g_20, align 2
  %conv14 = sext i16 %tmp13 to i32
  %cmp15 = icmp slt i32 %conv14, 8
  br i1 %cmp15, label %for.body, label %for.end38

for.body:                                         ; preds = %for.cond
  store i32 -1, i32* %l_37, align 4
  %tmp18 = load i32** %l_23, align 8
  store i32 1165515285, i32* %tmp18
  store i32 -25, i32* %l_22, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc, %for.body
  %tmp20 = load i32* %l_22, align 4
  %cmp21 = icmp eq i32 %tmp20, 21
  br i1 %cmp21, label %for.body23, label %for.end

for.body23:                                       ; preds = %for.cond19
  store i32** null, i32*** %l_35, align 8
  %call25 = call i32* @func_28(i32* @g_16)
  %tmp26 = volatile load i32*** @g_33, align 8
  store i32* %call25, i32** %tmp26
  %tmp27 = load i32** @g_34, align 8
  %tmp28 = volatile load i32*** @g_36, align 8
  store i32* %tmp27, i32** %tmp28
  br label %for.inc

for.inc:                                          ; preds = %for.body23
  %tmp29 = load i32* %l_22, align 4
  %conv30 = trunc i32 %tmp29 to i8
  %call31 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv30, i8 signext 1)
  %conv32 = sext i8 %call31 to i32
  store i32 %conv32, i32* %l_22, align 4
  br label %for.cond19

for.end:                                          ; preds = %for.cond19
  store i8 -1, i8* %retval
  br label %return

for.inc33:                                        ; No predecessors!
  %tmp34 = load i16* @g_20, align 2
  %conv35 = trunc i16 %tmp34 to i8
  %call36 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv35, i8 zeroext 1)
  %conv37 = zext i8 %call36 to i16
  store i16 %conv37, i16* @g_20, align 2
  br label %for.cond

for.end38:                                        ; preds = %for.cond
  %tmp39 = load i64* %l_38, align 8
  %tmp40 = load i32** @g_34, align 8
  %tmp41 = load i32* %tmp40
  %conv42 = sext i32 %tmp41 to i64
  %xor = xor i64 %conv42, %tmp39
  %conv43 = trunc i64 %xor to i32
  store i32 %conv43, i32* %tmp40
  %tmp44 = load i32** %l_23, align 8
  %tmp45 = load i32* %tmp44
  %conv46 = trunc i32 %tmp45 to i8
  store i8 %conv46, i8* %retval
  br label %return

return:                                           ; preds = %for.end38, %for.end
  %0 = load i8* %retval
  ret i8 %0
}

define i32 @func_3(i16 zeroext %p_4, i8 signext %p_5, i64 %p_6, i16 zeroext %p_7, i32 %p_8) nounwind uwtable {
entry:
  %p_4.addr = alloca i16, align 2
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i64, align 8
  %p_7.addr = alloca i16, align 2
  %p_8.addr = alloca i32, align 4
  store i16 %p_4, i16* %p_4.addr, align 2
  store i8 %p_5, i8* %p_5.addr, align 1
  store i64 %p_6, i64* %p_6.addr, align 8
  store i16 %p_7, i16* %p_7.addr, align 2
  store i32 %p_8, i32* %p_8.addr, align 4
  %tmp = load i16* @g_9, align 2
  %conv = zext i16 %tmp to i32
  ret i32 %conv
}

define signext i8 @func_11(i32 %p_12) nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %p_12.addr = alloca i32, align 4
  %l_19 = alloca [2 x i16], align 2
  %i = alloca i32, align 4
  %l_15 = alloca i32*, align 8
  %l_18 = alloca i32**, align 8
  %l_17 = alloca i32***, align 8
  %i12 = alloca i32, align 4
  store i32 %p_12, i32* %p_12.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 %idxprom
  store i16 0, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i16 4, i16* @g_9, align 2
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc33, %for.end
  %tmp4 = load i16* @g_9, align 2
  %conv = zext i16 %tmp4 to i32
  %cmp5 = icmp sge i32 %conv, 0
  br i1 %cmp5, label %for.body7, label %for.end37

for.body7:                                        ; preds = %for.cond3
  store i32* @g_16, i32** %l_15, align 8
  store i32** %l_15, i32*** %l_18, align 8
  store i32*** %l_18, i32**** %l_17, align 8
  %tmp13 = load i16* @g_9, align 2
  %conv14 = zext i16 %tmp13 to i32
  %tmp15 = load i32** %l_15, align 8
  %tmp16 = load i32* %tmp15
  %or = or i32 %tmp16, %conv14
  store i32 %or, i32* %tmp15
  %tmp17 = load i32**** %l_17, align 8
  store i32** %l_15, i32*** %tmp17
  store i16 0, i16* @g_9, align 2
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc27, %for.body7
  %tmp19 = load i16* @g_9, align 2
  %conv20 = zext i16 %tmp19 to i32
  %cmp21 = icmp slt i32 %conv20, 2
  br i1 %cmp21, label %for.body23, label %for.end31

for.body23:                                       ; preds = %for.cond18
  %arrayidx24 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 0
  %tmp25 = load i16* %arrayidx24, align 2
  %conv26 = trunc i16 %tmp25 to i8
  store i8 %conv26, i8* %retval
  br label %return

for.inc27:                                        ; No predecessors!
  %tmp28 = load i16* @g_9, align 2
  %conv29 = zext i16 %tmp28 to i32
  %add = add nsw i32 %conv29, 1
  %conv30 = trunc i32 %add to i16
  store i16 %conv30, i16* @g_9, align 2
  br label %for.cond18

for.end31:                                        ; preds = %for.cond18
  %tmp32 = load i32* @g_16, align 4
  %tobool = icmp ne i32 %tmp32, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  br label %for.end37

if.end:                                           ; preds = %for.end31
  br label %for.inc33

for.inc33:                                        ; preds = %if.end
  %tmp34 = load i16* @g_9, align 2
  %conv35 = zext i16 %tmp34 to i64
  %call = call i64 @safe_add_func_int64_t_s_s(i64 %conv35, i64 1)
  %conv36 = trunc i64 %call to i16
  store i16 %conv36, i16* @g_9, align 2
  br label %for.cond3

for.end37:                                        ; preds = %if.then, %for.cond3
  store i16 1, i16* @g_9, align 2
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc50, %for.end37
  %tmp39 = load i16* @g_9, align 2
  %conv40 = zext i16 %tmp39 to i32
  %cmp41 = icmp slt i32 %conv40, 2
  br i1 %cmp41, label %for.body43, label %for.end55

for.body43:                                       ; preds = %for.cond38
  %tmp44 = load i16* @g_9, align 2
  %conv45 = zext i16 %tmp44 to i32
  %rem = srem i32 %conv45, 2
  %idxprom46 = sext i32 %rem to i64
  %arrayidx47 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 %idxprom46
  %tmp48 = load i16* %arrayidx47, align 2
  %conv49 = trunc i16 %tmp48 to i8
  store i8 %conv49, i8* %retval
  br label %return

for.inc50:                                        ; No predecessors!
  %tmp51 = load i16* @g_9, align 2
  %conv52 = zext i16 %tmp51 to i32
  %add53 = add nsw i32 %conv52, 1
  %conv54 = trunc i32 %add53 to i16
  store i16 %conv54, i16* @g_9, align 2
  br label %for.cond38

for.end55:                                        ; preds = %for.cond38
  %tmp56 = load i16* @g_9, align 2
  %conv57 = zext i16 %tmp56 to i32
  %rem58 = srem i32 %conv57, 2
  %idxprom59 = sext i32 %rem58 to i64
  %arrayidx60 = getelementptr inbounds [2 x i16]* %l_19, i32 0, i64 %idxprom59
  %tmp61 = load i16* %arrayidx60, align 2
  %conv62 = trunc i16 %tmp61 to i8
  store i8 %conv62, i8* %retval
  br label %return

return:                                           ; preds = %for.end55, %for.body43, %for.body23
  %0 = load i8* %retval
  ret i8 %0
}

define i32* @func_28(i32* %p_29) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_29.addr = alloca i32*, align 8
  %l_31 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %p_29, i32** %p_29.addr, align 8
  store i32* @g_16, i32** %l_31, align 8
  %tmp = load i32** %p_29.addr, align 8
  %tmp1 = load i32* %tmp
  %conv = sext i32 %tmp1 to i64
  %xor = xor i64 %conv, 721254348
  %conv2 = trunc i64 %xor to i32
  store i32 %conv2, i32* %tmp
  volatile store i16 1, i16* @g_2, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %tmp3 = volatile load i16* @g_2, align 2
  %conv4 = sext i16 %tmp3 to i32
  %cmp = icmp slt i32 %conv4, 5
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i16 2, i16* @g_20, align 2
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc19, %for.body
  %tmp7 = load i16* @g_20, align 2
  %conv8 = sext i16 %tmp7 to i32
  %cmp9 = icmp slt i32 %conv8, 4
  br i1 %cmp9, label %for.body11, label %for.end24

for.body11:                                       ; preds = %for.cond6
  store i32 0, i32* @g_16, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body11
  %tmp13 = load i32* @g_16, align 4
  %cmp14 = icmp slt i32 %tmp13, 1
  br i1 %cmp14, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond12
  %tmp17 = load i32** %l_31, align 8
  store i32* %tmp17, i32** %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp18 = load i32* @g_16, align 4
  %add = add nsw i32 %tmp18, 1
  store i32 %add, i32* @g_16, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %tmp20 = load i16* @g_20, align 2
  %conv21 = sext i16 %tmp20 to i32
  %add22 = add nsw i32 %conv21, 1
  %conv23 = trunc i32 %add22 to i16
  store i16 %conv23, i16* @g_20, align 2
  br label %for.cond6

for.end24:                                        ; preds = %for.cond6
  br label %for.inc25

for.inc25:                                        ; preds = %for.end24
  %tmp26 = volatile load i16* @g_2, align 2
  %conv27 = sext i16 %tmp26 to i32
  %add28 = add nsw i32 %conv27, 5
  %conv29 = trunc i32 %add28 to i16
  volatile store i16 %conv29, i16* @g_2, align 2
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  store i32* @g_16, i32** %retval
  br label %return

return:                                           ; preds = %for.end30, %for.body16
  %0 = load i32** %retval
  ret i32* %0
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

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
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
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i16* @g_2, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* @g_9, align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i32* @g_16, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp5)
  %tmp7 = load i16* @g_20, align 2
  %conv8 = sext i16 %tmp7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %conv8)
  %tmp10 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 0, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 1, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 2, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 0, i64 3, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 0, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 1, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 2, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 1, i64 3, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 0, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 1, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 2, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 2, i64 3, i64 0), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 0, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 1, i64 0), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 2, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 3, i64 3, i64 0), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 0, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 1, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 2, i64 0), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([5 x [4 x [1 x i32]]]* @g_30, i32 0, i64 4, i64 3, i64 0), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %tmp48)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
