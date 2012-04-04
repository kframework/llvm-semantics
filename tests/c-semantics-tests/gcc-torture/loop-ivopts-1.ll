; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-ivopts-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@foo.t16 = internal global [16 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00, float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01, float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01, float 1.600000e+01], align 16
@foo.tmp = internal global [4 x float] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [4 x float], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [4 x float]* %x, i32 0, i32 0
  call void @foo(float* %arraydecay)
  ret i32 0
}

define void @foo(float* %x) nounwind uwtable {
entry:
  %x.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %temp = alloca float, align 4
  store float* %x, float** %x.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc11, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %sub = sub nsw i32 3, %1
  store i32 %sub, i32* %k, align 4
  %2 = load i32* %k, align 4
  %mul = mul nsw i32 5, %2
  %idxprom = sext i32 %mul to i64
  %arrayidx = getelementptr inbounds [16 x float]* @foo.t16, i32 0, i64 %idxprom
  %3 = load float* %arrayidx, align 4
  store float %3, float* %temp, align 4
  %4 = load i32* %k, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %5, 4
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %k, align 4
  %7 = load i32* %j, align 4
  %mul4 = mul nsw i32 %7, 4
  %add5 = add nsw i32 %6, %mul4
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds [16 x float]* @foo.t16, i32 0, i64 %idxprom6
  %8 = load float* %arrayidx7, align 4
  %9 = load float* %temp, align 4
  %mul8 = fmul float %8, %9
  %10 = load i32* %k, align 4
  %idxprom9 = sext i32 %10 to i64
  %arrayidx10 = getelementptr inbounds [4 x float]* @foo.tmp, i32 0, i64 %idxprom9
  store float %mul8, float* %arrayidx10, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %11 = load i32* %j, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc11

for.inc11:                                        ; preds = %for.end
  %12 = load i32* %i, align 4
  %inc12 = add nsw i32 %12, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  %13 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 0), align 4
  %14 = load float** %x.addr, align 8
  %arrayidx14 = getelementptr inbounds float* %14, i64 0
  store float %13, float* %arrayidx14, align 4
  %15 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 1), align 4
  %16 = load float** %x.addr, align 8
  %arrayidx15 = getelementptr inbounds float* %16, i64 1
  store float %15, float* %arrayidx15, align 4
  %17 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 2), align 4
  %18 = load float** %x.addr, align 8
  %arrayidx16 = getelementptr inbounds float* %18, i64 2
  store float %17, float* %arrayidx16, align 4
  %19 = load float* getelementptr inbounds ([4 x float]* @foo.tmp, i32 0, i64 3), align 4
  %20 = load float** %x.addr, align 8
  %arrayidx17 = getelementptr inbounds float* %20, i64 3
  store float %19, float* %arrayidx17, align 4
  ret void
}
