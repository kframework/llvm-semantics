; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/mersenne.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@mt = internal global [11 x i64] zeroinitializer, align 16
@mti = internal global i32 12, align 4
@genrand_int32.mag01 = internal global [2 x i64] [i64 0, i64 2567483615], align 16
@main.init = internal unnamed_addr constant [4 x i64] [i64 291, i64 564, i64 837, i64 1110], align 16
@.str = private unnamed_addr constant [30 x i8] c"5 outputs of genrand_int32()\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%u \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define void @init_genrand(i64 %s) nounwind uwtable {
entry:
  %s.addr = alloca i64, align 8
  store i64 %s, i64* %s.addr, align 8
  %tmp = load i64* %s.addr, align 8
  %and = and i64 %tmp, 4294967295
  store i64 %and, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* @mti, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* @mti, align 4
  %cmp = icmp slt i32 %tmp1, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* @mti, align 4
  %sub = sub nsw i32 %tmp2, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom
  %tmp3 = load i64* %arrayidx, align 8
  %tmp4 = load i32* @mti, align 4
  %sub5 = sub nsw i32 %tmp4, 1
  %idxprom6 = sext i32 %sub5 to i64
  %arrayidx7 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom6
  %tmp8 = load i64* %arrayidx7, align 8
  %shr = lshr i64 %tmp8, 30
  %xor = xor i64 %tmp3, %shr
  %mul = mul i64 1812433253, %xor
  %tmp9 = load i32* @mti, align 4
  %conv = sext i32 %tmp9 to i64
  %add = add i64 %mul, %conv
  %tmp10 = load i32* @mti, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %arrayidx12 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom11
  store i64 %add, i64* %arrayidx12, align 8
  %tmp13 = load i32* @mti, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx15 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom14
  %tmp16 = load i64* %arrayidx15, align 8
  %and17 = and i64 %tmp16, 4294967295
  store i64 %and17, i64* %arrayidx15, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp18 = load i32* @mti, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* @mti, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @init_by_array(i64* %init_key, i32 %key_length) nounwind uwtable {
entry:
  %init_key.addr = alloca i64*, align 8
  %key_length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i64* %init_key, i64** %init_key.addr, align 8
  store i32 %key_length, i32* %key_length.addr, align 4
  call void @init_genrand(i64 19650218)
  store i32 1, i32* %i, align 4
  store i32 0, i32* %j, align 4
  %tmp = load i32* %key_length.addr, align 4
  %cmp = icmp sgt i32 11, %tmp
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp1 = load i32* %key_length.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 11, %cond.true ], [ %tmp1, %cond.false ]
  store i32 %cond, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %tmp2 = load i32* %k, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom
  %tmp4 = load i64* %arrayidx, align 8
  %tmp5 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp5, 1
  %idxprom6 = sext i32 %sub to i64
  %arrayidx7 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom6
  %tmp8 = load i64* %arrayidx7, align 8
  %tmp9 = load i32* %i, align 4
  %sub10 = sub nsw i32 %tmp9, 1
  %idxprom11 = sext i32 %sub10 to i64
  %arrayidx12 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom11
  %tmp13 = load i64* %arrayidx12, align 8
  %shr = lshr i64 %tmp13, 30
  %xor = xor i64 %tmp8, %shr
  %mul = mul i64 %xor, 1664525
  %xor14 = xor i64 %tmp4, %mul
  %tmp15 = load i32* %j, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %tmp17 = load i64** %init_key.addr, align 8
  %arrayidx18 = getelementptr inbounds i64* %tmp17, i64 %idxprom16
  %tmp19 = load i64* %arrayidx18
  %add = add i64 %xor14, %tmp19
  %tmp20 = load i32* %j, align 4
  %conv = sext i32 %tmp20 to i64
  %add21 = add i64 %add, %conv
  %tmp22 = load i32* %i, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %arrayidx24 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom23
  store i64 %add21, i64* %arrayidx24, align 8
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx27 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom26
  %tmp28 = load i64* %arrayidx27, align 8
  %and = and i64 %tmp28, 4294967295
  store i64 %and, i64* %arrayidx27, align 8
  %tmp29 = load i32* %i, align 4
  %inc = add nsw i32 %tmp29, 1
  store i32 %inc, i32* %i, align 4
  %tmp30 = load i32* %j, align 4
  %inc31 = add nsw i32 %tmp30, 1
  store i32 %inc31, i32* %j, align 4
  %tmp32 = load i32* %i, align 4
  %cmp33 = icmp sge i32 %tmp32, 11
  br i1 %cmp33, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp35 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i64 %tmp35, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %tmp36 = load i32* %j, align 4
  %tmp37 = load i32* %key_length.addr, align 4
  %cmp38 = icmp sge i32 %tmp36, %tmp37
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end
  store i32 0, i32* %j, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end41
  %tmp42 = load i32* %k, align 4
  %dec = add nsw i32 %tmp42, -1
  store i32 %dec, i32* %k, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 10, i32* %k, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc84, %for.end
  %tmp44 = load i32* %k, align 4
  %tobool45 = icmp ne i32 %tmp44, 0
  br i1 %tobool45, label %for.body46, label %for.end87

