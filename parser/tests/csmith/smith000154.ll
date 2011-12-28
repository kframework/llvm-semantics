; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000154.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 -1646701846, align 4
@g_4 = global i32 1179588335, align 4
@g_5 = global i32 -7, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_2 = alloca [1 x [5 x [6 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 5
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 6
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [1 x [5 x [6 x i32]]]* %l_2, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [5 x [6 x i32]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [6 x i32]* %arrayidx14, i32 0, i64 %idxprom
  store i32 864301126, i32* %arrayidx15, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp16 = load i32* %k, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %tmp18 = load i32* %j, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond1

for.end20:                                        ; preds = %for.cond1
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  volatile store i32 0, i32* @g_3, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc45, %for.end24
  %tmp26 = volatile load i32* @g_3, align 4
  %cmp27 = icmp slt i32 %tmp26, 1
  br i1 %cmp27, label %for.body28, label %for.end48

for.body28:                                       ; preds = %for.cond25
  volatile store i32 2, i32* @g_4, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc41, %for.body28
  %tmp30 = volatile load i32* @g_4, align 4
  %cmp31 = icmp slt i32 %tmp30, 5
  br i1 %cmp31, label %for.body32, label %for.end44

for.body32:                                       ; preds = %for.cond29
  volatile store i32 5, i32* @g_5, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc38, %for.body32
  %tmp34 = volatile load i32* @g_5, align 4
  %cmp35 = icmp sge i32 %tmp34, 0
  br i1 %cmp35, label %for.body36, label %for.end40

for.body36:                                       ; preds = %for.cond33
  %tmp37 = volatile load i32* @g_3, align 4
  %conv = sext i32 %tmp37 to i64
  store i64 %conv, i64* %retval
  br label %return

for.inc38:                                        ; No predecessors!
  %tmp39 = volatile load i32* @g_5, align 4
  %add = add nsw i32 %tmp39, -1
  volatile store i32 %add, i32* @g_5, align 4
  br label %for.cond33

for.end40:                                        ; preds = %for.cond33
  br label %for.inc41

for.inc41:                                        ; preds = %for.end40
  %tmp42 = volatile load i32* @g_4, align 4
  %add43 = add nsw i32 %tmp42, 5
  volatile store i32 %add43, i32* @g_4, align 4
  br label %for.cond29

for.end44:                                        ; preds = %for.cond29
  br label %for.inc45

for.inc45:                                        ; preds = %for.end44
  %tmp46 = volatile load i32* @g_3, align 4
  %add47 = add nsw i32 %tmp46, 1
  volatile store i32 %add47, i32* @g_3, align 4
  br label %for.cond25

for.end48:                                        ; preds = %for.cond25
  %tmp49 = volatile load i32* @g_4, align 4
  %conv50 = sext i32 %tmp49 to i64
  store i64 %conv50, i64* %retval
  br label %return

return:                                           ; preds = %for.end48, %for.body36
  %0 = load i64* %retval
  ret i64 %0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = volatile load i32* @g_4, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = volatile load i32* @g_5, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
