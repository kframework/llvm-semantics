; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001306.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 850513611, align 4
@g_4 = global i32 756326379, align 4
@g_6 = global i32 -2125761732, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [6 x [5 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 5
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [6 x [5 x i32]]* %l_2, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [5 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 -2078589847, i32* %arrayidx8, align 4
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
  store i32 1, i32* @g_3, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc29, %for.end13
  %tmp15 = load i32* @g_3, align 4
  %cmp16 = icmp slt i32 %tmp15, 6
  br i1 %cmp16, label %for.body17, label %for.end32

for.body17:                                       ; preds = %for.cond14
  volatile store i32 1, i32* @g_4, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc26, %for.body17
  %tmp19 = volatile load i32* @g_4, align 4
  %cmp20 = icmp slt i32 %tmp19, 5
  br i1 %cmp20, label %for.body21, label %for.end28

for.body21:                                       ; preds = %for.cond18
  store i32* @g_6, i32** %l_5, align 8
  %tmp23 = volatile load i32* @g_4, align 4
  %tmp24 = load i32** %l_5, align 8
  %tmp25 = load i32* %tmp24
  %or = or i32 %tmp25, %tmp23
  store i32 %or, i32* %tmp24
  br label %for.inc26

for.inc26:                                        ; preds = %for.body21
  %tmp27 = volatile load i32* @g_4, align 4
  %add = add nsw i32 %tmp27, 2
  volatile store i32 %add, i32* @g_4, align 4
  br label %for.cond18

for.end28:                                        ; preds = %for.cond18
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %tmp30 = load i32* @g_3, align 4
  %add31 = add nsw i32 %tmp30, 2
  store i32 %add31, i32* @g_3, align 4
  br label %for.cond14

for.end32:                                        ; preds = %for.cond14
  %tmp33 = load i32* @g_3, align 4
  ret i32 %tmp33
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
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_6, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
