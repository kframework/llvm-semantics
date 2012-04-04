; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990404-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16

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
  %niterations = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %mi = alloca i32, align 4
  %max = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %niterations, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end25, %entry
  store i32 0, i32* %max, align 4
  store i32 0, i32* %i1, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.cond
  %tmp = load i32* %i1, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond2
  %tmp3 = load i32* %i1, align 4
  %idxprom = sext i32 %tmp3 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %idxprom
  %tmp4 = load i32* %arrayidx, align 4
  %tmp5 = load i32* %max, align 4
  %cmp6 = icmp sgt i32 %tmp4, %tmp5
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp7 = load i32* %i1, align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %arrayidx9 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %idxprom8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %max, align 4
  %tmp11 = load i32* %i1, align 4
  store i32 %tmp11, i32* %mi, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp12 = load i32* %i1, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %i1, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %tmp13 = load i32* %max, align 4
  %cmp14 = icmp eq i32 %tmp13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %for.end
  br label %for.end26

if.end16:                                         ; preds = %for.end
  %tmp17 = load i32* %mi, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [10 x i32]* @x, i32 0, i64 %idxprom18
  store i32 0, i32* %arrayidx19, align 4
  %tmp20 = load i32* %niterations, align 4
  %inc21 = add nsw i32 %tmp20, 1
  store i32 %inc21, i32* %niterations, align 4
  %tmp22 = load i32* %niterations, align 4
  %cmp23 = icmp sgt i32 %tmp22, 10
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end16
  br label %for.cond

for.end26:                                        ; preds = %if.then15
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
