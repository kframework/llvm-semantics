; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i32], [1 x [2 x double]] }

define void @f(double* %x, double* %y) nounwind uwtable {
entry:
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  store double* %x, double** %x.addr, align 8
  store double* %y, double** %y.addr, align 8
  %0 = load double** %x.addr, align 8
  %1 = load double** %y.addr, align 8
  %cmp = icmp eq double* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tp = alloca [4 x [2 x %struct.anon]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ki = alloca i32, align 4
  %kj = alloca i32, align 4
  %mi = alloca i32, align 4
  %mj = alloca i32, align 4
  %bdm = alloca [4 x [2 x [4 x [2 x float]]]], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc58, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end60

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  store i32 %1, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc55, %for.body
  %2 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %2, 4
  br i1 %cmp2, label %for.body3, label %for.end57

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %ki, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc52, %for.body3
  %3 = load i32* %ki, align 4
  %cmp5 = icmp slt i32 %3, 2
  br i1 %cmp5, label %for.body6, label %for.end54

for.body6:                                        ; preds = %for.cond4
  store i32 0, i32* %kj, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc49, %for.body6
  %4 = load i32* %kj, align 4
  %cmp8 = icmp slt i32 %4, 2
  br i1 %cmp8, label %for.body9, label %for.end51

for.body9:                                        ; preds = %for.cond7
  %5 = load i32* %j, align 4
  %6 = load i32* %i, align 4
  %cmp10 = icmp eq i32 %5, %6
  br i1 %cmp10, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body9
  %7 = load i32* %ki, align 4
  %8 = load i32* %kj, align 4
  %cmp11 = icmp eq i32 %7, %8
  br i1 %cmp11, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32* %kj, align 4
  %idxprom = sext i32 %9 to i64
  %10 = load i32* %j, align 4
  %idxprom12 = sext i32 %10 to i64
  %11 = load i32* %ki, align 4
  %idxprom13 = sext i32 %11 to i64
  %12 = load i32* %i, align 4
  %idxprom14 = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i32 0, i64 %idxprom14
  %arrayidx15 = getelementptr inbounds [2 x [4 x [2 x float]]]* %arrayidx, i32 0, i64 %idxprom13
  %arrayidx16 = getelementptr inbounds [4 x [2 x float]]* %arrayidx15, i32 0, i64 %idxprom12
  %arrayidx17 = getelementptr inbounds [2 x float]* %arrayidx16, i32 0, i64 %idxprom
  store float 1.000000e+03, float* %arrayidx17, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body9
  store i32 0, i32* %mi, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc38, %if.else
  %13 = load i32* %mi, align 4
  %cmp19 = icmp slt i32 %13, 1
  br i1 %cmp19, label %for.body20, label %for.end40

for.body20:                                       ; preds = %for.cond18
  store i32 0, i32* %mj, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc, %for.body20
  %14 = load i32* %mj, align 4
  %cmp22 = icmp slt i32 %14, 1
  br i1 %cmp22, label %for.body23, label %for.end

for.body23:                                       ; preds = %for.cond21
  %15 = load i32* %mi, align 4
  %idxprom24 = sext i32 %15 to i64
  %16 = load i32* %ki, align 4
  %idxprom25 = sext i32 %16 to i64
  %17 = load i32* %i, align 4
  %idxprom26 = sext i32 %17 to i64
  %arrayidx27 = getelementptr inbounds [4 x [2 x %struct.anon]]* %tp, i32 0, i64 %idxprom26
  %arrayidx28 = getelementptr inbounds [2 x %struct.anon]* %arrayidx27, i32 0, i64 %idxprom25
  %x = getelementptr inbounds %struct.anon* %arrayidx28, i32 0, i32 1
  %arrayidx29 = getelementptr inbounds [1 x [2 x double]]* %x, i32 0, i64 %idxprom24
  %arraydecay = getelementptr inbounds [2 x double]* %arrayidx29, i32 0, i32 0
  %18 = load i32* %mj, align 4
  %idxprom30 = sext i32 %18 to i64
  %19 = load i32* %kj, align 4
  %idxprom31 = sext i32 %19 to i64
  %20 = load i32* %j, align 4
  %idxprom32 = sext i32 %20 to i64
  %arrayidx33 = getelementptr inbounds [4 x [2 x %struct.anon]]* %tp, i32 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [2 x %struct.anon]* %arrayidx33, i32 0, i64 %idxprom31
  %x35 = getelementptr inbounds %struct.anon* %arrayidx34, i32 0, i32 1
  %arrayidx36 = getelementptr inbounds [1 x [2 x double]]* %x35, i32 0, i64 %idxprom30
  %arraydecay37 = getelementptr inbounds [2 x double]* %arrayidx36, i32 0, i32 0
  call void @f(double* %arraydecay, double* %arraydecay37)
  br label %for.inc

for.inc:                                          ; preds = %for.body23
  %21 = load i32* %mj, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %mj, align 4
  br label %for.cond21

for.end:                                          ; preds = %for.cond21
  br label %for.inc38

for.inc38:                                        ; preds = %for.end
  %22 = load i32* %mi, align 4
  %inc39 = add nsw i32 %22, 1
  store i32 %inc39, i32* %mi, align 4
  br label %for.cond18

for.end40:                                        ; preds = %for.cond18
  %23 = load i32* %kj, align 4
  %idxprom41 = sext i32 %23 to i64
  %24 = load i32* %j, align 4
  %idxprom42 = sext i32 %24 to i64
  %25 = load i32* %ki, align 4
  %idxprom43 = sext i32 %25 to i64
  %26 = load i32* %i, align 4
  %idxprom44 = sext i32 %26 to i64
  %arrayidx45 = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i32 0, i64 %idxprom44
  %arrayidx46 = getelementptr inbounds [2 x [4 x [2 x float]]]* %arrayidx45, i32 0, i64 %idxprom43
  %arrayidx47 = getelementptr inbounds [4 x [2 x float]]* %arrayidx46, i32 0, i64 %idxprom42
  %arrayidx48 = getelementptr inbounds [2 x float]* %arrayidx47, i32 0, i64 %idxprom41
  store float 1.000000e+03, float* %arrayidx48, align 4
  br label %if.end

if.end:                                           ; preds = %for.end40, %if.then
  br label %for.inc49

for.inc49:                                        ; preds = %if.end
  %27 = load i32* %kj, align 4
  %inc50 = add nsw i32 %27, 1
  store i32 %inc50, i32* %kj, align 4
  br label %for.cond7

for.end51:                                        ; preds = %for.cond7
  br label %for.inc52

for.inc52:                                        ; preds = %for.end51
  %28 = load i32* %ki, align 4
  %inc53 = add nsw i32 %28, 1
  store i32 %inc53, i32* %ki, align 4
  br label %for.cond4

for.end54:                                        ; preds = %for.cond4
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %29 = load i32* %j, align 4
  %inc56 = add nsw i32 %29, 1
  store i32 %inc56, i32* %j, align 4
  br label %for.cond1

for.end57:                                        ; preds = %for.cond1
  br label %for.inc58

for.inc58:                                        ; preds = %for.end57
  %30 = load i32* %i, align 4
  %inc59 = add nsw i32 %30, 1
  store i32 %inc59, i32* %i, align 4
  br label %for.cond

for.end60:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %31 = load i32* %retval
  ret i32 %31
}

declare void @exit(i32) noreturn nounwind
