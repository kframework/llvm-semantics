; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001782.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 20, align 1
@g_12 = global [2 x i32] [i32 1335413498, i32 1335413498], align 4
@g_14 = global i32 -1942426574, align 4
@g_19 = global i32 -1932179853, align 4
@g_18 = global i32* @g_19, align 8
@g_17 = constant i32** @g_18, align 8
@g_20 = global i32** @g_18, align 8
@g_28 = global i16 4766, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_12[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_12[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_9 = alloca i64, align 8
  %l_29 = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %i29 = alloca i32, align 4
  %l_13 = alloca i32*, align 8
  store i64 1, i64* %l_9, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* %l_29, i32 0, i64 %idxprom
  store i32 2133371286, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i8* @g_4, align 1
  %conv = zext i8 %tmp3 to i32
  %tmp4 = load i64* %l_9, align 8
  %conv5 = trunc i64 %tmp4 to i8
  %tmp6 = load i8* @g_4, align 1
  %conv7 = zext i8 %tmp6 to i32
  %tobool = icmp ne i32 %conv7, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp8 = load i8* @g_4, align 1
  %conv9 = zext i8 %tmp8 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %0 = phi i1 [ true, %for.end ], [ %tobool10, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %call = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %conv5, i32 %lor.ext)
  %tmp11 = load i8* @g_4, align 1
  %conv12 = zext i8 %tmp11 to i64
  %tmp13 = load i64* %l_9, align 8
  %or = or i64 %conv12, %tmp13
  %conv14 = trunc i64 %or to i8
  %call15 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %call, i8 signext %conv14)
  %conv16 = sext i8 %call15 to i32
  %cmp17 = icmp eq i32 %conv, %conv16
  %conv18 = zext i1 %cmp17 to i32
  %conv19 = sext i32 %conv18 to i64
  %tmp20 = load i8* @g_4, align 1
  %tmp21 = load i8* @g_4, align 1
  %conv22 = zext i8 %tmp21 to i32
  %call23 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %tmp20, i32 %conv22)
  %conv24 = sext i8 %call23 to i64
  %call25 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv19, i64 %conv24)
  %cmp26 = icmp ne i64 %call25, 4
  br i1 %cmp26, label %if.then, label %if.else

if.then:                                          ; preds = %lor.end
  %tmp30 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  %conv31 = sext i32 %tmp30 to i64
  %xor = xor i64 %conv31, 2200975219
  %conv32 = trunc i64 %xor to i32
  store i32 %conv32, i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  store i64 0, i64* %l_9, align 8
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc46, %if.then
  %tmp34 = load i64* %l_9, align 8
  %cmp35 = icmp slt i64 %tmp34, 2
  br i1 %cmp35, label %for.body37, label %for.end48

for.body37:                                       ; preds = %for.cond33
  store i32* @g_14, i32** %l_13, align 8
  %tmp39 = load i32** %l_13, align 8
  %tmp40 = load i32* %tmp39
  %conv41 = sext i32 %tmp40 to i64
  %and = and i64 %conv41, 1772236215
  %conv42 = trunc i64 %and to i32
  store i32 %conv42, i32* %tmp39
  %tmp43 = load i64* %l_9, align 8
  %rem = urem i64 %tmp43, 2
  %arrayidx44 = getelementptr inbounds [2 x i32]* @g_12, i32 0, i64 %rem
  %tmp45 = load i32* %arrayidx44, align 4
  store i32 %tmp45, i32* %retval
  br label %return

for.inc46:                                        ; No predecessors!
  %tmp47 = load i64* %l_9, align 8
  %add = add nsw i64 %tmp47, 1
  store i64 %add, i64* %l_9, align 8
  br label %for.cond33

for.end48:                                        ; preds = %for.cond33
  store i8 -6, i8* @g_4, align 1
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc59, %for.end48
  %tmp50 = load i8* @g_4, align 1
  %conv51 = zext i8 %tmp50 to i32
  %cmp52 = icmp eq i32 %conv51, 0
  br i1 %cmp52, label %for.body54, label %for.end64

for.body54:                                       ; preds = %for.cond49
  %tmp55 = load i32*** @g_17, align 8
  store i32** %tmp55, i32*** @g_20, align 8
  %tmp56 = load i32** @g_18, align 8
  %tmp57 = volatile load i32* %tmp56
  %tmp58 = load i32** @g_18, align 8
  volatile store i32 %tmp57, i32* %tmp58
  br label %for.inc59

