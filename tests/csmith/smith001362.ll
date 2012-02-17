; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001362.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = constant i32 -1793153426, align 4
@g_39 = global i32 -3, align 4
@g_41 = global i32 868786368, align 4
@g_40 = global i32* @g_41, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_39 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_43 = alloca i32*, align 8
  %l_44 = alloca i32**, align 8
  store i32* @g_41, i32** %l_43, align 8
  store i32** %l_43, i32*** %l_44, align 8
  %tmp = load i32** @g_40, align 8
  %tmp1 = load i32*** %l_44, align 8
  store i32* %tmp, i32** %tmp1
  %tmp2 = load i32*** %l_44, align 8
  %tmp3 = load i32** %tmp2
  %tmp4 = load i32* %tmp3
  ret i32 %tmp4
}

define i32* @func_2(i32* %p_3, i64 %p_4, i32 %p_5) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_3.addr = alloca i32*, align 8
  %p_4.addr = alloca i64, align 8
  %p_5.addr = alloca i32, align 4
  %l_6 = alloca i32, align 4
  %l_7 = alloca [7 x i8], align 1
  %l_38 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %i6 = alloca i32, align 4
  store i32* %p_3, i32** %p_3.addr, align 8
  store i64 %p_4, i64* %p_4.addr, align 8
  store i32 %p_5, i32* %p_5.addr, align 4
  store i32 0, i32* %l_6, align 4
  store i32* @g_39, i32** %l_38, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i8]* %l_7, i32 0, i64 %idxprom
  store i8 -2, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* %l_6, align 4
  %conv = zext i32 %tmp3 to i64
  %xor = xor i64 %conv, 3118091527
  %tobool = icmp ne i64 %xor, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  store i32* @g_9, i32** %l_8, align 8
  br label %lbl_10

lbl_10:                                           ; preds = %if.then23, %if.then
  store i32 4, i32* %l_6, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc13, %lbl_10
  %tmp8 = load i32* %l_6, align 4
  %cmp9 = icmp uge i32 %tmp8, 0
  br i1 %cmp9, label %for.body11, label %for.end15

for.body11:                                       ; preds = %for.cond7
  %tmp12 = load i32** %l_8, align 8
  store i32* %tmp12, i32** %retval
  br label %return

for.inc13:                                        ; No predecessors!
  %tmp14 = load i32* %l_6, align 4
  %add = add i32 %tmp14, -4
  store i32 %add, i32* %l_6, align 4
  br label %for.cond7

for.end15:                                        ; preds = %for.cond7
  store i64 2, i64* %p_4.addr, align 8
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc77, %for.end15
  %tmp17 = load i64* %p_4.addr, align 8
  %cmp18 = icmp ult i64 %tmp17, 7
  br i1 %cmp18, label %for.body20, label %for.end80

for.body20:                                       ; preds = %for.cond16
  %tmp21 = load i32* %l_6, align 4
  %tobool22 = icmp ne i32 %tmp21, 0
  br i1 %tobool22, label %if.then23, label %if.end

if.then23:                                        ; preds = %for.body20
  br label %lbl_10

if.end:                                           ; preds = %for.body20
  store i32 0, i32* %l_6, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc71, %if.end
  %tmp25 = load i32* %l_6, align 4
  %cmp26 = icmp ne i32 %tmp25, 0
  br i1 %cmp26, label %for.body28, label %for.end76

for.body28:                                       ; preds = %for.cond24
  %tmp29 = load i32** %p_3.addr, align 8
  %tmp30 = load i32* %tmp29
  %cmp31 = icmp sgt i32 %tmp30, -1793153426
  %conv32 = zext i1 %cmp31 to i32
  %tmp33 = load i32* %p_5.addr, align 4
  %cmp34 = icmp uge i32 %conv32, %tmp33
  br i1 %cmp34, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body28
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body28
  %0 = phi i1 [ false, %for.body28 ], [ true, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv36 = trunc i32 %land.ext to i8
  %tmp37 = load i32** %l_38, align 8
  %cmp38 = icmp eq i32* null, %tmp37
  %lnot = xor i1 %cmp38, true
  %lnot.ext = zext i1 %lnot to i32
  %conv40 = trunc i32 %lnot.ext to i8
  %tmp41 = load i64* %p_4.addr, align 8
  %rem = urem i64 %tmp41, 7
  %arrayidx42 = getelementptr inbounds [7 x i8]* %l_7, i32 0, i64 %rem
  %tmp43 = load i8* %arrayidx42, align 1
  %conv44 = zext i8 %tmp43 to i32
  %tobool45 = icmp ne i32 %conv44, 0
  br i1 %tobool45, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %tmp46 = load i32** %l_38, align 8
  %tmp47 = load i32* %tmp46
  %call = call i32 @func_15(i32 %tmp47, i32* @g_39, i8 signext 110)
  %tmp48 = load i32** @g_40, align 8
  %call49 = call i32 @func_15(i32 %call, i32* %tmp48, i8 signext 110)
  %tobool50 = icmp ne i32 %call49, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.end
  %1 = phi i1 [ true, %land.end ], [ %tobool50, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %tmp51 = load i32** %p_3.addr, align 8
  %tmp52 = load i32** %l_8, align 8
  %cmp53 = icmp ne i32* %tmp51, %tmp52
  br i1 %cmp53, label %land.rhs55, label %land.end63

land.rhs55:                                       ; preds = %lor.end
  %tmp56 = load i64* %p_4.addr, align 8
  %add57 = add i64 %tmp56, 4
  %rem58 = urem i64 %add57, 7
  %arrayidx59 = getelementptr inbounds [7 x i8]* %l_7, i32 0, i64 %rem58
  %tmp60 = load i8* %arrayidx59, align 1
  %conv61 = zext i8 %tmp60 to i32
  %tobool62 = icmp ne i32 %conv61, 0
  br label %land.end63

land.end63:                                       ; preds = %land.rhs55, %lor.end
  %2 = phi i1 [ false, %lor.end ], [ %tobool62, %land.rhs55 ]
  %land.ext64 = zext i1 %2 to i32
  %and = and i32 %lor.ext, %land.ext64
  %conv65 = trunc i32 %and to i8
  %call66 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv40, i8 zeroext %conv65)
  %conv67 = zext i8 %call66 to i32
  %call68 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv36, i32 %conv67)
  %conv69 = sext i8 %call68 to i32
  %tmp70 = load i32** @g_40, align 8
  store i32 %conv69, i32* %tmp70
  br label %for.inc71

