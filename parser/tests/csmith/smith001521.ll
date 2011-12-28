; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001521.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [4 x i32] [i32 -1638421099, i32 -1638421099, i32 -1638421099, i32 -1638421099], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_5 = alloca i32, align 4
  %l_6 = alloca [5 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_11 = alloca i8, align 1
  store i32 4, i32* %l_5, align 4
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
  %cmp3 = icmp slt i32 %tmp2, 10
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [10 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 -2052499604, i32* %arrayidx8, align 4
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
  store i32 0, i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc21, %for.end13
  %tmp15 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %cmp16 = icmp eq i32 %tmp15, 0
  br i1 %cmp16, label %for.body17, label %for.end24

for.body17:                                       ; preds = %for.cond14
  %tmp18 = load i32* %l_5, align 4
  %arrayidx19 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 2
  %arrayidx20 = getelementptr inbounds [10 x i32]* %arrayidx19, i32 0, i64 6
  store i32 %tmp18, i32* %arrayidx20, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.body17
  %tmp22 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %conv = sext i32 %tmp22 to i64
  %call = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv, i64 3)
  %conv23 = trunc i64 %call to i32
  store i32 %conv23, i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  br label %for.cond14

for.end24:                                        ; preds = %for.cond14
  store i32 0, i32* %l_5, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc48, %for.end24
  %tmp26 = load i32* %l_5, align 4
  %cmp27 = icmp ne i32 %tmp26, 0
  br i1 %cmp27, label %for.body29, label %for.end53

for.body29:                                       ; preds = %for.cond25
  %arrayidx30 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 2
  %arrayidx31 = getelementptr inbounds [10 x i32]* %arrayidx30, i32 0, i64 6
  %tmp32 = load i32* %arrayidx31, align 4
  %tobool = icmp ne i32 %tmp32, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body29
  br label %for.end53

if.end:                                           ; preds = %for.body29
  store i32 21, i32* %l_5, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc42, %if.end
  %tmp34 = load i32* %l_5, align 4
  %cmp35 = icmp ule i32 %tmp34, 0
  br i1 %cmp35, label %for.body37, label %for.end47

for.body37:                                       ; preds = %for.cond33
  store i8 1, i8* %l_11, align 1
  %tmp39 = load i8* %l_11, align 1
  %conv40 = sext i8 %tmp39 to i32
  store i32 %conv40, i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 2), align 4
  %tmp41 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  store i32 %tmp41, i32* %retval
  br label %return

for.inc42:                                        ; No predecessors!
  %tmp43 = load i32* %l_5, align 4
  %conv44 = zext i32 %tmp43 to i64
  %call45 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv44, i64 5)
  %conv46 = trunc i64 %call45 to i32
  store i32 %conv46, i32* %l_5, align 4
  br label %for.cond33

for.end47:                                        ; preds = %for.cond33
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47
  %tmp49 = load i32* %l_5, align 4
  %conv50 = zext i32 %tmp49 to i64
  %call51 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv50, i64 7)
  %conv52 = trunc i64 %call51 to i32
  store i32 %conv52, i32* %l_5, align 4
  br label %for.cond25

for.end53:                                        ; preds = %if.then, %for.cond25
  %arrayidx54 = getelementptr inbounds [5 x [10 x i32]]* %l_6, i32 0, i64 0
  %arrayidx55 = getelementptr inbounds [10 x i32]* %arrayidx54, i32 0, i64 3
  %tmp56 = load i32* %arrayidx55, align 4
  store i32 %tmp56, i32* %retval
  br label %return

return:                                           ; preds = %for.end53, %for.body37
  %0 = load i32* %retval
  ret i32 %0
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %tmp, %tmp1
  ret i64 %sub
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
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
  %tmp = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([4 x i32]* @g_2, i32 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp8)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
