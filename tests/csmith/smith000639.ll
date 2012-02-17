; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000639.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i32 -1, align 4
@g_8 = global i32 -3, align 4
@g_10 = global i32 1, align 4
@g_31 = global i32 653085642, align 4
@g_30 = global i32* @g_31, align 8
@g_33 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_31 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_33 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_11 = alloca i8, align 1
  %l_32 = alloca i32*, align 8
  %l_29 = alloca i32*, align 8
  %l_28 = alloca i32**, align 8
  %l_34 = alloca i32*, align 8
  store i8 -3, i8* %l_11, align 1
  store i32* @g_33, i32** %l_32, align 8
  %tmp = volatile load i32* @g_4, align 4
  %tmp1 = load i8* %l_11, align 1
  %conv = zext i8 %tmp1 to i64
  %call = call i32 @func_5(i64 %conv)
  %or = or i32 %tmp, %call
  %conv2 = trunc i32 %or to i8
  %tmp3 = load i8* %l_11, align 1
  %call4 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv2, i8 zeroext %tmp3)
  %tobool = icmp ne i8 %call4, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* null, i32** %l_29, align 8
  store i32** %l_29, i32*** %l_28, align 8
  %tmp7 = load i32*** %l_28, align 8
  %call8 = call zeroext i16 @func_23(i8 zeroext -36, i32** %tmp7)
  %tmp9 = load i32** @g_30, align 8
  %cmp = icmp ne i32* %tmp9, null
  %conv10 = zext i1 %cmp to i32
  %conv11 = trunc i32 %conv10 to i8
  %tmp12 = load i32** %l_32, align 8
  %call13 = call i32* @func_12(i32* @g_8, i16 zeroext %call8, i8 zeroext %conv11, i32* %tmp12)
  %tmp14 = load i32*** %l_28, align 8
  store i32* %call13, i32** %tmp14
  %tmp15 = load i32** @g_30, align 8
  %tmp16 = volatile load i32* %tmp15
  store i32 %tmp16, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32* null, i32** %l_34, align 8
  %tmp18 = load i32** %l_34, align 8
  store i32* %tmp18, i32** %l_34, align 8
  %tmp19 = load i32** @g_30, align 8
  %tmp20 = volatile load i32* %tmp19
  %conv21 = sext i32 %tmp20 to i64
  %xor = xor i64 %conv21, 1977601183
  %conv22 = trunc i64 %xor to i32
  volatile store i32 %conv22, i32* %tmp19
  %tmp23 = load i32** %l_32, align 8
  %tmp24 = load i32* %tmp23
  store i32 %tmp24, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
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

define i32 @func_5(i64 %p_6) nounwind uwtable {
entry:
  %p_6.addr = alloca i64, align 8
  %l_7 = alloca i32*, align 8
  %l_9 = alloca i32*, align 8
  store i64 %p_6, i64* %p_6.addr, align 8
  store i32* @g_8, i32** %l_7, align 8
  store i32* null, i32** %l_9, align 8
  %tmp = load i64* %p_6.addr, align 8
  %cmp = icmp sgt i64 %tmp, 1494155828
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ true, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv = sext i32 %land.ext to i64
  %cmp1 = icmp sge i64 %conv, -5
  %conv2 = zext i1 %cmp1 to i32
  %tmp3 = load i32** %l_7, align 8
  store i32 %conv2, i32* %tmp3
  %tmp4 = load i32** %l_7, align 8
  %tmp5 = load i32* %tmp4
  %tmp6 = load i32* @g_10, align 4
  %or = or i32 %tmp6, %tmp5
  store i32 %or, i32* @g_10, align 4
  %tmp7 = load i64* %p_6.addr, align 8
  %conv8 = trunc i64 %tmp7 to i32
  ret i32 %conv8
}