for.inc71:                                        ; preds = %land.end63
  %tmp72 = load i32* %l_6, align 4
  %conv73 = trunc i32 %tmp72 to i16
  %call74 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv73, i16 zeroext 1)
  %conv75 = zext i16 %call74 to i32
  store i32 %conv75, i32* %l_6, align 4
  br label %for.cond24

for.end76:                                        ; preds = %for.cond24
  br label %for.inc77

for.inc77:                                        ; preds = %for.end76
  %tmp78 = load i64* %p_4.addr, align 8
  %add79 = add i64 %tmp78, 3
  store i64 %add79, i64* %p_4.addr, align 8
  br label %for.cond16

for.end80:                                        ; preds = %for.cond16
  %tmp81 = load i32** %p_3.addr, align 8
  store i32* %tmp81, i32** %retval
  br label %return

if.else:                                          ; preds = %for.end
  %tmp82 = load i32** %p_3.addr, align 8
  %tmp83 = load i32* %tmp82
  %conv84 = sext i32 %tmp83 to i64
  %call85 = call i64 @safe_unary_minus_func_int64_t_s(i64 %conv84)
  %conv86 = trunc i64 %call85 to i32
  %tmp87 = load i32** %p_3.addr, align 8
  store i32 %conv86, i32* %tmp87
  %tmp88 = load i32** %p_3.addr, align 8
  store i32* %tmp88, i32** %retval
  br label %return

return:                                           ; preds = %if.else, %for.end80, %for.body11
  %3 = load i32** %retval
  ret i32* %3
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i8* %left.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i8* %left.addr, align 1
  %conv14 = sext i8 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i8
  ret i8 %conv3
}

define i32 @func_15(i32 %p_16, i32* %p_17, i8 signext %p_18) nounwind uwtable {
entry:
  %p_16.addr = alloca i32, align 4
  %p_17.addr = alloca i32*, align 8
  %p_18.addr = alloca i8, align 1
  %l_33 = alloca i64, align 8
  store i32 %p_16, i32* %p_16.addr, align 4
  store i32* %p_17, i32** %p_17.addr, align 8
  store i8 %p_18, i8* %p_18.addr, align 1
  store i64 1, i64* %l_33, align 8
  %tmp = load i32** %p_17.addr, align 8
  %tmp1 = load i32* %tmp
  %tmp2 = load i32** %p_17.addr, align 8
  store i32 %tmp1, i32* %tmp2
  %call = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 17867, i16 zeroext -1)
  %conv = zext i16 %call to i32
  %tmp3 = load i32** %p_17.addr, align 8
  %tmp4 = load i32* %tmp3
  %call5 = call i32 @safe_mod_func_uint32_t_u_u(i32 0, i32 %tmp4)
  %call6 = call i32 @safe_sub_func_uint32_t_u_u(i32 %conv, i32 %call5)
  %tmp7 = load i32** %p_17.addr, align 8
  %tmp8 = load i32* %tmp7
  %conv9 = trunc i32 %tmp8 to i16
  %call10 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv9, i32 0)
  %conv11 = zext i16 %call10 to i32
  %tmp12 = load i64* %l_33, align 8
  %conv13 = trunc i64 %tmp12 to i16
  %call14 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv13, i16 signext 1)
  %call15 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %call14, i16 signext -22930)
  %conv16 = trunc i16 %call15 to i8
  %call17 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv16, i8 zeroext -36)
  %conv18 = zext i8 %call17 to i32
  %xor = xor i32 %conv11, %conv18
  %or = or i32 %call6, %xor
  %tmp19 = load i32** %p_17.addr, align 8
  store i32 %or, i32* %tmp19
  ret i32 -1793153426
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define internal i64 @safe_unary_minus_func_int64_t_s(i64 %si) nounwind uwtable {
entry:
  %si.addr = alloca i64, align 8
  store i64 %si, i64* %si.addr, align 8
  %tmp = load i64* %si.addr, align 8
  %cmp = icmp eq i64 %tmp, -9223372036854775808
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %si.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %si.addr, align 8
  %sub = sub nsw i64 0, %tmp2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %sub, %cond.false ]
  ret i64 %cond
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
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

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %rem = urem i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 -1793153426)
  %tmp = load i32* @g_39, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp)
  %tmp3 = load i32* @g_41, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp3)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
