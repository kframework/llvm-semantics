; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000805.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global [8 x i32] [i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4], align 16
@g_13 = global i32 2, align 4
@g_15 = global i32 51721773, align 4
@.str = private unnamed_addr constant [23 x i8] c"checksum g_11[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_11[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_11[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_11[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_11[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_11[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_11[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_11[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_14 = alloca i32*, align 8
  store i32* @g_15, i32** %l_14, align 8
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 6), align 4
  %conv = trunc i32 %tmp to i16
  %call = call i32 @func_2(i16 signext %conv, i32 -443810737, i8 signext -46, i32 1)
  %tmp1 = load i32** %l_14, align 8
  %tmp2 = load i32* %tmp1
  %xor = xor i32 %tmp2, %call
  store i32 %xor, i32* %tmp1
  %tmp3 = load i32** %l_14, align 8
  %tmp4 = load i32** %l_14, align 8
  %cmp = icmp eq i32* %tmp3, %tmp4
  %conv5 = zext i1 %cmp to i32
  %tmp6 = load i32** %l_14, align 8
  %tmp7 = load i32* %tmp6
  %and = and i32 %tmp7, %conv5
  store i32 %and, i32* %tmp6
  %tmp8 = load i32* @g_15, align 4
  %conv9 = trunc i32 %tmp8 to i16
  ret i16 %conv9
}

define i32 @func_2(i16 signext %p_3, i32 %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i16, align 2
  %p_4.addr = alloca i32, align 4
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i32, align 4
  %l_9 = alloca i32, align 4
  %l_12 = alloca i32*, align 8
  store i16 %p_3, i16* %p_3.addr, align 2
  store i32 %p_4, i32* %p_4.addr, align 4
  store i8 %p_5, i8* %p_5.addr, align 1
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32 1, i32* %l_9, align 4
  store i32* @g_13, i32** %l_12, align 8
  %tmp = load i32* %l_9, align 4
  %conv = trunc i32 %tmp to i8
  %tmp1 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  %conv2 = trunc i32 %tmp1 to i16
  %call = call signext i16 @safe_unary_minus_func_int16_t_s(i16 signext %conv2)
  %conv3 = sext i16 %call to i32
  %tobool = icmp ne i32 %conv3, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %call4 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv, i32 %lor.ext)
  %conv5 = sext i8 %call4 to i32
  %tmp6 = load i32** %l_12, align 8
  %tmp7 = load i32* %tmp6
  %or = or i32 %tmp7, %conv5
  store i32 %or, i32* %tmp6
  %tmp8 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  ret i32 %tmp8
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
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_11, i32 0, i64 7), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* @g_13, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* @g_15, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %tmp20)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
