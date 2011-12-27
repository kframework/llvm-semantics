; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041011-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@gvol = common global [32 x i32] zeroinitializer, align 16
@gull = common global i64 0, align 8

define i64 @t1(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp5 = add i32 %n, -1
  %tmp6 = zext i32 %tmp5 to i64
  %tmp7 = shl nuw nsw i64 %tmp6, 11
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp = add i64 %x, -2048
  %tmp8 = sub i64 %tmp, %tmp7
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t2(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp5 = add i32 %n, -1
  %tmp6 = zext i32 %tmp5 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp = add i64 %x, -513
  %0 = mul i64 %tmp6, -513
  %tmp8 = add i64 %tmp, %0
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t3(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp5 = add i32 %n, -1
  %tmp6 = zext i32 %tmp5 to i64
  %tmp7 = shl nuw nsw i64 %tmp6, 9
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp = add i64 %x, -512
  %tmp8 = sub i64 %tmp, %tmp7
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t4(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp5 = add i32 %n, -1
  %tmp6 = zext i32 %tmp5 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp = add i64 %x, -511
  %0 = mul i64 %tmp6, -511
  %tmp8 = add i64 %tmp, %0
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t5(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp5 = add i32 %n, -1
  %tmp6 = zext i32 %tmp5 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp = add i64 %x, -1
  %tmp7 = sub i64 %tmp, %tmp6
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp7, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t6(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = add i32 %n, -1
  %tmp5 = zext i32 %tmp to i64
  %tmp6 = add i64 %tmp5, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp7 = add i64 %tmp6, 1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp7, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t7(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = add i32 %n, -1
  %tmp5 = zext i32 %tmp to i64
  %tmp6 = mul i64 %tmp5, 511
  %tmp7 = add i64 %tmp6, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp8 = add i64 %tmp7, 511
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t8(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = add i32 %n, -1
  %tmp5 = zext i32 %tmp to i64
  %tmp6 = shl nuw nsw i64 %tmp5, 9
  %tmp7 = add i64 %tmp6, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp8 = add i64 %tmp7, 512
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t9(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = add i32 %n, -1
  %tmp5 = zext i32 %tmp to i64
  %tmp6 = mul i64 %tmp5, 513
  %tmp7 = add i64 %tmp6, %x
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp8 = add i64 %tmp7, 513
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t10(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp91 = load i64* @gull, align 8
  %tmp = add i32 %n, -1
  %tmp5 = zext i32 %tmp to i64
  %tmp6 = add i64 %tmp5, 1
  %tmp7 = mul i64 %tmp91, %tmp6
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp8 = add i64 %tmp7, %x
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @t11(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp91 = load i64* @gull, align 8
  %tmp = add i32 %n, -1
  %tmp5 = zext i32 %tmp to i64
  %tmp6 = xor i64 %tmp5, -1
  %tmp7 = mul i64 %tmp91, %tmp6
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i32 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  volatile store i32 %tmp31, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 1), align 4
  volatile store i32 %tmp32, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 2), align 8
  volatile store i32 %tmp33, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 3), align 4
  volatile store i32 %tmp34, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 4), align 16
  volatile store i32 %tmp35, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 5), align 4
  volatile store i32 %tmp36, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 6), align 8
  volatile store i32 %tmp37, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 7), align 4
  volatile store i32 %tmp38, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 8), align 16
  volatile store i32 %tmp39, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 9), align 4
  volatile store i32 %tmp40, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 10), align 8
  volatile store i32 %tmp41, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 11), align 4
  volatile store i32 %tmp42, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 12), align 16
  volatile store i32 %tmp43, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 13), align 4
  volatile store i32 %tmp44, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 14), align 8
  volatile store i32 %tmp45, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 15), align 4
  volatile store i32 %tmp46, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 16), align 16
  volatile store i32 %tmp47, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 17), align 4
  volatile store i32 %tmp48, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 18), align 8
  volatile store i32 %tmp49, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 19), align 4
  volatile store i32 %tmp50, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 20), align 16
  volatile store i32 %tmp51, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 21), align 4
  volatile store i32 %tmp52, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 22), align 8
  volatile store i32 %tmp53, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 23), align 4
  volatile store i32 %tmp54, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 24), align 16
  volatile store i32 %tmp55, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 25), align 4
  volatile store i32 %tmp56, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 26), align 8
  volatile store i32 %tmp57, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 27), align 4
  volatile store i32 %tmp58, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 28), align 16
  volatile store i32 %tmp59, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 29), align 4
  volatile store i32 %tmp60, i32* getelementptr inbounds ([32 x i32]* @gvol, i64 0, i64 30), align 8
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %n
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp8 = add i64 %tmp7, %x
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %tmp8, %while.cond.while.end_crit_edge ], [ %x, %entry ]
  ret i64 %storemerge.lcssa
}

