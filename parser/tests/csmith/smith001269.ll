; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i32 9, align 4
@g_7 = global i32 1, align 4
@g_6 = global i32* @g_7, align 8
@g_11 = global [1 x [10 x [5 x i32]]] [[10 x [5 x i32]] [[5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1]]], align 16
@g_15 = constant i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [10 x [5 x i32]]]* @g_11 to i8*), i64 56) to i32*), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][0][4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][1] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][2] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][3] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][2][4] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][2] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][3] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][3][4] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][1] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][2] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][3] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][4][4] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][1] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][2] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][3] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][5][4] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][1] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][2] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][3] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][6][4] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][0] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][1] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][2] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][3] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][7][4] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][0] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][1] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][2] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][3] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][8][4] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][0] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][1] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][2] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][3] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [29 x i8] c"checksum g_11[0][9][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i16, align 2
  %l_14 = alloca i8, align 1
  %l_10 = alloca i32*, align 8
  store i16 -6, i16* %l_4, align 2
  %tmp = load i16* %l_4, align 2
  %conv = trunc i16 %tmp to i8
  %tmp1 = load i32* @g_5, align 4
  %conv2 = trunc i32 %tmp1 to i8
  %call = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv, i8 zeroext %conv2)
  %conv3 = zext i8 %call to i32
  %tmp4 = volatile load i32** @g_6, align 8
  store i32 %conv3, i32* %tmp4
  store i32 0, i32* @g_7, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp5 = load i32* @g_7, align 4
  %cmp = icmp ne i32 %tmp5, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 21, i8* %l_14, align 1
  %tmp8 = volatile load i32** @g_6, align 8
  %tmp9 = load i32* %tmp8
  %tobool = icmp ne i32 %tmp9, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), i32** %l_10, align 8
  %tmp11 = volatile load i32** @g_6, align 8
  %tmp12 = load i32* %tmp11
  %tmp13 = load i32** %l_10, align 8
  %tmp14 = load i32* %tmp13
  %and = and i32 %tmp14, %tmp12
  store i32 %and, i32* %tmp13
  br label %if.end42

