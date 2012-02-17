; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000415.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1801280268, align 4
@g_3 = constant [8 x [4 x i32*]] [[4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4], [4 x i32*] [i32* @g_4, i32* @g_4, i32* @g_4, i32* @g_4]], align 16
@g_5 = global i32* null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [2 x [9 x i64]], align 16
  %l_6 = alloca i32*, align 8
  %l_7 = alloca i32**, align 8
  %l_8 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* @g_4, i32** %l_6, align 8
  store i32** null, i32*** %l_7, align 8
  store i32** %l_6, i32*** %l_8, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 9
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [2 x [9 x i64]]* %l_2, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [9 x i64]* %arrayidx, i32 0, i64 %idxprom
  store i64 8492922746153012301, i64* %arrayidx8, align 8
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
  %arrayidx14 = getelementptr inbounds [2 x [9 x i64]]* %l_2, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [9 x i64]* %arrayidx14, i32 0, i64 6
  %tmp16 = load i64* %arrayidx15, align 8
  %tmp17 = load i32** %l_6, align 8
  %tmp18 = load i32* %tmp17
  %conv = sext i32 %tmp18 to i64
  %and = and i64 %conv, %tmp16
  %conv19 = trunc i64 %and to i32
  store i32 %conv19, i32* %tmp17
  %tmp20 = load i32** %l_6, align 8
  %tmp21 = load i32*** %l_8, align 8
  store i32* %tmp20, i32** %tmp21
  %call = call i32 @safe_unary_minus_func_uint32_t_u(i32 2051796428)
  %tmp22 = load i32** %l_6, align 8
  %tmp23 = load i32* %tmp22
  %or = or i32 %tmp23, %call
  store i32 %or, i32* %tmp22
  %tmp24 = load i32* @g_4, align 4
  %conv25 = sext i32 %tmp24 to i64
  ret i64 %conv25
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i32, align 4
  store i32 %ui, i32* %ui.addr, align 4
  %tmp = load i32* %ui.addr, align 4
  %sub = sub i32 0, %tmp
  ret i32 %sub
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
  %call = call i64 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
