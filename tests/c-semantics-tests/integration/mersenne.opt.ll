; ModuleID = '/home/david/src/c-semantics/tests/integration/mersenne.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mt = internal unnamed_addr global [11 x i64] zeroinitializer, align 16
@mti = internal unnamed_addr global i32 12, align 4
@genrand_int32.mag01 = internal unnamed_addr constant [2 x i64] [i64 0, i64 2567483615], align 16
@main.init = private unnamed_addr constant [4 x i64] [i64 291, i64 564, i64 837, i64 1110], align 16
@.str1 = private unnamed_addr constant [4 x i8] c"%u \00", align 1
@str = private unnamed_addr constant [29 x i8] c"5 outputs of genrand_int32()\00"

define void @init_genrand(i64 %s) nounwind uwtable {
entry:
  %and = and i64 %s, 4294967295
  store i64 %and, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  store i32 1, i32* @mti, align 4
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %0 = phi i64 [ %and, %entry ], [ %and8, %for.body ]
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.body ]
  %shr = lshr i64 %0, 30
  %xor = xor i64 %shr, %0
  %mul = mul i64 %xor, 1812433253
  %add = add i64 %mul, %indvars.iv
  %arrayidx5 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %indvars.iv
  %and8 = and i64 %add, 4294967295
  store i64 %and8, i64* %arrayidx5, align 8, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  store i32 11, i32* @mti, align 4
  ret void
}

define void @init_by_array(i64* nocapture %init_key, i32 %key_length) nounwind uwtable {
entry:
  store i64 19650218, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  store i64 2194844435, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8, !tbaa !0
  store i64 874550967, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16, !tbaa !0
  store i64 1417962806, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8, !tbaa !0
  store i64 719805879, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16, !tbaa !0
  store i64 2188372024, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8, !tbaa !0
  store i64 721660136, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16, !tbaa !0
  store i64 1814940559, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8, !tbaa !0
  store i64 2833403150, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16, !tbaa !0
  store i64 3889680837, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8, !tbaa !0
  store i64 1003665704, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16, !tbaa !0
  store i32 11, i32* @mti, align 4
  %cmp = icmp slt i32 %key_length, 11
  %cond = select i1 %cmp, i32 11, i32 %key_length
  %tobool53 = icmp eq i32 %cond, 0
  br i1 %tobool53, label %for.body23, label %for.body

for.body:                                         ; preds = %entry, %if.end.for.body_crit_edge
  %0 = phi i64 [ %.pre, %if.end.for.body_crit_edge ], [ 2194844435, %entry ]
  %k.056 = phi i32 [ %dec, %if.end.for.body_crit_edge ], [ %cond, %entry ]
  %j.055 = phi i32 [ %inc14., %if.end.for.body_crit_edge ], [ 0, %entry ]
  %i.054 = phi i32 [ %i.1, %if.end.for.body_crit_edge ], [ 1, %entry ]
  %idxprom = sext i32 %i.054 to i64
  %arrayidx = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom
  %sub = add nsw i32 %i.054, -1
  %idxprom1 = sext i32 %sub to i64
  %arrayidx2 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom1
  %1 = load i64* %arrayidx2, align 8, !tbaa !0
  %shr = lshr i64 %1, 30
  %xor = xor i64 %shr, %1
  %mul = mul i64 %xor, 1664525
  %xor6 = xor i64 %mul, %0
  %idxprom7 = sext i32 %j.055 to i64
  %arrayidx8 = getelementptr inbounds i64* %init_key, i64 %idxprom7
  %2 = load i64* %arrayidx8, align 8, !tbaa !0
  %add = add i64 %2, %idxprom7
  %add9 = add i64 %add, %xor6
  %and = and i64 %add9, 4294967295
  store i64 %and, i64* %arrayidx, align 8, !tbaa !0
  %inc = add nsw i32 %i.054, 1
  %inc14 = add nsw i32 %j.055, 1
  %cmp15 = icmp sgt i32 %inc, 10
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16, !tbaa !0
  store i64 %3, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %i.1 = phi i32 [ 1, %if.then ], [ %inc, %for.body ]
  %dec = add nsw i32 %k.056, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %for.body23, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  %cmp17 = icmp slt i32 %inc14, %key_length
  %inc14. = select i1 %cmp17, i32 %inc14, i32 0
  %idxprom.phi.trans.insert = sext i32 %i.1 to i64
  %arrayidx.phi.trans.insert = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom.phi.trans.insert
  %.pre = load i64* %arrayidx.phi.trans.insert, align 8, !tbaa !0
  br label %for.body

for.body23:                                       ; preds = %entry, %if.end, %for.inc48
  %k.152 = phi i32 [ %dec49, %for.inc48 ], [ 10, %if.end ], [ 10, %entry ]
  %i.251 = phi i32 [ %i.3, %for.inc48 ], [ %i.1, %if.end ], [ 1, %entry ]
  %idxprom24 = sext i32 %i.251 to i64
  %arrayidx25 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom24
  %4 = load i64* %arrayidx25, align 8, !tbaa !0
  %sub26 = add nsw i32 %i.251, -1
  %idxprom27 = sext i32 %sub26 to i64
  %arrayidx28 = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom27
  %5 = load i64* %arrayidx28, align 8, !tbaa !0
  %shr32 = lshr i64 %5, 30
  %xor33 = xor i64 %shr32, %5
  %mul34 = mul i64 %xor33, 1566083941
  %xor35 = xor i64 %mul34, %4
  %sub37 = sub i64 %xor35, %idxprom24
  %and42 = and i64 %sub37, 4294967295
  store i64 %and42, i64* %arrayidx25, align 8, !tbaa !0
  %inc43 = add nsw i32 %i.251, 1
  %cmp44 = icmp sgt i32 %inc43, 10
  br i1 %cmp44, label %if.then46, label %for.inc48

if.then46:                                        ; preds = %for.body23
  %6 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16, !tbaa !0
  store i64 %6, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  br label %for.inc48

for.inc48:                                        ; preds = %for.body23, %if.then46
  %i.3 = phi i32 [ 1, %if.then46 ], [ %inc43, %for.body23 ]
  %dec49 = add nsw i32 %k.152, -1
  %tobool22 = icmp eq i32 %dec49, 0
  br i1 %tobool22, label %for.end50, label %for.body23

for.end50:                                        ; preds = %for.inc48
  store i64 2147483648, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  ret void
}

