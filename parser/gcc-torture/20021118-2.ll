; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021118-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.f = internal unnamed_addr constant [3 x float] [float 2.000000e+00, float 3.000000e+00, float 4.000000e+00], align 4

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
  %tmp = load void (double)** %f1.addr, align 8
  call void %tmp(double 3.000000e+00)
  %tmp1 = load i32* %i.addr, align 4
  %add = add nsw i32 %tmp1, 1
  %idxprom = sext i32 %add to i64
  %tmp2 = load float** %f.addr, align 8
  %arrayidx = getelementptr inbounds float* %tmp2, i64 %idxprom
  %tmp3 = load float* %arrayidx
  %tmp4 = load i32* %i.addr, align 4
  %idxprom5 = sext i32 %tmp4 to i64
  %tmp6 = load float** %f.addr, align 8
  %arrayidx7 = getelementptr inbounds float* %tmp6, i64 %idxprom5
  store float %tmp3, float* %arrayidx7
  %tmp8 = load void (float, float)** %f2.addr, align 8
  call void %tmp8(float 2.500000e+00, float 3.500000e+00)
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
  %tmp = load void (float)** %f3.addr, align 8
  call void %tmp(float 6.000000e+00)
  %tmp1 = load void (double)** %f1.addr, align 8
  call void %tmp1(double 3.000000e+00)
  %tmp2 = load i32* %i.addr, align 4
  %add = add nsw i32 %tmp2, 1
  %idxprom = sext i32 %add to i64
  %tmp3 = load float** %f.addr, align 8
  %arrayidx = getelementptr inbounds float* %tmp3, i64 %idxprom
  %tmp4 = load float* %arrayidx
  %tmp5 = load i32* %i.addr, align 4
  %idxprom6 = sext i32 %tmp5 to i64
  %tmp7 = load float** %f.addr, align 8
  %arrayidx8 = getelementptr inbounds float* %tmp7, i64 %idxprom6
  store float %tmp4, float* %arrayidx8
  %tmp9 = load void (float, float)** %f2.addr, align 8
  call void %tmp9(float 2.500000e+00, float 3.500000e+00)
  ret i32 0
}

define void @f1(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %cmp = fcmp une double %tmp, 3.000000e+00
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
  %tmp = load float* %f1.addr, align 4
  %cmp = fcmp une float %tmp, 2.500000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load float* %f2.addr, align 4
  %cmp2 = fcmp une float %tmp1, 3.500000e+00
  br i1 %cmp2, label %if.then, label %if.end

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
  %tmp = load float* %f.addr, align 4
  %cmp = fcmp une float %tmp, 6.000000e+00
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
  %tmp = bitcast [3 x float]* %f to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x float]* @main.f to i8*), i64 12, i32 4, i1 false)
  %arraydecay = getelementptr inbounds [3 x float]* %f, i32 0, i32 0
  %call = call i32 @t1(float* %arraydecay, i32 0, void (double)* @f1, void (float, float)* @f2)
  %arraydecay1 = getelementptr inbounds [3 x float]* %f, i32 0, i32 0
  %call2 = call i32 @t2(float* %arraydecay1, i32 1, void (double)* @f1, void (float, float)* @f2, void (float)* @f3)
  %arrayidx = getelementptr inbounds [3 x float]* %f, i32 0, i64 0
  %tmp3 = load float* %arrayidx, align 4
  %cmp = fcmp une float %tmp3, 3.000000e+00
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %arrayidx4 = getelementptr inbounds [3 x float]* %f, i32 0, i64 1
  %tmp5 = load float* %arrayidx4, align 4
  %cmp6 = fcmp une float %tmp5, 4.000000e+00
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind
