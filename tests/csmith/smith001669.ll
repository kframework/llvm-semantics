; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001669.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] [i32 1], align 4
@g_15 = global i32 1799092786, align 4
@g_19 = global i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i32 0), align 8
@g_18 = global i32** @g_19, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32*, align 8
  %l_14 = alloca i32*, align 8
  store i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), i32** %l_2, align 8
  store i32* @g_15, i32** %l_14, align 8
  %tmp = load i32** %l_2, align 8
  store i32 194431532, i32* %tmp
  %tmp1 = load i32** %l_2, align 8
  %cmp = icmp eq i32* null, %tmp1
  %conv = zext i1 %cmp to i32
  %conv2 = trunc i32 %conv to i8
  %tmp3 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %tmp4 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %xor = xor i32 %tmp3, %tmp4
  %conv5 = trunc i32 %xor to i16
  %tmp6 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %conv7 = trunc i32 %tmp6 to i8
  %tmp8 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %conv9 = trunc i32 %tmp8 to i8
  %call = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv7, i8 signext %conv9)
  %conv10 = sext i8 %call to i32
  %call11 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %conv5, i32 %conv10)
  %conv12 = trunc i16 %call11 to i8
  %call13 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %conv2, i8 signext %conv12)
  %conv14 = sext i8 %call13 to i32
  %tobool = icmp ne i32 %conv14, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp15 = load i32** %l_2, align 8
  %tmp16 = load i32* %tmp15
  %tobool17 = icmp ne i32 %tmp16, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool17, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv18 = trunc i32 %lor.ext to i8
  %tmp19 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %conv20 = trunc i32 %tmp19 to i8
  %tmp21 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %conv22 = trunc i32 %tmp21 to i8
  %call23 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv20, i8 zeroext %conv22)
  %conv24 = zext i8 %call23 to i32
  %call25 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv18, i32 %conv24)
  %conv26 = sext i8 %call25 to i64
  %xor27 = xor i64 %conv26, -1
  %tmp28 = load i32** %l_14, align 8
  %tmp29 = load i32* %tmp28
  %conv30 = sext i32 %tmp29 to i64
  %or = or i64 %conv30, %xor27
  %conv31 = trunc i64 %or to i32
  store i32 %conv31, i32* %tmp28
  %tmp32 = load i32** %l_2, align 8
  %tmp33 = load i32* %tmp32
  %conv34 = sext i32 %tmp33 to i64
  %xor35 = xor i64 %conv34, 0
  %conv36 = trunc i64 %xor35 to i32
  store i32 %conv36, i32* %tmp32
  store i32 8, i32* @g_15, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lor.end
  %tmp37 = load i32* @g_15, align 4
  %cmp38 = icmp sle i32 %tmp37, 1
  br i1 %cmp38, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp40 = load i32** %l_2, align 8
  %tmp41 = volatile load i32*** @g_18, align 8
  store i32* %tmp40, i32** %tmp41
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp42 = load i32* @g_15, align 4
  %conv43 = trunc i32 %tmp42 to i16
  %call44 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv43, i16 signext 4)
  %conv45 = sext i16 %call44 to i32
  store i32 %conv45, i32* @g_15, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp46 = load i32* @g_15, align 4
  %conv47 = sext i32 %tmp46 to i64
  ret i64 %conv47
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

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp2, label %cond.true, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp4 to i32
  %tmp5 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp5
  %cmp6 = icmp sgt i32 %conv, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %tmp8 = load i16* %left.addr, align 2
  %conv9 = zext i16 %tmp8 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false3
  %tmp10 = load i16* %left.addr, align 2
  %conv11 = zext i16 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shl = shl i32 %conv11, %tmp12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i16
  ret i16 %conv13
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
  %call = call i64 @func_1()
  %tmp = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i32 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_15, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