for.body46:                                       ; preds = %for.cond43
  %tmp47 = load i32* %i, align 4
  %idxprom48 = sext i32 %tmp47 to i64
  %arrayidx49 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom48
  %tmp50 = load i64* %arrayidx49, align 8
  %tmp51 = load i32* %i, align 4
  %sub52 = sub nsw i32 %tmp51, 1
  %idxprom53 = sext i32 %sub52 to i64
  %arrayidx54 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom53
  %tmp55 = load i64* %arrayidx54, align 8
  %tmp56 = load i32* %i, align 4
  %sub57 = sub nsw i32 %tmp56, 1
  %idxprom58 = sext i32 %sub57 to i64
  %arrayidx59 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom58
  %tmp60 = load i64* %arrayidx59, align 8
  %shr61 = lshr i64 %tmp60, 30
  %xor62 = xor i64 %tmp55, %shr61
  %mul63 = mul i64 %xor62, 1566083941
  %xor64 = xor i64 %tmp50, %mul63
  %tmp65 = load i32* %i, align 4
  %conv66 = sext i32 %tmp65 to i64
  %sub67 = sub i64 %xor64, %conv66
  %tmp68 = load i32* %i, align 4
  %idxprom69 = sext i32 %tmp68 to i64
  %arrayidx70 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom69
  store i64 %sub67, i64* %arrayidx70, align 8
  %tmp71 = load i32* %i, align 4
  %idxprom72 = sext i32 %tmp71 to i64
  %arrayidx73 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom72
  %tmp74 = load i64* %arrayidx73, align 8
  %and75 = and i64 %tmp74, 4294967295
  store i64 %and75, i64* %arrayidx73, align 8
  %tmp76 = load i32* %i, align 4
  %inc77 = add nsw i32 %tmp76, 1
  store i32 %inc77, i32* %i, align 4
  %tmp78 = load i32* %i, align 4
  %cmp79 = icmp sge i32 %tmp78, 11
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %for.body46
  %tmp82 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i64 %tmp82, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* %i, align 4
  br label %if.end83

if.end83:                                         ; preds = %if.then81, %for.body46
  br label %for.inc84

for.inc84:                                        ; preds = %if.end83
  %tmp85 = load i32* %k, align 4
  %dec86 = add nsw i32 %tmp85, -1
  store i32 %dec86, i32* %k, align 4
  br label %for.cond43

for.end87:                                        ; preds = %for.cond43
  store i64 2147483648, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  ret void
}

