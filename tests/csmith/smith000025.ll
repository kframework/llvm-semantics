; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000025.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], align 16
@g_7 = global i32 1572032109, align 4
@g_13 = constant [6 x i32*] [i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7, i32* @g_7], align 16
@g_14 = global [1 x i32*] zeroinitializer, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_12 = alloca i64, align 8
  %l_18 = alloca i32*, align 8
  %l_17 = alloca [8 x [2 x [1 x [1 x [5 x i32**]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  %l_5 = alloca i32**, align 8
  %l_16 = alloca i32, align 4
  %l_15 = alloca [6 x [7 x i32*]], align 16
  %i61 = alloca i32, align 4
  %j63 = alloca i32, align 4
  store i64 0, i64* %l_12, align 8
  store i32* @g_7, i32** %l_18, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end46

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc39, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 2
  br i1 %cmp3, label %for.body4, label %for.end42

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc35, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end38

for.body8:                                        ; preds = %for.cond5
  store i32 0, i32* %l, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc31, %for.body8
  %tmp10 = load i32* %l, align 4
  %cmp11 = icmp slt i32 %tmp10, 1
  br i1 %cmp11, label %for.body12, label %for.end34

for.body12:                                       ; preds = %for.cond9
  store i32 0, i32* %m, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body12
  %tmp14 = load i32* %m, align 4
  %cmp15 = icmp slt i32 %tmp14, 5
  br i1 %cmp15, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond13
  %tmp17 = load i32* %m, align 4
  %idxprom = sext i32 %tmp17 to i64
  %tmp18 = load i32* %l, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %tmp20 = load i32* %k, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %tmp22 = load i32* %j, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %tmp24 = load i32* %i, align 4
  %idxprom25 = sext i32 %tmp24 to i64
  %arrayidx = getelementptr inbounds [8 x [2 x [1 x [1 x [5 x i32**]]]]]* %l_17, i32 0, i64 %idxprom25
  %arrayidx26 = getelementptr inbounds [2 x [1 x [1 x [5 x i32**]]]]* %arrayidx, i32 0, i64 %idxprom23
  %arrayidx27 = getelementptr inbounds [1 x [1 x [5 x i32**]]]* %arrayidx26, i32 0, i64 %idxprom21
  %arrayidx28 = getelementptr inbounds [1 x [5 x i32**]]* %arrayidx27, i32 0, i64 %idxprom19
  %arrayidx29 = getelementptr inbounds [5 x i32**]* %arrayidx28, i32 0, i64 %idxprom
  store i32** %l_18, i32*** %arrayidx29, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body16
  %tmp30 = load i32* %m, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %m, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  br label %for.inc31

for.inc31:                                        ; preds = %for.end
  %tmp32 = load i32* %l, align 4
  %inc33 = add nsw i32 %tmp32, 1
  store i32 %inc33, i32* %l, align 4
  br label %for.cond9

for.end34:                                        ; preds = %for.cond9
  br label %for.inc35

for.inc35:                                        ; preds = %for.end34
  %tmp36 = load i32* %k, align 4
  %inc37 = add nsw i32 %tmp36, 1
  store i32 %inc37, i32* %k, align 4
  br label %for.cond5

for.end38:                                        ; preds = %for.cond5
  br label %for.inc39

for.inc39:                                        ; preds = %for.end38
  %tmp40 = load i32* %j, align 4
  %inc41 = add nsw i32 %tmp40, 1
  store i32 %inc41, i32* %j, align 4
  br label %for.cond1

for.end42:                                        ; preds = %for.cond1
  br label %for.inc43

for.inc43:                                        ; preds = %for.end42
  %tmp44 = load i32* %i, align 4
  %inc45 = add nsw i32 %tmp44, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond

for.end46:                                        ; preds = %for.cond
  volatile store i32 0, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  br label %for.cond47

for.cond47:                                       ; preds = %for.inc94, %for.end46
  %tmp48 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %cmp49 = icmp sge i32 %tmp48, 29
  br i1 %cmp49, label %for.body50, label %for.end99

for.body50:                                       ; preds = %for.cond47
  store i32* @g_7, i32** %l_6, align 8
  store i32** %l_6, i32*** %l_5, align 8
  store i32 -3, i32* %l_16, align 4
  %tmp54 = load i32*** %l_5, align 8
  store i32* null, i32** %tmp54
  store i32 5, i32* @g_7, align 4
  br label %for.cond55

for.cond55:                                       ; preds = %for.inc88, %for.body50
  %tmp56 = load i32* @g_7, align 4
  %cmp57 = icmp slt i32 %tmp56, 25
  br i1 %cmp57, label %for.body58, label %for.end93

for.body58:                                       ; preds = %for.cond55
  store i32 0, i32* %i61, align 4
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc82, %for.body58
  %tmp65 = load i32* %i61, align 4
  %cmp66 = icmp slt i32 %tmp65, 6
  br i1 %cmp66, label %for.body67, label %for.end85

for.body67:                                       ; preds = %for.cond64
  store i32 0, i32* %j63, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc78, %for.body67
  %tmp69 = load i32* %j63, align 4
  %cmp70 = icmp slt i32 %tmp69, 7
  br i1 %cmp70, label %for.body71, label %for.end81

for.body71:                                       ; preds = %for.cond68
  %tmp72 = load i32* %j63, align 4
  %idxprom73 = sext i32 %tmp72 to i64
  %tmp74 = load i32* %i61, align 4
  %idxprom75 = sext i32 %tmp74 to i64
  %arrayidx76 = getelementptr inbounds [6 x [7 x i32*]]* %l_15, i32 0, i64 %idxprom75
  %arrayidx77 = getelementptr inbounds [7 x i32*]* %arrayidx76, i32 0, i64 %idxprom73
  store i32* @g_7, i32** %arrayidx77, align 8
  br label %for.inc78

for.inc78:                                        ; preds = %for.body71
  %tmp79 = load i32* %j63, align 4
  %inc80 = add nsw i32 %tmp79, 1
  store i32 %inc80, i32* %j63, align 4
  br label %for.cond68

for.end81:                                        ; preds = %for.cond68
  br label %for.inc82

for.inc82:                                        ; preds = %for.end81
  %tmp83 = load i32* %i61, align 4
  %inc84 = add nsw i32 %tmp83, 1
  store i32 %inc84, i32* %i61, align 4
  br label %for.cond64

for.end85:                                        ; preds = %for.cond64
  %tmp86 = load i32* @g_7, align 4
  %conv = trunc i32 %tmp86 to i16
  %call = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv, i32 0)
  %conv87 = sext i16 %call to i32
  store i32 %conv87, i32* %l_16, align 4
  br label %for.inc88

for.inc88:                                        ; preds = %for.end85
  %tmp89 = load i32* @g_7, align 4
  %conv90 = trunc i32 %tmp89 to i16
  %call91 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv90, i16 signext 2)
  %conv92 = sext i16 %call91 to i32
  store i32 %conv92, i32* @g_7, align 4
  br label %for.cond55

for.end93:                                        ; preds = %for.cond55
  br label %for.inc94

for.inc94:                                        ; preds = %for.end93
  %tmp95 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %conv96 = trunc i32 %tmp95 to i16
  %call97 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv96, i16 signext 1)
  %conv98 = sext i16 %call97 to i32
  volatile store i32 %conv98, i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  br label %for.cond47

for.end99:                                        ; preds = %for.cond47
  volatile store i32* @g_7, i32** getelementptr inbounds ([1 x i32*]* @g_14, i32 0, i64 0), align 8
  %tmp100 = load i32* @g_7, align 4
  %conv101 = sext i32 %tmp100 to i64
  ret i64 %conv101
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

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
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
  %call = call i64 @func_1()
  %tmp = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([5 x i32]* @g_2, i32 0, i64 4), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* @g_7, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str5, i32 0, i32 0), i32 %tmp12)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
