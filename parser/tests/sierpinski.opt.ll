; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/sierpinski.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i8* @apply_rules(i8* %new_sl, i8* %sl, i64 %width) nounwind uwtable {
entry:
  %tmp1 = load i8* %sl, align 1
  %tobool = icmp eq i8 %tmp1, 0
  br i1 %tobool, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %entry
  %arrayidx3 = getelementptr inbounds i8* %sl, i64 1
  %tmp4 = load i8* %arrayidx3, align 1
  %tobool6 = icmp ne i8 %tmp4, 0
  br label %lor.end

lor.end:                                          ; preds = %entry, %lor.rhs
  %0 = phi i1 [ true, %entry ], [ %tobool6, %lor.rhs ]
  %conv7 = zext i1 %0 to i8
  store i8 %conv7, i8* %new_sl, align 1
  %sub = add i64 %width, -2
  %arrayidx12 = getelementptr inbounds i8* %sl, i64 %sub
  %tmp13 = load i8* %arrayidx12, align 1
  %tobool15 = icmp eq i8 %tmp13, 0
  %sub18 = add i64 %width, -1
  br i1 %tobool15, label %lor.rhs16, label %lor.end24

lor.rhs16:                                        ; preds = %lor.end
  %arrayidx20 = getelementptr inbounds i8* %sl, i64 %sub18
  %tmp21 = load i8* %arrayidx20, align 1
  %tobool23 = icmp ne i8 %tmp21, 0
  br label %lor.end24

lor.end24:                                        ; preds = %lor.end, %lor.rhs16
  %1 = phi i1 [ %tobool23, %lor.rhs16 ], [ true, %lor.end ]
  %conv26 = zext i1 %1 to i8
  %arrayidx30 = getelementptr inbounds i8* %new_sl, i64 %sub18
  store i8 %conv26, i8* %arrayidx30, align 1
  %cmp6 = icmp ugt i64 %sub18, 1
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %lor.end24, %land.end82
  %indvar = phi i64 [ %tmp9, %land.end82 ], [ 0, %lor.end24 ]
  %tmp9 = add i64 %indvar, 1
  %arrayidx47 = getelementptr i8* %sl, i64 %tmp9
  %arrayidx99 = getelementptr i8* %new_sl, i64 %tmp9
  %conv32 = add i64 %indvar, 2
  %arrayidx79 = getelementptr i8* %sl, i64 %conv32
  %sext = shl i64 %indvar, 32
  %idxprom = ashr exact i64 %sext, 32
  %arrayidx40 = getelementptr inbounds i8* %sl, i64 %idxprom
  %tmp41 = load i8* %arrayidx40, align 1
  %tobool43 = icmp eq i8 %tmp41, 0
  %tmp72.pre = load i8* %arrayidx47, align 1
  %tobool73 = icmp eq i8 %tmp72.pre, 0
  br i1 %tobool43, label %land.lhs.true67, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body
  br i1 %tobool73, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %land.lhs.true
  %tmp55 = load i8* %arrayidx79, align 1
  %phitmp13 = icmp eq i8 %tmp55, 0
  br label %land.end

land.end:                                         ; preds = %land.lhs.true, %land.rhs
  %.ph = phi i1 [ true, %land.lhs.true ], [ %phitmp13, %land.rhs ]
  br label %land.end82

land.lhs.true67:                                  ; preds = %for.body
  br i1 %tobool73, label %land.rhs74, label %land.end82

land.rhs74:                                       ; preds = %land.lhs.true67
  %tmp80 = load i8* %arrayidx79, align 1
  %phitmp5 = icmp ne i8 %tmp80, 0
  br label %land.end82

land.end82:                                       ; preds = %land.end, %land.lhs.true67, %land.rhs74
  %conv583 = phi i1 [ true, %land.lhs.true67 ], [ %.ph, %land.end ], [ true, %land.rhs74 ]
  %2 = phi i1 [ true, %land.lhs.true67 ], [ true, %land.end ], [ %phitmp5, %land.rhs74 ]
  %3 = and i1 %conv583, %2
  %conv95 = zext i1 %3 to i8
  store i8 %conv95, i8* %arrayidx99, align 1
  %exitcond = icmp eq i64 %tmp9, %sub
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %land.end82, %lor.end24
  ret i8* %new_sl
}

