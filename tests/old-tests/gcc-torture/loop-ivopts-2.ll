; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-ivopts-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @check(i32* %l) nounwind uwtable {
entry:
  %l.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %l, i32** %l.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 288
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load i32** %l.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp2, i64 %idxprom
  %tmp3 = load i32* %arrayidx
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 256
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp sge i32 %tmp6, 280
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %0 = phi i1 [ true, %for.body ], [ %cmp7, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %add = add nsw i32 7, %lor.ext
  %tmp8 = load i32* %i, align 4
  %cmp9 = icmp sge i32 %tmp8, 144
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %tmp10 = load i32* %i, align 4
  %cmp11 = icmp slt i32 %tmp10, 256
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %1 = phi i1 [ false, %lor.end ], [ %cmp11, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %add12 = add nsw i32 %add, %land.ext
  %cmp13 = icmp ne i32 %tmp3, %add12
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca [288 x i32], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 144
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom
  store i32 8, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc10, %for.end
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 256
  br i1 %cmp5, label %for.body6, label %for.end13

for.body6:                                        ; preds = %for.cond3
  %tmp7 = load i32* %i, align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %arrayidx9 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom8
  store i32 9, i32* %arrayidx9, align 4
  br label %for.inc10

for.inc10:                                        ; preds = %for.body6
  %tmp11 = load i32* %i, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond3

for.end13:                                        ; preds = %for.cond3
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc21, %for.end13
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %tmp15, 280
  br i1 %cmp16, label %for.body17, label %for.end24

for.body17:                                       ; preds = %for.cond14
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom19
  store i32 7, i32* %arrayidx20, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.body17
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond14

for.end24:                                        ; preds = %for.cond14
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc32, %for.end24
  %tmp26 = load i32* %i, align 4
  %cmp27 = icmp slt i32 %tmp26, 288
  br i1 %cmp27, label %for.body28, label %for.end35

for.body28:                                       ; preds = %for.cond25
  %tmp29 = load i32* %i, align 4
  %idxprom30 = sext i32 %tmp29 to i64
  %arrayidx31 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom30
  store i32 8, i32* %arrayidx31, align 4
  br label %for.inc32

for.inc32:                                        ; preds = %for.body28
  %tmp33 = load i32* %i, align 4
  %inc34 = add nsw i32 %tmp33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond25

for.end35:                                        ; preds = %for.cond25
  %arraydecay = getelementptr inbounds [288 x i32]* %l, i32 0, i32 0
  call void @check(i32* %arraydecay)
  ret i32 0
}
