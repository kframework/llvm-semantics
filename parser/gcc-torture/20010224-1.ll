; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010224-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@masktab = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2
@psd = global [6 x i16] [i16 50, i16 40, i16 30, i16 20, i16 10, i16 0], align 2
@bndpsd = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2

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

define void @ba_compute_psd(i16 signext %start) nounwind uwtable {
entry:
  %start.addr = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %lastbin = alloca i16, align 2
  store i16 %start, i16* %start.addr, align 2
  store i16 4, i16* %lastbin, align 2
  %tmp = load i16* %start.addr, align 2
  %conv = sext i16 %tmp to i32
  store i32 %conv, i32* %j, align 4
  %tmp1 = load i16* %start.addr, align 2
  %idxprom = sext i16 %tmp1 to i64
  %arrayidx = getelementptr inbounds [6 x i16]* @masktab, i32 0, i64 %idxprom
  %tmp2 = load i16* %arrayidx, align 2
  %conv3 = sext i16 %tmp2 to i32
  store i32 %conv3, i32* %k, align 4
  %tmp4 = load i32* %j, align 4
  %idxprom5 = sext i32 %tmp4 to i64
  %arrayidx6 = getelementptr inbounds [6 x i16]* @psd, i32 0, i64 %idxprom5
  %tmp7 = load i16* %arrayidx6, align 2
  %tmp8 = load i32* %k, align 4
  %idxprom9 = sext i32 %tmp8 to i64
  %arrayidx10 = getelementptr inbounds [6 x i16]* @bndpsd, i32 0, i64 %idxprom9
  store i16 %tmp7, i16* %arrayidx10, align 2
  %tmp11 = load i32* %j, align 4
  %inc = add nsw i32 %tmp11, 1
  store i32 %inc, i32* %j, align 4
  %tmp12 = load i32* %j, align 4
  store i32 %tmp12, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp13 = load i32* %i, align 4
  %tmp14 = load i16* %lastbin, align 2
  %conv15 = sext i16 %tmp14 to i32
  %cmp = icmp slt i32 %tmp13, %conv15
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp17 = load i32* %k, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [6 x i16]* @bndpsd, i32 0, i64 %idxprom18
  %tmp20 = load i32* %j, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %arrayidx22 = getelementptr inbounds [6 x i16]* @psd, i32 0, i64 %idxprom21
  %call = call signext i16 @logadd(i16* %arrayidx19, i16* %arrayidx22)
  %tmp23 = load i32* %k, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %arrayidx25 = getelementptr inbounds [6 x i16]* @bndpsd, i32 0, i64 %idxprom24
  store i16 %call, i16* %arrayidx25, align 2
  %tmp26 = load i32* %j, align 4
  %inc27 = add nsw i32 %tmp26, 1
  store i32 %inc27, i32* %j, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp28 = load i32* %i, align 4
  %inc29 = add nsw i32 %tmp28, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define signext i16 @logadd(i16* %a, i16* %b) nounwind uwtable {
entry:
  %a.addr = alloca i16*, align 8
  %b.addr = alloca i16*, align 8
  store i16* %a, i16** %a.addr, align 8
  store i16* %b, i16** %b.addr, align 8
  %tmp = load i16** %a.addr, align 8
  %tmp1 = load i16* %tmp
  %conv = sext i16 %tmp1 to i32
  %tmp2 = load i16** %b.addr, align 8
  %tmp3 = load i16* %tmp2
  %conv4 = sext i16 %tmp3 to i32
  %add = add nsw i32 %conv, %conv4
  %conv5 = trunc i32 %add to i16
  ret i16 %conv5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @ba_compute_psd(i16 signext 0)
  %tmp = load i16* getelementptr inbounds ([6 x i16]* @bndpsd, i32 0, i64 1), align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp ne i32 %conv, 140
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