define i64 @genrand_int32() nounwind uwtable {
entry:
  %0 = load i32* @mti, align 4, !tbaa !3
  %cmp = icmp sgt i32 %0, 10
  br i1 %cmp, label %if.then, label %entry.if.end47_crit_edge

entry.if.end47_crit_edge:                         ; preds = %entry
  %idxprom49.phi.trans.insert = sext i32 %0 to i64
  %arrayidx50.phi.trans.insert = getelementptr inbounds [11 x i64]* @mt, i64 0, i64 %idxprom49.phi.trans.insert
  %.pre82 = load i64* %arrayidx50.phi.trans.insert, align 8, !tbaa !0
  %phitmp83 = add i32 %0, 1
  br label %if.end47

if.then:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %0, 12
  br i1 %cmp1, label %if.then2, label %if.then.for.cond.preheader_crit_edge

if.then.for.cond.preheader_crit_edge:             ; preds = %if.then
  %.pre = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  %.pre73 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8, !tbaa !0
  %.pre74 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8, !tbaa !0
  %.pre75 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16, !tbaa !0
  %.pre76 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16, !tbaa !0
  %.pre77 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8, !tbaa !0
  %.pre78 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8, !tbaa !0
  %.pre79 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16, !tbaa !0
  %.pre80 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16, !tbaa !0
  %phitmp = and i64 %.pre, 2147483648
  br label %for.end38

if.then2:                                         ; preds = %if.then
  store i64 5489, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  store i64 1301868182, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8, !tbaa !0
  store i64 2938499221, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16, !tbaa !0
  store i64 2950281878, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8, !tbaa !0
  store i64 1875628136, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16, !tbaa !0
  store i64 751856242, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8, !tbaa !0
  store i64 944701696, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16, !tbaa !0
  store i64 2243192071, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8, !tbaa !0
  store i64 694061057, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16, !tbaa !0
  store i64 219885934, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8, !tbaa !0
  store i64 2066767472, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16, !tbaa !0
  store i32 11, i32* @mti, align 4
  br label %for.end38

for.end38:                                        ; preds = %if.then.for.cond.preheader_crit_edge, %if.then2
  %1 = phi i64 [ %.pre80, %if.then.for.cond.preheader_crit_edge ], [ 2066767472, %if.then2 ]
  %2 = phi i64 [ %.pre79, %if.then.for.cond.preheader_crit_edge ], [ 1875628136, %if.then2 ]
  %3 = phi i64 [ %.pre78, %if.then.for.cond.preheader_crit_edge ], [ 219885934, %if.then2 ]
  %4 = phi i64 [ %.pre77, %if.then.for.cond.preheader_crit_edge ], [ 2950281878, %if.then2 ]
  %5 = phi i64 [ %.pre76, %if.then.for.cond.preheader_crit_edge ], [ 694061057, %if.then2 ]
  %6 = phi i64 [ %.pre75, %if.then.for.cond.preheader_crit_edge ], [ 2938499221, %if.then2 ]
  %7 = phi i64 [ %.pre74, %if.then.for.cond.preheader_crit_edge ], [ 2243192071, %if.then2 ]
  %8 = phi i64 [ %.pre73, %if.then.for.cond.preheader_crit_edge ], [ 1301868182, %if.then2 ]
  %9 = phi i64 [ %phitmp, %if.then.for.cond.preheader_crit_edge ], [ 0, %if.then2 ]
  %and6 = and i64 %8, 2147483646
  %or = or i64 %and6, %9
  %shr = lshr exact i64 %or, 1
  %and10 = and i64 %8, 1
  %arrayidx11 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and10
  %10 = load i64* %arrayidx11, align 8, !tbaa !0
  %xor = xor i64 %10, %7
  %xor12 = xor i64 %xor, %shr
  store i64 %xor12, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 0), align 16, !tbaa !0
  %and.1 = and i64 %8, 2147483648
  %and6.1 = and i64 %6, 2147483646
  %or.1 = or i64 %and6.1, %and.1
  %shr.1 = lshr exact i64 %or.1, 1
  %and10.1 = and i64 %6, 1
  %arrayidx11.1 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and10.1
  %11 = load i64* %arrayidx11.1, align 8, !tbaa !0
  %xor.1 = xor i64 %11, %5
  %xor12.1 = xor i64 %xor.1, %shr.1
  store i64 %xor12.1, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 1), align 8, !tbaa !0
  %and.2 = and i64 %6, 2147483648
  %and6.2 = and i64 %4, 2147483646
  %or.2 = or i64 %and6.2, %and.2
  %shr.2 = lshr exact i64 %or.2, 1
  %and10.2 = and i64 %4, 1
  %arrayidx11.2 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and10.2
  %12 = load i64* %arrayidx11.2, align 8, !tbaa !0
  %xor.2 = xor i64 %12, %3
  %xor12.2 = xor i64 %xor.2, %shr.2
  store i64 %xor12.2, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 2), align 16, !tbaa !0
  %and.3 = and i64 %4, 2147483648
  %and6.3 = and i64 %2, 2147483646
  %or.3 = or i64 %and6.3, %and.3
  %shr.3 = lshr exact i64 %or.3, 1
  %and10.3 = and i64 %2, 1
  %arrayidx11.3 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and10.3
  %13 = load i64* %arrayidx11.3, align 8, !tbaa !0
  %xor.3 = xor i64 %13, %1
  %xor12.3 = xor i64 %xor.3, %shr.3
  store i64 %xor12.3, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 3), align 8, !tbaa !0
  %and20 = and i64 %2, 2147483648
  %14 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8, !tbaa !0
  %and24 = and i64 %14, 2147483646
  %or25 = or i64 %and24, %and20
  %shr29 = lshr exact i64 %or25, 1
  %and31 = and i64 %14, 1
  %arrayidx32 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and31
  %15 = load i64* %arrayidx32, align 8, !tbaa !0
  %xor30 = xor i64 %15, %xor12
  %xor33 = xor i64 %xor30, %shr29
  store i64 %xor33, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 4), align 16, !tbaa !0
  %and20.1 = and i64 %14, 2147483648
  %16 = load i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16, !tbaa !0
  %and24.1 = and i64 %16, 2147483646
  %or25.1 = or i64 %and24.1, %and20.1
  %shr29.1 = lshr exact i64 %or25.1, 1
  %and31.1 = and i64 %16, 1
  %arrayidx32.1 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and31.1
  %17 = load i64* %arrayidx32.1, align 8, !tbaa !0
  %xor30.1 = xor i64 %17, %xor12.1
  %xor33.1 = xor i64 %xor30.1, %shr29.1
  store i64 %xor33.1, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 5), align 8, !tbaa !0
  %and20.2 = and i64 %16, 2147483648
  %and24.2 = and i64 %7, 2147483646
  %or25.2 = or i64 %and24.2, %and20.2
  %shr29.2 = lshr exact i64 %or25.2, 1
  %and31.2 = and i64 %7, 1
  %arrayidx32.2 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and31.2
  %18 = load i64* %arrayidx32.2, align 8, !tbaa !0
  %xor30.2 = xor i64 %18, %xor12.2
  %xor33.2 = xor i64 %xor30.2, %shr29.2
  store i64 %xor33.2, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 6), align 16, !tbaa !0
  %and20.3 = and i64 %7, 2147483648
  %and24.3 = and i64 %5, 2147483646
  %or25.3 = or i64 %and24.3, %and20.3
  %shr29.3 = lshr exact i64 %or25.3, 1
  %and31.3 = and i64 %5, 1
  %arrayidx32.3 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and31.3
  %19 = load i64* %arrayidx32.3, align 8, !tbaa !0
  %xor30.3 = xor i64 %19, %xor12.3
  %xor33.3 = xor i64 %xor30.3, %shr29.3
  store i64 %xor33.3, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 7), align 8, !tbaa !0
  %and20.4 = and i64 %5, 2147483648
  %and24.4 = and i64 %3, 2147483646
  %or25.4 = or i64 %and24.4, %and20.4
  %shr29.4 = lshr exact i64 %or25.4, 1
  %and31.4 = and i64 %3, 1
  %arrayidx32.4 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and31.4
  %20 = load i64* %arrayidx32.4, align 8, !tbaa !0
  %xor30.4 = xor i64 %20, %xor33
  %xor33.4 = xor i64 %xor30.4, %shr29.4
  store i64 %xor33.4, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 8), align 16, !tbaa !0
  %and20.5 = and i64 %3, 2147483648
  %and24.5 = and i64 %1, 2147483646
  %or25.5 = or i64 %and24.5, %and20.5
  %shr29.5 = lshr exact i64 %or25.5, 1
  %and31.5 = and i64 %1, 1
  %arrayidx32.5 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and31.5
  %21 = load i64* %arrayidx32.5, align 8, !tbaa !0
  %xor30.5 = xor i64 %21, %xor33.1
  %xor33.5 = xor i64 %xor30.5, %shr29.5
  store i64 %xor33.5, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 9), align 8, !tbaa !0
  %and39 = and i64 %1, 2147483648
  %and40 = and i64 %xor12, 2147483646
  %or41 = or i64 %and40, %and39
  %shr42 = lshr exact i64 %or41, 1
  %and44 = and i64 %xor12, 1
  %arrayidx45 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i64 0, i64 %and44
  %22 = load i64* %arrayidx45, align 8, !tbaa !0
  %xor43 = xor i64 %22, %xor33.2
  %xor46 = xor i64 %xor43, %shr42
  store i64 %xor46, i64* getelementptr inbounds ([11 x i64]* @mt, i64 0, i64 10), align 16, !tbaa !0
  store i32 0, i32* @mti, align 4, !tbaa !3
  br label %if.end47

