; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001904.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1, align 4
@g_7 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [7 x i16], align 2
  %i = alloca i32, align 4
  %l_6 = alloca i8, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i16]* %l_2, i32 0, i64 %idxprom
  store i16 -1, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 4, i32* @g_3, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc14, %for.end
  %tmp4 = load i32* @g_3, align 4
  %cmp5 = icmp sge i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end16

for.body6:                                        ; preds = %for.cond3
  store i8 -1, i8* %l_6, align 1
  %tmp8 = load i32* @g_3, align 4
  %call = call signext i16 @safe_lshift_func_int16_t_s_s(i16 signext 24962, i32 -1001191646)
  %conv = sext i16 %call to i32
  %cmp9 = icmp sge i32 %tmp8, %conv
  %conv10 = zext i1 %cmp9 to i32
  %tmp11 = load i8* %l_6, align 1
  %conv12 = zext i8 %tmp11 to i32
  %and = and i32 %conv12, %conv10
  %conv13 = trunc i32 %and to i8
  store i8 %conv13, i8* %l_6, align 1
  store i32* @g_3, i32** @g_7, align 8
  br label %for.inc14

for.inc14:                                        ; preds = %for.body6
  %tmp15 = load i32* @g_3, align 4
  %add = add nsw i32 %tmp15, -2
  store i32 %add, i32* @g_3, align 4
  br label %for.cond3

for.end16:                                        ; preds = %for.cond3
  %tmp17 = load i32* @g_3, align 4
  %rem = urem i32 %tmp17, 7
  %idxprom18 = zext i32 %rem to i64
  %arrayidx19 = getelementptr inbounds [7 x i16]* %l_2, i32 0, i64 %idxprom18
  %tmp20 = load i16* %arrayidx19, align 2
  %conv21 = sext i16 %tmp20 to i32
  ret i32 %conv21
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
