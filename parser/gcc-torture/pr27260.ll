; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr27260.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@buf = common global [65 x i8] zeroinitializer, align 16

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

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %tmp, 2
  %cond = select i1 %cmp, i32 1, i32 0
  %0 = trunc i32 %cond to i8
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i32 0), i8 %0, i64 64, i32 1, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 2, i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i64 64), align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %idxprom
  %tmp2 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp2 to i32
  %cmp3 = icmp ne i32 %conv, 0
  br i1 %cmp3, label %if.then, label %if.end

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
  call void @foo(i32 0)
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc20, %for.end
  %tmp7 = load i32* %i, align 4
  %cmp8 = icmp slt i32 %tmp7, 64
  br i1 %cmp8, label %for.body10, label %for.end23

for.body10:                                       ; preds = %for.cond6
  %tmp11 = load i32* %i, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %arrayidx13 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %idxprom12
  %tmp14 = load i8* %arrayidx13, align 1
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp ne i32 %conv15, 1
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %for.body10
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %for.body10
  br label %for.inc20

for.inc20:                                        ; preds = %if.end19
  %tmp21 = load i32* %i, align 4
  %inc22 = add nsw i32 %tmp21, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond6

for.end23:                                        ; preds = %for.cond6
  call void @foo(i32 2)
  store i32 0, i32* %i, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc38, %for.end23
  %tmp25 = load i32* %i, align 4
  %cmp26 = icmp slt i32 %tmp25, 64
  br i1 %cmp26, label %for.body28, label %for.end41

for.body28:                                       ; preds = %for.cond24
  %tmp29 = load i32* %i, align 4
  %idxprom30 = sext i32 %tmp29 to i64
  %arrayidx31 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %idxprom30
  %tmp32 = load i8* %arrayidx31, align 1
  %conv33 = sext i8 %tmp32 to i32
  %cmp34 = icmp ne i32 %conv33, 0
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %for.body28
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %for.body28
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %tmp39 = load i32* %i, align 4
  %inc40 = add nsw i32 %tmp39, 1
  store i32 %inc40, i32* %i, align 4
  br label %for.cond24

for.end41:                                        ; preds = %for.cond24
  %tmp42 = load i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i64 64), align 1
  %conv43 = sext i8 %tmp42 to i32
  %cmp44 = icmp ne i32 %conv43, 2
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %for.end41
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %for.end41
  ret i32 0
}

declare void @abort() noreturn nounwind
