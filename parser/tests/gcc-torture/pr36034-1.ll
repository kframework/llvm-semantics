; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr36034-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [5 x [10 x double]] [[10 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00]], align 16
@tmp = common global [5 x [6 x double]] zeroinitializer, align 16

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
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom
  %arrayidx2 = getelementptr inbounds [10 x double]* %arrayidx, i32 0, i64 0
  %tmp3 = load double* %arrayidx2, align 8
  %tmp4 = load i32* %i, align 4
  %idxprom5 = sext i32 %tmp4 to i64
  %arrayidx6 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom5
  %arrayidx7 = getelementptr inbounds [6 x double]* %arrayidx6, i32 0, i64 0
  store double %tmp3, double* %arrayidx7, align 8
  %tmp8 = load i32* %i, align 4
  %idxprom9 = sext i32 %tmp8 to i64
  %arrayidx10 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom9
  %arrayidx11 = getelementptr inbounds [10 x double]* %arrayidx10, i32 0, i64 1
  %tmp12 = load double* %arrayidx11, align 8
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx15 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom14
  %arrayidx16 = getelementptr inbounds [6 x double]* %arrayidx15, i32 0, i64 1
  store double %tmp12, double* %arrayidx16, align 8
  %tmp17 = load i32* %i, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom18
  %arrayidx20 = getelementptr inbounds [10 x double]* %arrayidx19, i32 0, i64 2
  %tmp21 = load double* %arrayidx20, align 8
  %tmp22 = load i32* %i, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %arrayidx24 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [6 x double]* %arrayidx24, i32 0, i64 2
  store double %tmp21, double* %arrayidx25, align 8
  %tmp26 = load i32* %i, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [10 x double]* %arrayidx28, i32 0, i64 3
  %tmp30 = load double* %arrayidx29, align 8
  %tmp31 = load i32* %i, align 4
  %idxprom32 = sext i32 %tmp31 to i64
  %arrayidx33 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [6 x double]* %arrayidx33, i32 0, i64 3
  store double %tmp30, double* %arrayidx34, align 8
  %tmp35 = load i32* %i, align 4
  %idxprom36 = sext i32 %tmp35 to i64
  %arrayidx37 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom36
  %arrayidx38 = getelementptr inbounds [10 x double]* %arrayidx37, i32 0, i64 4
  %tmp39 = load double* %arrayidx38, align 8
  %tmp40 = load i32* %i, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %arrayidx42 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom41
  %arrayidx43 = getelementptr inbounds [6 x double]* %arrayidx42, i32 0, i64 4
  store double %tmp39, double* %arrayidx43, align 8
  %tmp44 = load i32* %i, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %arrayidx46 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [10 x double]* %arrayidx46, i32 0, i64 5
  %tmp48 = load double* %arrayidx47, align 8
  %tmp49 = load i32* %i, align 4
  %idxprom50 = sext i32 %tmp49 to i64
  %arrayidx51 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom50
  %arrayidx52 = getelementptr inbounds [6 x double]* %arrayidx51, i32 0, i64 5
  store double %tmp48, double* %arrayidx52, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp53 = load i32* %i, align 4
  %inc = add nsw i32 %tmp53, 1
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

for.cond:                                         ; preds = %for.inc12, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [6 x double]* %arrayidx, i32 0, i64 %idxprom
  %tmp9 = load double* %arrayidx8, align 8
  %cmp10 = fcmp oeq double %tmp9, -1.000000e+00
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp11 = load i32* %j, align 4
  %inc = add nsw i32 %tmp11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %tmp13 = load i32* %i, align 4
  %inc14 = add nsw i32 %tmp13, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
