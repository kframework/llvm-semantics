; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000213.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_3 = global i32 4, align 4
@g_24 = global i32 1213840250, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_24 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_6 = alloca i32, align 4
  %l_23 = alloca i32*, align 8
  %l_30 = alloca i32*, align 8
  %l_29 = alloca i32**, align 8
  store i32 238387412, i32* %l_6, align 4
  store i32* @g_24, i32** %l_23, align 8
  %tmp = volatile load i32* @g_2, align 4
  %tmp1 = load i32* @g_3, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %l_6, align 4
  %conv = trunc i32 %tmp2 to i16
  %call = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %conv, i32 -1227868340)
  %conv3 = zext i16 %call to i32
  %cmp = icmp ult i32 %xor, %conv3
  %conv4 = zext i1 %cmp to i32
  %tmp5 = load i32* @g_3, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp6 = load i32* @g_3, align 4
  %tobool7 = icmp ne i32 %tmp6, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool7, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %xor8 = xor i32 %conv4, %lor.ext
  %tmp9 = load i32* %l_6, align 4
  %tmp10 = load i32* %l_6, align 4
  %conv11 = trunc i32 %tmp10 to i16
  %tmp12 = load i32* %l_6, align 4
  %conv13 = trunc i32 %tmp12 to i16
  %call14 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv11, i16 zeroext %conv13)
  %conv15 = zext i16 %call14 to i32
  %tmp16 = load i32* @g_3, align 4
  %conv17 = trunc i32 %tmp16 to i16
  %tmp18 = load i32* %l_6, align 4
  %conv19 = trunc i32 %tmp18 to i16
  %call20 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv17, i16 zeroext %conv19)
  %conv21 = zext i16 %call20 to i32
  %cmp22 = icmp ne i32 %conv15, %conv21
  %conv23 = zext i1 %cmp22 to i32
  %call24 = call i32 @safe_div_func_int32_t_s_s(i32 %tmp9, i32 %conv23)
  %cmp25 = icmp sge i32 %xor8, %call24
  %conv26 = zext i1 %cmp25 to i32
  %tmp27 = load i32* @g_3, align 4
  %or = or i32 %conv26, %tmp27
  %tmp28 = load i32* @g_3, align 4
  %conv29 = trunc i32 %tmp28 to i16
  %tmp30 = load i32* @g_3, align 4
  %tmp31 = load i32* @g_3, align 4
  %conv32 = zext i32 %tmp31 to i64
  %tmp33 = load i32* %l_6, align 4
  %tmp34 = load i32* %l_6, align 4
  %call35 = call i32 @func_15(i32 %tmp30, i64 %conv32, i32 %tmp33, i32 %tmp34)
  %conv36 = sext i32 %call35 to i64
  %tmp37 = load i32* %l_6, align 4
  %conv38 = sext i32 %tmp37 to i64
  %tmp39 = load i32* %l_6, align 4
  %tmp40 = load i32* %l_6, align 4
  %or41 = or i32 %tmp39, %tmp40
  %conv42 = sext i32 %or41 to i64
  %call43 = call i64 @safe_mod_func_int64_t_s_s(i64 %conv38, i64 %conv42)
  %cmp44 = icmp slt i64 %conv36, %call43
  %conv45 = zext i1 %cmp44 to i32
  %conv46 = trunc i32 %conv45 to i16
  %call47 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv29, i16 signext %conv46)
  %conv48 = sext i16 %call47 to i32
  %cmp49 = icmp ule i32 %or, %conv48
  %conv50 = zext i1 %cmp49 to i32
  %tmp51 = load i32** %l_23, align 8
  %tmp52 = load i32* %tmp51
  %or53 = or i32 %tmp52, %conv50
  store i32 %or53, i32* %tmp51
  store i32 0, i32* @g_3, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc69, %lor.end
  %tmp54 = load i32* @g_3, align 4
  %cmp55 = icmp ugt i32 %tmp54, -18
  br i1 %cmp55, label %for.body, label %for.end72

for.body:                                         ; preds = %for.cond
  store i32 3, i32* @g_3, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc, %for.body
  %tmp58 = load i32* @g_3, align 4
  %cmp59 = icmp ult i32 %tmp58, 0
  br i1 %cmp59, label %for.body61, label %for.end

for.body61:                                       ; preds = %for.cond57
  store i32* @g_24, i32** %l_30, align 8
  store i32** %l_30, i32*** %l_29, align 8
  %tmp64 = load i32*** %l_29, align 8
  store i32* null, i32** %tmp64
  br label %for.inc

for.inc:                                          ; preds = %for.body61
  %tmp65 = load i32* @g_3, align 4
  %conv66 = zext i32 %tmp65 to i64
  %call67 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv66, i64 1)
  %conv68 = trunc i64 %call67 to i32
  store i32 %conv68, i32* @g_3, align 4
  br label %for.cond57

for.end:                                          ; preds = %for.cond57
  br label %for.inc69

for.inc69:                                        ; preds = %for.end
  %tmp70 = load i32* @g_3, align 4
  %call71 = call i32 @safe_add_func_int32_t_s_s(i32 %tmp70, i32 1)
  store i32 %call71, i32* @g_3, align 4
  br label %for.cond

for.end72:                                        ; preds = %for.cond
  %tmp73 = volatile load i32* @g_2, align 4
  %conv74 = trunc i32 %tmp73 to i16
  ret i16 %conv74
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

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
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

define i32 @func_15(i32 %p_16, i64 %p_17, i32 %p_18, i32 %p_19) nounwind uwtable {
entry:
  %p_16.addr = alloca i32, align 4
  %p_17.addr = alloca i64, align 8
  %p_18.addr = alloca i32, align 4
  %p_19.addr = alloca i32, align 4
  %l_20 = alloca i32, align 4
  store i32 %p_16, i32* %p_16.addr, align 4
  store i64 %p_17, i64* %p_17.addr, align 8
  store i32 %p_18, i32* %p_18.addr, align 4
  store i32 %p_19, i32* %p_19.addr, align 4
  store i32 1, i32* %l_20, align 4
  %tmp = load i32* %l_20, align 4
  ret i32 %tmp
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_3, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_24, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
