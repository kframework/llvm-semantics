; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001241.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_5 = alloca [6 x [7 x i8]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
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
  %cmp3 = icmp slt i32 %tmp2, 7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [6 x [7 x i8]]* %l_5, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [7 x i8]* %arrayidx, i32 0, i64 %idxprom
  store i8 0, i8* %arrayidx8, align 1
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
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc21, %for.end13
  %tmp15 = volatile load i32* @g_2, align 4
  %cmp16 = icmp sge i32 %tmp15, 0
  br i1 %cmp16, label %for.body17, label %for.end23

for.body17:                                       ; preds = %for.cond14
  %arrayidx18 = getelementptr inbounds [6 x [7 x i8]]* %l_5, i32 0, i64 1
  %arrayidx19 = getelementptr inbounds [7 x i8]* %arrayidx18, i32 0, i64 3
  %tmp20 = load i8* %arrayidx19, align 1
  %conv = sext i8 %tmp20 to i16
  store i16 %conv, i16* %retval
  br label %return

for.inc21:                                        ; No predecessors!
  %tmp22 = volatile load i32* @g_2, align 4
  %call = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp22, i32 1)
  volatile store i32 %call, i32* @g_2, align 4
  br label %for.cond14

for.end23:                                        ; preds = %for.cond14
  %arrayidx24 = getelementptr inbounds [6 x [7 x i8]]* %l_5, i32 0, i64 1
  %arrayidx25 = getelementptr inbounds [7 x i8]* %arrayidx24, i32 0, i64 3
  %tmp26 = load i8* %arrayidx25, align 1
  %conv27 = sext i8 %tmp26 to i16
  store i16 %conv27, i16* %retval
  br label %return

return:                                           ; preds = %for.end23, %for.body17
  %0 = load i16* %retval
  ret i16 %0
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
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
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