define void @print_statelist(i8* %sl, i64 %width) nounwind uwtable {
entry:
  %cmp1 = icmp eq i64 %width, 0
  br i1 %cmp1, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvar = phi i64 [ %indvar.next, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr i8* %sl, i64 %indvar
  %tmp5 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp5, 0
  %cond = select i1 %tobool, i32 64, i32 32
  %call = tail call i32 @putchar(i32 %cond) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %width
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %call8 = tail call i32 @putchar(i32 10) nounwind
  ret void
}

declare i32 @putchar(i32) nounwind

define void @run_and_display(i64 %niters) nounwind uwtable {
entry:
  %statelist1 = alloca [80 x i8], align 16
  %statelist2 = alloca [80 x i8], align 16
  %arraydecay = getelementptr inbounds [80 x i8]* %statelist1, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 0, i64 80, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [80 x i8]* %statelist1, i64 0, i64 40
  store i8 1, i8* %arrayidx, align 8
  %arraydecay2 = getelementptr inbounds [80 x i8]* %statelist2, i64 0, i64 0
  %cmp8 = icmp eq i64 %niters, 0
  br i1 %cmp8, label %for.end, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %entry, %apply_rules.exit
  %indvar = phi i64 [ %indvar.next, %apply_rules.exit ], [ 0, %entry ]
  %tmp6610 = phi i8* [ %storemerge179, %apply_rules.exit ], [ %arraydecay, %entry ]
  %storemerge179 = phi i8* [ %storemerge1, %apply_rules.exit ], [ %arraydecay2, %entry ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.i.preheader
  %indvar.i = phi i64 [ 0, %for.body.i.preheader ], [ %0, %for.body.i ]
  %arrayidx.i = getelementptr i8* %tmp6610, i64 %indvar.i
  %tmp5.i = load i8* %arrayidx.i, align 1
  %tobool.i = icmp ne i8 %tmp5.i, 0
  %cond.i = select i1 %tobool.i, i32 64, i32 32
  %call.i = call i32 @putchar(i32 %cond.i) nounwind
  %0 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %0, 80
  br i1 %exitcond, label %print_statelist.exit, label %for.body.i

print_statelist.exit:                             ; preds = %for.body.i
  %call8.i = call i32 @putchar(i32 10) nounwind
  %tmp1.i = load i8* %tmp6610, align 1
  %tobool.i2 = icmp eq i8 %tmp1.i, 0
  br i1 %tobool.i2, label %lor.rhs.i, label %lor.end.i

lor.rhs.i:                                        ; preds = %print_statelist.exit
  %arrayidx3.i = getelementptr inbounds i8* %tmp6610, i64 1
  %tmp4.i = load i8* %arrayidx3.i, align 1
  %tobool6.i = icmp ne i8 %tmp4.i, 0
  br label %lor.end.i

lor.end.i:                                        ; preds = %lor.rhs.i, %print_statelist.exit
  %1 = phi i1 [ true, %print_statelist.exit ], [ %tobool6.i, %lor.rhs.i ]
  %conv7.i = zext i1 %1 to i8
  store i8 %conv7.i, i8* %storemerge179, align 1
  %arrayidx12.i = getelementptr inbounds i8* %tmp6610, i64 78
  %tmp13.i = load i8* %arrayidx12.i, align 1
  %tobool15.i = icmp eq i8 %tmp13.i, 0
  br i1 %tobool15.i, label %lor.rhs16.i, label %lor.end24.i

lor.rhs16.i:                                      ; preds = %lor.end.i
  %arrayidx20.i = getelementptr inbounds i8* %tmp6610, i64 79
  %tmp21.i = load i8* %arrayidx20.i, align 1
  %tobool23.i = icmp ne i8 %tmp21.i, 0
  br label %lor.end24.i

lor.end24.i:                                      ; preds = %lor.rhs16.i, %lor.end.i
  %2 = phi i1 [ %tobool23.i, %lor.rhs16.i ], [ true, %lor.end.i ]
  %conv26.i = zext i1 %2 to i8
  %arrayidx30.i = getelementptr inbounds i8* %storemerge179, i64 79
  store i8 %conv26.i, i8* %arrayidx30.i, align 1
  br label %for.body.i4

for.body.i4:                                      ; preds = %land.end82.i, %lor.end24.i
  %indvar.i3 = phi i64 [ %tmp9.i, %land.end82.i ], [ 0, %lor.end24.i ]
  %tmp = add i64 %indvar.i3, 2
  %arrayidx79.i = getelementptr i8* %tmp6610, i64 %tmp
  %tmp9.i = add i64 %indvar.i3, 1
  %arrayidx99.i = getelementptr i8* %storemerge179, i64 %tmp9.i
  %arrayidx47.i = getelementptr i8* %tmp6610, i64 %tmp9.i
  %arrayidx40.i = getelementptr i8* %tmp6610, i64 %indvar.i3
  %tmp41.i = load i8* %arrayidx40.i, align 1
  %tobool43.i = icmp eq i8 %tmp41.i, 0
  %tmp72.pre.i = load i8* %arrayidx47.i, align 1
  %tobool73.i = icmp eq i8 %tmp72.pre.i, 0
  br i1 %tobool43.i, label %land.lhs.true67.i, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %for.body.i4
  br i1 %tobool73.i, label %land.end82.i, label %land.rhs.i

land.rhs.i:                                       ; preds = %land.lhs.true.i
  %tmp55.i = load i8* %arrayidx79.i, align 1
  %phitmp13.i = icmp eq i8 %tmp55.i, 0
  br label %land.end82.i

land.lhs.true67.i:                                ; preds = %for.body.i4
  br i1 %tobool73.i, label %land.rhs74.i, label %land.end82.i

land.rhs74.i:                                     ; preds = %land.lhs.true67.i
  %tmp80.i = load i8* %arrayidx79.i, align 1
  %phitmp5.i = icmp ne i8 %tmp80.i, 0
  br label %land.end82.i

land.end82.i:                                     ; preds = %land.lhs.true.i, %land.rhs.i, %land.rhs74.i, %land.lhs.true67.i
  %conv583.i = phi i1 [ true, %land.lhs.true67.i ], [ true, %land.rhs74.i ], [ true, %land.lhs.true.i ], [ %phitmp13.i, %land.rhs.i ]
  %3 = phi i1 [ true, %land.lhs.true67.i ], [ %phitmp5.i, %land.rhs74.i ], [ true, %land.lhs.true.i ], [ true, %land.rhs.i ]
  %4 = and i1 %conv583.i, %3
  %conv95.i = zext i1 %4 to i8
  store i8 %conv95.i, i8* %arrayidx99.i, align 1
  %exitcond12 = icmp eq i64 %tmp9.i, 78
  br i1 %exitcond12, label %apply_rules.exit, label %for.body.i4

apply_rules.exit:                                 ; preds = %land.end82.i
  %cmp9 = icmp eq i8* %storemerge179, %arraydecay
  %storemerge1 = select i1 %cmp9, i8* %arraydecay2, i8* %arraydecay
  %indvar.next = add i64 %indvar, 1
  %exitcond14 = icmp eq i64 %indvar.next, %niters
  br i1 %exitcond14, label %for.end, label %for.body.i.preheader

for.end:                                          ; preds = %apply_rules.exit, %entry
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void @run_and_display(i64 2)
  ret i32 0
}
