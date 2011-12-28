; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/sierpinski.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i8* @apply_rules(i8* %new_sl, i8* %sl, i64 %width) nounwind uwtable {
entry:
  %new_sl.addr = alloca i8*, align 8
  %sl.addr = alloca i8*, align 8
  %width.addr = alloca i64, align 8
  %i = alloca i32, align 4
  %t1 = alloca i8, align 1
  %t2 = alloca i8, align 1
  store i8* %new_sl, i8** %new_sl.addr, align 8
  store i8* %sl, i8** %sl.addr, align 8
  store i64 %width, i64* %width.addr, align 8
  %tmp = load i8** %sl.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp, i64 0
  %tmp1 = load i8* %arrayidx
  %conv = sext i8 %tmp1 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp2 = load i8** %sl.addr, align 8
  %arrayidx3 = getelementptr inbounds i8* %tmp2, i64 1
  %tmp4 = load i8* %arrayidx3
  %conv5 = sext i8 %tmp4 to i32
  %tobool6 = icmp ne i32 %conv5, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool6, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv7 = trunc i32 %lor.ext to i8
  %tmp8 = load i8** %new_sl.addr, align 8
  %arrayidx9 = getelementptr inbounds i8* %tmp8, i64 0
  store i8 %conv7, i8* %arrayidx9
  %tmp10 = load i64* %width.addr, align 8
  %sub = sub i64 %tmp10, 2
  %tmp11 = load i8** %sl.addr, align 8
  %arrayidx12 = getelementptr inbounds i8* %tmp11, i64 %sub
  %tmp13 = load i8* %arrayidx12
  %conv14 = sext i8 %tmp13 to i32
  %tobool15 = icmp ne i32 %conv14, 0
  br i1 %tobool15, label %lor.end24, label %lor.rhs16

lor.rhs16:                                        ; preds = %lor.end
  %tmp17 = load i64* %width.addr, align 8
  %sub18 = sub i64 %tmp17, 1
  %tmp19 = load i8** %sl.addr, align 8
  %arrayidx20 = getelementptr inbounds i8* %tmp19, i64 %sub18
  %tmp21 = load i8* %arrayidx20
  %conv22 = sext i8 %tmp21 to i32
  %tobool23 = icmp ne i32 %conv22, 0
  br label %lor.end24

lor.end24:                                        ; preds = %lor.rhs16, %lor.end
  %1 = phi i1 [ true, %lor.end ], [ %tobool23, %lor.rhs16 ]
  %lor.ext25 = zext i1 %1 to i32
  %conv26 = trunc i32 %lor.ext25 to i8
  %tmp27 = load i64* %width.addr, align 8
  %sub28 = sub i64 %tmp27, 1
  %tmp29 = load i8** %new_sl.addr, align 8
  %arrayidx30 = getelementptr inbounds i8* %tmp29, i64 %sub28
  store i8 %conv26, i8* %arrayidx30
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lor.end24
  %tmp31 = load i32* %i, align 4
  %conv32 = sext i32 %tmp31 to i64
  %tmp33 = load i64* %width.addr, align 8
  %sub34 = sub i64 %tmp33, 1
  %cmp = icmp ult i64 %conv32, %sub34
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp37 = load i32* %i, align 4
  %sub38 = sub nsw i32 %tmp37, 1
  %idxprom = sext i32 %sub38 to i64
  %tmp39 = load i8** %sl.addr, align 8
  %arrayidx40 = getelementptr inbounds i8* %tmp39, i64 %idxprom
  %tmp41 = load i8* %arrayidx40
  %conv42 = sext i8 %tmp41 to i32
  %tobool43 = icmp ne i32 %conv42, 0
  br i1 %tobool43, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.body
  %tmp44 = load i32* %i, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %tmp46 = load i8** %sl.addr, align 8
  %arrayidx47 = getelementptr inbounds i8* %tmp46, i64 %idxprom45
  %tmp48 = load i8* %arrayidx47
  %conv49 = sext i8 %tmp48 to i32
  %tobool50 = icmp ne i32 %conv49, 0
  br i1 %tobool50, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %tmp51 = load i32* %i, align 4
  %add = add nsw i32 %tmp51, 1
  %idxprom52 = sext i32 %add to i64
  %tmp53 = load i8** %sl.addr, align 8
  %arrayidx54 = getelementptr inbounds i8* %tmp53, i64 %idxprom52
  %tmp55 = load i8* %arrayidx54
  %conv56 = sext i8 %tmp55 to i32
  %tobool57 = icmp ne i32 %conv56, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.body
  %2 = phi i1 [ false, %land.lhs.true ], [ false, %for.body ], [ %tobool57, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  %conv58 = trunc i32 %land.ext to i8
  store i8 %conv58, i8* %t1, align 1
  %tmp60 = load i32* %i, align 4
  %sub61 = sub nsw i32 %tmp60, 1
  %idxprom62 = sext i32 %sub61 to i64
  %tmp63 = load i8** %sl.addr, align 8
  %arrayidx64 = getelementptr inbounds i8* %tmp63, i64 %idxprom62
  %tmp65 = load i8* %arrayidx64
  %tobool66 = icmp ne i8 %tmp65, 0
  br i1 %tobool66, label %land.end82, label %land.lhs.true67

land.lhs.true67:                                  ; preds = %land.end
  %tmp68 = load i32* %i, align 4
  %idxprom69 = sext i32 %tmp68 to i64
  %tmp70 = load i8** %sl.addr, align 8
  %arrayidx71 = getelementptr inbounds i8* %tmp70, i64 %idxprom69
  %tmp72 = load i8* %arrayidx71
  %tobool73 = icmp ne i8 %tmp72, 0
  br i1 %tobool73, label %land.end82, label %land.rhs74

land.rhs74:                                       ; preds = %land.lhs.true67
  %tmp75 = load i32* %i, align 4
  %add76 = add nsw i32 %tmp75, 1
  %idxprom77 = sext i32 %add76 to i64
  %tmp78 = load i8** %sl.addr, align 8
  %arrayidx79 = getelementptr inbounds i8* %tmp78, i64 %idxprom77
  %tmp80 = load i8* %arrayidx79
  %tobool81 = icmp ne i8 %tmp80, 0
  %lnot = xor i1 %tobool81, true
  br label %land.end82

land.end82:                                       ; preds = %land.rhs74, %land.lhs.true67, %land.end
  %3 = phi i1 [ false, %land.lhs.true67 ], [ false, %land.end ], [ %lnot, %land.rhs74 ]
  %land.ext83 = zext i1 %3 to i32
  %conv84 = trunc i32 %land.ext83 to i8
  store i8 %conv84, i8* %t2, align 1
  %tmp85 = load i8* %t1, align 1
  %conv86 = sext i8 %tmp85 to i32
  %tobool87 = icmp ne i32 %conv86, 0
  br i1 %tobool87, label %lor.end92, label %lor.rhs88

lor.rhs88:                                        ; preds = %land.end82
  %tmp89 = load i8* %t2, align 1
  %conv90 = sext i8 %tmp89 to i32
  %tobool91 = icmp ne i32 %conv90, 0
  br label %lor.end92

lor.end92:                                        ; preds = %lor.rhs88, %land.end82
  %4 = phi i1 [ true, %land.end82 ], [ %tobool91, %lor.rhs88 ]
  %lnot94 = xor i1 %4, true
  %lnot.ext = zext i1 %lnot94 to i32
  %conv95 = trunc i32 %lnot.ext to i8
  %tmp96 = load i32* %i, align 4
  %idxprom97 = sext i32 %tmp96 to i64
  %tmp98 = load i8** %new_sl.addr, align 8
  %arrayidx99 = getelementptr inbounds i8* %tmp98, i64 %idxprom97
  store i8 %conv95, i8* %arrayidx99
  br label %for.inc

for.inc:                                          ; preds = %lor.end92
  %tmp100 = load i32* %i, align 4
  %inc = add nsw i32 %tmp100, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp101 = load i8** %new_sl.addr, align 8
  ret i8* %tmp101
}

define void @print_statelist(i8* %sl, i64 %width) nounwind uwtable {
entry:
  %sl.addr = alloca i8*, align 8
  %width.addr = alloca i64, align 8
  %i = alloca i32, align 4
  store i8* %sl, i8** %sl.addr, align 8
  store i64 %width, i64* %width.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %tmp1 = load i64* %width.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %tmp4 = load i8** %sl.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp4, i64 %idxprom
  %tmp5 = load i8* %arrayidx
  %conv6 = sext i8 %tmp5 to i32
  %tobool = icmp ne i32 %conv6, 0
  %cond = select i1 %tobool, i32 64, i32 32
  %call = call i32 @putchar(i32 %cond)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call8 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @putchar(i32)

define void @run_and_display(i64 %niters) nounwind uwtable {
entry:
  %niters.addr = alloca i64, align 8
  %statelist1 = alloca [80 x i8], align 16
  %statelist2 = alloca [80 x i8], align 16
  %statelist = alloca i8*, align 8
  %new_statelist = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64 %niters, i64* %niters.addr, align 8
  %arraydecay = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 0, i64 80, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i64 40
  store i8 1, i8* %arrayidx, align 1
  %arraydecay1 = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  store i8* %arraydecay1, i8** %statelist, align 8
  %arraydecay2 = getelementptr inbounds [80 x i8]* %statelist2, i32 0, i32 0
  store i8* %arraydecay2, i8** %new_statelist, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %tmp3 = load i64* %niters.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %statelist, align 8
  call void @print_statelist(i8* %tmp5, i64 80)
  %tmp6 = load i8** %new_statelist, align 8
  %tmp7 = load i8** %statelist, align 8
  %call = call i8* @apply_rules(i8* %tmp6, i8* %tmp7, i64 80)
  store i8* %call, i8** %statelist, align 8
  %arraydecay8 = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  %cmp9 = icmp eq i8* %call, %arraydecay8
  br i1 %cmp9, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %arraydecay11 = getelementptr inbounds [80 x i8]* %statelist2, i32 0, i32 0
  store i8* %arraydecay11, i8** %new_statelist, align 8
  br label %if.end

if.else:                                          ; preds = %for.body
  %arraydecay12 = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  store i8* %arraydecay12, i8** %new_statelist, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @run_and_display(i64 2)
  ret i32 0
}
