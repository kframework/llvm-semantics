; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000775.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 -1239700647, align 4
@g_8 = global i32* @g_9, align 8
@g_11 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i64, align 8
  %l_10 = alloca i32*, align 8
  store i64 0, i64* %l_4, align 8
  store i32* @g_11, i32** %l_10, align 8
  %tmp = load i64* %l_4, align 8
  %conv = trunc i64 %tmp to i16
  %tmp1 = volatile load i32* @g_9, align 4
  %call = call i32 @func_5(i32 %tmp1)
  %conv2 = trunc i32 %call to i16
  %call3 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv2)
  %conv4 = zext i16 %call3 to i32
  %tmp5 = load i32** %l_10, align 8
  %tmp6 = load i32* %tmp5
  %xor = xor i32 %tmp6, %conv4
  store i32 %xor, i32* %tmp5
  %tmp7 = load i32** %l_10, align 8
  %tmp8 = load i32* %tmp7
  %conv9 = trunc i32 %tmp8 to i8
  ret i8 %conv9
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define i32 @func_5(i32 %p_6) nounwind uwtable {
entry:
  %p_6.addr = alloca i32, align 4
  %l_7 = alloca [9 x i32**], align 16
  %i = alloca i32, align 4
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [9 x i32**]* %l_7, i32 0, i64 %idxprom
  store i32** null, i32*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32* null, i32** @g_8, align 8
  %tmp3 = load i32* %p_6.addr, align 4
  ret i32 %tmp3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = volatile load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_11, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
