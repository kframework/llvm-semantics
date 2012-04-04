; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921013-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal unnamed_addr constant [4 x float] [float 5.000000e+00, float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], align 16
@main.b = internal unnamed_addr constant [4 x float] [float 2.000000e+00, float 4.000000e+00, float 3.000000e+00, float 0.000000e+00], align 16

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

define void @f(i32* %d, float* %x, float* %y, i32 %n) nounwind uwtable {
entry:
  %d.addr = alloca i32*, align 8
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  %n.addr = alloca i32, align 4
  store i32* %d, i32** %d.addr, align 8
  store float* %x, float** %x.addr, align 8
  store float* %y, float** %y.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp1 = load float** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds float* %tmp1, i32 1
  store float* %incdec.ptr, float** %x.addr, align 8
  %tmp2 = load float* %tmp1
  %tmp3 = load float** %y.addr, align 8
  %incdec.ptr4 = getelementptr inbounds float* %tmp3, i32 1
  store float* %incdec.ptr4, float** %y.addr, align 8
  %tmp5 = load float* %tmp3
  %cmp = fcmp oeq float %tmp2, %tmp5
  %conv = zext i1 %cmp to i32
  %tmp6 = load i32** %d.addr, align 8
  %incdec.ptr7 = getelementptr inbounds i32* %tmp6, i32 1
  store i32* %incdec.ptr7, i32** %d.addr, align 8
  store i32 %conv, i32* %tmp6
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca [4 x i32], align 16
  %a = alloca [4 x float], align 16
  %b = alloca [4 x float], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = bitcast [4 x float]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x float]* @main.a to i8*), i64 16, i32 16, i1 false)
  %tmp2 = bitcast [4 x float]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([4 x float]* @main.b to i8*), i64 16, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [4 x i32]* %r, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [4 x float]* %a, i32 0, i32 0
  %arraydecay5 = getelementptr inbounds [4 x float]* %b, i32 0, i32 0
  call void (...)* bitcast (void (i32*, float*, float*, i32)* @f to void (...)*)(i32* %arraydecay, float* %arraydecay4, float* %arraydecay5, i32 4)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp6 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp6, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [4 x float]* %a, i32 0, i64 %idxprom
  %tmp8 = load float* %arrayidx, align 4
  %tmp9 = load i32* %i, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %arrayidx11 = getelementptr inbounds [4 x float]* %b, i32 0, i64 %idxprom10
  %tmp12 = load float* %arrayidx11, align 4
  %cmp13 = fcmp oeq float %tmp8, %tmp12
  %conv = zext i1 %cmp13 to i32
  %tmp14 = load i32* %i, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %arrayidx16 = getelementptr inbounds [4 x i32]* %r, i32 0, i64 %idxprom15
  %tmp17 = load i32* %arrayidx16, align 4
  %cmp18 = icmp ne i32 %conv, %tmp17
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp20 = load i32* %i, align 4
  %inc = add nsw i32 %tmp20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
