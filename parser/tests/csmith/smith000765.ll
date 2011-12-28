; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000765.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1, align 4
@g_13 = global i8 118, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32, align 4
  %l_3 = alloca [8 x i32*], align 16
  %i = alloca i32, align 4
  store i32 -6, i32* %l_2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32*]* %l_3, i32 0, i64 %idxprom
  store i32* @g_4, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* %l_2, align 4
  store i32 %tmp3, i32* @g_4, align 4
  %tmp4 = load i32* @g_4, align 4
  %conv = trunc i32 %tmp4 to i8
  %tmp5 = load i32* @g_4, align 4
  %call = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv, i32 %tmp5)
  %conv6 = zext i8 %call to i32
  %tobool = icmp ne i32 %conv6, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp7 = load i32* @g_4, align 4
  %tmp8 = load i32* @g_4, align 4
  %and = and i32 %tmp7, %tmp8
  %conv9 = trunc i32 %and to i16
  %tmp10 = load i32* @g_4, align 4
  %conv11 = trunc i32 %tmp10 to i16
  %call12 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv9, i16 signext %conv11)
  %tmp13 = load i32* @g_4, align 4
  %conv14 = trunc i32 %tmp13 to i16
  %call15 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %call12, i16 zeroext %conv14)
  %conv16 = zext i16 %call15 to i32
  %tmp17 = load i32* @g_4, align 4
  %and18 = and i32 %conv16, %tmp17
  %conv19 = trunc i32 %and18 to i16
  %tmp20 = load i32* @g_4, align 4
  %conv21 = trunc i32 %tmp20 to i16
  %call22 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv19, i16 zeroext %conv21)
  %conv23 = zext i16 %call22 to i32
  %tobool24 = icmp ne i32 %conv23, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool24, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp25 = load i8* @g_13, align 1
  %conv26 = zext i8 %tmp25 to i32
  %and27 = and i32 %conv26, %lor.ext
  %conv28 = trunc i32 %and27 to i8
  store i8 %conv28, i8* @g_13, align 1
  %tmp29 = load i32* @g_4, align 4
  ret i32 %tmp29
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i8* %left.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i8* @g_13, align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
