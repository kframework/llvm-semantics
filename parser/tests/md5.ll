; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/md5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.MD5_CTX = type { [2 x i32], [4 x i32], [64 x i8], [16 x i8] }

@PADDING = internal global [64 x i8] c"\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [26 x i8] c"MD5 test suite results:\0A\0A\00", align 1
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str4 = private unnamed_addr constant [15 x i8] c"message digest\00", align 1
@.str5 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str6 = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 1
@.str7 = private unnamed_addr constant [81 x i8] c"12345678901234567890123456789012345678901234567890123456789012345678901234567890\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c" \22%s\22\0A\0A\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"%x\00", align 1

define void @MD5Init(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  %tmp = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i = getelementptr inbounds %struct.MD5_CTX* %tmp, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %i, i32 0, i64 1
  store i32 0, i32* %arrayidx, align 4
  %tmp1 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i2 = getelementptr inbounds %struct.MD5_CTX* %tmp1, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %i2, i32 0, i64 0
  store i32 0, i32* %arrayidx3, align 4
  %tmp4 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf = getelementptr inbounds %struct.MD5_CTX* %tmp4, i32 0, i32 1
  %arrayidx5 = getelementptr inbounds [4 x i32]* %buf, i32 0, i64 0
  store i32 1732584193, i32* %arrayidx5, align 4
  %tmp6 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf7 = getelementptr inbounds %struct.MD5_CTX* %tmp6, i32 0, i32 1
  %arrayidx8 = getelementptr inbounds [4 x i32]* %buf7, i32 0, i64 1
  store i32 -271733879, i32* %arrayidx8, align 4
  %tmp9 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf10 = getelementptr inbounds %struct.MD5_CTX* %tmp9, i32 0, i32 1
  %arrayidx11 = getelementptr inbounds [4 x i32]* %buf10, i32 0, i64 2
  store i32 -1732584194, i32* %arrayidx11, align 4
  %tmp12 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf13 = getelementptr inbounds %struct.MD5_CTX* %tmp12, i32 0, i32 1
  %arrayidx14 = getelementptr inbounds [4 x i32]* %buf13, i32 0, i64 3
  store i32 271733878, i32* %arrayidx14, align 4
  ret void
}

define void @MD5Update(%struct.MD5_CTX* %mdContext, i8* %inBuf, i32 %inLen) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  %inBuf.addr = alloca i8*, align 8
  %inLen.addr = alloca i32, align 4
  %in = alloca [16 x i32], align 16
  %mdi = alloca i32, align 4
  %i = alloca i32, align 4
  %ii = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  store i8* %inBuf, i8** %inBuf.addr, align 8
  store i32 %inLen, i32* %inLen.addr, align 4
  %tmp = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i1 = getelementptr inbounds %struct.MD5_CTX* %tmp, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %i1, i32 0, i64 0
  %tmp2 = load i32* %arrayidx, align 4
  %shr = lshr i32 %tmp2, 3
  %and = and i32 %shr, 63
  store i32 %and, i32* %mdi, align 4
  %tmp3 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i4 = getelementptr inbounds %struct.MD5_CTX* %tmp3, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [2 x i32]* %i4, i32 0, i64 0
  %tmp6 = load i32* %arrayidx5, align 4
  %tmp7 = load i32* %inLen.addr, align 4
  %shl = shl i32 %tmp7, 3
  %add = add i32 %tmp6, %shl
  %tmp8 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i9 = getelementptr inbounds %struct.MD5_CTX* %tmp8, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [2 x i32]* %i9, i32 0, i64 0
  %tmp11 = load i32* %arrayidx10, align 4
  %cmp = icmp ult i32 %add, %tmp11
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp12 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i13 = getelementptr inbounds %struct.MD5_CTX* %tmp12, i32 0, i32 0
  %arrayidx14 = getelementptr inbounds [2 x i32]* %i13, i32 0, i64 1
  %tmp15 = load i32* %arrayidx14, align 4
  %inc = add i32 %tmp15, 1
  store i32 %inc, i32* %arrayidx14, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp16 = load i32* %inLen.addr, align 4
  %shl17 = shl i32 %tmp16, 3
  %tmp18 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i19 = getelementptr inbounds %struct.MD5_CTX* %tmp18, i32 0, i32 0
  %arrayidx20 = getelementptr inbounds [2 x i32]* %i19, i32 0, i64 0
  %tmp21 = load i32* %arrayidx20, align 4
  %add22 = add i32 %tmp21, %shl17
  store i32 %add22, i32* %arrayidx20, align 4
  %tmp23 = load i32* %inLen.addr, align 4
  %shr24 = lshr i32 %tmp23, 29
  %tmp25 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i26 = getelementptr inbounds %struct.MD5_CTX* %tmp25, i32 0, i32 0
  %arrayidx27 = getelementptr inbounds [2 x i32]* %i26, i32 0, i64 1
  %tmp28 = load i32* %arrayidx27, align 4
  %add29 = add i32 %tmp28, %shr24
  store i32 %add29, i32* %arrayidx27, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end87, %if.end
  %tmp30 = load i32* %inLen.addr, align 4
  %dec = add i32 %tmp30, -1
  store i32 %dec, i32* %inLen.addr, align 4
  %tobool = icmp ne i32 %tmp30, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = load i8** %inBuf.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp31, i32 1
  store i8* %incdec.ptr, i8** %inBuf.addr, align 8
  %tmp32 = load i8* %tmp31
  %tmp33 = load i32* %mdi, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %mdi, align 4
  %idxprom = sext i32 %tmp33 to i64
  %tmp35 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in36 = getelementptr inbounds %struct.MD5_CTX* %tmp35, i32 0, i32 2
  %arrayidx37 = getelementptr inbounds [64 x i8]* %in36, i32 0, i64 %idxprom
  store i8 %tmp32, i8* %arrayidx37, align 1
  %tmp38 = load i32* %mdi, align 4
  %cmp39 = icmp eq i32 %tmp38, 64
  br i1 %cmp39, label %if.then40, label %if.end87

if.then40:                                        ; preds = %while.body
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then40
  %tmp41 = load i32* %i, align 4
  %cmp42 = icmp ult i32 %tmp41, 16
  br i1 %cmp42, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp43 = load i32* %ii, align 4
  %add44 = add i32 %tmp43, 3
  %idxprom45 = zext i32 %add44 to i64
  %tmp46 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in47 = getelementptr inbounds %struct.MD5_CTX* %tmp46, i32 0, i32 2
  %arrayidx48 = getelementptr inbounds [64 x i8]* %in47, i32 0, i64 %idxprom45
  %tmp49 = load i8* %arrayidx48, align 1
  %conv = zext i8 %tmp49 to i32
  %shl50 = shl i32 %conv, 24
  %tmp51 = load i32* %ii, align 4
  %add52 = add i32 %tmp51, 2
  %idxprom53 = zext i32 %add52 to i64
  %tmp54 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in55 = getelementptr inbounds %struct.MD5_CTX* %tmp54, i32 0, i32 2
  %arrayidx56 = getelementptr inbounds [64 x i8]* %in55, i32 0, i64 %idxprom53
  %tmp57 = load i8* %arrayidx56, align 1
  %conv58 = zext i8 %tmp57 to i32
  %shl59 = shl i32 %conv58, 16
  %or = or i32 %shl50, %shl59
  %tmp60 = load i32* %ii, align 4
  %add61 = add i32 %tmp60, 1
  %idxprom62 = zext i32 %add61 to i64
  %tmp63 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in64 = getelementptr inbounds %struct.MD5_CTX* %tmp63, i32 0, i32 2
  %arrayidx65 = getelementptr inbounds [64 x i8]* %in64, i32 0, i64 %idxprom62
  %tmp66 = load i8* %arrayidx65, align 1
  %conv67 = zext i8 %tmp66 to i32
  %shl68 = shl i32 %conv67, 8
  %or69 = or i32 %or, %shl68
  %tmp70 = load i32* %ii, align 4
  %idxprom71 = zext i32 %tmp70 to i64
  %tmp72 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in73 = getelementptr inbounds %struct.MD5_CTX* %tmp72, i32 0, i32 2
  %arrayidx74 = getelementptr inbounds [64 x i8]* %in73, i32 0, i64 %idxprom71
  %tmp75 = load i8* %arrayidx74, align 1
  %conv76 = zext i8 %tmp75 to i32
  %or77 = or i32 %or69, %conv76
  %tmp78 = load i32* %i, align 4
  %idxprom79 = zext i32 %tmp78 to i64
  %arrayidx80 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 %idxprom79
  store i32 %or77, i32* %arrayidx80, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp81 = load i32* %i, align 4
  %inc82 = add i32 %tmp81, 1
  store i32 %inc82, i32* %i, align 4
  %tmp83 = load i32* %ii, align 4
  %add84 = add i32 %tmp83, 4
  store i32 %add84, i32* %ii, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp85 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf = getelementptr inbounds %struct.MD5_CTX* %tmp85, i32 0, i32 1
  %arraydecay = getelementptr inbounds [4 x i32]* %buf, i32 0, i32 0
  %arraydecay86 = getelementptr inbounds [16 x i32]* %in, i32 0, i32 0
  call void (...)* bitcast (void (i32*, i32*)* @Transform to void (...)*)(i32* %arraydecay, i32* %arraydecay86)
  store i32 0, i32* %mdi, align 4
  br label %if.end87

if.end87:                                         ; preds = %for.end, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define void @MD5Final(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  %in = alloca [16 x i32], align 16
  %mdi = alloca i32, align 4
  %i = alloca i32, align 4
  %ii = alloca i32, align 4
  %padLen = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  %tmp = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i1 = getelementptr inbounds %struct.MD5_CTX* %tmp, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %i1, i32 0, i64 0
  %tmp2 = load i32* %arrayidx, align 4
  %arrayidx3 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 14
  store i32 %tmp2, i32* %arrayidx3, align 4
  %tmp4 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i5 = getelementptr inbounds %struct.MD5_CTX* %tmp4, i32 0, i32 0
  %arrayidx6 = getelementptr inbounds [2 x i32]* %i5, i32 0, i64 1
  %tmp7 = load i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 15
  store i32 %tmp7, i32* %arrayidx8, align 4
  %tmp9 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %i10 = getelementptr inbounds %struct.MD5_CTX* %tmp9, i32 0, i32 0
  %arrayidx11 = getelementptr inbounds [2 x i32]* %i10, i32 0, i64 0
  %tmp12 = load i32* %arrayidx11, align 4
  %shr = lshr i32 %tmp12, 3
  %and = and i32 %shr, 63
  store i32 %and, i32* %mdi, align 4
  %tmp13 = load i32* %mdi, align 4
  %cmp = icmp slt i32 %tmp13, 56
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp14 = load i32* %mdi, align 4
  %sub = sub nsw i32 56, %tmp14
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp15 = load i32* %mdi, align 4
  %sub16 = sub nsw i32 120, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub16, %cond.false ]
  store i32 %cond, i32* %padLen, align 4
  %tmp17 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %tmp18 = load i32* %padLen, align 4
  call void (...)* bitcast (void (%struct.MD5_CTX*, i8*, i32)* @MD5Update to void (...)*)(%struct.MD5_CTX* %tmp17, i8* getelementptr inbounds ([64 x i8]* @PADDING, i32 0, i32 0), i32 %tmp18)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %tmp19 = load i32* %i, align 4
  %cmp20 = icmp ult i32 %tmp19, 14
  br i1 %cmp20, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp21 = load i32* %ii, align 4
  %add = add i32 %tmp21, 3
  %idxprom = zext i32 %add to i64
  %tmp22 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in23 = getelementptr inbounds %struct.MD5_CTX* %tmp22, i32 0, i32 2
  %arrayidx24 = getelementptr inbounds [64 x i8]* %in23, i32 0, i64 %idxprom
  %tmp25 = load i8* %arrayidx24, align 1
  %conv = zext i8 %tmp25 to i32
  %shl = shl i32 %conv, 24
  %tmp26 = load i32* %ii, align 4
  %add27 = add i32 %tmp26, 2
  %idxprom28 = zext i32 %add27 to i64
  %tmp29 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in30 = getelementptr inbounds %struct.MD5_CTX* %tmp29, i32 0, i32 2
  %arrayidx31 = getelementptr inbounds [64 x i8]* %in30, i32 0, i64 %idxprom28
  %tmp32 = load i8* %arrayidx31, align 1
  %conv33 = zext i8 %tmp32 to i32
  %shl34 = shl i32 %conv33, 16
  %or = or i32 %shl, %shl34
  %tmp35 = load i32* %ii, align 4
  %add36 = add i32 %tmp35, 1
  %idxprom37 = zext i32 %add36 to i64
  %tmp38 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in39 = getelementptr inbounds %struct.MD5_CTX* %tmp38, i32 0, i32 2
  %arrayidx40 = getelementptr inbounds [64 x i8]* %in39, i32 0, i64 %idxprom37
  %tmp41 = load i8* %arrayidx40, align 1
  %conv42 = zext i8 %tmp41 to i32
  %shl43 = shl i32 %conv42, 8
  %or44 = or i32 %or, %shl43
  %tmp45 = load i32* %ii, align 4
  %idxprom46 = zext i32 %tmp45 to i64
  %tmp47 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %in48 = getelementptr inbounds %struct.MD5_CTX* %tmp47, i32 0, i32 2
  %arrayidx49 = getelementptr inbounds [64 x i8]* %in48, i32 0, i64 %idxprom46
  %tmp50 = load i8* %arrayidx49, align 1
  %conv51 = zext i8 %tmp50 to i32
  %or52 = or i32 %or44, %conv51
  %tmp53 = load i32* %i, align 4
  %idxprom54 = zext i32 %tmp53 to i64
  %arrayidx55 = getelementptr inbounds [16 x i32]* %in, i32 0, i64 %idxprom54
  store i32 %or52, i32* %arrayidx55, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp56 = load i32* %i, align 4
  %inc = add i32 %tmp56, 1
  store i32 %inc, i32* %i, align 4
  %tmp57 = load i32* %ii, align 4
  %add58 = add i32 %tmp57, 4
  store i32 %add58, i32* %ii, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp59 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf = getelementptr inbounds %struct.MD5_CTX* %tmp59, i32 0, i32 1
  %arraydecay = getelementptr inbounds [4 x i32]* %buf, i32 0, i32 0
  %arraydecay60 = getelementptr inbounds [16 x i32]* %in, i32 0, i32 0
  call void (...)* bitcast (void (i32*, i32*)* @Transform to void (...)*)(i32* %arraydecay, i32* %arraydecay60)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc123, %for.end
  %tmp62 = load i32* %i, align 4
  %cmp63 = icmp ult i32 %tmp62, 4
  br i1 %cmp63, label %for.body65, label %for.end128

