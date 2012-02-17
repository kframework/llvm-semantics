; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001556.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -942779432, align 4
@g_10 = constant [9 x [1 x i32*]] [[1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4], [1 x i32*] [i32* @g_4]], align 16
@g_9 = global i32** bitcast (i8* getelementptr (i8* bitcast ([9 x [1 x i32*]]* @g_10 to i8*), i64 56) to i32**), align 8
@g_16 = global [3 x [8 x [1 x [3 x i32*]]]] [[8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], [8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]], [8 x [1 x [3 x i32*]]] [[1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]], [1 x [3 x i32*]] [[3 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4]]]], align 16
@g_15 = global i32** bitcast (i8* getelementptr (i8* bitcast ([3 x [8 x [1 x [3 x i32*]]]]* @g_16 to i8*), i64 400) to i32**), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32*, align 8
  %l_2 = alloca i32**, align 8
  %l_13 = alloca [7 x i32], align 16
  %l_14 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* null, i32** %l_3, align 8
  store i32** %l_3, i32*** %l_2, align 8
  %tmp = load i32*** %l_2, align 8
  store i32* null, i32** %tmp
  store i32 0, i32* @g_4, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %entry
  %tmp1 = load i32* @g_4, align 4
  %cmp = icmp slt i32 %tmp1, 0
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  store i32* @g_4, i32** %l_14, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %tmp6, 7
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %i, align 4
  %idxprom = sext i32 %tmp9 to i64
  %arrayidx = getelementptr inbounds [7 x i32]* %l_13, i32 0, i64 %idxprom
  store i32 -8, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp10 = load i32* %i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  %tmp11 = volatile load i32*** @g_9, align 8
  %cmp12 = icmp ne i32** null, %tmp11
  %conv = zext i1 %cmp12 to i32
  %arrayidx13 = getelementptr inbounds [7 x i32]* %l_13, i32 0, i64 3
  %tmp14 = load i32* %arrayidx13, align 4
  %conv15 = trunc i32 %tmp14 to i16
  %cmp16 = icmp ne i32** %l_3, getelementptr inbounds ([9 x [1 x i32*]]* @g_10, i32 0, i64 3, i64 0)
  %conv17 = zext i1 %cmp16 to i32
  %call = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv15, i32 %conv17)
  %conv18 = sext i16 %call to i32
  %call19 = call i32 @safe_mod_func_uint32_t_u_u(i32 %conv, i32 %conv18)
  %tmp20 = load i32** %l_14, align 8
  %tmp21 = load i32* %tmp20
  %xor = xor i32 %tmp21, %call19
  store i32 %xor, i32* %tmp20
  br label %for.inc22

for.inc22:                                        ; preds = %for.end
  %tmp23 = load i32* @g_4, align 4
  %conv24 = trunc i32 %tmp23 to i8
  %call25 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv24, i8 zeroext 4)
  %conv26 = zext i8 %call25 to i32
  store i32 %conv26, i32* @g_4, align 4
  br label %for.cond

for.end27:                                        ; preds = %for.cond
  %tmp28 = volatile load i32*** @g_9, align 8
  %tmp29 = volatile load i32** %tmp28
  %tmp30 = volatile load i32*** @g_15, align 8
  volatile store i32* %tmp29, i32** %tmp30
  %tmp31 = load i32* @g_4, align 4
  %conv32 = trunc i32 %tmp31 to i16
  ret i16 %conv32
}

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %rem = urem i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
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

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
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
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
