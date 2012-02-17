; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/mersenne.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@mt = internal unnamed_addr global [11 x i64] zeroinitializer, align 16
@mti = internal unnamed_addr global i32 12, align 4
@genrand_int32.mag01 = internal unnamed_addr constant [2 x i64] [i64 0, i64 2567483615], align 16
@main.init = internal unnamed_addr constant [4 x i64] [i64 291, i64 564, i64 837, i64 1110], align 16
@.str1 = private unnamed_addr constant [4 x i8] c"%u \00", align 1
@str = internal constant [29 x i8] c"5 outputs of genrand_int32()\00"

define void @init_genrand(i64 %s) nounwind uwtable {
entry:
  %and = and i64 %s, 4294967295
  store i64 %and, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  %shr = lshr i64 %and, 30
  %xor = xor i64 %shr, %and
  %mul = mul i64 %xor, 1812433253
  %add = add i64 %mul, 1
  %and17 = and i64 %add, 4294967295
  store i64 %and17, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8
  %shr.1 = lshr i64 %and17, 30
  %xor.1 = xor i64 %shr.1, %and17
  %mul.1 = mul i64 %xor.1, 1812433253
  %add.1 = add i64 %mul.1, 2
  %and17.1 = and i64 %add.1, 4294967295
  store i64 %and17.1, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16
  %shr.2 = lshr i64 %and17.1, 30
  %xor.2 = xor i64 %shr.2, %and17.1
  %mul.2 = mul i64 %xor.2, 1812433253
  %add.2 = add i64 %mul.2, 3
  %and17.2 = and i64 %add.2, 4294967295
  store i64 %and17.2, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8
  %shr.3 = lshr i64 %and17.2, 30
  %xor.3 = xor i64 %shr.3, %and17.2
  %mul.3 = mul i64 %xor.3, 1812433253
  %add.3 = add i64 %mul.3, 4
  %and17.3 = and i64 %add.3, 4294967295
  store i64 %and17.3, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16
  %shr.4 = lshr i64 %and17.3, 30
  %xor.4 = xor i64 %shr.4, %and17.3
  %mul.4 = mul i64 %xor.4, 1812433253
  %add.4 = add i64 %mul.4, 5
  %and17.4 = and i64 %add.4, 4294967295
  store i64 %and17.4, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8
  %shr.5 = lshr i64 %and17.4, 30
  %xor.5 = xor i64 %shr.5, %and17.4
  %mul.5 = mul i64 %xor.5, 1812433253
  %add.5 = add i64 %mul.5, 6
  %and17.5 = and i64 %add.5, 4294967295
  store i64 %and17.5, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16
  %shr.6 = lshr i64 %and17.5, 30
  %xor.6 = xor i64 %shr.6, %and17.5
  %mul.6 = mul i64 %xor.6, 1812433253
  %add.6 = add i64 %mul.6, 7
  %and17.6 = and i64 %add.6, 4294967295
  store i64 %and17.6, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8
  %shr.7 = lshr i64 %and17.6, 30
  %xor.7 = xor i64 %shr.7, %and17.6
  %mul.7 = mul i64 %xor.7, 1812433253
  %add.7 = add i64 %mul.7, 8
  %and17.7 = and i64 %add.7, 4294967295
  store i64 %and17.7, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16
  %shr.8 = lshr i64 %and17.7, 30
  %xor.8 = xor i64 %shr.8, %and17.7
  %mul.8 = mul i64 %xor.8, 1812433253
  %add.8 = add i64 %mul.8, 9
  %and17.8 = and i64 %add.8, 4294967295
  store i64 %and17.8, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8
  %shr.9 = lshr i64 %and17.8, 30
  %xor.9 = xor i64 %shr.9, %and17.8
  %mul.9 = mul i64 %xor.9, 1812433253
  %add.9 = add i64 %mul.9, 10
  %and17.9 = and i64 %add.9, 4294967295
  store i64 %and17.9, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  store i32 11, i32* @mti, align 4
  ret void
}

