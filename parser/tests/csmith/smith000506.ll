; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000506.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 966279603, align 4
@g_6 = global i32 7, align 4
@g_7 = global i32 -10, align 4
@g_8 = global i32 1013135427, align 4
@g_9 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_5 = alloca [8 x [7 x [1 x [1 x [1 x i8]]]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %l_10 = alloca i32, align 4
  %i53 = alloca i32, align 4
  %j55 = alloca i32, align 4
  %k57 = alloca i32, align 4
  %l59 = alloca i32, align 4
  %m61 = alloca i32, align 4
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
  %cmp3 = icmp slt i32 %tmp2, 7
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
  %cmp15 = icmp slt i32 %tmp14, 1
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
  %arrayidx = getelementptr inbounds [8 x [7 x [1 x [1 x [1 x i8]]]]]* %l_5, i32 0, i64 %idxprom25
  %arrayidx26 = getelementptr inbounds [7 x [1 x [1 x [1 x i8]]]]* %arrayidx, i32 0, i64 %idxprom23
  %arrayidx27 = getelementptr inbounds [1 x [1 x [1 x i8]]]* %arrayidx26, i32 0, i64 %idxprom21
  %arrayidx28 = getelementptr inbounds [1 x [1 x i8]]* %arrayidx27, i32 0, i64 %idxprom19
  %arrayidx29 = getelementptr inbounds [1 x i8]* %arrayidx28, i32 0, i64 %idxprom
  store i8 20, i8* %arrayidx29, align 1
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
  store i32 0, i32* @g_2, align 4
  br label %for.cond47

for.cond47:                                       ; preds = %for.inc102, %for.end46
  %tmp48 = load i32* @g_2, align 4
  %cmp49 = icmp sge i32 %tmp48, -28
  br i1 %cmp49, label %for.body50, label %for.end106

for.body50:                                       ; preds = %for.cond47
  store i32 700532303, i32* %l_10, align 4
  store i32 7, i32* @g_2, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc98, %for.body50
  %tmp63 = load i32* @g_2, align 4
  %cmp64 = icmp sge i32 %tmp63, 0
  br i1 %cmp64, label %for.body65, label %for.end101

for.body65:                                       ; preds = %for.cond62
  store i32 2, i32* @g_6, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc94, %for.body65
  %tmp67 = load i32* @g_6, align 4
  %cmp68 = icmp slt i32 %tmp67, 7
  br i1 %cmp68, label %for.body69, label %for.end97

for.body69:                                       ; preds = %for.cond66
  store i32 0, i32* @g_7, align 4
  br label %for.cond70

for.cond70:                                       ; preds = %for.inc90, %for.body69
  %tmp71 = load i32* @g_7, align 4
  %cmp72 = icmp slt i32 %tmp71, 1
  br i1 %cmp72, label %for.body73, label %for.end93

for.body73:                                       ; preds = %for.cond70
  volatile store i32 0, i32* @g_8, align 4
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc86, %for.body73
  %tmp75 = volatile load i32* @g_8, align 4
  %cmp76 = icmp slt i32 %tmp75, 1
  br i1 %cmp76, label %for.body77, label %for.end89

for.body77:                                       ; preds = %for.cond74
  volatile store i32 0, i32* @g_9, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc83, %for.body77
  %tmp79 = volatile load i32* @g_9, align 4
  %cmp80 = icmp slt i32 %tmp79, 1
  br i1 %cmp80, label %for.body81, label %for.end85

for.body81:                                       ; preds = %for.cond78
  %tmp82 = load i32* %l_10, align 4
  %conv = trunc i32 %tmp82 to i16
  store i16 %conv, i16* %retval
  br label %return

for.inc83:                                        ; No predecessors!
  %tmp84 = volatile load i32* @g_9, align 4
  %add = add nsw i32 %tmp84, 1
  volatile store i32 %add, i32* @g_9, align 4
  br label %for.cond78

for.end85:                                        ; preds = %for.cond78
  br label %for.inc86

for.inc86:                                        ; preds = %for.end85
  %tmp87 = volatile load i32* @g_8, align 4
  %add88 = add nsw i32 %tmp87, 1
  volatile store i32 %add88, i32* @g_8, align 4
  br label %for.cond74

for.end89:                                        ; preds = %for.cond74
  br label %for.inc90

for.inc90:                                        ; preds = %for.end89
  %tmp91 = load i32* @g_7, align 4
  %add92 = add nsw i32 %tmp91, 1
  store i32 %add92, i32* @g_7, align 4
  br label %for.cond70

for.end93:                                        ; preds = %for.cond70
  br label %for.inc94

for.inc94:                                        ; preds = %for.end93
  %tmp95 = load i32* @g_6, align 4
  %add96 = add nsw i32 %tmp95, 3
  store i32 %add96, i32* @g_6, align 4
  br label %for.cond66

for.end97:                                        ; preds = %for.cond66
  br label %for.inc98

for.inc98:                                        ; preds = %for.end97
  %tmp99 = load i32* @g_2, align 4
  %add100 = add nsw i32 %tmp99, -5
  store i32 %add100, i32* @g_2, align 4
  br label %for.cond62

for.end101:                                       ; preds = %for.cond62
  br label %for.inc102

for.inc102:                                       ; preds = %for.end101
  %tmp103 = load i32* @g_2, align 4
  %conv104 = trunc i32 %tmp103 to i8
  %call = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv104, i8 signext 4)
  %conv105 = sext i8 %call to i32
  store i32 %conv105, i32* @g_2, align 4
  br label %for.cond47

for.end106:                                       ; preds = %for.cond47
  %arrayidx107 = getelementptr inbounds [8 x [7 x [1 x [1 x [1 x i8]]]]]* %l_5, i32 0, i64 2
  %arrayidx108 = getelementptr inbounds [7 x [1 x [1 x [1 x i8]]]]* %arrayidx107, i32 0, i64 6
  %arrayidx109 = getelementptr inbounds [1 x [1 x [1 x i8]]]* %arrayidx108, i32 0, i64 0
  %arrayidx110 = getelementptr inbounds [1 x [1 x i8]]* %arrayidx109, i32 0, i64 0
  %arrayidx111 = getelementptr inbounds [1 x i8]* %arrayidx110, i32 0, i64 0
  %tmp112 = load i8* %arrayidx111, align 1
  %conv113 = sext i8 %tmp112 to i32
  %tobool = icmp ne i32 %conv113, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end106
  %tmp114 = load i32* @g_7, align 4
  %conv115 = sext i32 %tmp114 to i64
  %or = or i64 885548468, %conv115
  %tobool116 = icmp ne i64 %or, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end106
  %0 = phi i1 [ true, %for.end106 ], [ %tobool116, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  volatile store i32 %lor.ext, i32* @g_9, align 4
  %tmp117 = load i32* @g_2, align 4
  %conv118 = trunc i32 %tmp117 to i16
  store i16 %conv118, i16* %retval
  br label %return

return:                                           ; preds = %lor.end, %for.body81
  %1 = load i16* %retval
  ret i16 %1
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_7, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* @g_8, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* @g_9, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
