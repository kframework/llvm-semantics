; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000071.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = constant [2 x [5 x [3 x [1 x i32]]]] [[5 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]]], [5 x [3 x [1 x i32]]] [[3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]], [3 x [1 x i32]] [[1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061], [1 x i32] [i32 -508159061]]]], align 16
@g_15 = constant i32 1388262280, align 4
@g_14 = global i32* @g_15, align 8
@g_16 = global i32** @g_14, align 8
@g_17 = global i32** null, align 8
@g_19 = global i32 -1, align 4
@g_18 = global i32* @g_19, align 8
@.str = private unnamed_addr constant [31 x i8] c"checksum g_8[0][0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][0][1][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][0][2][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][1][2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][2][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][2][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][2][2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][3][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][3][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][3][2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][4][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][4][1][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [31 x i8] c"checksum g_8[0][4][2][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][0][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][0][1][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][0][2][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][1][0][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][1][1][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][1][2][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][2][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][2][1][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][2][2][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][3][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][3][1][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][3][2][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][4][0][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][4][1][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [31 x i8] c"checksum g_8[1][4][2][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_13 = alloca i32*, align 8
  %l_20 = alloca i32*, align 8
  store i32* null, i32** %l_13, align 8
  store i32* @g_19, i32** %l_20, align 8
  %tmp = volatile load i32** @g_14, align 8
  %tmp1 = volatile load i32*** @g_16, align 8
  volatile store i32* %tmp, i32** %tmp1
  %tmp2 = volatile load i32* @g_15, align 4
  %conv = trunc i32 %tmp2 to i16
  %tmp3 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 3, i64 1, i64 0), align 4
  %tmp4 = load i32** %l_13, align 8
  %call = call i32* @func_9(i16 signext %conv, i32 %tmp3, i32* %tmp4)
  store i32* %call, i32** @g_18, align 8
  %tmp5 = load i32** %l_20, align 8
  %tmp6 = load i32* %tmp5
  %conv7 = sext i32 %tmp6 to i64
  %or = or i64 %conv7, 3770597429
  %conv8 = trunc i64 %or to i32
  store i32 %conv8, i32* %tmp5
  %tmp9 = load i32* @g_19, align 4
  ret i32 %tmp9
}

define i32* @func_9(i16 signext %p_10, i32 %p_11, i32* %p_12) nounwind uwtable {
entry:
  %p_10.addr = alloca i16, align 2
  %p_11.addr = alloca i32, align 4
  %p_12.addr = alloca i32*, align 8
  store i16 %p_10, i16* %p_10.addr, align 2
  store i32 %p_11, i32* %p_11.addr, align 4
  store i32* %p_12, i32** %p_12.addr, align 8
  %tmp = load i32** %p_12.addr, align 8
  ret i32* %tmp
}

define i32* @func_2(i32* %p_3) nounwind uwtable {
entry:
  %p_3.addr = alloca i32*, align 8
  %l_6 = alloca [4 x i16], align 2
  %l_7 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %p_3, i32** %p_3.addr, align 8
  store i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 2, i64 0, i64 0), i32** %l_7, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [4 x i16]* %l_6, i32 0, i64 %idxprom
  store i16 29980, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [4 x i16]* %l_6, i32 0, i64 3
  %tmp4 = load i16* %arrayidx3, align 2
  %conv = zext i16 %tmp4 to i64
  %cmp5 = icmp sge i64 0, %conv
  %conv6 = zext i1 %cmp5 to i32
  %conv7 = trunc i32 %conv6 to i8
  %call = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv7, i32 2119501211)
  %conv8 = sext i8 %call to i32
  %tmp9 = load i32** %p_3.addr, align 8
  %tmp10 = load i32* %tmp9
  %and = and i32 %tmp10, %conv8
  store i32 %and, i32* %tmp9
  %tmp11 = load i32** %l_7, align 8
  ret i32* %tmp11
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i8* %left.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i8* %left.addr, align 1
  %conv10 = sext i8 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  ret i8 %conv14
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 0, i64 1, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 0, i64 2, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 1, i64 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 1, i64 1, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 1, i64 2, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 2, i64 0, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 2, i64 1, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 2, i64 2, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 3, i64 0, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 3, i64 1, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 3, i64 2, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 4, i64 0, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 4, i64 1, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 0, i64 4, i64 2, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 0, i64 1, i64 0), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 0, i64 2, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 1, i64 0, i64 0), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 1, i64 1, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 1, i64 2, i64 0), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 2, i64 0, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 2, i64 1, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 2, i64 2, i64 0), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 3, i64 0, i64 0), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 3, i64 1, i64 0), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str25, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 3, i64 2, i64 0), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str26, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 4, i64 0, i64 0), align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str27, i32 0, i32 0), i32 %tmp54)
  %tmp56 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 4, i64 1, i64 0), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str28, i32 0, i32 0), i32 %tmp56)
  %tmp58 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 4, i64 2, i64 0), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str29, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([2 x [5 x [3 x [1 x i32]]]]* @g_8, i32 0, i64 1, i64 2, i64 0, i64 0), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i32 0, i32 0), i32 %tmp60)
  %tmp62 = volatile load i32* @g_15, align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str30, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* @g_19, align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str31, i32 0, i32 0), i32 %tmp64)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