for.inc59:                                        ; preds = %for.body54
  %tmp60 = load i8* @g_4, align 1
  %conv61 = zext i8 %tmp60 to i32
  %call62 = call i32 @safe_add_func_uint32_t_u_u(i32 %conv61, i32 2)
  %conv63 = trunc i32 %call62 to i8
  store i8 %conv63, i8* @g_4, align 1
  br label %for.cond49

for.end64:                                        ; preds = %for.cond49
  br label %if.end

if.else:                                          ; preds = %lor.end
  %tmp65 = load i32*** @g_20, align 8
  %tmp66 = volatile load i32** %tmp65
  %tmp67 = volatile load i32* %tmp66
  %tobool68 = icmp ne i32 %tmp67, 0
  br i1 %tobool68, label %lor.end107, label %lor.rhs69

lor.rhs69:                                        ; preds = %if.else
  %tmp70 = load i64* %l_9, align 8
  %call71 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext -7, i32 9)
  %conv72 = sext i8 %call71 to i32
  %tmp73 = load i32*** @g_17, align 8
  %tmp74 = volatile load i32** %tmp73
  %tmp75 = volatile load i32* %tmp74
  %conv76 = trunc i32 %tmp75 to i16
  %tmp77 = load i32* @g_14, align 4
  %conv78 = trunc i32 %tmp77 to i16
  %call79 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv76, i16 zeroext %conv78)
  %conv80 = zext i16 %call79 to i32
  %tobool81 = icmp ne i32 %conv80, 0
  br i1 %tobool81, label %lor.end86, label %lor.rhs82

lor.rhs82:                                        ; preds = %lor.rhs69
  %tmp83 = load i32** @g_18, align 8
  %tmp84 = volatile load i32* %tmp83
  %tobool85 = icmp ne i32 %tmp84, 0
  br label %lor.end86

lor.end86:                                        ; preds = %lor.rhs82, %lor.rhs69
  %1 = phi i1 [ true, %lor.rhs69 ], [ %tobool85, %lor.rhs82 ]
  %lor.ext87 = zext i1 %1 to i32
  %cmp88 = icmp sle i32 %conv72, %lor.ext87
  br i1 %cmp88, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end86
  %tmp90 = load i64* %l_9, align 8
  %tmp91 = load i64* %l_9, align 8
  %tmp92 = load i32** @g_18, align 8
  %tmp93 = volatile load i32* %tmp92
  %conv94 = sext i32 %tmp93 to i64
  %cmp95 = icmp eq i64 %tmp91, %conv94
  %conv96 = zext i1 %cmp95 to i32
  %conv97 = sext i32 %conv96 to i64
  %cmp98 = icmp sgt i64 %tmp90, %conv97
  %conv99 = zext i1 %cmp98 to i32
  %conv100 = trunc i32 %conv99 to i16
  %call101 = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %conv100)
  %conv102 = sext i16 %call101 to i32
  %tobool103 = icmp ne i32 %conv102, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end86
  %2 = phi i1 [ false, %lor.end86 ], [ %tobool103, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  %conv104 = sext i32 %land.ext to i64
  %call105 = call i64 @safe_sub_func_uint64_t_u_u(i64 %tmp70, i64 %conv104)
  %tobool106 = icmp ne i64 %call105, 0
  br label %lor.end107

lor.end107:                                       ; preds = %land.end, %if.else
  %3 = phi i1 [ true, %if.else ], [ %tobool106, %land.end ]
  %lor.ext108 = zext i1 %3 to i32
  %tmp109 = load i16* @g_28, align 2
  %conv110 = sext i16 %tmp109 to i32
  %xor111 = xor i32 %conv110, %lor.ext108
  %conv112 = trunc i32 %xor111 to i16
  store i16 %conv112, i16* @g_28, align 2
  %tmp113 = load i32*** @g_20, align 8
  volatile store i32* null, i32** %tmp113
  br label %if.end

if.end:                                           ; preds = %lor.end107, %for.end64
  %arrayidx114 = getelementptr inbounds [2 x i32]* %l_29, i32 0, i64 1
  %tmp115 = load i32* %arrayidx114, align 4
  store i32 %tmp115, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %for.body37
  %4 = load i32* %retval
  ret i32 %4
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

define internal signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %si) nounwind uwtable {
entry:
  %si.addr = alloca i16, align 2
  store i16 %si, i16* %si.addr, align 2
  %tmp = load i16* %si.addr, align 2
  %conv = sext i16 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
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
  %tmp = load i8* @g_4, align 1
  %conv = zext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i32 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* @g_14, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* @g_19, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i16* @g_28, align 2
  %conv13 = sext i16 %tmp12 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0), i32 %conv13)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