define i64 @neg(i64 %x) nounwind uwtable readnone {
entry:
  %sub = sub i64 0, %x
  ret i64 %sub
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i64 100, i64* @gull, align 8
  %call = tail call i64 @t1(i32 3, i64 -1)
  %cmp = icmp eq i64 %call, -6145
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = tail call i64 @t1(i32 3, i64 4294967295)
  %cmp2 = icmp eq i64 %call1, 4294961151
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = tail call i64 @t2(i32 3, i64 -1)
  %cmp6 = icmp eq i64 %call5, -1540
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = tail call i64 @t2(i32 3, i64 4294967295)
  %cmp10 = icmp eq i64 %call9, 4294965756
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = tail call i64 @t3(i32 3, i64 -1)
  %cmp14 = icmp eq i64 %call13, -1537
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = tail call i64 @t3(i32 3, i64 4294967295)
  %cmp18 = icmp eq i64 %call17, 4294965759
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = tail call i64 @t4(i32 3, i64 -1)
  %cmp22 = icmp eq i64 %call21, -1534
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = tail call i64 @t4(i32 3, i64 4294967295)
  %cmp26 = icmp eq i64 %call25, 4294965762
  br i1 %cmp26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = tail call i64 @t5(i32 3, i64 -1)
  %cmp30 = icmp eq i64 %call29, -4
  br i1 %cmp30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = tail call i64 @t5(i32 3, i64 4294967295)
  %cmp34 = icmp eq i64 %call33, 4294967292
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end32
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = tail call i64 @t6(i32 3, i64 -1)
  %cmp38 = icmp eq i64 %call37, 2
  br i1 %cmp38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end36
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = tail call i64 @t6(i32 3, i64 4294967295)
  %cmp42 = icmp eq i64 %call41, 4294967298
  br i1 %cmp42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end40
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = tail call i64 @t7(i32 3, i64 -1)
  %cmp46 = icmp eq i64 %call45, 1532
  br i1 %cmp46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = tail call i64 @t7(i32 3, i64 4294967295)
  %cmp50 = icmp eq i64 %call49, 4294968828
  br i1 %cmp50, label %if.end52, label %if.then51

if.then51:                                        ; preds = %if.end48
  tail call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = tail call i64 @t8(i32 3, i64 -1)
  %cmp54 = icmp eq i64 %call53, 1535
  br i1 %cmp54, label %if.end56, label %if.then55

if.then55:                                        ; preds = %if.end52
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = tail call i64 @t8(i32 3, i64 4294967295)
  %cmp58 = icmp eq i64 %call57, 4294968831
  br i1 %cmp58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end56
  tail call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = tail call i64 @t9(i32 3, i64 -1)
  %cmp62 = icmp eq i64 %call61, 1538
  br i1 %cmp62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %if.end60
  tail call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = tail call i64 @t9(i32 3, i64 4294967295)
  %cmp66 = icmp eq i64 %call65, 4294968834
  br i1 %cmp66, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end64
  tail call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = tail call i64 @t10(i32 3, i64 -1)
  %tmp = load i64* @gull, align 8
  %mul = mul i64 %tmp, 3
  %sub = add i64 %mul, -1
  %cmp70 = icmp eq i64 %call69, %sub
  br i1 %cmp70, label %if.end72, label %if.then71

if.then71:                                        ; preds = %if.end68
  tail call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = tail call i64 @t10(i32 3, i64 4294967295)
  %tmp74 = load i64* @gull, align 8
  %mul75 = mul i64 %tmp74, 3
  %add = add i64 %mul75, 4294967295
  %cmp76 = icmp eq i64 %call73, %add
  br i1 %cmp76, label %if.end78, label %if.then77

if.then77:                                        ; preds = %if.end72
  tail call void @abort() noreturn nounwind
  unreachable

if.end78:                                         ; preds = %if.end72
  %call79 = tail call i64 @t11(i32 3, i64 -1)
  %tmp80 = load i64* @gull, align 8
  %mul82 = mul i64 %tmp80, -3
  %sub83 = add i64 %mul82, -1
  %cmp84 = icmp eq i64 %call79, %sub83
  br i1 %cmp84, label %if.end86, label %if.then85

if.then85:                                        ; preds = %if.end78
  tail call void @abort() noreturn nounwind
  unreachable

if.end86:                                         ; preds = %if.end78
  %call87 = tail call i64 @t11(i32 3, i64 4294967295)
  %tmp88 = load i64* @gull, align 8
  %mul90 = mul i64 %tmp88, -3
  %add91 = add i64 %mul90, 4294967295
  %cmp92 = icmp eq i64 %call87, %add91
  br i1 %cmp92, label %if.end94, label %if.then93

if.then93:                                        ; preds = %if.end86
  tail call void @abort() noreturn nounwind
  unreachable

if.end94:                                         ; preds = %if.end86
  %sub.i = sub i64 0, %tmp88
  %cmp97 = icmp eq i64 %sub.i, -100
  br i1 %cmp97, label %if.end99, label %if.then98

if.then98:                                        ; preds = %if.end94
  tail call void @abort() noreturn nounwind
  unreachable

if.end99:                                         ; preds = %if.end94
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
