; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001570.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_5 = global i16 -1, align 2
@g_7 = global i32 1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_10 = alloca i8, align 1
  %l_11 = alloca [7 x [8 x i32*]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  store i8 0, i8* %l_10, align 1
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
  %cmp3 = icmp slt i32 %tmp2, 8
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [7 x [8 x i32*]]* %l_11, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [8 x i32*]* %arrayidx, i32 0, i64 %idxprom
  store i32* @g_7, i32** %arrayidx8, align 8
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
  volatile store i32 4, i32* @g_2, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc28, %for.end13
  %tmp15 = volatile load i32* @g_2, align 4
  %cmp16 = icmp slt i32 %tmp15, -14
  br i1 %cmp16, label %for.body17, label %for.end30

for.body17:                                       ; preds = %for.cond14
  store i32* @g_7, i32** %l_6, align 8
  %tmp19 = volatile load i32* @g_2, align 4
  %conv = sext i32 %tmp19 to i64
  %tmp20 = load i16* @g_5, align 2
  %conv21 = sext i16 %tmp20 to i64
  %xor = xor i64 3647139437, %conv21
  %cmp22 = icmp ne i64 %conv, %xor
  %conv23 = zext i1 %cmp22 to i32
  %tmp24 = load i32** %l_6, align 8
  %tmp25 = load i32* %tmp24
  %or = or i32 %tmp25, %conv23
  store i32 %or, i32* %tmp24
  %tmp26 = load i32** %l_6, align 8
  %tmp27 = load i32* %tmp26
  %tobool = icmp ne i32 %tmp27, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body17
  br label %for.inc28

if.end:                                           ; preds = %for.body17
  br label %for.inc28

for.inc28:                                        ; preds = %if.end, %if.then
  %tmp29 = volatile load i32* @g_2, align 4
  %call = call i32 @safe_add_func_int32_t_s_s(i32 %tmp29, i32 1)
  volatile store i32 %call, i32* @g_2, align 4
  br label %for.cond14

for.end30:                                        ; preds = %for.cond14
  %tmp31 = load i8* %l_10, align 1
  %conv32 = sext i8 %tmp31 to i64
  %call33 = call i64 @safe_sub_func_uint64_t_u_u(i64 0, i64 %conv32)
  %tmp34 = volatile load i32* @g_2, align 4
  %conv35 = sext i32 %tmp34 to i64
  %and = and i64 %conv35, %call33
  %conv36 = trunc i64 %and to i32
  volatile store i32 %conv36, i32* @g_2, align 4
  %tmp37 = load i16* @g_5, align 2
  %conv38 = trunc i16 %tmp37 to i8
  ret i8 %conv38
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %si2.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i32* %si1.addr, align 4
  %tmp5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %tmp5
  %cmp6 = icmp sgt i32 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i32* %si1.addr, align 4
  %cmp8 = icmp slt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i32* %si2.addr, align 4
  %cmp11 = icmp slt i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %si1.addr, align 4
  %tmp14 = load i32* %si2.addr, align 4
  %sub15 = sub nsw i32 -2147483648, %tmp14
  %cmp16 = icmp slt i32 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i32* %si1.addr, align 4
  %tmp19 = load i32* %si2.addr, align 4
  %add = add nsw i32 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i16* @g_5, align 2
  %conv = sext i16 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %tmp4 = load i32* @g_7, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
