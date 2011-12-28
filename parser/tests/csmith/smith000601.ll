; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000601.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S2 = type { i32, i32 }

@g_3 = global i32 -9, align 4
@g_6 = global i32 1, align 4
@g_5 = global i32* @g_6, align 8
@g_10 = global i32 767093092, align 4
@g_16 = global %struct.S2 { i32 1688278528, i32 1418978851 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_16.f0 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_16.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [4 x i32], align 16
  %l_9 = alloca i32*, align 8
  %l_17 = alloca i32**, align 8
  %i = alloca i32, align 4
  %l_4 = alloca [6 x i16], align 2
  %i9 = alloca i32, align 4
  store i32* @g_10, i32** %l_9, align 8
  store i32** %l_9, i32*** %l_17, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %l_2, i32 0, i64 %idxprom
  store i32 9, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i32 1, i32* @g_3, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc25, %for.end
  %tmp4 = volatile load i32* @g_3, align 4
  %cmp5 = icmp slt i32 %tmp4, 4
  br i1 %cmp5, label %for.body6, label %for.end27

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %i9, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc17, %for.body6
  %tmp11 = load i32* %i9, align 4
  %cmp12 = icmp slt i32 %tmp11, 6
  br i1 %cmp12, label %for.body13, label %for.end20

for.body13:                                       ; preds = %for.cond10
  %tmp14 = load i32* %i9, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %arrayidx16 = getelementptr inbounds [6 x i16]* %l_4, i32 0, i64 %idxprom15
  store i16 -10033, i16* %arrayidx16, align 2
  br label %for.inc17

for.inc17:                                        ; preds = %for.body13
  %tmp18 = load i32* %i9, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %i9, align 4
  br label %for.cond10

for.end20:                                        ; preds = %for.cond10
  %arrayidx21 = getelementptr inbounds [6 x i16]* %l_4, i32 0, i64 1
  %tmp22 = load i16* %arrayidx21, align 2
  %conv = zext i16 %tmp22 to i32
  %tmp23 = volatile load i32** @g_5, align 8
  %tmp24 = load i32* %tmp23
  %xor = xor i32 %tmp24, %conv
  store i32 %xor, i32* %tmp23
  br label %for.inc25

for.inc25:                                        ; preds = %for.end20
  %tmp26 = volatile load i32* @g_3, align 4
  %add = add nsw i32 %tmp26, 4
  volatile store i32 %add, i32* @g_3, align 4
  br label %for.cond3

for.end27:                                        ; preds = %for.cond3
  %tmp28 = volatile load i32** @g_5, align 8
  %tmp29 = load i32* %tmp28
  %conv30 = trunc i32 %tmp29 to i16
  %tmp31 = load i32* @g_6, align 4
  %conv32 = trunc i32 %tmp31 to i16
  %call = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv30, i16 signext %conv32)
  %conv33 = sext i16 %call to i32
  %tmp34 = load i32** %l_9, align 8
  %tmp35 = load i32* %tmp34
  %and = and i32 %tmp35, %conv33
  store i32 %and, i32* %tmp34
  %0 = load i64* bitcast (%struct.S2* @g_16 to i64*), align 1
  %call36 = call i32* @func_11(i32* @g_10, i64 %0, i32* null)
  %tmp37 = load i32*** %l_17, align 8
  store i32* %call36, i32** %tmp37
  %tmp38 = load i32*** %l_17, align 8
  %tmp39 = load i32** %tmp38
  %tmp40 = load i32* %tmp39
  ret i32 %tmp40
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
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
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
}

define i32* @func_11(i32* %p_12, i64 %p_13.coerce, i32* %p_14) nounwind uwtable {
entry:
  %p_12.addr = alloca i32*, align 8
  %p_13 = alloca %struct.S2, align 8
  %p_14.addr = alloca i32*, align 8
  %l_15 = alloca i32*, align 8
  store i32* %p_12, i32** %p_12.addr, align 8
  %0 = bitcast %struct.S2* %p_13 to i64*
  store i64 %p_13.coerce, i64* %0
  store i32* %p_14, i32** %p_14.addr, align 8
  store i32* @g_6, i32** %l_15, align 8
  %tmp = load i32** %l_15, align 8
  ret i32* %tmp
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
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_10, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds (%struct.S2* @g_16, i32 0, i32 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds (%struct.S2* @g_16, i32 0, i32 1), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
