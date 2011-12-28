; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000427.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global [7 x i32] zeroinitializer, align 16
@g_28 = global i32 -851710698, align 4
@.str = private unnamed_addr constant [23 x i8] c"checksum g_10[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_10[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_10[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_10[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_10[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_10[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_10[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_26 = alloca i64, align 8
  %l_27 = alloca i32*, align 8
  store i64 3800383344303724903, i64* %l_26, align 8
  store i32* @g_28, i32** %l_27, align 8
  %tmp = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %conv = trunc i32 %tmp to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext 0, i8 signext %conv)
  %tmp1 = load i64* %l_26, align 8
  %conv2 = trunc i64 %tmp1 to i8
  %tmp3 = load i64* %l_26, align 8
  %tmp4 = load i64* %l_26, align 8
  %cmp = icmp ule i64 %tmp3, %tmp4
  %conv5 = zext i1 %cmp to i32
  %conv6 = trunc i32 %conv5 to i8
  %call7 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %conv2, i8 zeroext %conv6)
  %conv8 = zext i8 %call7 to i64
  %cmp9 = icmp sge i64 %conv8, 1370397191
  %conv10 = zext i1 %cmp9 to i32
  %conv11 = trunc i32 %conv10 to i16
  %tmp12 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %conv13 = sext i32 %tmp12 to i64
  %call14 = call i32 @func_21(i16 zeroext %conv11, i64 %conv13)
  %call15 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %call, i32 %call14)
  %conv16 = sext i8 %call15 to i32
  %tmp17 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %conv18 = trunc i32 %tmp17 to i8
  %tmp19 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %conv20 = trunc i32 %tmp19 to i16
  %call21 = call i32 @func_2(i32 %conv16, i8 signext %conv18, i16 zeroext %conv20, i32 1798619750)
  %tmp22 = load i32** %l_27, align 8
  %tmp23 = load i32* %tmp22
  %or = or i32 %tmp23, %call21
  store i32 %or, i32* %tmp22
  %tmp24 = load i32** %l_27, align 8
  %tmp25 = load i32* %tmp24
  ret i32 %tmp25
}

define i32 @func_2(i32 %p_3, i8 signext %p_4, i16 zeroext %p_5, i32 %p_6) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i8, align 1
  %p_5.addr = alloca i16, align 2
  %p_6.addr = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_12 = alloca i32**, align 8
  %l_16 = alloca i32*, align 8
  %l_15 = alloca [1 x [6 x [3 x i16]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %p_3, i32* %p_3.addr, align 4
  store i8 %p_4, i8* %p_4.addr, align 1
  store i16 %p_5, i16* %p_5.addr, align 2
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), i32** %l_11, align 8
  store i32** %l_11, i32*** %l_12, align 8
  store i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 1), i32** %l_16, align 8
  %call = call i32* @func_7(i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5))
  store i32* %call, i32** %l_11, align 8
  %tmp = load i32*** %l_12, align 8
  store i32* null, i32** %tmp
  store i32 0, i32* %p_6.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc38, %entry
  %tmp1 = load i32* %p_6.addr, align 4
  %cmp = icmp eq i32 %tmp1, 0
  br i1 %cmp, label %for.body, label %for.end43

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc30, %for.body
  %tmp7 = load i32* %i, align 4
  %cmp8 = icmp slt i32 %tmp7, 1
  br i1 %cmp8, label %for.body9, label %for.end33

for.body9:                                        ; preds = %for.cond6
  store i32 0, i32* %j, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc26, %for.body9
  %tmp11 = load i32* %j, align 4
  %cmp12 = icmp slt i32 %tmp11, 6
  br i1 %cmp12, label %for.body13, label %for.end29

for.body13:                                       ; preds = %for.cond10
  store i32 0, i32* %k, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %for.body13
  %tmp15 = load i32* %k, align 4
  %cmp16 = icmp slt i32 %tmp15, 3
  br i1 %cmp16, label %for.body17, label %for.end

for.body17:                                       ; preds = %for.cond14
  %tmp18 = load i32* %k, align 4
  %idxprom = sext i32 %tmp18 to i64
  %tmp19 = load i32* %j, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %tmp21 = load i32* %i, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %arrayidx = getelementptr inbounds [1 x [6 x [3 x i16]]]* %l_15, i32 0, i64 %idxprom22
  %arrayidx23 = getelementptr inbounds [6 x [3 x i16]]* %arrayidx, i32 0, i64 %idxprom20
  %arrayidx24 = getelementptr inbounds [3 x i16]* %arrayidx23, i32 0, i64 %idxprom
  store i16 -1, i16* %arrayidx24, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body17
  %tmp25 = load i32* %k, align 4
  %inc = add nsw i32 %tmp25, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  br label %for.inc26

for.inc26:                                        ; preds = %for.end
  %tmp27 = load i32* %j, align 4
  %inc28 = add nsw i32 %tmp27, 1
  store i32 %inc28, i32* %j, align 4
  br label %for.cond10

for.end29:                                        ; preds = %for.cond10
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %tmp31 = load i32* %i, align 4
  %inc32 = add nsw i32 %tmp31, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond6

for.end33:                                        ; preds = %for.cond6
  %arrayidx34 = getelementptr inbounds [1 x [6 x [3 x i16]]]* %l_15, i32 0, i64 0
  %arrayidx35 = getelementptr inbounds [6 x [3 x i16]]* %arrayidx34, i32 0, i64 0
  %arrayidx36 = getelementptr inbounds [3 x i16]* %arrayidx35, i32 0, i64 2
  %tmp37 = load i16* %arrayidx36, align 2
  %conv = zext i16 %tmp37 to i32
  store i32 %conv, i32* %retval
  br label %return

for.inc38:                                        ; No predecessors!
  %tmp39 = load i32* %p_6.addr, align 4
  %conv40 = trunc i32 %tmp39 to i16
  %call41 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv40, i16 zeroext 1)
  %conv42 = zext i16 %call41 to i32
  store i32 %conv42, i32* %p_6.addr, align 4
  br label %for.cond

for.end43:                                        ; preds = %for.cond
  %tmp44 = load i32** %l_16, align 8
  store i32 1, i32* %tmp44
  %tmp45 = load i16* %p_5.addr, align 2
  %conv46 = zext i16 %tmp45 to i32
  store i32 %conv46, i32* %retval
  br label %return

return:                                           ; preds = %for.end43, %for.end33
  %0 = load i32* %retval
  ret i32 %0
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

define i32 @func_21(i16 zeroext %p_22, i64 %p_23) nounwind uwtable {
entry:
  %p_22.addr = alloca i16, align 2
  %p_23.addr = alloca i64, align 8
  store i16 %p_22, i16* %p_22.addr, align 2
  store i64 %p_23, i64* %p_23.addr, align 8
  %tmp = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  ret i32 %tmp
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
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
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
}

define i32* @func_7(i32* %p_8) nounwind uwtable {
entry:
  %p_8.addr = alloca i32*, align 8
  %l_9 = alloca i32*, align 8
  store i32* %p_8, i32** %p_8.addr, align 8
  store i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), i32** %l_9, align 8
  %tmp = load i32** %l_9, align 8
  ret i32* %tmp
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
  %tmp = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i32 0, i64 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* @g_28, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %tmp16)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
