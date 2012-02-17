; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000287.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32 -1092827760, align 4
@g_13 = global i16 -5329, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32, align 4
  %l_6 = alloca i32*, align 8
  %l_4 = alloca i32*, align 8
  %l_12 = alloca i16, align 2
  %l_9 = alloca [6 x i8], align 1
  %i = alloca i32, align 4
  store i32 48438659, i32* %l_2, align 4
  store i32* @g_5, i32** %l_6, align 8
  %tmp = load i32* %l_2, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* @g_3, align 4
  %conv = zext i32 %tmp1 to i64
  %cmp = icmp sge i64 1464303940, %conv
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32* @g_5, i32** %l_4, align 8
  %tmp4 = load i32* %l_2, align 4
  %tmp5 = load i32** %l_4, align 8
  %tmp6 = load i32* %tmp5
  %or = or i32 %tmp6, %tmp4
  store i32 %or, i32* %tmp5
  %tmp7 = load i32* %l_2, align 4
  %tmp8 = load i32** %l_6, align 8
  %cmp9 = icmp ne i32* null, %tmp8
  %conv10 = zext i1 %cmp9 to i32
  %cmp11 = icmp uge i32 %tmp7, %conv10
  %conv12 = zext i1 %cmp11 to i32
  %tmp13 = load i32** %l_4, align 8
  %tmp14 = load i32* %tmp13
  %and = and i32 %tmp14, %conv12
  store i32 %and, i32* %tmp13
  br label %if.end50

if.else:                                          ; preds = %land.lhs.true, %entry
  store i16 -17269, i16* %l_12, align 2
  store i32 0, i32* %l_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc44, %if.else
  %tmp16 = load i32* %l_2, align 4
  %cmp17 = icmp ne i32 %tmp16, -4
  br i1 %cmp17, label %for.body, label %for.end49

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc, %for.body
  %tmp22 = load i32* %i, align 4
  %cmp23 = icmp slt i32 %tmp22, 6
  br i1 %cmp23, label %for.body25, label %for.end

for.body25:                                       ; preds = %for.cond21
  %tmp26 = load i32* %i, align 4
  %idxprom = sext i32 %tmp26 to i64
  %arrayidx = getelementptr inbounds [6 x i8]* %l_9, i32 0, i64 %idxprom
  store i8 -66, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body25
  %tmp27 = load i32* %i, align 4
  %inc = add nsw i32 %tmp27, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond21

for.end:                                          ; preds = %for.cond21
  %tmp28 = load i32** %l_6, align 8
  %tmp29 = load i32* %tmp28
  %conv30 = sext i32 %tmp29 to i64
  %or31 = or i64 %conv30, -1
  %conv32 = trunc i64 %or31 to i32
  store i32 %conv32, i32* %tmp28
  %arrayidx33 = getelementptr inbounds [6 x i8]* %l_9, i32 0, i64 0
  %tmp34 = load i8* %arrayidx33, align 1
  %tobool35 = icmp ne i8 %tmp34, 0
  br i1 %tobool35, label %if.then36, label %if.end

if.then36:                                        ; preds = %for.end
  br label %for.end49

if.end:                                           ; preds = %for.end
  %tmp37 = load i32* @g_5, align 4
  %or38 = or i32 %tmp37, -17269
  %conv39 = trunc i32 %or38 to i8
  %call = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext 0, i8 zeroext %conv39)
  %conv40 = zext i8 %call to i32
  %tmp41 = load i16* @g_13, align 2
  %conv42 = zext i16 %tmp41 to i32
  %xor = xor i32 %conv42, %conv40
  %conv43 = trunc i32 %xor to i16
  store i16 %conv43, i16* @g_13, align 2
  br label %for.inc44

for.inc44:                                        ; preds = %if.end
  %tmp45 = load i32* %l_2, align 4
  %conv46 = zext i32 %tmp45 to i64
  %call47 = call i64 @safe_add_func_int64_t_s_s(i64 %conv46, i64 5)
  %conv48 = trunc i64 %call47 to i32
  store i32 %conv48, i32* %l_2, align 4
  br label %for.cond

for.end49:                                        ; preds = %if.then36, %for.cond
  br label %if.end50

if.end50:                                         ; preds = %for.end49, %if.then
  %tmp51 = load i16* @g_13, align 2
  ret i16 %tmp51
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i8
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_5, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i16* @g_13, align 2
  %conv = zext i16 %tmp4 to i32
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