define void @init_by_array(i64* %init_key, i32 %key_length) nounwind uwtable {
for.body.lr.ph:
  store i64 19650218, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  store i64 2194844435, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8
  store i64 874550967, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16
  store i64 1417962806, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8
  store i64 719805879, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16
  store i64 2188372024, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8
  store i64 721660136, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16
  store i64 1814940559, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8
  store i64 2833403150, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16
  store i64 3889680837, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8
  store i64 1003665704, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  store i32 11, i32* @mti, align 4
  %tmp = icmp sgt i32 %key_length, 11
  %smax = select i1 %tmp, i32 %key_length, i32 11
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.lr.ph
  %tmp4 = phi i64 [ 2194844435, %for.body.lr.ph ], [ %tmp4.pre, %if.end.for.body_crit_edge ]
  %indvar7 = phi i32 [ 1, %for.body.lr.ph ], [ %phitmp, %if.end.for.body_crit_edge ]
  %0 = phi i32 [ 1, %for.body.lr.ph ], [ %2, %if.end.for.body_crit_edge ]
  %1 = phi i32 [ 0, %for.body.lr.ph ], [ %3, %if.end.for.body_crit_edge ]
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom
  %sub = add nsw i32 %0, -1
  %idxprom6 = sext i32 %sub to i64
  %arrayidx7 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom6
  %tmp8 = load i64* %arrayidx7, align 8
  %shr = lshr i64 %tmp8, 30
  %xor = xor i64 %shr, %tmp8
  %mul = mul i64 %xor, 1664525
  %xor14 = xor i64 %mul, %tmp4
  %idxprom16 = sext i32 %1 to i64
  %arrayidx18 = getelementptr inbounds i64* %init_key, i64 %idxprom16
  %tmp19 = load i64* %arrayidx18, align 8
  %add = add i64 %tmp19, %idxprom16
  %add21 = add i64 %add, %xor14
  %and = and i64 %add21, 4294967295
  store i64 %and, i64* %arrayidx, align 8
  %inc = add nsw i32 %0, 1
  %inc31 = add nsw i32 %1, 1
  %cmp33 = icmp sgt i32 %inc, 10
  br i1 %cmp33, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp35 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  store i64 %tmp35, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %2 = phi i32 [ 1, %if.then ], [ %inc, %for.body ]
  %exitcond9 = icmp eq i32 %indvar7, %smax
  br i1 %exitcond9, label %for.body46, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  %cmp38 = icmp slt i32 %inc31, %key_length
  %3 = select i1 %cmp38, i32 %inc31, i32 0
  %idxprom.phi.trans.insert = sext i32 %2 to i64
  %arrayidx.phi.trans.insert = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom.phi.trans.insert
  %tmp4.pre = load i64* %arrayidx.phi.trans.insert, align 8
  %phitmp = add i32 %indvar7, 1
  br label %for.body

for.body46:                                       ; preds = %if.end, %for.inc84
  %indvar = phi i32 [ %indvar.next, %for.inc84 ], [ 0, %if.end ]
  %4 = phi i32 [ %5, %for.inc84 ], [ %2, %if.end ]
  %idxprom48 = sext i32 %4 to i64
  %arrayidx49 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom48
  %tmp50 = load i64* %arrayidx49, align 8
  %sub52 = add nsw i32 %4, -1
  %idxprom53 = sext i32 %sub52 to i64
  %arrayidx54 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom53
  %tmp55 = load i64* %arrayidx54, align 8
  %shr61 = lshr i64 %tmp55, 30
  %xor62 = xor i64 %shr61, %tmp55
  %mul63 = mul i64 %xor62, 1566083941
  %xor64 = xor i64 %mul63, %tmp50
  %sub67 = sub i64 %xor64, %idxprom48
  %and75 = and i64 %sub67, 4294967295
  store i64 %and75, i64* %arrayidx49, align 8
  %inc77 = add nsw i32 %4, 1
  %cmp79 = icmp sgt i32 %inc77, 10
  br i1 %cmp79, label %if.then81, label %for.inc84

if.then81:                                        ; preds = %for.body46
  %tmp82 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  store i64 %tmp82, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  br label %for.inc84

for.inc84:                                        ; preds = %for.body46, %if.then81
  %5 = phi i32 [ %inc77, %for.body46 ], [ 1, %if.then81 ]
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 10
  br i1 %exitcond, label %for.end87, label %for.body46

for.end87:                                        ; preds = %for.inc84
  store i64 2147483648, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  ret void
}

