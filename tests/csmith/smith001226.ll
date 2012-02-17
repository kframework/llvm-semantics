; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001226.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_19 = global i32 -758613387, align 4
@g_36 = global i32* @g_2, align 8
@g_35 = global i32** @g_36, align 8
@g_38 = global i32* @g_19, align 8
@g_37 = global [4 x i32**] [i32** @g_38, i32** @g_38, i32** @g_38, i32** @g_38], align 16
@g_40 = global [2 x i32**] [i32** @g_38, i32** @g_38], align 16
@g_41 = global i32** @g_38, align 8
@func_10.l_13 = internal constant [10 x i8] c"\E3\E3\E3\E3\E3\E3\E3\E3\E3\E3", align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_42 = alloca i32*, align 8
  %l_45 = alloca [10 x [8 x [1 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_7 = alloca i64, align 8
  %l_22 = alloca i32, align 4
  %l_33 = alloca i32*, align 8
  %l_32 = alloca i32**, align 8
  %l_39 = alloca i32**, align 8
  store i32* @g_19, i32** %l_42, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 8
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [10 x [8 x [1 x i16]]]* %l_45, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [8 x [1 x i16]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x i16]* %arrayidx14, i32 0, i64 %idxprom
  store i16 -25014, i16* %arrayidx15, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp16 = load i32* %k, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %tmp18 = load i32* %j, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond1

for.end20:                                        ; preds = %for.cond1
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc86, %for.end24
  %tmp26 = volatile load i32* @g_2, align 4
  %cmp27 = icmp sge i32 %tmp26, 27
  br i1 %cmp27, label %for.body28, label %for.end89

for.body28:                                       ; preds = %for.cond25
  store i64 -10, i64* %l_7, align 8
  volatile store i32 18, i32* @g_2, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc35, %for.body28
  %tmp31 = volatile load i32* @g_2, align 4
  %cmp32 = icmp sgt i32 %tmp31, 0
  br i1 %cmp32, label %for.body33, label %for.end39

for.body33:                                       ; preds = %for.cond30
  %tmp34 = load i64* %l_7, align 8
  %conv = trunc i64 %tmp34 to i32
  store i32 %conv, i32* %retval
  br label %return

for.inc35:                                        ; No predecessors!
  %tmp36 = volatile load i32* @g_2, align 4
  %conv37 = trunc i32 %tmp36 to i8
  %call = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv37, i8 zeroext 1)
  %conv38 = zext i8 %call to i32
  volatile store i32 %conv38, i32* @g_2, align 4
  br label %for.cond30

for.end39:                                        ; preds = %for.cond30
  %tmp40 = volatile load i32* @g_2, align 4
  %conv41 = trunc i32 %tmp40 to i8
  %call42 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext 114, i8 signext %conv41)
  %conv43 = sext i8 %call42 to i64
  %call44 = call i32 @func_10(i64 %conv43, i8 signext 11)
  %conv45 = trunc i32 %call44 to i8
  %call46 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %conv45, i32 -4)
  %tobool = icmp ne i8 %call46, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end39
  store i32 -1, i32* %l_22, align 4
  store i32* @g_19, i32** %l_33, align 8
  store i32** %l_33, i32*** %l_32, align 8
  %tmp50 = volatile load i32* @g_2, align 4
  %tmp51 = load i32* %l_22, align 4
  %cmp52 = icmp ult i32 %tmp50, %tmp51
  %conv53 = zext i1 %cmp52 to i32
  %conv54 = trunc i32 %conv53 to i16
  %call55 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv54, i32 -2024953758)
  %conv56 = sext i16 %call55 to i32
  %tobool57 = icmp ne i32 %conv56, 0
  br i1 %tobool57, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then
  %tmp58 = volatile load i32* @g_2, align 4
  %tmp59 = load i32* @g_19, align 4
  %conv60 = sext i32 %tmp59 to i64
  %tmp61 = load i32* @g_19, align 4
  %call62 = call i32 @func_30(i32 %tmp61)
  %tmp63 = load i32* %l_22, align 4
  %call64 = call i32 @func_23(i32 %tmp58, i64 %conv60, i32 %call62, i32 %tmp63, i32* @g_19)
  %tobool65 = icmp ne i32 %call64, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then
  %0 = phi i1 [ true, %if.then ], [ %tobool65, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %cmp66 = icmp ne i32 0, %lor.ext
  %conv67 = zext i1 %cmp66 to i32
  %conv68 = trunc i32 %conv67 to i8
  %call69 = call i32* @func_16(i8 signext %conv68)
  %tmp70 = load i32*** %l_32, align 8
  store i32* %call69, i32** %tmp70
  %tmp71 = load i32* @g_19, align 4
  %tobool72 = icmp ne i32 %tmp71, 0
  br i1 %tobool72, label %if.then73, label %if.end

if.then73:                                        ; preds = %lor.end
  br label %lbl_34

if.end:                                           ; preds = %lor.end
  br label %lbl_34

lbl_34:                                           ; preds = %if.end, %if.then73
  %tmp74 = load i32** %l_33, align 8
  store i32 -10, i32* %tmp74
  %tmp75 = volatile load i32*** @g_35, align 8
  store i32* @g_2, i32** %tmp75
  br label %if.end83

if.else:                                          ; preds = %for.end39
  store i32** null, i32*** %l_39, align 8
  %call77 = call i32* @func_16(i8 signext 0)
  %tmp78 = volatile load i32*** @g_41, align 8
  store i32* %call77, i32** %tmp78
  store i32* null, i32** %l_42, align 8
  %tmp79 = load i64* %l_7, align 8
  %tobool80 = icmp ne i64 %tmp79, 0
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.else
  br label %for.inc86

if.end82:                                         ; preds = %if.else
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %lbl_34
  %tmp84 = load i64* %l_7, align 8
  %conv85 = trunc i64 %tmp84 to i32
  store i32 %conv85, i32* %retval
  br label %return

for.inc86:                                        ; preds = %if.then81
  %tmp87 = volatile load i32* @g_2, align 4
  %call88 = call i32 @safe_add_func_int32_t_s_s(i32 %tmp87, i32 1)
  volatile store i32 %call88, i32* @g_2, align 4
  br label %for.cond25

for.end89:                                        ; preds = %for.cond25
  store i32 0, i32* @g_19, align 4
  br label %for.cond90

for.cond90:                                       ; preds = %for.inc103, %for.end89
  %tmp91 = load i32* @g_19, align 4
  %cmp92 = icmp sgt i32 %tmp91, 22
  br i1 %cmp92, label %for.body94, label %for.end108

for.body94:                                       ; preds = %for.cond90
  %tmp95 = volatile load i32*** @g_35, align 8
  %tmp96 = load i32** %tmp95
  %tmp97 = volatile load i32* %tmp96
  %tobool98 = icmp ne i32 %tmp97, 0
  br i1 %tobool98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %for.body94
  br label %for.end108

if.end100:                                        ; preds = %for.body94
  %tmp101 = load i32** @g_38, align 8
  %tmp102 = load i32* %tmp101
  store i32 %tmp102, i32* %retval
  br label %return

for.inc103:                                       ; No predecessors!
  %tmp104 = load i32* @g_19, align 4
  %conv105 = trunc i32 %tmp104 to i8
  %call106 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv105, i8 zeroext 1)
  %conv107 = zext i8 %call106 to i32
  store i32 %conv107, i32* @g_19, align 4
  br label %for.cond90

