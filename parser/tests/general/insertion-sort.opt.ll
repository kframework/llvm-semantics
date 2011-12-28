; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/insertion-sort.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal unnamed_addr constant [5 x i32] [i32 5, i32 1, i32 9, i32 3, i32 2], align 16

define void @insertion_sort(i32* %a, i32 %length) nounwind uwtable {
entry:
  %cmp2 = icmp sgt i32 %length, 1
  br i1 %cmp2, label %for.body.lr.ph, label %for.end37

for.body.lr.ph:                                   ; preds = %entry
  %tmp12 = add i32 %length, -2
  %tmp13 = zext i32 %tmp12 to i64
  %tmp14 = add i64 %tmp13, 1
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %indvar4 = phi i64 [ 0, %for.body.lr.ph ], [ %tmp19, %for.end ]
  %tmp19 = add i64 %indvar4, 1
  %arrayidx = getelementptr i32* %a, i64 %tmp19
  %tmp6 = load i32* %arrayidx, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %if.end, %for.body
  %indvar = phi i64 [ %indvar.next, %if.end ], [ 0, %for.body ]
  %tmp17 = sub i64 %indvar4, %indvar
  %storemerge1 = trunc i64 %tmp17 to i32
  %tmp20 = sub i64 %tmp19, %indvar
  %arrayidx27 = getelementptr i32* %a, i64 %tmp20
  %cmp10 = icmp sgt i32 %storemerge1, 0
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %arrayidx15 = getelementptr i32* %a, i64 %tmp17
  %tmp16 = load i32* %arrayidx15, align 4
  %cmp18 = icmp sgt i32 %tmp16, %tmp6
  br i1 %cmp18, label %if.end, label %for.end

if.end:                                           ; preds = %for.body11
  store i32 %tmp16, i32* %arrayidx27, align 4
  %indvar.next = add i64 %indvar, 1
  br label %for.cond8

for.end:                                          ; preds = %for.body11, %for.cond8
  %sext = shl i64 %tmp20, 32
  %idxprom32 = ashr exact i64 %sext, 32
  %arrayidx34 = getelementptr inbounds i32* %a, i64 %idxprom32
  store i32 %tmp6, i32* %arrayidx34, align 4
  %exitcond = icmp eq i64 %tmp19, %tmp14
  br i1 %exitcond, label %for.end37, label %for.body

for.end37:                                        ; preds = %for.end, %entry
  ret void
}

define i32 @checkThatArrayIsSorted(i32* %array, i32 %length) nounwind uwtable readonly {
entry:
  %cmp3 = icmp sgt i32 %length, 1
  br i1 %cmp3, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = add i32 %length, -2
  %tmp6 = zext i32 %tmp to i64
  %tmp7 = add i64 %tmp6, 1
  %tmp4.pre = load i32* %array, align 4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %tmp4 = phi i32 [ %tmp4.pre, %for.body.lr.ph ], [ %tmp9, %for.body ]
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %tmp8, %for.body ]
  %tmp1324 = phi i32 [ 0, %for.body.lr.ph ], [ %tmp132.inc, %for.body ]
  %tmp8 = add i64 %indvar, 1
  %arrayidx8 = getelementptr i32* %array, i64 %tmp8
  %tmp9 = load i32* %arrayidx8, align 4
  %not.cmp10 = icmp sle i32 %tmp4, %tmp9
  %inc = zext i1 %not.cmp10 to i32
  %tmp132.inc = add nsw i32 %inc, %tmp1324
  %exitcond = icmp eq i64 %tmp8, %tmp7
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tmp132.lcssa = phi i32 [ 0, %entry ], [ %tmp132.inc, %for.body ]
  ret i32 %tmp132.lcssa
}

