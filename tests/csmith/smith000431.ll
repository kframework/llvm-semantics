; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000431.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 4, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca i32**, align 8
  %l_6 = alloca i32***, align 8
  store i32** @g_4, i32*** %l_7, align 8
  store i32*** %l_7, i32**** %l_6, align 8
  %call = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext 0, i32 1545096272)
  %conv = sext i16 %call to i32
  %tmp = volatile load i32** @g_4, align 8
  %tmp1 = load i32* %tmp
  %and = and i32 %tmp1, %conv
  store i32 %and, i32* %tmp
  %tmp2 = load i32**** %l_6, align 8
  store i32** @g_4, i32*** %tmp2
  %tmp3 = load i32**** %l_6, align 8
  %tmp4 = load i32*** %tmp3
  %tmp5 = volatile load i32** %tmp4
  %tmp6 = load i32* %tmp5
  %conv7 = trunc i32 %tmp6 to i16
  %tmp8 = load i32* @g_5, align 4
  %conv9 = trunc i32 %tmp8 to i16
  %call10 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv7, i16 zeroext %conv9)
  %conv11 = zext i16 %call10 to i32
  %tmp12 = load i32**** %l_6, align 8
  %tmp13 = load i32*** %tmp12
  %tmp14 = volatile load i32** %tmp13
  store i32 %conv11, i32* %tmp14
  %tmp15 = load i32**** %l_6, align 8
  %tmp16 = load i32*** %tmp15
  %tmp17 = volatile load i32** %tmp16
  %tmp18 = load i32* %tmp17
  %conv19 = sext i32 %tmp18 to i64
  ret i64 %conv19
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i16* %left.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i16* %left.addr, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
