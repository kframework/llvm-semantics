; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000045.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global i32 1108402532, align 4
@g_9 = global i32* @g_10, align 8
@g_15 = global [8 x i32*] zeroinitializer, align 16
@g_14 = global i32** bitcast (i8* getelementptr (i8* bitcast ([8 x i32*]* @g_15 to i8*), i64 48) to i32**), align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_13 = alloca i32*, align 8
  %l_16 = alloca [2 x [1 x i32]], align 4
  %l_17 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* null, i32** %l_13, align 8
  store i32* @g_10, i32** %l_17, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 1
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [2 x [1 x i32]]* %l_16, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [1 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 641538176, i32* %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %tmp9 = load i32* %j, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %tmp11 = load i32* %i, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  %tmp14 = load i32** %l_13, align 8
  %tmp15 = volatile load i32** @g_9, align 8
  %tmp16 = load i32* %tmp15
  %tmp17 = load i32* @g_10, align 4
  %cmp18 = icmp sge i32 %tmp16, %tmp17
  %conv = zext i1 %cmp18 to i32
  %conv19 = trunc i32 %conv to i16
  %call = call i32* @func_2(i32* @g_10, i32* %tmp14, i16 zeroext %conv19)
  %tmp20 = volatile load i32*** @g_14, align 8
  store i32* %call, i32** %tmp20
  %arrayidx21 = getelementptr inbounds [2 x [1 x i32]]* %l_16, i32 0, i64 0
  %arrayidx22 = getelementptr inbounds [1 x i32]* %arrayidx21, i32 0, i64 0
  %tmp23 = load i32* %arrayidx22, align 4
  %tmp24 = load i32** %l_17, align 8
  store i32 %tmp23, i32* %tmp24
  %tmp25 = load i32* @g_10, align 4
  %conv26 = trunc i32 %tmp25 to i16
  ret i16 %conv26
}

define i32* @func_2(i32* %p_3, i32* %p_4, i16 zeroext %p_5) nounwind uwtable {
entry:
  %p_3.addr = alloca i32*, align 8
  %p_4.addr = alloca i32*, align 8
  %p_5.addr = alloca i16, align 2
  %l_11 = alloca i32*, align 8
  %l_12 = alloca i32*, align 8
  %l_8 = alloca i8, align 1
  store i32* %p_3, i32** %p_3.addr, align 8
  store i32* %p_4, i32** %p_4.addr, align 8
  store i16 %p_5, i16* %p_5.addr, align 2
  volatile store i32* @g_10, i32** %l_11, align 8
  store i32* @g_10, i32** %l_12, align 8
  store i16 2, i16* %p_5.addr, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i16* %p_5.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, -16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 -95, i8* %l_8, align 1
  %tmp3 = load i8* %l_8, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  %tmp4 = volatile load i32** @g_9, align 8
  volatile store i32* %tmp4, i32** %l_11, align 8
  %tmp5 = load i32** %p_3.addr, align 8
  %tmp6 = load i32* %tmp5
  %tobool7 = icmp ne i32 %tmp6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  br label %for.end

if.end9:                                          ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %tmp10 = load i16* %p_5.addr, align 2
  %call = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %tmp10, i16 signext 1)
  store i16 %call, i16* %p_5.addr, align 2
  br label %for.cond

for.end:                                          ; preds = %if.then8, %if.then, %for.cond
  %tmp11 = load i32** %l_12, align 8
  ret i32* %tmp11
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
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
  %tmp = load i32* @g_10, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
