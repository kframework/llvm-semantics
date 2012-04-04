; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930614-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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

for.cond:                                         ; preds = %for.inc44, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end46

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  store i32 %1, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc41, %for.body
  %2 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %2, 8
  br i1 %cmp2, label %for.body3, label %for.end43

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc38, %for.body3
  %3 = load i32* %k, align 4
  %cmp5 = icmp slt i32 %3, 2
  br i1 %cmp5, label %for.body6, label %for.end40

for.body6:                                        ; preds = %for.cond4
  store i32 0, i32* %l, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body6
  %4 = load i32* %l, align 4
  %cmp8 = icmp slt i32 %4, 2
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond7
  %5 = load i32* %i, align 4
  %6 = load i32* %j, align 4
  %cmp10 = icmp eq i32 %5, %6
  br i1 %cmp10, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body9
  %7 = load i32* %k, align 4
  %8 = load i32* %l, align 4
  %cmp11 = icmp eq i32 %7, %8
  br i1 %cmp11, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32* %l, align 4
  %idxprom = sext i32 %9 to i64
  %10 = load i32* %j, align 4
  %idxprom12 = sext i32 %10 to i64
  %11 = load i32* %k, align 4
  %idxprom13 = sext i32 %11 to i64
  %12 = load i32* %i, align 4
  %idxprom14 = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %idxprom14
  %arrayidx15 = getelementptr inbounds [2 x [8 x [2 x float]]]* %arrayidx, i32 0, i64 %idxprom13
  %arrayidx16 = getelementptr inbounds [8 x [2 x float]]* %arrayidx15, i32 0, i64 %idxprom12
  %arrayidx17 = getelementptr inbounds [2 x float]* %arrayidx16, i32 0, i64 %idxprom
  store float 0x3FE99999A0000000, float* %arrayidx17, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body9
  %13 = load i32* %l, align 4
  %idxprom18 = sext i32 %13 to i64
  %14 = load i32* %j, align 4
  %idxprom19 = sext i32 %14 to i64
  %15 = load i32* %k, align 4
  %idxprom20 = sext i32 %15 to i64
  %16 = load i32* %i, align 4
  %idxprom21 = sext i32 %16 to i64
  %arrayidx22 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %idxprom21
  %arrayidx23 = getelementptr inbounds [2 x [8 x [2 x float]]]* %arrayidx22, i32 0, i64 %idxprom20
  %arrayidx24 = getelementptr inbounds [8 x [2 x float]]* %arrayidx23, i32 0, i64 %idxprom19
  %arrayidx25 = getelementptr inbounds [2 x float]* %arrayidx24, i32 0, i64 %idxprom18
  store float 0x3FE99999A0000000, float* %arrayidx25, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %17 = load i32* %l, align 4
  %idxprom26 = sext i32 %17 to i64
  %18 = load i32* %j, align 4
  %idxprom27 = sext i32 %18 to i64
  %19 = load i32* %k, align 4
  %idxprom28 = sext i32 %19 to i64
  %20 = load i32* %i, align 4
  %idxprom29 = sext i32 %20 to i64
  %arrayidx30 = getelementptr inbounds [8 x [2 x [8 x [2 x float]]]]* %x, i32 0, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [2 x [8 x [2 x float]]]* %arrayidx30, i32 0, i64 %idxprom28
  %arrayidx32 = getelementptr inbounds [8 x [2 x float]]* %arrayidx31, i32 0, i64 %idxprom27
  %arrayidx33 = getelementptr inbounds [2 x float]* %arrayidx32, i32 0, i64 %idxprom26
  %21 = load float* %arrayidx33, align 4
  %conv = fpext float %21 to double
  %cmp34 = fcmp olt double %conv, 0.000000e+00
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end37
  %22 = load i32* %l, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %l, align 4
  br label %for.cond7

for.end:                                          ; preds = %for.cond7
  br label %for.inc38

for.inc38:                                        ; preds = %for.end
  %23 = load i32* %k, align 4
  %inc39 = add nsw i32 %23, 1
  store i32 %inc39, i32* %k, align 4
  br label %for.cond4

for.end40:                                        ; preds = %for.cond4
  br label %for.inc41

for.inc41:                                        ; preds = %for.end40
  %24 = load i32* %j, align 4
  %inc42 = add nsw i32 %24, 1
  store i32 %inc42, i32* %j, align 4
  br label %for.cond1

for.end43:                                        ; preds = %for.cond1
  br label %for.inc44

for.inc44:                                        ; preds = %for.end43
  %25 = load i32* %i, align 4
  %inc45 = add nsw i32 %25, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond

for.end46:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %26 = load i32* %retval
  ret i32 %26
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
