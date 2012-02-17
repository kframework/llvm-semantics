; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000467.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32* null, align 8
@g_8 = global i16 -1, align 2
@g_13 = global i32 1, align 4
@g_14 = global [4 x i32] [i32 -1, i32 -1, i32 -1, i32 -1], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca i32*, align 8
  %l_15 = alloca [7 x i32**], align 16
  %i = alloca i32, align 4
  store i32* null, i32** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i32**]* %l_15, i32 0, i64 %idxprom
  store i32** null, i32*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32** %l_7, align 8
  %tmp4 = load i16* @g_8, align 2
  %call = call i32* @func_2(i32* %tmp3, i32 1184277637, i16 zeroext %tmp4)
  %tmp5 = load i32* @g_13, align 4
  %tmp6 = load i16* @g_8, align 2
  %conv = sext i16 %tmp6 to i32
  %and = and i32 %tmp5, %conv
  %tmp7 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 2), align 4
  %tmp8 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 1), align 4
  %cmp9 = icmp uge i32 %tmp7, %tmp8
  %conv10 = zext i1 %cmp9 to i32
  %or = or i32 %and, %conv10
  %tobool = icmp ne i32 %or, 0
  %land.ext = zext i1 %tobool to i32
  %conv11 = trunc i32 %land.ext to i8
  %call12 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv11, i8 signext 0)
  %conv13 = sext i8 %call12 to i64
  %call14 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv13, i64 -10)
  %conv15 = trunc i64 %call14 to i32
  %tmp16 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 3), align 4
  %conv17 = trunc i32 %tmp16 to i16
  %call18 = call i32* @func_2(i32* %call, i32 %conv15, i16 zeroext %conv17)
  store i32* %call18, i32** @g_6, align 8
  %tmp19 = load i32* @g_13, align 4
  %conv20 = trunc i32 %tmp19 to i16
  ret i16 %conv20
}

define i32* @func_2(i32* %p_3, i32 %p_4, i16 zeroext %p_5) nounwind uwtable {
entry:
  %p_3.addr = alloca i32*, align 8
  %p_4.addr = alloca i32, align 4
  %p_5.addr = alloca i16, align 2
  store i32* %p_3, i32** %p_3.addr, align 8
  store i32 %p_4, i32* %p_4.addr, align 4
  store i16 %p_5, i16* %p_5.addr, align 2
  %tmp = load i32** @g_6, align 8
  ret i32* %tmp
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

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
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
  %call = call signext i16 @func_1()
  %tmp = load i16* @g_8, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_13, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([4 x i32]* @g_14, i32 0, i64 2), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp12)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
