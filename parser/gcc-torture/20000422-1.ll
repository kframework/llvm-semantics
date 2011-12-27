; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000422-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@ops = global [13 x i32] [i32 11, i32 12, i32 46, i32 3, i32 2, i32 2, i32 3, i32 2, i32 1, i32 3, i32 2, i32 1, i32 2], align 16
@correct = global [13 x i32] [i32 46, i32 12, i32 11, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1], align 16
@num = global i32 13, align 4

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
  %op = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc36, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* @num, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end38

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* @num, align 4
  %sub = sub nsw i32 %tmp3, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %tmp5 = load i32* %j, align 4
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp sgt i32 %tmp5, %tmp6
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond4
  %tmp9 = load i32* %j, align 4
  %sub10 = sub nsw i32 %tmp9, 1
  %idxprom = sext i32 %sub10 to i64
  %arrayidx = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom
  %tmp11 = load i32* %arrayidx, align 4
  %tmp12 = load i32* %j, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom13
  %tmp15 = load i32* %arrayidx14, align 4
  %cmp16 = icmp slt i32 %tmp11, %tmp15
  br i1 %cmp16, label %if.then, label %if.end

if.then:                                          ; preds = %for.body8
  %tmp18 = load i32* %j, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom19
  %tmp21 = load i32* %arrayidx20, align 4
  store i32 %tmp21, i32* %op, align 4
  %tmp22 = load i32* %j, align 4
  %sub23 = sub nsw i32 %tmp22, 1
  %idxprom24 = sext i32 %sub23 to i64
  %arrayidx25 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom24
  %tmp26 = load i32* %arrayidx25, align 4
  %tmp27 = load i32* %j, align 4
  %idxprom28 = sext i32 %tmp27 to i64
  %arrayidx29 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom28
  store i32 %tmp26, i32* %arrayidx29, align 4
  %tmp30 = load i32* %op, align 4
  %tmp31 = load i32* %j, align 4
  %sub32 = sub nsw i32 %tmp31, 1
  %idxprom33 = sext i32 %sub32 to i64
  %arrayidx34 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom33
  store i32 %tmp30, i32* %arrayidx34, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp35 = load i32* %j, align 4
  %dec = add nsw i32 %tmp35, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc36

for.inc36:                                        ; preds = %for.end
  %tmp37 = load i32* %i, align 4
  %inc = add nsw i32 %tmp37, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end38:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc55, %for.end38
  %tmp40 = load i32* %i, align 4
  %tmp41 = load i32* @num, align 4
  %cmp42 = icmp slt i32 %tmp40, %tmp41
  br i1 %cmp42, label %for.body43, label %for.end58

for.body43:                                       ; preds = %for.cond39
  %tmp44 = load i32* %i, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %arrayidx46 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom45
  %tmp47 = load i32* %arrayidx46, align 4
  %tmp48 = load i32* %i, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %arrayidx50 = getelementptr inbounds [13 x i32]* @correct, i32 0, i64 %idxprom49
  %tmp51 = load i32* %arrayidx50, align 4
  %cmp52 = icmp ne i32 %tmp47, %tmp51
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %for.body43
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %for.body43
  br label %for.inc55

for.inc55:                                        ; preds = %if.end54
  %tmp56 = load i32* %i, align 4
  %inc57 = add nsw i32 %tmp56, 1
  store i32 %inc57, i32* %i, align 4
  br label %for.cond39

for.end58:                                        ; preds = %for.cond39
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