if.else:                                          ; preds = %for.body
  %tmp15 = volatile load i32** @g_6, align 8
  %tmp16 = load i32* %tmp15
  %tmp17 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 3), align 4
  %tmp18 = load i8* %l_14, align 1
  %conv19 = zext i8 %tmp18 to i32
  %cmp20 = icmp slt i32 %tmp17, %conv19
  %conv21 = zext i1 %cmp20 to i32
  %conv22 = sext i32 %conv21 to i64
  %tmp23 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 2), align 4
  %tmp24 = load i8* %l_14, align 1
  %conv25 = zext i8 %tmp24 to i32
  %or = or i32 %tmp23, %conv25
  %conv26 = sext i32 %or to i64
  %call27 = call i64 @safe_add_func_int64_t_s_s(i64 %conv22, i64 %conv26)
  %tmp28 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), align 4
  %conv29 = sext i32 %tmp28 to i64
  %cmp30 = icmp ne i64 %call27, %conv29
  %conv31 = zext i1 %cmp30 to i32
  %tmp32 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 2), align 4
  %xor = xor i32 %conv31, %tmp32
  %tobool33 = icmp ne i32 %xor, 0
  br i1 %tobool33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.else
  %tmp34 = load i32** @g_15, align 8
  %cmp35 = icmp ne i32* %tmp34, @g_7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.else
  %0 = phi i1 [ false, %if.else ], [ %cmp35, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %xor37 = xor i32 %tmp16, %land.ext
  %tmp38 = load i32** @g_15, align 8
  store i32 %xor37, i32* %tmp38
  %tmp39 = load i8* %l_14, align 1
  %tobool40 = icmp ne i8 %tmp39, 0
  br i1 %tobool40, label %if.then41, label %if.end

if.then41:                                        ; preds = %land.end
  br label %for.end

if.end:                                           ; preds = %land.end
  br label %if.end42

if.end42:                                         ; preds = %if.end, %if.then
  %tmp43 = load i16* %l_4, align 2
  %conv44 = sext i16 %tmp43 to i32
  %tmp45 = load i32** @g_15, align 8
  %tmp46 = load i32* %tmp45
  %and47 = and i32 %tmp46, %conv44
  store i32 %and47, i32* %tmp45
  %tmp48 = load i32** @g_15, align 8
  %tmp49 = load i32* %tmp48
  %conv50 = sext i32 %tmp49 to i64
  %xor51 = xor i64 %conv50, 3997966583
  %conv52 = trunc i64 %xor51 to i32
  store i32 %conv52, i32* %tmp48
  br label %for.inc

for.inc:                                          ; preds = %if.end42
  %tmp53 = load i32* @g_7, align 4
  %conv54 = trunc i32 %tmp53 to i8
  %call55 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv54, i8 zeroext 1)
  %conv56 = zext i8 %call55 to i32
  store i32 %conv56, i32* @g_7, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then41, %for.cond
  %tmp57 = load i16* %l_4, align 2
  %conv58 = sext i16 %tmp57 to i32
  ret i32 %conv58
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %tmp = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i64* %si2.addr, align 8
  %cmp2 = icmp sgt i64 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i64* %si1.addr, align 8
  %tmp5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %tmp5
  %cmp6 = icmp sgt i64 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i64* %si1.addr, align 8
  %cmp8 = icmp slt i64 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i64* %si2.addr, align 8
  %cmp11 = icmp slt i64 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i64* %si1.addr, align 8
  %tmp14 = load i64* %si2.addr, align 8
  %sub15 = sub nsw i64 -9223372036854775808, %tmp14
  %cmp16 = icmp slt i64 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i64* %si1.addr, align 8
  %tmp19 = load i64* %si2.addr, align 8
  %add = add nsw i64 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i64 %cond
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_5, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 3), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 0, i64 4), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 2), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 3), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 1, i64 4), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 1), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 2), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 3), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 1), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 2), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 3), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 3, i64 4), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 1), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 2), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 3), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 4, i64 4), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 0), align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i32 0, i32 0), i32 %tmp54)
  %tmp56 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 1), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i32 0, i32 0), i32 %tmp56)
  %tmp58 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 2), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 3), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i32 0, i32 0), i32 %tmp60)
  %tmp62 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 5, i64 4), align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 0), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i32 0, i32 0), i32 %tmp64)
  %tmp66 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 1), align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 2), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i32 0, i32 0), i32 %tmp68)
  %tmp70 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 3), align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i32 %tmp70)
  %tmp72 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 6, i64 4), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i32 0, i32 0), i32 %tmp72)
  %tmp74 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 0), align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i32 0, i32 0), i32 %tmp74)
  %tmp76 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 1), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i32 0, i32 0), i32 %tmp76)
  %tmp78 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 2), align 4
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i32 0, i32 0), i32 %tmp78)
  %tmp80 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 3), align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i32 0, i32 0), i32 %tmp80)
  %tmp82 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 7, i64 4), align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i32 0, i32 0), i32 %tmp82)
  %tmp84 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 0), align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str42, i32 0, i32 0), i32 %tmp84)
  %tmp86 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 1), align 4
  %call87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str43, i32 0, i32 0), i32 %tmp86)
  %tmp88 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 2), align 4
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str44, i32 0, i32 0), i32 %tmp88)
  %tmp90 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 3), align 4
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str45, i32 0, i32 0), i32 %tmp90)
  %tmp92 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 8, i64 4), align 4
  %call93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str46, i32 0, i32 0), i32 %tmp92)
  %tmp94 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 0), align 4
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str47, i32 0, i32 0), i32 %tmp94)
  %tmp96 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 1), align 4
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str48, i32 0, i32 0), i32 %tmp96)
  %tmp98 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 2), align 4
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str49, i32 0, i32 0), i32 %tmp98)
  %tmp100 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 3), align 4
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str50, i32 0, i32 0), i32 %tmp100)
  %tmp102 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 9, i64 4), align 4
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str51, i32 0, i32 0), i32 %tmp102)
  %tmp104 = load i32* getelementptr inbounds ([1 x [10 x [5 x i32]]]* @g_11, i32 0, i64 0, i64 2, i64 4), align 4
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i32 0, i32 0), i32 %tmp104)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
