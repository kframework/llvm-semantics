; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001769.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1825462207, align 4
@g_6 = constant [8 x [3 x [1 x [1 x i32*]]]] [[3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]], [3 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]], [1 x [1 x i32*]] [[1 x i32*] [i32* @g_2]]]], align 16
@g_10 = global i32 0, align 4
@g_9 = global i32* @g_10, align 8
@g_19 = global [4 x i16] zeroinitializer, align 2
@g_32 = global i32 1904985752, align 4
@g_57 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_19[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_19[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_19[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_19[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_57 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca i32, align 4
  %l_56 = alloca [2 x i32*], align 16
  %l_55 = alloca i32**, align 8
  %i = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  %l_7 = alloca i32*, align 8
  store i32 1720983497, i32* %l_8, align 4
  %arrayidx = getelementptr inbounds [2 x i32*]* %l_56, i32 0, i64 1
  store i32** %arrayidx, i32*** %l_55, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx2 = getelementptr inbounds [2 x i32*]* %l_56, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i32 23, i32* @g_2, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc12, %for.end
  %tmp5 = volatile load i32* @g_2, align 4
  %cmp6 = icmp sle i32 %tmp5, 0
  br i1 %cmp6, label %for.body7, label %for.end15

for.body7:                                        ; preds = %for.cond4
  store i32* null, i32** %l_5, align 8
  store i32* @g_2, i32** %l_7, align 8
  %tmp10 = volatile load i32* @g_2, align 4
  %tmp11 = load i32** %l_7, align 8
  volatile store i32 %tmp10, i32* %tmp11
  br label %for.inc12

for.inc12:                                        ; preds = %for.body7
  %tmp13 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp13 to i8
  %call = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv, i8 zeroext 8)
  %conv14 = zext i8 %call to i32
  volatile store i32 %conv14, i32* @g_2, align 4
  br label %for.cond4

for.end15:                                        ; preds = %for.cond4
  %tmp16 = load i32* %l_8, align 4
  %tmp17 = volatile load i32** @g_9, align 8
  %tmp18 = load i32* %tmp17
  %or = or i32 %tmp18, %tmp16
  store i32 %or, i32* %tmp17
  %arrayidx19 = getelementptr inbounds [2 x i32*]* %l_56, i32 0, i64 1
  %tmp20 = load i32** %arrayidx19, align 8
  %tmp21 = load i32*** %l_55, align 8
  store i32* %tmp20, i32** %tmp21
  %tmp22 = load i32* @g_32, align 4
  %conv23 = sext i32 %tmp22 to i64
  ret i64 %conv23
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define i32* @func_11(i32 %p_12, i64 %p_13, i16 zeroext %p_14, i32* %p_15) nounwind uwtable {
entry:
  %p_12.addr = alloca i32, align 4
  %p_13.addr = alloca i64, align 8
  %p_14.addr = alloca i16, align 2
  %p_15.addr = alloca i32*, align 8
  %l_53 = alloca [10 x [10 x [1 x [1 x i32]]]], align 16
  %l_54 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %p_12, i32* %p_12.addr, align 4
  store i64 %p_13, i64* %p_13.addr, align 8
  store i16 %p_14, i16* %p_14.addr, align 2
  store i32* %p_15, i32** %p_15.addr, align 8
  store i32 0, i32* %l_54, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc28, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 10
  br i1 %cmp3, label %for.body4, label %for.end31

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc24, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end27

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %l, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %tmp10 = load i32* %l, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %tmp13 = load i32* %l, align 4
  %idxprom = sext i32 %tmp13 to i64
  %tmp14 = load i32* %k, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %tmp16 = load i32* %j, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx = getelementptr inbounds [10 x [10 x [1 x [1 x i32]]]]* %l_53, i32 0, i64 %idxprom19
  %arrayidx20 = getelementptr inbounds [10 x [1 x [1 x i32]]]* %arrayidx, i32 0, i64 %idxprom17
  %arrayidx21 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx20, i32 0, i64 %idxprom15
  %arrayidx22 = getelementptr inbounds [1 x i32]* %arrayidx21, i32 0, i64 %idxprom
  store i32 -6, i32* %arrayidx22, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %tmp23 = load i32* %l, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %tmp25 = load i32* %k, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %k, align 4
  br label %for.cond5

for.end27:                                        ; preds = %for.cond5
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %tmp29 = load i32* %j, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond1

for.end31:                                        ; preds = %for.cond1
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  %tmp36 = load i32** %p_15.addr, align 8
  %tmp37 = load i32* %tmp36
  %tmp38 = load i32* %p_12.addr, align 4
  %call = call i32 @func_16(i32 %tmp38, i32* @g_10)
  %cmp39 = icmp sgt i32 %tmp37, %call
  %conv = zext i1 %cmp39 to i32
  %tmp40 = load i32** %p_15.addr, align 8
  %tmp41 = load i32* %tmp40
  %xor = xor i32 %tmp41, %conv
  store i32 %xor, i32* %tmp40
  %arrayidx42 = getelementptr inbounds [10 x [10 x [1 x [1 x i32]]]]* %l_53, i32 0, i64 3
  %arrayidx43 = getelementptr inbounds [10 x [1 x [1 x i32]]]* %arrayidx42, i32 0, i64 0
  %arrayidx44 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx43, i32 0, i64 0
  %arrayidx45 = getelementptr inbounds [1 x i32]* %arrayidx44, i32 0, i64 0
  %tmp46 = load i32* %arrayidx45, align 4
  %tmp47 = load i32* %l_54, align 4
  %and = and i32 %tmp47, %tmp46
  store i32 %and, i32* %l_54, align 4
  ret i32* @g_32
}

define i32 @func_16(i32 %p_17, i32* %p_18) nounwind uwtable {
entry:
  %p_17.addr = alloca i32, align 4
  %p_18.addr = alloca i32*, align 8
  %l_37 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_52 = alloca i64, align 8
  %l_24 = alloca i64, align 8
  %l_31 = alloca i32*, align 8
  store i32 %p_17, i32* %p_17.addr, align 4
  store i32* %p_18, i32** %p_18.addr, align 8
  store i32* @g_10, i32** %l_37, align 8
  store i32 1, i32* @g_10, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %tmp = load i32* @g_10, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %l_52, align 8
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %tmp3 = volatile load i32* @g_2, align 4
  %cmp4 = icmp slt i32 %tmp3, -29
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  store i64 -4488141920626724337, i64* %l_24, align 8
  store i32* @g_10, i32** %l_31, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %tmp8 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp8 to i16
  %call = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext 1)
  %conv9 = zext i16 %call to i32
  volatile store i32 %conv9, i32* @g_2, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %tmp10 = load i64* %l_52, align 8
  %conv11 = trunc i64 %tmp10 to i32
  %tmp12 = load i32** %p_18.addr, align 8
  store i32 %conv11, i32* %tmp12
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %tmp14 = load i32* @g_10, align 4
  %add = add nsw i32 %tmp14, 4
  store i32 %add, i32* @g_10, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %tmp16 = load i32** %p_18.addr, align 8
  %tmp17 = load i32* %tmp16
  ret i32 %tmp17
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

define i32 @func_33(i32 %p_34, i32* %p_35) nounwind uwtable {
entry:
  %p_34.addr = alloca i32, align 4
  %p_35.addr = alloca i32*, align 8
  %l_36 = alloca i8, align 1
  store i32 %p_34, i32* %p_34.addr, align 4
  store i32* %p_35, i32** %p_35.addr, align 8
  store i8 22, i8* %l_36, align 1
  %tmp = load i8* %l_36, align 1
  %conv = zext i8 %tmp to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_10, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 0), align 2
  %conv = zext i16 %tmp4 to i32
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %conv)
  %tmp6 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 1), align 2
  %conv7 = zext i16 %tmp6 to i32
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %conv7)
  %tmp9 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 2), align 2
  %conv10 = zext i16 %tmp9 to i32
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %conv10)
  %tmp12 = load i16* getelementptr inbounds ([4 x i16]* @g_19, i32 0, i64 3), align 2
  %conv13 = zext i16 %tmp12 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %conv13)
  %tmp15 = load i32* @g_32, align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0), i32 %tmp15)
  %tmp17 = load i32* @g_57, align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %tmp17)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
