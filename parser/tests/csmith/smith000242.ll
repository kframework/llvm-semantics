; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000242.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1, align 4
@g_22 = global i8 -22, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_3 = alloca i32*, align 8
  %l_4 = alloca i32, align 4
  %l_15 = alloca [8 x i32], align 16
  %l_24 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %l_14 = alloca i32, align 4
  %l_23 = alloca i64, align 8
  %i54 = alloca i32, align 4
  store i32* null, i32** %l_3, align 8
  store i32 1530633636, i32* %l_4, align 4
  store i32 0, i32* %l_24, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32]* %l_15, i32 0, i64 %idxprom
  store i32 516036686, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp3, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end
  %tmp4 = load i32* @g_2, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end
  %0 = phi i1 [ false, %for.end ], [ %tobool5, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  store i32 %land.ext, i32* %l_4, align 4
  store i32 0, i32* %l_4, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc89, %land.end
  %tmp7 = load i32* %l_4, align 4
  %cmp8 = icmp eq i32 %tmp7, 29
  br i1 %cmp8, label %for.body9, label %for.end92

for.body9:                                        ; preds = %for.cond6
  store i32* null, i32** %l_9, align 8
  store i32 371022157, i32* %l_14, align 4
  %tmp12 = load i32* %l_4, align 4
  %tmp13 = load i32** %l_9, align 8
  %cmp14 = icmp eq i32* null, %tmp13
  %conv = zext i1 %cmp14 to i32
  %tmp15 = load i32* %l_14, align 4
  %conv16 = trunc i32 %tmp15 to i8
  %tmp17 = load i32* @g_2, align 4
  %conv18 = trunc i32 %tmp17 to i8
  %call = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %conv16, i8 signext %conv18)
  %conv19 = sext i8 %call to i32
  %tmp20 = load i32* @g_2, align 4
  %tmp21 = load i32* @g_2, align 4
  %cmp22 = icmp sge i32 %tmp20, %tmp21
  %conv23 = zext i1 %cmp22 to i32
  %cmp24 = icmp eq i32 %conv19, %conv23
  %conv25 = zext i1 %cmp24 to i32
  %conv26 = trunc i32 %conv25 to i16
  %tmp27 = load i32* @g_2, align 4
  %conv28 = trunc i32 %tmp27 to i16
  %call29 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv26, i16 signext %conv28)
  %conv30 = sext i16 %call29 to i64
  %cmp31 = icmp eq i64 %conv30, 4169152982
  %conv32 = zext i1 %cmp31 to i32
  %call33 = call i32 @safe_sub_func_int32_t_s_s(i32 %conv, i32 %conv32)
  %or = or i32 %tmp12, %call33
  %arrayidx34 = getelementptr inbounds [8 x i32]* %l_15, i32 0, i64 4
  %tmp35 = load i32* %arrayidx34, align 4
  %or36 = or i32 %tmp35, %or
  store i32 %or36, i32* %arrayidx34, align 4
  store i32 0, i32* %l_14, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc81, %for.body9
  %tmp38 = load i32* %l_14, align 4
  %cmp39 = icmp sgt i32 %tmp38, 23
  br i1 %cmp39, label %for.body41, label %for.end86

for.body41:                                       ; preds = %for.cond37
  store i32 -8, i32* %l_14, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc77, %for.body41
  %tmp43 = load i32* %l_14, align 4
  %cmp44 = icmp sle i32 %tmp43, 14
  br i1 %cmp44, label %for.body46, label %for.end80

for.body46:                                       ; preds = %for.cond42
  store i64 -7, i64* %l_23, align 8
  store i32 8, i32* %l_4, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc69, %for.body46
  %tmp49 = load i32* %l_4, align 4
  %cmp50 = icmp sge i32 %tmp49, 0
  br i1 %cmp50, label %for.body52, label %for.end74

for.body52:                                       ; preds = %for.cond48
  store i32 5, i32* @g_2, align 4
  br label %for.cond55

