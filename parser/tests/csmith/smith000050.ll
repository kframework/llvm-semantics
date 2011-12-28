; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000050.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -179040897, align 4
@g_10 = global i32 -443743733, align 4
@g_9 = global i32* @g_10, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_11 = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  %l_5 = alloca i16, align 2
  %l_6 = alloca [9 x i32], align 16
  %i12 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [10 x i8]* %l_11, i32 0, i64 %idxprom
  store i8 -25, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc28, %for.end
  %tmp4 = load i32* @g_2, align 4
  %cmp5 = icmp sgt i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end32

for.body6:                                        ; preds = %for.cond3
  store i16 1, i16* %l_5, align 2
  %tmp8 = load i16* %l_5, align 2
  %tobool = icmp ne i16 %tmp8, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body6
  %tmp9 = load i32* @g_2, align 4
  %conv = trunc i32 %tmp9 to i8
  store i8 %conv, i8* %retval
  br label %return

if.else:                                          ; preds = %for.body6
  store i32 0, i32* %i12, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc21, %if.else
  %tmp14 = load i32* %i12, align 4
  %cmp15 = icmp slt i32 %tmp14, 9
  br i1 %cmp15, label %for.body17, label %for.end24

for.body17:                                       ; preds = %for.cond13
  %tmp18 = load i32* %i12, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [9 x i32]* %l_6, i32 0, i64 %idxprom19
  store i32 1, i32* %arrayidx20, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.body17
  %tmp22 = load i32* %i12, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i12, align 4
  br label %for.cond13

for.end24:                                        ; preds = %for.cond13
  %arrayidx25 = getelementptr inbounds [9 x i32]* %l_6, i32 0, i64 8
  %tmp26 = load i32* %arrayidx25, align 4
  %conv27 = trunc i32 %tmp26 to i8
  store i8 %conv27, i8* %retval
  br label %return

for.inc28:                                        ; No predecessors!
  %tmp29 = load i32* @g_2, align 4
  %conv30 = trunc i32 %tmp29 to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv30, i8 signext 1)
  %conv31 = sext i8 %call to i32
  store i32 %conv31, i32* @g_2, align 4
  br label %for.cond3

for.end32:                                        ; preds = %for.cond3
  %tmp33 = load i32* @g_2, align 4
  %conv34 = trunc i32 %tmp33 to i8
  %call35 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv34, i32 3)
  %conv36 = sext i8 %call35 to i32
  %tmp37 = volatile load i32** @g_9, align 8
  %tmp38 = load i32* %tmp37
  %and = and i32 %tmp38, %conv36
  store i32 %and, i32* %tmp37
  %arrayidx39 = getelementptr inbounds [10 x i8]* %l_11, i32 0, i64 7
  %tmp40 = load i8* %arrayidx39, align 1
  store i8 %tmp40, i8* %retval
  br label %return

return:                                           ; preds = %for.end32, %for.end24, %if.then
  %0 = load i8* %retval
  ret i8 %0
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i8 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_10, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
