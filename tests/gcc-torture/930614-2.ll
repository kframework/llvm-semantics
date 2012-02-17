; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930614-2.c'
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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %x = alloca [8 x [2 x [8 x [2 x float]]]], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc68, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end71

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  store i32 %tmp1, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc64, %for.body
  %tmp3 = load i32* %j, align 4
  %cmp4 = icmp slt i32 %tmp3, 8
  br i1 %cmp4, label %for.body5, label %for.end67

for.body5:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc60, %for.body5
  %tmp7 = load i32* %k, align 4
  %cmp8 = icmp slt i32 %tmp7, 2
  br i1 %cmp8, label %for.body9, label %for.end63

for.body9:                                        ; preds = %for.cond6
  store i32 0, i32* %l, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %for.body9
  %tmp11 = load i32* %l, align 4
  %cmp12 = icmp slt i32 %tmp11, 2
  br i1 %cmp12, label %for.body13, label %for.end

for.body13:                                       ; preds = %for.cond10
  %tmp14 = load i32* %i, align 4
  %tmp15 = load i32* %j, align 4
  %cmp16 = icmp eq i32 %tmp14, %tmp15
  br i1 %cmp16, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body13
  %tmp17 = load i32* %k, align 4
  %tmp18 = load i32* %l, align 4
  %cmp19 = icmp eq i32 %tmp17, %tmp18
  br i1 %cmp19, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp20 = load i32* %l, align 4
  %idxprom = sext i32 %tmp20 to i64
  %tmp21 = load i32* %j, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %tmp23 = load i32* %k, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %idxprom26
  %arrayidx27 = getelementptr inbounds [2 x [8 x [2 x float]]]* %arrayidx, i32 0, i64 %idxprom24
  %arrayidx28 = getelementptr inbounds [8 x [2 x float]]* %arrayidx27, i32 0, i64 %idxprom22
  %arrayidx29 = getelementptr inbounds [2 x float]* %arrayidx28, i32 0, i64 %idxprom
  store float 0x3FE99999A0000000, float* %arrayidx29, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body13
  %tmp30 = load i32* %l, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %tmp32 = load i32* %j, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load i32* %k, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %tmp36 = load i32* %i, align 4
  %idxprom37 = sext i32 %tmp36 to i64
  %arrayidx38 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %idxprom37
  %arrayidx39 = getelementptr inbounds [2 x [8 x [2 x float]]]* %arrayidx38, i32 0, i64 %idxprom35
  %arrayidx40 = getelementptr inbounds [8 x [2 x float]]* %arrayidx39, i32 0, i64 %idxprom33
  %arrayidx41 = getelementptr inbounds [2 x float]* %arrayidx40, i32 0, i64 %idxprom31
  store float 0x3FE99999A0000000, float* %arrayidx41, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp42 = load i32* %l, align 4
  %idxprom43 = sext i32 %tmp42 to i64
  %tmp44 = load i32* %j, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %tmp46 = load i32* %k, align 4
  %idxprom47 = sext i32 %tmp46 to i64
  %tmp48 = load i32* %i, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %arrayidx50 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %idxprom49
  %arrayidx51 = getelementptr inbounds [2 x [8 x [2 x float]]]* %arrayidx50, i32 0, i64 %idxprom47
  %arrayidx52 = getelementptr inbounds [8 x [2 x float]]* %arrayidx51, i32 0, i64 %idxprom45
  %arrayidx53 = getelementptr inbounds [2 x float]* %arrayidx52, i32 0, i64 %idxprom43
  %tmp54 = load float* %arrayidx53, align 4
  %conv = fpext float %tmp54 to double
  %cmp55 = fcmp olt double %conv, 0.000000e+00
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end58
  %tmp59 = load i32* %l, align 4
  %inc = add nsw i32 %tmp59, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %for.inc60

for.inc60:                                        ; preds = %for.end
  %tmp61 = load i32* %k, align 4
  %inc62 = add nsw i32 %tmp61, 1
  store i32 %inc62, i32* %k, align 4
  br label %for.cond6

for.end63:                                        ; preds = %for.cond6
  br label %for.inc64

for.inc64:                                        ; preds = %for.end63
  %tmp65 = load i32* %j, align 4
  %inc66 = add nsw i32 %tmp65, 1
  store i32 %inc66, i32* %j, align 4
  br label %for.cond2

for.end67:                                        ; preds = %for.cond2
  br label %for.inc68

for.inc68:                                        ; preds = %for.end67
  %tmp69 = load i32* %i, align 4
  %inc70 = add nsw i32 %tmp69, 1
  store i32 %inc70, i32* %i, align 4
  br label %for.cond

for.end71:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
