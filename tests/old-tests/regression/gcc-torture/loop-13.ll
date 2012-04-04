; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-13.c'
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

define void @scale(i64* %alpha, i64* %x, i32 %n) nounwind uwtable {
entry:
  %alpha.addr = alloca i64*, align 8
  %x.addr = alloca i64*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ix = alloca i32, align 4
  %tmpr = alloca i64, align 8
  %tmpi = alloca i64, align 8
  store i64* %alpha, i64** %alpha.addr, align 8
  store i64* %x, i64** %x.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i64** %alpha.addr, align 8
  %tmp1 = load i64* %tmp
  %cmp = icmp ne i64 %tmp1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ix, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %tmp2 = load i32* %i, align 4
  %tmp3 = load i32* %n.addr, align 4
  %cmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp7 = load i64** %alpha.addr, align 8
  %tmp8 = load i64* %tmp7
  %tmp9 = load i32* %ix, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i64** %x.addr, align 8
  %arrayidx = getelementptr inbounds i64* %tmp10, i64 %idxprom
  %tmp11 = load i64* %arrayidx
  %mul = mul nsw i64 %tmp8, %tmp11
  store i64 %mul, i64* %tmpr, align 8
  %tmp12 = load i64** %alpha.addr, align 8
  %tmp13 = load i64* %tmp12
  %tmp14 = load i32* %ix, align 4
  %add = add nsw i32 %tmp14, 1
  %idxprom15 = sext i32 %add to i64
  %tmp16 = load i64** %x.addr, align 8
  %arrayidx17 = getelementptr inbounds i64* %tmp16, i64 %idxprom15
  %tmp18 = load i64* %arrayidx17
  %mul19 = mul nsw i64 %tmp13, %tmp18
  store i64 %mul19, i64* %tmpi, align 8
  %tmp20 = load i64* %tmpr, align 8
  %tmp21 = load i32* %ix, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %tmp23 = load i64** %x.addr, align 8
  %arrayidx24 = getelementptr inbounds i64* %tmp23, i64 %idxprom22
  store i64 %tmp20, i64* %arrayidx24
  %tmp25 = load i64* %tmpi, align 8
  %tmp26 = load i32* %ix, align 4
  %add27 = add nsw i32 %tmp26, 1
  %idxprom28 = sext i32 %add27 to i64
  %tmp29 = load i64** %x.addr, align 8
  %arrayidx30 = getelementptr inbounds i64* %tmp29, i64 %idxprom28
  store i64 %tmp25, i64* %arrayidx30
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp31 = load i32* %i, align 4
  %inc = add nsw i32 %tmp31, 1
  store i32 %inc, i32* %i, align 4
  %tmp32 = load i32* %ix, align 4
  %add33 = add nsw i32 %tmp32, 2
  store i32 %add33, i32* %ix, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca [10 x i64], align 16
  %alpha = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 2, i64* %alpha, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %conv = sext i32 %tmp1 to i64
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [10 x i64]* %x, i32 0, i64 %idxprom
  store i64 %conv, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i64]* %x, i32 0, i32 0
  call void @scale(i64* %alpha, i64* %arraydecay, i32 5)
  %arrayidx4 = getelementptr inbounds [10 x i64]* %x, i32 0, i64 9
  %tmp5 = load i64* %arrayidx4, align 8
  %cmp6 = icmp ne i64 %tmp5, 18
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  ret i32 0
}

declare void @abort() noreturn nounwind
