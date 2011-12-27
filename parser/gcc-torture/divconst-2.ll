; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/divconst-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@nums = global [3 x i64] [i64 -1, i64 2147483647, i64 -2147483648], align 16

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

define i64 @f(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %div = sdiv i64 %tmp, -2147483648
  ret i64 %div
}

define i64 @r(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %rem = srem i64 %tmp, -2147483648
  ret i64 %rem
}

define i64 @std_eqn(i64 %num, i64 %denom, i64 %quot, i64 %rem) nounwind uwtable {
entry:
  %num.addr = alloca i64, align 8
  %denom.addr = alloca i64, align 8
  %quot.addr = alloca i64, align 8
  %rem.addr = alloca i64, align 8
  store i64 %num, i64* %num.addr, align 8
  store i64 %denom, i64* %denom.addr, align 8
  store i64 %quot, i64* %quot.addr, align 8
  store i64 %rem, i64* %rem.addr, align 8
  %tmp = load i64* %quot.addr, align 8
  %mul = mul nsw i64 %tmp, -2147483648
  %tmp1 = load i64* %rem.addr, align 8
  %add = add nsw i64 %mul, %tmp1
  %tmp2 = load i64* %num.addr, align 8
  %cmp = icmp eq i64 %add, %tmp2
  %conv = zext i1 %cmp to i32
  %conv3 = sext i32 %conv to i64
  ret i64 %conv3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %conv = sext i32 %tmp to i64
  %cmp = icmp ult i64 %conv, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %idxprom
  %tmp3 = load i64* %arrayidx, align 8
  %tmp4 = load i32* %i, align 4
  %idxprom5 = sext i32 %tmp4 to i64
  %arrayidx6 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %idxprom5
  %tmp7 = load i64* %arrayidx6, align 8
  %call = call i64 @f(i64 %tmp7)
  %tmp8 = load i32* %i, align 4
  %idxprom9 = sext i32 %tmp8 to i64
  %arrayidx10 = getelementptr inbounds [3 x i64]* @nums, i32 0, i64 %idxprom9
  %tmp11 = load i64* %arrayidx10, align 8
  %call12 = call i64 @r(i64 %tmp11)
  %call13 = call i64 @std_eqn(i64 %tmp3, i64 -2147483648, i64 %call, i64 %call12)
  %cmp14 = icmp eq i64 %call13, 0
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp16 = load i32* %i, align 4
  %inc = add nsw i32 %tmp16, 1
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
