; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000514.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i16 3977, align 2
@g_7 = global i32 355227899, align 4
@g_14 = global i32 7, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_8 = alloca [7 x i32], align 16
  %l_9 = alloca i8, align 1
  %l_12 = alloca i64, align 8
  %i = alloca i32, align 4
  %l_13 = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  %l_16 = alloca i32*, align 8
  %l_19 = alloca [10 x [7 x i16]], align 16
  %i59 = alloca i32, align 4
  %j = alloca i32, align 4
  store i8 111, i8* %l_9, align 1
  store i64 -6, i64* %l_12, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp3 = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp3 to i32
  %tmp4 = load i32* @g_7, align 4
  %conv5 = sext i32 %tmp4 to i64
  %tmp6 = load i32* @g_7, align 4
  %tobool = icmp ne i32 %tmp6, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %arrayidx7 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 4
  %tmp8 = load i32* %arrayidx7, align 4
  %cmp9 = icmp eq i32 %lnot.ext, %tmp8
  %conv10 = zext i1 %cmp9 to i32
  %conv11 = sext i32 %conv10 to i64
  %call = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv5, i64 %conv11)
  %arrayidx12 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 4
  %tmp13 = load i32* %arrayidx12, align 4
  %conv14 = zext i32 %tmp13 to i64
  %cmp15 = icmp eq i64 %call, %conv14
  %conv16 = zext i1 %cmp15 to i32
  %or = or i32 %conv, %conv16
  %conv17 = trunc i32 %or to i16
  %tmp18 = load i8* %l_9, align 1
  %conv19 = zext i8 %tmp18 to i16
  %call20 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv17, i16 signext %conv19)
  %tobool21 = icmp ne i16 %call20, 0
  br i1 %tobool21, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  store i8 -10, i8* %l_9, align 1
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc39, %if.then
  %tmp23 = load i8* %l_9, align 1
  %conv24 = zext i8 %tmp23 to i32
  %cmp25 = icmp sle i32 %conv24, -16
  br i1 %cmp25, label %for.body27, label %for.end44

for.body27:                                       ; preds = %for.cond22
  store i32* @g_14, i32** %l_13, align 8
  %arrayidx29 = getelementptr inbounds [7 x i32]* %l_8, i32 0, i64 4
  %tmp30 = load i32* %arrayidx29, align 4
  %tobool31 = icmp ne i32 %tmp30, 0
  br i1 %tobool31, label %if.then32, label %if.end

if.then32:                                        ; preds = %for.body27
  br label %for.end44

if.end:                                           ; preds = %for.body27
  %tmp33 = load i64* %l_12, align 8
  %tmp34 = load i32** %l_13, align 8
  %tmp35 = load i32* %tmp34
  %conv36 = sext i32 %tmp35 to i64
  %or37 = or i64 %conv36, %tmp33
  %conv38 = trunc i64 %or37 to i32
  store i32 %conv38, i32* %tmp34
  br label %for.inc39

for.inc39:                                        ; preds = %if.end
  %tmp40 = load i8* %l_9, align 1
  %conv41 = zext i8 %tmp40 to i16
  %call42 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv41, i16 signext 1)
  %conv43 = trunc i16 %call42 to i8
  store i8 %conv43, i8* %l_9, align 1
  br label %for.cond22

for.end44:                                        ; preds = %if.then32, %for.cond22
  br label %if.end51

if.else:                                          ; preds = %for.end
  store i32* null, i32** %l_15, align 8
  store i32* @g_14, i32** %l_16, align 8
  %tmp47 = load i32** %l_15, align 8
  %cmp48 = icmp eq i32* null, %tmp47
  %conv49 = zext i1 %cmp48 to i32
  %tmp50 = load i32** %l_16, align 8
  store i32 %conv49, i32* %tmp50
  br label %if.end51

if.end51:                                         ; preds = %if.else, %for.end44
  store i64 0, i64* %l_12, align 8
  br label %for.cond52

for.cond52:                                       ; preds = %for.inc89, %if.end51
  %tmp53 = load i64* %l_12, align 8
  %cmp54 = icmp ult i64 %tmp53, 12
  br i1 %cmp54, label %for.body56, label %for.end94

for.body56:                                       ; preds = %for.cond52
  store i32 0, i32* %i59, align 4
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc81, %for.body56
  %tmp62 = load i32* %i59, align 4
  %cmp63 = icmp slt i32 %tmp62, 10
  br i1 %cmp63, label %for.body65, label %for.end84

for.body65:                                       ; preds = %for.cond61
  store i32 0, i32* %j, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc77, %for.body65
  %tmp67 = load i32* %j, align 4
  %cmp68 = icmp slt i32 %tmp67, 7
  br i1 %cmp68, label %for.body70, label %for.end80

for.body70:                                       ; preds = %for.cond66
  %tmp71 = load i32* %j, align 4
  %idxprom72 = sext i32 %tmp71 to i64
  %tmp73 = load i32* %i59, align 4
  %idxprom74 = sext i32 %tmp73 to i64
  %arrayidx75 = getelementptr inbounds [10 x [7 x i16]]* %l_19, i32 0, i64 %idxprom74
  %arrayidx76 = getelementptr inbounds [7 x i16]* %arrayidx75, i32 0, i64 %idxprom72
  store i16 1, i16* %arrayidx76, align 2
  br label %for.inc77

for.inc77:                                        ; preds = %for.body70
  %tmp78 = load i32* %j, align 4
  %inc79 = add nsw i32 %tmp78, 1
  store i32 %inc79, i32* %j, align 4
  br label %for.cond66

for.end80:                                        ; preds = %for.cond66
  br label %for.inc81

for.inc81:                                        ; preds = %for.end80
  %tmp82 = load i32* %i59, align 4
  %inc83 = add nsw i32 %tmp82, 1
  store i32 %inc83, i32* %i59, align 4
  br label %for.cond61

for.end84:                                        ; preds = %for.cond61
  %arrayidx85 = getelementptr inbounds [10 x [7 x i16]]* %l_19, i32 0, i64 6
  %arrayidx86 = getelementptr inbounds [7 x i16]* %arrayidx85, i32 0, i64 0
  %tmp87 = load i16* %arrayidx86, align 2
  %conv88 = sext i16 %tmp87 to i32
  store i32 %conv88, i32* %retval
  br label %return

for.inc89:                                        ; No predecessors!
  %tmp90 = load i64* %l_12, align 8
  %conv91 = trunc i64 %tmp90 to i8
  %call92 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv91, i8 zeroext 1)
  %conv93 = zext i8 %call92 to i64
  store i64 %conv93, i64* %l_12, align 8
  br label %for.cond52

for.end94:                                        ; preds = %for.cond52
  %tmp95 = load i8* %l_9, align 1
  %conv96 = zext i8 %tmp95 to i32
  store i32 %conv96, i32* %retval
  br label %return

return:                                           ; preds = %for.end94, %for.end84
  %0 = load i32* %retval
  ret i32 %0
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

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = volatile load i16* @g_4, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_14, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