if.end47:                                         ; preds = %entry.if.end47_crit_edge, %for.end38
  %23 = phi i64 [ %xor12, %for.end38 ], [ %.pre82, %entry.if.end47_crit_edge ]
  %24 = phi i32 [ 1, %for.end38 ], [ %phitmp83, %entry.if.end47_crit_edge ]
  store i32 %24, i32* @mti, align 4, !tbaa !3
  %shr51 = lshr i64 %23, 11
  %xor52 = xor i64 %shr51, %23
  %shl = shl i64 %xor52, 7
  %and53 = and i64 %shl, 2636928640
  %xor54 = xor i64 %and53, %xor52
  %shl55 = shl i64 %xor54, 15
  %and56 = and i64 %shl55, 4022730752
  %xor57 = xor i64 %and56, %xor54
  %shr58 = lshr i64 %xor57, 18
  %xor59 = xor i64 %shr58, %xor57
  ret i64 %xor59
}

define i32 @main() nounwind uwtable {
for.inc.9:
  %init = alloca [4 x i64], align 16
  %0 = bitcast [4 x i64]* %init to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x i64]* @main.init to i8*), i64 32, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [4 x i64]* %init, i64 0, i64 0
  call void @init_by_array(i64* %arraydecay, i32 4)
  %puts = call i32 @puts(i8* getelementptr inbounds ([29 x i8]* @str, i64 0, i64 0))
  %call2 = call i64 @genrand_int32()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2) nounwind
  %call2.1 = call i64 @genrand_int32()
  %call3.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.1) nounwind
  %call2.2 = call i64 @genrand_int32()
  %call3.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.2) nounwind
  %call2.3 = call i64 @genrand_int32()
  %call3.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.3) nounwind
  %call2.4 = call i64 @genrand_int32()
  %call3.4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.4) nounwind
  %putchar.4 = call i32 @putchar(i32 10) nounwind
  %call2.5 = call i64 @genrand_int32()
  %call3.5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.5) nounwind
  %call2.6 = call i64 @genrand_int32()
  %call3.6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.6) nounwind
  %call2.7 = call i64 @genrand_int32()
  %call3.7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.7) nounwind
  %call2.8 = call i64 @genrand_int32()
  %call3.8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.8) nounwind
  %call2.9 = call i64 @genrand_int32()
  %call3.9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i64 %call2.9) nounwind
  %putchar.9 = call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
