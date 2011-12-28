; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000508.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 48830980, align 4
@g_22 = global i32 -481370261, align 4
@g_25 = global [3 x i32] [i32 -714509075, i32 -714509075, i32 -714509075], align 4
@g_24 = global i32* bitcast (i8* getelementptr (i8* bitcast ([3 x i32]* @g_25 to i8*), i64 4) to i32*), align 8
@g_26 = global [1 x [3 x i32**]] [[3 x i32**] [i32** @g_24, i32** @g_24, i32** @g_24]], align 16
@g_27 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_25[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_25[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_25[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %l_11 = alloca [1 x [8 x i64]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_12 = alloca i32, align 4
  %l_13 = alloca i8, align 1
  %l_23 = alloca [5 x i8], align 1
  %l_28 = alloca i32**, align 8
  %i52 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
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
  %arrayidx = getelementptr inbounds [1 x [8 x i64]]* %l_11, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [8 x i64]* %arrayidx, i32 0, i64 %idxprom
  store i64 9, i64* %arrayidx8, align 8
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

for.cond14:                                       ; preds = %for.inc38, %for.end13
  %tmp15 = volatile load i32* @g_2, align 4
  %cmp16 = icmp sge i32 %tmp15, 0
  br i1 %cmp16, label %for.body17, label %for.end43

for.body17:                                       ; preds = %for.cond14
  store i32 1, i32* %l_12, align 4
  %arrayidx19 = getelementptr inbounds [1 x [8 x i64]]* %l_11, i32 0, i64 0
  %arrayidx20 = getelementptr inbounds [8 x i64]* %arrayidx19, i32 0, i64 5
  %tmp21 = load i64* %arrayidx20, align 8
  %tmp22 = volatile load i32* @g_2, align 4
  %conv = sext i32 %tmp22 to i64
  %cmp23 = icmp sgt i64 %tmp21, %conv
  %conv24 = zext i1 %cmp23 to i32
  %conv25 = trunc i32 %conv24 to i16
  %call = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv25, i16 signext -1)
  %conv26 = sext i16 %call to i32
  %tobool = icmp ne i32 %conv26, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body17
  %tmp27 = volatile load i32* @g_2, align 4
  %tobool28 = icmp ne i32 %tmp27, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body17
  %0 = phi i1 [ false, %for.body17 ], [ %tobool28, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %conv29 = sext i32 %land.ext to i64
  %call30 = call i32 @func_7(i64 %conv29)
  %conv31 = trunc i32 %call30 to i16
  %call32 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv31, i32 -9)
  %tobool33 = icmp ne i16 %call32, 0
  br i1 %tobool33, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %tmp34 = load i32* %l_12, align 4
  %conv35 = trunc i32 %tmp34 to i8
  store i8 %conv35, i8* %retval
  br label %return

if.else:                                          ; preds = %land.end
  store i8 0, i8* %l_13, align 1
  %tmp37 = load i8* %l_13, align 1
  store i8 %tmp37, i8* %retval
  br label %return

for.inc38:                                        ; No predecessors!
  %tmp39 = volatile load i32* @g_2, align 4
  %conv40 = sext i32 %tmp39 to i64
  %call41 = call i64 @safe_add_func_int64_t_s_s(i64 %conv40, i64 3)
  %conv42 = trunc i64 %call41 to i32
  volatile store i32 %conv42, i32* @g_2, align 4
  br label %for.cond14

for.end43:                                        ; preds = %for.cond14
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc85, %for.end43
  %tmp45 = volatile load i32* @g_2, align 4
  %cmp46 = icmp ne i32 %tmp45, -29
  br i1 %cmp46, label %for.body48, label %for.end90

for.body48:                                       ; preds = %for.cond44
  store i32** @g_24, i32*** %l_28, align 8
  store i32 0, i32* %i52, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc61, %for.body48
  %tmp54 = load i32* %i52, align 4
  %cmp55 = icmp slt i32 %tmp54, 5
  br i1 %cmp55, label %for.body57, label %for.end64

for.body57:                                       ; preds = %for.cond53
  %tmp58 = load i32* %i52, align 4
  %idxprom59 = sext i32 %tmp58 to i64
  %arrayidx60 = getelementptr inbounds [5 x i8]* %l_23, i32 0, i64 %idxprom59
  store i8 -3, i8* %arrayidx60, align 1
  br label %for.inc61

for.inc61:                                        ; preds = %for.body57
  %tmp62 = load i32* %i52, align 4
  %inc63 = add nsw i32 %tmp62, 1
  store i32 %inc63, i32* %i52, align 4
  br label %for.cond53

for.end64:                                        ; preds = %for.cond53
  %tmp65 = volatile load i32* @g_2, align 4
  %conv66 = trunc i32 %tmp65 to i8
  %tmp67 = load i32* @g_22, align 4
  %tobool68 = icmp ne i32 %tmp67, 0
  br i1 %tobool68, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end64
  %arrayidx69 = getelementptr inbounds [5 x i8]* %l_23, i32 0, i64 0
  %tmp70 = load i8* %arrayidx69, align 1
  %conv71 = sext i8 %tmp70 to i32
  %tobool72 = icmp ne i32 %conv71, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end64
  %1 = phi i1 [ true, %for.end64 ], [ %tobool72, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %conv73 = trunc i32 %lor.ext to i8
  %arrayidx74 = getelementptr inbounds [5 x i8]* %l_23, i32 0, i64 1
  %tmp75 = load i8* %arrayidx74, align 1
  %conv76 = sext i8 %tmp75 to i16
  %tmp77 = load i32** @g_24, align 8
  %call78 = call i32* @func_16(i8 signext %conv66, i8 zeroext %conv73, i32* null, i16 signext %conv76, i32* %tmp77)
  %tmp79 = load i32*** %l_28, align 8
  store i32* %call78, i32** %tmp79
  %arrayidx80 = getelementptr inbounds [1 x [8 x i64]]* %l_11, i32 0, i64 0
  %arrayidx81 = getelementptr inbounds [8 x i64]* %arrayidx80, i32 0, i64 5
  %tmp82 = load i64* %arrayidx81, align 8
  %tobool83 = icmp ne i64 %tmp82, 0
  br i1 %tobool83, label %if.then84, label %if.end

if.then84:                                        ; preds = %lor.end
  br label %for.inc85

if.end:                                           ; preds = %lor.end
  br label %for.inc85

for.inc85:                                        ; preds = %if.end, %if.then84
  %tmp86 = volatile load i32* @g_2, align 4
  %conv87 = sext i32 %tmp86 to i64
  %call88 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv87, i64 1)
  %conv89 = trunc i64 %call88 to i32
  volatile store i32 %conv89, i32* @g_2, align 4
  br label %for.cond44

for.end90:                                        ; preds = %for.cond44
  %tmp91 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 1), align 4
  %conv92 = trunc i32 %tmp91 to i8
  store i8 %conv92, i8* %retval
  br label %return

return:                                           ; preds = %for.end90, %if.else, %if.then
  %2 = load i8* %retval
  ret i8 %2
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i16* %left.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i16* %left.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i16* %left.addr, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define i32 @func_7(i64 %p_8) nounwind uwtable {
entry:
  %p_8.addr = alloca i64, align 8
  store i64 %p_8, i64* %p_8.addr, align 8
  %tmp = volatile load i32* @g_2, align 4
  ret i32 %tmp
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si2.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i16* %si1.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -32768
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i16* %si2.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i16* %si1.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i16* %si1.addr, align 2
  %conv13 = sext i16 %tmp12 to i32
  %tmp14 = load i16* %si2.addr, align 2
  %conv15 = sext i16 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
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

define i32* @func_16(i8 signext %p_17, i8 zeroext %p_18, i32* %p_19, i16 signext %p_20, i32* %p_21) nounwind uwtable {
entry:
  %p_17.addr = alloca i8, align 1
  %p_18.addr = alloca i8, align 1
  %p_19.addr = alloca i32*, align 8
  %p_20.addr = alloca i16, align 2
  %p_21.addr = alloca i32*, align 8
  store i8 %p_17, i8* %p_17.addr, align 1
  store i8 %p_18, i8* %p_18.addr, align 1
  store i32* %p_19, i32** %p_19.addr, align 8
  store i16 %p_20, i16* %p_20.addr, align 2
  store i32* %p_21, i32** %p_21.addr, align 8
  %tmp = load i32** %p_21.addr, align 8
  ret i32* %tmp
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
  %call = call signext i8 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_22, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i32 0, i64 1), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp10)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