define i64 @genrand_int32() nounwind uwtable {
entry:
  %tmp = load i32* @mti, align 4
  %cmp = icmp sgt i32 %tmp, 10
  br i1 %cmp, label %if.then, label %entry.if.end79_crit_edge

entry.if.end79_crit_edge:                         ; preds = %entry
  %idxprom82.phi.trans.insert = sext i32 %tmp to i64
  %arrayidx83.phi.trans.insert = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom82.phi.trans.insert
  %tmp84.pre = load i64* %arrayidx83.phi.trans.insert, align 8
  %phitmp32 = add i32 %tmp, 1
  br label %if.end79

if.then:                                          ; preds = %entry
  %cmp3 = icmp eq i32 %tmp, 12
  br i1 %cmp3, label %if.then4, label %if.then.for.cond.preheader_crit_edge

if.then.for.cond.preheader_crit_edge:             ; preds = %if.then
  %tmp8.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  %tmp12.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8
  %tmp18.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8
  %tmp12.1.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16
  %tmp18.1.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16
  %tmp12.2.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8
  %tmp18.2.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8
  %tmp12.3.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16
  %tmp18.3.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  %phitmp = and i64 %tmp8.pre, 2147483648
  br label %for.end64

if.then4:                                         ; preds = %if.then
  store i64 5489, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  store i64 1301868182, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8
  store i64 2938499221, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16
  store i64 2950281878, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8
  store i64 1875628136, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16
  store i64 751856242, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8
  store i64 944701696, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16
  store i64 2243192071, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8
  store i64 694061057, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16
  store i64 219885934, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8
  store i64 2066767472, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  store i32 11, i32* @mti, align 4
  br label %for.end64

for.end64:                                        ; preds = %if.then.for.cond.preheader_crit_edge, %if.then4
  %tmp18.3 = phi i64 [ %tmp18.3.pre, %if.then.for.cond.preheader_crit_edge ], [ 2066767472, %if.then4 ]
  %tmp12.3 = phi i64 [ %tmp12.3.pre, %if.then.for.cond.preheader_crit_edge ], [ 1875628136, %if.then4 ]
  %tmp18.2 = phi i64 [ %tmp18.2.pre, %if.then.for.cond.preheader_crit_edge ], [ 219885934, %if.then4 ]
  %tmp12.2 = phi i64 [ %tmp12.2.pre, %if.then.for.cond.preheader_crit_edge ], [ 2950281878, %if.then4 ]
  %tmp18.1 = phi i64 [ %tmp18.1.pre, %if.then.for.cond.preheader_crit_edge ], [ 694061057, %if.then4 ]
  %tmp12.1 = phi i64 [ %tmp12.1.pre, %if.then.for.cond.preheader_crit_edge ], [ 2938499221, %if.then4 ]
  %tmp18 = phi i64 [ %tmp18.pre, %if.then.for.cond.preheader_crit_edge ], [ 2243192071, %if.then4 ]
  %tmp12 = phi i64 [ %tmp12.pre, %if.then.for.cond.preheader_crit_edge ], [ 1301868182, %if.then4 ]
  %tmp8 = phi i64 [ %phitmp, %if.then.for.cond.preheader_crit_edge ], [ 0, %if.then4 ]
  %and13 = and i64 %tmp12, 2147483646
  %or = or i64 %and13, %tmp8
  %shr = lshr exact i64 %or, 1
  %and21 = and i64 %tmp12, 1
  %arrayidx22 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and21
  %tmp23 = load i64* %arrayidx22, align 8
  %xor = xor i64 %tmp23, %tmp18
  %xor24 = xor i64 %xor, %shr
  store i64 %xor24, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16
  %and.1 = and i64 %tmp12, 2147483648
  %and13.1 = and i64 %tmp12.1, 2147483646
  %or.1 = or i64 %and13.1, %and.1
  %shr.1 = lshr exact i64 %or.1, 1
  %and21.1 = and i64 %tmp12.1, 1
  %arrayidx22.1 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and21.1
  %tmp23.1 = load i64* %arrayidx22.1, align 8
  %xor.1 = xor i64 %tmp23.1, %tmp18.1
  %xor24.1 = xor i64 %xor.1, %shr.1
  store i64 %xor24.1, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8
  %and.2 = and i64 %tmp12.1, 2147483648
  %and13.2 = and i64 %tmp12.2, 2147483646
  %or.2 = or i64 %and13.2, %and.2
  %shr.2 = lshr exact i64 %or.2, 1
  %and21.2 = and i64 %tmp12.2, 1
  %arrayidx22.2 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and21.2
  %tmp23.2 = load i64* %arrayidx22.2, align 8
  %xor.2 = xor i64 %tmp23.2, %tmp18.2
  %xor24.2 = xor i64 %xor.2, %shr.2
  store i64 %xor24.2, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16
  %and.3 = and i64 %tmp12.2, 2147483648
  %and13.3 = and i64 %tmp12.3, 2147483646
  %or.3 = or i64 %and13.3, %and.3
  %shr.3 = lshr exact i64 %or.3, 1
  %and21.3 = and i64 %tmp12.3, 1
  %arrayidx22.3 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and21.3
  %tmp23.3 = load i64* %arrayidx22.3, align 8
  %xor.3 = xor i64 %tmp23.3, %tmp18.3
  %xor24.3 = xor i64 %xor.3, %shr.3
  store i64 %xor24.3, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8
  %and37 = and i64 %tmp12.3, 2147483648
  %tmp42 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8
  %and43 = and i64 %tmp42, 2147483646
  %or44 = or i64 %and43, %and37
  %shr51 = lshr exact i64 %or44, 1
  %and54 = and i64 %tmp42, 1
  %arrayidx55 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and54
  %tmp56 = load i64* %arrayidx55, align 8
  %xor52 = xor i64 %tmp56, %xor24
  %xor57 = xor i64 %xor52, %shr51
  store i64 %xor57, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16
  %and37.1 = and i64 %tmp42, 2147483648
  %tmp42.1 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16
  %and43.1 = and i64 %tmp42.1, 2147483646
  %or44.1 = or i64 %and43.1, %and37.1
  %shr51.1 = lshr exact i64 %or44.1, 1
  %and54.1 = and i64 %tmp42.1, 1
  %arrayidx55.1 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and54.1
  %tmp56.1 = load i64* %arrayidx55.1, align 8
  %xor52.1 = xor i64 %tmp56.1, %xor24.1
  %xor57.1 = xor i64 %xor52.1, %shr51.1
  store i64 %xor57.1, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8
  %and37.2 = and i64 %tmp42.1, 2147483648
  %and43.2 = and i64 %tmp18, 2147483646
  %or44.2 = or i64 %and43.2, %and37.2
  %shr51.2 = lshr exact i64 %or44.2, 1
  %and54.2 = and i64 %tmp18, 1
  %arrayidx55.2 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and54.2
  %tmp56.2 = load i64* %arrayidx55.2, align 8
  %xor52.2 = xor i64 %tmp56.2, %xor24.2
  %xor57.2 = xor i64 %xor52.2, %shr51.2
  store i64 %xor57.2, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16
  %and37.3 = and i64 %tmp18, 2147483648
  %and43.3 = and i64 %tmp18.1, 2147483646
  %or44.3 = or i64 %and43.3, %and37.3
  %shr51.3 = lshr exact i64 %or44.3, 1
  %and54.3 = and i64 %tmp18.1, 1
  %arrayidx55.3 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and54.3
  %tmp56.3 = load i64* %arrayidx55.3, align 8
  %xor52.3 = xor i64 %tmp56.3, %xor24.3
  %xor57.3 = xor i64 %xor52.3, %shr51.3
  store i64 %xor57.3, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8
  %and37.4 = and i64 %tmp18.1, 2147483648
  %and43.4 = and i64 %tmp18.2, 2147483646
  %or44.4 = or i64 %and43.4, %and37.4
  %shr51.4 = lshr exact i64 %or44.4, 1
  %and54.4 = and i64 %tmp18.2, 1
  %arrayidx55.4 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and54.4
  %tmp56.4 = load i64* %arrayidx55.4, align 8
  %xor52.4 = xor i64 %tmp56.4, %xor57
  %xor57.4 = xor i64 %xor52.4, %shr51.4
  store i64 %xor57.4, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16
  %and37.5 = and i64 %tmp18.2, 2147483648
  %and43.5 = and i64 %tmp18.3, 2147483646
  %or44.5 = or i64 %and43.5, %and37.5
  %shr51.5 = lshr exact i64 %or44.5, 1
  %and54.5 = and i64 %tmp18.3, 1
  %arrayidx55.5 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and54.5
  %tmp56.5 = load i64* %arrayidx55.5, align 8
  %xor52.5 = xor i64 %tmp56.5, %xor57.1
  %xor57.5 = xor i64 %xor52.5, %shr51.5
  store i64 %xor57.5, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8
  %and66 = and i64 %tmp18.3, 2147483648
  %and68 = and i64 %xor24, 2147483646
  %or69 = or i64 %and68, %and66
  %shr72 = lshr exact i64 %or69, 1
  %and75 = and i64 %xor24, 1
  %arrayidx76 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and75
  %tmp77 = load i64* %arrayidx76, align 8
  %xor73 = xor i64 %tmp77, %xor57.2
  %xor78 = xor i64 %xor73, %shr72
  store i64 %xor78, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16
  store i32 0, i32* @mti, align 4
  br label %if.end79

if.end79:                                         ; preds = %entry.if.end79_crit_edge, %for.end64
  %tmp84 = phi i64 [ %xor24, %for.end64 ], [ %tmp84.pre, %entry.if.end79_crit_edge ]
  %tmp80 = phi i32 [ 1, %for.end64 ], [ %phitmp32, %entry.if.end79_crit_edge ]
  store i32 %tmp80, i32* @mti, align 4
  %shr86 = lshr i64 %tmp84, 11
  %xor88 = xor i64 %shr86, %tmp84
  %shl = shl i64 %xor88, 7
  %and90 = and i64 %shl, 2636928640
  %xor92 = xor i64 %and90, %xor88
  %shl94 = shl i64 %xor92, 15
  %and95 = and i64 %shl94, 4022730752
  %xor97 = xor i64 %and95, %xor92
  %shr99 = lshr i64 %xor97, 18
  %xor101 = xor i64 %shr99, %xor97
  ret i64 %xor101
}