define i64 @genrand_int32() nounwind uwtable {
entry:
  %y = alloca i64, align 8
  %kk = alloca i32, align 4
  %tmp = load i32* @mti, align 4
  %cmp = icmp sge i32 %tmp, 11
  br i1 %cmp, label %if.then, label %if.end79

if.then:                                          ; preds = %entry
  %tmp2 = load i32* @mti, align 4
  %cmp3 = icmp eq i32 %tmp2, 12
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  call void @init_genrand(i64 5489)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  store i32 0, i32* %kk, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp5 = load i32* %kk, align 4
  %cmp6 = icmp slt i32 %tmp5, 4
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp7 = load i32* %kk, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom
  %tmp8 = load i64* %arrayidx, align 8
  %and = and i64 %tmp8, 2147483648
  %tmp9 = load i32* %kk, align 4
  %add = add nsw i32 %tmp9, 1
  %idxprom10 = sext i32 %add to i64
  %arrayidx11 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom10
  %tmp12 = load i64* %arrayidx11, align 8
  %and13 = and i64 %tmp12, 2147483647
  %or = or i64 %and, %and13
  store i64 %or, i64* %y, align 8
  %tmp14 = load i32* %kk, align 4
  %add15 = add nsw i32 %tmp14, 7
  %idxprom16 = sext i32 %add15 to i64
  %arrayidx17 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom16
  %tmp18 = load i64* %arrayidx17, align 8
  %tmp19 = load i64* %y, align 8
  %shr = lshr i64 %tmp19, 1
  %xor = xor i64 %tmp18, %shr
  %tmp20 = load i64* %y, align 8
  %and21 = and i64 %tmp20, 1
  %arrayidx22 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %and21
  %tmp23 = load i64* %arrayidx22, align 8
  %xor24 = xor i64 %xor, %tmp23
  %tmp25 = load i32* %kk, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx27 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom26
  store i64 %xor24, i64* %arrayidx27, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp28 = load i32* %kk, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %kk, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc61, %for.end
  %tmp30 = load i32* %kk, align 4
  %cmp31 = icmp slt i32 %tmp30, 10
  br i1 %cmp31, label %for.body32, label %for.end64

for.body32:                                       ; preds = %for.cond29
  %tmp33 = load i32* %kk, align 4
  %idxprom34 = sext i32 %tmp33 to i64
  %arrayidx35 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom34
  %tmp36 = load i64* %arrayidx35, align 8
  %and37 = and i64 %tmp36, 2147483648
  %tmp38 = load i32* %kk, align 4
  %add39 = add nsw i32 %tmp38, 1
  %idxprom40 = sext i32 %add39 to i64
  %arrayidx41 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom40
  %tmp42 = load i64* %arrayidx41, align 8
  %and43 = and i64 %tmp42, 2147483647
  %or44 = or i64 %and37, %and43
  store i64 %or44, i64* %y, align 8
  %tmp45 = load i32* %kk, align 4
  %add46 = add nsw i32 %tmp45, -4
  %idxprom47 = sext i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom47
  %tmp49 = load i64* %arrayidx48, align 8
  %tmp50 = load i64* %y, align 8
  %shr51 = lshr i64 %tmp50, 1
  %xor52 = xor i64 %tmp49, %shr51
  %tmp53 = load i64* %y, align 8
  %and54 = and i64 %tmp53, 1
  %arrayidx55 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %and54
  %tmp56 = load i64* %arrayidx55, align 8
  %xor57 = xor i64 %xor52, %tmp56
  %tmp58 = load i32* %kk, align 4
  %idxprom59 = sext i32 %tmp58 to i64
  %arrayidx60 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom59
  store i64 %xor57, i64* %arrayidx60, align 8
  br label %for.inc61

for.inc61:                                        ; preds = %for.body32
  %tmp62 = load i32* %kk, align 4
  %inc63 = add nsw i32 %tmp62, 1
  store i32 %inc63, i32* %kk, align 4
  br label %for.cond29

for.end64:                                        ; preds = %for.cond29
  %tmp65 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  %and66 = and i64 %tmp65, 2147483648
  %tmp67 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  %and68 = and i64 %tmp67, 2147483647
  %or69 = or i64 %and66, %and68
  store i64 %or69, i64* %y, align 8
  %tmp70 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 6), align 8
  %tmp71 = load i64* %y, align 8
  %shr72 = lshr i64 %tmp71, 1
  %xor73 = xor i64 %tmp70, %shr72
  %tmp74 = load i64* %y, align 8
  %and75 = and i64 %tmp74, 1
  %arrayidx76 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %and75
  %tmp77 = load i64* %arrayidx76, align 8
  %xor78 = xor i64 %xor73, %tmp77
  store i64 %xor78, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i32 0, i32* @mti, align 4
  br label %if.end79

if.end79:                                         ; preds = %for.end64, %entry
  %tmp80 = load i32* @mti, align 4
  %inc81 = add nsw i32 %tmp80, 1
  store i32 %inc81, i32* @mti, align 4
  %idxprom82 = sext i32 %tmp80 to i64
  %arrayidx83 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %idxprom82
  %tmp84 = load i64* %arrayidx83, align 8
  store i64 %tmp84, i64* %y, align 8
  %tmp85 = load i64* %y, align 8
  %shr86 = lshr i64 %tmp85, 11
  %tmp87 = load i64* %y, align 8
  %xor88 = xor i64 %tmp87, %shr86
  store i64 %xor88, i64* %y, align 8
  %tmp89 = load i64* %y, align 8
  %shl = shl i64 %tmp89, 7
  %and90 = and i64 %shl, 2636928640
  %tmp91 = load i64* %y, align 8
  %xor92 = xor i64 %tmp91, %and90
  store i64 %xor92, i64* %y, align 8
  %tmp93 = load i64* %y, align 8
  %shl94 = shl i64 %tmp93, 15
  %and95 = and i64 %shl94, 4022730752
  %tmp96 = load i64* %y, align 8
  %xor97 = xor i64 %tmp96, %and95
  store i64 %xor97, i64* %y, align 8
  %tmp98 = load i64* %y, align 8
  %shr99 = lshr i64 %tmp98, 18
  %tmp100 = load i64* %y, align 8
  %xor101 = xor i64 %tmp100, %shr99
  store i64 %xor101, i64* %y, align 8
  %tmp102 = load i64* %y, align 8
  ret i64 %tmp102
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %init = alloca [4 x i64], align 16
  %length = alloca i64, align 8
  store i32 0, i32* %retval
  %tmp = bitcast [4 x i64]* %init to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x i64]* @main.init to i8*), i64 32, i32 16, i1 false)
  store i64 4, i64* %length, align 8
  %arraydecay = getelementptr inbounds [4 x i64]* %init, i32 0, i32 0
  %tmp2 = load i64* %length, align 8
  %conv = trunc i64 %tmp2 to i32
  call void @init_by_array(i64* %arraydecay, i32 %conv)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call5 = call i64 @genrand_int32()
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i64 %call5)
  %tmp7 = load i32* %i, align 4
  %rem = srem i32 %tmp7, 5
  %cmp8 = icmp eq i32 %rem, 4
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp11 = load i32* %i, align 4
  %inc = add nsw i32 %tmp11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