for.cond55:                                       ; preds = %for.inc64, %for.body52
  %tmp56 = load i32* @g_2, align 4
  %cmp57 = icmp sge i32 %tmp56, 0
  br i1 %cmp57, label %for.body59, label %for.end66

for.body59:                                       ; preds = %for.cond55
  %tmp60 = load i32* @g_2, align 4
  %tmp61 = load i8* @g_22, align 1
  %conv62 = zext i8 %tmp61 to i32
  %xor = xor i32 %conv62, %tmp60
  %conv63 = trunc i32 %xor to i8
  store i8 %conv63, i8* @g_22, align 1
  br label %for.inc64

for.inc64:                                        ; preds = %for.body59
  %tmp65 = load i32* @g_2, align 4
  %add = add nsw i32 %tmp65, -5
  store i32 %add, i32* @g_2, align 4
  br label %for.cond55

for.end66:                                        ; preds = %for.cond55
  %tmp67 = load i32* @g_2, align 4
  %conv68 = sext i32 %tmp67 to i64
  store i64 %conv68, i64* %retval
  br label %return

for.inc69:                                        ; No predecessors!
  %tmp70 = load i32* %l_4, align 4
  %conv71 = trunc i32 %tmp70 to i16
  %call72 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv71, i16 zeroext 1)
  %conv73 = zext i16 %call72 to i32
  store i32 %conv73, i32* %l_4, align 4
  br label %for.cond48

for.end74:                                        ; preds = %for.cond48
  %tmp75 = load i64* %l_23, align 8
  %tobool76 = icmp ne i64 %tmp75, 0
  br i1 %tobool76, label %if.then, label %if.end

if.then:                                          ; preds = %for.end74
  br label %for.end80

if.end:                                           ; preds = %for.end74
  br label %for.inc77

for.inc77:                                        ; preds = %if.end
  %tmp78 = load i32* %l_14, align 4
  %call79 = call i32 @safe_add_func_int32_t_s_s(i32 %tmp78, i32 1)
  store i32 %call79, i32* %l_14, align 4
  br label %for.cond42

for.end80:                                        ; preds = %if.then, %for.cond42
  br label %for.inc81

for.inc81:                                        ; preds = %for.end80
  %tmp82 = load i32* %l_14, align 4
  %conv83 = sext i32 %tmp82 to i64
  %call84 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv83, i64 0)
  %conv85 = trunc i64 %call84 to i32
  store i32 %conv85, i32* %l_14, align 4
  br label %for.cond37

for.end86:                                        ; preds = %for.cond37
  %tmp87 = load i32* @g_2, align 4
  %conv88 = sext i32 %tmp87 to i64
  store i64 %conv88, i64* %retval
  br label %return

for.inc89:                                        ; No predecessors!
  %tmp90 = load i32* %l_4, align 4
  %call91 = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp90, i32 1)
  store i32 %call91, i32* %l_4, align 4
  br label %for.cond6

for.end92:                                        ; preds = %for.cond6
  %tmp93 = load i32* %l_24, align 4
  %conv94 = sext i32 %tmp93 to i64
  store i64 %conv94, i64* %retval
  br label %return

return:                                           ; preds = %for.end92, %for.end86, %for.end66
  %1 = load i64* %retval
  ret i64 %1
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %tmp1 = load i32* %si2.addr, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %si1.addr, align 4
  %tmp3 = load i32* %si1.addr, align 4
  %tmp4 = load i32* %si2.addr, align 4
  %xor5 = xor i32 %tmp3, %tmp4
  %and = and i32 %xor5, -2147483648
  %xor6 = xor i32 %tmp2, %and
  %tmp7 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor6, %tmp7
  %tmp8 = load i32* %si2.addr, align 4
  %xor9 = xor i32 %sub, %tmp8
  %and10 = and i32 %xor, %xor9
  %cmp = icmp slt i32 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i32* %si1.addr, align 4
  %tmp13 = load i32* %si2.addr, align 4
  %sub14 = sub nsw i32 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i32 %cond
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
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
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
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

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i8* @g_22, align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