for.body65:                                       ; preds = %for.cond61
  %tmp66 = load i32* %i, align 4
  %idxprom67 = zext i32 %tmp66 to i64
  %tmp68 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf69 = getelementptr inbounds %struct.MD5_CTX* %tmp68, i32 0, i32 1
  %arrayidx70 = getelementptr inbounds [4 x i32]* %buf69, i32 0, i64 %idxprom67
  %tmp71 = load i32* %arrayidx70, align 4
  %and72 = and i32 %tmp71, 255
  %conv73 = trunc i32 %and72 to i8
  %tmp74 = load i32* %ii, align 4
  %idxprom75 = zext i32 %tmp74 to i64
  %tmp76 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest = getelementptr inbounds %struct.MD5_CTX* %tmp76, i32 0, i32 3
  %arrayidx77 = getelementptr inbounds [16 x i8]* %digest, i32 0, i64 %idxprom75
  store i8 %conv73, i8* %arrayidx77, align 1
  %tmp78 = load i32* %i, align 4
  %idxprom79 = zext i32 %tmp78 to i64
  %tmp80 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf81 = getelementptr inbounds %struct.MD5_CTX* %tmp80, i32 0, i32 1
  %arrayidx82 = getelementptr inbounds [4 x i32]* %buf81, i32 0, i64 %idxprom79
  %tmp83 = load i32* %arrayidx82, align 4
  %shr84 = lshr i32 %tmp83, 8
  %and85 = and i32 %shr84, 255
  %conv86 = trunc i32 %and85 to i8
  %tmp87 = load i32* %ii, align 4
  %add88 = add i32 %tmp87, 1
  %idxprom89 = zext i32 %add88 to i64
  %tmp90 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest91 = getelementptr inbounds %struct.MD5_CTX* %tmp90, i32 0, i32 3
  %arrayidx92 = getelementptr inbounds [16 x i8]* %digest91, i32 0, i64 %idxprom89
  store i8 %conv86, i8* %arrayidx92, align 1
  %tmp93 = load i32* %i, align 4
  %idxprom94 = zext i32 %tmp93 to i64
  %tmp95 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf96 = getelementptr inbounds %struct.MD5_CTX* %tmp95, i32 0, i32 1
  %arrayidx97 = getelementptr inbounds [4 x i32]* %buf96, i32 0, i64 %idxprom94
  %tmp98 = load i32* %arrayidx97, align 4
  %shr99 = lshr i32 %tmp98, 16
  %and100 = and i32 %shr99, 255
  %conv101 = trunc i32 %and100 to i8
  %tmp102 = load i32* %ii, align 4
  %add103 = add i32 %tmp102, 2
  %idxprom104 = zext i32 %add103 to i64
  %tmp105 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest106 = getelementptr inbounds %struct.MD5_CTX* %tmp105, i32 0, i32 3
  %arrayidx107 = getelementptr inbounds [16 x i8]* %digest106, i32 0, i64 %idxprom104
  store i8 %conv101, i8* %arrayidx107, align 1
  %tmp108 = load i32* %i, align 4
  %idxprom109 = zext i32 %tmp108 to i64
  %tmp110 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %buf111 = getelementptr inbounds %struct.MD5_CTX* %tmp110, i32 0, i32 1
  %arrayidx112 = getelementptr inbounds [4 x i32]* %buf111, i32 0, i64 %idxprom109
  %tmp113 = load i32* %arrayidx112, align 4
  %shr114 = lshr i32 %tmp113, 24
  %and115 = and i32 %shr114, 255
  %conv116 = trunc i32 %and115 to i8
  %tmp117 = load i32* %ii, align 4
  %add118 = add i32 %tmp117, 3
  %idxprom119 = zext i32 %add118 to i64
  %tmp120 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest121 = getelementptr inbounds %struct.MD5_CTX* %tmp120, i32 0, i32 3
  %arrayidx122 = getelementptr inbounds [16 x i8]* %digest121, i32 0, i64 %idxprom119
  store i8 %conv116, i8* %arrayidx122, align 1
  br label %for.inc123

for.inc123:                                       ; preds = %for.body65
  %tmp124 = load i32* %i, align 4
  %inc125 = add i32 %tmp124, 1
  store i32 %inc125, i32* %i, align 4
  %tmp126 = load i32* %ii, align 4
  %add127 = add i32 %tmp126, 4
  store i32 %add127, i32* %ii, align 4
  br label %for.cond61

for.end128:                                       ; preds = %for.cond61
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @MDTestSuite()
  ret i32 0
}

define internal void @MDTestSuite() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([27 x i8]* @.str5, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([63 x i8]* @.str6, i32 0, i32 0))
  call void (...)* bitcast (void (i8*)* @MDString to void (...)*)(i8* getelementptr inbounds ([81 x i8]* @.str7, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @MDString(i8* %inString) nounwind uwtable {
entry:
  %inString.addr = alloca i8*, align 8
  %mdContext = alloca %struct.MD5_CTX, align 4
  %len = alloca i32, align 4
  store i8* %inString, i8** %inString.addr, align 8
  %tmp = load i8** %inString.addr, align 8
  %call = call i64 @strlen(i8* %tmp) nounwind readonly
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %len, align 4
  call void (...)* bitcast (void (%struct.MD5_CTX*)* @MD5Init to void (...)*)(%struct.MD5_CTX* %mdContext)
  %tmp1 = load i8** %inString.addr, align 8
  %tmp2 = load i32* %len, align 4
  call void (...)* bitcast (void (%struct.MD5_CTX*, i8*, i32)* @MD5Update to void (...)*)(%struct.MD5_CTX* %mdContext, i8* %tmp1, i32 %tmp2)
  call void (...)* bitcast (void (%struct.MD5_CTX*)* @MD5Final to void (...)*)(%struct.MD5_CTX* %mdContext)
  call void (...)* bitcast (void (%struct.MD5_CTX*)* @MDPrint to void (...)*)(%struct.MD5_CTX* %mdContext)
  %tmp3 = load i8** %inString.addr, align 8
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), i8* %tmp3)
  ret void
}

declare i64 @strlen(i8*) nounwind readonly

