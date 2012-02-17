; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001561.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 239365619, align 4
@g_3 = global i32* @g_4, align 8
@g_5 = global i32* @g_4, align 8
@g_19 = global i32 6, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i64, align 8
  %l_12 = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  %l_18 = alloca i32*, align 8
  store i64 7059887792567472795, i64* %l_2, align 8
  store i32* null, i32** %l_12, align 8
  store i32* @g_4, i32** %l_15, align 8
  store i32* @g_19, i32** %l_18, align 8
  %tmp = load i64* %l_2, align 8
  %conv = trunc i64 %tmp to i32
  %tmp1 = volatile load i32** @g_3, align 8
  store i32 %conv, i32* %tmp1
  %tmp2 = load i64* %l_2, align 8
  %tmp3 = load i64* %l_2, align 8
  %cmp = icmp slt i64 %tmp2, %tmp3
  %conv4 = zext i1 %cmp to i32
  %tmp5 = volatile load i32** @g_5, align 8
  store i32 %conv4, i32* %tmp5
  %tmp6 = volatile load i32** @g_3, align 8
  %tmp7 = load i32* %tmp6
  %tmp8 = load i32* @g_4, align 4
  %tmp9 = load i32** %l_12, align 8
  %tmp10 = load i32** %l_12, align 8
  %cmp11 = icmp eq i32* %tmp9, %tmp10
  br i1 %cmp11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp13 = load i32* @g_4, align 4
  %tobool = icmp ne i32 %tmp13, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %xor = xor i32 %tmp8, %lor.ext
  %cmp14 = icmp ne i32 %tmp7, %xor
  %conv15 = zext i1 %cmp14 to i32
  %tmp16 = load i32* @g_4, align 4
  %conv17 = trunc i32 %tmp16 to i16
  %call = call signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %conv17, i32 -172902659)
  %conv18 = sext i16 %call to i32
  %tmp19 = load i32* @g_4, align 4
  %xor20 = xor i32 %conv18, %tmp19
  %cmp21 = icmp sge i32 %conv15, %xor20
  %conv22 = zext i1 %cmp21 to i32
  %conv23 = trunc i32 %conv22 to i8
  %tmp24 = load i32** %l_15, align 8
  %tmp25 = load i32** %l_15, align 8
  %tmp26 = load i32* %tmp25
  %conv27 = sext i32 %tmp26 to i64
  %tmp28 = load i32* @g_4, align 4
  %conv29 = sext i32 %tmp28 to i64
  %call30 = call i64 @safe_div_func_int64_t_s_s(i64 %conv27, i64 %conv29)
  %conv31 = trunc i64 %call30 to i16
  %call32 = call i32 @func_6(i32* @g_4, i8 signext %conv23, i32* %tmp24, i16 zeroext %conv31, i32* @g_4)
  %tmp33 = load i32** %l_18, align 8
  %tmp34 = load i32* %tmp33
  %and = and i32 %tmp34, %call32
  store i32 %and, i32* %tmp33
  %tmp35 = load i32** %l_18, align 8
  %tmp36 = load i32* %tmp35
  %conv37 = sext i32 %tmp36 to i64
  %xor38 = xor i64 %conv37, 7
  %conv39 = trunc i64 %xor38 to i32
  store i32 %conv39, i32* %tmp35
  %tmp40 = volatile load i32** @g_3, align 8
  %tmp41 = load i32* %tmp40
  ret i32 %tmp41
}

define i32 @func_6(i32* %p_7, i8 signext %p_8, i32* %p_9, i16 zeroext %p_10, i32* %p_11) nounwind uwtable {
entry:
  %p_7.addr = alloca i32*, align 8
  %p_8.addr = alloca i8, align 1
  %p_9.addr = alloca i32*, align 8
  %p_10.addr = alloca i16, align 2
  %p_11.addr = alloca i32*, align 8
  store i32* %p_7, i32** %p_7.addr, align 8
  store i8 %p_8, i8* %p_8.addr, align 1
  store i32* %p_9, i32** %p_9.addr, align 8
  store i16 %p_10, i16* %p_10.addr, align 2
  store i32* %p_11, i32** %p_11.addr, align 8
  %tmp = volatile load i32** @g_3, align 8
  %tmp1 = load i32* %tmp
  ret i32 %tmp1
}

define internal signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %tmp10 = load i16* %left.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  %tmp12 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %tmp12
  %cmp13 = icmp sgt i32 %conv11, %shr
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp15 = load i16* %left.addr, align 2
  %conv16 = sext i16 %tmp15 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false9
  %tmp17 = load i16* %left.addr, align 2
  %conv18 = sext i16 %tmp17 to i32
  %tmp19 = load i32* %right.addr, align 4
  %shl = shl i32 %conv18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv16, %cond.true ], [ %shl, %cond.false ]
  %conv20 = trunc i32 %cond to i16
  ret i16 %conv20
}

define internal i64 @safe_div_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
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
  %div = sdiv i64 %tmp6, %tmp7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp5, %cond.true ], [ %div, %cond.false ]
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
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_19, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