for.end108:                                       ; preds = %if.then99, %for.cond90
  %arrayidx109 = getelementptr inbounds [10 x [8 x [1 x i16]]]* %l_45, i32 0, i64 6
  %arrayidx110 = getelementptr inbounds [8 x [1 x i16]]* %arrayidx109, i32 0, i64 5
  %arrayidx111 = getelementptr inbounds [1 x i16]* %arrayidx110, i32 0, i64 0
  %tmp112 = load i16* %arrayidx111, align 2
  %conv113 = sext i16 %tmp112 to i32
  store i32 %conv113, i32* %retval
  br label %return

return:                                           ; preds = %for.end108, %if.end100, %if.end83, %for.body33
  %1 = load i32* %retval
  ret i32 %1
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp2, label %cond.true, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp4 to i32
  %tmp5 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %tmp5
  %cmp6 = icmp sgt i32 %conv, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %tmp8 = load i8* %left.addr, align 1
  %conv9 = zext i8 %tmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false3
  %tmp10 = load i8* %left.addr, align 1
  %conv11 = zext i8 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shl = shl i32 %conv11, %tmp12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  ret i8 %conv13
}

define i32 @func_10(i64 %p_11, i8 signext %p_12) nounwind uwtable {
entry:
  %p_11.addr = alloca i64, align 8
  %p_12.addr = alloca i8, align 1
  %i = alloca i32, align 4
  store i64 %p_11, i64* %p_11.addr, align 8
  store i8 %p_12, i8* %p_12.addr, align 1
  %tmp = load i8* getelementptr inbounds ([10 x i8]* @func_10.l_13, i32 0, i64 9), align 1
  %conv = sext i8 %tmp to i32
  ret i32 %conv
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

define i32* @func_16(i8 signext %p_17) nounwind uwtable {
entry:
  %p_17.addr = alloca i8, align 1
  %l_18 = alloca i32*, align 8
  store i8 %p_17, i8* %p_17.addr, align 1
  store i32* @g_19, i32** %l_18, align 8
  %tmp = load i32** %l_18, align 8
  store i32 1561159054, i32* %tmp
  %tmp1 = load i32** %l_18, align 8
  ret i32* %tmp1
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

define i32 @func_23(i32 %p_24, i64 %p_25, i32 %p_26, i32 %p_27, i32* %p_28) nounwind uwtable {
entry:
  %p_24.addr = alloca i32, align 4
  %p_25.addr = alloca i64, align 8
  %p_26.addr = alloca i32, align 4
  %p_27.addr = alloca i32, align 4
  %p_28.addr = alloca i32*, align 8
  %l_29 = alloca i32, align 4
  store i32 %p_24, i32* %p_24.addr, align 4
  store i64 %p_25, i64* %p_25.addr, align 8
  store i32 %p_26, i32* %p_26.addr, align 4
  store i32 %p_27, i32* %p_27.addr, align 4
  store i32* %p_28, i32** %p_28.addr, align 8
  store i32 1, i32* %l_29, align 4
  %tmp = load i32* %l_29, align 4
  %tmp1 = load i32** %p_28.addr, align 8
  store i32 %tmp, i32* %tmp1
  %tmp2 = load i32* %l_29, align 4
  ret i32 %tmp2
}

define i32 @func_30(i32 %p_31) nounwind uwtable {
entry:
  %p_31.addr = alloca i32, align 4
  store i32 %p_31, i32* %p_31.addr, align 4
  %tmp = load i32* @g_19, align 4
  ret i32 %tmp
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %si2.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i32* %si1.addr, align 4
  %tmp5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %tmp5
  %cmp6 = icmp sgt i32 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i32* %si1.addr, align 4
  %cmp8 = icmp slt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i32* %si2.addr, align 4
  %cmp11 = icmp slt i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %si1.addr, align 4
  %tmp14 = load i32* %si2.addr, align 4
  %sub15 = sub nsw i32 -2147483648, %tmp14
  %cmp16 = icmp slt i32 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i32* %si1.addr, align 4
  %tmp19 = load i32* %si2.addr, align 4
  %add = add nsw i32 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
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
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_19, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