define internal void @MDPrint(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %mdContext.addr = alloca %struct.MD5_CTX*, align 8
  %i = alloca i32, align 4
  store %struct.MD5_CTX* %mdContext, %struct.MD5_CTX** %mdContext.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load %struct.MD5_CTX** %mdContext.addr, align 8
  %digest = getelementptr inbounds %struct.MD5_CTX* %tmp2, i32 0, i32 3
  %arrayidx = getelementptr inbounds [16 x i8]* %digest, i32 0, i64 %idxprom
  %tmp3 = load i8* %arrayidx, align 1
  %conv = zext i8 %tmp3 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  %inc = add nsw i32 %tmp4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define internal void @Transform(i32* %buf, i32* %in) nounwind uwtable {
entry:
  %buf.addr = alloca i32*, align 8
  %in.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32* %buf, i32** %buf.addr, align 8
  store i32* %in, i32** %in.addr, align 8
  %tmp = load i32** %buf.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp, i64 0
  %tmp1 = load i32* %arrayidx
  store i32 %tmp1, i32* %a, align 4
  %tmp3 = load i32** %buf.addr, align 8
  %arrayidx4 = getelementptr inbounds i32* %tmp3, i64 1
  %tmp5 = load i32* %arrayidx4
  store i32 %tmp5, i32* %b, align 4
  %tmp7 = load i32** %buf.addr, align 8
  %arrayidx8 = getelementptr inbounds i32* %tmp7, i64 2
  %tmp9 = load i32* %arrayidx8
  store i32 %tmp9, i32* %c, align 4
  %tmp11 = load i32** %buf.addr, align 8
  %arrayidx12 = getelementptr inbounds i32* %tmp11, i64 3
  %tmp13 = load i32* %arrayidx12
  store i32 %tmp13, i32* %d, align 4
  %tmp14 = load i32* %b, align 4
  %tmp15 = load i32* %c, align 4
  %and = and i32 %tmp14, %tmp15
  %tmp16 = load i32* %b, align 4
  %neg = xor i32 %tmp16, -1
  %tmp17 = load i32* %d, align 4
  %and18 = and i32 %neg, %tmp17
  %or = or i32 %and, %and18
  %tmp19 = load i32** %in.addr, align 8
  %arrayidx20 = getelementptr inbounds i32* %tmp19, i64 0
  %tmp21 = load i32* %arrayidx20
  %add = add i32 %or, %tmp21
  %add22 = add i32 %add, -680876936
  %tmp23 = load i32* %a, align 4
  %add24 = add i32 %tmp23, %add22
  store i32 %add24, i32* %a, align 4
  %tmp25 = load i32* %a, align 4
  %shl = shl i32 %tmp25, 7
  %tmp26 = load i32* %a, align 4
  %shr = lshr i32 %tmp26, 25
  %or27 = or i32 %shl, %shr
  store i32 %or27, i32* %a, align 4
  %tmp28 = load i32* %b, align 4
  %tmp29 = load i32* %a, align 4
  %add30 = add i32 %tmp29, %tmp28
  store i32 %add30, i32* %a, align 4
  %tmp31 = load i32* %a, align 4
  %tmp32 = load i32* %b, align 4
  %and33 = and i32 %tmp31, %tmp32
  %tmp34 = load i32* %a, align 4
  %neg35 = xor i32 %tmp34, -1
  %tmp36 = load i32* %c, align 4
  %and37 = and i32 %neg35, %tmp36
  %or38 = or i32 %and33, %and37
  %tmp39 = load i32** %in.addr, align 8
  %arrayidx40 = getelementptr inbounds i32* %tmp39, i64 1
  %tmp41 = load i32* %arrayidx40
  %add42 = add i32 %or38, %tmp41
  %add43 = add i32 %add42, -389564586
  %tmp44 = load i32* %d, align 4
  %add45 = add i32 %tmp44, %add43
  store i32 %add45, i32* %d, align 4
  %tmp46 = load i32* %d, align 4
  %shl47 = shl i32 %tmp46, 12
  %tmp48 = load i32* %d, align 4
  %shr49 = lshr i32 %tmp48, 20
  %or50 = or i32 %shl47, %shr49
  store i32 %or50, i32* %d, align 4
  %tmp51 = load i32* %a, align 4
  %tmp52 = load i32* %d, align 4
  %add53 = add i32 %tmp52, %tmp51
  store i32 %add53, i32* %d, align 4
  %tmp54 = load i32* %d, align 4
  %tmp55 = load i32* %a, align 4
  %and56 = and i32 %tmp54, %tmp55
  %tmp57 = load i32* %d, align 4
  %neg58 = xor i32 %tmp57, -1
  %tmp59 = load i32* %b, align 4
  %and60 = and i32 %neg58, %tmp59
  %or61 = or i32 %and56, %and60
  %tmp62 = load i32** %in.addr, align 8
  %arrayidx63 = getelementptr inbounds i32* %tmp62, i64 2
  %tmp64 = load i32* %arrayidx63
  %add65 = add i32 %or61, %tmp64
  %add66 = add i32 %add65, 606105819
  %tmp67 = load i32* %c, align 4
  %add68 = add i32 %tmp67, %add66
  store i32 %add68, i32* %c, align 4
  %tmp69 = load i32* %c, align 4
  %shl70 = shl i32 %tmp69, 17
  %tmp71 = load i32* %c, align 4
  %shr72 = lshr i32 %tmp71, 15
  %or73 = or i32 %shl70, %shr72
  store i32 %or73, i32* %c, align 4
  %tmp74 = load i32* %d, align 4
  %tmp75 = load i32* %c, align 4
  %add76 = add i32 %tmp75, %tmp74
  store i32 %add76, i32* %c, align 4
  %tmp77 = load i32* %c, align 4
  %tmp78 = load i32* %d, align 4
  %and79 = and i32 %tmp77, %tmp78
  %tmp80 = load i32* %c, align 4
  %neg81 = xor i32 %tmp80, -1
  %tmp82 = load i32* %a, align 4
  %and83 = and i32 %neg81, %tmp82
  %or84 = or i32 %and79, %and83
  %tmp85 = load i32** %in.addr, align 8
  %arrayidx86 = getelementptr inbounds i32* %tmp85, i64 3
  %tmp87 = load i32* %arrayidx86
  %add88 = add i32 %or84, %tmp87
  %add89 = add i32 %add88, -1044525330
  %tmp90 = load i32* %b, align 4
  %add91 = add i32 %tmp90, %add89
  store i32 %add91, i32* %b, align 4
  %tmp92 = load i32* %b, align 4
  %shl93 = shl i32 %tmp92, 22
  %tmp94 = load i32* %b, align 4
  %shr95 = lshr i32 %tmp94, 10
  %or96 = or i32 %shl93, %shr95
  store i32 %or96, i32* %b, align 4
  %tmp97 = load i32* %c, align 4
  %tmp98 = load i32* %b, align 4
  %add99 = add i32 %tmp98, %tmp97
  store i32 %add99, i32* %b, align 4
  %tmp100 = load i32* %b, align 4
  %tmp101 = load i32* %c, align 4
  %and102 = and i32 %tmp100, %tmp101
  %tmp103 = load i32* %b, align 4
  %neg104 = xor i32 %tmp103, -1
  %tmp105 = load i32* %d, align 4
  %and106 = and i32 %neg104, %tmp105
  %or107 = or i32 %and102, %and106
  %tmp108 = load i32** %in.addr, align 8
  %arrayidx109 = getelementptr inbounds i32* %tmp108, i64 4
  %tmp110 = load i32* %arrayidx109
  %add111 = add i32 %or107, %tmp110
  %add112 = add i32 %add111, -176418897
  %tmp113 = load i32* %a, align 4
  %add114 = add i32 %tmp113, %add112
  store i32 %add114, i32* %a, align 4
  %tmp115 = load i32* %a, align 4
  %shl116 = shl i32 %tmp115, 7
  %tmp117 = load i32* %a, align 4
  %shr118 = lshr i32 %tmp117, 25
  %or119 = or i32 %shl116, %shr118
  store i32 %or119, i32* %a, align 4
  %tmp120 = load i32* %b, align 4
  %tmp121 = load i32* %a, align 4
  %add122 = add i32 %tmp121, %tmp120
  store i32 %add122, i32* %a, align 4
  %tmp123 = load i32* %a, align 4
  %tmp124 = load i32* %b, align 4
  %and125 = and i32 %tmp123, %tmp124
  %tmp126 = load i32* %a, align 4
  %neg127 = xor i32 %tmp126, -1
  %tmp128 = load i32* %c, align 4
  %and129 = and i32 %neg127, %tmp128
  %or130 = or i32 %and125, %and129
  %tmp131 = load i32** %in.addr, align 8
  %arrayidx132 = getelementptr inbounds i32* %tmp131, i64 5
  %tmp133 = load i32* %arrayidx132
  %add134 = add i32 %or130, %tmp133
  %add135 = add i32 %add134, 1200080426
  %tmp136 = load i32* %d, align 4
  %add137 = add i32 %tmp136, %add135
  store i32 %add137, i32* %d, align 4
  %tmp138 = load i32* %d, align 4
  %shl139 = shl i32 %tmp138, 12
  %tmp140 = load i32* %d, align 4
  %shr141 = lshr i32 %tmp140, 20
  %or142 = or i32 %shl139, %shr141
  store i32 %or142, i32* %d, align 4
  %tmp143 = load i32* %a, align 4
  %tmp144 = load i32* %d, align 4
  %add145 = add i32 %tmp144, %tmp143
  store i32 %add145, i32* %d, align 4
  %tmp146 = load i32* %d, align 4
  %tmp147 = load i32* %a, align 4
  %and148 = and i32 %tmp146, %tmp147
  %tmp149 = load i32* %d, align 4
  %neg150 = xor i32 %tmp149, -1
  %tmp151 = load i32* %b, align 4
  %and152 = and i32 %neg150, %tmp151
  %or153 = or i32 %and148, %and152
  %tmp154 = load i32** %in.addr, align 8
  %arrayidx155 = getelementptr inbounds i32* %tmp154, i64 6
  %tmp156 = load i32* %arrayidx155
  %add157 = add i32 %or153, %tmp156
  %add158 = add i32 %add157, -1473231341
  %tmp159 = load i32* %c, align 4
  %add160 = add i32 %tmp159, %add158
  store i32 %add160, i32* %c, align 4
  %tmp161 = load i32* %c, align 4
  %shl162 = shl i32 %tmp161, 17
  %tmp163 = load i32* %c, align 4
  %shr164 = lshr i32 %tmp163, 15
  %or165 = or i32 %shl162, %shr164
  store i32 %or165, i32* %c, align 4
  %tmp166 = load i32* %d, align 4
  %tmp167 = load i32* %c, align 4
  %add168 = add i32 %tmp167, %tmp166
  store i32 %add168, i32* %c, align 4
  %tmp169 = load i32* %c, align 4
  %tmp170 = load i32* %d, align 4
  %and171 = and i32 %tmp169, %tmp170
  %tmp172 = load i32* %c, align 4
  %neg173 = xor i32 %tmp172, -1
  %tmp174 = load i32* %a, align 4
  %and175 = and i32 %neg173, %tmp174
  %or176 = or i32 %and171, %and175
  %tmp177 = load i32** %in.addr, align 8
  %arrayidx178 = getelementptr inbounds i32* %tmp177, i64 7
  %tmp179 = load i32* %arrayidx178
  %add180 = add i32 %or176, %tmp179
  %add181 = add i32 %add180, -45705983
  %tmp182 = load i32* %b, align 4
  %add183 = add i32 %tmp182, %add181
  store i32 %add183, i32* %b, align 4
  %tmp184 = load i32* %b, align 4
  %shl185 = shl i32 %tmp184, 22
  %tmp186 = load i32* %b, align 4
  %shr187 = lshr i32 %tmp186, 10
  %or188 = or i32 %shl185, %shr187
  store i32 %or188, i32* %b, align 4
  %tmp189 = load i32* %c, align 4
  %tmp190 = load i32* %b, align 4
  %add191 = add i32 %tmp190, %tmp189
  store i32 %add191, i32* %b, align 4
  %tmp192 = load i32* %b, align 4
  %tmp193 = load i32* %c, align 4
  %and194 = and i32 %tmp192, %tmp193
  %tmp195 = load i32* %b, align 4
  %neg196 = xor i32 %tmp195, -1
  %tmp197 = load i32* %d, align 4
  %and198 = and i32 %neg196, %tmp197
  %or199 = or i32 %and194, %and198
  %tmp200 = load i32** %in.addr, align 8
  %arrayidx201 = getelementptr inbounds i32* %tmp200, i64 8
  %tmp202 = load i32* %arrayidx201
  %add203 = add i32 %or199, %tmp202
  %add204 = add i32 %add203, 1770035416
  %tmp205 = load i32* %a, align 4
  %add206 = add i32 %tmp205, %add204
  store i32 %add206, i32* %a, align 4
  %tmp207 = load i32* %a, align 4
  %shl208 = shl i32 %tmp207, 7
  %tmp209 = load i32* %a, align 4
  %shr210 = lshr i32 %tmp209, 25
  %or211 = or i32 %shl208, %shr210
  store i32 %or211, i32* %a, align 4
  %tmp212 = load i32* %b, align 4
  %tmp213 = load i32* %a, align 4
  %add214 = add i32 %tmp213, %tmp212
  store i32 %add214, i32* %a, align 4
  %tmp215 = load i32* %a, align 4
  %tmp216 = load i32* %b, align 4
  %and217 = and i32 %tmp215, %tmp216
  %tmp218 = load i32* %a, align 4
  %neg219 = xor i32 %tmp218, -1
  %tmp220 = load i32* %c, align 4
  %and221 = and i32 %neg219, %tmp220
  %or222 = or i32 %and217, %and221
  %tmp223 = load i32** %in.addr, align 8
  %arrayidx224 = getelementptr inbounds i32* %tmp223, i64 9
  %tmp225 = load i32* %arrayidx224
  %add226 = add i32 %or222, %tmp225
  %add227 = add i32 %add226, -1958414417
  %tmp228 = load i32* %d, align 4
  %add229 = add i32 %tmp228, %add227
  store i32 %add229, i32* %d, align 4
  %tmp230 = load i32* %d, align 4
  %shl231 = shl i32 %tmp230, 12
  %tmp232 = load i32* %d, align 4
  %shr233 = lshr i32 %tmp232, 20
  %or234 = or i32 %shl231, %shr233
  store i32 %or234, i32* %d, align 4
  %tmp235 = load i32* %a, align 4
  %tmp236 = load i32* %d, align 4
  %add237 = add i32 %tmp236, %tmp235
  store i32 %add237, i32* %d, align 4
  %tmp238 = load i32* %d, align 4
  %tmp239 = load i32* %a, align 4
  %and240 = and i32 %tmp238, %tmp239
  %tmp241 = load i32* %d, align 4
  %neg242 = xor i32 %tmp241, -1
  %tmp243 = load i32* %b, align 4
  %and244 = and i32 %neg242, %tmp243
  %or245 = or i32 %and240, %and244
  %tmp246 = load i32** %in.addr, align 8
  %arrayidx247 = getelementptr inbounds i32* %tmp246, i64 10
  %tmp248 = load i32* %arrayidx247
  %add249 = add i32 %or245, %tmp248
  %add250 = add i32 %add249, -42063
  %tmp251 = load i32* %c, align 4
  %add252 = add i32 %tmp251, %add250
  store i32 %add252, i32* %c, align 4
  %tmp253 = load i32* %c, align 4
  %shl254 = shl i32 %tmp253, 17
  %tmp255 = load i32* %c, align 4
  %shr256 = lshr i32 %tmp255, 15
  %or257 = or i32 %shl254, %shr256
  store i32 %or257, i32* %c, align 4
  %tmp258 = load i32* %d, align 4
  %tmp259 = load i32* %c, align 4
  %add260 = add i32 %tmp259, %tmp258
  store i32 %add260, i32* %c, align 4
  %tmp261 = load i32* %c, align 4
  %tmp262 = load i32* %d, align 4
  %and263 = and i32 %tmp261, %tmp262
  %tmp264 = load i32* %c, align 4
  %neg265 = xor i32 %tmp264, -1
  %tmp266 = load i32* %a, align 4
  %and267 = and i32 %neg265, %tmp266
  %or268 = or i32 %and263, %and267
  %tmp269 = load i32** %in.addr, align 8
  %arrayidx270 = getelementptr inbounds i32* %tmp269, i64 11
  %tmp271 = load i32* %arrayidx270
  %add272 = add i32 %or268, %tmp271
  %add273 = add i32 %add272, -1990404162
  %tmp274 = load i32* %b, align 4
  %add275 = add i32 %tmp274, %add273
  store i32 %add275, i32* %b, align 4
  %tmp276 = load i32* %b, align 4
  %shl277 = shl i32 %tmp276, 22
  %tmp278 = load i32* %b, align 4
  %shr279 = lshr i32 %tmp278, 10
  %or280 = or i32 %shl277, %shr279
  store i32 %or280, i32* %b, align 4
  %tmp281 = load i32* %c, align 4
  %tmp282 = load i32* %b, align 4
  %add283 = add i32 %tmp282, %tmp281
  store i32 %add283, i32* %b, align 4
  %tmp284 = load i32* %b, align 4
  %tmp285 = load i32* %c, align 4
  %and286 = and i32 %tmp284, %tmp285
  %tmp287 = load i32* %b, align 4
  %neg288 = xor i32 %tmp287, -1
  %tmp289 = load i32* %d, align 4
  %and290 = and i32 %neg288, %tmp289
  %or291 = or i32 %and286, %and290
  %tmp292 = load i32** %in.addr, align 8
  %arrayidx293 = getelementptr inbounds i32* %tmp292, i64 12
  %tmp294 = load i32* %arrayidx293
  %add295 = add i32 %or291, %tmp294
  %add296 = add i32 %add295, 1804603682
  %tmp297 = load i32* %a, align 4
  %add298 = add i32 %tmp297, %add296
  store i32 %add298, i32* %a, align 4
  %tmp299 = load i32* %a, align 4
  %shl300 = shl i32 %tmp299, 7
  %tmp301 = load i32* %a, align 4
  %shr302 = lshr i32 %tmp301, 25
  %or303 = or i32 %shl300, %shr302
  store i32 %or303, i32* %a, align 4
  %tmp304 = load i32* %b, align 4
  %tmp305 = load i32* %a, align 4
  %add306 = add i32 %tmp305, %tmp304
  store i32 %add306, i32* %a, align 4
  %tmp307 = load i32* %a, align 4
  %tmp308 = load i32* %b, align 4
  %and309 = and i32 %tmp307, %tmp308
  %tmp310 = load i32* %a, align 4
  %neg311 = xor i32 %tmp310, -1
  %tmp312 = load i32* %c, align 4
  %and313 = and i32 %neg311, %tmp312
  %or314 = or i32 %and309, %and313
  %tmp315 = load i32** %in.addr, align 8
  %arrayidx316 = getelementptr inbounds i32* %tmp315, i64 13
  %tmp317 = load i32* %arrayidx316
  %add318 = add i32 %or314, %tmp317
  %add319 = add i32 %add318, -40341101
  %tmp320 = load i32* %d, align 4
  %add321 = add i32 %tmp320, %add319
  store i32 %add321, i32* %d, align 4
  %tmp322 = load i32* %d, align 4
  %shl323 = shl i32 %tmp322, 12
  %tmp324 = load i32* %d, align 4
  %shr325 = lshr i32 %tmp324, 20
  %or326 = or i32 %shl323, %shr325
  store i32 %or326, i32* %d, align 4
  %tmp327 = load i32* %a, align 4
  %tmp328 = load i32* %d, align 4
  %add329 = add i32 %tmp328, %tmp327
  store i32 %add329, i32* %d, align 4
  %tmp330 = load i32* %d, align 4
  %tmp331 = load i32* %a, align 4
  %and332 = and i32 %tmp330, %tmp331
  %tmp333 = load i32* %d, align 4
  %neg334 = xor i32 %tmp333, -1
  %tmp335 = load i32* %b, align 4
  %and336 = and i32 %neg334, %tmp335
  %or337 = or i32 %and332, %and336
  %tmp338 = load i32** %in.addr, align 8
  %arrayidx339 = getelementptr inbounds i32* %tmp338, i64 14
  %tmp340 = load i32* %arrayidx339
  %add341 = add i32 %or337, %tmp340
  %add342 = add i32 %add341, -1502002290
  %tmp343 = load i32* %c, align 4
  %add344 = add i32 %tmp343, %add342
  store i32 %add344, i32* %c, align 4
  %tmp345 = load i32* %c, align 4
  %shl346 = shl i32 %tmp345, 17
  %tmp347 = load i32* %c, align 4
  %shr348 = lshr i32 %tmp347, 15
  %or349 = or i32 %shl346, %shr348
  store i32 %or349, i32* %c, align 4
  %tmp350 = load i32* %d, align 4
  %tmp351 = load i32* %c, align 4
  %add352 = add i32 %tmp351, %tmp350
  store i32 %add352, i32* %c, align 4
  %tmp353 = load i32* %c, align 4
  %tmp354 = load i32* %d, align 4
  %and355 = and i32 %tmp353, %tmp354
  %tmp356 = load i32* %c, align 4
  %neg357 = xor i32 %tmp356, -1
  %tmp358 = load i32* %a, align 4
  %and359 = and i32 %neg357, %tmp358
  %or360 = or i32 %and355, %and359
  %tmp361 = load i32** %in.addr, align 8
  %arrayidx362 = getelementptr inbounds i32* %tmp361, i64 15
  %tmp363 = load i32* %arrayidx362
  %add364 = add i32 %or360, %tmp363
  %add365 = add i32 %add364, 1236535329
  %tmp366 = load i32* %b, align 4
  %add367 = add i32 %tmp366, %add365
  store i32 %add367, i32* %b, align 4
  %tmp368 = load i32* %b, align 4
  %shl369 = shl i32 %tmp368, 22
  %tmp370 = load i32* %b, align 4
  %shr371 = lshr i32 %tmp370, 10
  %or372 = or i32 %shl369, %shr371
  store i32 %or372, i32* %b, align 4
  %tmp373 = load i32* %c, align 4
  %tmp374 = load i32* %b, align 4
  %add375 = add i32 %tmp374, %tmp373
  store i32 %add375, i32* %b, align 4
  %tmp376 = load i32* %b, align 4
  %tmp377 = load i32* %d, align 4
  %and378 = and i32 %tmp376, %tmp377
  %tmp379 = load i32* %c, align 4
  %tmp380 = load i32* %d, align 4
  %neg381 = xor i32 %tmp380, -1
  %and382 = and i32 %tmp379, %neg381
  %or383 = or i32 %and378, %and382
  %tmp384 = load i32** %in.addr, align 8
  %arrayidx385 = getelementptr inbounds i32* %tmp384, i64 1
  %tmp386 = load i32* %arrayidx385
  %add387 = add i32 %or383, %tmp386
  %add388 = add i32 %add387, -165796510
  %tmp389 = load i32* %a, align 4
  %add390 = add i32 %tmp389, %add388
  store i32 %add390, i32* %a, align 4
  %tmp391 = load i32* %a, align 4
  %shl392 = shl i32 %tmp391, 5
  %tmp393 = load i32* %a, align 4
  %shr394 = lshr i32 %tmp393, 27
  %or395 = or i32 %shl392, %shr394
  store i32 %or395, i32* %a, align 4
  %tmp396 = load i32* %b, align 4
  %tmp397 = load i32* %a, align 4
  %add398 = add i32 %tmp397, %tmp396
  store i32 %add398, i32* %a, align 4
  %tmp399 = load i32* %a, align 4
  %tmp400 = load i32* %c, align 4
  %and401 = and i32 %tmp399, %tmp400
  %tmp402 = load i32* %b, align 4
  %tmp403 = load i32* %c, align 4
  %neg404 = xor i32 %tmp403, -1
  %and405 = and i32 %tmp402, %neg404
  %or406 = or i32 %and401, %and405
  %tmp407 = load i32** %in.addr, align 8
  %arrayidx408 = getelementptr inbounds i32* %tmp407, i64 6
  %tmp409 = load i32* %arrayidx408
  %add410 = add i32 %or406, %tmp409
  %add411 = add i32 %add410, -1069501632
  %tmp412 = load i32* %d, align 4
  %add413 = add i32 %tmp412, %add411
  store i32 %add413, i32* %d, align 4
  %tmp414 = load i32* %d, align 4
  %shl415 = shl i32 %tmp414, 9
  %tmp416 = load i32* %d, align 4
  %shr417 = lshr i32 %tmp416, 23
  %or418 = or i32 %shl415, %shr417
  store i32 %or418, i32* %d, align 4
  %tmp419 = load i32* %a, align 4
  %tmp420 = load i32* %d, align 4
  %add421 = add i32 %tmp420, %tmp419
  store i32 %add421, i32* %d, align 4
  %tmp422 = load i32* %d, align 4
  %tmp423 = load i32* %b, align 4
  %and424 = and i32 %tmp422, %tmp423
  %tmp425 = load i32* %a, align 4
  %tmp426 = load i32* %b, align 4
  %neg427 = xor i32 %tmp426, -1
  %and428 = and i32 %tmp425, %neg427
  %or429 = or i32 %and424, %and428
  %tmp430 = load i32** %in.addr, align 8
  %arrayidx431 = getelementptr inbounds i32* %tmp430, i64 11
  %tmp432 = load i32* %arrayidx431
  %add433 = add i32 %or429, %tmp432
  %add434 = add i32 %add433, 643717713
  %tmp435 = load i32* %c, align 4
  %add436 = add i32 %tmp435, %add434
  store i32 %add436, i32* %c, align 4
  %tmp437 = load i32* %c, align 4
  %shl438 = shl i32 %tmp437, 14
  %tmp439 = load i32* %c, align 4
  %shr440 = lshr i32 %tmp439, 18
  %or441 = or i32 %shl438, %shr440
  store i32 %or441, i32* %c, align 4
  %tmp442 = load i32* %d, align 4
  %tmp443 = load i32* %c, align 4
  %add444 = add i32 %tmp443, %tmp442
  store i32 %add444, i32* %c, align 4
  %tmp445 = load i32* %c, align 4
  %tmp446 = load i32* %a, align 4
  %and447 = and i32 %tmp445, %tmp446
  %tmp448 = load i32* %d, align 4
  %tmp449 = load i32* %a, align 4
  %neg450 = xor i32 %tmp449, -1
  %and451 = and i32 %tmp448, %neg450
  %or452 = or i32 %and447, %and451
  %tmp453 = load i32** %in.addr, align 8
  %arrayidx454 = getelementptr inbounds i32* %tmp453, i64 0
  %tmp455 = load i32* %arrayidx454
  %add456 = add i32 %or452, %tmp455
  %add457 = add i32 %add456, -373897302
  %tmp458 = load i32* %b, align 4
  %add459 = add i32 %tmp458, %add457
  store i32 %add459, i32* %b, align 4
  %tmp460 = load i32* %b, align 4
  %shl461 = shl i32 %tmp460, 20
  %tmp462 = load i32* %b, align 4
  %shr463 = lshr i32 %tmp462, 12
  %or464 = or i32 %shl461, %shr463
  store i32 %or464, i32* %b, align 4
  %tmp465 = load i32* %c, align 4
  %tmp466 = load i32* %b, align 4
  %add467 = add i32 %tmp466, %tmp465
  store i32 %add467, i32* %b, align 4
  %tmp468 = load i32* %b, align 4
  %tmp469 = load i32* %d, align 4
  %and470 = and i32 %tmp468, %tmp469
  %tmp471 = load i32* %c, align 4
  %tmp472 = load i32* %d, align 4
  %neg473 = xor i32 %tmp472, -1
  %and474 = and i32 %tmp471, %neg473
  %or475 = or i32 %and470, %and474
  %tmp476 = load i32** %in.addr, align 8
  %arrayidx477 = getelementptr inbounds i32* %tmp476, i64 5
  %tmp478 = load i32* %arrayidx477
  %add479 = add i32 %or475, %tmp478
  %add480 = add i32 %add479, -701558691
  %tmp481 = load i32* %a, align 4
  %add482 = add i32 %tmp481, %add480
  store i32 %add482, i32* %a, align 4
  %tmp483 = load i32* %a, align 4
  %shl484 = shl i32 %tmp483, 5
  %tmp485 = load i32* %a, align 4
  %shr486 = lshr i32 %tmp485, 27
  %or487 = or i32 %shl484, %shr486
  store i32 %or487, i32* %a, align 4
  %tmp488 = load i32* %b, align 4
  %tmp489 = load i32* %a, align 4
  %add490 = add i32 %tmp489, %tmp488
  store i32 %add490, i32* %a, align 4
  %tmp491 = load i32* %a, align 4
  %tmp492 = load i32* %c, align 4
  %and493 = and i32 %tmp491, %tmp492
  %tmp494 = load i32* %b, align 4
  %tmp495 = load i32* %c, align 4
  %neg496 = xor i32 %tmp495, -1
  %and497 = and i32 %tmp494, %neg496
  %or498 = or i32 %and493, %and497
  %tmp499 = load i32** %in.addr, align 8
  %arrayidx500 = getelementptr inbounds i32* %tmp499, i64 10
  %tmp501 = load i32* %arrayidx500
  %add502 = add i32 %or498, %tmp501
  %add503 = add i32 %add502, 38016083
  %tmp504 = load i32* %d, align 4
  %add505 = add i32 %tmp504, %add503
  store i32 %add505, i32* %d, align 4
  %tmp506 = load i32* %d, align 4
  %shl507 = shl i32 %tmp506, 9
  %tmp508 = load i32* %d, align 4
  %shr509 = lshr i32 %tmp508, 23
  %or510 = or i32 %shl507, %shr509
  store i32 %or510, i32* %d, align 4
  %tmp511 = load i32* %a, align 4
  %tmp512 = load i32* %d, align 4
  %add513 = add i32 %tmp512, %tmp511
  store i32 %add513, i32* %d, align 4
  %tmp514 = load i32* %d, align 4
  %tmp515 = load i32* %b, align 4
  %and516 = and i32 %tmp514, %tmp515
  %tmp517 = load i32* %a, align 4
  %tmp518 = load i32* %b, align 4
  %neg519 = xor i32 %tmp518, -1
  %and520 = and i32 %tmp517, %neg519
  %or521 = or i32 %and516, %and520
  %tmp522 = load i32** %in.addr, align 8
  %arrayidx523 = getelementptr inbounds i32* %tmp522, i64 15
  %tmp524 = load i32* %arrayidx523
  %add525 = add i32 %or521, %tmp524
  %add526 = add i32 %add525, -660478335
  %tmp527 = load i32* %c, align 4
  %add528 = add i32 %tmp527, %add526
  store i32 %add528, i32* %c, align 4
  %tmp529 = load i32* %c, align 4
  %shl530 = shl i32 %tmp529, 14
  %tmp531 = load i32* %c, align 4
  %shr532 = lshr i32 %tmp531, 18
  %or533 = or i32 %shl530, %shr532
  store i32 %or533, i32* %c, align 4
  %tmp534 = load i32* %d, align 4
  %tmp535 = load i32* %c, align 4
  %add536 = add i32 %tmp535, %tmp534
  store i32 %add536, i32* %c, align 4
  %tmp537 = load i32* %c, align 4
  %tmp538 = load i32* %a, align 4
  %and539 = and i32 %tmp537, %tmp538
  %tmp540 = load i32* %d, align 4
  %tmp541 = load i32* %a, align 4
  %neg542 = xor i32 %tmp541, -1
  %and543 = and i32 %tmp540, %neg542
  %or544 = or i32 %and539, %and543
  %tmp545 = load i32** %in.addr, align 8
  %arrayidx546 = getelementptr inbounds i32* %tmp545, i64 4
  %tmp547 = load i32* %arrayidx546
  %add548 = add i32 %or544, %tmp547
  %add549 = add i32 %add548, -405537848
  %tmp550 = load i32* %b, align 4
  %add551 = add i32 %tmp550, %add549
  store i32 %add551, i32* %b, align 4
  %tmp552 = load i32* %b, align 4
  %shl553 = shl i32 %tmp552, 20
  %tmp554 = load i32* %b, align 4
  %shr555 = lshr i32 %tmp554, 12
  %or556 = or i32 %shl553, %shr555
  store i32 %or556, i32* %b, align 4
  %tmp557 = load i32* %c, align 4
  %tmp558 = load i32* %b, align 4
  %add559 = add i32 %tmp558, %tmp557
  store i32 %add559, i32* %b, align 4
  %tmp560 = load i32* %b, align 4
  %tmp561 = load i32* %d, align 4
  %and562 = and i32 %tmp560, %tmp561
  %tmp563 = load i32* %c, align 4
  %tmp564 = load i32* %d, align 4
  %neg565 = xor i32 %tmp564, -1
  %and566 = and i32 %tmp563, %neg565
  %or567 = or i32 %and562, %and566
  %tmp568 = load i32** %in.addr, align 8
  %arrayidx569 = getelementptr inbounds i32* %tmp568, i64 9
  %tmp570 = load i32* %arrayidx569
  %add571 = add i32 %or567, %tmp570
  %add572 = add i32 %add571, 568446438
  %tmp573 = load i32* %a, align 4
  %add574 = add i32 %tmp573, %add572
  store i32 %add574, i32* %a, align 4
  %tmp575 = load i32* %a, align 4
  %shl576 = shl i32 %tmp575, 5
  %tmp577 = load i32* %a, align 4
  %shr578 = lshr i32 %tmp577, 27
  %or579 = or i32 %shl576, %shr578
  store i32 %or579, i32* %a, align 4
  %tmp580 = load i32* %b, align 4
  %tmp581 = load i32* %a, align 4
  %add582 = add i32 %tmp581, %tmp580
  store i32 %add582, i32* %a, align 4
  %tmp583 = load i32* %a, align 4
  %tmp584 = load i32* %c, align 4
  %and585 = and i32 %tmp583, %tmp584
  %tmp586 = load i32* %b, align 4
  %tmp587 = load i32* %c, align 4
  %neg588 = xor i32 %tmp587, -1
  %and589 = and i32 %tmp586, %neg588
  %or590 = or i32 %and585, %and589
  %tmp591 = load i32** %in.addr, align 8
  %arrayidx592 = getelementptr inbounds i32* %tmp591, i64 14
  %tmp593 = load i32* %arrayidx592
  %add594 = add i32 %or590, %tmp593
  %add595 = add i32 %add594, -1019803690
  %tmp596 = load i32* %d, align 4
  %add597 = add i32 %tmp596, %add595
  store i32 %add597, i32* %d, align 4
  %tmp598 = load i32* %d, align 4
  %shl599 = shl i32 %tmp598, 9
  %tmp600 = load i32* %d, align 4
  %shr601 = lshr i32 %tmp600, 23
  %or602 = or i32 %shl599, %shr601
  store i32 %or602, i32* %d, align 4
  %tmp603 = load i32* %a, align 4
  %tmp604 = load i32* %d, align 4
  %add605 = add i32 %tmp604, %tmp603
  store i32 %add605, i32* %d, align 4
  %tmp606 = load i32* %d, align 4
  %tmp607 = load i32* %b, align 4
  %and608 = and i32 %tmp606, %tmp607
  %tmp609 = load i32* %a, align 4
  %tmp610 = load i32* %b, align 4
  %neg611 = xor i32 %tmp610, -1
  %and612 = and i32 %tmp609, %neg611
  %or613 = or i32 %and608, %and612
  %tmp614 = load i32** %in.addr, align 8
  %arrayidx615 = getelementptr inbounds i32* %tmp614, i64 3
  %tmp616 = load i32* %arrayidx615
  %add617 = add i32 %or613, %tmp616
  %add618 = add i32 %add617, -187363961
  %tmp619 = load i32* %c, align 4
  %add620 = add i32 %tmp619, %add618
  store i32 %add620, i32* %c, align 4
  %tmp621 = load i32* %c, align 4
  %shl622 = shl i32 %tmp621, 14
  %tmp623 = load i32* %c, align 4
  %shr624 = lshr i32 %tmp623, 18
  %or625 = or i32 %shl622, %shr624
  store i32 %or625, i32* %c, align 4
  %tmp626 = load i32* %d, align 4
  %tmp627 = load i32* %c, align 4
  %add628 = add i32 %tmp627, %tmp626
  store i32 %add628, i32* %c, align 4
  %tmp629 = load i32* %c, align 4
  %tmp630 = load i32* %a, align 4
  %and631 = and i32 %tmp629, %tmp630
  %tmp632 = load i32* %d, align 4
  %tmp633 = load i32* %a, align 4
  %neg634 = xor i32 %tmp633, -1
  %and635 = and i32 %tmp632, %neg634
  %or636 = or i32 %and631, %and635
  %tmp637 = load i32** %in.addr, align 8
  %arrayidx638 = getelementptr inbounds i32* %tmp637, i64 8
  %tmp639 = load i32* %arrayidx638
  %add640 = add i32 %or636, %tmp639
  %add641 = add i32 %add640, 1163531501
  %tmp642 = load i32* %b, align 4
  %add643 = add i32 %tmp642, %add641
  store i32 %add643, i32* %b, align 4
  %tmp644 = load i32* %b, align 4
  %shl645 = shl i32 %tmp644, 20
  %tmp646 = load i32* %b, align 4
  %shr647 = lshr i32 %tmp646, 12
  %or648 = or i32 %shl645, %shr647
  store i32 %or648, i32* %b, align 4
  %tmp649 = load i32* %c, align 4
  %tmp650 = load i32* %b, align 4
  %add651 = add i32 %tmp650, %tmp649
  store i32 %add651, i32* %b, align 4
  %tmp652 = load i32* %b, align 4
  %tmp653 = load i32* %d, align 4
  %and654 = and i32 %tmp652, %tmp653
  %tmp655 = load i32* %c, align 4
  %tmp656 = load i32* %d, align 4
  %neg657 = xor i32 %tmp656, -1
  %and658 = and i32 %tmp655, %neg657
  %or659 = or i32 %and654, %and658
  %tmp660 = load i32** %in.addr, align 8
  %arrayidx661 = getelementptr inbounds i32* %tmp660, i64 13
  %tmp662 = load i32* %arrayidx661
  %add663 = add i32 %or659, %tmp662
  %add664 = add i32 %add663, -1444681467
  %tmp665 = load i32* %a, align 4
  %add666 = add i32 %tmp665, %add664
  store i32 %add666, i32* %a, align 4
  %tmp667 = load i32* %a, align 4
  %shl668 = shl i32 %tmp667, 5
  %tmp669 = load i32* %a, align 4
  %shr670 = lshr i32 %tmp669, 27
  %or671 = or i32 %shl668, %shr670
  store i32 %or671, i32* %a, align 4
  %tmp672 = load i32* %b, align 4
  %tmp673 = load i32* %a, align 4
  %add674 = add i32 %tmp673, %tmp672
  store i32 %add674, i32* %a, align 4
  %tmp675 = load i32* %a, align 4
  %tmp676 = load i32* %c, align 4
  %and677 = and i32 %tmp675, %tmp676
  %tmp678 = load i32* %b, align 4
  %tmp679 = load i32* %c, align 4
  %neg680 = xor i32 %tmp679, -1
  %and681 = and i32 %tmp678, %neg680
  %or682 = or i32 %and677, %and681
  %tmp683 = load i32** %in.addr, align 8
  %arrayidx684 = getelementptr inbounds i32* %tmp683, i64 2
  %tmp685 = load i32* %arrayidx684
  %add686 = add i32 %or682, %tmp685
  %add687 = add i32 %add686, -51403784
  %tmp688 = load i32* %d, align 4
  %add689 = add i32 %tmp688, %add687
  store i32 %add689, i32* %d, align 4
  %tmp690 = load i32* %d, align 4
  %shl691 = shl i32 %tmp690, 9
  %tmp692 = load i32* %d, align 4
  %shr693 = lshr i32 %tmp692, 23
  %or694 = or i32 %shl691, %shr693
  store i32 %or694, i32* %d, align 4
  %tmp695 = load i32* %a, align 4
  %tmp696 = load i32* %d, align 4
  %add697 = add i32 %tmp696, %tmp695
  store i32 %add697, i32* %d, align 4
  %tmp698 = load i32* %d, align 4
  %tmp699 = load i32* %b, align 4
  %and700 = and i32 %tmp698, %tmp699
  %tmp701 = load i32* %a, align 4
  %tmp702 = load i32* %b, align 4
  %neg703 = xor i32 %tmp702, -1
  %and704 = and i32 %tmp701, %neg703
  %or705 = or i32 %and700, %and704
  %tmp706 = load i32** %in.addr, align 8
  %arrayidx707 = getelementptr inbounds i32* %tmp706, i64 7
  %tmp708 = load i32* %arrayidx707
  %add709 = add i32 %or705, %tmp708
  %add710 = add i32 %add709, 1735328473
  %tmp711 = load i32* %c, align 4
  %add712 = add i32 %tmp711, %add710
  store i32 %add712, i32* %c, align 4
  %tmp713 = load i32* %c, align 4
  %shl714 = shl i32 %tmp713, 14
  %tmp715 = load i32* %c, align 4
  %shr716 = lshr i32 %tmp715, 18
  %or717 = or i32 %shl714, %shr716
  store i32 %or717, i32* %c, align 4
  %tmp718 = load i32* %d, align 4
  %tmp719 = load i32* %c, align 4
  %add720 = add i32 %tmp719, %tmp718
  store i32 %add720, i32* %c, align 4
  %tmp721 = load i32* %c, align 4
  %tmp722 = load i32* %a, align 4
  %and723 = and i32 %tmp721, %tmp722
  %tmp724 = load i32* %d, align 4
  %tmp725 = load i32* %a, align 4
  %neg726 = xor i32 %tmp725, -1
  %and727 = and i32 %tmp724, %neg726
  %or728 = or i32 %and723, %and727
  %tmp729 = load i32** %in.addr, align 8
  %arrayidx730 = getelementptr inbounds i32* %tmp729, i64 12
  %tmp731 = load i32* %arrayidx730
  %add732 = add i32 %or728, %tmp731
  %add733 = add i32 %add732, -1926607734
  %tmp734 = load i32* %b, align 4
  %add735 = add i32 %tmp734, %add733
  store i32 %add735, i32* %b, align 4
  %tmp736 = load i32* %b, align 4
  %shl737 = shl i32 %tmp736, 20
  %tmp738 = load i32* %b, align 4
  %shr739 = lshr i32 %tmp738, 12
  %or740 = or i32 %shl737, %shr739
  store i32 %or740, i32* %b, align 4
  %tmp741 = load i32* %c, align 4
  %tmp742 = load i32* %b, align 4
  %add743 = add i32 %tmp742, %tmp741
  store i32 %add743, i32* %b, align 4
  %tmp744 = load i32* %b, align 4
  %tmp745 = load i32* %c, align 4
  %xor = xor i32 %tmp744, %tmp745
  %tmp746 = load i32* %d, align 4
  %xor747 = xor i32 %xor, %tmp746
  %tmp748 = load i32** %in.addr, align 8
  %arrayidx749 = getelementptr inbounds i32* %tmp748, i64 5
  %tmp750 = load i32* %arrayidx749
  %add751 = add i32 %xor747, %tmp750
  %add752 = add i32 %add751, -378558
  %tmp753 = load i32* %a, align 4
  %add754 = add i32 %tmp753, %add752
  store i32 %add754, i32* %a, align 4
  %tmp755 = load i32* %a, align 4
  %shl756 = shl i32 %tmp755, 4
  %tmp757 = load i32* %a, align 4
  %shr758 = lshr i32 %tmp757, 28
  %or759 = or i32 %shl756, %shr758
  store i32 %or759, i32* %a, align 4
  %tmp760 = load i32* %b, align 4
  %tmp761 = load i32* %a, align 4
  %add762 = add i32 %tmp761, %tmp760
  store i32 %add762, i32* %a, align 4
  %tmp763 = load i32* %a, align 4
  %tmp764 = load i32* %b, align 4
  %xor765 = xor i32 %tmp763, %tmp764
  %tmp766 = load i32* %c, align 4
  %xor767 = xor i32 %xor765, %tmp766
  %tmp768 = load i32** %in.addr, align 8
  %arrayidx769 = getelementptr inbounds i32* %tmp768, i64 8
  %tmp770 = load i32* %arrayidx769
  %add771 = add i32 %xor767, %tmp770
  %add772 = add i32 %add771, -2022574463
  %tmp773 = load i32* %d, align 4
  %add774 = add i32 %tmp773, %add772
  store i32 %add774, i32* %d, align 4
  %tmp775 = load i32* %d, align 4
  %shl776 = shl i32 %tmp775, 11
  %tmp777 = load i32* %d, align 4
  %shr778 = lshr i32 %tmp777, 21
  %or779 = or i32 %shl776, %shr778
  store i32 %or779, i32* %d, align 4
  %tmp780 = load i32* %a, align 4
  %tmp781 = load i32* %d, align 4
  %add782 = add i32 %tmp781, %tmp780
  store i32 %add782, i32* %d, align 4
  %tmp783 = load i32* %d, align 4
  %tmp784 = load i32* %a, align 4
  %xor785 = xor i32 %tmp783, %tmp784
  %tmp786 = load i32* %b, align 4
  %xor787 = xor i32 %xor785, %tmp786
  %tmp788 = load i32** %in.addr, align 8
  %arrayidx789 = getelementptr inbounds i32* %tmp788, i64 11
  %tmp790 = load i32* %arrayidx789
  %add791 = add i32 %xor787, %tmp790
  %add792 = add i32 %add791, 1839030562
  %tmp793 = load i32* %c, align 4
  %add794 = add i32 %tmp793, %add792
  store i32 %add794, i32* %c, align 4
  %tmp795 = load i32* %c, align 4
  %shl796 = shl i32 %tmp795, 16
  %tmp797 = load i32* %c, align 4
  %shr798 = lshr i32 %tmp797, 16
  %or799 = or i32 %shl796, %shr798
  store i32 %or799, i32* %c, align 4
  %tmp800 = load i32* %d, align 4
  %tmp801 = load i32* %c, align 4
  %add802 = add i32 %tmp801, %tmp800
  store i32 %add802, i32* %c, align 4
  %tmp803 = load i32* %c, align 4
  %tmp804 = load i32* %d, align 4
  %xor805 = xor i32 %tmp803, %tmp804
  %tmp806 = load i32* %a, align 4
  %xor807 = xor i32 %xor805, %tmp806
  %tmp808 = load i32** %in.addr, align 8
  %arrayidx809 = getelementptr inbounds i32* %tmp808, i64 14
  %tmp810 = load i32* %arrayidx809
  %add811 = add i32 %xor807, %tmp810
  %add812 = add i32 %add811, -35309556
  %tmp813 = load i32* %b, align 4
  %add814 = add i32 %tmp813, %add812
  store i32 %add814, i32* %b, align 4
  %tmp815 = load i32* %b, align 4
  %shl816 = shl i32 %tmp815, 23
  %tmp817 = load i32* %b, align 4
  %shr818 = lshr i32 %tmp817, 9
  %or819 = or i32 %shl816, %shr818
  store i32 %or819, i32* %b, align 4
  %tmp820 = load i32* %c, align 4
  %tmp821 = load i32* %b, align 4
  %add822 = add i32 %tmp821, %tmp820
  store i32 %add822, i32* %b, align 4
  %tmp823 = load i32* %b, align 4
  %tmp824 = load i32* %c, align 4
  %xor825 = xor i32 %tmp823, %tmp824
  %tmp826 = load i32* %d, align 4
  %xor827 = xor i32 %xor825, %tmp826
  %tmp828 = load i32** %in.addr, align 8
  %arrayidx829 = getelementptr inbounds i32* %tmp828, i64 1
  %tmp830 = load i32* %arrayidx829
  %add831 = add i32 %xor827, %tmp830
  %add832 = add i32 %add831, -1530992060
  %tmp833 = load i32* %a, align 4
  %add834 = add i32 %tmp833, %add832
  store i32 %add834, i32* %a, align 4
  %tmp835 = load i32* %a, align 4
  %shl836 = shl i32 %tmp835, 4
  %tmp837 = load i32* %a, align 4
  %shr838 = lshr i32 %tmp837, 28
  %or839 = or i32 %shl836, %shr838
  store i32 %or839, i32* %a, align 4
  %tmp840 = load i32* %b, align 4
  %tmp841 = load i32* %a, align 4
  %add842 = add i32 %tmp841, %tmp840
  store i32 %add842, i32* %a, align 4
  %tmp843 = load i32* %a, align 4
  %tmp844 = load i32* %b, align 4
  %xor845 = xor i32 %tmp843, %tmp844
  %tmp846 = load i32* %c, align 4
  %xor847 = xor i32 %xor845, %tmp846
  %tmp848 = load i32** %in.addr, align 8
  %arrayidx849 = getelementptr inbounds i32* %tmp848, i64 4
  %tmp850 = load i32* %arrayidx849
  %add851 = add i32 %xor847, %tmp850
  %add852 = add i32 %add851, 1272893353
  %tmp853 = load i32* %d, align 4
  %add854 = add i32 %tmp853, %add852
  store i32 %add854, i32* %d, align 4
  %tmp855 = load i32* %d, align 4
  %shl856 = shl i32 %tmp855, 11
  %tmp857 = load i32* %d, align 4
  %shr858 = lshr i32 %tmp857, 21
  %or859 = or i32 %shl856, %shr858
  store i32 %or859, i32* %d, align 4
  %tmp860 = load i32* %a, align 4
  %tmp861 = load i32* %d, align 4
  %add862 = add i32 %tmp861, %tmp860
  store i32 %add862, i32* %d, align 4
  %tmp863 = load i32* %d, align 4
  %tmp864 = load i32* %a, align 4
  %xor865 = xor i32 %tmp863, %tmp864
  %tmp866 = load i32* %b, align 4
  %xor867 = xor i32 %xor865, %tmp866
  %tmp868 = load i32** %in.addr, align 8
  %arrayidx869 = getelementptr inbounds i32* %tmp868, i64 7
  %tmp870 = load i32* %arrayidx869
  %add871 = add i32 %xor867, %tmp870
  %add872 = add i32 %add871, -155497632
  %tmp873 = load i32* %c, align 4
  %add874 = add i32 %tmp873, %add872
  store i32 %add874, i32* %c, align 4
  %tmp875 = load i32* %c, align 4
  %shl876 = shl i32 %tmp875, 16
  %tmp877 = load i32* %c, align 4
  %shr878 = lshr i32 %tmp877, 16
  %or879 = or i32 %shl876, %shr878
  store i32 %or879, i32* %c, align 4
  %tmp880 = load i32* %d, align 4
  %tmp881 = load i32* %c, align 4
  %add882 = add i32 %tmp881, %tmp880
  store i32 %add882, i32* %c, align 4
  %tmp883 = load i32* %c, align 4
  %tmp884 = load i32* %d, align 4
  %xor885 = xor i32 %tmp883, %tmp884
  %tmp886 = load i32* %a, align 4
  %xor887 = xor i32 %xor885, %tmp886
  %tmp888 = load i32** %in.addr, align 8
  %arrayidx889 = getelementptr inbounds i32* %tmp888, i64 10
  %tmp890 = load i32* %arrayidx889
  %add891 = add i32 %xor887, %tmp890
  %add892 = add i32 %add891, -1094730640
  %tmp893 = load i32* %b, align 4
  %add894 = add i32 %tmp893, %add892
  store i32 %add894, i32* %b, align 4
  %tmp895 = load i32* %b, align 4
  %shl896 = shl i32 %tmp895, 23
  %tmp897 = load i32* %b, align 4
  %shr898 = lshr i32 %tmp897, 9
  %or899 = or i32 %shl896, %shr898
  store i32 %or899, i32* %b, align 4
  %tmp900 = load i32* %c, align 4
  %tmp901 = load i32* %b, align 4
  %add902 = add i32 %tmp901, %tmp900
  store i32 %add902, i32* %b, align 4
  %tmp903 = load i32* %b, align 4
  %tmp904 = load i32* %c, align 4
  %xor905 = xor i32 %tmp903, %tmp904
  %tmp906 = load i32* %d, align 4
  %xor907 = xor i32 %xor905, %tmp906
  %tmp908 = load i32** %in.addr, align 8
  %arrayidx909 = getelementptr inbounds i32* %tmp908, i64 13
  %tmp910 = load i32* %arrayidx909
  %add911 = add i32 %xor907, %tmp910
  %add912 = add i32 %add911, 681279174
  %tmp913 = load i32* %a, align 4
  %add914 = add i32 %tmp913, %add912
  store i32 %add914, i32* %a, align 4
  %tmp915 = load i32* %a, align 4
  %shl916 = shl i32 %tmp915, 4
  %tmp917 = load i32* %a, align 4
  %shr918 = lshr i32 %tmp917, 28
  %or919 = or i32 %shl916, %shr918
  store i32 %or919, i32* %a, align 4
  %tmp920 = load i32* %b, align 4
  %tmp921 = load i32* %a, align 4
  %add922 = add i32 %tmp921, %tmp920
  store i32 %add922, i32* %a, align 4
  %tmp923 = load i32* %a, align 4
  %tmp924 = load i32* %b, align 4
  %xor925 = xor i32 %tmp923, %tmp924
  %tmp926 = load i32* %c, align 4
  %xor927 = xor i32 %xor925, %tmp926
  %tmp928 = load i32** %in.addr, align 8
  %arrayidx929 = getelementptr inbounds i32* %tmp928, i64 0
  %tmp930 = load i32* %arrayidx929
  %add931 = add i32 %xor927, %tmp930
  %add932 = add i32 %add931, -358537222
  %tmp933 = load i32* %d, align 4
  %add934 = add i32 %tmp933, %add932
  store i32 %add934, i32* %d, align 4
  %tmp935 = load i32* %d, align 4
  %shl936 = shl i32 %tmp935, 11
  %tmp937 = load i32* %d, align 4
  %shr938 = lshr i32 %tmp937, 21
  %or939 = or i32 %shl936, %shr938
  store i32 %or939, i32* %d, align 4
  %tmp940 = load i32* %a, align 4
  %tmp941 = load i32* %d, align 4
  %add942 = add i32 %tmp941, %tmp940
  store i32 %add942, i32* %d, align 4
  %tmp943 = load i32* %d, align 4
  %tmp944 = load i32* %a, align 4
  %xor945 = xor i32 %tmp943, %tmp944
  %tmp946 = load i32* %b, align 4
  %xor947 = xor i32 %xor945, %tmp946
  %tmp948 = load i32** %in.addr, align 8
  %arrayidx949 = getelementptr inbounds i32* %tmp948, i64 3
  %tmp950 = load i32* %arrayidx949
  %add951 = add i32 %xor947, %tmp950
  %add952 = add i32 %add951, -722521979
  %tmp953 = load i32* %c, align 4
  %add954 = add i32 %tmp953, %add952
  store i32 %add954, i32* %c, align 4
  %tmp955 = load i32* %c, align 4
  %shl956 = shl i32 %tmp955, 16
  %tmp957 = load i32* %c, align 4
  %shr958 = lshr i32 %tmp957, 16
  %or959 = or i32 %shl956, %shr958
  store i32 %or959, i32* %c, align 4
  %tmp960 = load i32* %d, align 4
  %tmp961 = load i32* %c, align 4
  %add962 = add i32 %tmp961, %tmp960
  store i32 %add962, i32* %c, align 4
  %tmp963 = load i32* %c, align 4
  %tmp964 = load i32* %d, align 4
  %xor965 = xor i32 %tmp963, %tmp964
  %tmp966 = load i32* %a, align 4
  %xor967 = xor i32 %xor965, %tmp966
  %tmp968 = load i32** %in.addr, align 8
  %arrayidx969 = getelementptr inbounds i32* %tmp968, i64 6
  %tmp970 = load i32* %arrayidx969
  %add971 = add i32 %xor967, %tmp970
  %add972 = add i32 %add971, 76029189
  %tmp973 = load i32* %b, align 4
  %add974 = add i32 %tmp973, %add972
  store i32 %add974, i32* %b, align 4
  %tmp975 = load i32* %b, align 4
  %shl976 = shl i32 %tmp975, 23
  %tmp977 = load i32* %b, align 4
  %shr978 = lshr i32 %tmp977, 9
  %or979 = or i32 %shl976, %shr978
  store i32 %or979, i32* %b, align 4
  %tmp980 = load i32* %c, align 4
  %tmp981 = load i32* %b, align 4
  %add982 = add i32 %tmp981, %tmp980
  store i32 %add982, i32* %b, align 4
  %tmp983 = load i32* %b, align 4
  %tmp984 = load i32* %c, align 4
  %xor985 = xor i32 %tmp983, %tmp984
  %tmp986 = load i32* %d, align 4
  %xor987 = xor i32 %xor985, %tmp986
  %tmp988 = load i32** %in.addr, align 8
  %arrayidx989 = getelementptr inbounds i32* %tmp988, i64 9
  %tmp990 = load i32* %arrayidx989
  %add991 = add i32 %xor987, %tmp990
  %add992 = add i32 %add991, -640364487
  %tmp993 = load i32* %a, align 4
  %add994 = add i32 %tmp993, %add992
  store i32 %add994, i32* %a, align 4
  %tmp995 = load i32* %a, align 4
  %shl996 = shl i32 %tmp995, 4
  %tmp997 = load i32* %a, align 4
  %shr998 = lshr i32 %tmp997, 28
  %or999 = or i32 %shl996, %shr998
  store i32 %or999, i32* %a, align 4
  %tmp1000 = load i32* %b, align 4
  %tmp1001 = load i32* %a, align 4
  %add1002 = add i32 %tmp1001, %tmp1000
  store i32 %add1002, i32* %a, align 4
  %tmp1003 = load i32* %a, align 4
  %tmp1004 = load i32* %b, align 4
  %xor1005 = xor i32 %tmp1003, %tmp1004
  %tmp1006 = load i32* %c, align 4
  %xor1007 = xor i32 %xor1005, %tmp1006
  %tmp1008 = load i32** %in.addr, align 8
  %arrayidx1009 = getelementptr inbounds i32* %tmp1008, i64 12
  %tmp1010 = load i32* %arrayidx1009
  %add1011 = add i32 %xor1007, %tmp1010
  %add1012 = add i32 %add1011, -421815835
  %tmp1013 = load i32* %d, align 4
  %add1014 = add i32 %tmp1013, %add1012
  store i32 %add1014, i32* %d, align 4
  %tmp1015 = load i32* %d, align 4
  %shl1016 = shl i32 %tmp1015, 11
  %tmp1017 = load i32* %d, align 4
  %shr1018 = lshr i32 %tmp1017, 21
  %or1019 = or i32 %shl1016, %shr1018
  store i32 %or1019, i32* %d, align 4
  %tmp1020 = load i32* %a, align 4
  %tmp1021 = load i32* %d, align 4
  %add1022 = add i32 %tmp1021, %tmp1020
  store i32 %add1022, i32* %d, align 4
  %tmp1023 = load i32* %d, align 4
  %tmp1024 = load i32* %a, align 4
  %xor1025 = xor i32 %tmp1023, %tmp1024
  %tmp1026 = load i32* %b, align 4
  %xor1027 = xor i32 %xor1025, %tmp1026
  %tmp1028 = load i32** %in.addr, align 8
  %arrayidx1029 = getelementptr inbounds i32* %tmp1028, i64 15
  %tmp1030 = load i32* %arrayidx1029
  %add1031 = add i32 %xor1027, %tmp1030
  %add1032 = add i32 %add1031, 530742520
  %tmp1033 = load i32* %c, align 4
  %add1034 = add i32 %tmp1033, %add1032
  store i32 %add1034, i32* %c, align 4
  %tmp1035 = load i32* %c, align 4
  %shl1036 = shl i32 %tmp1035, 16
  %tmp1037 = load i32* %c, align 4
  %shr1038 = lshr i32 %tmp1037, 16
  %or1039 = or i32 %shl1036, %shr1038
  store i32 %or1039, i32* %c, align 4
  %tmp1040 = load i32* %d, align 4
  %tmp1041 = load i32* %c, align 4
  %add1042 = add i32 %tmp1041, %tmp1040
  store i32 %add1042, i32* %c, align 4
  %tmp1043 = load i32* %c, align 4
  %tmp1044 = load i32* %d, align 4
  %xor1045 = xor i32 %tmp1043, %tmp1044
  %tmp1046 = load i32* %a, align 4
  %xor1047 = xor i32 %xor1045, %tmp1046
  %tmp1048 = load i32** %in.addr, align 8
  %arrayidx1049 = getelementptr inbounds i32* %tmp1048, i64 2
  %tmp1050 = load i32* %arrayidx1049
  %add1051 = add i32 %xor1047, %tmp1050
  %add1052 = add i32 %add1051, -995338651
  %tmp1053 = load i32* %b, align 4
  %add1054 = add i32 %tmp1053, %add1052
  store i32 %add1054, i32* %b, align 4
  %tmp1055 = load i32* %b, align 4
  %shl1056 = shl i32 %tmp1055, 23
  %tmp1057 = load i32* %b, align 4
  %shr1058 = lshr i32 %tmp1057, 9
  %or1059 = or i32 %shl1056, %shr1058
  store i32 %or1059, i32* %b, align 4
  %tmp1060 = load i32* %c, align 4
  %tmp1061 = load i32* %b, align 4
  %add1062 = add i32 %tmp1061, %tmp1060
  store i32 %add1062, i32* %b, align 4
  %tmp1063 = load i32* %c, align 4
  %tmp1064 = load i32* %b, align 4
  %tmp1065 = load i32* %d, align 4
  %neg1066 = xor i32 %tmp1065, -1
  %or1067 = or i32 %tmp1064, %neg1066
  %xor1068 = xor i32 %tmp1063, %or1067
  %tmp1069 = load i32** %in.addr, align 8
  %arrayidx1070 = getelementptr inbounds i32* %tmp1069, i64 0
  %tmp1071 = load i32* %arrayidx1070
  %add1072 = add i32 %xor1068, %tmp1071
  %add1073 = add i32 %add1072, -198630844
  %tmp1074 = load i32* %a, align 4
  %add1075 = add i32 %tmp1074, %add1073
  store i32 %add1075, i32* %a, align 4
  %tmp1076 = load i32* %a, align 4
  %shl1077 = shl i32 %tmp1076, 6
  %tmp1078 = load i32* %a, align 4
  %shr1079 = lshr i32 %tmp1078, 26
  %or1080 = or i32 %shl1077, %shr1079
  store i32 %or1080, i32* %a, align 4
  %tmp1081 = load i32* %b, align 4
  %tmp1082 = load i32* %a, align 4
  %add1083 = add i32 %tmp1082, %tmp1081
  store i32 %add1083, i32* %a, align 4
  %tmp1084 = load i32* %b, align 4
  %tmp1085 = load i32* %a, align 4
  %tmp1086 = load i32* %c, align 4
  %neg1087 = xor i32 %tmp1086, -1
  %or1088 = or i32 %tmp1085, %neg1087
  %xor1089 = xor i32 %tmp1084, %or1088
  %tmp1090 = load i32** %in.addr, align 8
  %arrayidx1091 = getelementptr inbounds i32* %tmp1090, i64 7
  %tmp1092 = load i32* %arrayidx1091
  %add1093 = add i32 %xor1089, %tmp1092
  %add1094 = add i32 %add1093, 1126891415
  %tmp1095 = load i32* %d, align 4
  %add1096 = add i32 %tmp1095, %add1094
  store i32 %add1096, i32* %d, align 4
  %tmp1097 = load i32* %d, align 4
  %shl1098 = shl i32 %tmp1097, 10
  %tmp1099 = load i32* %d, align 4
  %shr1100 = lshr i32 %tmp1099, 22
  %or1101 = or i32 %shl1098, %shr1100
  store i32 %or1101, i32* %d, align 4
  %tmp1102 = load i32* %a, align 4
  %tmp1103 = load i32* %d, align 4
  %add1104 = add i32 %tmp1103, %tmp1102
  store i32 %add1104, i32* %d, align 4
  %tmp1105 = load i32* %a, align 4
  %tmp1106 = load i32* %d, align 4
  %tmp1107 = load i32* %b, align 4
  %neg1108 = xor i32 %tmp1107, -1
  %or1109 = or i32 %tmp1106, %neg1108
  %xor1110 = xor i32 %tmp1105, %or1109
  %tmp1111 = load i32** %in.addr, align 8
  %arrayidx1112 = getelementptr inbounds i32* %tmp1111, i64 14
  %tmp1113 = load i32* %arrayidx1112
  %add1114 = add i32 %xor1110, %tmp1113
  %add1115 = add i32 %add1114, -1416354905
  %tmp1116 = load i32* %c, align 4
  %add1117 = add i32 %tmp1116, %add1115
  store i32 %add1117, i32* %c, align 4
  %tmp1118 = load i32* %c, align 4
  %shl1119 = shl i32 %tmp1118, 15
  %tmp1120 = load i32* %c, align 4
  %shr1121 = lshr i32 %tmp1120, 17
  %or1122 = or i32 %shl1119, %shr1121
  store i32 %or1122, i32* %c, align 4
  %tmp1123 = load i32* %d, align 4
  %tmp1124 = load i32* %c, align 4
  %add1125 = add i32 %tmp1124, %tmp1123
  store i32 %add1125, i32* %c, align 4
  %tmp1126 = load i32* %d, align 4
  %tmp1127 = load i32* %c, align 4
  %tmp1128 = load i32* %a, align 4
  %neg1129 = xor i32 %tmp1128, -1
  %or1130 = or i32 %tmp1127, %neg1129
  %xor1131 = xor i32 %tmp1126, %or1130
  %tmp1132 = load i32** %in.addr, align 8
  %arrayidx1133 = getelementptr inbounds i32* %tmp1132, i64 5
  %tmp1134 = load i32* %arrayidx1133
  %add1135 = add i32 %xor1131, %tmp1134
  %add1136 = add i32 %add1135, -57434055
  %tmp1137 = load i32* %b, align 4
  %add1138 = add i32 %tmp1137, %add1136
  store i32 %add1138, i32* %b, align 4
  %tmp1139 = load i32* %b, align 4
  %shl1140 = shl i32 %tmp1139, 21
  %tmp1141 = load i32* %b, align 4
  %shr1142 = lshr i32 %tmp1141, 11
  %or1143 = or i32 %shl1140, %shr1142
  store i32 %or1143, i32* %b, align 4
  %tmp1144 = load i32* %c, align 4
  %tmp1145 = load i32* %b, align 4
  %add1146 = add i32 %tmp1145, %tmp1144
  store i32 %add1146, i32* %b, align 4
  %tmp1147 = load i32* %c, align 4
  %tmp1148 = load i32* %b, align 4
  %tmp1149 = load i32* %d, align 4
  %neg1150 = xor i32 %tmp1149, -1
  %or1151 = or i32 %tmp1148, %neg1150
  %xor1152 = xor i32 %tmp1147, %or1151
  %tmp1153 = load i32** %in.addr, align 8
  %arrayidx1154 = getelementptr inbounds i32* %tmp1153, i64 12
  %tmp1155 = load i32* %arrayidx1154
  %add1156 = add i32 %xor1152, %tmp1155
  %add1157 = add i32 %add1156, 1700485571
  %tmp1158 = load i32* %a, align 4
  %add1159 = add i32 %tmp1158, %add1157
  store i32 %add1159, i32* %a, align 4
  %tmp1160 = load i32* %a, align 4
  %shl1161 = shl i32 %tmp1160, 6
  %tmp1162 = load i32* %a, align 4
  %shr1163 = lshr i32 %tmp1162, 26
  %or1164 = or i32 %shl1161, %shr1163
  store i32 %or1164, i32* %a, align 4
  %tmp1165 = load i32* %b, align 4
  %tmp1166 = load i32* %a, align 4
  %add1167 = add i32 %tmp1166, %tmp1165
  store i32 %add1167, i32* %a, align 4
  %tmp1168 = load i32* %b, align 4
  %tmp1169 = load i32* %a, align 4
  %tmp1170 = load i32* %c, align 4
  %neg1171 = xor i32 %tmp1170, -1
  %or1172 = or i32 %tmp1169, %neg1171
  %xor1173 = xor i32 %tmp1168, %or1172
  %tmp1174 = load i32** %in.addr, align 8
  %arrayidx1175 = getelementptr inbounds i32* %tmp1174, i64 3
  %tmp1176 = load i32* %arrayidx1175
  %add1177 = add i32 %xor1173, %tmp1176
  %add1178 = add i32 %add1177, -1894986606
  %tmp1179 = load i32* %d, align 4
  %add1180 = add i32 %tmp1179, %add1178
  store i32 %add1180, i32* %d, align 4
  %tmp1181 = load i32* %d, align 4
  %shl1182 = shl i32 %tmp1181, 10
  %tmp1183 = load i32* %d, align 4
  %shr1184 = lshr i32 %tmp1183, 22
  %or1185 = or i32 %shl1182, %shr1184
  store i32 %or1185, i32* %d, align 4
  %tmp1186 = load i32* %a, align 4
  %tmp1187 = load i32* %d, align 4
  %add1188 = add i32 %tmp1187, %tmp1186
  store i32 %add1188, i32* %d, align 4
  %tmp1189 = load i32* %a, align 4
  %tmp1190 = load i32* %d, align 4
  %tmp1191 = load i32* %b, align 4
  %neg1192 = xor i32 %tmp1191, -1
  %or1193 = or i32 %tmp1190, %neg1192
  %xor1194 = xor i32 %tmp1189, %or1193
  %tmp1195 = load i32** %in.addr, align 8
  %arrayidx1196 = getelementptr inbounds i32* %tmp1195, i64 10
  %tmp1197 = load i32* %arrayidx1196
  %add1198 = add i32 %xor1194, %tmp1197
  %add1199 = add i32 %add1198, -1051523
  %tmp1200 = load i32* %c, align 4
  %add1201 = add i32 %tmp1200, %add1199
  store i32 %add1201, i32* %c, align 4
  %tmp1202 = load i32* %c, align 4
  %shl1203 = shl i32 %tmp1202, 15
  %tmp1204 = load i32* %c, align 4
  %shr1205 = lshr i32 %tmp1204, 17
  %or1206 = or i32 %shl1203, %shr1205
  store i32 %or1206, i32* %c, align 4
  %tmp1207 = load i32* %d, align 4
  %tmp1208 = load i32* %c, align 4
  %add1209 = add i32 %tmp1208, %tmp1207
  store i32 %add1209, i32* %c, align 4
  %tmp1210 = load i32* %d, align 4
  %tmp1211 = load i32* %c, align 4
  %tmp1212 = load i32* %a, align 4
  %neg1213 = xor i32 %tmp1212, -1
  %or1214 = or i32 %tmp1211, %neg1213
  %xor1215 = xor i32 %tmp1210, %or1214
  %tmp1216 = load i32** %in.addr, align 8
  %arrayidx1217 = getelementptr inbounds i32* %tmp1216, i64 1
  %tmp1218 = load i32* %arrayidx1217
  %add1219 = add i32 %xor1215, %tmp1218
  %add1220 = add i32 %add1219, -2054922799
  %tmp1221 = load i32* %b, align 4
  %add1222 = add i32 %tmp1221, %add1220
  store i32 %add1222, i32* %b, align 4
  %tmp1223 = load i32* %b, align 4
  %shl1224 = shl i32 %tmp1223, 21
  %tmp1225 = load i32* %b, align 4
  %shr1226 = lshr i32 %tmp1225, 11
  %or1227 = or i32 %shl1224, %shr1226
  store i32 %or1227, i32* %b, align 4
  %tmp1228 = load i32* %c, align 4
  %tmp1229 = load i32* %b, align 4
  %add1230 = add i32 %tmp1229, %tmp1228
  store i32 %add1230, i32* %b, align 4
  %tmp1231 = load i32* %c, align 4
  %tmp1232 = load i32* %b, align 4
  %tmp1233 = load i32* %d, align 4
  %neg1234 = xor i32 %tmp1233, -1
  %or1235 = or i32 %tmp1232, %neg1234
  %xor1236 = xor i32 %tmp1231, %or1235
  %tmp1237 = load i32** %in.addr, align 8
  %arrayidx1238 = getelementptr inbounds i32* %tmp1237, i64 8
  %tmp1239 = load i32* %arrayidx1238
  %add1240 = add i32 %xor1236, %tmp1239
  %add1241 = add i32 %add1240, 1873313359
  %tmp1242 = load i32* %a, align 4
  %add1243 = add i32 %tmp1242, %add1241
  store i32 %add1243, i32* %a, align 4
  %tmp1244 = load i32* %a, align 4
  %shl1245 = shl i32 %tmp1244, 6
  %tmp1246 = load i32* %a, align 4
  %shr1247 = lshr i32 %tmp1246, 26
  %or1248 = or i32 %shl1245, %shr1247
  store i32 %or1248, i32* %a, align 4
  %tmp1249 = load i32* %b, align 4
  %tmp1250 = load i32* %a, align 4
  %add1251 = add i32 %tmp1250, %tmp1249
  store i32 %add1251, i32* %a, align 4
  %tmp1252 = load i32* %b, align 4
  %tmp1253 = load i32* %a, align 4
  %tmp1254 = load i32* %c, align 4
  %neg1255 = xor i32 %tmp1254, -1
  %or1256 = or i32 %tmp1253, %neg1255
  %xor1257 = xor i32 %tmp1252, %or1256
  %tmp1258 = load i32** %in.addr, align 8
  %arrayidx1259 = getelementptr inbounds i32* %tmp1258, i64 15
  %tmp1260 = load i32* %arrayidx1259
  %add1261 = add i32 %xor1257, %tmp1260
  %add1262 = add i32 %add1261, -30611744
  %tmp1263 = load i32* %d, align 4
  %add1264 = add i32 %tmp1263, %add1262
  store i32 %add1264, i32* %d, align 4
  %tmp1265 = load i32* %d, align 4
  %shl1266 = shl i32 %tmp1265, 10
  %tmp1267 = load i32* %d, align 4
  %shr1268 = lshr i32 %tmp1267, 22
  %or1269 = or i32 %shl1266, %shr1268
  store i32 %or1269, i32* %d, align 4
  %tmp1270 = load i32* %a, align 4
  %tmp1271 = load i32* %d, align 4
  %add1272 = add i32 %tmp1271, %tmp1270
  store i32 %add1272, i32* %d, align 4
  %tmp1273 = load i32* %a, align 4
  %tmp1274 = load i32* %d, align 4
  %tmp1275 = load i32* %b, align 4
  %neg1276 = xor i32 %tmp1275, -1
  %or1277 = or i32 %tmp1274, %neg1276
  %xor1278 = xor i32 %tmp1273, %or1277
  %tmp1279 = load i32** %in.addr, align 8
  %arrayidx1280 = getelementptr inbounds i32* %tmp1279, i64 6
  %tmp1281 = load i32* %arrayidx1280
  %add1282 = add i32 %xor1278, %tmp1281
  %add1283 = add i32 %add1282, -1560198380
  %tmp1284 = load i32* %c, align 4
  %add1285 = add i32 %tmp1284, %add1283
  store i32 %add1285, i32* %c, align 4
  %tmp1286 = load i32* %c, align 4
  %shl1287 = shl i32 %tmp1286, 15
  %tmp1288 = load i32* %c, align 4
  %shr1289 = lshr i32 %tmp1288, 17
  %or1290 = or i32 %shl1287, %shr1289
  store i32 %or1290, i32* %c, align 4
  %tmp1291 = load i32* %d, align 4
  %tmp1292 = load i32* %c, align 4
  %add1293 = add i32 %tmp1292, %tmp1291
  store i32 %add1293, i32* %c, align 4
  %tmp1294 = load i32* %d, align 4
  %tmp1295 = load i32* %c, align 4
  %tmp1296 = load i32* %a, align 4
  %neg1297 = xor i32 %tmp1296, -1
  %or1298 = or i32 %tmp1295, %neg1297
  %xor1299 = xor i32 %tmp1294, %or1298
  %tmp1300 = load i32** %in.addr, align 8
  %arrayidx1301 = getelementptr inbounds i32* %tmp1300, i64 13
  %tmp1302 = load i32* %arrayidx1301
  %add1303 = add i32 %xor1299, %tmp1302
  %add1304 = add i32 %add1303, 1309151649
  %tmp1305 = load i32* %b, align 4
  %add1306 = add i32 %tmp1305, %add1304
  store i32 %add1306, i32* %b, align 4
  %tmp1307 = load i32* %b, align 4
  %shl1308 = shl i32 %tmp1307, 21
  %tmp1309 = load i32* %b, align 4
  %shr1310 = lshr i32 %tmp1309, 11
  %or1311 = or i32 %shl1308, %shr1310
  store i32 %or1311, i32* %b, align 4
  %tmp1312 = load i32* %c, align 4
  %tmp1313 = load i32* %b, align 4
  %add1314 = add i32 %tmp1313, %tmp1312
  store i32 %add1314, i32* %b, align 4
  %tmp1315 = load i32* %c, align 4
  %tmp1316 = load i32* %b, align 4
  %tmp1317 = load i32* %d, align 4
  %neg1318 = xor i32 %tmp1317, -1
  %or1319 = or i32 %tmp1316, %neg1318
  %xor1320 = xor i32 %tmp1315, %or1319
  %tmp1321 = load i32** %in.addr, align 8
  %arrayidx1322 = getelementptr inbounds i32* %tmp1321, i64 4
  %tmp1323 = load i32* %arrayidx1322
  %add1324 = add i32 %xor1320, %tmp1323
  %add1325 = add i32 %add1324, -145523070
  %tmp1326 = load i32* %a, align 4
  %add1327 = add i32 %tmp1326, %add1325
  store i32 %add1327, i32* %a, align 4
  %tmp1328 = load i32* %a, align 4
  %shl1329 = shl i32 %tmp1328, 6
  %tmp1330 = load i32* %a, align 4
  %shr1331 = lshr i32 %tmp1330, 26
  %or1332 = or i32 %shl1329, %shr1331
  store i32 %or1332, i32* %a, align 4
  %tmp1333 = load i32* %b, align 4
  %tmp1334 = load i32* %a, align 4
  %add1335 = add i32 %tmp1334, %tmp1333
  store i32 %add1335, i32* %a, align 4
  %tmp1336 = load i32* %b, align 4
  %tmp1337 = load i32* %a, align 4
  %tmp1338 = load i32* %c, align 4
  %neg1339 = xor i32 %tmp1338, -1
  %or1340 = or i32 %tmp1337, %neg1339
  %xor1341 = xor i32 %tmp1336, %or1340
  %tmp1342 = load i32** %in.addr, align 8
  %arrayidx1343 = getelementptr inbounds i32* %tmp1342, i64 11
  %tmp1344 = load i32* %arrayidx1343
  %add1345 = add i32 %xor1341, %tmp1344
  %add1346 = add i32 %add1345, -1120210379
  %tmp1347 = load i32* %d, align 4
  %add1348 = add i32 %tmp1347, %add1346
  store i32 %add1348, i32* %d, align 4
  %tmp1349 = load i32* %d, align 4
  %shl1350 = shl i32 %tmp1349, 10
  %tmp1351 = load i32* %d, align 4
  %shr1352 = lshr i32 %tmp1351, 22
  %or1353 = or i32 %shl1350, %shr1352
  store i32 %or1353, i32* %d, align 4
  %tmp1354 = load i32* %a, align 4
  %tmp1355 = load i32* %d, align 4
  %add1356 = add i32 %tmp1355, %tmp1354
  store i32 %add1356, i32* %d, align 4
  %tmp1357 = load i32* %a, align 4
  %tmp1358 = load i32* %d, align 4
  %tmp1359 = load i32* %b, align 4
  %neg1360 = xor i32 %tmp1359, -1
  %or1361 = or i32 %tmp1358, %neg1360
  %xor1362 = xor i32 %tmp1357, %or1361
  %tmp1363 = load i32** %in.addr, align 8
  %arrayidx1364 = getelementptr inbounds i32* %tmp1363, i64 2
  %tmp1365 = load i32* %arrayidx1364
  %add1366 = add i32 %xor1362, %tmp1365
  %add1367 = add i32 %add1366, 718787259
  %tmp1368 = load i32* %c, align 4
  %add1369 = add i32 %tmp1368, %add1367
  store i32 %add1369, i32* %c, align 4
  %tmp1370 = load i32* %c, align 4
  %shl1371 = shl i32 %tmp1370, 15
  %tmp1372 = load i32* %c, align 4
  %shr1373 = lshr i32 %tmp1372, 17
  %or1374 = or i32 %shl1371, %shr1373
  store i32 %or1374, i32* %c, align 4
  %tmp1375 = load i32* %d, align 4
  %tmp1376 = load i32* %c, align 4
  %add1377 = add i32 %tmp1376, %tmp1375
  store i32 %add1377, i32* %c, align 4
  %tmp1378 = load i32* %d, align 4
  %tmp1379 = load i32* %c, align 4
  %tmp1380 = load i32* %a, align 4
  %neg1381 = xor i32 %tmp1380, -1
  %or1382 = or i32 %tmp1379, %neg1381
  %xor1383 = xor i32 %tmp1378, %or1382
  %tmp1384 = load i32** %in.addr, align 8
  %arrayidx1385 = getelementptr inbounds i32* %tmp1384, i64 9
  %tmp1386 = load i32* %arrayidx1385
  %add1387 = add i32 %xor1383, %tmp1386
  %add1388 = add i32 %add1387, -343485551
  %tmp1389 = load i32* %b, align 4
  %add1390 = add i32 %tmp1389, %add1388
  store i32 %add1390, i32* %b, align 4
  %tmp1391 = load i32* %b, align 4
  %shl1392 = shl i32 %tmp1391, 21
  %tmp1393 = load i32* %b, align 4
  %shr1394 = lshr i32 %tmp1393, 11
  %or1395 = or i32 %shl1392, %shr1394
  store i32 %or1395, i32* %b, align 4
  %tmp1396 = load i32* %c, align 4
  %tmp1397 = load i32* %b, align 4
  %add1398 = add i32 %tmp1397, %tmp1396
  store i32 %add1398, i32* %b, align 4
  %tmp1399 = load i32* %a, align 4
  %tmp1400 = load i32** %buf.addr, align 8
  %arrayidx1401 = getelementptr inbounds i32* %tmp1400, i64 0
  %tmp1402 = load i32* %arrayidx1401
  %add1403 = add i32 %tmp1402, %tmp1399
  store i32 %add1403, i32* %arrayidx1401
  %tmp1404 = load i32* %b, align 4
  %tmp1405 = load i32** %buf.addr, align 8
  %arrayidx1406 = getelementptr inbounds i32* %tmp1405, i64 1
  %tmp1407 = load i32* %arrayidx1406
  %add1408 = add i32 %tmp1407, %tmp1404
  store i32 %add1408, i32* %arrayidx1406
  %tmp1409 = load i32* %c, align 4
  %tmp1410 = load i32** %buf.addr, align 8
  %arrayidx1411 = getelementptr inbounds i32* %tmp1410, i64 2
  %tmp1412 = load i32* %arrayidx1411
  %add1413 = add i32 %tmp1412, %tmp1409
  store i32 %add1413, i32* %arrayidx1411
  %tmp1414 = load i32* %d, align 4
  %tmp1415 = load i32** %buf.addr, align 8
  %arrayidx1416 = getelementptr inbounds i32* %tmp1415, i64 3
  %tmp1417 = load i32* %arrayidx1416
  %add1418 = add i32 %tmp1417, %tmp1414
  store i32 %add1418, i32* %arrayidx1416
  ret void
}
