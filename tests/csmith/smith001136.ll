; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001136.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@g_15 = global i32 -1697824616, align 4
@g_14 = global i32* @g_15, align 8
@g_16 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_20 = alloca i32, align 4
  %l_11 = alloca i32, align 4
  %l_17 = alloca i32*, align 8
  %l_18 = alloca i32*, align 8
  store i32 2058918877, i32* %l_20, align 4
  store i32 17, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 4, i32* %l_11, align 4
  store i32* null, i32** %l_17, align 8
  store i32* @g_15, i32** %l_18, align 8
  %tmp4 = load i32* @g_2, align 4
  %conv = trunc i32 %tmp4 to i16
  %tmp5 = load i32* @g_2, align 4
  %tmp6 = load i32* @g_2, align 4
  %cmp7 = icmp sle i32 %tmp5, %tmp6
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %tmp9 = load i32* @g_2, align 4
  %conv10 = trunc i32 %tmp9 to i16
  %tmp11 = load i32* @g_2, align 4
  %conv12 = trunc i32 %tmp11 to i16
  %call = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv10, i16 zeroext %conv12)
  %conv13 = zext i16 %call to i32
  %tobool = icmp ne i32 %conv13, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %0 = phi i1 [ true, %for.body ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv14 = sext i32 %lor.ext to i64
  %cmp15 = icmp sle i64 %conv14, 2404871249
  %conv16 = zext i1 %cmp15 to i32
  %tmp17 = load i32* %l_11, align 4
  %and = and i32 %conv16, %tmp17
  %tmp18 = load i32* @g_2, align 4
  %conv19 = trunc i32 %tmp18 to i16
  %call20 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv19, i32 1)
  %conv21 = sext i16 %call20 to i32
  %call22 = call i32 @safe_add_func_uint32_t_u_u(i32 %and, i32 %conv21)
  %conv23 = trunc i32 %call22 to i16
  %call24 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv, i16 signext %conv23)
  %conv25 = sext i16 %call24 to i32
  %tmp26 = volatile load i32** @g_14, align 8
  %tmp27 = load i32* %tmp26
  %or = or i32 %tmp27, %conv25
  store i32 %or, i32* %tmp26
  %tmp28 = load i32* @g_2, align 4
  %tobool29 = icmp ne i32 %tmp28, 0
  br i1 %tobool29, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  br label %lbl_19

if.end:                                           ; preds = %lor.end
  br label %lbl_19

lbl_19:                                           ; preds = %if.end, %if.then
  %tmp30 = load i32** %l_18, align 8
  %tmp31 = load i32* %tmp30
  store i32 %tmp31, i32* %tmp30
  %tmp32 = load i32** %l_18, align 8
  %tmp33 = load i32* %tmp32
  %conv34 = trunc i32 %tmp33 to i8
  store i8 %conv34, i8* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp35 = load i32* @g_2, align 4
  %call36 = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp35, i32 1)
  store i32 %call36, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp37 = load i32* %l_20, align 4
  %conv38 = trunc i32 %tmp37 to i8
  store i8 %conv38, i8* %retval
  br label %return

return:                                           ; preds = %for.end, %lbl_19
  %1 = load i8* %retval
  ret i8 %1
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

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %tmp1 = load i32* %si2.addr, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %si1.addr, align 4
  %tmp3 = load i32* %si1.addr, align 4
  %tmp4 = load i32* %si2.addr, align 4
  %xor5 = xor i32 %tmp3, %tmp4
  %and = and i32 %xor5, -2147483648
  %xor6 = xor i32 %tmp2, %and
  %tmp7 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor6, %tmp7
  %tmp8 = load i32* %si2.addr, align 4
  %xor9 = xor i32 %sub, %tmp8
  %and10 = and i32 %xor, %xor9
  %cmp = icmp slt i32 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i32* %si1.addr, align 4
  %tmp13 = load i32* %si2.addr, align 4
  %sub14 = sub nsw i32 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
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
  %call = call signext i8 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_15, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
