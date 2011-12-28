; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001655.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1460061947, align 4
@g_10 = global [1 x [1 x i32*]] [[1 x i32*] [i32* @g_3]], align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [6 x i32*], align 16
  %l_9 = alloca [6 x [10 x [1 x [1 x [1 x i32]]]]], align 16
  %l_11 = alloca [1 x [9 x i32**]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [6 x i32*]* %l_2, i32 0, i64 %idxprom
  store i32* @g_3, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc54, %for.end
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 6
  br i1 %cmp5, label %for.body6, label %for.end57

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc50, %for.body6
  %tmp8 = load i32* %j, align 4
  %cmp9 = icmp slt i32 %tmp8, 10
  br i1 %cmp9, label %for.body10, label %for.end53

for.body10:                                       ; preds = %for.cond7
  store i32 0, i32* %k, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc46, %for.body10
  %tmp12 = load i32* %k, align 4
  %cmp13 = icmp slt i32 %tmp12, 1
  br i1 %cmp13, label %for.body14, label %for.end49

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %l, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc42, %for.body14
  %tmp16 = load i32* %l, align 4
  %cmp17 = icmp slt i32 %tmp16, 1
  br i1 %cmp17, label %for.body18, label %for.end45

for.body18:                                       ; preds = %for.cond15
  store i32 0, i32* %m, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc38, %for.body18
  %tmp20 = load i32* %m, align 4
  %cmp21 = icmp slt i32 %tmp20, 1
  br i1 %cmp21, label %for.body22, label %for.end41

for.body22:                                       ; preds = %for.cond19
  %tmp23 = load i32* %m, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %tmp25 = load i32* %l, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %tmp27 = load i32* %k, align 4
  %idxprom28 = sext i32 %tmp27 to i64
  %tmp29 = load i32* %j, align 4
  %idxprom30 = sext i32 %tmp29 to i64
  %tmp31 = load i32* %i, align 4
  %idxprom32 = sext i32 %tmp31 to i64
  %arrayidx33 = getelementptr inbounds [6 x [10 x [1 x [1 x [1 x i32]]]]]* %l_9, i32 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [10 x [1 x [1 x [1 x i32]]]]* %arrayidx33, i32 0, i64 %idxprom30
  %arrayidx35 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %arrayidx34, i32 0, i64 %idxprom28
  %arrayidx36 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx35, i32 0, i64 %idxprom26
  %arrayidx37 = getelementptr inbounds [1 x i32]* %arrayidx36, i32 0, i64 %idxprom24
  store i32 6897299, i32* %arrayidx37, align 4
  br label %for.inc38

for.inc38:                                        ; preds = %for.body22
  %tmp39 = load i32* %m, align 4
  %inc40 = add nsw i32 %tmp39, 1
  store i32 %inc40, i32* %m, align 4
  br label %for.cond19

for.end41:                                        ; preds = %for.cond19
  br label %for.inc42

for.inc42:                                        ; preds = %for.end41
  %tmp43 = load i32* %l, align 4
  %inc44 = add nsw i32 %tmp43, 1
  store i32 %inc44, i32* %l, align 4
  br label %for.cond15

for.end45:                                        ; preds = %for.cond15
  br label %for.inc46

for.inc46:                                        ; preds = %for.end45
  %tmp47 = load i32* %k, align 4
  %inc48 = add nsw i32 %tmp47, 1
  store i32 %inc48, i32* %k, align 4
  br label %for.cond11

for.end49:                                        ; preds = %for.cond11
  br label %for.inc50

for.inc50:                                        ; preds = %for.end49
  %tmp51 = load i32* %j, align 4
  %inc52 = add nsw i32 %tmp51, 1
  store i32 %inc52, i32* %j, align 4
  br label %for.cond7

for.end53:                                        ; preds = %for.cond7
  br label %for.inc54

for.inc54:                                        ; preds = %for.end53
  %tmp55 = load i32* %i, align 4
  %inc56 = add nsw i32 %tmp55, 1
  store i32 %inc56, i32* %i, align 4
  br label %for.cond3

for.end57:                                        ; preds = %for.cond3
  store i32 0, i32* %i, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc77, %for.end57
  %tmp59 = load i32* %i, align 4
  %cmp60 = icmp slt i32 %tmp59, 1
  br i1 %cmp60, label %for.body61, label %for.end80

for.body61:                                       ; preds = %for.cond58
  store i32 0, i32* %j, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc73, %for.body61
  %tmp63 = load i32* %j, align 4
  %cmp64 = icmp slt i32 %tmp63, 9
  br i1 %cmp64, label %for.body65, label %for.end76

for.body65:                                       ; preds = %for.cond62
  %arrayidx66 = getelementptr inbounds [6 x i32*]* %l_2, i32 0, i64 0
  %tmp67 = load i32* %j, align 4
  %idxprom68 = sext i32 %tmp67 to i64
  %tmp69 = load i32* %i, align 4
  %idxprom70 = sext i32 %tmp69 to i64
  %arrayidx71 = getelementptr inbounds [1 x [9 x i32**]]* %l_11, i32 0, i64 %idxprom70
  %arrayidx72 = getelementptr inbounds [9 x i32**]* %arrayidx71, i32 0, i64 %idxprom68
  store i32** %arrayidx66, i32*** %arrayidx72, align 8
  br label %for.inc73

for.inc73:                                        ; preds = %for.body65
  %tmp74 = load i32* %j, align 4
  %inc75 = add nsw i32 %tmp74, 1
  store i32 %inc75, i32* %j, align 4
  br label %for.cond62

for.end76:                                        ; preds = %for.cond62
  br label %for.inc77

for.inc77:                                        ; preds = %for.end76
  %tmp78 = load i32* %i, align 4
  %inc79 = add nsw i32 %tmp78, 1
  store i32 %inc79, i32* %i, align 4
  br label %for.cond58

for.end80:                                        ; preds = %for.cond58
  store i32 -1, i32* @g_3, align 4
  %tmp81 = load i32* @g_3, align 4
  %conv = trunc i32 %tmp81 to i16
  %arrayidx82 = getelementptr inbounds [6 x [10 x [1 x [1 x [1 x i32]]]]]* %l_9, i32 0, i64 1
  %arrayidx83 = getelementptr inbounds [10 x [1 x [1 x [1 x i32]]]]* %arrayidx82, i32 0, i64 7
  %arrayidx84 = getelementptr inbounds [1 x [1 x [1 x i32]]]* %arrayidx83, i32 0, i64 0
  %arrayidx85 = getelementptr inbounds [1 x [1 x i32]]* %arrayidx84, i32 0, i64 0
  %arrayidx86 = getelementptr inbounds [1 x i32]* %arrayidx85, i32 0, i64 0
  %tmp87 = load i32* %arrayidx86, align 4
  %tmp88 = load i32** getelementptr inbounds ([1 x [1 x i32*]]* @g_10, i32 0, i64 0, i64 0), align 8
  %call = call i32* @func_4(i16 zeroext %conv, i32 %tmp87, i32* %tmp88)
  store i32* %call, i32** getelementptr inbounds ([1 x [1 x i32*]]* @g_10, i32 0, i64 0, i64 0), align 8
  %tmp89 = load i32* @g_3, align 4
  %conv90 = trunc i32 %tmp89 to i8
  ret i8 %conv90
}

define i32* @func_4(i16 zeroext %p_5, i32 %p_6, i32* %p_7) nounwind uwtable {
entry:
  %p_5.addr = alloca i16, align 2
  %p_6.addr = alloca i32, align 4
  %p_7.addr = alloca i32*, align 8
  %l_8 = alloca i32*, align 8
  store i16 %p_5, i16* %p_5.addr, align 2
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32* %p_7, i32** %p_7.addr, align 8
  store i32* @g_3, i32** %l_8, align 8
  %tmp = load i32** %l_8, align 8
  ret i32* %tmp
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
  %call = call signext i8 @func_1()
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