define i32 @main() nounwind uwtable {
for.inc.9:
  %init = alloca [4 x i64], align 16
  %tmp = bitcast [4 x i64]* %init to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x i64]* @main.init to i8*), i64 32, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [4 x i64]* %init, i64 0, i64 0
  call void @init_by_array(i64* %arraydecay, i32 4)
  %puts = call i32 @puts(i8* getelementptr inbounds ([29 x i8]* @str, i64 0, i64 0))
  %call5 = call i64 @genrand_int32()
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5) nounwind
  %call5.1 = call i64 @genrand_int32()
  %call6.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.1) nounwind
  %call5.2 = call i64 @genrand_int32()
  %call6.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.2) nounwind
  %call5.3 = call i64 @genrand_int32()
  %call6.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.3) nounwind
  %call5.4 = call i64 @genrand_int32()
  %call6.4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.4) nounwind
  %putchar.4 = call i32 @putchar(i32 10) nounwind
  %call5.5 = call i64 @genrand_int32()
  %call6.5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.5) nounwind
  %call5.6 = call i64 @genrand_int32()
  %call6.6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.6) nounwind
  %call5.7 = call i64 @genrand_int32()
  %call6.7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.7) nounwind
  %call5.8 = call i64 @genrand_int32()
  %call6.8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.8) nounwind
  %call5.9 = call i64 @genrand_int32()
  %call6.9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call5.9) nounwind
  %putchar.9 = call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)