define i32* @func_12(i32* %p_13, i16 zeroext %p_14, i8 zeroext %p_15, i32* %p_16) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_13.addr = alloca i32*, align 8
  %p_14.addr = alloca i16, align 2
  %p_15.addr = alloca i8, align 1
  %p_16.addr = alloca i32*, align 8
  %l_18 = alloca i32**, align 8
  %l_17 = alloca i32***, align 8
  %l_22 = alloca i32*, align 8
  store i32* %p_13, i32** %p_13.addr, align 8
  store i16 %p_14, i16* %p_14.addr, align 2
  store i8 %p_15, i8* %p_15.addr, align 1
  store i32* %p_16, i32** %p_16.addr, align 8
  store i32** null, i32*** %l_18, align 8
  store i32*** %l_18, i32**** %l_17, align 8
  br label %lbl_21

lbl_21:                                           ; preds = %if.then, %entry
  %tmp = load i32**** %l_17, align 8
  store i32** null, i32*** %tmp
  %tmp1 = load i32* @g_8, align 4
  %cmp = icmp eq i32** null, %p_13.addr
  %conv = zext i1 %cmp to i32
  %cmp2 = icmp slt i32 %tmp1, %conv
  %conv3 = zext i1 %cmp2 to i32
  %tmp4 = volatile load i32* @g_4, align 4
  %cmp5 = icmp eq i32 %conv3, %tmp4
  %conv6 = zext i1 %cmp5 to i32
  %tmp7 = load i32** %p_16.addr, align 8
  store i32 %conv6, i32* %tmp7
  store i32 0, i32* @g_10, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lbl_21
  %tmp8 = load i32* @g_10, align 4
  %cmp9 = icmp uge i32 %tmp8, -27
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* null, i32** %l_22, align 8
  %tmp12 = load i32* @g_8, align 4
  %tobool = icmp ne i32 %tmp12, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %lbl_21

if.end:                                           ; preds = %for.body
  %tmp13 = load i32** %l_22, align 8
  store i32* %tmp13, i32** %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp14 = load i32* @g_10, align 4
  %conv15 = zext i32 %tmp14 to i64
  %call = call i64 @safe_add_func_int64_t_s_s(i64 %conv15, i64 1)
  %conv16 = trunc i64 %call to i32
  store i32 %conv16, i32* @g_10, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32* @g_8, i32** %retval
  br label %return

return:                                           ; preds = %for.end, %if.end
  %0 = load i32** %retval
  ret i32* %0
}

define zeroext i16 @func_23(i8 zeroext %p_24, i32** %p_25) nounwind uwtable {
entry:
  %p_24.addr = alloca i8, align 1
  %p_25.addr = alloca i32**, align 8
  %l_26 = alloca i32, align 4
  %l_27 = alloca i32*, align 8
  store i8 %p_24, i8* %p_24.addr, align 1
  store i32** %p_25, i32*** %p_25.addr, align 8
  volatile store i32 -1, i32* %l_26, align 4
  store i32* @g_8, i32** %l_27, align 8
  %tmp = volatile load i32* @g_4, align 4
  volatile store i32 %tmp, i32* %l_26, align 4
  %tmp1 = volatile load i32* @g_4, align 4
  %tmp2 = load i32** %l_27, align 8
  %tmp3 = load i32* %tmp2
  %xor = xor i32 %tmp3, %tmp1
  store i32 %xor, i32* %tmp2
  %tmp4 = volatile load i32* @g_4, align 4
  %conv = trunc i32 %tmp4 to i16
  ret i16 %conv
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %si2.addr, align 8
  %cmp2 = icmp sgt i64 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i64* %si1.addr, align 8
  %tmp5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %tmp5
  %cmp6 = icmp sgt i64 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i64* %si1.addr, align 8
  %cmp8 = icmp slt i64 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i64* %si2.addr, align 8
  %cmp11 = icmp slt i64 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i64* %si1.addr, align 8
  %tmp14 = load i64* %si2.addr, align 8
  %sub15 = sub nsw i64 -9223372036854775808, %tmp14
  %cmp16 = icmp slt i64 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i64* %si1.addr, align 8
  %tmp19 = load i64* %si2.addr, align 8
  %add = add nsw i64 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp17, %cond.true ], [ %add, %cond.false ]
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
  %call = call i32 @func_1()
  %tmp = volatile load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_8, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_10, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* @g_31, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* @g_33, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
