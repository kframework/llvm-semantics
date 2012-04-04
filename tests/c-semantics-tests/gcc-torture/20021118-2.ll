; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021118-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.f = private unnamed_addr constant [3 x float] [float 2.000000e+00, float 3.000000e+00, float 4.000000e+00], align 4

define i32 @t1(float* %f, i32 %i, void (double)* %f1, void (float, float)* %f2) nounwind uwtable {
entry:
  %f.addr = alloca float*, align 8
  %i.addr = alloca i32, align 4
  %f1.addr = alloca void (double)*, align 8
  %f2.addr = alloca void (float, float)*, align 8
  store float* %f, float** %f.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store void (double)* %f1, void (double)** %f1.addr, align 8
  store void (float, float)* %f2, void (float, float)** %f2.addr, align 8
  %0 = load void (double)** %f1.addr, align 8
  call void %0(double 3.000000e+00)
  %1 = load i32* %i.addr, align 4
  %add = add nsw i32 %1, 1
  %idxprom = sext i32 %add to i64
  %2 = load float** %f.addr, align 8
  %arrayidx = getelementptr inbounds float* %2, i64 %idxprom
  %3 = load float* %arrayidx, align 4
  %4 = load i32* %i.addr, align 4
  %idxprom1 = sext i32 %4 to i64
  %5 = load float** %f.addr, align 8
  %arrayidx2 = getelementptr inbounds float* %5, i64 %idxprom1
  store float %3, float* %arrayidx2, align 4
  %6 = load void (float, float)** %f2.addr, align 8
  call void %6(float 2.500000e+00, float 3.500000e+00)
  ret i32 0
}

define i32 @t2(float* %f, i32 %i, void (double)* %f1, void (float, float)* %f2, void (float)* %f3) nounwind uwtable {
entry:
  %f.addr = alloca float*, align 8
  %i.addr = alloca i32, align 4
  %f1.addr = alloca void (double)*, align 8
  %f2.addr = alloca void (float, float)*, align 8
  %f3.addr = alloca void (float)*, align 8
  store float* %f, float** %f.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store void (double)* %f1, void (double)** %f1.addr, align 8
  store void (float, float)* %f2, void (float, float)** %f2.addr, align 8
  store void (float)* %f3, void (float)** %f3.addr, align 8
  %0 = load void (float)** %f3.addr, align 8
  call void %0(float 6.000000e+00)
  %1 = load void (double)** %f1.addr, align 8
  call void %1(double 3.000000e+00)
  %2 = load i32* %i.addr, align 4
  %add = add nsw i32 %2, 1
  %idxprom = sext i32 %add to i64
  %3 = load float** %f.addr, align 8
  %arrayidx = getelementptr inbounds float* %3, i64 %idxprom
  %4 = load float* %arrayidx, align 4
  %5 = load i32* %i.addr, align 4
  %idxprom1 = sext i32 %5 to i64
  %6 = load float** %f.addr, align 8
  %arrayidx2 = getelementptr inbounds float* %6, i64 %idxprom1
  store float %4, float* %arrayidx2, align 4
  %7 = load void (float, float)** %f2.addr, align 8
  call void %7(float 2.500000e+00, float 3.500000e+00)
  ret i32 0
}

define void @f1(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %0 = load double* %d.addr, align 8
  %cmp = fcmp une double %0, 3.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f2(float %f1, float %f2) nounwind uwtable {
entry:
  %f1.addr = alloca float, align 4
  %f2.addr = alloca float, align 4
  store float %f1, float* %f1.addr, align 4
  store float %f2, float* %f2.addr, align 4
  %0 = load float* %f1.addr, align 4
  %cmp = fcmp une float %0, 2.500000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load float* %f2.addr, align 4
  %cmp1 = fcmp une float %1, 3.500000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

define void @f3(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %0 = load float* %f.addr, align 4
  %cmp = fcmp une float %0, 6.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca [3 x float], align 4
  store i32 0, i32* %retval
  %0 = bitcast [3 x float]* %f to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([3 x float]* @main.f to i8*), i64 12, i32 4, i1 false)
  %arraydecay = getelementptr inbounds [3 x float]* %f, i32 0, i32 0
  %call = call i32 @t1(float* %arraydecay, i32 0, void (double)* @f1, void (float, float)* @f2)
  %arraydecay1 = getelementptr inbounds [3 x float]* %f, i32 0, i32 0
  %call2 = call i32 @t2(float* %arraydecay1, i32 1, void (double)* @f1, void (float, float)* @f2, void (float)* @f3)
  %arrayidx = getelementptr inbounds [3 x float]* %f, i32 0, i64 0
  %1 = load float* %arrayidx, align 4
  %cmp = fcmp une float %1, 3.000000e+00
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %arrayidx3 = getelementptr inbounds [3 x float]* %f, i32 0, i64 1
  %2 = load float* %arrayidx3, align 4
  %cmp4 = fcmp une float %2, 4.000000e+00
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind
