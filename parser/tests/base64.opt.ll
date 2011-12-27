; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/base64.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b64 = global [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16
@nbytes = global [4 x i32] [i32 3, i32 1, i32 1, i32 2], align 16
@.str = private unnamed_addr constant [25 x i8] c"TGl0ZXJhdGVQcm9ncmFtcw==\00", align 1

define void @xlate(i8* %in, i32 %phase) nounwind uwtable {
entry:
  %out = alloca [3 x i8], align 1
  %tmp1 = load i8* %in, align 1
  %shl = shl i8 %tmp1, 2
  %arrayidx3 = getelementptr inbounds i8* %in, i64 1
  %tmp4 = load i8* %arrayidx3, align 1
  %shr1 = lshr i8 %tmp4, 4
  %or = or i8 %shr1, %shl
  %arrayidx7 = getelementptr inbounds [3 x i8]* %out, i64 0, i64 0
  store i8 %or, i8* %arrayidx7, align 1
  %shl12 = shl i8 %tmp4, 4
  %arrayidx14 = getelementptr inbounds i8* %in, i64 2
  %tmp15 = load i8* %arrayidx14, align 1
  %shr172 = lshr i8 %tmp15, 2
  %or18 = or i8 %shr172, %shl12
  %arrayidx20 = getelementptr inbounds [3 x i8]* %out, i64 0, i64 1
  store i8 %or18, i8* %arrayidx20, align 1
  %shl25 = shl i8 %tmp15, 6
  %arrayidx27 = getelementptr inbounds i8* %in, i64 3
  %tmp28 = load i8* %arrayidx27, align 1
  %or31 = or i8 %shl25, %tmp28
  %arrayidx33 = getelementptr inbounds [3 x i8]* %out, i64 0, i64 2
  store i8 %or31, i8* %arrayidx33, align 1
  %idxprom = sext i32 %phase to i64
  %arrayidx37 = getelementptr inbounds [4 x i32]* @nbytes, i64 0, i64 %idxprom
  %tmp383 = load i32* %arrayidx37, align 4
  %cmp4 = icmp sgt i32 %tmp383, 0
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body.for.body_crit_edge
  %tmp43 = phi i8 [ %tmp43.pre, %for.body.for.body_crit_edge ], [ %or, %entry ]
  %indvar = phi i64 [ %phitmp, %for.body.for.body_crit_edge ], [ 1, %entry ]
  %inc = trunc i64 %indvar to i32
  %conv44 = zext i8 %tmp43 to i32
  %call = call i32 @putchar(i32 %conv44) nounwind
  %tmp38 = load i32* %arrayidx37, align 4
  %cmp = icmp slt i32 %inc, %tmp38
  br i1 %cmp, label %for.body.for.body_crit_edge, label %for.end

for.body.for.body_crit_edge:                      ; preds = %for.body
  %arrayidx42.phi.trans.insert = getelementptr [3 x i8]* %out, i64 0, i64 %indvar
  %tmp43.pre = load i8* %arrayidx42.phi.trans.insert, align 1
  %phitmp = add i64 %indvar, 1
  br label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

declare i32 @putchar(i32) nounwind

define i32 @main() nounwind uwtable {
entry:
  %out.i = alloca [3 x i8], align 1
  %in = alloca [4 x i8], align 1
  %arraydecay18 = getelementptr inbounds [4 x i8]* %in, i64 0, i64 0
  %0 = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 0
  %arrayidx3.i4 = getelementptr inbounds [4 x i8]* %in, i64 0, i64 1
  %arrayidx14.i10 = getelementptr inbounds [4 x i8]* %in, i64 0, i64 2
  %arrayidx20.i14 = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 1
  %arrayidx27.i16 = getelementptr inbounds [4 x i8]* %in, i64 0, i64 3
  %arrayidx33.i19 = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 2
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.then9, %xlate.exit36, %entry
  %incdec.ptr38.ph = phi i8* [ getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr, %xlate.exit36 ], [ %incdec.ptr, %if.then9 ]
  %tmp1937.ph = phi i32 [ 0, %entry ], [ %rem, %xlate.exit36 ], [ %rem, %if.then9 ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %if.end
  %indvar61 = phi i64 [ 0, %while.cond.outer ], [ %tmp63, %if.end ]
  %tmp63 = add i64 %indvar61, 1
  %incdec.ptr = getelementptr i8* %incdec.ptr38.ph, i64 %tmp63
  %incdec.ptr38 = getelementptr i8* %incdec.ptr38.ph, i64 %indvar61
  %tmp1 = load i8* %incdec.ptr38, align 1
  switch i8 %tmp1, label %if.end [
    i8 0, label %while.end
    i8 61, label %if.then
  ]

if.then:                                          ; preds = %while.cond
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %tmp1.i = load i8* %arraydecay18, align 1
  %shl.i = shl i8 %tmp1.i, 2
  %tmp4.i = load i8* %arrayidx3.i4, align 1
  %shr1.i = lshr i8 %tmp4.i, 4
  %or.i = or i8 %shr1.i, %shl.i
  store i8 %or.i, i8* %0, align 1
  %shl12.i = shl i8 %tmp4.i, 4
  %tmp15.i = load i8* %arrayidx14.i10, align 1
  %shr172.i = lshr i8 %tmp15.i, 2
  %or18.i = or i8 %shr172.i, %shl12.i
  store i8 %or18.i, i8* %arrayidx20.i14, align 1
  %shl25.i = shl i8 %tmp15.i, 6
  %tmp28.i = load i8* %arrayidx27.i16, align 1
  %or31.i = or i8 %shl25.i, %tmp28.i
  store i8 %or31.i, i8* %arrayidx33.i19, align 1
  %idxprom.i = sext i32 %tmp1937.ph to i64
  %arrayidx37.i = getelementptr inbounds [4 x i32]* @nbytes, i64 0, i64 %idxprom.i
  %tmp383.i = load i32* %arrayidx37.i, align 4
  %cmp4.i = icmp sgt i32 %tmp383.i, 0
  br i1 %cmp4.i, label %for.body.i.preheader, label %xlate.exit

for.body.i.preheader:                             ; preds = %if.then
  %conv44.i39 = zext i8 %or.i to i32
  %call.i40 = call i32 @putchar(i32 %conv44.i39) nounwind
  %tmp38.i41 = load i32* %arrayidx37.i, align 4
  %cmp.i42 = icmp sgt i32 %tmp38.i41, 1
  br i1 %cmp.i42, label %for.body.for.body_crit_edge.i, label %xlate.exit

for.body.for.body_crit_edge.i:                    ; preds = %for.body.i.preheader, %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge
  %tmp43.pre.i = phi i8 [ %tmp43.pre.i.pre, %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge ], [ %or18.i, %for.body.i.preheader ]
  %indvar = phi i64 [ %tmp, %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge ], [ 0, %for.body.i.preheader ]
  %tmp52 = add i64 %indvar, 2
  %inc.i = trunc i64 %tmp52 to i32
  %conv44.i = zext i8 %tmp43.pre.i to i32
  %call.i = call i32 @putchar(i32 %conv44.i) nounwind
  %tmp38.i = load i32* %arrayidx37.i, align 4
  %cmp.i = icmp slt i32 %inc.i, %tmp38.i
  br i1 %cmp.i, label %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge, label %xlate.exit

for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge: ; preds = %for.body.for.body_crit_edge.i
  %tmp = add i64 %indvar, 1
  %arrayidx42.phi.trans.insert.i.phi.trans.insert = getelementptr [3 x i8]* %out.i, i64 0, i64 %tmp52
  %tmp43.pre.i.pre = load i8* %arrayidx42.phi.trans.insert.i.phi.trans.insert, align 1
  br label %for.body.for.body_crit_edge.i

xlate.exit:                                       ; preds = %for.body.i.preheader, %for.body.for.body_crit_edge.i, %if.then
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  br label %while.end

if.end:                                           ; preds = %while.cond
  %conv = sext i8 %tmp1 to i32
  %call = call i8* @strchr(i8* getelementptr inbounds ([65 x i8]* @b64, i64 0, i64 0), i32 %conv) nounwind readonly
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %while.cond, label %if.then9

if.then9:                                         ; preds = %if.end
  %sub.ptr.lhs.cast = ptrtoint i8* %call to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([65 x i8]* @b64 to i64)
  %conv11 = trunc i64 %sub.ptr.sub to i8
  %idxprom = sext i32 %tmp1937.ph to i64
  %arrayidx = getelementptr inbounds [4 x i8]* %in, i64 0, i64 %idxprom
  store i8 %conv11, i8* %arrayidx, align 1
  %add = add nsw i32 %tmp1937.ph, 1
  %rem = srem i32 %add, 4
  %cmp15 = icmp eq i32 %rem, 0
  br i1 %cmp15, label %if.then17, label %while.cond.outer

if.then17:                                        ; preds = %if.then9
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %tmp1.i2 = load i8* %arraydecay18, align 1
  %shl.i3 = shl i8 %tmp1.i2, 2
  %tmp4.i5 = load i8* %arrayidx3.i4, align 1
  %shr1.i6 = lshr i8 %tmp4.i5, 4
  %or.i7 = or i8 %shr1.i6, %shl.i3
  store i8 %or.i7, i8* %0, align 1
  %shl12.i9 = shl i8 %tmp4.i5, 4
  %tmp15.i11 = load i8* %arrayidx14.i10, align 1
  %shr172.i12 = lshr i8 %tmp15.i11, 2
  %or18.i13 = or i8 %shr172.i12, %shl12.i9
  store i8 %or18.i13, i8* %arrayidx20.i14, align 1
  %shl25.i15 = shl i8 %tmp15.i11, 6
  %tmp28.i17 = load i8* %arrayidx27.i16, align 1
  %or31.i18 = or i8 %shl25.i15, %tmp28.i17
  store i8 %or31.i18, i8* %arrayidx33.i19, align 1
  %idxprom.i20 = sext i32 %rem to i64
  %arrayidx37.i21 = getelementptr inbounds [4 x i32]* @nbytes, i64 0, i64 %idxprom.i20
  %tmp383.i22 = load i32* %arrayidx37.i21, align 4
  %cmp4.i23 = icmp sgt i32 %tmp383.i22, 0
  br i1 %cmp4.i23, label %for.body.i31.preheader, label %xlate.exit36

for.body.i31.preheader:                           ; preds = %if.then17
  %conv44.i2744 = zext i8 %or.i7 to i32
  %call.i2845 = call i32 @putchar(i32 %conv44.i2744) nounwind
  %tmp38.i2946 = load i32* %arrayidx37.i21, align 4
  %cmp.i3047 = icmp sgt i32 %tmp38.i2946, 1
  br i1 %cmp.i3047, label %for.body.for.body_crit_edge.i35, label %xlate.exit36

for.body.for.body_crit_edge.i35:                  ; preds = %for.body.i31.preheader, %for.body.for.body_crit_edge.i35.for.body.for.body_crit_edge.i35_crit_edge
  %tmp43.pre.i33 = phi i8 [ %tmp43.pre.i33.pre, %for.body.for.body_crit_edge.i35.for.body.for.body_crit_edge.i35_crit_edge ], [ %or18.i13, %for.body.i31.preheader ]
  %indvar54 = phi i64 [ %tmp56, %for.body.for.body_crit_edge.i35.for.body.for.body_crit_edge.i35_crit_edge ], [ 0, %for.body.i31.preheader ]
  %tmp57 = add i64 %indvar54, 2
  %inc.i26 = trunc i64 %tmp57 to i32
  %conv44.i27 = zext i8 %tmp43.pre.i33 to i32
  %call.i28 = call i32 @putchar(i32 %conv44.i27) nounwind
  %tmp38.i29 = load i32* %arrayidx37.i21, align 4
  %cmp.i30 = icmp slt i32 %inc.i26, %tmp38.i29
  br i1 %cmp.i30, label %for.body.for.body_crit_edge.i35.for.body.for.body_crit_edge.i35_crit_edge, label %xlate.exit36

for.body.for.body_crit_edge.i35.for.body.for.body_crit_edge.i35_crit_edge: ; preds = %for.body.for.body_crit_edge.i35
  %tmp56 = add i64 %indvar54, 1
  %arrayidx42.phi.trans.insert.i32.phi.trans.insert = getelementptr [3 x i8]* %out.i, i64 0, i64 %tmp57
  %tmp43.pre.i33.pre = load i8* %arrayidx42.phi.trans.insert.i32.phi.trans.insert, align 1
  br label %for.body.for.body_crit_edge.i35

xlate.exit36:                                     ; preds = %for.body.i31.preheader, %for.body.for.body_crit_edge.i35, %if.then17
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  store i8 0, i8* %arrayidx27.i16, align 1
  store i8 0, i8* %arrayidx14.i10, align 1
  store i8 0, i8* %arrayidx3.i4, align 1
  store i8 0, i8* %arraydecay18, align 1
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond, %xlate.exit
  ret i32 0
}

declare i8* @strchr(i8*, i32) nounwind readonly

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
