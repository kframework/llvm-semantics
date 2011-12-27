; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/prime.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable readnone {
entry:
  br label %for.cond.outer.i30

for.cond.outer.i30:                               ; preds = %for.body.us.i38, %entry
  %tmp72.ph.i27 = phi i32 [ 1, %entry ], [ 0, %for.body.us.i38 ]
  %inc1.ph.i28 = phi i32 [ 2, %entry ], [ %inc1.inc.us.i37, %for.body.us.i38 ]
  %tobool.i29 = icmp eq i32 %tmp72.ph.i27, 0
  br i1 %tobool.i29, label %for.cond.outer.i17, label %for.cond.us.i33

for.cond.us.i33:                                  ; preds = %for.cond.outer.i30, %for.body.us.i38
  %inc1.us.i31 = phi i32 [ %inc1.inc.us.i37, %for.body.us.i38 ], [ %inc1.ph.i28, %for.cond.outer.i30 ]
  %cmp.us.i32 = icmp slt i32 %inc1.us.i31, 3
  br i1 %cmp.us.i32, label %for.body.us.i38, label %for.cond.outer.i17

for.body.us.i38:                                  ; preds = %for.cond.us.i33
  %rem.us.i34 = srem i32 7, %inc1.us.i31
  %cmp5.us.i35 = icmp eq i32 %rem.us.i34, 0
  %0 = zext i1 %cmp5.us.i35 to i32
  %inc.us.i36 = xor i32 %0, 1
  %inc1.inc.us.i37 = add nsw i32 %inc.us.i36, %inc1.us.i31
  br i1 %cmp5.us.i35, label %for.cond.outer.i30, label %for.cond.us.i33

for.cond.outer.i17:                               ; preds = %for.cond.outer.i17, %for.cond.us.i33, %for.cond.outer.i30
  %tmp72.ph.i14 = phi i32 [ 1, %for.cond.outer.i30 ], [ 1, %for.cond.us.i33 ], [ 0, %for.cond.outer.i17 ]
  %tobool.i16 = icmp eq i32 %tmp72.ph.i14, 0
  br i1 %tobool.i16, label %for.cond.outer.i4, label %for.cond.outer.i17

for.cond.outer.i4:                                ; preds = %for.body.us.i12, %for.cond.outer.i17
  %tmp72.ph.i1 = phi i32 [ 1, %for.cond.outer.i17 ], [ 0, %for.body.us.i12 ]
  %inc1.ph.i2 = phi i32 [ 2, %for.cond.outer.i17 ], [ %inc1.inc.us.i11, %for.body.us.i12 ]
  %tobool.i3 = icmp eq i32 %tmp72.ph.i1, 0
  br i1 %tobool.i3, label %prime.exit13, label %for.cond.us.i7

for.cond.us.i7:                                   ; preds = %for.cond.outer.i4, %for.body.us.i12
  %inc1.us.i5 = phi i32 [ %inc1.inc.us.i11, %for.body.us.i12 ], [ %inc1.ph.i2, %for.cond.outer.i4 ]
  %cmp.us.i6 = icmp slt i32 %inc1.us.i5, 15
  br i1 %cmp.us.i6, label %for.body.us.i12, label %prime.exit13

for.body.us.i12:                                  ; preds = %for.cond.us.i7
  %rem.us.i8 = srem i32 31, %inc1.us.i5
  %cmp5.us.i9 = icmp eq i32 %rem.us.i8, 0
  %1 = zext i1 %cmp5.us.i9 to i32
  %inc.us.i10 = xor i32 %1, 1
  %inc1.inc.us.i11 = add nsw i32 %inc.us.i10, %inc1.us.i5
  br i1 %cmp5.us.i9, label %for.cond.outer.i4, label %for.cond.us.i7

prime.exit13:                                     ; preds = %for.cond.outer.i4, %for.cond.us.i7
  %add = add i32 %tmp72.ph.i27, 1
  %add3 = add i32 %add, %tmp72.ph.i14
  %add5 = add i32 %add3, %tmp72.ph.i1
  ret i32 %add5
}

define i32 @prime(i32 %n) nounwind uwtable readnone {
entry:
  %div = sdiv i32 %n, 2
  br label %for.cond.outer

for.cond.outer:                                   ; preds = %for.body.us, %entry
  %tmp72.ph = phi i32 [ 1, %entry ], [ 0, %for.body.us ]
  %inc1.ph = phi i32 [ 2, %entry ], [ %inc1.inc.us, %for.body.us ]
  %tobool = icmp eq i32 %tmp72.ph, 0
  br i1 %tobool, label %for.end, label %for.cond.us

for.cond.us:                                      ; preds = %for.body.us, %for.cond.outer
  %inc1.us = phi i32 [ %inc1.ph, %for.cond.outer ], [ %inc1.inc.us, %for.body.us ]
  %cmp.us = icmp slt i32 %inc1.us, %div
  br i1 %cmp.us, label %for.body.us, label %for.end

for.body.us:                                      ; preds = %for.cond.us
  %rem.us = srem i32 %n, %inc1.us
  %cmp5.us = icmp eq i32 %rem.us, 0
  %0 = zext i1 %cmp5.us to i32
  %inc.us = xor i32 %0, 1
  %inc1.inc.us = add nsw i32 %inc.us, %inc1.us
  br i1 %cmp5.us, label %for.cond.outer, label %for.cond.us

for.end:                                          ; preds = %for.cond.outer, %for.cond.us
  ret i32 %tmp72.ph
}
