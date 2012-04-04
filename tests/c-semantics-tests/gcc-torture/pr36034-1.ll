; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36034-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [5 x [10 x double]] [[10 x double] [double 1.000000e+01, double 1.100000e+01, double 1.200000e+01, double 1.300000e+01, double 1.400000e+01, double 1.500000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 2.100000e+01, double 2.200000e+01, double 2.300000e+01, double 2.400000e+01, double 2.500000e+01, double 2.600000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 3.200000e+01, double 3.300000e+01, double 3.400000e+01, double 3.500000e+01, double 3.600000e+01, double 3.700000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 4.300000e+01, double 4.400000e+01, double 4.500000e+01, double 4.600000e+01, double 4.700000e+01, double 4.800000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], [10 x double] [double 5.400000e+01, double 5.500000e+01, double 5.600000e+01, double 5.700000e+01, double 5.800000e+01, double 5.900000e+01, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00]], align 16
@tmp = common global [5 x [6 x double]] zeroinitializer, align 16

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
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [10 x double]* %arrayidx, i32 0, i64 0
  %2 = load double* %arrayidx1, align 8
  %3 = load i32* %i, align 4
  %idxprom2 = sext i32 %3 to i64
  %arrayidx3 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [6 x double]* %arrayidx3, i32 0, i64 0
  store double %2, double* %arrayidx4, align 8
  %4 = load i32* %i, align 4
  %idxprom5 = sext i32 %4 to i64
  %arrayidx6 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom5
  %arrayidx7 = getelementptr inbounds [10 x double]* %arrayidx6, i32 0, i64 1
  %5 = load double* %arrayidx7, align 8
  %6 = load i32* %i, align 4
  %idxprom8 = sext i32 %6 to i64
  %arrayidx9 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [6 x double]* %arrayidx9, i32 0, i64 1
  store double %5, double* %arrayidx10, align 8
  %7 = load i32* %i, align 4
  %idxprom11 = sext i32 %7 to i64
  %arrayidx12 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [10 x double]* %arrayidx12, i32 0, i64 2
  %8 = load double* %arrayidx13, align 8
  %9 = load i32* %i, align 4
  %idxprom14 = sext i32 %9 to i64
  %arrayidx15 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom14
  %arrayidx16 = getelementptr inbounds [6 x double]* %arrayidx15, i32 0, i64 2
  store double %8, double* %arrayidx16, align 8
  %10 = load i32* %i, align 4
  %idxprom17 = sext i32 %10 to i64
  %arrayidx18 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom17
  %arrayidx19 = getelementptr inbounds [10 x double]* %arrayidx18, i32 0, i64 3
  %11 = load double* %arrayidx19, align 8
  %12 = load i32* %i, align 4
  %idxprom20 = sext i32 %12 to i64
  %arrayidx21 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [6 x double]* %arrayidx21, i32 0, i64 3
  store double %11, double* %arrayidx22, align 8
  %13 = load i32* %i, align 4
  %idxprom23 = sext i32 %13 to i64
  %arrayidx24 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [10 x double]* %arrayidx24, i32 0, i64 4
  %14 = load double* %arrayidx25, align 8
  %15 = load i32* %i, align 4
  %idxprom26 = sext i32 %15 to i64
  %arrayidx27 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom26
  %arrayidx28 = getelementptr inbounds [6 x double]* %arrayidx27, i32 0, i64 4
  store double %14, double* %arrayidx28, align 8
  %16 = load i32* %i, align 4
  %idxprom29 = sext i32 %16 to i64
  %arrayidx30 = getelementptr inbounds [5 x [10 x double]]* @x, i32 0, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [10 x double]* %arrayidx30, i32 0, i64 5
  %17 = load double* %arrayidx31, align 8
  %18 = load i32* %i, align 4
  %idxprom32 = sext i32 %18 to i64
  %arrayidx33 = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [6 x double]* %arrayidx33, i32 0, i64 5
  store double %17, double* %arrayidx34, align 8
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

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32* %i, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [5 x [6 x double]]* @tmp, i32 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [6 x double]* %arrayidx, i32 0, i64 %idxprom
  %4 = load double* %arrayidx5, align 8
  %cmp6 = fcmp oeq double %4, -1.000000e+00
  br i1 %cmp6, label %if.then, label %if.end

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
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %6 = load i32* %i, align 4
  %inc8 = add nsw i32 %6, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
