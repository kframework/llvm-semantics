; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36034-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [50 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], align 16
@tmp = common global [30 x double] zeroinitializer, align 16

define void @test() nounwind uwtable noinline {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %mul = mul nsw i32 %1, 10
  %idxprom = sext i32 %mul to i64
  %arrayidx = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom
  %2 = load double* %arrayidx, align 8
  %3 = load i32* %i, align 4
  %mul1 = mul nsw i32 %3, 6
  %idxprom2 = sext i32 %mul1 to i64
  %arrayidx3 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom2
  store double %2, double* %arrayidx3, align 8
  %4 = load i32* %i, align 4
  %mul4 = mul nsw i32 %4, 10
  %add = add nsw i32 %mul4, 1
  %idxprom5 = sext i32 %add to i64
  %arrayidx6 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom5
  %5 = load double* %arrayidx6, align 8
  %6 = load i32* %i, align 4
  %mul7 = mul nsw i32 %6, 6
  %add8 = add nsw i32 %mul7, 1
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom9
  store double %5, double* %arrayidx10, align 8
  %7 = load i32* %i, align 4
  %mul11 = mul nsw i32 %7, 10
  %add12 = add nsw i32 %mul11, 2
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom13
  %8 = load double* %arrayidx14, align 8
  %9 = load i32* %i, align 4
  %mul15 = mul nsw i32 %9, 6
  %add16 = add nsw i32 %mul15, 2
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom17
  store double %8, double* %arrayidx18, align 8
  %10 = load i32* %i, align 4
  %mul19 = mul nsw i32 %10, 10
  %add20 = add nsw i32 %mul19, 3
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom21
  %11 = load double* %arrayidx22, align 8
  %12 = load i32* %i, align 4
  %mul23 = mul nsw i32 %12, 6
  %add24 = add nsw i32 %mul23, 3
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom25
  store double %11, double* %arrayidx26, align 8
  %13 = load i32* %i, align 4
  %mul27 = mul nsw i32 %13, 10
  %add28 = add nsw i32 %mul27, 4
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom29
  %14 = load double* %arrayidx30, align 8
  %15 = load i32* %i, align 4
  %mul31 = mul nsw i32 %15, 6
  %add32 = add nsw i32 %mul31, 4
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom33
  store double %14, double* %arrayidx34, align 8
  %16 = load i32* %i, align 4
  %mul35 = mul nsw i32 %16, 10
  %add36 = add nsw i32 %mul35, 5
  %idxprom37 = sext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %idxprom37
  %17 = load double* %arrayidx38, align 8
  %18 = load i32* %i, align 4
  %mul39 = mul nsw i32 %18, 6
  %add40 = add nsw i32 %mul39, 5
  %idxprom41 = sext i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom41
  store double %17, double* %arrayidx42, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32* %i, align 4
  %inc = add nsw i32 %19, 1
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

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end7

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32* %i, align 4
  %mul = mul nsw i32 %2, 6
  %3 = load i32* %j, align 4
  %add = add nsw i32 %mul, %3
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [30 x double]* @tmp, i32 0, i64 %idxprom
  %4 = load double* %arrayidx, align 8
  %cmp4 = fcmp oeq double %4, -1.000000e+00
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32* %j, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %6 = load i32* %i, align 4
  %inc6 = add nsw i32 %6, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
