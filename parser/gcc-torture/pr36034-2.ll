; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr36034-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [50 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], align 16
@tmp = common global [30 x double] zeroinitializer, align 16

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

define void @test() nounwind uwtable noinline {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp1, 10
  %idxprom = sext i32 %mul to i64
  %arrayidx = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom
  %tmp2 = load double* %arrayidx, align 8
  %tmp3 = load i32* %i, align 4
  %mul4 = mul nsw i32 %tmp3, 6
  %idxprom5 = sext i32 %mul4 to i64
  %arrayidx6 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom5
  store double %tmp2, double* %arrayidx6, align 8
  %tmp7 = load i32* %i, align 4
  %mul8 = mul nsw i32 %tmp7, 10
  %add = add nsw i32 %mul8, 1
  %idxprom9 = sext i32 %add to i64
  %arrayidx10 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom9
  %tmp11 = load double* %arrayidx10, align 8
  %tmp12 = load i32* %i, align 4
  %mul13 = mul nsw i32 %tmp12, 6
  %add14 = add nsw i32 %mul13, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom15
  store double %tmp11, double* %arrayidx16, align 8
  %tmp17 = load i32* %i, align 4
  %mul18 = mul nsw i32 %tmp17, 10
  %add19 = add nsw i32 %mul18, 2
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom20
  %tmp22 = load double* %arrayidx21, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 %tmp23, 6
  %add25 = add nsw i32 %mul24, 2
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom26
  store double %tmp22, double* %arrayidx27, align 8
  %tmp28 = load i32* %i, align 4
  %mul29 = mul nsw i32 %tmp28, 10
  %add30 = add nsw i32 %mul29, 3
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom31
  %tmp33 = load double* %arrayidx32, align 8
  %tmp34 = load i32* %i, align 4
  %mul35 = mul nsw i32 %tmp34, 6
  %add36 = add nsw i32 %mul35, 3
  %idxprom37 = sext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom37
  store double %tmp33, double* %arrayidx38, align 8
  %tmp39 = load i32* %i, align 4
  %mul40 = mul nsw i32 %tmp39, 10
  %add41 = add nsw i32 %mul40, 4
  %idxprom42 = sext i32 %add41 to i64
  %arrayidx43 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom42
  %tmp44 = load double* %arrayidx43, align 8
  %tmp45 = load i32* %i, align 4
  %mul46 = mul nsw i32 %tmp45, 6
  %add47 = add nsw i32 %mul46, 4
  %idxprom48 = sext i32 %add47 to i64
  %arrayidx49 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom48
  store double %tmp44, double* %arrayidx49, align 8
  %tmp50 = load i32* %i, align 4
  %mul51 = mul nsw i32 %tmp50, 10
  %add52 = add nsw i32 %mul51, 5
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom53
  %tmp55 = load double* %arrayidx54, align 8
  %tmp56 = load i32* %i, align 4
  %mul57 = mul nsw i32 %tmp56, 6
  %add58 = add nsw i32 %mul57, 5
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom59
  store double %tmp55, double* %arrayidx60, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp61 = load i32* %i, align 4
  %inc = add nsw i32 %tmp61, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test()
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp5, 6
  %tmp6 = load i32* %j, align 4
  %add = add nsw i32 %mul, %tmp6
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom
  %tmp7 = load double* %arrayidx, align 8
  %cmp8 = fcmp oeq double %tmp7, -1.000000e+00
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp9 = load i32* %j, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %tmp11 = load i32* %i, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
