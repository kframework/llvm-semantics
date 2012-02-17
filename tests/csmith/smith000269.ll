; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant [8 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], align 16
@g_8 = global i32* null, align 8
@g_10 = global i32 5, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_7 = alloca i64, align 8
  %l_11 = alloca [5 x [2 x i16]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %j25 = alloca i32, align 4
  %l_12 = alloca i32, align 4
  store i64 1, i64* %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 2
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [5 x [2 x i16]]* %l_11, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [2 x i16]* %arrayidx, i32 0, i64 %idxprom
  store i16 -7, i16* %arrayidx8, align 2
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
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %conv = trunc i32 %tmp14 to i8
  %call = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv, i32 -435186401)
  %conv15 = sext i8 %call to i32
  %tobool = icmp ne i32 %conv15, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end13
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 6), align 4
  %conv17 = trunc i32 %tmp16 to i8
  %call18 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext -108, i8 signext %conv17)
  %conv19 = sext i8 %call18 to i32
  %tobool20 = icmp ne i32 %conv19, 0
  br i1 %tobool20, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %for.end13
  store i32* @g_10, i32** %l_9, align 8
  %tmp26 = load i64* %l_7, align 8
  %conv27 = trunc i64 %tmp26 to i32
  %tmp28 = load i32** %l_9, align 8
  store i32 %conv27, i32* %tmp28
  store i32 0, i32* @g_10, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc44, %if.then
  %tmp30 = load i32* @g_10, align 4
  %cmp31 = icmp slt i32 %tmp30, 5
  br i1 %cmp31, label %for.body33, label %for.end47

for.body33:                                       ; preds = %for.cond29
  store i64 1, i64* %l_7, align 8
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc41, %for.body33
  %tmp35 = load i64* %l_7, align 8
  %cmp36 = icmp slt i64 %tmp35, 2
  br i1 %cmp36, label %for.body38, label %for.end43

for.body38:                                       ; preds = %for.cond34
  %tmp39 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 7), align 4
  %conv40 = trunc i32 %tmp39 to i8
  store i8 %conv40, i8* %retval
  br label %return

for.inc41:                                        ; No predecessors!
  %tmp42 = load i64* %l_7, align 8
  %add = add nsw i64 %tmp42, 2
  store i64 %add, i64* %l_7, align 8
  br label %for.cond34

for.end43:                                        ; preds = %for.cond34
  br label %for.inc44

for.inc44:                                        ; preds = %for.end43
  %tmp45 = load i32* @g_10, align 4
  %add46 = add nsw i32 %tmp45, 5
  store i32 %add46, i32* @g_10, align 4
  br label %for.cond29

for.end47:                                        ; preds = %for.cond29
  %tmp48 = load i32** %l_9, align 8
  %tmp49 = load i32* %tmp48
  %conv50 = trunc i32 %tmp49 to i8
  store i8 %conv50, i8* %retval
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  store i32 -409933724, i32* %l_12, align 4
  %tmp52 = load i32* %l_12, align 4
  %conv53 = trunc i32 %tmp52 to i8
  store i8 %conv53, i8* %retval
  br label %return

return:                                           ; preds = %if.else, %for.end47, %for.body38
  %0 = load i8* %retval
  ret i8 %0
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

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
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
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 7), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = volatile load i32* getelementptr inbounds ([8 x i32]* @g_4, i32 0, i64 5), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* @g_10, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %tmp18)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
