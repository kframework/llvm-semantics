; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/insertion-sort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal unnamed_addr constant [5 x i32] [i32 5, i32 1, i32 9, i32 3, i32 2], align 16

define void @insertion_sort(i32* %a, i32 %length) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc35, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %length.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %i, align 4
  %idxprom = sext i32 %tmp4 to i64
  %tmp5 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp5, i64 %idxprom
  %tmp6 = load i32* %arrayidx
  store i32 %tmp6, i32* %v, align 4
  %tmp7 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp7, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body
  %tmp9 = load i32* %j, align 4
  %cmp10 = icmp sgt i32 %tmp9, 0
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %tmp12 = load i32* %j, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %tmp14 = load i32** %a.addr, align 8
  %arrayidx15 = getelementptr inbounds i32* %tmp14, i64 %idxprom13
  %tmp16 = load i32* %arrayidx15
  %tmp17 = load i32* %v, align 4
  %cmp18 = icmp sle i32 %tmp16, %tmp17
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %for.body11
  br label %for.end

if.end:                                           ; preds = %for.body11
  %tmp19 = load i32* %j, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %tmp21 = load i32** %a.addr, align 8
  %arrayidx22 = getelementptr inbounds i32* %tmp21, i64 %idxprom20
  %tmp23 = load i32* %arrayidx22
  %tmp24 = load i32* %j, align 4
  %add = add nsw i32 %tmp24, 1
  %idxprom25 = sext i32 %add to i64
  %tmp26 = load i32** %a.addr, align 8
  %arrayidx27 = getelementptr inbounds i32* %tmp26, i64 %idxprom25
  store i32 %tmp23, i32* %arrayidx27
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp28 = load i32* %j, align 4
  %dec = add nsw i32 %tmp28, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond8

for.end:                                          ; preds = %if.then, %for.cond8
  %tmp29 = load i32* %v, align 4
  %tmp30 = load i32* %j, align 4
  %add31 = add nsw i32 %tmp30, 1
  %idxprom32 = sext i32 %add31 to i64
  %tmp33 = load i32** %a.addr, align 8
  %arrayidx34 = getelementptr inbounds i32* %tmp33, i64 %idxprom32
  store i32 %tmp29, i32* %arrayidx34
  br label %for.inc35

for.inc35:                                        ; preds = %for.end
  %tmp36 = load i32* %i, align 4
  %inc = add nsw i32 %tmp36, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end37:                                        ; preds = %for.cond
  ret void
}

define i32 @checkThatArrayIsSorted(i32* %array, i32 %length) nounwind uwtable {
entry:
  %array.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %sorted = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i32 0, i32* %sorted, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %length.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp2, 1
  %idxprom = sext i32 %sub to i64
  %tmp3 = load i32** %array.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp3, i64 %idxprom
  %tmp4 = load i32* %arrayidx
  %tmp5 = load i32* %i, align 4
  %idxprom6 = sext i32 %tmp5 to i64
  %tmp7 = load i32** %array.addr, align 8
  %arrayidx8 = getelementptr inbounds i32* %tmp7, i64 %idxprom6
  %tmp9 = load i32* %arrayidx8
  %cmp10 = icmp sle i32 %tmp4, %tmp9
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp11 = load i32* %sorted, align 4
  %inc = add nsw i32 %tmp11, 1
  store i32 %inc, i32* %sorted, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp12 = load i32* %i, align 4
  %add = add nsw i32 %tmp12, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp13 = load i32* %sorted, align 4
  ret i32 %tmp13
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %tmp = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  call void @insertion_sort(i32* %arraydecay, i32 5)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %conv = zext i32 %tmp1 to i64
  %cmp = icmp ult i64 %conv, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call = call i32 @checkThatArrayIsSorted(i32* %arraydecay4, i32 5)
  ret i32 %call
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
