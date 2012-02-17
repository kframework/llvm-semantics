; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010910-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.epic_private = type { %struct.epic_rx_desc*, [5 x i32] }
%struct.epic_rx_desc = type { i32 }

@check_rx_ring = internal global [5 x i32] [i32 12, i32 14, i32 16, i32 18, i32 10], align 16

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ep = alloca %struct.epic_private, align 8
  %rx_ring = alloca [5 x %struct.epic_rx_desc], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i64 %idxprom
  %next = getelementptr inbounds %struct.epic_rx_desc* %arrayidx, i32 0, i32 0
  store i32 0, i32* %next, align 4
  %tmp2 = load i32* %i, align 4
  %idxprom3 = sext i32 %tmp2 to i64
  %rx_skbuff = getelementptr inbounds %struct.epic_private* %ep, i32 0, i32 1
  %arrayidx4 = getelementptr inbounds [5 x i32]* %rx_skbuff, i32 0, i64 %idxprom3
  store i32 5, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp5 = load i32* %i, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i32 0
  %rx_ring6 = getelementptr inbounds %struct.epic_private* %ep, i32 0, i32 0
  store %struct.epic_rx_desc* %arraydecay, %struct.epic_rx_desc** %rx_ring6, align 8
  call void @epic_init_ring(%struct.epic_private* %ep)
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc29, %for.end
  %tmp8 = load i32* %i, align 4
  %cmp9 = icmp slt i32 %tmp8, 5
  br i1 %cmp9, label %for.body10, label %for.end32

for.body10:                                       ; preds = %for.cond7
  %tmp11 = load i32* %i, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %arrayidx13 = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i64 %idxprom12
  %next14 = getelementptr inbounds %struct.epic_rx_desc* %arrayidx13, i32 0, i32 0
  %tmp15 = load i32* %next14, align 4
  %tmp16 = load i32* %i, align 4
  %idxprom17 = sext i32 %tmp16 to i64
  %arrayidx18 = getelementptr inbounds [5 x i32]* @check_rx_ring, i32 0, i64 %idxprom17
  %tmp19 = load i32* %arrayidx18, align 4
  %cmp20 = icmp ne i32 %tmp15, %tmp19
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %for.body10
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body10
  %tmp21 = load i32* %i, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %rx_skbuff23 = getelementptr inbounds %struct.epic_private* %ep, i32 0, i32 1
  %arrayidx24 = getelementptr inbounds [5 x i32]* %rx_skbuff23, i32 0, i64 %idxprom22
  %tmp25 = load i32* %arrayidx24, align 4
  %cmp26 = icmp ne i32 %tmp25, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end
  br label %for.inc29

for.inc29:                                        ; preds = %if.end28
  %tmp30 = load i32* %i, align 4
  %inc31 = add nsw i32 %tmp30, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond7

for.end32:                                        ; preds = %for.cond7
  ret i32 0
}

define internal void @epic_init_ring(%struct.epic_private* %ep) nounwind uwtable {
entry:
  %ep.addr = alloca %struct.epic_private*, align 8
  %i = alloca i32, align 4
  store %struct.epic_private* %ep, %struct.epic_private** %ep.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %add = add nsw i32 %tmp1, 1
  %mul = mul nsw i32 %add, 2
  %add2 = add nsw i32 10, %mul
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %tmp4 = load %struct.epic_private** %ep.addr, align 8
  %rx_ring = getelementptr inbounds %struct.epic_private* %tmp4, i32 0, i32 0
  %tmp5 = load %struct.epic_rx_desc** %rx_ring, align 8
  %arrayidx = getelementptr inbounds %struct.epic_rx_desc* %tmp5, i64 %idxprom
  %next = getelementptr inbounds %struct.epic_rx_desc* %arrayidx, i32 0, i32 0
  store i32 %add2, i32* %next, align 4
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %tmp8 = load %struct.epic_private** %ep.addr, align 8
  %rx_skbuff = getelementptr inbounds %struct.epic_private* %tmp8, i32 0, i32 1
  %arrayidx9 = getelementptr inbounds [5 x i32]* %rx_skbuff, i32 0, i64 %idxprom7
  store i32 0, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp10 = load i32* %i, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp11 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp11, 1
  %idxprom12 = sext i32 %sub to i64
  %tmp13 = load %struct.epic_private** %ep.addr, align 8
  %rx_ring14 = getelementptr inbounds %struct.epic_private* %tmp13, i32 0, i32 0
  %tmp15 = load %struct.epic_rx_desc** %rx_ring14, align 8
  %arrayidx16 = getelementptr inbounds %struct.epic_rx_desc* %tmp15, i64 %idxprom12
  %next17 = getelementptr inbounds %struct.epic_rx_desc* %arrayidx16, i32 0, i32 0
  store i32 10, i32* %next17, align 4
  ret void
}

declare void @abort() noreturn nounwind
