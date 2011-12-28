; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000338.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [9 x i16], align 16
  %l_4 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* @g_5, i32** %l_4, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [9 x i16]* %l_2, i32 0, i64 %idxprom
  store i16 -1, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [9 x i16]* %l_2, i32 0, i64 5
  %tmp4 = load i16* %arrayidx3, align 2
  %conv = sext i16 %tmp4 to i32
  %tmp5 = volatile load i32* @g_3, align 4
  %tobool = icmp ne i32 %tmp5, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %cmp6 = icmp sle i32 %conv, %lnot.ext
  %conv7 = zext i1 %cmp6 to i32
  %tmp8 = load i32** %l_4, align 8
  store i32 %conv7, i32* %tmp8
  store i32 0, i32* @g_5, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc17, %for.end
  %tmp10 = load i32* @g_5, align 4
  %cmp11 = icmp sle i32 %tmp10, 0
  br i1 %cmp11, label %for.body13, label %for.end21

for.body13:                                       ; preds = %for.cond9
  %tmp14 = load i32** %l_4, align 8
  %tmp15 = load i32* %tmp14
  %tobool16 = icmp ne i32 %tmp15, 0
  br i1 %tobool16, label %if.then, label %if.end

if.then:                                          ; preds = %for.body13
  br label %for.end21

if.end:                                           ; preds = %for.body13
  br label %for.inc17

for.inc17:                                        ; preds = %if.end
  %tmp18 = load i32* @g_5, align 4
  %conv19 = sext i32 %tmp18 to i64
  %call = call i64 @safe_sub_func_int64_t_s_s(i64 %conv19, i64 1)
  %conv20 = trunc i64 %call to i32
  store i32 %conv20, i32* @g_5, align 4
  br label %for.cond9

for.end21:                                        ; preds = %if.then, %for.cond9
  %tmp22 = load i32** %l_4, align 8
  %tmp23 = load i32* %tmp22
  %conv24 = trunc i32 %tmp23 to i8
  ret i8 %conv24
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %tmp1 = load i64* %si2.addr, align 8
  %xor = xor i64 %tmp, %tmp1
  %tmp2 = load i64* %si1.addr, align 8
  %tmp3 = load i64* %si1.addr, align 8
  %tmp4 = load i64* %si2.addr, align 8
  %xor5 = xor i64 %tmp3, %tmp4
  %and = and i64 %xor5, -9223372036854775808
  %xor6 = xor i64 %tmp2, %and
  %tmp7 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 %xor6, %tmp7
  %tmp8 = load i64* %si2.addr, align 8
  %xor9 = xor i64 %sub, %tmp8
  %and10 = and i64 %xor, %xor9
  %cmp = icmp slt i64 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i64* %si1.addr, align 8
  %tmp13 = load i64* %si2.addr, align 8
  %sub14 = sub nsw i64 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i64 %cond
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_5, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
