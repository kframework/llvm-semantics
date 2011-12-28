; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001173.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i8 6, align 1
@g_11 = global [2 x [4 x i16]] [[4 x i16] [i16 -32556, i16 -32556, i16 -32556, i16 -32556], [4 x i16] [i16 -32556, i16 -32556, i16 -32556, i16 -32556]], align 16
@g_19 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][2] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][3] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_12 = alloca i8, align 1
  %l_13 = alloca i64, align 8
  %l_18 = alloca i32*, align 8
  store i8 1, i8* %l_12, align 1
  store i64 2128968691002523555, i64* %l_13, align 8
  store i32* @g_19, i32** %l_18, align 8
  %tmp = volatile load i8* @g_6, align 1
  %conv = sext i8 %tmp to i16
  %call = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv, i32 -10)
  %tmp1 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %conv2 = zext i16 %tmp1 to i32
  %tmp3 = load i8* %l_12, align 1
  %conv4 = zext i8 %tmp3 to i32
  %call5 = call i32 @safe_add_func_int32_t_s_s(i32 %conv2, i32 %conv4)
  %conv6 = sext i32 %call5 to i64
  %tmp7 = load i64* %l_13, align 8
  %cmp = icmp eq i64 %conv6, %tmp7
  %conv8 = zext i1 %cmp to i32
  %conv9 = trunc i32 %conv8 to i8
  %tmp10 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 0), align 2
  %conv11 = zext i16 %tmp10 to i64
  %tmp12 = load i64* %l_13, align 8
  %and = and i64 %conv11, %tmp12
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %lor.end19, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp13 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 1), align 2
  %conv14 = zext i16 %tmp13 to i32
  %tobool15 = icmp ne i32 %conv14, 0
  br i1 %tobool15, label %lor.end, label %lor.rhs16

lor.rhs16:                                        ; preds = %lor.rhs
  %tmp17 = load i64* %l_13, align 8
  %tobool18 = icmp ne i64 %tmp17, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs16, %lor.rhs
  %0 = phi i1 [ true, %lor.rhs ], [ %tobool18, %lor.rhs16 ]
  br label %lor.end19

lor.end19:                                        ; preds = %lor.end, %entry
  %1 = phi i1 [ true, %entry ], [ %0, %lor.end ]
  %lor.ext = zext i1 %1 to i32
  %tmp20 = load i64* %l_13, align 8
  %tmp21 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %conv22 = zext i16 %tmp21 to i64
  %cmp23 = icmp ne i64 %tmp20, %conv22
  %conv24 = zext i1 %cmp23 to i32
  %conv25 = sext i32 %conv24 to i64
  %tmp26 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 3), align 2
  %conv27 = zext i16 %tmp26 to i64
  %tmp28 = load i64* %l_13, align 8
  %xor = xor i64 %conv27, %tmp28
  %call29 = call i64 @safe_mod_func_uint64_t_u_u(i64 %conv25, i64 %xor)
  %conv30 = trunc i64 %call29 to i32
  %call31 = call i32 @safe_add_func_uint32_t_u_u(i32 %lor.ext, i32 %conv30)
  %conv32 = trunc i32 %call31 to i8
  %call33 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv9, i8 signext %conv32)
  %conv34 = sext i8 %call33 to i32
  %call35 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %call, i32 %conv34)
  %conv36 = zext i16 %call35 to i32
  %tmp37 = load i8* %l_12, align 1
  %conv38 = zext i8 %tmp37 to i32
  %cmp39 = icmp sle i32 %conv36, %conv38
  %conv40 = zext i1 %cmp39 to i32
  %tmp41 = load i32** %l_18, align 8
  %tmp42 = load i32* %tmp41
  %or = or i32 %tmp42, %conv40
  store i32 %or, i32* %tmp41
  %tmp43 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  ret i16 %tmp43
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

define internal i64 @safe_mod_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
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
  %rem = urem i64 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = volatile load i8* @g_6, align 1
  %conv = sext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 0), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %conv6)
  %tmp8 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 2), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %conv9)
  %tmp11 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 3), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0), i32 %conv12)
  %tmp14 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 0), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0), i32 %conv15)
  %tmp17 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 1), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), i32 %conv18)
  %tmp20 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 2), align 2
  %conv21 = zext i16 %tmp20 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0), i32 %conv21)
  %tmp23 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 1, i64 3), align 2
  %conv24 = zext i16 %tmp23 to i32
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %conv24)
  %tmp26 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i32 0, i64 0, i64 1), align 2
  %conv27 = zext i16 %tmp26 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0), i32 %conv27)
  %tmp29 = load i32* @g_19, align 4
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %tmp29)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
