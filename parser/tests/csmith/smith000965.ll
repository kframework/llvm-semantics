; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000965.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 -1145, align 2
@g_4 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32*, align 8
  %l_7 = alloca [7 x i16], align 2
  %i = alloca i32, align 4
  store i32* @g_4, i32** %l_3, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i16]* %l_7, i32 0, i64 %idxprom
  store i16 29887, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %lbl_8

lbl_8:                                            ; preds = %if.then25, %for.end
  %tmp3 = load i16* @g_2, align 2
  %conv = zext i16 %tmp3 to i32
  %tmp4 = load i32** %l_3, align 8
  %tmp5 = load i32* %tmp4
  %xor = xor i32 %tmp5, %conv
  store i32 %xor, i32* %tmp4
  %tmp6 = load i32** %l_3, align 8
  %tmp7 = load i32* %tmp6
  %conv8 = trunc i32 %tmp7 to i16
  %call = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv8, i32 1357306448)
  %tobool = icmp ne i16 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %lbl_8
  store i16 0, i16* @g_2, align 2
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc18, %if.then
  %tmp10 = load i16* @g_2, align 2
  %conv11 = zext i16 %tmp10 to i32
  %cmp12 = icmp slt i32 %conv11, 7
  br i1 %cmp12, label %for.body14, label %for.end22

for.body14:                                       ; preds = %for.cond9
  %tmp15 = load i16* @g_2, align 2
  %idxprom16 = zext i16 %tmp15 to i64
  %arrayidx17 = getelementptr inbounds [7 x i16]* %l_7, i32 0, i64 %idxprom16
  store i16 -21216, i16* %arrayidx17, align 2
  br label %for.inc18

for.inc18:                                        ; preds = %for.body14
  %tmp19 = load i16* @g_2, align 2
  %conv20 = zext i16 %tmp19 to i32
  %add = add nsw i32 %conv20, 1
  %conv21 = trunc i32 %add to i16
  store i16 %conv21, i16* @g_2, align 2
  br label %for.cond9

for.end22:                                        ; preds = %for.cond9
  br label %if.end26

if.else:                                          ; preds = %lbl_8
  %tmp23 = load i32* @g_4, align 4
  %tobool24 = icmp ne i32 %tmp23, 0
  br i1 %tobool24, label %if.then25, label %if.end

if.then25:                                        ; preds = %if.else
  br label %lbl_8

if.end:                                           ; preds = %if.else
  br label %if.end26

if.end26:                                         ; preds = %if.end, %for.end22
  %tmp27 = load i32* @g_4, align 4
  %conv28 = trunc i32 %tmp27 to i16
  ret i16 %conv28
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
