; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001403.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1965365047, align 4
@g_18 = global i32 0, align 4
@g_19 = global i32* null, align 8
@g_21 = global i32 -1137368052, align 4
@g_23 = global i32 0, align 4
@g_22 = global i32* @g_23, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_21 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_23 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i64, align 8
  store i64 -4218924747683735383, i64* %l_5, align 8
  %tmp = load i32* @g_4, align 4
  %conv = trunc i32 %tmp to i8
  %tmp1 = load i32* @g_4, align 4
  %conv2 = trunc i32 %tmp1 to i8
  %call = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv, i8 signext %conv2)
  %conv3 = sext i8 %call to i32
  %tmp4 = load i32* @g_4, align 4
  %tobool = icmp ne i32 %tmp4, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp5 = load i64* %l_5, align 8
  %neg = xor i64 %tmp5, -1
  %tobool6 = icmp ne i64 %neg, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool6, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %cmp = icmp slt i32 %conv3, %lor.ext
  br i1 %cmp, label %lor.end15, label %lor.rhs8

lor.rhs8:                                         ; preds = %lor.end
  %tmp9 = load i32* @g_4, align 4
  %tmp10 = load i32* @g_21, align 4
  %conv11 = trunc i32 %tmp10 to i16
  %call12 = call i32 @func_8(i16 signext %conv11)
  %call13 = call i32 @safe_div_func_int32_t_s_s(i32 %tmp9, i32 %call12)
  %tobool14 = icmp ne i32 %call13, 0
  br label %lor.end15

lor.end15:                                        ; preds = %lor.rhs8, %lor.end
  %1 = phi i1 [ true, %lor.end ], [ %tobool14, %lor.rhs8 ]
  %lor.ext16 = zext i1 %1 to i32
  %conv17 = sext i32 %lor.ext16 to i64
  %tmp18 = load i64* %l_5, align 8
  %cmp19 = icmp sgt i64 %conv17, %tmp18
  %conv20 = zext i1 %cmp19 to i32
  %tmp21 = volatile load i32** @g_22, align 8
  %tmp22 = load i32* %tmp21
  %or = or i32 %tmp22, %conv20
  store i32 %or, i32* %tmp21
  %tmp23 = load i32* @g_21, align 4
  %conv24 = trunc i32 %tmp23 to i8
  ret i8 %conv24
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

define internal i32 @safe_div_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %si1.addr, align 4
  %cmp2 = icmp eq i32 %tmp1, -2147483648
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp3 = load i32* %si2.addr, align 4
  %cmp4 = icmp eq i32 %tmp3, -1
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp5 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp6 = load i32* %si1.addr, align 4
  %tmp7 = load i32* %si2.addr, align 4
  %div = sdiv i32 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp5, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

define i32 @func_8(i16 signext %p_9) nounwind uwtable {
entry:
  %p_9.addr = alloca i16, align 2
  %l_20 = alloca i32*, align 8
  store i16 %p_9, i16* %p_9.addr, align 2
  store i32* @g_21, i32** %l_20, align 8
  %tmp = load i16* %p_9.addr, align 2
  %tmp1 = load i32* @g_4, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp2 = load i32* @g_4, align 4
  %conv = trunc i32 %tmp2 to i8
  %call = call i32 @func_16(i8 zeroext %conv)
  %tobool3 = icmp ne i32 %call, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool3, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv4 = trunc i32 %lor.ext to i8
  %call5 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %conv4, i32 -972591142)
  %conv6 = sext i8 %call5 to i16
  %call7 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %tmp, i16 signext %conv6)
  %call8 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %call7, i32 8)
  %conv9 = zext i16 %call8 to i32
  %tmp10 = load i32** %l_20, align 8
  %tmp11 = load i32* %tmp10
  %or = or i32 %tmp11, %conv9
  store i32 %or, i32* %tmp10
  %tmp12 = load i32** %l_20, align 8
  %tmp13 = load i32* %tmp12
  ret i32 %tmp13
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i16* %left.addr, align 2
  %conv = zext i16 %tmp1 to i32
  %tmp2 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %tmp2
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i16* %left.addr, align 2
  %conv6 = zext i16 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i16* %left.addr, align 2
  %conv8 = zext i16 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shl = shl i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
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

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp7, label %cond.true, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %tmp10 = load i8* %left.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp12
  %cmp13 = icmp sgt i32 %conv11, %shr
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp15 = load i8* %left.addr, align 1
  %conv16 = sext i8 %tmp15 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false9
  %tmp17 = load i8* %left.addr, align 1
  %conv18 = sext i8 %tmp17 to i32
  %tmp19 = load i32* %right.addr, align 4
  %shl = shl i32 %conv18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv16, %cond.true ], [ %shl, %cond.false ]
  %conv20 = trunc i32 %cond to i8
  ret i8 %conv20
}

define i32 @func_16(i8 zeroext %p_17) nounwind uwtable {
entry:
  %p_17.addr = alloca i8, align 1
  store i8 %p_17, i8* %p_17.addr, align 1
  %tmp = load i32* @g_18, align 4
  ret i32 %tmp
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_18, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_21, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* @g_23, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