define i32 @main() nounwind uwtable readnone {
for.end.i:
  %a = alloca [5 x i32], align 16
  %tmp = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %arrayidx34.i = getelementptr inbounds [5 x i32]* %a, i64 0, i64 1
  store i32 1, i32* %arrayidx34.i, align 4
  %arrayidx.i.1 = getelementptr [5 x i32]* %a, i64 0, i64 2
  %tmp6.i.1 = load i32* %arrayidx.i.1, align 8
  br label %for.cond8.i.1

for.end.i.1:                                      ; preds = %for.body11.i.1, %for.cond8.i.1
  %sext.i.1 = shl i64 %tmp20.i.1, 32
  %idxprom32.i.1 = ashr exact i64 %sext.i.1, 32
  %arrayidx34.i.1 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %idxprom32.i.1
  store i32 %tmp6.i.1, i32* %arrayidx34.i.1, align 4
  %arrayidx.i.2 = getelementptr [5 x i32]* %a, i64 0, i64 3
  %tmp6.i.2 = load i32* %arrayidx.i.2, align 4
  br label %for.cond8.i.2

for.cond8.i.1:                                    ; preds = %if.end.i.1, %for.end.i
  %indvar.i.1 = phi i64 [ %indvar.next.i.1, %if.end.i.1 ], [ 0, %for.end.i ]
  %tmp14.1 = sub i64 1, %indvar.i.1
  %storemerge1.i.1 = trunc i64 %tmp14.1 to i32
  %tmp20.i.1 = sub i64 2, %indvar.i.1
  %arrayidx27.i.1 = getelementptr [5 x i32]* %a, i64 0, i64 %tmp20.i.1
  %cmp10.i.1 = icmp sgt i32 %storemerge1.i.1, 0
  br i1 %cmp10.i.1, label %for.body11.i.1, label %for.end.i.1

if.end.i.1:                                       ; preds = %for.body11.i.1
  store i32 %tmp16.i.1, i32* %arrayidx27.i.1, align 4
  %indvar.next.i.1 = add i64 %indvar.i.1, 1
  br label %for.cond8.i.1

for.body11.i.1:                                   ; preds = %for.cond8.i.1
  %arrayidx15.i.1 = getelementptr [5 x i32]* %a, i64 0, i64 %tmp14.1
  %tmp16.i.1 = load i32* %arrayidx15.i.1, align 4
  %cmp18.i.1 = icmp sgt i32 %tmp16.i.1, %tmp6.i.1
  br i1 %cmp18.i.1, label %if.end.i.1, label %for.end.i.1

for.end.i.2:                                      ; preds = %for.body11.i.2, %for.cond8.i.2
  %sext.i.2 = shl i64 %tmp20.i.2, 32
  %idxprom32.i.2 = ashr exact i64 %sext.i.2, 32
  %arrayidx34.i.2 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %idxprom32.i.2
  store i32 %tmp6.i.2, i32* %arrayidx34.i.2, align 4
  %arrayidx.i.3 = getelementptr [5 x i32]* %a, i64 0, i64 4
  %tmp6.i.3 = load i32* %arrayidx.i.3, align 16
  br label %for.cond8.i.3

for.cond8.i.2:                                    ; preds = %if.end.i.2, %for.end.i.1
  %indvar.i.2 = phi i64 [ %indvar.next.i.2, %if.end.i.2 ], [ 0, %for.end.i.1 ]
  %tmp14.2 = sub i64 2, %indvar.i.2
  %storemerge1.i.2 = trunc i64 %tmp14.2 to i32
  %tmp20.i.2 = sub i64 3, %indvar.i.2
  %arrayidx27.i.2 = getelementptr [5 x i32]* %a, i64 0, i64 %tmp20.i.2
  %cmp10.i.2 = icmp sgt i32 %storemerge1.i.2, 0
  br i1 %cmp10.i.2, label %for.body11.i.2, label %for.end.i.2

if.end.i.2:                                       ; preds = %for.body11.i.2
  store i32 %tmp16.i.2, i32* %arrayidx27.i.2, align 4
  %indvar.next.i.2 = add i64 %indvar.i.2, 1
  br label %for.cond8.i.2

for.body11.i.2:                                   ; preds = %for.cond8.i.2
  %arrayidx15.i.2 = getelementptr [5 x i32]* %a, i64 0, i64 %tmp14.2
  %tmp16.i.2 = load i32* %arrayidx15.i.2, align 4
  %cmp18.i.2 = icmp sgt i32 %tmp16.i.2, %tmp6.i.2
  br i1 %cmp18.i.2, label %if.end.i.2, label %for.end.i.2

for.end.i.3:                                      ; preds = %for.body11.i.3, %for.cond8.i.3
  %sext.i.3 = shl i64 %tmp20.i.3, 32
  %idxprom32.i.3 = ashr exact i64 %sext.i.3, 32
  %arrayidx34.i.3 = getelementptr inbounds [5 x i32]* %a, i64 0, i64 %idxprom32.i.3
  store i32 %tmp6.i.3, i32* %arrayidx34.i.3, align 4
  %0 = bitcast [5 x i32]* %a to i64*
  %tmp4.pre.i = load i64* %0, align 16
  %1 = trunc i64 %tmp4.pre.i to i32
  %tmp18 = lshr i64 %tmp4.pre.i, 32
  %tmp19 = trunc i64 %tmp18 to i32
  %not.cmp10.i = icmp sle i32 %1, %tmp19
  %inc.i = zext i1 %not.cmp10.i to i32
  %tmp9.i.1 = load i32* %arrayidx.i.1, align 8
  %not.cmp10.i.1 = icmp sle i32 %tmp19, %tmp9.i.1
  %inc.i.1 = zext i1 %not.cmp10.i.1 to i32
  %tmp132.inc.i.1 = add nsw i32 %inc.i.1, %inc.i
  %tmp9.i.2 = load i32* %arrayidx.i.2, align 4
  %not.cmp10.i.2 = icmp sle i32 %tmp9.i.1, %tmp9.i.2
  %inc.i.2 = zext i1 %not.cmp10.i.2 to i32
  %tmp132.inc.i.2 = add nsw i32 %inc.i.2, %tmp132.inc.i.1
  %tmp9.i.3 = load i32* %arrayidx.i.3, align 16
  %not.cmp10.i.3 = icmp sle i32 %tmp9.i.2, %tmp9.i.3
  %inc.i.3 = zext i1 %not.cmp10.i.3 to i32
  %tmp132.inc.i.3 = add nsw i32 %inc.i.3, %tmp132.inc.i.2
  ret i32 %tmp132.inc.i.3

for.cond8.i.3:                                    ; preds = %if.end.i.3, %for.end.i.2
  %indvar.i.3 = phi i64 [ %indvar.next.i.3, %if.end.i.3 ], [ 0, %for.end.i.2 ]
  %tmp14.3 = sub i64 3, %indvar.i.3
  %storemerge1.i.3 = trunc i64 %tmp14.3 to i32
  %tmp20.i.3 = sub i64 4, %indvar.i.3
  %arrayidx27.i.3 = getelementptr [5 x i32]* %a, i64 0, i64 %tmp20.i.3
  %cmp10.i.3 = icmp sgt i32 %storemerge1.i.3, 0
  br i1 %cmp10.i.3, label %for.body11.i.3, label %for.end.i.3

if.end.i.3:                                       ; preds = %for.body11.i.3
  store i32 %tmp16.i.3, i32* %arrayidx27.i.3, align 4
  %indvar.next.i.3 = add i64 %indvar.i.3, 1
  br label %for.cond8.i.3

for.body11.i.3:                                   ; preds = %for.cond8.i.3
  %arrayidx15.i.3 = getelementptr [5 x i32]* %a, i64 0, i64 %tmp14.3
  %tmp16.i.3 = load i32* %arrayidx15.i.3, align 4
  %cmp18.i.3 = icmp sgt i32 %tmp16.i.3, %tmp6.i.3
  br i1 %cmp18.i.3, label %if.end.i.3, label %for.end.i.3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
