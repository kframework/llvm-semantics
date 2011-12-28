; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000443.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32* @g_3, align 8
@g_4 = global [1 x [7 x i32**]] [[7 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5]], align 16
@g_6 = global [8 x [6 x i32**]] [[6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5], [6 x i32**] [i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5, i32** @g_5]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [9 x [3 x [1 x [1 x [1 x i32*]]]]], align 16
  %l_7 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i32** @g_5, i32*** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end46

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc39, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 3
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
  %arrayidx = getelementptr inbounds [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2, i32 0, i64 %idxprom25
  %arrayidx26 = getelementptr inbounds [3 x [1 x [1 x [1 x i32*]]]]* %arrayidx, i32 0, i64 %idxprom23
  %arrayidx27 = getelementptr inbounds [1 x [1 x [1 x i32*]]]* %arrayidx26, i32 0, i64 %idxprom21
  %arrayidx28 = getelementptr inbounds [1 x [1 x i32*]]* %arrayidx27, i32 0, i64 %idxprom19
  %arrayidx29 = getelementptr inbounds [1 x i32*]* %arrayidx28, i32 0, i64 %idxprom
  store i32* @g_3, i32** %arrayidx29, align 8
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
  %arrayidx47 = getelementptr inbounds [9 x [3 x [1 x [1 x [1 x i32*]]]]]* %l_2, i32 0, i64 6
  %arrayidx48 = getelementptr inbounds [3 x [1 x [1 x [1 x i32*]]]]* %arrayidx47, i32 0, i64 2
  %arrayidx49 = getelementptr inbounds [1 x [1 x [1 x i32*]]]* %arrayidx48, i32 0, i64 0
  %arrayidx50 = getelementptr inbounds [1 x [1 x i32*]]* %arrayidx49, i32 0, i64 0
  %arrayidx51 = getelementptr inbounds [1 x i32*]* %arrayidx50, i32 0, i64 0
  %tmp52 = load i32** %arrayidx51, align 8
  %tmp53 = load i32*** %l_7, align 8
  store i32* %tmp52, i32** %tmp53
  %tmp54 = load i32* @g_3, align 4
  ret i32 %tmp54
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
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
