; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001445.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_12 = global i32* @g_2, align 8
@func_1.l_10 = internal constant [8 x [7 x i8]] [[7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01", [7 x i8] c"\01\01\01\01\01\01\01"], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_9 = alloca i16, align 2
  %l_11 = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_15 = alloca i32*, align 8
  store i16 29887, i16* %l_9, align 2
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc27, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, -30
  br i1 %cmp, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %tmp5 = load i32* %i, align 4
  %cmp6 = icmp slt i32 %tmp5, 10
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %tmp8 = load i32* %i, align 4
  %idxprom = sext i32 %tmp8 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* %l_11, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %tmp9 = load i32* %i, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %tmp10 = load i16* %l_9, align 2
  %tmp11 = load i8* getelementptr inbounds ([8 x [7 x i8]]* @func_1.l_10, i32 0, i64 0, i64 2), align 1
  %conv = zext i8 %tmp11 to i16
  %call = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %tmp10, i16 zeroext %conv)
  %conv12 = trunc i16 %call to i8
  %call13 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %conv12, i32 1407552508)
  %conv14 = sext i8 %call13 to i32
  %arrayidx15 = getelementptr inbounds [10 x i32]* %l_11, i32 0, i64 7
  %tmp16 = load i32* %arrayidx15, align 4
  %tmp17 = load i32* @g_2, align 4
  %cmp18 = icmp ugt i32 %tmp16, %tmp17
  %conv19 = zext i1 %cmp18 to i32
  %cmp20 = icmp sge i32 %conv14, %conv19
  %conv21 = zext i1 %cmp20 to i32
  %tmp22 = load i16* %l_9, align 2
  %conv23 = sext i16 %tmp22 to i32
  %cmp24 = icmp sgt i32 %conv21, %conv23
  %conv25 = zext i1 %cmp24 to i32
  %tmp26 = volatile load i32** @g_12, align 8
  store i32 %conv25, i32* %tmp26
  br label %for.inc27

for.inc27:                                        ; preds = %for.end
  %tmp28 = load i32* @g_2, align 4
  %conv29 = sext i32 %tmp28 to i64
  %call30 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv29, i64 2)
  %conv31 = trunc i64 %call30 to i32
  store i32 %conv31, i32* @g_2, align 4
  br label %for.cond

for.end32:                                        ; preds = %for.cond
  store i32 3, i32* @g_2, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc54, %for.end32
  %tmp34 = load i32* @g_2, align 4
  %cmp35 = icmp sgt i32 %tmp34, 20
  br i1 %cmp35, label %for.body37, label %for.end59

for.body37:                                       ; preds = %for.cond33
  store i32* @g_2, i32** %l_15, align 8
  %tmp39 = load i32** %l_15, align 8
  store i32 4, i32* %tmp39
  %call40 = call i32 @func_18(i8 zeroext -5)
  %conv41 = sext i32 %call40 to i64
  %tmp42 = volatile load i32** @g_12, align 8
  %tmp43 = load i32* %tmp42
  %conv44 = sext i32 %tmp43 to i64
  %call45 = call i64 @safe_div_func_uint64_t_u_u(i64 %conv41, i64 %conv44)
  %tmp46 = load i32** %l_15, align 8
  %tmp47 = load i32* %tmp46
  %conv48 = trunc i32 %tmp47 to i8
  %call49 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv48, i32 -995590194)
  %conv50 = sext i8 %call49 to i64
  %cmp51 = icmp uge i64 %call45, %conv50
  %conv52 = zext i1 %cmp51 to i32
  %tmp53 = load i32** %l_15, align 8
  store i32 %conv52, i32* %tmp53
  br label %for.inc54

for.inc54:                                        ; preds = %for.body37
  %tmp55 = load i32* @g_2, align 4
  %conv56 = sext i32 %tmp55 to i64
  %call57 = call i64 @safe_sub_func_int64_t_s_s(i64 %conv56, i64 1)
  %conv58 = trunc i64 %call57 to i32
  store i32 %conv58, i32* @g_2, align 4
  br label %for.cond33

for.end59:                                        ; preds = %for.cond33
  %tmp60 = load i32* @g_2, align 4
  %conv61 = sext i32 %tmp60 to i64
  ret i64 %conv61
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

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %ui1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %ui1.addr, align 8
  %tmp3 = load i64* %ui2.addr, align 8
  %div = udiv i64 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
}

define i32 @func_18(i8 zeroext %p_19) nounwind uwtable {
entry:
  %p_19.addr = alloca i8, align 1
  %l_20 = alloca i8, align 1
  store i8 %p_19, i8* %p_19.addr, align 1
  store i8 -120, i8* %l_20, align 1
  %tmp = load i8* %l_20, align 1
  %conv = sext i8 %tmp to i32
  ret i32 %conv
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i8* %left.addr, align 1
  %conv10 = sext i8 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  ret i8 %conv14
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %tmp1 = load i64* %si2.addr, align 8
  %xor = xor i64 %tmp, %tmp1
  %tmp2 = load i64* %si1.addr, align 8
  %tmp3 = load i64* %si1.addr, align 8
  %tmp4 = load i64* %si2.addr, align 8
  %xor5 = xor i64 %tmp3, %tmp4
  %and = and i64 %xor5, -9223372036854775808
  %xor6 = xor i64 %tmp2, %and
  %tmp7 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 %xor6, %tmp7
  %tmp8 = load i64* %si2.addr, align 8
  %xor9 = xor i64 %sub, %tmp8
  %and10 = and i64 %xor, %xor9
  %cmp = icmp slt i64 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i64* %si1.addr, align 8
  %tmp13 = load i64* %si2.addr, align 8
  %sub14 = sub nsw i64 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i64 %cond
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
