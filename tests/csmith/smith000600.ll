; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000600.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 560462428, align 4
@g_6 = global i32 1, align 4
@g_9 = global [6 x i32] [i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2], align 16
@g_8 = global i32* bitcast (i8* getelementptr (i8* bitcast ([6 x i32]* @g_9 to i8*), i64 12) to i32*), align 8
@g_7 = global i32** @g_8, align 8
@g_14 = global i32* @g_6, align 8
@g_13 = global i32** @g_14, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_9[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_9[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_9[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_9[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_9[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_9[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_12 = alloca i32, align 4
  store i32 1000475541, i32* %l_12, align 4
  %call = call i32* @func_2(i64 1000475541)
  %tmp = volatile load i32*** @g_13, align 8
  store i32* %call, i32** %tmp
  ret i32 1000475541
}

define i32* @func_2(i64 %p_3) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %p_3.addr = alloca i64, align 8
  %l_4 = alloca [7 x [3 x i32]], align 16
  %l_10 = alloca i32***, align 8
  %l_11 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 %p_3, i64* %p_3.addr, align 8
  store i32*** @g_7, i32**** %l_10, align 8
  store i32* null, i32** %l_11, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 3
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [7 x [3 x i32]]* %l_4, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [3 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 2082486656, i32* %arrayidx8, align 4
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
  store i32 6, i32* @g_5, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc25, %for.end13
  %tmp15 = load i32* @g_5, align 4
  %cmp16 = icmp sge i32 %tmp15, 0
  br i1 %cmp16, label %for.body17, label %for.end28

for.body17:                                       ; preds = %for.cond14
  store i32 0, i32* @g_6, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc22, %for.body17
  %tmp19 = load i32* @g_6, align 4
  %cmp20 = icmp slt i32 %tmp19, 3
  br i1 %cmp20, label %for.body21, label %for.end24

for.body21:                                       ; preds = %for.cond18
  store i32* @g_6, i32** %retval
  br label %return

for.inc22:                                        ; No predecessors!
  %tmp23 = load i32* @g_6, align 4
  %add = add nsw i32 %tmp23, 1
  store i32 %add, i32* @g_6, align 4
  br label %for.cond18

for.end24:                                        ; preds = %for.cond18
  br label %for.inc25

for.inc25:                                        ; preds = %for.end24
  %tmp26 = load i32* @g_5, align 4
  %add27 = add nsw i32 %tmp26, -3
  store i32 %add27, i32* @g_5, align 4
  br label %for.cond14

for.end28:                                        ; preds = %for.cond14
  %tmp29 = load i32*** @g_7, align 8
  %tmp30 = load i32**** %l_10, align 8
  store i32** %tmp29, i32*** %tmp30
  %tmp31 = load i32** %l_11, align 8
  store i32* %tmp31, i32** %retval
  br label %return

return:                                           ; preds = %for.end28, %for.body21
  %0 = load i32** %retval
  ret i32* %0
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
  %call = call i32 @func_1()
  %tmp = load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 4), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_9, i32 0, i64 3), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp16)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
