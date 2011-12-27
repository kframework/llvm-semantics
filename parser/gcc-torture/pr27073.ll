; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr27073.c'
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

define void @foo(i32* %p, i32 %d1, i32 %d2, i32 %d3, i16 signext %count, i32 %s1, i32 %s2, i32 %s3, i32 %s4, i32 %s5) nounwind uwtable noinline {
entry:
  %p.addr = alloca i32*, align 8
  %d1.addr = alloca i32, align 4
  %d2.addr = alloca i32, align 4
  %d3.addr = alloca i32, align 4
  %count.addr = alloca i16, align 2
  %s1.addr = alloca i32, align 4
  %s2.addr = alloca i32, align 4
  %s3.addr = alloca i32, align 4
  %s4.addr = alloca i32, align 4
  %s5.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %d1, i32* %d1.addr, align 4
  store i32 %d2, i32* %d2.addr, align 4
  store i32 %d3, i32* %d3.addr, align 4
  store i16 %count, i16* %count.addr, align 2
  store i32 %s1, i32* %s1.addr, align 4
  store i32 %s2, i32* %s2.addr, align 4
  store i32 %s3, i32* %s3.addr, align 4
  store i32 %s4, i32* %s4.addr, align 4
  store i32 %s5, i32* %s5.addr, align 4
  %tmp = load i16* %count.addr, align 2
  %conv = sext i16 %tmp to i32
  store i32 %conv, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp1 = load i32* %n, align 4
  %dec = add nsw i32 %tmp1, -1
  store i32 %dec, i32* %n, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp2 = load i32* %s1.addr, align 4
  %tmp3 = load i32** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp3, i32 1
  store i32* %incdec.ptr, i32** %p.addr, align 8
  store i32 %tmp2, i32* %tmp3
  %tmp4 = load i32* %s2.addr, align 4
  %tmp5 = load i32** %p.addr, align 8
  %incdec.ptr6 = getelementptr inbounds i32* %tmp5, i32 1
  store i32* %incdec.ptr6, i32** %p.addr, align 8
  store i32 %tmp4, i32* %tmp5
  %tmp7 = load i32* %s3.addr, align 4
  %tmp8 = load i32** %p.addr, align 8
  %incdec.ptr9 = getelementptr inbounds i32* %tmp8, i32 1
  store i32* %incdec.ptr9, i32** %p.addr, align 8
  store i32 %tmp7, i32* %tmp8
  %tmp10 = load i32* %s4.addr, align 4
  %tmp11 = load i32** %p.addr, align 8
  %incdec.ptr12 = getelementptr inbounds i32* %tmp11, i32 1
  store i32* %incdec.ptr12, i32** %p.addr, align 8
  store i32 %tmp10, i32* %tmp11
  %tmp13 = load i32* %s5.addr, align 4
  %tmp14 = load i32** %p.addr, align 8
  %incdec.ptr15 = getelementptr inbounds i32* %tmp14, i32 1
  store i32* %incdec.ptr15, i32** %p.addr, align 8
  store i32 %tmp13, i32* %tmp14
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [10 x i32]* %x, i32 0, i32 0
  call void @foo(i32* %arraydecay, i32 0, i32 0, i32 0, i16 signext 2, i32 100, i32 200, i32 300, i32 400, i32 500)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i32 0, i64 %idxprom
  %tmp2 = load i32* %arrayidx, align 4
  %tmp3 = load i32* %i, align 4
  %rem = srem i32 %tmp3, 5
  %add = add nsw i32 %rem, 1
  %mul = mul nsw i32 %add, 100
  %cmp4 = icmp ne i32 %tmp2, %mul
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp5 = load i32* %i, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
