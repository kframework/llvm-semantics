; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001015.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 -6, align 4
@g_5 = global i32* @g_6, align 8
@g_9 = global i32 0, align 4
@g_8 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  %l_7 = alloca [9 x i32*], align 16
  %l_10 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 96995658, i32* %l_4, align 4
  volatile store i32 1, i32* %l_10, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [9 x i32*]* %l_7, i32 0, i64 %idxprom
  store i32* @g_6, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* %l_4, align 4
  %conv = trunc i32 %tmp3 to i16
  %call = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %conv, i32 -2050559553)
  %conv4 = zext i16 %call to i32
  %tmp5 = volatile load i32** @g_5, align 8
  store i32 %conv4, i32* %tmp5
  %arrayidx6 = getelementptr inbounds [9 x i32*]* %l_7, i32 0, i64 6
  %tmp7 = load i32** %arrayidx6, align 8
  %tmp8 = volatile load i32** @g_8, align 8
  %cmp9 = icmp ne i32* %tmp7, %tmp8
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end
  %tmp11 = volatile load i32** @g_5, align 8
  %tmp12 = load i32* %tmp11
  %tobool = icmp ne i32 %tmp12, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end
  %0 = phi i1 [ false, %for.end ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp13 = volatile load i32** @g_5, align 8
  store i32 %land.ext, i32* %tmp13
  %tmp14 = volatile load i32** @g_8, align 8
  %tmp15 = volatile load i32* %tmp14
  volatile store i32 %tmp15, i32* %l_10, align 4
  %tmp16 = load i32* @g_6, align 4
  ret i32 %tmp16
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_6, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* @g_9, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
